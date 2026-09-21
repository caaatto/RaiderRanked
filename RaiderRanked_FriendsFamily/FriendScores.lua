-- RaiderRanked Friends & Family: FriendScores.lua
-- The same exchange as the guild board, aimed at a friends list instead.
--
-- Friends are not a channel. A guild broadcast reaches everyone at once, but
-- there is no "FRIENDS" to send to, so each friend is asked individually:
-- character friends over a whispered addon message, Battle.net friends over
-- BNSendGameData, which reaches a game account rather than a name.
--
-- That difference is why this is a separate file rather than another branch
-- inside GuildScores: the protocol is identical, the addressing is not.

local ADDON_NAME, FF = ...

local RR = _G.RaiderRanked

local ADDON_PREFIX = "RRFriend"
local REQUEST      = "?"

-- One message per friend, so the list is walked slowly. Blizzard throttles
-- addon messages, and a hundred whispers in one frame is how an addon gets
-- itself muted for the rest of the session.
local SEND_INTERVAL = 0.4

local CACHE_DAYS = 30

-- ── Storage ────────────────────────────────────────────────────────────────

local function Store()
    if not RaiderRankedFriendsDB then return nil end
    RaiderRankedFriendsDB.friends = RaiderRankedFriendsDB.friends or {}
    return RaiderRankedFriendsDB.friends
end

local function Remember(name, score, class)
    local store = Store()
    local key   = FF.FullName(name)
    if not (store and key and score and score > 0) then return end
    store[key] = { score = score, class = class, ts = time() }
end

local function PruneStore()
    local store = Store()
    if not store then return end
    local cutoff = time() - CACHE_DAYS * 24 * 60 * 60
    for key, entry in pairs(store) do
        if type(entry) ~= "table" or (entry.ts or 0) < cutoff then
            store[key] = nil
        end
    end
end

-- ── Who the friends are ────────────────────────────────────────────────────

local function Secret(value)
    return issecretvalue and issecretvalue(value)
end

--- Turns one Battle.net game account into "Name-Realm".
---
--- Only retail WoW accounts resolve. A Classic character would produce a name
--- that no retail database can answer for, which is worse than no name at all.
local function NameFromGameAccount(info)
    if not info or Secret(info) then return nil end
    if Secret(info.characterName) or Secret(info.realmName) then return nil end
    if not info.characterName then return nil end
    if info.clientProgram and info.clientProgram ~= BNET_CLIENT_WOW then return nil end
    if info.wowProjectID and info.wowProjectID ~= WOW_PROJECT_MAINLINE then return nil end

    local name = info.characterName
    if info.realmName then
        name = name .. "-" .. info.realmName:gsub("%s+", "")
    end
    return name, info.characterLevel, info.gameAccountID
end

--- Everyone on either friends list, online or not.
---
--- Offline matters: a character friend's name is known whether they are logged
--- in or not, so their score can still be looked up even though they cannot be
--- asked. A Battle.net friend has no character attached while offline, which
--- is a limit rather than an oversight - the same reason their tooltip is
--- blank in that state.
---@return table friends  { {name, online, whisper?, bnetAccount?} }
local function FriendList()
    local out = {}

    for i = 1, (C_FriendList and C_FriendList.GetNumFriends() or 0) do
        local info = C_FriendList.GetFriendInfoByIndex(i)
        if info and info.name and not Secret(info.name) then
            table.insert(out, {
                name    = FF.FullName(info.name),
                online  = info.connected and true or false,
                whisper = info.connected and info.name or nil,
            })
        end
    end

    -- A Battle.net friend can have several game accounts logged recently, and
    -- only one of them is the character worth reporting. RaiderIO picks the
    -- max-level one for the same reason: a level 20 alt would answer for
    -- somebody whose main is the point of the comparison.
    for i = 1, (BNGetNumFriends and BNGetNumFriends() or 0) do
        local best, bestLevel, bestAccount
        local ok, count = pcall(C_BattleNet.GetFriendNumGameAccounts, i)
        for j = 1, (ok and count or 0) do
            local okInfo, info = pcall(C_BattleNet.GetFriendGameAccountInfo, i, j)
            if okInfo then
                local name, level, account = NameFromGameAccount(info)
                if name and (not bestLevel or (level or 0) > bestLevel) then
                    best, bestLevel, bestAccount = name, level or 0, account
                end
            end
        end
        if best then
            table.insert(out, { name = best, online = true, bnetAccount = bestAccount })
        end
    end

    return out
end

-- ── Messaging ──────────────────────────────────────────────────────────────

local function Send(target, payload)
    if target.bnetAccount then
        pcall(BNSendGameData, target.bnetAccount, ADDON_PREFIX, payload)
    elseif target.whisper then
        pcall(C_ChatInfo.SendAddonMessage, ADDON_PREFIX, payload, "WHISPER", target.whisper)
    end
end

local function OwnPayload()
    local score = RR.GetScoreForUnit("player")
    if not score or score <= 0 then return nil end
    local _, class = UnitClass("player")
    return string.format("!%d:%s", math.floor(score), class or "")
end

--- Walks the friends list one message at a time.
---
--- The request carries our own score, so a friend also running this learns
--- where we stand from the same message that asks about them. One round trip
--- instead of two.
function FF.PollFriends()
    if not FF.Sharing() then return end

    local payload = OwnPayload() or REQUEST
    local targets = {}
    for _, t in ipairs(FriendList()) do
        if t.online then table.insert(targets, t) end
    end

    local i = 0
    local function step()
        i = i + 1
        local t = targets[i]
        if not t then return end
        Send(t, payload)
        C_Timer.After(SEND_INTERVAL, step)
    end
    step()
end

-- ── The board ──────────────────────────────────────────────────────────────

--- Friends with a score, highest first.
---
--- Unlike the guild board there is no roster to measure against: the friends
--- list is only who you added, so "3 of 12" would count something the player
--- never asked about. The count is simply how many could be answered for.
---@return table entries, table coverage
function FF.GetFriendBoard()
    local store    = Store() or {}
    local entries  = {}
    local coverage = { total = 0, scored = 0, live = 0, cached = 0, raiderio = 0 }

    local friends = FriendList()
    local online  = {}
    for _, t in ipairs(friends) do
        if t.name then online[t.name] = t.online end
    end

    local seen = {}
    local function Add(key, score, source, class, ts)
        if not key or seen[key] or not score or score <= 0 then return end
        seen[key] = true
        coverage.scored  = coverage.scored + 1
        coverage[source] = (coverage[source] or 0) + 1
        table.insert(entries, {
            name   = key,
            class  = class,
            score  = score,
            rank   = RR.GetRankForScore(score),
            online = online[key] or false,
            source = source,
            ts     = ts,
        })
    end

    -- What they told us themselves outranks anything looked up.
    for key, entry in pairs(store) do
        coverage.total = coverage.total + 1
        Add(key, entry.score, online[key] and "live" or "cached", entry.class, entry.ts)
    end

    -- Everyone else, from RaiderIO if it is installed. This is the same source
    -- that fills in the Battle.net friends tooltip, so a score visible there
    -- should be visible here too - including for friends who are offline,
    -- whose name is known even while they cannot be asked.
    if RaiderIO and RaiderIO.GetProfile then
        for _, t in ipairs(friends) do
            if t.name and not seen[t.name] then
                coverage.total = coverage.total + 1
                local ok, profile = pcall(RaiderIO.GetProfile, t.name)
                if ok then
                    Add(t.name, RR.ScoreFromRaiderIOProfile(profile), "raiderio")
                end
            end
        end
    end

    table.sort(entries, function(a, b) return a.score > b.score end)
    return entries, coverage
end

-- ── Event frame ────────────────────────────────────────────────────────────

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("CHAT_MSG_ADDON")
frame:RegisterEvent("BN_CHAT_MSG_ADDON")

frame:SetScript("OnEvent", function(_, event, ...)
    if event == "PLAYER_LOGIN" then
        C_ChatInfo.RegisterAddonMessagePrefix(ADDON_PREFIX)
        -- After the guild pass, so the two do not compete for the message
        -- budget in the same second.
        C_Timer.After(14, function()
            PruneStore()
            FF.PollFriends()
        end)

    elseif event == "CHAT_MSG_ADDON" or event == "BN_CHAT_MSG_ADDON" then
        local prefix, payload, _, sender = ...
        if prefix ~= ADDON_PREFIX or Secret(payload) then return end

        -- A Battle.net message names its sender by game account, not by
        -- character, so it has to be resolved back before it can be filed.
        local name = sender
        if event == "BN_CHAT_MSG_ADDON" then
            local ok, info = pcall(C_BattleNet.GetGameAccountInfoByID, sender)
            name = ok and NameFromGameAccount(info) or nil
        end

        local score, class = payload:match("^!(%d+):(%a*)$")
        if score and name then
            Remember(name, tonumber(score), class ~= "" and class or nil)
        end

        -- Anything arriving here is also an implicit request: whoever sent it
        -- is running this too and wants to know where we stand.
        if (score or payload == REQUEST) and name and FF.Sharing() then
            local own = OwnPayload()
            if own then
                C_Timer.After(math.random() * 4, function()
                    pcall(C_ChatInfo.SendAddonMessage, ADDON_PREFIX, own, "WHISPER", name)
                end)
            end
        end
    end
end)
