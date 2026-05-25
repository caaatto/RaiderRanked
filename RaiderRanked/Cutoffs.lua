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
    top100Score = 4149,
    CHALLENGER  = { minScore = 3984, wingScore = 4026 },
    GRANDMASTER = { minScore = 3895, wingScore = 3920 },
    MASTER      = { minScore = 3773, wingScore = 3811 },
    DIAMOND     = { minScore = 3545, wingScore = 3631 },
    EMERALD     = { minScore = 3409, wingScore = 3454 },
    PLATINUM    = { minScore = 3103, wingScore = 3238 },
    GOLD        = { minScore = 2761, wingScore = 2974 },
    SILVER      = { minScore = 1706, wingScore = 2470 },
    BRONZE      = { minScore =  439, wingScore =  1012 },
    IRON        = { minScore =    1, wingScore =  236 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4149,
    CHALLENGER  = { minScore = 3912, wingScore = 4026 },
    GRANDMASTER = { minScore = 3866, wingScore = 3889 },
    MASTER      = { minScore = 3704, wingScore = 3785 },
    DIAMOND     = { minScore = 3573, wingScore = 3639 },
    EMERALD     = { minScore = 3400, wingScore = 3487 },
    PLATINUM    = { minScore = 3118, wingScore = 3235 },
    GOLD        = { minScore = 2761, wingScore = 2927 },
    SILVER      = { minScore = 1706, wingScore = 2470 },
    BRONZE      = { minScore =  439, wingScore =  1012 },
    IRON        = { minScore =    1, wingScore =  236 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4149,
    CHALLENGER  = { minScore = 4016, wingScore = 4026 },
    GRANDMASTER = { minScore = 3969, wingScore = 3992 },
    MASTER      = { minScore = 3807, wingScore = 3888 },
    DIAMOND     = { minScore = 3671, wingScore = 3739 },
    EMERALD     = { minScore = 3489, wingScore = 3580 },
    PLATINUM    = { minScore = 3166, wingScore = 3305 },
    GOLD        = { minScore = 2761, wingScore = 2961 },
    SILVER      = { minScore = 1706, wingScore = 2470 },
    BRONZE      = { minScore =  439, wingScore =  1012 },
    IRON        = { minScore =    1, wingScore =  236 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4073,
    CHALLENGER  = { minScore = 3935, wingScore = 3996 },
    GRANDMASTER = { minScore = 3844, wingScore = 3891 },
    MASTER      = { minScore = 3697, wingScore = 3764 },
    DIAMOND     = { minScore = 3457, wingScore = 3549 },
    EMERALD     = { minScore = 3324, wingScore = 3404 },
    PLATINUM    = { minScore = 3041, wingScore = 3145 },
    GOLD        = { minScore = 2679, wingScore = 2864 },
    SILVER      = { minScore = 1413, wingScore = 2262 },
    BRONZE      = { minScore =  345, wingScore =  827 },
    IRON        = { minScore =    1, wingScore =  176 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4073,
    CHALLENGER  = { minScore = 3860, wingScore = 3996 },
    GRANDMASTER = { minScore = 3807, wingScore = 3834 },
    MASTER      = { minScore = 3622, wingScore = 3714 },
    DIAMOND     = { minScore = 3485, wingScore = 3553 },
    EMERALD     = { minScore = 3302, wingScore = 3393 },
    PLATINUM    = { minScore = 3036, wingScore = 3141 },
    GOLD        = { minScore = 2679, wingScore = 2853 },
    SILVER      = { minScore = 1413, wingScore = 2262 },
    BRONZE      = { minScore =  345, wingScore =  827 },
    IRON        = { minScore =    1, wingScore =  176 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4073,
    CHALLENGER  = { minScore = 3984, wingScore = 3996 },
    GRANDMASTER = { minScore = 3935, wingScore = 3959 },
    MASTER      = { minScore = 3762, wingScore = 3848 },
    DIAMOND     = { minScore = 3610, wingScore = 3686 },
    EMERALD     = { minScore = 3406, wingScore = 3508 },
    PLATINUM    = { minScore = 3108, wingScore = 3226 },
    GOLD        = { minScore = 2679, wingScore = 2906 },
    SILVER      = { minScore = 1413, wingScore = 2262 },
    BRONZE      = { minScore =  345, wingScore =  827 },
    IRON        = { minScore =    1, wingScore =  176 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4149,
    CHALLENGER  = { minScore = 3964, wingScore = 4013 },
    GRANDMASTER = { minScore = 3874, wingScore = 3908 },
    MASTER      = { minScore = 3741, wingScore = 3791 },
    DIAMOND     = { minScore = 3508, wingScore = 3597 },
    EMERALD     = { minScore = 3374, wingScore = 3433 },
    PLATINUM    = { minScore = 3077, wingScore = 3199 },
    GOLD        = { minScore = 2727, wingScore = 2928 },
    SILVER      = { minScore = 1584, wingScore = 2383 },
    BRONZE      = { minScore =  400, wingScore =  935 },
    IRON        = { minScore =    1, wingScore =  211 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4149,
    CHALLENGER  = { minScore = 3891, wingScore = 4014 },
    GRANDMASTER = { minScore = 3842, wingScore = 3867 },
    MASTER      = { minScore = 3671, wingScore = 3756 },
    DIAMOND     = { minScore = 3537, wingScore = 3604 },
    EMERALD     = { minScore = 3360, wingScore = 3449 },
    PLATINUM    = { minScore = 3085, wingScore = 3197 },
    GOLD        = { minScore = 2728, wingScore = 2897 },
    SILVER      = { minScore = 1587, wingScore = 2386 },
    BRONZE      = { minScore =  401, wingScore =  937 },
    IRON        = { minScore =    1, wingScore =  212 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4149,
    CHALLENGER  = { minScore = 4002, wingScore = 4013 },
    GRANDMASTER = { minScore = 3954, wingScore = 3978 },
    MASTER      = { minScore = 3788, wingScore = 3871 },
    DIAMOND     = { minScore = 3645, wingScore = 3716 },
    EMERALD     = { minScore = 3453, wingScore = 3549 },
    PLATINUM    = { minScore = 3141, wingScore = 3271 },
    GOLD        = { minScore = 2726, wingScore = 2937 },
    SILVER      = { minScore = 1580, wingScore = 2381 },
    BRONZE      = { minScore =  399, wingScore =  933 },
    IRON        = { minScore =    1, wingScore =  210 },
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
