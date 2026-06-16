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
    top100Score = 4230,
    CHALLENGER  = { minScore = 4056, wingScore = 4118 },
    GRANDMASTER = { minScore = 3975, wingScore = 4012 },
    MASTER      = { minScore = 3839, wingScore = 3894 },
    DIAMOND     = { minScore = 3603, wingScore = 3697 },
    EMERALD     = { minScore = 3445, wingScore = 3517 },
    PLATINUM    = { minScore = 3152, wingScore = 3305 },
    GOLD        = { minScore = 2812, wingScore = 3013 },
    SILVER      = { minScore = 1791, wingScore = 2537 },
    BRONZE      = { minScore =  486, wingScore =  1066 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4230,
    CHALLENGER  = { minScore = 3998, wingScore = 4118 },
    GRANDMASTER = { minScore = 3949, wingScore = 3973 },
    MASTER      = { minScore = 3779, wingScore = 3864 },
    DIAMOND     = { minScore = 3645, wingScore = 3712 },
    EMERALD     = { minScore = 3468, wingScore = 3557 },
    PLATINUM    = { minScore = 3157, wingScore = 3290 },
    GOLD        = { minScore = 2812, wingScore = 2960 },
    SILVER      = { minScore = 1791, wingScore = 2537 },
    BRONZE      = { minScore =  486, wingScore =  1066 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4230,
    CHALLENGER  = { minScore = 4105, wingScore = 4118 },
    GRANDMASTER = { minScore = 4058, wingScore = 4082 },
    MASTER      = { minScore = 3894, wingScore = 3976 },
    DIAMOND     = { minScore = 3741, wingScore = 3817 },
    EMERALD     = { minScore = 3536, wingScore = 3639 },
    PLATINUM    = { minScore = 3204, wingScore = 3342 },
    GOLD        = { minScore = 2812, wingScore = 3006 },
    SILVER      = { minScore = 1791, wingScore = 2537 },
    BRONZE      = { minScore =  486, wingScore =  1066 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4177,
    CHALLENGER  = { minScore = 4022, wingScore = 4076 },
    GRANDMASTER = { minScore = 3919, wingScore = 3966 },
    MASTER      = { minScore = 3780, wingScore = 3837 },
    DIAMOND     = { minScore = 3523, wingScore = 3622 },
    EMERALD     = { minScore = 3403, wingScore = 3436 },
    PLATINUM    = { minScore = 3076, wingScore = 3203 },
    GOLD        = { minScore = 2717, wingScore = 2933 },
    SILVER      = { minScore = 1485, wingScore = 2326 },
    BRONZE      = { minScore =  361, wingScore =  863 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4177,
    CHALLENGER  = { minScore = 3924, wingScore = 4076 },
    GRANDMASTER = { minScore = 3872, wingScore = 3898 },
    MASTER      = { minScore = 3691, wingScore = 3782 },
    DIAMOND     = { minScore = 3552, wingScore = 3622 },
    EMERALD     = { minScore = 3367, wingScore = 3460 },
    PLATINUM    = { minScore = 3096, wingScore = 3203 },
    GOLD        = { minScore = 2717, wingScore = 2902 },
    SILVER      = { minScore = 1485, wingScore = 2326 },
    BRONZE      = { minScore =  361, wingScore =  863 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4177,
    CHALLENGER  = { minScore = 4068, wingScore = 4076 },
    GRANDMASTER = { minScore = 4017, wingScore = 4042 },
    MASTER      = { minScore = 3838, wingScore = 3927 },
    DIAMOND     = { minScore = 3686, wingScore = 3762 },
    EMERALD     = { minScore = 3483, wingScore = 3585 },
    PLATINUM    = { minScore = 3150, wingScore = 3289 },
    GOLD        = { minScore = 2717, wingScore = 2938 },
    SILVER      = { minScore = 1485, wingScore = 2326 },
    BRONZE      = { minScore =  361, wingScore =  863 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4230,
    CHALLENGER  = { minScore = 4042, wingScore = 4100 },
    GRANDMASTER = { minScore = 3952, wingScore = 3993 },
    MASTER      = { minScore = 3814, wingScore = 3870 },
    DIAMOND     = { minScore = 3570, wingScore = 3666 },
    EMERALD     = { minScore = 3427, wingScore = 3483 },
    PLATINUM    = { minScore = 3120, wingScore = 3262 },
    GOLD        = { minScore = 2772, wingScore = 2980 },
    SILVER      = { minScore = 1663, wingScore = 2449 },
    BRONZE      = { minScore =  434, wingScore =  981 },
    IRON        = { minScore =    1, wingScore =  220 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4230,
    CHALLENGER  = { minScore = 3968, wingScore = 4101 },
    GRANDMASTER = { minScore = 3918, wingScore = 3942 },
    MASTER      = { minScore = 3743, wingScore = 3831 },
    DIAMOND     = { minScore = 3607, wingScore = 3675 },
    EMERALD     = { minScore = 3427, wingScore = 3518 },
    PLATINUM    = { minScore = 3132, wingScore = 3255 },
    GOLD        = { minScore = 2773, wingScore = 2936 },
    SILVER      = { minScore = 1666, wingScore = 2451 },
    BRONZE      = { minScore =  435, wingScore =  983 },
    IRON        = { minScore =    1, wingScore =  221 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4230,
    CHALLENGER  = { minScore = 4089, wingScore = 4100 },
    GRANDMASTER = { minScore = 4040, wingScore = 4065 },
    MASTER      = { minScore = 3870, wingScore = 3955 },
    DIAMOND     = { minScore = 3717, wingScore = 3793 },
    EMERALD     = { minScore = 3513, wingScore = 3616 },
    PLATINUM    = { minScore = 3181, wingScore = 3319 },
    GOLD        = { minScore = 2771, wingScore = 2977 },
    SILVER      = { minScore = 1659, wingScore = 2446 },
    BRONZE      = { minScore =  432, wingScore =  979 },
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
