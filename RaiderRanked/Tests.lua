-- RaiderRanked: Tests.lua
-- In-game test suite. Run with:  /rr test
-- Results are printed to the chat frame.

local ADDON_NAME, RR = ...

-- ── Minimal test runner ───────────────────────────────────────────────────────

local Suite = {}
Suite.__index = Suite

function Suite.new(name)
    return setmetatable({ name = name, passed = 0, failed = 0, results = {} }, Suite)
end

function Suite:assert(label, condition, got, expected)
    if condition then
        self.passed = self.passed + 1
        table.insert(self.results, { ok = true, label = label })
    else
        self.failed = self.failed + 1
        local detail = ""
        if got ~= nil or expected ~= nil then
            detail = string.format(" (got %s, expected %s)",
                tostring(got), tostring(expected))
        end
        table.insert(self.results, { ok = false, label = label, detail = detail })
    end
end

function Suite:eq(label, got, expected)
    self:assert(label, got == expected, got, expected)
end

function Suite:neq(label, got, notExpected)
    self:assert(label, got ~= notExpected, got, "not " .. tostring(notExpected))
end

function Suite:print()
    local prefix = "|cff00ccffRaiderRanked Tests|r"
    print(prefix .. " – " .. self.name)
    for _, r in ipairs(self.results) do
        if r.ok then
            print(string.format("  |cff00ff00[PASS]|r %s", r.label))
        else
            print(string.format("  |cffff0000[FAIL]|r %s%s", r.label, r.detail or ""))
        end
    end
    local color = self.failed == 0 and "|cff00ff00" or "|cffff4444"
    print(string.format("%s  %d/%d passed|r", color, self.passed, self.passed + self.failed))
end

-- ── Test suites ───────────────────────────────────────────────────────────────

local function runRankSystemTests()
    local s = Suite.new("RankSystem")

    -- GetRankForScore: boundary checks
    s:eq("score 3200 → Challenger",    RR:GetRankForScore(3200).id, "CHALLENGER")
    s:eq("score 3199 → Grandmaster",   RR:GetRankForScore(3199).id, "GRANDMASTER")
    s:eq("score 2800 → Grandmaster",   RR:GetRankForScore(2800).id, "GRANDMASTER")
    s:eq("score 2799 → Master",        RR:GetRankForScore(2799).id, "MASTER")
    s:eq("score 2400 → Master",        RR:GetRankForScore(2400).id, "MASTER")
    s:eq("score 2399 → Diamond",       RR:GetRankForScore(2399).id, "DIAMOND")
    s:eq("score 2100 → Diamond",       RR:GetRankForScore(2100).id, "DIAMOND")
    s:eq("score 2099 → Emerald",       RR:GetRankForScore(2099).id, "EMERALD")
    s:eq("score 1800 → Emerald",       RR:GetRankForScore(1800).id, "EMERALD")
    s:eq("score 1799 → Platinum",      RR:GetRankForScore(1799).id, "PLATINUM")
    s:eq("score 1500 → Platinum",      RR:GetRankForScore(1500).id, "PLATINUM")
    s:eq("score 1499 → Gold",          RR:GetRankForScore(1499).id, "GOLD")
    s:eq("score 1200 → Gold",          RR:GetRankForScore(1200).id, "GOLD")
    s:eq("score 1199 → Silver",        RR:GetRankForScore(1199).id, "SILVER")
    s:eq("score  800 → Silver",        RR:GetRankForScore(800).id,  "SILVER")
    s:eq("score  799 → Bronze",        RR:GetRankForScore(799).id,  "BRONZE")
    s:eq("score  400 → Bronze",        RR:GetRankForScore(400).id,  "BRONZE")
    s:eq("score  399 → Iron",          RR:GetRankForScore(399).id,  "IRON")
    s:eq("score    1 → Iron",          RR:GetRankForScore(1).id,    "IRON")
    s:eq("score    0 → Unranked",      RR:GetRankForScore(0).id,    "UNRANKED")

    -- Nil and edge cases
    s:eq("score nil  → Unranked",      RR:GetRankForScore(nil).id,  "UNRANKED")
    s:eq("score 9999 → Challenger",    RR:GetRankForScore(9999).id, "CHALLENGER")

    -- FormatRankName: must return a non-empty coloured string
    local rank = RR.RANK_BY_ID["GOLD"]
    local formatted = RR:FormatRankName(rank)
    s:assert("FormatRankName contains rank name", formatted:find("Gold") ~= nil)
    s:assert("FormatRankName contains colour code", formatted:find("|c") ~= nil)

    -- GetDefaultThresholds: must include all rank IDs
    local defaults = RR:GetDefaultThresholds()
    for _, r in ipairs(RR.RANKS) do
        s:assert("Default threshold exists for " .. r.id,
            defaults[r.id] ~= nil and type(defaults[r.id]) == "number")
    end

    -- ApplyThresholds: overriding IRON to 500 should change its minScore
    local saved = RR.RANK_BY_ID["IRON"].minScore
    RR:ApplyThresholds({ IRON = 500 })
    s:eq("ApplyThresholds overrides IRON to 500", RR.RANK_BY_ID["IRON"].minScore, 500)
    -- Restore original value so other tests aren't affected.
    RR:ApplyThresholds({ IRON = saved })
    s:eq("Restore IRON threshold", RR.RANK_BY_ID["IRON"].minScore, saved)

    -- Ranks table stays sorted after ApplyThresholds
    local sorted = true
    for i = 2, #RR.RANKS do
        if RR.RANKS[i].minScore > RR.RANKS[i-1].minScore then
            sorted = false
            break
        end
    end
    s:assert("RANKS table is sorted descending after apply", sorted)

    -- RANK_BY_ID lookup agrees with RANKS table
    for _, r in ipairs(RR.RANKS) do
        s:assert("RANK_BY_ID[" .. r.id .. "] points to same table",
            RR.RANK_BY_ID[r.id] == r)
    end

    s:print()
    return s.failed
end

local function runCoreTests()
    local s = Suite.new("Core")

    -- db must exist after ADDON_LOADED
    s:assert("RR.db is set", RR.db ~= nil)
    s:assert("db.thresholds is table", type(RR.db.thresholds) == "table")
    s:assert("db.showInTooltip is boolean", type(RR.db.showInTooltip) == "boolean")
    s:assert("db.showFrame is boolean", type(RR.db.showFrame) == "boolean")

    -- Stash real globals
    local realRIO      = RaiderIO
    local realBlizzAPI = C_PlayerInfo

    -- Blizzard native API: reads currentSeasonScore
    C_PlayerInfo = { GetPlayerMythicPlusRatingSummary = function() return { currentSeasonScore = 2886 } end }
    RaiderIO = nil
    s:eq("GetScoreForUnit reads C_PlayerInfo currentSeasonScore", RR:GetScoreForUnit("player"), 2886)

    -- Blizzard returns 0 → fall through to RaiderIO
    C_PlayerInfo = { GetPlayerMythicPlusRatingSummary = function() return { currentSeasonScore = 0 } end }
    RaiderIO = { GetProfile = function() return { mplusCurrent = { score = 1850 } } end }
    s:eq("GetScoreForUnit falls back to RaiderIO when native score=0", RR:GetScoreForUnit("player"), 1850)

    -- Both APIs absent → nil, no error
    C_PlayerInfo = nil
    RaiderIO = nil
    local ok, result = pcall(RR.GetScoreForUnit, RR, "player")
    s:assert("GetScoreForUnit returns nil when both APIs absent (no error)", ok and result == nil)

    -- Blizzard API crashes → falls back to RaiderIO
    C_PlayerInfo = { GetPlayerMythicPlusRatingSummary = function() error("boom") end }
    RaiderIO = { GetProfile = function() return { mplusCurrent = { score = 999 } } end }
    s:eq("GetScoreForUnit falls back to RaiderIO on native error", RR:GetScoreForUnit("player"), 999)

    -- GetRankForUnit: score=0 when nothing is available
    C_PlayerInfo = nil
    RaiderIO = nil
    local rank, score = RR:GetRankForUnit("player")
    s:assert("GetRankForUnit returns rank table", rank ~= nil and rank.id ~= nil)
    s:eq("GetRankForUnit score=0 when no API", score, 0)

    -- Restore
    C_PlayerInfo = realBlizzAPI
    RaiderIO     = realRIO

    s:print()
    return s.failed
end

local function runUITests()
    local s = Suite.new("UI")

    -- Rank frame should exist after login
    s:assert("RankFrame global exists", RaiderRankedFrame ~= nil)
    s:assert("RankFrame is a Frame", type(RaiderRankedFrame) == "table")
    s:assert("RankFrame has icon texture", RaiderRankedFrame.icon ~= nil)
    s:assert("RankFrame has nameText", RaiderRankedFrame.nameText ~= nil)
    s:assert("RankFrame has scoreText", RaiderRankedFrame.scoreText ~= nil)

    -- Minimap button (LibDBIcon — may be nil if db.minimap.hide was true at load)
    local icon = LibStub and LibStub("LibDBIcon-1.0", true)
    s:assert("MinimapButton registered", icon and icon:IsRegistered("RaiderRanked"))

    -- ToggleRankFrame: round-trip show/hide
    local wasShown = RaiderRankedFrame:IsShown()
    RR:ToggleRankFrame(false)
    s:assert("ToggleRankFrame(false) hides frame", not RaiderRankedFrame:IsShown())
    RR:ToggleRankFrame(true)
    s:assert("ToggleRankFrame(true) shows frame", RaiderRankedFrame:IsShown())
    -- Restore original state.
    RR:ToggleRankFrame(wasShown)

    -- UpdateRankFrame: must not error
    local ok = pcall(RR.UpdateRankFrame, RR)
    s:assert("UpdateRankFrame runs without error", ok)

    s:print()
    return s.failed
end

local function runPanelTests()
    local s = Suite.new("Panels")

    -- Every ranked tier needs a percentile band for the ladder's middle column.
    for _, r in ipairs(RR.RANKS) do
        if r.id ~= "UNRANKED" then
            local band = RR.RANK_PERCENTILES[r.id]
            s:assert("Percentile band for " .. r.id,
                type(band) == "table" and type(band[1]) == "number" and band[2] > band[1])
        end
    end

    -- All three views live as tabs in the score history window.
    local wasShown = RaiderRankedHistoryFrame and RaiderRankedHistoryFrame:IsShown()

    RR:ToggleRankLadder(true)
    local f = RR.historyFrame
    s:assert("History window exists after toggle", f ~= nil)
    s:assert("Window is shown", f and f:IsShown())
    s:assert("Three panes built", f and f.panes
        and f.panes.history and f.panes.ladder and f.panes.seasons)
    s:assert("Three tabs built", f and f.tabs and #f.tabs == 3)
    s:eq("Ladder tab is active", f and f.activeTab, "ladder")
    s:assert("Only the ladder pane is shown",
        f and f.panes.ladder:IsShown()
        and not f.panes.history:IsShown() and not f.panes.seasons:IsShown())
    local ok = pcall(RR.RefreshRankLadder, RR)
    s:assert("RefreshRankLadder runs without error", ok)

    -- Seasons: the running season must always be present, even when empty.
    local seasons = RR:GetSeasonArchive()
    s:assert("GetSeasonArchive returns a list", type(seasons) == "table" and #seasons >= 1)
    s:assert("First entry is the current season", seasons[1] and seasons[1].current == true)

    RR:ToggleSeasonsPanel(true)
    s:eq("Seasons tab is active", f and f.activeTab, "seasons")
    local ok2 = pcall(RR.RefreshSeasonsPanel, RR)
    s:assert("RefreshSeasonsPanel runs without error", ok2)

    -- The graph must not repaint while another tab is up, or its "no data"
    -- overlay would appear on top of that tab.
    local ok3 = pcall(RR.RefreshHistoryGraph, RR)
    s:assert("RefreshHistoryGraph is inert on another tab", ok3)

    RR:SetHistoryTab("history")
    s:assert("Switching back shows the graph pane",
        f and f.panes.history:IsShown() and not f.panes.seasons:IsShown())

    RR:ToggleHistoryGraph(wasShown and true or false)

    s:print()
    return s.failed
end

local function runSeasonArchiveTests()
    local s = Suite.new("Season archive")

    local seasonStart = RR:GetCurrentSeasonRecord().start
    s:assert("Current season has a start timestamp", type(seasonStart) == "number")

    -- Full threshold set so the archived ranks don't depend on whatever the
    -- player currently has selected or overridden.
    local T = {
        CHALLENGER = 4000, GRANDMASTER = 3800, MASTER  = 3500, DIAMOND = 2000,
        EMERALD    = 1800, PLATINUM    = 1500, GOLD    = 1200, SILVER  =  800,
        BRONZE     =  400, IRON        =    1,
    }

    -- Simulate a rollover against a throwaway db so no saved data is touched.
    local realDB    = RR.db
    local prevStart = seasonStart - 90 * 86400
    RR.db = {
        seasonStart = prevStart,
        seasonName  = "Test Season",
        charHistory = {
            ["Alpha-Realm"] = {
                { prevStart + 100, 1000, T },
                { prevStart + 200, 2500 },
                { prevStart + 300, 2100 },
                { seasonStart + 10,  300 },  -- already in the new season
            },
            ["Beta-Realm"] = {
                { prevStart + 50, 500, T },
            },
        },
        charPeak = { ["Alpha-Realm"] = 2600 },  -- higher than any surviving point
    }

    local ok = pcall(RR.ArchiveSeasonIfRolled, RR)
    s:assert("ArchiveSeasonIfRolled runs without error", ok)

    local archive = RR.db.seasonArchive
    s:assert("One season archived", type(archive) == "table" and #archive == 1)
    local rec = archive and archive[1]
    local alpha = rec and rec.chars and rec.chars["Alpha-Realm"]
    local beta  = rec and rec.chars and rec.chars["Beta-Realm"]

    s:eq("Archived record keeps the old season name", rec and rec.name, "Test Season")
    s:eq("Peak comes from the tracked peak, not the points", alpha and alpha.peak, 2600)
    s:eq("Final is the last score of that season", alpha and alpha.final, 2100)
    s:eq("Peak rank uses that season's thresholds", alpha and alpha.peakRank, "DIAMOND")
    s:eq("Final rank uses that season's thresholds", alpha and alpha.finalRank, "DIAMOND")
    s:eq("Second character archived too", beta and beta.peak, 500)
    s:eq("Second character's rank", beta and beta.peakRank, "BRONZE")

    s:eq("Old points pruned", #RR.db.charHistory["Alpha-Realm"], 1)
    s:eq("New-season point survives", RR.db.charHistory["Alpha-Realm"][1][2], 300)
    s:eq("seasonStart adopted", RR.db.seasonStart, seasonStart)
    s:assert("Tracked peaks cleared", next(RR.db.charPeak) == nil)

    -- Idempotent: a second login in the same season must not file it again.
    RR:ArchiveSeasonIfRolled()
    s:eq("Re-running does not archive twice", #RR.db.seasonArchive, 1)

    -- Updated only after a rollover: no stored season, but history that
    -- predates the current one. That is still a finished season.
    RR.db = {
        charHistory = {
            ["Gamma-Realm"] = {
                { prevStart + 10, 1900, T },
                { seasonStart + 5, 120 },
            },
        },
    }
    RR:ArchiveSeasonIfRolled()
    local late = RR.db.seasonArchive
    s:eq("Pre-existing data archived on first run", late and #late, 1)
    s:eq("Unnamed season gets a placeholder", late and late[1].name, "Earlier season")
    s:eq("Late-update peak read from the points",
        late and late[1].chars["Gamma-Realm"].peak, 1900)

    -- Fresh install mid-season: nothing predates SEASON_START, so nothing is
    -- filed away — the running season just gets adopted.
    RR.db = {
        charHistory = {
            ["Delta-Realm"] = { { seasonStart, 0 }, { seasonStart + 5, 800, T } },
        },
    }
    RR:ArchiveSeasonIfRolled()
    s:assert("Fresh install archives nothing", RR.db.seasonArchive == nil)
    s:eq("Fresh install adopts the season", RR.db.seasonStart, seasonStart)

    RR.db = realDB
    s:assert("Real database restored", RR.db == realDB)

    s:print()
    return s.failed
end

-- ── Entry point ───────────────────────────────────────────────────────────────

function RR:RunTests()
    print("|cff00ccffRaiderRanked|r ── Running tests ──────────────────────")
    local totalFailed = 0
    totalFailed = totalFailed + runRankSystemTests()
    totalFailed = totalFailed + runCoreTests()
    totalFailed = totalFailed + runUITests()
    totalFailed = totalFailed + runPanelTests()
    totalFailed = totalFailed + runSeasonArchiveTests()
    print("────────────────────────────────────────────────────")
    if totalFailed == 0 then
        print("|cff00ff00All tests passed.|r")
    else
        print(string.format("|cffff4444%d test(s) FAILED.|r", totalFailed))
    end
end
