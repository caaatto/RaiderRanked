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
    top100Score = 4256,
    CHALLENGER  = { minScore = 4096, wingScore = 4138 },
    GRANDMASTER = { minScore = 4007, wingScore = 4026 },
    MASTER      = { minScore = 3866, wingScore = 3911 },
    DIAMOND     = { minScore = 3623, wingScore = 3718 },
    EMERALD     = { minScore = 3455, wingScore = 3534 },
    PLATINUM    = { minScore = 3164, wingScore = 3318 },
    GOLD        = { minScore = 2824, wingScore = 3018 },
    SILVER      = { minScore = 1798, wingScore = 2547 },
    BRONZE      = { minScore =  483, wingScore =  1067 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4256,
    CHALLENGER  = { minScore = 4013, wingScore = 4138 },
    GRANDMASTER = { minScore = 3965, wingScore = 3989 },
    MASTER      = { minScore = 3794, wingScore = 3879 },
    DIAMOND     = { minScore = 3663, wingScore = 3728 },
    EMERALD     = { minScore = 3488, wingScore = 3575 },
    PLATINUM    = { minScore = 3168, wingScore = 3307 },
    GOLD        = { minScore = 2824, wingScore = 2967 },
    SILVER      = { minScore = 1798, wingScore = 2547 },
    BRONZE      = { minScore =  483, wingScore =  1067 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4256,
    CHALLENGER  = { minScore = 4135, wingScore = 4138 },
    GRANDMASTER = { minScore = 4085, wingScore = 4110 },
    MASTER      = { minScore = 3910, wingScore = 3997 },
    DIAMOND     = { minScore = 3754, wingScore = 3832 },
    EMERALD     = { minScore = 3547, wingScore = 3650 },
    PLATINUM    = { minScore = 3213, wingScore = 3351 },
    GOLD        = { minScore = 2824, wingScore = 3016 },
    SILVER      = { minScore = 1798, wingScore = 2547 },
    BRONZE      = { minScore =  483, wingScore =  1067 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4209,
    CHALLENGER  = { minScore = 4047, wingScore = 4126 },
    GRANDMASTER = { minScore = 3949, wingScore = 3997 },
    MASTER      = { minScore = 3804, wingScore = 3869 },
    DIAMOND     = { minScore = 3540, wingScore = 3648 },
    EMERALD     = { minScore = 3408, wingScore = 3445 },
    PLATINUM    = { minScore = 3084, wingScore = 3216 },
    GOLD        = { minScore = 2726, wingScore = 2949 },
    SILVER      = { minScore = 1492, wingScore = 2335 },
    BRONZE      = { minScore =  361, wingScore =  866 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4209,
    CHALLENGER  = { minScore = 3954, wingScore = 4126 },
    GRANDMASTER = { minScore = 3901, wingScore = 3927 },
    MASTER      = { minScore = 3718, wingScore = 3809 },
    DIAMOND     = { minScore = 3576, wingScore = 3647 },
    EMERALD     = { minScore = 3387, wingScore = 3481 },
    PLATINUM    = { minScore = 3104, wingScore = 3217 },
    GOLD        = { minScore = 2726, wingScore = 2908 },
    SILVER      = { minScore = 1492, wingScore = 2335 },
    BRONZE      = { minScore =  361, wingScore =  866 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4209,
    CHALLENGER  = { minScore = 4105, wingScore = 4126 },
    GRANDMASTER = { minScore = 4053, wingScore = 4079 },
    MASTER      = { minScore = 3868, wingScore = 3961 },
    DIAMOND     = { minScore = 3713, wingScore = 3791 },
    EMERALD     = { minScore = 3506, wingScore = 3609 },
    PLATINUM    = { minScore = 3161, wingScore = 3306 },
    GOLD        = { minScore = 2726, wingScore = 2945 },
    SILVER      = { minScore = 1492, wingScore = 2335 },
    BRONZE      = { minScore =  361, wingScore =  866 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4256,
    CHALLENGER  = { minScore = 4075, wingScore = 4133 },
    GRANDMASTER = { minScore = 3983, wingScore = 4014 },
    MASTER      = { minScore = 3840, wingScore = 3893 },
    DIAMOND     = { minScore = 3588, wingScore = 3689 },
    EMERALD     = { minScore = 3435, wingScore = 3497 },
    PLATINUM    = { minScore = 3130, wingScore = 3275 },
    GOLD        = { minScore = 2783, wingScore = 2989 },
    SILVER      = { minScore = 1670, wingScore = 2458 },
    BRONZE      = { minScore =  432, wingScore =  983 },
    IRON        = { minScore =    1, wingScore =  220 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4256,
    CHALLENGER  = { minScore = 3989, wingScore = 4133 },
    GRANDMASTER = { minScore = 3939, wingScore = 3964 },
    MASTER      = { minScore = 3763, wingScore = 3850 },
    DIAMOND     = { minScore = 3627, wingScore = 3695 },
    EMERALD     = { minScore = 3447, wingScore = 3537 },
    PLATINUM    = { minScore = 3142, wingScore = 3270 },
    GOLD        = { minScore = 2784, wingScore = 2943 },
    SILVER      = { minScore = 1673, wingScore = 2460 },
    BRONZE      = { minScore =  433, wingScore =  985 },
    IRON        = { minScore =    1, wingScore =  221 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4256,
    CHALLENGER  = { minScore = 4122, wingScore = 4133 },
    GRANDMASTER = { minScore = 4071, wingScore = 4097 },
    MASTER      = { minScore = 3892, wingScore = 3981 },
    DIAMOND     = { minScore = 3736, wingScore = 3814 },
    EMERALD     = { minScore = 3529, wingScore = 3632 },
    PLATINUM    = { minScore = 3191, wingScore = 3332 },
    GOLD        = { minScore = 2782, wingScore = 2985 },
    SILVER      = { minScore = 1666, wingScore = 2456 },
    BRONZE      = { minScore =  430, wingScore =  980 },
    IRON        = { minScore =    1, wingScore =  219 },
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
