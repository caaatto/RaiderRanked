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
    top100Score = 4276,
    CHALLENGER  = { minScore = 4126, wingScore = 4161 },
    GRANDMASTER = { minScore = 4014, wingScore = 4045 },
    MASTER      = { minScore = 3890, wingScore = 3930 },
    DIAMOND     = { minScore = 3634, wingScore = 3734 },
    EMERALD     = { minScore = 3460, wingScore = 3541 },
    PLATINUM    = { minScore = 3168, wingScore = 3324 },
    GOLD        = { minScore = 2827, wingScore = 3019 },
    SILVER      = { minScore = 1790, wingScore = 2547 },
    BRONZE      = { minScore =  473, wingScore =  1057 },
    IRON        = { minScore =    1, wingScore =  243 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4276,
    CHALLENGER  = { minScore = 4024, wingScore = 4161 },
    GRANDMASTER = { minScore = 3977, wingScore = 4000 },
    MASTER      = { minScore = 3811, wingScore = 3894 },
    DIAMOND     = { minScore = 3675, wingScore = 3743 },
    EMERALD     = { minScore = 3494, wingScore = 3584 },
    PLATINUM    = { minScore = 3170, wingScore = 3310 },
    GOLD        = { minScore = 2827, wingScore = 2970 },
    SILVER      = { minScore = 1790, wingScore = 2547 },
    BRONZE      = { minScore =  473, wingScore =  1057 },
    IRON        = { minScore =    1, wingScore =  243 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4276,
    CHALLENGER  = { minScore = 4150, wingScore = 4161 },
    GRANDMASTER = { minScore = 4101, wingScore = 4125 },
    MASTER      = { minScore = 3927, wingScore = 4014 },
    DIAMOND     = { minScore = 3767, wingScore = 3847 },
    EMERALD     = { minScore = 3554, wingScore = 3661 },
    PLATINUM    = { minScore = 3216, wingScore = 3355 },
    GOLD        = { minScore = 2827, wingScore = 3019 },
    SILVER      = { minScore = 1790, wingScore = 2547 },
    BRONZE      = { minScore =  473, wingScore =  1057 },
    IRON        = { minScore =    1, wingScore =  243 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4230,
    CHALLENGER  = { minScore = 4075, wingScore = 4135 },
    GRANDMASTER = { minScore = 3970, wingScore = 4013 },
    MASTER      = { minScore = 3828, wingScore = 3892 },
    DIAMOND     = { minScore = 3548, wingScore = 3660 },
    EMERALD     = { minScore = 3411, wingScore = 3451 },
    PLATINUM    = { minScore = 3087, wingScore = 3222 },
    GOLD        = { minScore = 2729, wingScore = 2955 },
    SILVER      = { minScore = 1483, wingScore = 2334 },
    BRONZE      = { minScore =  358, wingScore =  858 },
    IRON        = { minScore =    1, wingScore =  184 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4230,
    CHALLENGER  = { minScore = 3975, wingScore = 4135 },
    GRANDMASTER = { minScore = 3923, wingScore = 3949 },
    MASTER      = { minScore = 3740, wingScore = 3832 },
    DIAMOND     = { minScore = 3594, wingScore = 3667 },
    EMERALD     = { minScore = 3399, wingScore = 3496 },
    PLATINUM    = { minScore = 3108, wingScore = 3224 },
    GOLD        = { minScore = 2729, wingScore = 2909 },
    SILVER      = { minScore = 1483, wingScore = 2334 },
    BRONZE      = { minScore =  358, wingScore =  858 },
    IRON        = { minScore =    1, wingScore =  184 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4230,
    CHALLENGER  = { minScore = 4132, wingScore = 4135 },
    GRANDMASTER = { minScore = 4079, wingScore = 4105 },
    MASTER      = { minScore = 3893, wingScore = 3986 },
    DIAMOND     = { minScore = 3730, wingScore = 3811 },
    EMERALD     = { minScore = 3514, wingScore = 3622 },
    PLATINUM    = { minScore = 3163, wingScore = 3308 },
    GOLD        = { minScore = 2729, wingScore = 2947 },
    SILVER      = { minScore = 1483, wingScore = 2334 },
    BRONZE      = { minScore =  358, wingScore =  858 },
    IRON        = { minScore =    1, wingScore =  184 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4276,
    CHALLENGER  = { minScore = 4105, wingScore = 4150 },
    GRANDMASTER = { minScore = 3996, wingScore = 4032 },
    MASTER      = { minScore = 3864, wingScore = 3914 },
    DIAMOND     = { minScore = 3598, wingScore = 3703 },
    EMERALD     = { minScore = 3439, wingScore = 3503 },
    PLATINUM    = { minScore = 3134, wingScore = 3281 },
    GOLD        = { minScore = 2786, wingScore = 2992 },
    SILVER      = { minScore = 1661, wingScore = 2458 },
    BRONZE      = { minScore =  425, wingScore =  973 },
    IRON        = { minScore =    1, wingScore =  218 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4276,
    CHALLENGER  = { minScore = 4004, wingScore = 4150 },
    GRANDMASTER = { minScore = 3955, wingScore = 3979 },
    MASTER      = { minScore = 3782, wingScore = 3869 },
    DIAMOND     = { minScore = 3642, wingScore = 3712 },
    EMERALD     = { minScore = 3455, wingScore = 3548 },
    PLATINUM    = { minScore = 3145, wingScore = 3275 },
    GOLD        = { minScore = 2787, wingScore = 2945 },
    SILVER      = { minScore = 1664, wingScore = 2460 },
    BRONZE      = { minScore =  426, wingScore =  976 },
    IRON        = { minScore =    1, wingScore =  219 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4276,
    CHALLENGER  = { minScore = 4142, wingScore = 4150 },
    GRANDMASTER = { minScore = 4092, wingScore = 4116 },
    MASTER      = { minScore = 3912, wingScore = 4002 },
    DIAMOND     = { minScore = 3751, wingScore = 3831 },
    EMERALD     = { minScore = 3537, wingScore = 3644 },
    PLATINUM    = { minScore = 3193, wingScore = 3335 },
    GOLD        = { minScore = 2785, wingScore = 2988 },
    SILVER      = { minScore = 1658, wingScore = 2455 },
    BRONZE      = { minScore =  423, wingScore =  971 },
    IRON        = { minScore =    1, wingScore =  218 },
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
