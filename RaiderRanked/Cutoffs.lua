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
    top100Score = 4227,
    CHALLENGER  = { minScore = 4055, wingScore = 4115 },
    GRANDMASTER = { minScore = 3972, wingScore = 4011 },
    MASTER      = { minScore = 3837, wingScore = 3893 },
    DIAMOND     = { minScore = 3601, wingScore = 3695 },
    EMERALD     = { minScore = 3444, wingScore = 3515 },
    PLATINUM    = { minScore = 3151, wingScore = 3304 },
    GOLD        = { minScore = 2810, wingScore = 3012 },
    SILVER      = { minScore = 1788, wingScore = 2535 },
    BRONZE      = { minScore =  486, wingScore =  1064 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4227,
    CHALLENGER  = { minScore = 3996, wingScore = 4115 },
    GRANDMASTER = { minScore = 3948, wingScore = 3972 },
    MASTER      = { minScore = 3778, wingScore = 3863 },
    DIAMOND     = { minScore = 3644, wingScore = 3711 },
    EMERALD     = { minScore = 3466, wingScore = 3555 },
    PLATINUM    = { minScore = 3155, wingScore = 3288 },
    GOLD        = { minScore = 2810, wingScore = 2959 },
    SILVER      = { minScore = 1788, wingScore = 2535 },
    BRONZE      = { minScore =  486, wingScore =  1064 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4227,
    CHALLENGER  = { minScore = 4103, wingScore = 4115 },
    GRANDMASTER = { minScore = 4057, wingScore = 4080 },
    MASTER      = { minScore = 3893, wingScore = 3975 },
    DIAMOND     = { minScore = 3740, wingScore = 3816 },
    EMERALD     = { minScore = 3536, wingScore = 3638 },
    PLATINUM    = { minScore = 3203, wingScore = 3341 },
    GOLD        = { minScore = 2810, wingScore = 3005 },
    SILVER      = { minScore = 1788, wingScore = 2535 },
    BRONZE      = { minScore =  486, wingScore =  1064 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4171,
    CHALLENGER  = { minScore = 4020, wingScore = 4074 },
    GRANDMASTER = { minScore = 3917, wingScore = 3962 },
    MASTER      = { minScore = 3779, wingScore = 3835 },
    DIAMOND     = { minScore = 3521, wingScore = 3620 },
    EMERALD     = { minScore = 3402, wingScore = 3435 },
    PLATINUM    = { minScore = 3075, wingScore = 3202 },
    GOLD        = { minScore = 2716, wingScore = 2931 },
    SILVER      = { minScore = 1482, wingScore = 2325 },
    BRONZE      = { minScore =  360, wingScore =  862 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4171,
    CHALLENGER  = { minScore = 3922, wingScore = 4074 },
    GRANDMASTER = { minScore = 3870, wingScore = 3896 },
    MASTER      = { minScore = 3690, wingScore = 3780 },
    DIAMOND     = { minScore = 3551, wingScore = 3620 },
    EMERALD     = { minScore = 3365, wingScore = 3458 },
    PLATINUM    = { minScore = 3095, wingScore = 3201 },
    GOLD        = { minScore = 2716, wingScore = 2901 },
    SILVER      = { minScore = 1482, wingScore = 2325 },
    BRONZE      = { minScore =  360, wingScore =  862 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4171,
    CHALLENGER  = { minScore = 4061, wingScore = 4074 },
    GRANDMASTER = { minScore = 4011, wingScore = 4036 },
    MASTER      = { minScore = 3836, wingScore = 3923 },
    DIAMOND     = { minScore = 3683, wingScore = 3759 },
    EMERALD     = { minScore = 3481, wingScore = 3582 },
    PLATINUM    = { minScore = 3149, wingScore = 3287 },
    GOLD        = { minScore = 2716, wingScore = 2937 },
    SILVER      = { minScore = 1482, wingScore = 2325 },
    BRONZE      = { minScore =  360, wingScore =  862 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4227,
    CHALLENGER  = { minScore = 4040, wingScore = 4098 },
    GRANDMASTER = { minScore = 3949, wingScore = 3991 },
    MASTER      = { minScore = 3813, wingScore = 3869 },
    DIAMOND     = { minScore = 3568, wingScore = 3664 },
    EMERALD     = { minScore = 3426, wingScore = 3482 },
    PLATINUM    = { minScore = 3119, wingScore = 3261 },
    GOLD        = { minScore = 2771, wingScore = 2978 },
    SILVER      = { minScore = 1660, wingScore = 2447 },
    BRONZE      = { minScore =  433, wingScore =  980 },
    IRON        = { minScore =    1, wingScore =  220 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4227,
    CHALLENGER  = { minScore = 3966, wingScore = 4098 },
    GRANDMASTER = { minScore = 3916, wingScore = 3941 },
    MASTER      = { minScore = 3742, wingScore = 3829 },
    DIAMOND     = { minScore = 3606, wingScore = 3674 },
    EMERALD     = { minScore = 3425, wingScore = 3516 },
    PLATINUM    = { minScore = 3131, wingScore = 3253 },
    GOLD        = { minScore = 2772, wingScore = 2935 },
    SILVER      = { minScore = 1663, wingScore = 2450 },
    BRONZE      = { minScore =  435, wingScore =  982 },
    IRON        = { minScore =    1, wingScore =  221 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4227,
    CHALLENGER  = { minScore = 4085, wingScore = 4097 },
    GRANDMASTER = { minScore = 4037, wingScore = 4061 },
    MASTER      = { minScore = 3869, wingScore = 3953 },
    DIAMOND     = { minScore = 3716, wingScore = 3792 },
    EMERALD     = { minScore = 3512, wingScore = 3614 },
    PLATINUM    = { minScore = 3180, wingScore = 3318 },
    GOLD        = { minScore = 2770, wingScore = 2976 },
    SILVER      = { minScore = 1657, wingScore = 2445 },
    BRONZE      = { minScore =  432, wingScore =  977 },
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
