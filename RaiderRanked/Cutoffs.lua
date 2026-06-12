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
    top100Score = 4217,
    CHALLENGER  = { minScore = 4045, wingScore = 4102 },
    GRANDMASTER = { minScore = 3965, wingScore = 4008 },
    MASTER      = { minScore = 3829, wingScore = 3890 },
    DIAMOND     = { minScore = 3595, wingScore = 3687 },
    EMERALD     = { minScore = 3439, wingScore = 3508 },
    PLATINUM    = { minScore = 3145, wingScore = 3296 },
    GOLD        = { minScore = 2804, wingScore = 3010 },
    SILVER      = { minScore = 1773, wingScore = 2526 },
    BRONZE      = { minScore =  481, wingScore =  1053 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4217,
    CHALLENGER  = { minScore = 3985, wingScore = 4102 },
    GRANDMASTER = { minScore = 3938, wingScore = 3962 },
    MASTER      = { minScore = 3775, wingScore = 3857 },
    DIAMOND     = { minScore = 3639, wingScore = 3707 },
    EMERALD     = { minScore = 3458, wingScore = 3548 },
    PLATINUM    = { minScore = 3150, wingScore = 3280 },
    GOLD        = { minScore = 2804, wingScore = 2955 },
    SILVER      = { minScore = 1773, wingScore = 2526 },
    BRONZE      = { minScore =  481, wingScore =  1053 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4217,
    CHALLENGER  = { minScore = 4091, wingScore = 4102 },
    GRANDMASTER = { minScore = 4045, wingScore = 4068 },
    MASTER      = { minScore = 3888, wingScore = 3967 },
    DIAMOND     = { minScore = 3735, wingScore = 3811 },
    EMERALD     = { minScore = 3531, wingScore = 3633 },
    PLATINUM    = { minScore = 3198, wingScore = 3337 },
    GOLD        = { minScore = 2804, wingScore = 3000 },
    SILVER      = { minScore = 1773, wingScore = 2526 },
    BRONZE      = { minScore =  481, wingScore =  1053 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4170,
    CHALLENGER  = { minScore = 4016, wingScore = 4062 },
    GRANDMASTER = { minScore = 3910, wingScore = 3953 },
    MASTER      = { minScore = 3775, wingScore = 3827 },
    DIAMOND     = { minScore = 3514, wingScore = 3613 },
    EMERALD     = { minScore = 3399, wingScore = 3431 },
    PLATINUM    = { minScore = 3071, wingScore = 3196 },
    GOLD        = { minScore = 2711, wingScore = 2923 },
    SILVER      = { minScore = 1473, wingScore = 2317 },
    BRONZE      = { minScore =  360, wingScore =  858 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4170,
    CHALLENGER  = { minScore = 3919, wingScore = 4062 },
    GRANDMASTER = { minScore = 3867, wingScore = 3893 },
    MASTER      = { minScore = 3684, wingScore = 3775 },
    DIAMOND     = { minScore = 3544, wingScore = 3614 },
    EMERALD     = { minScore = 3358, wingScore = 3451 },
    PLATINUM    = { minScore = 3091, wingScore = 3195 },
    GOLD        = { minScore = 2711, wingScore = 2898 },
    SILVER      = { minScore = 1473, wingScore = 2317 },
    BRONZE      = { minScore =  360, wingScore =  858 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4170,
    CHALLENGER  = { minScore = 4054, wingScore = 4062 },
    GRANDMASTER = { minScore = 4004, wingScore = 4029 },
    MASTER      = { minScore = 3826, wingScore = 3915 },
    DIAMOND     = { minScore = 3674, wingScore = 3750 },
    EMERALD     = { minScore = 3471, wingScore = 3572 },
    PLATINUM    = { minScore = 3143, wingScore = 3279 },
    GOLD        = { minScore = 2711, wingScore = 2933 },
    SILVER      = { minScore = 1473, wingScore = 2317 },
    BRONZE      = { minScore =  360, wingScore =  858 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4217,
    CHALLENGER  = { minScore = 4033, wingScore = 4085 },
    GRANDMASTER = { minScore = 3942, wingScore = 3985 },
    MASTER      = { minScore = 3806, wingScore = 3864 },
    DIAMOND     = { minScore = 3561, wingScore = 3656 },
    EMERALD     = { minScore = 3422, wingScore = 3476 },
    PLATINUM    = { minScore = 3114, wingScore = 3254 },
    GOLD        = { minScore = 2765, wingScore = 2974 },
    SILVER      = { minScore = 1648, wingScore = 2439 },
    BRONZE      = { minScore =  430, wingScore =  971 },
    IRON        = { minScore =    1, wingScore =  220 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4217,
    CHALLENGER  = { minScore = 3958, wingScore = 4086 },
    GRANDMASTER = { minScore = 3909, wingScore = 3934 },
    MASTER      = { minScore = 3738, wingScore = 3824 },
    DIAMOND     = { minScore = 3600, wingScore = 3669 },
    EMERALD     = { minScore = 3417, wingScore = 3509 },
    PLATINUM    = { minScore = 3126, wingScore = 3245 },
    GOLD        = { minScore = 2766, wingScore = 2932 },
    SILVER      = { minScore = 1651, wingScore = 2441 },
    BRONZE      = { minScore =  432, wingScore =  974 },
    IRON        = { minScore =    1, wingScore =  221 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4217,
    CHALLENGER  = { minScore = 4075, wingScore = 4085 },
    GRANDMASTER = { minScore = 4027, wingScore = 4051 },
    MASTER      = { minScore = 3861, wingScore = 3945 },
    DIAMOND     = { minScore = 3709, wingScore = 3785 },
    EMERALD     = { minScore = 3505, wingScore = 3607 },
    PLATINUM    = { minScore = 3174, wingScore = 3312 },
    GOLD        = { minScore = 2764, wingScore = 2971 },
    SILVER      = { minScore = 1644, wingScore = 2436 },
    BRONZE      = { minScore =  429, wingScore =  969 },
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
