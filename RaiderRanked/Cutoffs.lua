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
    top100Score = 4261,
    CHALLENGER  = { minScore = 4112, wingScore = 4148 },
    GRANDMASTER = { minScore = 4011, wingScore = 4036 },
    MASTER      = { minScore = 3879, wingScore = 3921 },
    DIAMOND     = { minScore = 3630, wingScore = 3728 },
    EMERALD     = { minScore = 3458, wingScore = 3539 },
    PLATINUM    = { minScore = 3167, wingScore = 3322 },
    GOLD        = { minScore = 2827, wingScore = 3019 },
    SILVER      = { minScore = 1803, wingScore = 2550 },
    BRONZE      = { minScore =  484, wingScore =  1069 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4261,
    CHALLENGER  = { minScore = 4018, wingScore = 4148 },
    GRANDMASTER = { minScore = 3970, wingScore = 3994 },
    MASTER      = { minScore = 3804, wingScore = 3887 },
    DIAMOND     = { minScore = 3670, wingScore = 3737 },
    EMERALD     = { minScore = 3492, wingScore = 3581 },
    PLATINUM    = { minScore = 3170, wingScore = 3309 },
    GOLD        = { minScore = 2827, wingScore = 2970 },
    SILVER      = { minScore = 1803, wingScore = 2550 },
    BRONZE      = { minScore =  484, wingScore =  1069 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4261,
    CHALLENGER  = { minScore = 4140, wingScore = 4148 },
    GRANDMASTER = { minScore = 4091, wingScore = 4116 },
    MASTER      = { minScore = 3920, wingScore = 4005 },
    DIAMOND     = { minScore = 3762, wingScore = 3841 },
    EMERALD     = { minScore = 3551, wingScore = 3657 },
    PLATINUM    = { minScore = 3215, wingScore = 3354 },
    GOLD        = { minScore = 2827, wingScore = 3019 },
    SILVER      = { minScore = 1803, wingScore = 2550 },
    BRONZE      = { minScore =  484, wingScore =  1069 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4222,
    CHALLENGER  = { minScore = 4062, wingScore = 4131 },
    GRANDMASTER = { minScore = 3958, wingScore = 4009 },
    MASTER      = { minScore = 3817, wingScore = 3884 },
    DIAMOND     = { minScore = 3545, wingScore = 3656 },
    EMERALD     = { minScore = 3410, wingScore = 3449 },
    PLATINUM    = { minScore = 3086, wingScore = 3221 },
    GOLD        = { minScore = 2730, wingScore = 2955 },
    SILVER      = { minScore = 1496, wingScore = 2339 },
    BRONZE      = { minScore =  361, wingScore =  868 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4222,
    CHALLENGER  = { minScore = 3963, wingScore = 4131 },
    GRANDMASTER = { minScore = 3911, wingScore = 3937 },
    MASTER      = { minScore = 3731, wingScore = 3821 },
    DIAMOND     = { minScore = 3586, wingScore = 3658 },
    EMERALD     = { minScore = 3394, wingScore = 3490 },
    PLATINUM    = { minScore = 3107, wingScore = 3222 },
    GOLD        = { minScore = 2730, wingScore = 2909 },
    SILVER      = { minScore = 1496, wingScore = 2339 },
    BRONZE      = { minScore =  361, wingScore =  868 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4222,
    CHALLENGER  = { minScore = 4127, wingScore = 4131 },
    GRANDMASTER = { minScore = 4073, wingScore = 4100 },
    MASTER      = { minScore = 3885, wingScore = 3979 },
    DIAMOND     = { minScore = 3725, wingScore = 3805 },
    EMERALD     = { minScore = 3511, wingScore = 3618 },
    PLATINUM    = { minScore = 3163, wingScore = 3308 },
    GOLD        = { minScore = 2730, wingScore = 2947 },
    SILVER      = { minScore = 1496, wingScore = 2339 },
    BRONZE      = { minScore =  361, wingScore =  868 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4261,
    CHALLENGER  = { minScore = 4091, wingScore = 4141 },
    GRANDMASTER = { minScore = 3989, wingScore = 4025 },
    MASTER      = { minScore = 3853, wingScore = 3905 },
    DIAMOND     = { minScore = 3594, wingScore = 3698 },
    EMERALD     = { minScore = 3438, wingScore = 3501 },
    PLATINUM    = { minScore = 3133, wingScore = 3280 },
    GOLD        = { minScore = 2786, wingScore = 2992 },
    SILVER      = { minScore = 1674, wingScore = 2461 },
    BRONZE      = { minScore =  432, wingScore =  985 },
    IRON        = { minScore =    1, wingScore =  220 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4261,
    CHALLENGER  = { minScore = 3996, wingScore = 4141 },
    GRANDMASTER = { minScore = 3946, wingScore = 3971 },
    MASTER      = { minScore = 3774, wingScore = 3860 },
    DIAMOND     = { minScore = 3636, wingScore = 3705 },
    EMERALD     = { minScore = 3452, wingScore = 3544 },
    PLATINUM    = { minScore = 3144, wingScore = 3273 },
    GOLD        = { minScore = 2787, wingScore = 2945 },
    SILVER      = { minScore = 1678, wingScore = 2464 },
    BRONZE      = { minScore =  434, wingScore =  987 },
    IRON        = { minScore =    1, wingScore =  220 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4261,
    CHALLENGER  = { minScore = 4134, wingScore = 4141 },
    GRANDMASTER = { minScore = 4083, wingScore = 4109 },
    MASTER      = { minScore = 3905, wingScore = 3994 },
    DIAMOND     = { minScore = 3746, wingScore = 3825 },
    EMERALD     = { minScore = 3534, wingScore = 3640 },
    PLATINUM    = { minScore = 3193, wingScore = 3334 },
    GOLD        = { minScore = 2785, wingScore = 2988 },
    SILVER      = { minScore = 1671, wingScore = 2459 },
    BRONZE      = { minScore =  431, wingScore =  982 },
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
