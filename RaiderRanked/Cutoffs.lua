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
    top100Score = 4254,
    CHALLENGER  = { minScore = 4084, wingScore = 4135 },
    GRANDMASTER = { minScore = 3998, wingScore = 4020 },
    MASTER      = { minScore = 3860, wingScore = 3907 },
    DIAMOND     = { minScore = 3617, wingScore = 3712 },
    EMERALD     = { minScore = 3452, wingScore = 3530 },
    PLATINUM    = { minScore = 3161, wingScore = 3315 },
    GOLD        = { minScore = 2821, wingScore = 3016 },
    SILVER      = { minScore = 1794, wingScore = 2544 },
    BRONZE      = { minScore =  482, wingScore =  1064 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4254,
    CHALLENGER  = { minScore = 4012, wingScore = 4135 },
    GRANDMASTER = { minScore = 3963, wingScore = 3987 },
    MASTER      = { minScore = 3790, wingScore = 3876 },
    DIAMOND     = { minScore = 3659, wingScore = 3725 },
    EMERALD     = { minScore = 3484, wingScore = 3572 },
    PLATINUM    = { minScore = 3166, wingScore = 3305 },
    GOLD        = { minScore = 2821, wingScore = 2966 },
    SILVER      = { minScore = 1794, wingScore = 2544 },
    BRONZE      = { minScore =  482, wingScore =  1064 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4254,
    CHALLENGER  = { minScore = 4132, wingScore = 4135 },
    GRANDMASTER = { minScore = 4082, wingScore = 4107 },
    MASTER      = { minScore = 3906, wingScore = 3994 },
    DIAMOND     = { minScore = 3751, wingScore = 3829 },
    EMERALD     = { minScore = 3544, wingScore = 3648 },
    PLATINUM    = { minScore = 3211, wingScore = 3349 },
    GOLD        = { minScore = 2821, wingScore = 3014 },
    SILVER      = { minScore = 1794, wingScore = 2544 },
    BRONZE      = { minScore =  482, wingScore =  1064 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4197,
    CHALLENGER  = { minScore = 4040, wingScore = 4114 },
    GRANDMASTER = { minScore = 3939, wingScore = 3987 },
    MASTER      = { minScore = 3796, wingScore = 3860 },
    DIAMOND     = { minScore = 3536, wingScore = 3641 },
    EMERALD     = { minScore = 3407, wingScore = 3443 },
    PLATINUM    = { minScore = 3082, wingScore = 3213 },
    GOLD        = { minScore = 2724, wingScore = 2945 },
    SILVER      = { minScore = 1487, wingScore = 2331 },
    BRONZE      = { minScore =  360, wingScore =  864 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4197,
    CHALLENGER  = { minScore = 3948, wingScore = 4114 },
    GRANDMASTER = { minScore = 3895, wingScore = 3921 },
    MASTER      = { minScore = 3710, wingScore = 3803 },
    DIAMOND     = { minScore = 3569, wingScore = 3640 },
    EMERALD     = { minScore = 3381, wingScore = 3475 },
    PLATINUM    = { minScore = 3102, wingScore = 3213 },
    GOLD        = { minScore = 2724, wingScore = 2906 },
    SILVER      = { minScore = 1487, wingScore = 2331 },
    BRONZE      = { minScore =  360, wingScore =  864 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4197,
    CHALLENGER  = { minScore = 4093, wingScore = 4114 },
    GRANDMASTER = { minScore = 4041, wingScore = 4067 },
    MASTER      = { minScore = 3860, wingScore = 3950 },
    DIAMOND     = { minScore = 3707, wingScore = 3783 },
    EMERALD     = { minScore = 3503, wingScore = 3605 },
    PLATINUM    = { minScore = 3159, wingScore = 3304 },
    GOLD        = { minScore = 2724, wingScore = 2944 },
    SILVER      = { minScore = 1487, wingScore = 2331 },
    BRONZE      = { minScore =  360, wingScore =  864 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4254,
    CHALLENGER  = { minScore = 4066, wingScore = 4126 },
    GRANDMASTER = { minScore = 3973, wingScore = 4006 },
    MASTER      = { minScore = 3833, wingScore = 3887 },
    DIAMOND     = { minScore = 3583, wingScore = 3682 },
    EMERALD     = { minScore = 3433, wingScore = 3494 },
    PLATINUM    = { minScore = 3128, wingScore = 3272 },
    GOLD        = { minScore = 2780, wingScore = 2986 },
    SILVER      = { minScore = 1665, wingScore = 2455 },
    BRONZE      = { minScore =  431, wingScore =  980 },
    IRON        = { minScore =    1, wingScore =  220 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4254,
    CHALLENGER  = { minScore = 3986, wingScore = 4126 },
    GRANDMASTER = { minScore = 3935, wingScore = 3960 },
    MASTER      = { minScore = 3757, wingScore = 3846 },
    DIAMOND     = { minScore = 3622, wingScore = 3690 },
    EMERALD     = { minScore = 3442, wingScore = 3532 },
    PLATINUM    = { minScore = 3140, wingScore = 3267 },
    GOLD        = { minScore = 2781, wingScore = 2942 },
    SILVER      = { minScore = 1669, wingScore = 2457 },
    BRONZE      = { minScore =  432, wingScore =  982 },
    IRON        = { minScore =    1, wingScore =  221 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4254,
    CHALLENGER  = { minScore = 4115, wingScore = 4126 },
    GRANDMASTER = { minScore = 4064, wingScore = 4090 },
    MASTER      = { minScore = 3886, wingScore = 3975 },
    DIAMOND     = { minScore = 3732, wingScore = 3809 },
    EMERALD     = { minScore = 3526, wingScore = 3629 },
    PLATINUM    = { minScore = 3189, wingScore = 3330 },
    GOLD        = { minScore = 2779, wingScore = 2984 },
    SILVER      = { minScore = 1662, wingScore = 2452 },
    BRONZE      = { minScore =  429, wingScore =  978 },
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
