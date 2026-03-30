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

    -- Minimap button
    s:assert("MinimapButton exists", RR.minimapButton ~= nil)

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

-- ── Entry point ───────────────────────────────────────────────────────────────

function RR:RunTests()
    print("|cff00ccffRaiderRanked|r ── Running tests ──────────────────────")
    local totalFailed = 0
    totalFailed = totalFailed + runRankSystemTests()
    totalFailed = totalFailed + runCoreTests()
    totalFailed = totalFailed + runUITests()
    print("────────────────────────────────────────────────────")
    if totalFailed == 0 then
        print("|cff00ff00All tests passed.|r")
    else
        print(string.format("|cffff4444%d test(s) FAILED.|r", totalFailed))
    end
end
