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
    top100Score = 4012,
    CHALLENGER  = { minScore = 3861, wingScore = 3897 },
    GRANDMASTER = { minScore = 3775, wingScore = 3797 },
    MASTER      = { minScore = 3653, wingScore = 3692 },
    DIAMOND     = { minScore = 3437, wingScore = 3524 },
    EMERALD     = { minScore = 3305, wingScore = 3366 },
    PLATINUM    = { minScore = 3032, wingScore = 3135 },
    GOLD        = { minScore = 2691, wingScore = 2850 },
    SILVER      = { minScore = 1616, wingScore = 2362 },
    BRONZE      = { minScore =  399, wingScore =  970 },
    IRON        = { minScore =    1, wingScore =  226 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4012,
    CHALLENGER  = { minScore = 3791, wingScore = 3897 },
    GRANDMASTER = { minScore = 3745, wingScore = 3768 },
    MASTER      = { minScore = 3586, wingScore = 3666 },
    DIAMOND     = { minScore = 3459, wingScore = 3523 },
    EMERALD     = { minScore = 3289, wingScore = 3374 },
    PLATINUM    = { minScore = 3023, wingScore = 3132 },
    GOLD        = { minScore = 2691, wingScore = 2848 },
    SILVER      = { minScore = 1616, wingScore = 2362 },
    BRONZE      = { minScore =  399, wingScore =  970 },
    IRON        = { minScore =    1, wingScore =  226 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4012,
    CHALLENGER  = { minScore = 3893, wingScore = 3897 },
    GRANDMASTER = { minScore = 3847, wingScore = 3870 },
    MASTER      = { minScore = 3687, wingScore = 3767 },
    DIAMOND     = { minScore = 3552, wingScore = 3619 },
    EMERALD     = { minScore = 3371, wingScore = 3461 },
    PLATINUM    = { minScore = 3089, wingScore = 3204 },
    GOLD        = { minScore = 2691, wingScore = 2897 },
    SILVER      = { minScore = 1616, wingScore = 2362 },
    BRONZE      = { minScore =  399, wingScore =  970 },
    IRON        = { minScore =    1, wingScore =  226 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3939,
    CHALLENGER  = { minScore = 3818, wingScore = 3884 },
    GRANDMASTER = { minScore = 3720, wingScore = 3768 },
    MASTER      = { minScore = 3578, wingScore = 3642 },
    DIAMOND     = { minScore = 3372, wingScore = 3442 },
    EMERALD     = { minScore = 3210, wingScore = 3284 },
    PLATINUM    = { minScore = 2988, wingScore = 3062 },
    GOLD        = { minScore = 2633, wingScore = 2762 },
    SILVER      = { minScore = 1332, wingScore = 2166 },
    BRONZE      = { minScore =  339, wingScore =  777 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3939,
    CHALLENGER  = { minScore = 3736, wingScore = 3884 },
    GRANDMASTER = { minScore = 3686, wingScore = 3711 },
    MASTER      = { minScore = 3511, wingScore = 3599 },
    DIAMOND     = { minScore = 3377, wingScore = 3444 },
    EMERALD     = { minScore = 3199, wingScore = 3288 },
    PLATINUM    = { minScore = 2920, wingScore = 3034 },
    GOLD        = { minScore = 2633, wingScore = 2755 },
    SILVER      = { minScore = 1332, wingScore = 2166 },
    BRONZE      = { minScore =  339, wingScore =  777 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3939,
    CHALLENGER  = { minScore = 3871, wingScore = 3884 },
    GRANDMASTER = { minScore = 3819, wingScore = 3845 },
    MASTER      = { minScore = 3638, wingScore = 3729 },
    DIAMOND     = { minScore = 3489, wingScore = 3563 },
    EMERALD     = { minScore = 3290, wingScore = 3390 },
    PLATINUM    = { minScore = 2992, wingScore = 3112 },
    GOLD        = { minScore = 2633, wingScore = 2811 },
    SILVER      = { minScore = 1332, wingScore = 2166 },
    BRONZE      = { minScore =  339, wingScore =  777 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4012,
    CHALLENGER  = { minScore = 3843, wingScore = 3892 },
    GRANDMASTER = { minScore = 3752, wingScore = 3785 },
    MASTER      = { minScore = 3622, wingScore = 3671 },
    DIAMOND     = { minScore = 3410, wingScore = 3490 },
    EMERALD     = { minScore = 3265, wingScore = 3332 },
    PLATINUM    = { minScore = 3014, wingScore = 3105 },
    GOLD        = { minScore = 2667, wingScore = 2813 },
    SILVER      = { minScore = 1497, wingScore = 2280 },
    BRONZE      = { minScore =  374, wingScore =  889 },
    IRON        = { minScore =    1, wingScore =  203 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4012,
    CHALLENGER  = { minScore = 3769, wingScore = 3892 },
    GRANDMASTER = { minScore = 3721, wingScore = 3745 },
    MASTER      = { minScore = 3556, wingScore = 3639 },
    DIAMOND     = { minScore = 3426, wingScore = 3491 },
    EMERALD     = { minScore = 3252, wingScore = 3339 },
    PLATINUM    = { minScore = 2981, wingScore = 3092 },
    GOLD        = { minScore = 2667, wingScore = 2810 },
    SILVER      = { minScore = 1501, wingScore = 2282 },
    BRONZE      = { minScore =  375, wingScore =  892 },
    IRON        = { minScore =    1, wingScore =  203 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4012,
    CHALLENGER  = { minScore = 3884, wingScore = 3891 },
    GRANDMASTER = { minScore = 3835, wingScore = 3859 },
    MASTER      = { minScore = 3666, wingScore = 3751 },
    DIAMOND     = { minScore = 3525, wingScore = 3595 },
    EMERALD     = { minScore = 3336, wingScore = 3430 },
    PLATINUM    = { minScore = 3047, wingScore = 3164 },
    GOLD        = { minScore = 2666, wingScore = 2860 },
    SILVER      = { minScore = 1494, wingScore = 2278 },
    BRONZE      = { minScore =  373, wingScore =  887 },
    IRON        = { minScore =    1, wingScore =  202 },
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
