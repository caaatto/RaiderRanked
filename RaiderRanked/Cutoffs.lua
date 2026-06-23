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
    CHALLENGER  = { minScore = 4081, wingScore = 4134 },
    GRANDMASTER = { minScore = 3996, wingScore = 4018 },
    MASTER      = { minScore = 3857, wingScore = 3905 },
    DIAMOND     = { minScore = 3616, wingScore = 3710 },
    EMERALD     = { minScore = 3451, wingScore = 3529 },
    PLATINUM    = { minScore = 3160, wingScore = 3314 },
    GOLD        = { minScore = 2820, wingScore = 3016 },
    SILVER      = { minScore = 1794, wingScore = 2543 },
    BRONZE      = { minScore =  483, wingScore =  1064 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4254,
    CHALLENGER  = { minScore = 4011, wingScore = 4134 },
    GRANDMASTER = { minScore = 3962, wingScore = 3987 },
    MASTER      = { minScore = 3789, wingScore = 3875 },
    DIAMOND     = { minScore = 3657, wingScore = 3723 },
    EMERALD     = { minScore = 3482, wingScore = 3570 },
    PLATINUM    = { minScore = 3165, wingScore = 3303 },
    GOLD        = { minScore = 2820, wingScore = 2965 },
    SILVER      = { minScore = 1794, wingScore = 2543 },
    BRONZE      = { minScore =  483, wingScore =  1064 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4254,
    CHALLENGER  = { minScore = 4131, wingScore = 4134 },
    GRANDMASTER = { minScore = 4081, wingScore = 4106 },
    MASTER      = { minScore = 3904, wingScore = 3992 },
    DIAMOND     = { minScore = 3749, wingScore = 3827 },
    EMERALD     = { minScore = 3544, wingScore = 3646 },
    PLATINUM    = { minScore = 3210, wingScore = 3348 },
    GOLD        = { minScore = 2820, wingScore = 3013 },
    SILVER      = { minScore = 1794, wingScore = 2543 },
    BRONZE      = { minScore =  483, wingScore =  1064 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4195,
    CHALLENGER  = { minScore = 4039, wingScore = 4112 },
    GRANDMASTER = { minScore = 3937, wingScore = 3985 },
    MASTER      = { minScore = 3794, wingScore = 3857 },
    DIAMOND     = { minScore = 3536, wingScore = 3639 },
    EMERALD     = { minScore = 3407, wingScore = 3442 },
    PLATINUM    = { minScore = 3082, wingScore = 3212 },
    GOLD        = { minScore = 2723, wingScore = 2944 },
    SILVER      = { minScore = 1487, wingScore = 2331 },
    BRONZE      = { minScore =  360, wingScore =  864 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4195,
    CHALLENGER  = { minScore = 3943, wingScore = 4112 },
    GRANDMASTER = { minScore = 3891, wingScore = 3917 },
    MASTER      = { minScore = 3707, wingScore = 3799 },
    DIAMOND     = { minScore = 3567, wingScore = 3637 },
    EMERALD     = { minScore = 3380, wingScore = 3473 },
    PLATINUM    = { minScore = 3102, wingScore = 3212 },
    GOLD        = { minScore = 2723, wingScore = 2906 },
    SILVER      = { minScore = 1487, wingScore = 2331 },
    BRONZE      = { minScore =  360, wingScore =  864 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4195,
    CHALLENGER  = { minScore = 4088, wingScore = 4112 },
    GRANDMASTER = { minScore = 4037, wingScore = 4062 },
    MASTER      = { minScore = 3856, wingScore = 3946 },
    DIAMOND     = { minScore = 3704, wingScore = 3780 },
    EMERALD     = { minScore = 3502, wingScore = 3603 },
    PLATINUM    = { minScore = 3159, wingScore = 3304 },
    GOLD        = { minScore = 2723, wingScore = 2943 },
    SILVER      = { minScore = 1487, wingScore = 2331 },
    BRONZE      = { minScore =  360, wingScore =  864 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4254,
    CHALLENGER  = { minScore = 4063, wingScore = 4125 },
    GRANDMASTER = { minScore = 3971, wingScore = 4004 },
    MASTER      = { minScore = 3831, wingScore = 3885 },
    DIAMOND     = { minScore = 3582, wingScore = 3680 },
    EMERALD     = { minScore = 3433, wingScore = 3493 },
    PLATINUM    = { minScore = 3127, wingScore = 3271 },
    GOLD        = { minScore = 2779, wingScore = 2986 },
    SILVER      = { minScore = 1665, wingScore = 2454 },
    BRONZE      = { minScore =  431, wingScore =  980 },
    IRON        = { minScore =    1, wingScore =  220 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4254,
    CHALLENGER  = { minScore = 3983, wingScore = 4125 },
    GRANDMASTER = { minScore = 3933, wingScore = 3958 },
    MASTER      = { minScore = 3756, wingScore = 3844 },
    DIAMOND     = { minScore = 3620, wingScore = 3688 },
    EMERALD     = { minScore = 3440, wingScore = 3530 },
    PLATINUM    = { minScore = 3139, wingScore = 3266 },
    GOLD        = { minScore = 2780, wingScore = 2941 },
    SILVER      = { minScore = 1669, wingScore = 2457 },
    BRONZE      = { minScore =  433, wingScore =  982 },
    IRON        = { minScore =    1, wingScore =  221 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4254,
    CHALLENGER  = { minScore = 4112, wingScore = 4125 },
    GRANDMASTER = { minScore = 4062, wingScore = 4087 },
    MASTER      = { minScore = 3883, wingScore = 3972 },
    DIAMOND     = { minScore = 3730, wingScore = 3807 },
    EMERALD     = { minScore = 3526, wingScore = 3627 },
    PLATINUM    = { minScore = 3188, wingScore = 3329 },
    GOLD        = { minScore = 2778, wingScore = 2983 },
    SILVER      = { minScore = 1662, wingScore = 2452 },
    BRONZE      = { minScore =  430, wingScore =  978 },
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
