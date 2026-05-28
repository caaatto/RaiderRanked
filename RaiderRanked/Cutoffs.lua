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
    top100Score = 4164,
    CHALLENGER  = { minScore = 4007, wingScore = 4039 },
    GRANDMASTER = { minScore = 3904, wingScore = 3938 },
    MASTER      = { minScore = 3781, wingScore = 3830 },
    DIAMOND     = { minScore = 3554, wingScore = 3649 },
    EMERALD     = { minScore = 3415, wingScore = 3465 },
    PLATINUM    = { minScore = 3112, wingScore = 3250 },
    GOLD        = { minScore = 2771, wingScore = 2986 },
    SILVER      = { minScore = 1723, wingScore = 2485 },
    BRONZE      = { minScore =  448, wingScore =  1022 },
    IRON        = { minScore =    1, wingScore =  239 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4164,
    CHALLENGER  = { minScore = 3926, wingScore = 4039 },
    GRANDMASTER = { minScore = 3880, wingScore = 3903 },
    MASTER      = { minScore = 3719, wingScore = 3800 },
    DIAMOND     = { minScore = 3587, wingScore = 3653 },
    EMERALD     = { minScore = 3411, wingScore = 3499 },
    PLATINUM    = { minScore = 3124, wingScore = 3244 },
    GOLD        = { minScore = 2771, wingScore = 2933 },
    SILVER      = { minScore = 1723, wingScore = 2485 },
    BRONZE      = { minScore =  448, wingScore =  1022 },
    IRON        = { minScore =    1, wingScore =  239 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4164,
    CHALLENGER  = { minScore = 4028, wingScore = 4039 },
    GRANDMASTER = { minScore = 3983, wingScore = 4005 },
    MASTER      = { minScore = 3824, wingScore = 3904 },
    DIAMOND     = { minScore = 3685, wingScore = 3755 },
    EMERALD     = { minScore = 3499, wingScore = 3592 },
    PLATINUM    = { minScore = 3173, wingScore = 3313 },
    GOLD        = { minScore = 2771, wingScore = 2970 },
    SILVER      = { minScore = 1723, wingScore = 2485 },
    BRONZE      = { minScore =  448, wingScore =  1022 },
    IRON        = { minScore =    1, wingScore =  239 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4105,
    CHALLENGER  = { minScore = 3955, wingScore = 4014 },
    GRANDMASTER = { minScore = 3866, wingScore = 3898 },
    MASTER      = { minScore = 3714, wingScore = 3776 },
    DIAMOND     = { minScore = 3469, wingScore = 3560 },
    EMERALD     = { minScore = 3337, wingScore = 3409 },
    PLATINUM    = { minScore = 3048, wingScore = 3156 },
    GOLD        = { minScore = 2686, wingScore = 2876 },
    SILVER      = { minScore = 1429, wingScore = 2277 },
    BRONZE      = { minScore =  348, wingScore =  834 },
    IRON        = { minScore =    1, wingScore =  179 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4105,
    CHALLENGER  = { minScore = 3878, wingScore = 4014 },
    GRANDMASTER = { minScore = 3825, wingScore = 3851 },
    MASTER      = { minScore = 3639, wingScore = 3732 },
    DIAMOND     = { minScore = 3500, wingScore = 3570 },
    EMERALD     = { minScore = 3314, wingScore = 3407 },
    PLATINUM    = { minScore = 3050, wingScore = 3153 },
    GOLD        = { minScore = 2686, wingScore = 2865 },
    SILVER      = { minScore = 1429, wingScore = 2277 },
    BRONZE      = { minScore =  348, wingScore =  834 },
    IRON        = { minScore =    1, wingScore =  179 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4105,
    CHALLENGER  = { minScore = 4010, wingScore = 4014 },
    GRANDMASTER = { minScore = 3958, wingScore = 3984 },
    MASTER      = { minScore = 3776, wingScore = 3867 },
    DIAMOND     = { minScore = 3623, wingScore = 3699 },
    EMERALD     = { minScore = 3419, wingScore = 3521 },
    PLATINUM    = { minScore = 3115, wingScore = 3236 },
    GOLD        = { minScore = 2686, wingScore = 2913 },
    SILVER      = { minScore = 1429, wingScore = 2277 },
    BRONZE      = { minScore =  348, wingScore =  834 },
    IRON        = { minScore =    1, wingScore =  179 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4164,
    CHALLENGER  = { minScore = 3985, wingScore = 4029 },
    GRANDMASTER = { minScore = 3888, wingScore = 3921 },
    MASTER      = { minScore = 3753, wingScore = 3807 },
    DIAMOND     = { minScore = 3519, wingScore = 3612 },
    EMERALD     = { minScore = 3382, wingScore = 3442 },
    PLATINUM    = { minScore = 3085, wingScore = 3211 },
    GOLD        = { minScore = 2736, wingScore = 2940 },
    SILVER      = { minScore = 1600, wingScore = 2398 },
    BRONZE      = { minScore =  406, wingScore =  944 },
    IRON        = { minScore =    1, wingScore =  214 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4164,
    CHALLENGER  = { minScore = 3907, wingScore = 4029 },
    GRANDMASTER = { minScore = 3858, wingScore = 3882 },
    MASTER      = { minScore = 3687, wingScore = 3772 },
    DIAMOND     = { minScore = 3552, wingScore = 3619 },
    EMERALD     = { minScore = 3372, wingScore = 3462 },
    PLATINUM    = { minScore = 3094, wingScore = 3207 },
    GOLD        = { minScore = 2736, wingScore = 2905 },
    SILVER      = { minScore = 1604, wingScore = 2401 },
    BRONZE      = { minScore =  407, wingScore =  946 },
    IRON        = { minScore =    1, wingScore =  215 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4164,
    CHALLENGER  = { minScore = 4020, wingScore = 4028 },
    GRANDMASTER = { minScore = 3972, wingScore = 3996 },
    MASTER      = { minScore = 3803, wingScore = 3888 },
    DIAMOND     = { minScore = 3658, wingScore = 3731 },
    EMERALD     = { minScore = 3465, wingScore = 3562 },
    PLATINUM    = { minScore = 3148, wingScore = 3280 },
    GOLD        = { minScore = 2735, wingScore = 2946 },
    SILVER      = { minScore = 1597, wingScore = 2396 },
    BRONZE      = { minScore =  405, wingScore =  941 },
    IRON        = { minScore =    1, wingScore =  213 },
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
