-- RaiderRanked standalone tests for RankSystem.lua
-- No WoW installation needed.
-- Run with:  lua tests/test_ranksystem.lua
--        or: cd tests && lua test_ranksystem.lua

-- ── Locate RankSystem.lua ────────────────────────────────────────────────────

local scriptDir = (arg and arg[0] or "tests/test_ranksystem.lua"):match("(.*[/\\])") or ""
local rankFile  = scriptDir .. "../RankSystem.lua"

-- ── Load RankSystem with a fake addon table ───────────────────────────────────

local RR   = {}
local chunk, err = loadfile(rankFile)
if not chunk then
    io.stderr:write("Could not load " .. rankFile .. ": " .. tostring(err) .. "\n")
    os.exit(1)
end
chunk("RaiderRanked", RR)   -- passes ADDON_NAME and the RR table as varargs (...)

-- ── Minimal test runner ───────────────────────────────────────────────────────

local passed, failed = 0, 0
local results = {}

local function pass(label)
    passed = passed + 1
    table.insert(results, "  [PASS] " .. label)
end

local function fail(label, got, expected)
    failed = failed + 1
    local detail = ""
    if got ~= nil or expected ~= nil then
        detail = string.format(" (got %s, expected %s)", tostring(got), tostring(expected))
    end
    table.insert(results, "  [FAIL] " .. label .. detail)
end

local function eq(label, got, expected)
    if got == expected then pass(label) else fail(label, got, expected) end
end

local function neq(label, got, notExpected)
    if got ~= notExpected then pass(label) else fail(label, got, "not " .. tostring(notExpected)) end
end

local function ok(label, condition)
    if condition then pass(label) else fail(label) end
end

-- ── Suite: GetRankForScore ────────────────────────────────────────────────────

print("─── GetRankForScore ───────────────────────────────────")

eq("3200  → CHALLENGER",   RR:GetRankForScore(3200).id, "CHALLENGER")
eq("3201  → CHALLENGER",   RR:GetRankForScore(3201).id, "CHALLENGER")
eq("3199  → GRANDMASTER",  RR:GetRankForScore(3199).id, "GRANDMASTER")
eq("2800  → GRANDMASTER",  RR:GetRankForScore(2800).id, "GRANDMASTER")
eq("2799  → MASTER",       RR:GetRankForScore(2799).id, "MASTER")
eq("2400  → MASTER",       RR:GetRankForScore(2400).id, "MASTER")
eq("2399  → DIAMOND",      RR:GetRankForScore(2399).id, "DIAMOND")
eq("2100  → DIAMOND",      RR:GetRankForScore(2100).id, "DIAMOND")
eq("2099  → EMERALD",      RR:GetRankForScore(2099).id, "EMERALD")
eq("1800  → EMERALD",      RR:GetRankForScore(1800).id, "EMERALD")
eq("1799  → PLATINUM",     RR:GetRankForScore(1799).id, "PLATINUM")
eq("1500  → PLATINUM",     RR:GetRankForScore(1500).id, "PLATINUM")
eq("1499  → GOLD",         RR:GetRankForScore(1499).id, "GOLD")
eq("1200  → GOLD",         RR:GetRankForScore(1200).id, "GOLD")
eq("1199  → SILVER",       RR:GetRankForScore(1199).id, "SILVER")
eq(" 800  → SILVER",       RR:GetRankForScore(800).id,  "SILVER")
eq(" 799  → BRONZE",       RR:GetRankForScore(799).id,  "BRONZE")
eq(" 400  → BRONZE",       RR:GetRankForScore(400).id,  "BRONZE")
eq(" 399  → IRON",         RR:GetRankForScore(399).id,  "IRON")
eq("   1  → IRON",         RR:GetRankForScore(1).id,    "IRON")
eq("   0  → UNRANKED",     RR:GetRankForScore(0).id,    "UNRANKED")
eq(" nil  → UNRANKED",     RR:GetRankForScore(nil).id,  "UNRANKED")
eq("9999  → CHALLENGER",   RR:GetRankForScore(9999).id, "CHALLENGER")

-- ── Suite: FormatRankName ─────────────────────────────────────────────────────

print("─── FormatRankName ────────────────────────────────────")

for _, rank in ipairs(RR.RANKS) do
    local fmt = RR:FormatRankName(rank)
    ok("Contains name: " .. rank.name,      fmt:find(rank.name, 1, true) ~= nil)
    ok("Contains colour code: " .. rank.id, fmt:find("|c") ~= nil)
    ok("Ends with |r: " .. rank.id,         fmt:sub(-2) == "|r")
end

-- ── Suite: GetDefaultThresholds ───────────────────────────────────────────────

print("─── GetDefaultThresholds ──────────────────────────────")

local defaults = RR:GetDefaultThresholds()
ok("Returns a table", type(defaults) == "table")
for _, rank in ipairs(RR.RANKS) do
    ok("Has key " .. rank.id, defaults[rank.id] ~= nil)
    ok("Value is number for " .. rank.id, type(defaults[rank.id]) == "number")
end
-- Independent copy: mutating defaults must not change RR.RANKS
defaults["CHALLENGER"] = 9999
eq("Returns independent copy (CHALLENGER still unchanged in RANKS)",
    RR.RANK_BY_ID["CHALLENGER"].minScore, 3200)

-- ── Suite: ApplyThresholds ───────────────────────────────────────────────────

print("─── ApplyThresholds ───────────────────────────────────")

local origIron = RR.RANK_BY_ID["IRON"].minScore
RR:ApplyThresholds({ IRON = 600 })
eq("Override IRON to 600", RR.RANK_BY_ID["IRON"].minScore, 600)

-- Table must remain sorted after override.
local sorted = true
for i = 2, #RR.RANKS do
    if RR.RANKS[i].minScore > RR.RANKS[i-1].minScore then
        sorted = false
        break
    end
end
ok("RANKS sorted descending after apply", sorted)

-- GetRankForScore still works after override.
-- (Bronze 400-599, Iron 600-799 now? No - Iron.minScore=600 means Iron starts at 600)
-- With Iron at 600: score 500 should be Bronze, score 600 should be Iron.
eq("Score 500 → BRONZE (after IRON override)", RR:GetRankForScore(500).id, "BRONZE")
eq("Score 600 → IRON   (after IRON override)", RR:GetRankForScore(600).id, "IRON")

-- Restore.
RR:ApplyThresholds({ IRON = origIron })
eq("Restore IRON threshold", RR.RANK_BY_ID["IRON"].minScore, origIron)

-- nil arg must not error.
local okNil = pcall(RR.ApplyThresholds, RR, nil)
ok("ApplyThresholds(nil) does not error", okNil)

-- ── Suite: RANK_BY_ID integrity ───────────────────────────────────────────────

print("─── RANK_BY_ID integrity ──────────────────────────────")

eq("11 ranks total", #RR.RANKS, 11)
for _, rank in ipairs(RR.RANKS) do
    ok("RANK_BY_ID[" .. rank.id .. "] is same table as in RANKS",
        RR.RANK_BY_ID[rank.id] == rank)
    ok("rank.name is string: "  .. rank.id, type(rank.name) == "string")
    ok("rank.icon is string: "  .. rank.id, type(rank.icon) == "string")
    ok("rank.color.r in [0,1]: " .. rank.id, rank.color.r >= 0 and rank.color.r <= 1)
    ok("rank.color.g in [0,1]: " .. rank.id, rank.color.g >= 0 and rank.color.g <= 1)
    ok("rank.color.b in [0,1]: " .. rank.id, rank.color.b >= 0 and rank.color.b <= 1)
end

-- ── Results ───────────────────────────────────────────────────────────────────

print("───────────────────────────────────────────────────────")
for _, line in ipairs(results) do print(line) end
print(string.format("───────────────────────────────────────────────────────"))
if failed == 0 then
    print(string.format("All %d tests passed.", passed))
else
    print(string.format("%d/%d passed,  %d FAILED.", passed, passed + failed, failed))
    os.exit(1)
end
