-- RaiderRanked: RankSystem.lua
-- Defines rank tiers, score thresholds, and rank lookup logic.

local ADDON_NAME, RR = ...

-- Score thresholds (minScore / wingScore) below are seed values only. The
-- active values are loaded from Cutoffs.lua at login via
-- RR:ApplyCutoffSelection(), driven by the region/faction dropdowns in
-- the Settings panel (stored in db.cutoffRegion / db.cutoffFaction).
-- Cutoffs.lua is auto-patched daily from Raider.IO rankings. Do not edit
-- the seed values below by hand — they are only a fallback for the first
-- frame before Cutoffs.lua has been consulted.
--
-- wingScore = midpoint of each bracket. Below midpoint → plain border (Boss-Gold).
-- At or above midpoint → winged border (Boss-Gold-Winged).
--
-- Percentile bands (season-invariant):
--   Rank         Top %ile range
--   Challenger   Top 0.1%        (always winged)
--   Grandmaster  0.1–0.3%
--   Master       0.3–1%
--   Diamond      1–4%
--   Emerald      4–8%
--   Platinum     8–20%
--   Gold         20–40%
--   Silver       40–70%
--   Bronze       70–90%
--   Iron         90–100%
--   Unranked     no score

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
        minScore  = 4000,
        wingScore = 4032,   -- always winged
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
        minScore  = 3900,
        wingScore = 3933,
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
        minScore  = 3778,
        wingScore = 3824,
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
        minScore  = 3551,
        wingScore = 3644,
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
        minScore  = 3413,
        wingScore = 3462,
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
        minScore  = 3109,
        wingScore = 3246,
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
        minScore  = 2766,
        wingScore = 2982,
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
        minScore  = 1714,
        wingScore = 2479,
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
        minScore  = 441,
        wingScore = 1016,
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
        wingScore = 238,
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

-- ── Top 100 threshold ─────────────────────────────────────────────────────
-- Updated periodically. Players at or above this score get a special aura.
RR.TOP_100_SCORE = 4164

--- Returns true if the given score qualifies for Top 100.
function RR:IsTop100(score)
    return score and score >= self.TOP_100_SCORE
end

-- Fallback snapshot of file-load minScore values, used only when Cutoffs.lua
-- or db.cutoffRegion/Faction are not yet available (first frame, tests).
-- For normal operation GetDefaultThresholds() reads from RR.CUTOFFS.
RR.RANK_SCORE_DEFAULTS = {}
for _, rank in ipairs(RR.RANKS) do
    RR.RANK_SCORE_DEFAULTS[rank.id] = rank.minScore
end

--- Returns the next-higher rank above the given one, or nil if already at the top.
---@param rank table
---@return table|nil
function RR:GetNextRank(rank)
    for i, r in ipairs(self.RANKS) do
        if r.id == rank.id then
            return self.RANKS[i - 1]
        end
    end
    return nil
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

--- Returns the display name for a rank, appending " +" when the score is in
--- the upper half of the bracket (at or above wingScore).
--- Challenger is excluded (top rank — always "Challenger").
---@param rank table
---@param score number|nil
---@return string
RR.RANK_SHORT = {
    CHALLENGER  = "CH",
    GRANDMASTER = "GM",
    MASTER      = "MA",
    DIAMOND     = "DIA",
    EMERALD     = "EM",
    PLATINUM    = "PL",
    GOLD        = "GO",
    SILVER      = "SI",
    BRONZE      = "BR",
    IRON        = "IR",
}

function RR:GetRankDisplayName(rank, score, short)
    local name = short and (RR.RANK_SHORT[rank.id] or rank.name) or rank.name
    if rank.wingScore and score and score >= rank.wingScore
       and rank.id ~= "CHALLENGER" then
        return name .. " +"
    end
    return name
end

--- Returns a colour-formatted rank name string.
---@param rank table
---@param score number|nil  Optional score for "+" suffix.
---@return string
function RR:FormatRankName(rank, score)
    local c = rank.color
    local name = self:GetRankDisplayName(rank, score)
    return string.format("|cff%02x%02x%02x%s|r",
        math.floor(c.r * 255),
        math.floor(c.g * 255),
        math.floor(c.b * 255),
        name)
end

--- Returns the active minScore defaults (used for DB initialisation and /rr reset).
--- Reads from RR.CUTOFFS for the current db.cutoffRegion / db.cutoffFaction; falls
--- back to the file-load snapshot if Cutoffs.lua or db isn't ready yet.
function RR:GetDefaultThresholds()
    local region  = self.db and self.db.cutoffRegion  or "eu"
    local faction = self.db and self.db.cutoffFaction or "all"
    local set = self.CUTOFFS and self:GetCutoffSet(region, faction) or nil
    local t = {}
    if set then
        for id, _ in pairs(self.RANK_SCORE_DEFAULTS) do
            local entry = set[id]
            t[id] = (entry and entry.minScore) or self.RANK_SCORE_DEFAULTS[id]
        end
    else
        for id, score in pairs(self.RANK_SCORE_DEFAULTS) do
            t[id] = score
        end
    end
    return t
end

--- Applies the wingScore and TOP_100_SCORE values from the selected cutoff
--- set to RR.RANKS and RR.TOP_100_SCORE. minScore is not touched here —
--- that goes through ApplyThresholds so user overrides (/rr set) are
--- preserved. Call this whenever db.cutoffRegion / db.cutoffFaction
--- changes, followed by ApplyThresholds(db.thresholds).
function RR:ApplyCutoffSelection()
    local region  = (self.db and self.db.cutoffRegion)  or "eu"
    local faction = (self.db and self.db.cutoffFaction) or "all"
    local set = self:GetCutoffSet(region, faction)
    if not set then return end
    for _, rank in ipairs(self.RANKS) do
        local entry = set[rank.id]
        if entry and entry.wingScore then
            rank.wingScore = entry.wingScore
        end
    end
    if set.top100Score then
        self.TOP_100_SCORE = set.top100Score
    end
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
