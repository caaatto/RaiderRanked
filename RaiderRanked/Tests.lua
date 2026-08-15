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
    print(prefix .. " - " .. self.name)
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

    -- GetRankForScore: boundaries derived from the live thresholds rather than
    -- written out. Cutoffs are repatched daily, so fixed numbers here go stale
    -- within days and the suite then reports failures that are not failures.
    for i, rank in ipairs(RR.RANKS) do
        if rank.id ~= "UNRANKED" then
            s:eq(rank.id .. ": its own threshold lands on it",
                RR:GetRankForScore(rank.minScore).id, rank.id)

            -- One below must fall to the next rank down, whichever that is.
            local below = RR.RANKS[i + 1]
            if below and rank.minScore > 0 then
                s:eq(rank.id .. ": one below drops to " .. below.id,
                    RR:GetRankForScore(rank.minScore - 1).id, below.id)
            end
        end
    end

    -- Nil and edge cases
    s:eq("score 0 → Unranked",   RR:GetRankForScore(0).id,   "UNRANKED")
    s:eq("score nil → Unranked", RR:GetRankForScore(nil).id, "UNRANKED")
    s:eq("far above the top threshold → Challenger",
        RR:GetRankForScore(RR.RANK_BY_ID["CHALLENGER"].minScore + 5000).id, "CHALLENGER")

    -- Top 100: a missing or zero cutoff must never qualify anyone. That value
    -- appears when a season is declared before any ranking data exists.
    local savedTop = RR.TOP_100_SCORE
    RR.TOP_100_SCORE = 0
    s:assert("zero cutoff qualifies nobody",
        not RR:IsTop100(0) and not RR:IsTop100(5000))
    RR.TOP_100_SCORE = nil
    s:assert("missing cutoff qualifies nobody", not RR:IsTop100(5000))
    RR.TOP_100_SCORE = 4000
    s:assert("a real cutoff still works",
        RR:IsTop100(4000) and RR:IsTop100(4500) and not RR:IsTop100(3999))
    s:assert("a zero score never qualifies", not RR:IsTop100(0))
    RR.TOP_100_SCORE = savedTop

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
    local realRIO       = RaiderIO
    local realBlizzAPI  = C_PlayerInfo
    local realUnitLevel = UnitLevel

    -- The character the suite happens to be run on must not decide the result.
    -- GetScoreForUnit refuses to report a score below MIN_SCORED_LEVEL, so on
    -- an alt every case below would come back nil and read as a broken addon.
    UnitLevel = function() return RR.MIN_SCORED_LEVEL end

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

    -- The gate itself, so lowering it silently cannot go unnoticed.
    C_PlayerInfo = { GetPlayerMythicPlusRatingSummary = function() return { currentSeasonScore = 2886 } end }
    RaiderIO = nil
    UnitLevel = function() return RR.MIN_SCORED_LEVEL - 1 end
    s:eq("GetScoreForUnit ignores a character below the scored level",
         RR:GetScoreForUnit("player"), nil)
    UnitLevel = function() return RR.MIN_SCORED_LEVEL end
    s:eq("GetScoreForUnit reports one at the scored level",
         RR:GetScoreForUnit("player"), 2886)

    -- Restore
    C_PlayerInfo = realBlizzAPI
    RaiderIO     = realRIO
    UnitLevel    = realUnitLevel

    s:print()
    return s.failed
end

local function runUITests()
    local s = Suite.new("UI")

    -- Rank frame should exist after login. Its absence is itself the finding,
    -- so it is reported rather than walked into: indexing it anyway would end
    -- the run on the spot and hide everything the other suites have to say.
    local frame = RaiderRankedFrame
    s:assert("RankFrame global exists", frame ~= nil)
    if frame then
        s:assert("RankFrame is a Frame", type(frame) == "table")
        s:assert("RankFrame has icon texture", frame.icon ~= nil)
        s:assert("RankFrame has nameText", frame.nameText ~= nil)
        s:assert("RankFrame has scoreText", frame.scoreText ~= nil)
    end

    -- Minimap button (LibDBIcon - may be nil if db.minimap.hide was true at load)
    local icon = LibStub and LibStub("LibDBIcon-1.0", true)
    s:assert("MinimapButton registered", icon and icon:IsRegistered("RaiderRanked"))

    -- ToggleRankFrame: round-trip show/hide
    if frame then
        local wasShown = frame:IsShown()
        RR:ToggleRankFrame(false)
        s:assert("ToggleRankFrame(false) hides frame", not frame:IsShown())
        RR:ToggleRankFrame(true)
        s:assert("ToggleRankFrame(true) shows frame", frame:IsShown())
        -- Restore original state.
        RR:ToggleRankFrame(wasShown)
    end

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

    -- Percentile interpolation: a score sitting exactly on a threshold must
    -- land on that band's edge, and the figure must fall as the score rises.
    local pctDiamond = RR:ScorePercentile(2000, T)   -- DIAMOND starts at 2000
    local pctMaster  = RR:ScorePercentile(3500, T)   -- MASTER starts at 3500
    local pctMid     = RR:ScorePercentile(2750, T)   -- between the two
    s:eq("Score on the Diamond threshold is the band's bottom edge", pctDiamond, 4)
    s:eq("Score on the Master threshold is the band's bottom edge", pctMaster, 1)
    s:assert("Percentile falls as score rises",
        pctMid and pctMid < pctDiamond and pctMid > pctMaster)
    s:assert("A zero score has no percentile", RR:ScorePercentile(0, T) == nil)
    s:eq("Archived peak carries its percentile", type(alpha and alpha.peakPct), "number")

    -- Points are moved into the record, not deleted - the graph must still be
    -- able to draw a past season.
    local pts = rec and rec.charPoints and rec.charPoints["Alpha-Realm"]
    s:assert("Archived season kept its points", type(pts) == "table" and #pts > 0)
    if pts then
        local newest = pts[#pts][1]
        s:assert("Archived points stop before the new season", newest < seasonStart)
    end
    s:assert("Second character's points archived too",
        rec and rec.charPoints and rec.charPoints["Beta-Realm"] ~= nil)

    -- The graph reads through GetHistorySet, so selecting an archived season
    -- must hand back that season's points instead of the live ones.
    -- pcall: SetViewedSeason triggers a redraw, and the graph is pointed at a
    -- throwaway database here. The selection is what matters, not the paint.
    local okSel = pcall(RR.SetViewedSeason, RR, 1)
    s:assert("Selecting an archived season does not error", okSel)
    s:assert("Viewing an archived season swaps the data set",
        RR:GetHistorySet()["Alpha-Realm"] == pts)
    s:assert("GetViewedSeason reports the record", RR:GetViewedSeason() == rec)
    pcall(RR.SetViewedSeason, RR, nil)
    s:assert("Back to the running season",
        RR:GetHistorySet() == RR.db.charHistory and RR:GetViewedSeason() == nil)
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
    -- filed away - the running season just gets adopted.
    RR.db = {
        charHistory = {
            ["Delta-Realm"] = { { seasonStart, 0 }, { seasonStart + 5, 800, T } },
        },
    }
    RR:ArchiveSeasonIfRolled()
    s:assert("Fresh install archives nothing", RR.db.seasonArchive == nil)
    s:eq("Fresh install adopts the season", RR.db.seasonStart, seasonStart)

    -- Best rank is captured live, with every ladder's percentile taken at that
    -- moment, so a past result stays comparable without historical cutoffs.
    RR.db = {
        charHistory = {}, charPeak = {},
        cutoffRegion = "eu", cutoffFaction = "all",
    }
    RR:RecordBestRank("Live-Realm", 3000)
    local own = RR:GetOwnBest("Live-Realm")
    s:assert("A best rank is recorded for the configured ladder", own ~= nil)
    s:eq("It keeps the score", own and own.score, 3000)
    s:assert("It timestamps the moment", type(own and own.ts) == "number")

    local ladderCount = 0
    for _, byFaction in pairs(RR.db.charBest["Live-Realm"].ladders or {}) do
        for _ in pairs(byFaction) do ladderCount = ladderCount + 1 end
    end
    s:eq("Every ladder tracked separately", ladderCount, 9)

    -- Each ladder keeps its own best, and a worse result never overwrites one.
    local before = own.pct
    RR:RecordBestRank("Live-Realm", 1000)
    s:eq("A worse score leaves the best alone", RR:GetOwnBest("Live-Realm").score, 3000)
    RR:RecordBestRank("Live-Realm", 4000)
    s:eq("A better score replaces it", RR:GetOwnBest("Live-Realm").score, 4000)
    s:assert("Percentile improved with it", RR:GetOwnBest("Live-Realm").pct < before)

    -- Everything below is what another player's client looks like, not this
    -- one: no history at all, and data recorded before thresholds were stored.
    RR.db = { charHistory = {} }
    local okEmpty = pcall(RR.GetSeasonArchive, RR)
    s:assert("Empty database survives the seasons view", okEmpty)
    local emptySeasons = RR:GetSeasonArchive()
    s:eq("Fresh install still lists the running season", #emptySeasons, 1)
    s:eq("Running season has no characters yet", #emptySeasons[1].rows, 0)

    RR.db = {
        charHistory = { ["Solo-Realm"] = { { seasonStart + 1, 2500 } } },  -- no thresholds
    }
    local okBare = pcall(RR.GetSeasonArchive, RR)
    s:assert("History without stored thresholds survives", okBare)
    local bare = RR:GetSeasonArchive()[1].rows[1]
    s:assert("Character still appears", bare and bare.peak == 2500)

    RR.db = realDB
    s:assert("Real database restored", RR.db == realDB)

    -- Ladder comparison must either answer for every offered combination or
    -- say it cannot. A partial table would show the player's own ladder under
    -- another ladder's name.
    for _, region in ipairs(RR.CUTOFF_REGIONS) do
        for _, faction in ipairs(RR.CUTOFF_FACTIONS) do
            local th = RR:CutoffThresholds(region, faction)
            s:assert("Cutoffs complete for " .. region .. "/" .. faction,
                th ~= nil and th.CHALLENGER and th.IRON)
            if th then
                local pct = RR:ScorePercentile(3000, th)
                s:assert("Percentile resolves on " .. region .. "/" .. faction,
                    type(pct) == "number" and pct > 0 and pct <= 100)
            end
        end
    end

    s:print()
    return s.failed
end

-- ── Entry point ───────────────────────────────────────────────────────────────

function RR:RunTests()
    print("|cff00ccffRaiderRanked|r ── Running tests ──────────────────────")

    local suites = {
        { "Rank system",   runRankSystemTests },
        { "Core",          runCoreTests },
        { "UI",            runUITests },
        { "Panels",        runPanelTests },
        { "Season archive", runSeasonArchiveTests },
    }

    -- Each suite is run under pcall. An error inside one used to abort the
    -- whole command, and since every suite prints only at its end, the result
    -- was an empty chat frame and a lone error popup: the one outcome that
    -- looks like nothing happened at all. A broken suite now counts as a
    -- failure, names itself, and the remaining ones still report.
    local totalFailed, crashed = 0, 0
    for _, entry in ipairs(suites) do
        local name, run = entry[1], entry[2]
        local ok, result = pcall(run)
        if ok then
            totalFailed = totalFailed + (result or 0)
        else
            crashed = crashed + 1
            print(string.format("|cffff4444%s suite could not run:|r %s", name, tostring(result)))
        end
    end

    print("────────────────────────────────────────────────────")
    if totalFailed == 0 and crashed == 0 then
        print("|cff00ff00All tests passed.|r")
    else
        if totalFailed > 0 then
            print(string.format("|cffff4444%d test(s) FAILED.|r", totalFailed))
        end
        if crashed > 0 then
            print(string.format("|cffff4444%d suite(s) errored - copy the line above.|r", crashed))
        end
    end
end
