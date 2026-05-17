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
    top100Score = 4075,
    CHALLENGER  = { minScore = 3910, wingScore = 3962 },
    GRANDMASTER = { minScore = 3828, wingScore = 3869 },
    MASTER      = { minScore = 3705, wingScore = 3768 },
    DIAMOND     = { minScore = 3497, wingScore = 3573 },
    EMERALD     = { minScore = 3363, wingScore = 3423 },
    PLATINUM    = { minScore = 3073, wingScore = 3200 },
    GOLD        = { minScore = 2732, wingScore = 2925 },
    SILVER      = { minScore = 1672, wingScore = 2431 },
    BRONZE      = { minScore =  423, wingScore =  997 },
    IRON        = { minScore =    1, wingScore =  230 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4075,
    CHALLENGER  = { minScore = 3862, wingScore = 3962 },
    GRANDMASTER = { minScore = 3817, wingScore = 3839 },
    MASTER      = { minScore = 3657, wingScore = 3737 },
    DIAMOND     = { minScore = 3527, wingScore = 3592 },
    EMERALD     = { minScore = 3353, wingScore = 3440 },
    PLATINUM    = { minScore = 3092, wingScore = 3197 },
    GOLD        = { minScore = 2732, wingScore = 2909 },
    SILVER      = { minScore = 1672, wingScore = 2431 },
    BRONZE      = { minScore =  423, wingScore =  997 },
    IRON        = { minScore =    1, wingScore =  230 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4075,
    CHALLENGER  = { minScore = 3948, wingScore = 3962 },
    GRANDMASTER = { minScore = 3907, wingScore = 3928 },
    MASTER      = { minScore = 3762, wingScore = 3834 },
    DIAMOND     = { minScore = 3622, wingScore = 3692 },
    EMERALD     = { minScore = 3436, wingScore = 3529 },
    PLATINUM    = { minScore = 3133, wingScore = 3259 },
    GOLD        = { minScore = 2732, wingScore = 2936 },
    SILVER      = { minScore = 1672, wingScore = 2431 },
    BRONZE      = { minScore =  423, wingScore =  997 },
    IRON        = { minScore =    1, wingScore =  230 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4010,
    CHALLENGER  = { minScore = 3882, wingScore = 3917 },
    GRANDMASTER = { minScore = 3777, wingScore = 3811 },
    MASTER      = { minScore = 3646, wingScore = 3691 },
    DIAMOND     = { minScore = 3423, wingScore = 3499 },
    EMERALD     = { minScore = 3273, wingScore = 3345 },
    PLATINUM    = { minScore = 3021, wingScore = 3107 },
    GOLD        = { minScore = 2661, wingScore = 2820 },
    SILVER      = { minScore = 1380, wingScore = 2225 },
    BRONZE      = { minScore =  340, wingScore =  808 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4010,
    CHALLENGER  = { minScore = 3787, wingScore = 3917 },
    GRANDMASTER = { minScore = 3737, wingScore = 3762 },
    MASTER      = { minScore = 3562, wingScore = 3649 },
    DIAMOND     = { minScore = 3430, wingScore = 3496 },
    EMERALD     = { minScore = 3254, wingScore = 3342 },
    PLATINUM    = { minScore = 2986, wingScore = 3095 },
    GOLD        = { minScore = 2661, wingScore = 2813 },
    SILVER      = { minScore = 1380, wingScore = 2225 },
    BRONZE      = { minScore =  340, wingScore =  808 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4010,
    CHALLENGER  = { minScore = 3909, wingScore = 3917 },
    GRANDMASTER = { minScore = 3860, wingScore = 3884 },
    MASTER      = { minScore = 3688, wingScore = 3774 },
    DIAMOND     = { minScore = 3543, wingScore = 3615 },
    EMERALD     = { minScore = 3348, wingScore = 3445 },
    PLATINUM    = { minScore = 3068, wingScore = 3178 },
    GOLD        = { minScore = 2661, wingScore = 2876 },
    SILVER      = { minScore = 1380, wingScore = 2225 },
    BRONZE      = { minScore =  340, wingScore =  808 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4075,
    CHALLENGER  = { minScore = 3898, wingScore = 3943 },
    GRANDMASTER = { minScore = 3807, wingScore = 3845 },
    MASTER      = { minScore = 3680, wingScore = 3736 },
    DIAMOND     = { minScore = 3466, wingScore = 3542 },
    EMERALD     = { minScore = 3326, wingScore = 3391 },
    PLATINUM    = { minScore = 3051, wingScore = 3161 },
    GOLD        = { minScore = 2702, wingScore = 2881 },
    SILVER      = { minScore = 1550, wingScore = 2345 },
    BRONZE      = { minScore =  388, wingScore =  918 },
    IRON        = { minScore =    1, wingScore =  205 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4075,
    CHALLENGER  = { minScore = 3832, wingScore = 3944 },
    GRANDMASTER = { minScore = 3785, wingScore = 3808 },
    MASTER      = { minScore = 3619, wingScore = 3701 },
    DIAMOND     = { minScore = 3488, wingScore = 3553 },
    EMERALD     = { minScore = 3313, wingScore = 3400 },
    PLATINUM    = { minScore = 3049, wingScore = 3156 },
    GOLD        = { minScore = 2703, wingScore = 2870 },
    SILVER      = { minScore = 1554, wingScore = 2348 },
    BRONZE      = { minScore =  389, wingScore =  920 },
    IRON        = { minScore =    1, wingScore =  206 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4075,
    CHALLENGER  = { minScore = 3931, wingScore = 3943 },
    GRANDMASTER = { minScore = 3887, wingScore = 3909 },
    MASTER      = { minScore = 3730, wingScore = 3808 },
    DIAMOND     = { minScore = 3588, wingScore = 3659 },
    EMERALD     = { minScore = 3398, wingScore = 3493 },
    PLATINUM    = { minScore = 3105, wingScore = 3224 },
    GOLD        = { minScore = 2702, wingScore = 2910 },
    SILVER      = { minScore = 1547, wingScore = 2343 },
    BRONZE      = { minScore =  387, wingScore =  916 },
    IRON        = { minScore =    1, wingScore =  204 },
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
