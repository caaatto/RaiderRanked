-- RaiderRanked: PvPRankSystem.lua
-- Defines PvP rank tiers based on Current Rating (CR) across all rated brackets.

local ADDON_NAME, RR = ...

-- PvP ranks based on WoW's official rating breakpoints.
-- Ordered highest to lowest. GetPvPRankForCR() returns the first match.
--
-- Rank          CR threshold
-- Gladiator     2400+
-- Elite         2100+
-- Duelist       1800+
-- Rival         1600+
-- Challenger    1400+
-- Combatant     1000+
-- Unranked      0

local MEDIA  = "Interface\\AddOns\\RaiderRanked\\Media\\"
local SHEETS = MEDIA .. "PvP\\Spritesheets\\"

-- Aura spritesheet constants (must stay in sync with PvPAuraAnimation.lua).
RR.PVP_AURA_COLS       = 8
RR.PVP_AURA_ROWS       = 16
RR.PVP_AURA_FRAMES     = 123   -- all ranks identical (4.1s × 30fps)
RR.PVP_AURA_FPS        = 30
RR.PVP_AURA_CELL_PX    = 512   -- pixels per cell → 4096×8192 sheet

RR.PVP_RANKS = {
    {
        id         = "PVP_GLADIATOR",
        name       = "Gladiator",
        minCR      = 2400,
        color      = { r = 1.000, g = 0.820, b = 0.000 },
        icon       = MEDIA .. "Ranks\\gladiator.png",
        auraSheet  = SHEETS .. "gladiator_aura_sheet.png",
        auraFrames = 123,
    },
    {
        id         = "PVP_ELITE",
        name       = "Elite",
        minCR      = 2100,
        color      = { r = 0.720, g = 0.220, b = 1.000 },
        icon       = MEDIA .. "Ranks\\elite.png",
        auraSheet  = SHEETS .. "elite_aura_sheet.png",
        auraFrames = 123,
    },
    {
        id         = "PVP_DUELIST",
        name       = "Duelist",
        minCR      = 1800,
        color      = { r = 0.120, g = 0.420, b = 1.000 },
        icon       = MEDIA .. "Ranks\\duelist.png",
        auraSheet  = SHEETS .. "duelist_aura_sheet.png",
        auraFrames = 123,
    },
    {
        id         = "PVP_RIVAL",
        name       = "Rival",
        minCR      = 1600,
        color      = { r = 0.040, g = 0.880, b = 0.420 },
        icon       = MEDIA .. "Ranks\\rival.png",
        auraSheet  = SHEETS .. "rival_aura_sheet.png",
        auraFrames = 123,
    },
    {
        id         = "PVP_CHALLENGER",
        name       = "Challenger",
        minCR      = 1400,
        color      = { r = 0.000, g = 0.580, b = 0.720 },
        icon       = MEDIA .. "Ranks\\challenger_pvp.png",
        auraSheet  = SHEETS .. "challenger_pvp_aura_sheet.png",
        auraFrames = 123,
    },
    {
        id         = "PVP_COMBATANT",
        name       = "Combatant",
        minCR      = 1000,
        color      = { r = 0.920, g = 0.500, b = 0.060 },
        icon       = MEDIA .. "Ranks\\combatant.png",
        auraSheet  = SHEETS .. "combatant_aura_sheet.png",
        auraFrames = 123,
    },
    {
        id         = "PVP_UNRANKED",
        name       = "Unranked",
        minCR      = 0,
        color      = { r = 0.350, g = 0.350, b = 0.350 },
        icon       = MEDIA .. "Ranks\\unranked.png",
        auraSheet  = nil,
        auraFrames = 0,
    },
}

-- Lookup table by id.
RR.PVP_RANK_BY_ID = {}
for _, rank in ipairs(RR.PVP_RANKS) do
    RR.PVP_RANK_BY_ID[rank.id] = rank
end

-- Snapshot of code-defined thresholds (same pattern as M+ side).
RR.PVP_RANK_CR_DEFAULTS = {}
for _, rank in ipairs(RR.PVP_RANKS) do
    RR.PVP_RANK_CR_DEFAULTS[rank.id] = rank.minCR
end

-- Rated PvP bracket indices used by GetPersonalRatedInfo / GetInspectArenaData.
RR.PVP_BRACKETS = {
    { index = 1, name = "2v2"          },
    { index = 2, name = "3v3"          },
    { index = 4, name = "Solo Shuffle" },
    { index = 7, name = "Blitz BG"     },
}
-- RBG uses a separate API (GetInspectRatedBGData), tracked separately.
RR.PVP_RBG_NAME = "RBG"

--- Returns the PvP rank table for a given current rating.
---@param cr number|nil  Highest CR across all brackets (nil treated as 0).
---@return table rank
function RR:GetPvPRankForCR(cr)
    cr = cr or 0
    for _, rank in ipairs(self.PVP_RANKS) do
        if cr >= rank.minCR then
            return rank
        end
    end
    return self.PVP_RANKS[#self.PVP_RANKS]
end

--- Returns a colour-formatted PvP rank name string.
---@param rank table
---@return string
function RR:FormatPvPRankName(rank)
    local c = rank.color
    return string.format("|cff%02x%02x%02x%s|r",
        math.floor(c.r * 255),
        math.floor(c.g * 255),
        math.floor(c.b * 255),
        rank.name)
end

--- Returns the default PvP CR thresholds as a copy.
function RR:GetDefaultPvPThresholds()
    local t = {}
    for id, cr in pairs(self.PVP_RANK_CR_DEFAULTS) do
        t[id] = cr
    end
    return t
end

--- Applies saved PvP threshold overrides from the database.
function RR:ApplyPvPThresholds(thresholds)
    if not thresholds then return end
    for _, rank in ipairs(self.PVP_RANKS) do
        if thresholds[rank.id] then
            rank.minCR = thresholds[rank.id]
        end
    end
    table.sort(self.PVP_RANKS, function(a, b) return a.minCR > b.minCR end)
end
