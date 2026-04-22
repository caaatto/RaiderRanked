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
    top100Score = 3840,
    CHALLENGER  = { minScore = 3700, wingScore = 3757 },
    GRANDMASTER = { minScore = 3624, wingScore = 3655 },
    MASTER      = { minScore = 3503, wingScore = 3545 },
    DIAMOND     = { minScore = 3309, wingScore = 3383 },
    EMERALD     = { minScore = 3161, wingScore = 3225 },
    PLATINUM    = { minScore = 2919, wingScore = 3028 },
    GOLD        = { minScore = 2631, wingScore = 2728 },
    SILVER      = { minScore = 1447, wingScore = 2228 },
    BRONZE      = { minScore =  365, wingScore =  873 },
    IRON        = { minScore =    1, wingScore =  197 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3840,
    CHALLENGER  = { minScore = 3654, wingScore = 3757 },
    GRANDMASTER = { minScore = 3608, wingScore = 3631 },
    MASTER      = { minScore = 3448, wingScore = 3528 },
    DIAMOND     = { minScore = 3324, wingScore = 3386 },
    EMERALD     = { minScore = 3159, wingScore = 3242 },
    PLATINUM    = { minScore = 2883, wingScore = 2999 },
    GOLD        = { minScore = 2631, wingScore = 2732 },
    SILVER      = { minScore = 1447, wingScore = 2228 },
    BRONZE      = { minScore =  365, wingScore =  873 },
    IRON        = { minScore =    1, wingScore =  197 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3840,
    CHALLENGER  = { minScore = 3742, wingScore = 3757 },
    GRANDMASTER = { minScore = 3697, wingScore = 3720 },
    MASTER      = { minScore = 3541, wingScore = 3619 },
    DIAMOND     = { minScore = 3406, wingScore = 3474 },
    EMERALD     = { minScore = 3227, wingScore = 3317 },
    PLATINUM    = { minScore = 2933, wingScore = 3056 },
    GOLD        = { minScore = 2631, wingScore = 2767 },
    SILVER      = { minScore = 1447, wingScore = 2228 },
    BRONZE      = { minScore =  365, wingScore =  873 },
    IRON        = { minScore =    1, wingScore =  197 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3790,
    CHALLENGER  = { minScore = 3668, wingScore = 3719 },
    GRANDMASTER = { minScore = 3565, wingScore = 3605 },
    MASTER      = { minScore = 3433, wingScore = 3484 },
    DIAMOND     = { minScore = 3217, wingScore = 3306 },
    EMERALD     = { minScore = 3074, wingScore = 3133 },
    PLATINUM    = { minScore = 2813, wingScore = 2975 },
    GOLD        = { minScore = 2523, wingScore = 2667 },
    SILVER      = { minScore = 1212, wingScore = 2028 },
    BRONZE      = { minScore =  335, wingScore =  712 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3790,
    CHALLENGER  = { minScore = 3584, wingScore = 3719 },
    GRANDMASTER = { minScore = 3537, wingScore = 3560 },
    MASTER      = { minScore = 3369, wingScore = 3453 },
    DIAMOND     = { minScore = 3251, wingScore = 3310 },
    EMERALD     = { minScore = 3094, wingScore = 3173 },
    PLATINUM    = { minScore = 2809, wingScore = 2933 },
    GOLD        = { minScore = 2523, wingScore = 2635 },
    SILVER      = { minScore = 1212, wingScore = 2028 },
    BRONZE      = { minScore =  335, wingScore =  712 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3790,
    CHALLENGER  = { minScore = 3705, wingScore = 3719 },
    GRANDMASTER = { minScore = 3655, wingScore = 3680 },
    MASTER      = { minScore = 3480, wingScore = 3568 },
    DIAMOND     = { minScore = 3340, wingScore = 3410 },
    EMERALD     = { minScore = 3153, wingScore = 3247 },
    PLATINUM    = { minScore = 2852, wingScore = 2977 },
    GOLD        = { minScore = 2523, wingScore = 2684 },
    SILVER      = { minScore = 1212, wingScore = 2028 },
    BRONZE      = { minScore =  335, wingScore =  712 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3840,
    CHALLENGER  = { minScore = 3687, wingScore = 3741 },
    GRANDMASTER = { minScore = 3599, wingScore = 3634 },
    MASTER      = { minScore = 3474, wingScore = 3519 },
    DIAMOND     = { minScore = 3271, wingScore = 3351 },
    EMERALD     = { minScore = 3125, wingScore = 3187 },
    PLATINUM    = { minScore = 2875, wingScore = 3006 },
    GOLD        = { minScore = 2586, wingScore = 2702 },
    SILVER      = { minScore = 1349, wingScore = 2144 },
    BRONZE      = { minScore =  352, wingScore =  806 },
    IRON        = { minScore =    1, wingScore =  186 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3840,
    CHALLENGER  = { minScore = 3626, wingScore = 3742 },
    GRANDMASTER = { minScore = 3579, wingScore = 3602 },
    MASTER      = { minScore = 3416, wingScore = 3498 },
    DIAMOND     = { minScore = 3294, wingScore = 3355 },
    EMERALD     = { minScore = 3133, wingScore = 3214 },
    PLATINUM    = { minScore = 2853, wingScore = 2972 },
    GOLD        = { minScore = 2587, wingScore = 2693 },
    SILVER      = { minScore = 1352, wingScore = 2147 },
    BRONZE      = { minScore =  353, wingScore =  808 },
    IRON        = { minScore =    1, wingScore =  186 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3840,
    CHALLENGER  = { minScore = 3726, wingScore = 3741 },
    GRANDMASTER = { minScore = 3679, wingScore = 3703 },
    MASTER      = { minScore = 3515, wingScore = 3597 },
    DIAMOND     = { minScore = 3378, wingScore = 3446 },
    EMERALD     = { minScore = 3195, wingScore = 3287 },
    PLATINUM    = { minScore = 2898, wingScore = 3022 },
    GOLD        = { minScore = 2584, wingScore = 2731 },
    SILVER      = { minScore = 1346, wingScore = 2142 },
    BRONZE      = { minScore =  352, wingScore =  804 },
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
