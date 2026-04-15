-- RaiderRanked: Cutoffs.lua
-- Per-region / per-faction M+ rating cutoffs.
--
-- Auto-patched by scripts/patch_addon.py from thresholds.json. Each
-- RR.CUTOFFS.<region>.<faction> block is a discrete patch target — do
-- not reformat the minScore/wingScore lines or the patcher will miss
-- them.
--
-- Regions: us | eu | all   (all = population-weighted merge of us+eu)
-- Factions: alliance | horde | all
--
-- Until the first multi-variant patch run lands, all 9 slots carry the
-- same snapshot (last single-region EU+all-factions compute). The
-- addon reads the active slot at login via RR:ApplyCutoffSelection().

local ADDON_NAME, RR = ...

RR.CUTOFFS = { us = {}, eu = {}, all = {} }

RR.CUTOFFS.eu.all = {
    top100Score = 3774,
    CHALLENGER  = { minScore = 3635, wingScore = 3668 },
    GRANDMASTER = { minScore = 3541, wingScore = 3567 },
    MASTER      = { minScore = 3421, wingScore = 3462 },
    DIAMOND     = { minScore = 3218, wingScore = 3302 },
    EMERALD     = { minScore = 3074, wingScore = 3136 },
    PLATINUM    = { minScore = 2808, wingScore = 2969 },
    GOLD        = { minScore = 2562, wingScore = 2673 },
    SILVER      = { minScore = 1324, wingScore = 2107 },
    BRONZE      = { minScore =  363, wingScore =  821 },
    IRON        = { minScore =    1, wingScore =  195 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 1,
    CHALLENGER  = { minScore = 1, wingScore = 1 },
    GRANDMASTER = { minScore = 1, wingScore = 1 },
    MASTER      = { minScore = 1, wingScore = 1 },
    DIAMOND     = { minScore = 1, wingScore = 1 },
    EMERALD     = { minScore = 1, wingScore = 1 },
    PLATINUM    = { minScore = 1, wingScore = 1 },
    GOLD        = { minScore = 1, wingScore = 1 },
    SILVER      = { minScore = 1, wingScore = 1 },
    BRONZE      = { minScore =  1, wingScore =  1 },
    IRON        = { minScore =    1, wingScore =  1 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 1,
    CHALLENGER  = { minScore = 1, wingScore = 1 },
    GRANDMASTER = { minScore = 1, wingScore = 1 },
    MASTER      = { minScore = 1, wingScore = 1 },
    DIAMOND     = { minScore = 1, wingScore = 1 },
    EMERALD     = { minScore = 1, wingScore = 1 },
    PLATINUM    = { minScore = 1, wingScore = 1 },
    GOLD        = { minScore = 1, wingScore = 1 },
    SILVER      = { minScore = 1, wingScore = 1 },
    BRONZE      = { minScore =  1, wingScore =  1 },
    IRON        = { minScore =    1, wingScore =  1 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3725,
    CHALLENGER  = { minScore = 3593, wingScore = 3650 },
    GRANDMASTER = { minScore = 3498, wingScore = 3535 },
    MASTER      = { minScore = 3354, wingScore = 3413 },
    DIAMOND     = { minScore = 3134, wingScore = 3220 },
    EMERALD     = { minScore = 3020, wingScore = 3061 },
    PLATINUM    = { minScore = 2737, wingScore = 2861 },
    GOLD        = { minScore = 2418, wingScore = 2628 },
    SILVER      = { minScore = 1107, wingScore = 1903 },
    BRONZE      = { minScore =  335, wingScore =  684 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 1,
    CHALLENGER  = { minScore = 1, wingScore = 1 },
    GRANDMASTER = { minScore = 1, wingScore = 1 },
    MASTER      = { minScore = 1, wingScore = 1 },
    DIAMOND     = { minScore = 1, wingScore = 1 },
    EMERALD     = { minScore = 1, wingScore = 1 },
    PLATINUM    = { minScore = 1, wingScore = 1 },
    GOLD        = { minScore = 1, wingScore = 1 },
    SILVER      = { minScore = 1, wingScore = 1 },
    BRONZE      = { minScore =  1, wingScore =  1 },
    IRON        = { minScore =    1, wingScore =  1 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 1,
    CHALLENGER  = { minScore = 1, wingScore = 1 },
    GRANDMASTER = { minScore = 1, wingScore = 1 },
    MASTER      = { minScore = 1, wingScore = 1 },
    DIAMOND     = { minScore = 1, wingScore = 1 },
    EMERALD     = { minScore = 1, wingScore = 1 },
    PLATINUM    = { minScore = 1, wingScore = 1 },
    GOLD        = { minScore = 1, wingScore = 1 },
    SILVER      = { minScore = 1, wingScore = 1 },
    BRONZE      = { minScore =  1, wingScore =  1 },
    IRON        = { minScore =    1, wingScore =  1 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3774,
    CHALLENGER  = { minScore = 3617, wingScore = 3660 },
    GRANDMASTER = { minScore = 3523, wingScore = 3554 },
    MASTER      = { minScore = 3393, wingScore = 3441 },
    DIAMOND     = { minScore = 3183, wingScore = 3268 },
    EMERALD     = { minScore = 3051, wingScore = 3105 },
    PLATINUM    = { minScore = 2778, wingScore = 2924 },
    GOLD        = { minScore = 2502, wingScore = 2654 },
    SILVER      = { minScore = 1233, wingScore = 2022 },
    BRONZE      = { minScore =  351, wingScore =  764 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 1,
    CHALLENGER  = { minScore = 1, wingScore = 1 },
    GRANDMASTER = { minScore = 1, wingScore = 1 },
    MASTER      = { minScore = 1, wingScore = 1 },
    DIAMOND     = { minScore = 1, wingScore = 1 },
    EMERALD     = { minScore = 1, wingScore = 1 },
    PLATINUM    = { minScore = 1, wingScore = 1 },
    GOLD        = { minScore = 1, wingScore = 1 },
    SILVER      = { minScore = 1, wingScore = 1 },
    BRONZE      = { minScore =  1, wingScore =  1 },
    IRON        = { minScore =    1, wingScore =  1 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 1,
    CHALLENGER  = { minScore = 1, wingScore = 1 },
    GRANDMASTER = { minScore = 1, wingScore = 1 },
    MASTER      = { minScore = 1, wingScore = 1 },
    DIAMOND     = { minScore = 1, wingScore = 1 },
    EMERALD     = { minScore = 1, wingScore = 1 },
    PLATINUM    = { minScore = 1, wingScore = 1 },
    GOLD        = { minScore = 1, wingScore = 1 },
    SILVER      = { minScore = 1, wingScore = 1 },
    BRONZE      = { minScore =  1, wingScore =  1 },
    IRON        = { minScore =    1, wingScore =  1 },
}

RR.CUTOFF_REGIONS  = { "eu", "us", "all" }
RR.CUTOFF_FACTIONS = { "all", "horde", "alliance" }

RR.CUTOFF_REGION_LABELS = {
    eu  = "Europe",
    us  = "North America",
    all = "All Regions",
}

RR.CUTOFF_FACTION_LABELS = {
    all      = "All Factions",
    horde    = "Horde",
    alliance = "Alliance",
}

--- Returns the cutoff table for the given region/faction, falling back
--- to eu/all if the selection is unknown (e.g. invalid SavedVariables).
function RR:GetCutoffSet(region, faction)
    local byRegion = self.CUTOFFS[region] or self.CUTOFFS.eu
    return byRegion[faction] or byRegion.all or self.CUTOFFS.eu.all
end
