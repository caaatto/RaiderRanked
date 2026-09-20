-- RaiderRanked Friends & Family: GuildScores.lua
-- M+ scores for guild members, from three sources in order of how first-hand
-- they are:
--
--   1. Addon messages   guildmates running this module answer with their own
--                       score, read from the same Blizzard API this character
--                       uses for itself. Exact, but only while they are online.
--   2. The saved cache  what was heard earlier, with the date it was heard, so
--                       a board does not reset to empty on every login.
--   3. RaiderIO         fills in everyone else, if the addon happens to be
--                       installed. Never required: without it the board is
--                       thinner, not broken.
--
-- There is no fourth source. Blizzard exposes no way to read another player's
-- M+ rating without a unit reference, and the guild roster carries names,
-- levels and classes but never scores. A guildmate who is offline, has never
-- run this module and is unknown to RaiderIO cannot be shown at all.

local ADDON_NAME, FF = ...

-- The core's published surface. Nothing here reaches past it.
local RR = _G.RaiderRanked

local ADDON_PREFIX = "RRGuild"
local REQUEST      = "?"

-- How long a heard score stays worth showing. Long, because the point of the
-- cache is to carry a board across days; the date is shown with it, so a stale
-- figure is never mistaken for a current one.
local CACHE_DAYS   = 30

-- Own score is re-sent at most this often, however often it changes in
-- between. A key finishing does not have to reach the guild inside the second.
local BROADCAST_THROTTLE = 120

-- A request reaches every online guildmate at once and they would all answer
-- in the same instant. Blizzard throttles addon messages, and a large guild
-- answering as one spends that budget on nothing, so each answer waits a
-- random moment first.
local ANSWER_STAGGER_MAX = 8

local lastBroadcast = 0

-- ── Storage ────────────────────────────────────────────────────────────────

--- Scores are kept per guild, so a character in a second guild does not
--- inherit the first one's board. Guildless characters get no store at all.
---@return table|nil store
local function GuildStore()
    if not IsInGuild() then return nil end
    local guild = GetGuildInfo("player")
    if not (guild and RaiderRankedFriendsDB) then return nil end

    RaiderRankedFriendsDB.guilds = RaiderRankedFriendsDB.guilds or {}
    RaiderRankedFriendsDB.guilds[guild] = RaiderRankedFriendsDB.guilds[guild] or {}
    return RaiderRankedFriendsDB.guilds[guild]
end

--- Normalises a name to "Name-Realm". Addon messages from the same realm
--- arrive without one, and the roster spells those the same way.
local function FullName(name)
    if not name or name == "" then return nil end
    if not name:find("-", nil, true) then
        name = name .. "-" .. (GetNormalizedRealmName() or "")
    end
    return name
end
FF.FullName = FullName

local function Remember(name, score, class)
    local store = GuildStore()
    local key   = FullName(name)
    if not (store and key and score and score > 0) then return end
    store[key] = { score = score, class = class, ts = time() }
end

--- Drops entries nobody has heard from in a month. Called from the login pass,
--- which is the only moment the store is walked in full anyway.
local function PruneStore()
    local store = GuildStore()
    if not store then return end
    local cutoff = time() - CACHE_DAYS * 24 * 60 * 60
    for key, entry in pairs(store) do
        if type(entry) ~= "table" or (entry.ts or 0) < cutoff then
            store[key] = nil
        end
    end
end

-- ── Messaging ──────────────────────────────────────────────────────────────
-- "?" asks, "!<score>:<CLASS>" answers. Short on purpose: an addon message is
-- capped at 255 bytes, and a guild full of them is noise nobody sees but
-- everybody pays for.

function FF.Sharing()
    return RaiderRankedFriendsDB and RaiderRankedFriendsDB.share ~= false
end

--- Asks the server for the roster. GetGuildRosterInfo reads a client-side copy
--- that does not exist until this has been called at least once, so a board
--- built before it reports an empty guild rather than no data.
local function RequestRoster()
    if not IsInGuild() then return end
    if C_GuildInfo and C_GuildInfo.GuildRoster then
        C_GuildInfo.GuildRoster()
    elseif GuildRoster then
        GuildRoster()
    end
end

--- Sends this character's score to the guild.
---
--- Silent while sharing is off, which is the point of that setting: a
--- character that does not contribute does not appear on anyone else's board
--- either, rather than reading along while staying invisible.
---@param force boolean|nil  skip the throttle, for an answer to a request
function FF.BroadcastScore(force)
    if not (IsInGuild() and FF.Sharing()) then return end

    local now = GetTime()
    if not force and (now - lastBroadcast) < BROADCAST_THROTTLE then return end

    local score = RR.GetScoreForUnit("player")
    if not score or score <= 0 then return end

    local _, class = UnitClass("player")
    lastBroadcast = now
    C_ChatInfo.SendAddonMessage(ADDON_PREFIX,
        string.format("!%d:%s", math.floor(score), class or ""), "GUILD")
end

--- Asks the guild to report in. Sent once per login; after that scores arrive
--- on their own as people finish keys.
function FF.RequestScores()
    if not (IsInGuild() and FF.Sharing()) then return end
    C_ChatInfo.SendAddonMessage(ADDON_PREFIX, REQUEST, "GUILD")
end

-- ── The board ──────────────────────────────────────────────────────────────

--- Everyone on the guild roster who has a score, highest first.
---
--- Members without one are left out rather than listed as zero: zero means "no
--- runs recorded", which is not a result and would sort as if it were.
---@return table entries, table coverage  {total, scored, live, cached, raiderio}
function FF.GetBoard()
    local entries  = {}
    local coverage = { total = 0, scored = 0, live = 0, cached = 0, raiderio = 0 }
    if not IsInGuild() then return entries, coverage end

    RequestRoster()
    local store = GuildStore() or {}
    local me    = FullName(UnitName("player"))

    for i = 1, (GetNumGuildMembers() or 0) do
        local name, _, _, level, _, _, _, _, online, _, class = GetGuildRosterInfo(i)
        local key = FullName(name)

        -- Low-level alts cannot have a score, so their absence is not a gap,
        -- and counting them would make the coverage line read worse than it is.
        if key and (not level or level == 0 or level >= RR.MIN_SCORED_LEVEL) then
            coverage.total = coverage.total + 1

            local entry  = store[key]
            local score  = entry and entry.score
            local source = entry and "cached" or nil

            if key == me then
                -- Own score is first-hand whatever the store happens to say.
                score  = RR.GetScoreForUnit("player") or score
                source = "live"
            elseif score and online then
                source = "live"
            end

            if not score and RaiderIO and RaiderIO.GetProfile then
                local ok, profile = pcall(RaiderIO.GetProfile, key)
                if ok then
                    local s = RR.ScoreFromRaiderIOProfile(profile)
                    if s then score, source = s, "raiderio" end
                end
            end

            if score and score > 0 then
                coverage.scored  = coverage.scored + 1
                coverage[source] = (coverage[source] or 0) + 1
                table.insert(entries, {
                    name   = key,
                    class  = (entry and entry.class) or class,
                    score  = score,
                    rank   = RR.GetRankForScore(score),
                    online = online and true or false,
                    source = source,
                    ts     = entry and entry.ts,
                    isSelf = key == me,
                })
            end
        end
    end

    table.sort(entries, function(a, b) return a.score > b.score end)
    return entries, coverage
end

--- Prints the board to chat.
---
--- The coverage line is not decoration. A board that silently shows seven of
--- forty-three reads as broken, and the first report back would be "my main is
--- missing" rather than the limit that actually causes it.
function FF.PrintBoard(limit)
    if not IsInGuild() then
        print("|cff00ccffRaiderRanked|r You are not in a guild.")
        return
    end

    local entries, coverage = FF.GetBoard()
    print(string.format("|cff00ccffRaiderRanked|r %s - %d of %d members with a score",
        GetGuildInfo("player") or "Guild", coverage.scored, coverage.total))

    for i, e in ipairs(entries) do
        if limit and i > limit then
            print(string.format("  |cff888888and %d more|r", #entries - limit))
            break
        end

        local note = ""
        if e.source == "cached" and e.ts then
            note = string.format(" |cff888888(%d days ago)|r",
                math.floor((time() - e.ts) / 86400))
        elseif e.source == "raiderio" then
            note = " |cff888888(RaiderIO)|r"
        end

        print(string.format("  %2d. %-22s %s %d%s", i,
            Ambiguate(e.name, "guild"),
            RR.GetRankDisplayName(e.rank, e.score, true), e.score, note))
    end

    if not (RaiderIO and RaiderIO.GetProfile) then
        print("  |cff888888Only guildmates running this module report in. "
            .. "With RaiderIO installed the rest are filled in too.|r")
    end
end

-- ── Event frame ────────────────────────────────────────────────────────────

local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("PLAYER_GUILD_UPDATE")
frame:RegisterEvent("CHAT_MSG_ADDON")

frame:SetScript("OnEvent", function(_, event, ...)
    if event == "ADDON_LOADED" then
        if ... ~= ADDON_NAME then return end
        RaiderRankedFriendsDB = RaiderRankedFriendsDB or {}
        if RaiderRankedFriendsDB.share == nil then
            RaiderRankedFriendsDB.share = true
        end

    elseif event == "PLAYER_LOGIN" then
        C_ChatInfo.RegisterAddonMessagePrefix(ADDON_PREFIX)
        RequestRoster()
        -- Late enough that the roster and the score API have both answered.
        C_Timer.After(8, function()
            PruneStore()
            FF.RequestScores()
            FF.BroadcastScore(true)
        end)

    elseif event == "PLAYER_GUILD_UPDATE" then
        -- Joining a guild mid-session starts an empty store, which stays empty
        -- until somebody is asked.
        C_Timer.After(5, function()
            FF.RequestScores()
            FF.BroadcastScore(true)
        end)

    elseif event == "CHAT_MSG_ADDON" then
        local prefix, payload, channel, sender = ...
        if prefix ~= ADDON_PREFIX or channel ~= "GUILD" then return end

        if payload == REQUEST then
            -- Our own request comes back to us as well.
            if FullName(sender) == FullName(UnitName("player")) then return end
            C_Timer.After(math.random() * ANSWER_STAGGER_MAX, function()
                FF.BroadcastScore(true)
            end)
            return
        end

        local score, class = payload:match("^!(%d+):(%a*)$")
        if score then
            Remember(sender, tonumber(score), class ~= "" and class or nil)
        end
    end
end)
