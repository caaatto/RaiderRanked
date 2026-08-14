-- RaiderRanked: PvPScoreLookup.lua
-- Two-tier PvP score acquisition: addon messaging (primary) + inspect (fallback).
-- Takes the highest CR across all rated PvP brackets as the player's PvP score.

local ADDON_NAME, RR = ...

local ADDON_PREFIX    = "RRPvP"
local CACHE_TTL       = 600    -- 10 minutes
local INSPECT_INTERVAL = 1.2   -- seconds between inspect requests
local INSPECT_TIMEOUT  = 3     -- seconds to wait for INSPECT_HONOR_UPDATE
local BROADCAST_INTERVAL = 60  -- seconds between periodic broadcasts

-- ── Cache ──────────────────────────────────────────────────────────────────────
-- pvpCache[playerName-realmName] = { brackets = {}, maxCR = number, timestamp = number }
-- brackets = { ["2v2"] = cr, ["3v3"] = cr, ["Solo Shuffle"] = cr, ["Blitz BG"] = cr, ["RBG"] = cr }

RR.pvpCache = {}

local function CacheKey(unit)
    local name, realm = UnitFullName(unit)
    if not name then return nil end
    realm = realm and realm ~= "" and realm or GetNormalizedRealmName() or ""
    return name .. "-" .. realm
end

local function CacheKeyFromName(fullName)
    -- fullName might be "Name-Realm" or just "Name"
    if not fullName then return nil end
    if not fullName:find("-") then
        fullName = fullName .. "-" .. (GetNormalizedRealmName() or "")
    end
    return fullName
end

local function IsCacheFresh(key)
    local entry = RR.pvpCache[key]
    return entry and (GetTime() - entry.timestamp) < CACHE_TTL
end

local function SetCache(key, brackets, maxCR)
    RR.pvpCache[key] = {
        brackets  = brackets,
        maxCR     = maxCR,
        timestamp = GetTime(),
    }
end

-- ── Own player scores ──────────────────────────────────────────────────────────

--- Returns all bracket CRs and the max CR for the local player.
---@return table brackets, number maxCR
function RR:GetOwnPvPScores()
    local brackets = {}
    local maxCR = 0

    for _, b in ipairs(self.PVP_BRACKETS) do
        local cr = 0
        if GetPersonalRatedInfo then
            local rating = GetPersonalRatedInfo(b.index)
            cr = rating or 0
        end
        brackets[b.name] = cr
        if cr > maxCR then maxCR = cr end
    end

    -- RBG uses its own API.
    local rbgCR = 0
    if GetPersonalRatedInfo then
        local rating = GetPersonalRatedInfo(3)
        rbgCR = rating or 0
    end
    brackets[self.PVP_RBG_NAME] = rbgCR
    if rbgCR > maxCR then maxCR = rbgCR end

    -- Cache own scores too.
    local key = CacheKey("player")
    if key then SetCache(key, brackets, maxCR) end

    return brackets, maxCR
end

-- ── Addon messaging ────────────────────────────────────────────────────────────
-- Format: "2v2:1850,3v3:2100,Solo Shuffle:1950,Blitz BG:1400,RBG:1600"

local function EncodePayload(brackets)
    local parts = {}
    for name, cr in pairs(brackets) do
        table.insert(parts, name .. ":" .. cr)
    end
    return table.concat(parts, ",")
end

local function DecodePayload(payload)
    local brackets = {}
    local maxCR = 0
    for name, cr in payload:gmatch("([^:,]+):(%d+)") do
        local val = tonumber(cr) or 0
        brackets[name] = val
        if val > maxCR then maxCR = val end
    end
    return brackets, maxCR
end

-- Category constants; fall back to their numeric values if the globals ever go.
local CATEGORY_HOME     = LE_PARTY_CATEGORY_HOME     or 1
local CATEGORY_INSTANCE = LE_PARTY_CATEGORY_INSTANCE or 2

--- Resolves the addon-message channel for the group we are actually in.
---
--- IsInGroup()/IsInRaid() without a category argument check BOTH the home and
--- the instance group, so inside a scenario, delve, LFR or battleground they
--- return true while no home party exists.  Sending "PARTY"/"RAID" there throws
--- ERR_NOT_IN_GROUP ("You are not in a party") - see issue #15.  Instanced
--- groups must use "INSTANCE_CHAT", and it is checked first because a home
--- party that zones into an instance is in both categories at once.
---@return string|nil channel  nil when the player is not grouped at all
local function GroupChannel()
    if IsInGroup(CATEGORY_INSTANCE) then
        return "INSTANCE_CHAT"
    elseif IsInRaid(CATEGORY_HOME) then
        return "RAID"
    elseif IsInGroup(CATEGORY_HOME) then
        return "PARTY"
    end
    return nil
end
RR.GetGroupChannel = GroupChannel

function RR:BroadcastPvPScores()
    local channel = GroupChannel()
    if not channel then return end

    local brackets = self:GetOwnPvPScores()
    C_ChatInfo.SendAddonMessage(ADDON_PREFIX, EncodePayload(brackets), channel)
end

--- Dumps the raw party categories and the resolved channel, then fires one
--- broadcast so a bad channel surfaces as a chat error straight away.
--- The interesting case is home=false / instance=true - that is exactly where
--- the old "PARTY"/"RAID" code produced ERR_NOT_IN_GROUP.
function RR:DebugGroupChannel()
    local zone, instanceType = GetInstanceInfo()
    local channel = GroupChannel()

    print("|cff00ccffRaiderRanked|r group channel debug")
    print(string.format("  zone:     %s (instanceType=%s)",
        tostring(zone), tostring(instanceType)))
    print(string.format("  home:     inGroup=%s  inRaid=%s",
        tostring(IsInGroup(CATEGORY_HOME)),     tostring(IsInRaid(CATEGORY_HOME))))
    print(string.format("  instance: inGroup=%s  inRaid=%s",
        tostring(IsInGroup(CATEGORY_INSTANCE)), tostring(IsInRaid(CATEGORY_INSTANCE))))
    print(string.format("  no-category: inGroup=%s  inRaid=%s  |cff888888(what the old code used)|r",
        tostring(IsInGroup()), tostring(IsInRaid())))
    print(string.format("  resolved channel: |cffffff00%s|r", tostring(channel)))

    if channel then
        self:BroadcastPvPScores()
        print("  broadcast sent. No red error above means the channel is valid.")
    else
        print("  not grouped, nothing sent.")
    end
end

-- ── Inspect queue ──────────────────────────────────────────────────────────────

local inspectQueue = {}       -- FIFO of unit tokens
local inspectBusy  = false    -- true while waiting for INSPECT_HONOR_UPDATE
local inspectUnit  = nil      -- currently inspecting
local inspectTimer = nil      -- timeout timer handle
local inspectTicker = nil     -- C_Timer.NewTicker for processing queue

local function ProcessNextInspect()
    if inspectBusy then return end
    if #inspectQueue == 0 then return end

    local unit = table.remove(inspectQueue, 1)

    -- Skip if unit no longer valid or already cached.
    if not UnitExists(unit) or not UnitIsPlayer(unit) or not UnitIsConnected(unit) then
        return
    end
    local key = CacheKey(unit)
    if key and IsCacheFresh(key) then return end

    -- Check range - CanInspect returns true if we can inspect the unit.
    if not CanInspect(unit) then return end

    inspectBusy = true
    inspectUnit = unit

    NotifyInspect(unit)
    if RequestInspectHonorData then
        RequestInspectHonorData()
    end

    -- Timeout: if event doesn't fire, move on.
    inspectTimer = C_Timer.After(INSPECT_TIMEOUT, function()
        if inspectBusy then
            inspectBusy = false
            inspectUnit = nil
            ClearInspectPlayer()
        end
    end)
end

local function OnInspectHonorUpdate()
    if not inspectBusy or not inspectUnit then return end

    local brackets = {}
    local maxCR = 0

    -- Arena brackets.
    if GetInspectArenaData then
        for _, b in ipairs(RR.PVP_BRACKETS) do
            local cr = 0
            local rating = GetInspectArenaData(b.index)
            cr = rating or 0
            brackets[b.name] = cr
            if cr > maxCR then maxCR = cr end
        end
    end

    -- RBG.
    if GetInspectRatedBGData then
        local rating = GetInspectRatedBGData()
        local cr = rating or 0
        brackets[RR.PVP_RBG_NAME] = cr
        if cr > maxCR then maxCR = cr end
    end

    local key = CacheKey(inspectUnit)
    if key then
        SetCache(key, brackets, maxCR)
    end

    ClearInspectPlayer()
    inspectBusy = false
    inspectUnit = nil
end

--- Enqueue a unit for PvP inspect (if not already cached).
function RR:EnqueuePvPInspect(unit)
    if not unit or not UnitExists(unit) or not UnitIsPlayer(unit) then return end
    if UnitIsUnit(unit, "player") then return end  -- own player never needs inspect

    local key = CacheKey(unit)
    if key and IsCacheFresh(key) then return end

    -- Don't double-queue.
    for _, queued in ipairs(inspectQueue) do
        if UnitIsUnit(queued, unit) then return end
    end

    table.insert(inspectQueue, unit)
end

-- ── Unified lookup ─────────────────────────────────────────────────────────────

--- Returns the highest CR across all PvP brackets for a unit, or nil.
--- For the local player, reads directly. For others, checks cache (addon comms
--- or inspect). If not cached, enqueues an inspect and returns nil.
---@param unit string
---@return number|nil maxCR
function RR:GetPvPScoreForUnit(unit)
    if UnitIsUnit(unit, "player") then
        local _, maxCR = self:GetOwnPvPScores()
        return maxCR > 0 and maxCR or nil
    end

    local key = CacheKey(unit)
    if key and IsCacheFresh(key) then
        local entry = self.pvpCache[key]
        return entry.maxCR > 0 and entry.maxCR or nil
    end

    -- Not cached - enqueue inspect as fallback.
    self:EnqueuePvPInspect(unit)
    return nil
end

--- Returns the PvP rank and max CR for a unit.
---@param unit string
---@return table rank, number cr
function RR:GetPvPRankForUnit(unit)
    local cr = self:GetPvPScoreForUnit(unit)
    return self:GetPvPRankForCR(cr), cr or 0
end

--- Returns the cached bracket breakdown for a unit, or nil.
---@param unit string
---@return table|nil brackets  { ["2v2"]=cr, ["3v3"]=cr, ... }
function RR:GetPvPBracketsForUnit(unit)
    if UnitIsUnit(unit, "player") then
        local brackets = self:GetOwnPvPScores()
        return brackets
    end
    local key = CacheKey(unit)
    if key and RR.pvpCache[key] then
        return RR.pvpCache[key].brackets
    end
    return nil
end

-- ── Refresh own PvP rank ───────────────────────────────────────────────────────

function RR:RefreshPlayerPvPRank()
    local _, maxCR = self:GetOwnPvPScores()
    local newRank = self:GetPvPRankForCR(maxCR)

    local charRanks = self:GetCharRanks()

    local oldRank = self.playerPvPRank
    if not oldRank and charRanks and charRanks.lastPvPRankId then
        oldRank = self.PVP_RANK_BY_ID[charRanks.lastPvPRankId]
    end

    self.playerPvPRank = newRank
    self.playerPvPScore = maxCR

    if charRanks then
        charRanks.lastPvPRankId = newRank.id
    end

    if self.UpdatePvPRankFrame then
        self:UpdatePvPRankFrame()
    end

    if self.UpdatePvPAura then
        self:UpdatePvPAura()
    end
end

-- ── Event frame ────────────────────────────────────────────────────────────────

local pvpFrame = CreateFrame("Frame")
pvpFrame:RegisterEvent("PLAYER_LOGIN")
pvpFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
pvpFrame:RegisterEvent("GROUP_ROSTER_UPDATE")
pvpFrame:RegisterEvent("CHAT_MSG_ADDON")
pvpFrame:RegisterEvent("INSPECT_HONOR_UPDATE")
pvpFrame:RegisterEvent("PVP_RATED_STATS_UPDATE")

pvpFrame:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_LOGIN" then
        C_ChatInfo.RegisterAddonMessagePrefix(ADDON_PREFIX)
        -- Start inspect queue ticker.
        if not inspectTicker then
            inspectTicker = C_Timer.NewTicker(INSPECT_INTERVAL, ProcessNextInspect)
        end
        -- Initial own score fetch.
        C_Timer.After(3, function() RR:RefreshPlayerPvPRank() end)

    elseif event == "PLAYER_ENTERING_WORLD" then
        C_Timer.After(2, function()
            RR:RefreshPlayerPvPRank()
            RR:BroadcastPvPScores()
        end)

    elseif event == "GROUP_ROSTER_UPDATE" then
        RR:BroadcastPvPScores()
        -- Enqueue inspects for group members not yet cached.
        if IsInRaid() then
            for i = 1, GetNumGroupMembers() do
                RR:EnqueuePvPInspect("raid" .. i)
            end
        elseif IsInGroup() then
            for i = 1, GetNumGroupMembers() - 1 do
                RR:EnqueuePvPInspect("party" .. i)
            end
        end

    elseif event == "CHAT_MSG_ADDON" then
        local prefix, payload, _, sender = ...
        if prefix ~= ADDON_PREFIX then return end
        local key = CacheKeyFromName(sender)
        if not key then return end
        local brackets, maxCR = DecodePayload(payload)
        SetCache(key, brackets, maxCR)

    elseif event == "INSPECT_HONOR_UPDATE" then
        OnInspectHonorUpdate()

    elseif event == "PVP_RATED_STATS_UPDATE" then
        RR:RefreshPlayerPvPRank()
    end
end)

-- Periodic broadcast while in a group (BroadcastPvPScores no-ops when solo).
C_Timer.NewTicker(BROADCAST_INTERVAL, function()
    RR:BroadcastPvPScores()
end)
