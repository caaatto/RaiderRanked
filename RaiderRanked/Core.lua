-- RaiderRanked: Core.lua
-- Addon initialisation, saved variables, score lookup, slash commands.

local ADDON_NAME, RR = ...

-- ── Defaults ────────────────────────────────────────────────────────────────

-- Exposed on RR so UI.lua can read defaults for the Settings panel.
RR.DB_DEFAULTS = {
    thresholds    = nil,  -- populated from RR:GetDefaultThresholds() on first load
    showInTooltip = true,
    showFrame     = true,
    showWings     = true,
    showUnitWings = true,
    showMinimap   = true,
    minimap       = { hide = false, minimapPos = 225 },  -- LibDBIcon settings
    framePosition = { point = "CENTER", x = 0, y = -200 },
    lastRankId    = nil,  -- persisted so rank-ups are detected across sessions
    -- PvP
    pvpThresholds     = nil,
    showPvPFrame      = false,  -- opt-in via Settings
    showPvPInTooltip  = false,  -- opt-in via Settings
    showPvPAura       = false,  -- opt-in via Settings
    pvpFramePosition  = { point = "CENTER", x = 0, y = -300 },
    lastPvPRankId     = nil,
}

-- ── Addon frame / event registration ────────────────────────────────────────

local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("CHALLENGE_MODE_COMPLETED")  -- M+ key finished, score may update

frame:SetScript("OnEvent", function(self, event, ...)
    if event == "ADDON_LOADED" then
        local name = ...
        if name == ADDON_NAME then
            RR:OnAddonLoaded()
        end
    elseif event == "PLAYER_LOGIN" then
        RR:OnPlayerLogin()
    elseif event == "PLAYER_ENTERING_WORLD" then
        RR:OnEnteringWorld()
    elseif event == "CHALLENGE_MODE_COMPLETED" then
        -- Score isn't updated instantly — check at increasing intervals to catch
        -- the server update regardless of latency.
        C_Timer.After(3,  function() RR:RefreshPlayerRank() end)
        C_Timer.After(10, function() RR:RefreshPlayerRank() end)
        C_Timer.After(30, function() RR:RefreshPlayerRank() end)
    end
end)

-- ── Lifecycle ────────────────────────────────────────────────────────────────

function RR:OnAddonLoaded()
    if not RaiderRankedDB then
        RaiderRankedDB = CopyTable(RR.DB_DEFAULTS)
        RaiderRankedDB.thresholds = self:GetDefaultThresholds()
    end
    for k, v in pairs(RR.DB_DEFAULTS) do
        if RaiderRankedDB[k] == nil then
            RaiderRankedDB[k] = v
        end
    end
    -- Ensure minimap sub-table has all required keys.
    if type(RaiderRankedDB.minimap) ~= "table" then
        RaiderRankedDB.minimap = CopyTable(RR.DB_DEFAULTS.minimap)
    end
    -- Migrate old minimapAngle → LibDBIcon minimapPos (radians → degrees).
    if RaiderRankedDB.minimapAngle then
        RaiderRankedDB.minimap.minimapPos = math.deg(RaiderRankedDB.minimapAngle) % 360
        RaiderRankedDB.minimapAngle = nil
    end
    -- Migrate old showMinimap → LibDBIcon hide flag.
    if RaiderRankedDB.showMinimap == false then
        RaiderRankedDB.minimap.hide = true
    end
    if not RaiderRankedDB.thresholds then
        RaiderRankedDB.thresholds = self:GetDefaultThresholds()
    end

    -- Auto-update saved thresholds when code defaults change (addon update).
    -- Only overwrites values the user hasn't manually customised via /rr set.
    local defaults = self:GetDefaultThresholds()
    local saved    = RaiderRankedDB.thresholds
    local oldDefaults = RaiderRankedDB.thresholdDefaults or {}
    local changed = false
    for id, newDefault in pairs(defaults) do
        if newDefault ~= (oldDefaults[id] or 0) then
            -- Code default changed — update saved value unless user customised it.
            if not oldDefaults[id] or saved[id] == oldDefaults[id] then
                saved[id] = newDefault
                changed = true
            end
        end
    end
    RaiderRankedDB.thresholdDefaults = defaults
    if changed then
        print("|cff00ccffRaiderRanked|r Thresholds updated to new defaults.")
    end

    -- PvP thresholds.
    if not RaiderRankedDB.pvpThresholds then
        RaiderRankedDB.pvpThresholds = self:GetDefaultPvPThresholds()
    end

    self.db = RaiderRankedDB
    self:ApplyThresholds(self.db.thresholds)
    self:ApplyPvPThresholds(self.db.pvpThresholds)
    self:InitScoreHistory()
    self:RegisterSlashCommands()

    -- Settings panel must be registered during ADDON_LOADED (before UI is built).
    local ok, err = pcall(function() self:RegisterSettings() end)
    if not ok then
        print("|cffff0000RaiderRanked Settings error:|r " .. tostring(err))
    end
end

function RR:OnPlayerLogin()
    local ok, err = pcall(function() self:InitUI() end)
    if not ok then
        print("|cffff0000RaiderRanked InitUI error:|r " .. tostring(err))
    end
end

function RR:OnEnteringWorld()
    -- Small delay: score API may not be populated immediately on zone-in.
    C_Timer.After(2, function() RR:RefreshPlayerRank() end)
end

-- ── Score lookup ─────────────────────────────────────────────────────────────

--- Returns the M+ rating for a unit using the native Blizzard API.
--- Falls back to the RaiderIO addon if the native API returns nothing.
---@param unit string  WoW unit token ("player", "target", "mouseover", …)
---@return number|nil score
function RR:GetScoreForUnit(unit)
    -- Skip non-players (enemies, NPCs) and low-level players (below 90).
    if not UnitIsPlayer(unit) then return nil end
    local level = UnitLevel(unit)
    if level and level > 0 and level < 90 then return nil end

    -- 1. Native Blizzard API (no addon dependency).
    if C_PlayerInfo and C_PlayerInfo.GetPlayerMythicPlusRatingSummary then
        local ok, data = pcall(C_PlayerInfo.GetPlayerMythicPlusRatingSummary, unit)
        if ok and type(data) == "table" then
            local score = data.currentSeasonScore
            if type(score) == "number" and score > 0 then
                return score
            end
        end
    end

    -- 2. RaiderIO addon fallback.
    if RaiderIO and RaiderIO.GetProfile then
        local ok, profile = pcall(RaiderIO.GetProfile, unit)
        if ok and type(profile) == "table" then
            -- Field name varies across RaiderIO versions — try all known ones.
            if profile.mplusCurrent and type(profile.mplusCurrent.score) == "number" then
                return profile.mplusCurrent.score
            end
            if profile.mythicKeystoneProfile then
                local s = profile.mythicKeystoneProfile.currentSeasonScore
                if type(s) == "number" and s > 0 then return s end
            end
            if type(profile.currentScore) == "number" and profile.currentScore > 0 then
                return profile.currentScore
            end
        end
    end

    return nil
end

--- Returns the rank table for a unit.
---@param unit string
---@return table rank, number score
function RR:GetRankForUnit(unit)
    local score = self:GetScoreForUnit(unit)
    return self:GetRankForScore(score), score or 0
end

--- Refreshes the player's own rank and updates the rank frame.
--- Triggers a rank-up animation if the rank has improved since the last known rank.
--- The last known rank is persisted in SavedVariables so rank-ups survive reloads/relogs.
function RR:RefreshPlayerRank()
    local newRank, newScore = self:GetRankForUnit("player")
    if not newRank then return end

    -- Resolve previous rank: in-memory first, then SavedVariables, then nil.
    local oldRank = self.playerRank
    if not oldRank and self.db and self.db.lastRankId then
        oldRank = self.RANK_BY_ID[self.db.lastRankId]
    end

    self.playerRank  = newRank
    self.playerScore = newScore

    -- Persist so we can detect rank-ups after a relog.
    if self.db then
        self.db.lastRankId = newRank.id
    end

    if self.UpdateRankFrame then
        self:UpdateRankFrame()
    end

    -- Record score history snapshot.
    if self.RecordScoreSnapshot then
        self:RecordScoreSnapshot()
    end

    -- Animate when rank improves (skip on very first load where oldRank is nil).
    if oldRank and newRank.minScore > oldRank.minScore then
        if self.PlayRankUpAnimation then
            self:PlayRankUpAnimation(oldRank, newRank, newScore)
        end
    end
end

-- ── Debug ─────────────────────────────────────────────────────────────────────


function RR:DebugScore()
    local p = "|cff00ccffRaiderRanked Debug|r"
    print(p)

    -- Native API
    print("  [Blizzard] C_PlayerInfo.GetPlayerMythicPlusRatingSummary:")
    if C_PlayerInfo and C_PlayerInfo.GetPlayerMythicPlusRatingSummary then
        local ok, data = pcall(C_PlayerInfo.GetPlayerMythicPlusRatingSummary, "player")
        print("    pcall ok=" .. tostring(ok) .. "  type=" .. tostring(type(data)))
        if type(data) == "table" then
            for k, v in pairs(data) do
                print("    " .. tostring(k) .. " = " .. tostring(v))
            end
        end
    else
        print("    |cffff0000API not available|r")
    end

    -- RaiderIO
    print("  [RaiderIO] addon:")
    if RaiderIO and RaiderIO.GetProfile then
        local ok, profile = pcall(RaiderIO.GetProfile, "player")
        print("    pcall ok=" .. tostring(ok) .. "  type=" .. tostring(type(profile)))
        if type(profile) == "table" then
            if profile.mplusCurrent then
                print("    mplusCurrent.score=" .. tostring(profile.mplusCurrent.score))
            else
                print("    mplusCurrent=nil")
            end
        end
    else
        print("    |cffff0000not loaded|r")
    end

    print("  Current stored score: " .. tostring(self.playerScore))
    print("  Current rank: " .. tostring(self.playerRank and self:GetRankDisplayName(self.playerRank, self.playerScore)))
end

-- ── PvP debug ────────────────────────────────────────────────────────────────

function RR:DebugPvPScore()
    local p = "|cff00ccffRaiderRanked PvP Debug|r"
    print(p)

    local brackets, maxCR = self:GetOwnPvPScores()
    for _, b in ipairs(self.PVP_BRACKETS) do
        print(string.format("  %s: %d", b.name, brackets[b.name] or 0))
    end
    print(string.format("  %s: %d", self.PVP_RBG_NAME, brackets[self.PVP_RBG_NAME] or 0))
    print(string.format("  Max CR: %d", maxCR))

    local rank = self:GetPvPRankForCR(maxCR)
    print("  PvP Rank: " .. self:FormatPvPRankName(rank))

    -- Cache stats.
    local cacheCount = 0
    for _ in pairs(self.pvpCache) do cacheCount = cacheCount + 1 end
    print(string.format("  Cache entries: %d", cacheCount))
end

-- ── Slash commands ───────────────────────────────────────────────────────────

function RR:RegisterSlashCommands()
    SLASH_RAIDERRANKED1 = "/rr"
    SLASH_RAIDERRANKED2 = "/raiderranked"
    SlashCmdList["RAIDERRANKED"] = function(msg)
        RR:HandleSlashCommand(msg)
    end
end

function RR:HandleSlashCommand(msg)
    msg = strtrim(msg or ""):lower()

    if msg == "" or msg == "show" then
        self:ToggleRankFrame(true)

    elseif msg == "hide" then
        self:ToggleRankFrame(false)

    elseif msg == "tooltip" then
        self.db.showInTooltip = not self.db.showInTooltip
        print(string.format("|cff00ccffRaiderRanked|r Tooltip: %s",
            self.db.showInTooltip and "|cff00ff00ON|r" or "|cffff0000OFF|r"))

    elseif msg:match("^set %S+ %d+$") then
        local rankId, value = msg:match("^set (%S+) (%d+)$")
        rankId = rankId:upper()
        value  = tonumber(value)
        if self.RANK_BY_ID[rankId] then
            self.RANK_BY_ID[rankId].minScore = value
            self.db.thresholds[rankId]       = value
            table.sort(self.RANKS, function(a, b) return a.minScore > b.minScore end)
            print(string.format("|cff00ccffRaiderRanked|r Set %s threshold to %d.",
                self.RANK_BY_ID[rankId].name, value))
        else
            print("|cff00ccffRaiderRanked|r Unknown rank id: " .. rankId)
        end

    elseif msg:match("^anim%s*(.*)$") then
        -- /rr anim [FROM] TO  — e.g. "/rr anim bronze emerald"
        local args = msg:match("^anim%s*(.*)$")
        local parts = {}
        for w in args:gmatch("%S+") do table.insert(parts, w) end
        if #parts == 2 then
            self:TestAnimation(parts[1], parts[2])
        elseif #parts == 1 then
            self:TestAnimation(nil, parts[1])
        else
            print("|cff00ccffRaiderRanked|r Usage: /rr anim [fromRank] toRank")
            print("  e.g. /rr anim bronze emerald")
            print("  e.g. /rr anim challenger")
        end

    elseif msg == "wingsdbg" then
        self:DebugWings()

    elseif msg:match("^unitdbg") then
        local unit = msg:match("^unitdbg%s*(%S*)$") or "target"
        self:DebugUnitWings(unit == "" and "target" or unit)

    elseif msg:match("^wings%s+%d+$") then
        self:SetPortraitWingsSize(msg:match("^wings%s+(%d+)$"))

    elseif msg == "debug" then
        self:DebugScore()

    elseif msg == "test" then
        self:RunTests()

    elseif msg == "reset" then
        self.db.thresholds = self:GetDefaultThresholds()
        self:ApplyThresholds(self.db.thresholds)
        print("|cff00ccffRaiderRanked|r Thresholds reset to defaults.")

    elseif msg == "ranks" then
        print("|cff00ccffRaiderRanked|r Current M+ thresholds:")
        for _, rank in ipairs(self.RANKS) do
            print(string.format("  %s  %s: %d+",
                self:FormatRankName(rank), rank.id, rank.minScore))
        end

    elseif msg == "history" then
        self:ToggleHistoryGraph()

    elseif msg:match("^history%s+clear$") then
        if self.charDB then
            self.charDB.scoreHistory = {}
            print("|cff00ccffRaiderRanked|r Score history cleared.")
            if self.historyFrame and self.historyFrame:IsShown() then
                self:RefreshHistoryGraph()
            end
        end

    elseif msg == "pvp" then
        self:TogglePvPRankFrame()

    elseif msg == "pvpranks" then
        print("|cff00ccffRaiderRanked|r Current PvP thresholds:")
        for _, rank in ipairs(self.PVP_RANKS) do
            print(string.format("  %s  %s: %d+",
                self:FormatPvPRankName(rank), rank.id, rank.minCR))
        end

    elseif msg == "pvpdebug" then
        self:DebugPvPScore()

    elseif msg:match("^pvpaura%s+test%s+%S+$") then
        self:TestPvPAura(msg:match("^pvpaura%s+test%s+(%S+)$"))

    elseif msg == "pvpaura stop" then
        self:StopPvPAuraTest()

    elseif msg:match("^pvpaura%s+%d+$") then
        self:SetPvPAuraSize(msg:match("^pvpaura%s+(%d+)$"))

    else
        print("|cff00ccffRaiderRanked|r Commands:")
        print("  /rr             – toggle rank frame")
        print("  /rr tooltip     – toggle tooltip display")
        print("  /rr ranks       – list current thresholds")
        print("  /rr set <ID> <score>  – e.g. /rr set CHALLENGER 3500")
        print("  /rr reset       – restore default thresholds")
        print("  /rr anim [from] to – preview rank-up animation")
        print("  /rr wings <size>   – resize portrait wings (default 160)")
        print("  /rr wingsdbg       – debug wings anchor/visibility")
        print("  /rr history     – toggle score history graph")
        print("  /rr history clear – clear all history data")
        print("  /rr debug       – dump raw score API output")
        print("  /rr pvp             – toggle PvP rank frame")
        print("  /rr pvpranks    – list PvP rank thresholds")
        print("  /rr pvpdebug    – dump PvP rating per bracket")
        print("  /rr pvpaura test <rank> – preview aura (e.g. gladiator)")
        print("  /rr pvpaura stop       – stop aura preview")
        print("  /rr pvpaura <size>     – resize PvP portrait aura (40–400)")
        print("  /rr test        – run all in-game tests")
    end
end
