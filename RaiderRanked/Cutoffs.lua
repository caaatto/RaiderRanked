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
    top100Score = 3835,
    CHALLENGER  = { minScore = 3690, wingScore = 3749 },
    GRANDMASTER = { minScore = 3615, wingScore = 3651 },
    MASTER      = { minScore = 3494, wingScore = 3541 },
    DIAMOND     = { minScore = 3304, wingScore = 3374 },
    EMERALD     = { minScore = 3155, wingScore = 3219 },
    PLATINUM    = { minScore = 2912, wingScore = 3025 },
    GOLD        = { minScore = 2627, wingScore = 2724 },
    SILVER      = { minScore = 1439, wingScore = 2218 },
    BRONZE      = { minScore =  368, wingScore =  871 },
    IRON        = { minScore =    1, wingScore =  197 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3835,
    CHALLENGER  = { minScore = 3650, wingScore = 3749 },
    GRANDMASTER = { minScore = 3603, wingScore = 3626 },
    MASTER      = { minScore = 3441, wingScore = 3522 },
    DIAMOND     = { minScore = 3318, wingScore = 3379 },
    EMERALD     = { minScore = 3154, wingScore = 3236 },
    PLATINUM    = { minScore = 2879, wingScore = 2995 },
    GOLD        = { minScore = 2627, wingScore = 2727 },
    SILVER      = { minScore = 1439, wingScore = 2218 },
    BRONZE      = { minScore =  368, wingScore =  871 },
    IRON        = { minScore =    1, wingScore =  197 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3835,
    CHALLENGER  = { minScore = 3732, wingScore = 3749 },
    GRANDMASTER = { minScore = 3688, wingScore = 3710 },
    MASTER      = { minScore = 3537, wingScore = 3613 },
    DIAMOND     = { minScore = 3402, wingScore = 3470 },
    EMERALD     = { minScore = 3222, wingScore = 3312 },
    PLATINUM    = { minScore = 2927, wingScore = 3050 },
    GOLD        = { minScore = 2627, wingScore = 2762 },
    SILVER      = { minScore = 1439, wingScore = 2218 },
    BRONZE      = { minScore =  368, wingScore =  871 },
    IRON        = { minScore =    1, wingScore =  197 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3785,
    CHALLENGER  = { minScore = 3663, wingScore = 3712 },
    GRANDMASTER = { minScore = 3560, wingScore = 3600 },
    MASTER      = { minScore = 3429, wingScore = 3478 },
    DIAMOND     = { minScore = 3214, wingScore = 3303 },
    EMERALD     = { minScore = 3071, wingScore = 3129 },
    PLATINUM    = { minScore = 2809, wingScore = 2970 },
    GOLD        = { minScore = 2515, wingScore = 2664 },
    SILVER      = { minScore = 1204, wingScore = 2021 },
    BRONZE      = { minScore =  336, wingScore =  710 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3785,
    CHALLENGER  = { minScore = 3577, wingScore = 3712 },
    GRANDMASTER = { minScore = 3529, wingScore = 3553 },
    MASTER      = { minScore = 3362, wingScore = 3445 },
    DIAMOND     = { minScore = 3246, wingScore = 3304 },
    EMERALD     = { minScore = 3091, wingScore = 3168 },
    PLATINUM    = { minScore = 2806, wingScore = 2931 },
    GOLD        = { minScore = 2515, wingScore = 2628 },
    SILVER      = { minScore = 1204, wingScore = 2021 },
    BRONZE      = { minScore =  336, wingScore =  710 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3785,
    CHALLENGER  = { minScore = 3700, wingScore = 3712 },
    GRANDMASTER = { minScore = 3650, wingScore = 3675 },
    MASTER      = { minScore = 3474, wingScore = 3562 },
    DIAMOND     = { minScore = 3335, wingScore = 3404 },
    EMERALD     = { minScore = 3149, wingScore = 3242 },
    PLATINUM    = { minScore = 2849, wingScore = 2973 },
    GOLD        = { minScore = 2515, wingScore = 2679 },
    SILVER      = { minScore = 1204, wingScore = 2021 },
    BRONZE      = { minScore =  336, wingScore =  710 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3835,
    CHALLENGER  = { minScore = 3679, wingScore = 3733 },
    GRANDMASTER = { minScore = 3592, wingScore = 3630 },
    MASTER      = { minScore = 3467, wingScore = 3515 },
    DIAMOND     = { minScore = 3266, wingScore = 3344 },
    EMERALD     = { minScore = 3120, wingScore = 3181 },
    PLATINUM    = { minScore = 2869, wingScore = 3002 },
    GOLD        = { minScore = 2580, wingScore = 2699 },
    SILVER      = { minScore = 1340, wingScore = 2135 },
    BRONZE      = { minScore =  355, wingScore =  803 },
    IRON        = { minScore =    1, wingScore =  186 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3835,
    CHALLENGER  = { minScore = 3620, wingScore = 3734 },
    GRANDMASTER = { minScore = 3573, wingScore = 3596 },
    MASTER      = { minScore = 3409, wingScore = 3491 },
    DIAMOND     = { minScore = 3289, wingScore = 3348 },
    EMERALD     = { minScore = 3128, wingScore = 3208 },
    PLATINUM    = { minScore = 2849, wingScore = 2969 },
    GOLD        = { minScore = 2581, wingScore = 2687 },
    SILVER      = { minScore = 1343, wingScore = 2138 },
    BRONZE      = { minScore =  355, wingScore =  805 },
    IRON        = { minScore =    1, wingScore =  186 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3835,
    CHALLENGER  = { minScore = 3718, wingScore = 3733 },
    GRANDMASTER = { minScore = 3672, wingScore = 3695 },
    MASTER      = { minScore = 3510, wingScore = 3591 },
    DIAMOND     = { minScore = 3373, wingScore = 3441 },
    EMERALD     = { minScore = 3190, wingScore = 3282 },
    PLATINUM    = { minScore = 2893, wingScore = 3017 },
    GOLD        = { minScore = 2579, wingScore = 2726 },
    SILVER      = { minScore = 1337, wingScore = 2133 },
    BRONZE      = { minScore =  354, wingScore =  801 },
    IRON        = { minScore =    1, wingScore =  185 },
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

-- Compact labels used in the rank frame subtitle (where space is tight).
RR.CUTOFF_REGION_SHORT = {
    eu  = "EU",
    us  = "NA",
    all = "All",
}
RR.CUTOFF_FACTION_SHORT = {
    all      = "All",
    horde    = "Horde",
    alliance = "Alliance",
}

--- Returns the cutoff table for the given region/faction, falling back
--- to eu/all if the selection is unknown (e.g. invalid SavedVariables).
function RR:GetCutoffSet(region, faction)
    local byRegion = self.CUTOFFS[region] or self.CUTOFFS.eu
    return byRegion[faction] or byRegion.all or self.CUTOFFS.eu.all
end
