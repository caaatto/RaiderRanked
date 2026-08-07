-- RaiderRanked: Core.lua
-- Addon initialisation, saved variables, score lookup, slash commands.

local ADDON_NAME, RR = ...

-- ── Defaults ────────────────────────────────────────────────────────────────

-- Exposed on RR so UI.lua can read defaults for the Settings panel.
RR.DB_DEFAULTS = {
    thresholds    = nil,  -- populated from RR:GetDefaultThresholds() on first load
    cutoffRegion  = "eu",   -- one of RR.CUTOFF_REGIONS  (eu | us | all)
    cutoffFaction = "all",  -- one of RR.CUTOFF_FACTIONS (all | horde | alliance)
    showInTooltip = true,
    showFrame     = true,
    showWings     = true,
    showUnitWings = true,
    showMinimap   = true,
    minimap       = { hide = false, minimapPos = 225 },  -- LibDBIcon settings
    framePosition = { point = "CENTER", x = 0, y = -200 },
    frameLocked   = false,
    lastRankId    = nil,  -- DEPRECATED: migrated to per-char charRanks[key]
    -- Rank-up pop-up: y = 90 reproduces the old hard-coded placement.
    animPosition  = { point = "CENTER", x = 0, y = 90 },
    animUnlocked  = false,  -- drag handle visible; reset to false every login
    -- Score history
    historyClassColors = false,  -- colour character lines by class instead of palette
    -- PvP
    pvpThresholds     = nil,
    showPvPFrame      = false,  -- opt-in via Settings
    showPvPInTooltip  = false,  -- opt-in via Settings
    showPvPAura       = false,  -- opt-in via Settings
    pvpFramePosition  = { point = "CENTER", x = 0, y = -300 },
    lastPvPRankId     = nil,  -- DEPRECATED: migrated to per-char charRanks[key]
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

-- ── Per-character rank helpers ──────────────────────────────────────────────

local function CharKey()
    local name  = UnitName("player")
    local realm = GetNormalizedRealmName() or ""
    if not name then return nil end
    return name .. "-" .. realm
end

--- Returns the per-character rank sub-table, creating it if necessary.
function RR:GetCharRanks()
    if not self.db.charRanks then
        self.db.charRanks = {}
    end
    local key = CharKey()
    if not key then return nil end
    if not self.db.charRanks[key] then
        self.db.charRanks[key] = {}
    end
    return self.db.charRanks[key]
end

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
    -- Validate cutoff selection — saved values could be stale or corrupt.
    if not (self.CUTOFFS and self.CUTOFFS[RaiderRankedDB.cutoffRegion]
            and self.CUTOFFS[RaiderRankedDB.cutoffRegion][RaiderRankedDB.cutoffFaction]) then
        RaiderRankedDB.cutoffRegion  = "eu"
        RaiderRankedDB.cutoffFaction = "all"
    end

    -- self.db needs to be assigned before GetDefaultThresholds() since it
    -- now resolves defaults from RR.CUTOFFS[db.cutoffRegion][db.cutoffFaction].
    self.db = RaiderRankedDB

    if not RaiderRankedDB.thresholds then
        RaiderRankedDB.thresholds = self:GetDefaultThresholds()
    end

    -- Auto-update saved thresholds when code defaults change (addon update or
    -- region/faction switch). Only overwrites values the user hasn't
    -- manually customised via /rr set.
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

    self:ApplyCutoffSelection()
    self:ApplyThresholds(self.db.thresholds)
    self:ApplyPvPThresholds(self.db.pvpThresholds)
    self:InitScoreHistory()
    self:RegisterSlashCommands()

    -- Migrate old account-wide lastRankId / lastPvPRankId into per-char storage.
    -- The old fields stay in the DB (harmless) but are no longer read.
    if not self.db.charRanks then
        self.db.charRanks = {}
    end

    -- The pop-up drag handle is a positioning aid, never a persistent overlay.
    -- Reset before RegisterSettings so its checkbox starts unchecked.
    self.db.animUnlocked = false

    -- Settings panel must be registered during ADDON_LOADED (before UI is built).
    local ok, err = pcall(function() self:RegisterSettings() end)
    if not ok then
        print("|cffff0000RaiderRanked Settings error:|r " .. tostring(err))
    end
end

function RR:OnPlayerLogin()
    -- UnitClass("player") is empty during ADDON_LOADED, so the class for the
    -- history colours can only be recorded from here on.
    self:RecordCharClass()

    local ok, err = pcall(function() self:InitUI() end)
    if not ok then
        print("|cffff0000RaiderRanked InitUI error:|r " .. tostring(err))
    end
end

function RR:OnEnteringWorld()
    -- Clear in-memory rank state so a char switch doesn't carry over the
    -- previous character's rank (which would cause a false rank-up detection).
    self.playerRank     = nil
    self.playerScore    = nil
    self.playerPvPRank  = nil
    self.playerPvPScore = nil

    -- Small delay: score API may not be populated immediately on zone-in.
    C_Timer.After(2, function() RR:RefreshPlayerRank() end)
end

-- ── Cutoff selection (Region × Faction) ─────────────────────────────────────

--- Switches the active cutoff region/faction and migrates thresholds.
--- Values that still match the previously active defaults are updated to
--- the new defaults; user-customised values (/rr set) stay put.
---@param region string|nil   nil keeps current
---@param faction string|nil  nil keeps current
function RR:SwitchCutoffSelection(region, faction)
    region  = region  or self.db.cutoffRegion
    faction = faction or self.db.cutoffFaction
    if not (self.CUTOFFS[region] and self.CUTOFFS[region][faction]) then
        return false
    end
    if region == self.db.cutoffRegion and faction == self.db.cutoffFaction then
        return true
    end

    local oldDefaults = self.db.thresholdDefaults or self:GetDefaultThresholds()
    self.db.cutoffRegion  = region
    self.db.cutoffFaction = faction
    local newDefaults = self:GetDefaultThresholds()

    for id, newVal in pairs(newDefaults) do
        if self.db.thresholds[id] == oldDefaults[id] then
            self.db.thresholds[id] = newVal
        end
    end
    self.db.thresholdDefaults = newDefaults

    self:ApplyCutoffSelection()
    self:ApplyThresholds(self.db.thresholds)
    if self.RefreshPlayerRank then self:RefreshPlayerRank() end
    if self.UpdateRankFrame then self:UpdateRankFrame() end
    if self.RefreshGroupPanel then self:RefreshGroupPanel() end
    if self.RefreshRankLadder then self:RefreshRankLadder() end
    return true
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

    local charRanks = self:GetCharRanks()

    -- Resolve previous rank: in-memory first, then per-char SavedVariables, then nil.
    local oldRank = self.playerRank
    if not oldRank and charRanks and charRanks.lastRankId then
        oldRank = self.RANK_BY_ID[charRanks.lastRankId]
    end

    self.playerRank  = newRank
    self.playerScore = newScore

    -- Persist per-character so rank-ups are detected correctly after relog/char switch.
    if charRanks then
        charRanks.lastRankId = newRank.id
    end

    if self.UpdateRankFrame then
        self:UpdateRankFrame()
    end

    -- Record score history snapshot.
    if self.RecordScoreSnapshot then
        self:RecordScoreSnapshot()
    end

    -- Both panels no-op unless they are currently open.
    if self.RefreshRankLadder then
        self:RefreshRankLadder()
    end
    if self.RefreshSeasonsPanel then
        self:RefreshSeasonsPanel()
    end

    -- Animate when rank improves (skip on very first load where oldRank is nil).
    if oldRank and newRank.minScore > oldRank.minScore then
        if self.PlayRankUpAnimation then
            self:PlayRankUpAnimation(oldRank, newRank, newScore)
        end
    end

    -- Start PvE Top-100 aura ticker (idempotent — only starts once).
    if self.StartPveAuraTicker then
        self:StartPveAuraTicker()
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

    -- Must be tested before the "anim" branch below, which would otherwise
    -- swallow "animpos" and treat "pos" as a rank id.
    elseif msg:match("^animpos") then
        local arg = msg:match("^animpos%s*(%S*)$")
        if arg == "reset" then
            self:ResetAnimPosition()
        else
            self:ToggleAnimMover()
        end

    elseif msg == "classcolors" then
        self.db.historyClassColors = not self.db.historyClassColors
        self:PrintClassColorState()
        self:RefreshHistoryGraph()

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

    elseif msg:match("^wingstest") then
        local unit = msg:match("^wingstest%s*(%S*)$") or "target"
        self:TestUnitWings(unit == "" and "target" or unit)

    elseif msg:match("^wings%s+%d+$") then
        self:SetPortraitWingsSize(msg:match("^wings%s+(%d+)$"))

    elseif msg == "debug" then
        self:DebugScore()

    elseif msg == "groupdbg" then
        self:DebugGroupChannel()

    elseif msg == "test" then
        self:RunTests()

    elseif msg == "reset" then
        self.db.thresholds = self:GetDefaultThresholds()
        self:ApplyCutoffSelection()
        self:ApplyThresholds(self.db.thresholds)
        self.db.thresholdDefaults = self:GetDefaultThresholds()
        print("|cff00ccffRaiderRanked|r Thresholds reset to defaults.")

    elseif msg:match("^cutoff%s+%S+%s+%S+$") then
        local r, f = msg:match("^cutoff%s+(%S+)%s+(%S+)$")
        if self:SwitchCutoffSelection(r, f) then
            print(string.format("|cff00ccffRaiderRanked|r Cutoff: %s / %s",
                self.CUTOFF_REGION_LABELS[r] or r,
                self.CUTOFF_FACTION_LABELS[f] or f))
        else
            print("|cff00ccffRaiderRanked|r Unknown region/faction. Valid: eu|us|all  all|horde|alliance")
        end

    elseif msg == "cutoff" then
        print(string.format("|cff00ccffRaiderRanked|r Active cutoff: %s / %s",
            self.CUTOFF_REGION_LABELS[self.db.cutoffRegion] or self.db.cutoffRegion,
            self.CUTOFF_FACTION_LABELS[self.db.cutoffFaction] or self.db.cutoffFaction))

    elseif msg == "ranks" then
        print("|cff00ccffRaiderRanked|r Current M+ thresholds:")
        for _, rank in ipairs(self.RANKS) do
            print(string.format("  %s: %d+",
                self:FormatRankName(rank), rank.minScore))
        end
        print("  |cff888888/rr ladder shows the same list as a panel|r")

    elseif msg == "ladder" then
        self:ToggleRankLadder()

    elseif msg == "seasons" then
        self:ToggleSeasonsPanel()

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
            print(string.format("  %s: %d+",
                self:FormatPvPRankName(rank), rank.minCR))
        end

    elseif msg == "pvpdebug" then
        self:DebugPvPScore()

    elseif msg == "testpve" then
        print("|cff00ccffRaiderRanked|r Playing PvE Top-100 aura...")
        self:PlayPveAura()

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
        print("  /rr ladder      – rank ladder panel (all ranks + your position)")
        print("  /rr seasons     – past season results per character")
        print("  /rr set <ID> <score>  – e.g. /rr set CHALLENGER 3500")
        print("  /rr cutoff              – show active region/faction")
        print("  /rr cutoff <region> <faction>  – eu|us|all  all|horde|alliance")
        print("  /rr reset       – restore default thresholds")
        print("  /rr anim [from] to – preview rank-up animation")
        print("  /rr animpos        – move rank-up pop-up (right-click save, Esc discard)")
        print("  /rr animpos reset  – restore default pop-up position")
        print("  /rr wings <size>   – resize portrait wings (default 160)")
        print("  /rr wingsdbg       – debug wings anchor/visibility")
        print("  /rr wingstest [unit] – force wings onto a target to check placement")
        print("  /rr history     – toggle score history graph")
        print("  /rr history clear – clear all history data")
        print("  /rr classcolors – toggle class colours in the history graph")
        print("  /rr debug       – dump raw score API output")
        print("  /rr groupdbg    – dump party categories + broadcast channel")
        print("  /rr pvp             – toggle PvP rank frame")
        print("  /rr pvpranks    – list PvP rank thresholds")
        print("  /rr pvpdebug    – dump PvP rating per bracket")
        print("  /rr pvpaura test <rank> – preview aura (e.g. gladiator)")
        print("  /rr pvpaura stop       – stop aura preview")
        print("  /rr pvpaura <size>     – resize PvP portrait aura (40–400)")
        print("  /rr test        – run all in-game tests")
    end
end
