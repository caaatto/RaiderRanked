-- RaiderRanked: RankSystem.lua
-- Defines rank tiers, score thresholds, and rank lookup logic.

local ADDON_NAME, RR = ...

-- Score thresholds based on 1,445,700 ranked players (TWW Season 2 distribution).
-- wingScore = midpoint of each bracket. Below midpoint → plain border (Boss-Gold).
-- At or above midpoint → winged border (Boss-Gold-Winged).
--
-- Rank         %ile range     Rio range     wingScore (midpoint)
-- Challenger   Top 0.1%       3252+         3252  (always winged)
-- Grandmaster  99.7–99.9%     3152–3251     3202
-- Master       99–99.7%       3032–3151     3092
-- Diamond      96–99%         2810–3031     2921
-- Emerald      92–96%         2701–2809     2755
-- Platinum     80–92%         2548–2700     2624
-- Gold         60–80%         2071–2547     2309
-- Silver       30–60%         890–2070      1480
-- Bronze       10–30%         303–889       596
-- Iron         0–10%          1–302         152
-- Unranked     0              0             —

-- Ordered highest to lowest. GetRankForScore() returns the first match.
local MEDIA = "Interface\\AddOns\\RaiderRanked\\Media\\"

-- Spritesheets are rendered from official LoL tier-promotion WebM videos via
-- Tools/render-spritesheets.js.  8×16 grid, 512 px/cell → 4096×8192.
--   <rank>_sheet.png       "to" animation — new rank crest appears (toFrames per rank)
--   <rank>_from_sheet.png  "from" animation — old rank crest leaves (47 frames)
-- toFrames values come from the render script output. If unknown, defaults to 128.
local SHEETS = MEDIA .. "Spritesheets\\"

-- Colors are designed for use with SetDesaturation(1) on the wing atlas:
-- the atlas is first converted to grayscale (neutralising the gold bake-in),
-- then the rank color is applied as a pure tint — so these values are fully
-- saturated and read true on screen.
RR.RANKS = {
    {
        id        = "CHALLENGER",
        name      = "Challenger",
        minScore  = 3252,
        wingScore = 3252,   -- always winged
        -- Wings use a gold→ice-blue gradient (see UI.lua ApplyWingsColor).
        -- This color is used for text, glow, and HUD elements.
        color     = { r = 1.000, g = 0.820, b = 0.000 },
        icon      = MEDIA .. "Ranks\\challenger.png",
        emblem    = MEDIA .. "Emblems\\emblem-challenger.png",
        wings     = MEDIA .. "Wings\\wings_challenger.png",
        sheet     = SHEETS .. "challenger_sheet.png",
        toFrames  = 128,
        from      = nil,   -- no from video on CDN; uses grandmaster from as fallback
    },
    {
        id        = "GRANDMASTER",
        name      = "Grandmaster",
        minScore  = 3152,
        wingScore = 3202,
        color     = { r = 1.000, g = 0.180, b = 0.180 },
        icon      = MEDIA .. "Ranks\\grandmaster.png",
        emblem    = MEDIA .. "Emblems\\emblem-grandmaster.png",
        wings     = MEDIA .. "Wings\\wings_grandmaster.png",
        sheet     = SHEETS .. "grandmaster_sheet.png",
        toFrames  = 128,
        from      = SHEETS .. "grandmaster_from_sheet.png",
    },
    {
        id        = "MASTER",
        name      = "Master",
        minScore  = 3032,
        wingScore = 3092,
        color     = { r = 0.720, g = 0.220, b = 1.000 },
        icon      = MEDIA .. "Ranks\\master.png",
        emblem    = MEDIA .. "Emblems\\emblem-master.png",
        wings     = MEDIA .. "Wings\\wings_master.png",
        sheet     = SHEETS .. "master_sheet.png",
        toFrames  = 128,
        from      = SHEETS .. "master_from_sheet.png",
    },
    {
        id        = "DIAMOND",
        name      = "Diamond",
        minScore  = 2810,
        wingScore = 2921,
        color     = { r = 0.120, g = 0.420, b = 1.000 },
        icon      = MEDIA .. "Ranks\\diamond.png",
        emblem    = MEDIA .. "Emblems\\emblem-diamond.png",
        wings     = MEDIA .. "Wings\\wings_diamond.png",
        sheet     = SHEETS .. "diamond_sheet.png",
        toFrames  = 119,
        from      = SHEETS .. "diamond_from_sheet.png",
    },
    {
        id        = "EMERALD",
        name      = "Emerald",
        minScore  = 2701,
        wingScore = 2755,
        color     = { r = 0.040, g = 0.880, b = 0.420 },
        icon      = MEDIA .. "Ranks\\emerald.png",
        emblem    = MEDIA .. "Emblems\\emblem-emerald.png",
        wings     = MEDIA .. "Wings\\wings_emerald.png",
        sheet     = SHEETS .. "emerald_sheet.png",
        toFrames  = 117,
        from      = SHEETS .. "emerald_from_sheet.png",
    },
    {
        id        = "PLATINUM",
        name      = "Platinum",
        minScore  = 2548,
        wingScore = 2624,
        color     = { r = 0.000, g = 0.580, b = 0.720 },
        icon      = MEDIA .. "Ranks\\platinum.png",
        emblem    = MEDIA .. "Emblems\\emblem-platinum.png",
        wings     = MEDIA .. "Wings\\wings_platinum.png",
        sheet     = SHEETS .. "platinum_sheet.png",
        toFrames  = 128,
        from      = SHEETS .. "platinum_from_sheet.png",
    },
    {
        id        = "GOLD",
        name      = "Gold",
        minScore  = 2071,
        wingScore = 2309,
        color     = { r = 1.000, g = 0.780, b = 0.000 },
        icon      = MEDIA .. "Ranks\\gold.png",
        emblem    = MEDIA .. "Emblems\\emblem-gold.png",
        wings     = MEDIA .. "Wings\\wings_gold.png",
        sheet     = SHEETS .. "gold_sheet.png",
        toFrames  = 113,
        from      = SHEETS .. "gold_from_sheet.png",
    },
    {
        id        = "SILVER",
        name      = "Silver",
        minScore  = 890,
        wingScore = 1480,
        color     = { r = 0.780, g = 0.880, b = 1.000 },
        icon      = MEDIA .. "Ranks\\silver.png",
        emblem    = MEDIA .. "Emblems\\emblem-silver.png",
        wings     = MEDIA .. "Wings\\wings_silver.png",
        sheet     = SHEETS .. "silver_sheet.png",
        toFrames  = 93,
        from      = SHEETS .. "silver_from_sheet.png",
    },
    {
        id        = "BRONZE",
        name      = "Bronze",
        minScore  = 303,
        wingScore = 596,
        color     = { r = 0.920, g = 0.500, b = 0.060 },
        icon      = MEDIA .. "Ranks\\bronze.png",
        emblem    = MEDIA .. "Emblems\\emblem-bronze.png",
        wings     = MEDIA .. "Wings\\wings_bronze.png",
        sheet     = SHEETS .. "bronze_sheet.png",
        toFrames  = 92,
        from      = SHEETS .. "bronze_from_sheet.png",
    },
    {
        id        = "IRON",
        name      = "Iron",
        minScore  = 1,
        wingScore = 152,
        color     = { r = 0.600, g = 0.600, b = 0.650 },
        icon      = MEDIA .. "Ranks\\iron.png",
        emblem    = MEDIA .. "Emblems\\emblem-iron.png",
        wings     = MEDIA .. "Wings\\wings_iron.png",
        sheet     = SHEETS .. "iron_sheet.png",
        toFrames  = 110,
        from      = SHEETS .. "iron_from_sheet.png",
    },
    {
        id        = "UNRANKED",
        name      = "Unranked",
        minScore  = 0,
        wingScore = nil,
        color     = { r = 0.350, g = 0.350, b = 0.350 },
        icon      = MEDIA .. "Ranks\\unranked.png",
        emblem    = nil,
        wings     = nil,
        sheet     = nil,
        from      = SHEETS .. "unranked_from_sheet.png",
    },
}

-- Build a lookup table by id for fast access.
RR.RANK_BY_ID = {}
for _, rank in ipairs(RR.RANKS) do
    RR.RANK_BY_ID[rank.id] = rank
end

-- Snapshot of original code-defined thresholds, captured before any SavedVariables
-- override can mutate RR.RANKS. GetDefaultThresholds() reads from here so that
-- /rr reset always restores the values from this file, not from a mutated RANKS table.
RR.RANK_SCORE_DEFAULTS = {}
for _, rank in ipairs(RR.RANKS) do
    RR.RANK_SCORE_DEFAULTS[rank.id] = rank.minScore
end

--- Returns the rank table for the given Raider.io score.
---@param score number|nil  Raider.io M+ overall score (nil treated as 0).
---@return table rank
function RR:GetRankForScore(score)
    score = score or 0
    for _, rank in ipairs(self.RANKS) do
        if score >= rank.minScore then
            return rank
        end
    end
    return self.RANKS[#self.RANKS] -- fallback: Unranked
end

--- Returns a colour-formatted rank name string.
---@param rank table
---@return string
function RR:FormatRankName(rank)
    local c = rank.color
    return string.format("|cff%02x%02x%02x%s|r",
        math.floor(c.r * 255),
        math.floor(c.g * 255),
        math.floor(c.b * 255),
        rank.name)
end

--- Returns the default score thresholds as a copy (used for DB initialisation and /rr reset).
--- Reads from RANK_SCORE_DEFAULTS (snapshot taken at file-load time) so that
--- SavedVariables overrides to RANKS.minScore don't corrupt the reset baseline.
function RR:GetDefaultThresholds()
    local t = {}
    for id, score in pairs(self.RANK_SCORE_DEFAULTS) do
        t[id] = score
    end
    return t
end

--- Applies saved threshold overrides from the database.
function RR:ApplyThresholds(thresholds)
    if not thresholds then return end
    for _, rank in ipairs(self.RANKS) do
        if thresholds[rank.id] then
            rank.minScore = thresholds[rank.id]
        end
    end
    -- Re-sort descending so GetRankForScore() still works correctly.
    table.sort(self.RANKS, function(a, b) return a.minScore > b.minScore end)
end
