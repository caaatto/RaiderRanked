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
    top100Score = 4286,
    CHALLENGER  = { minScore = 4131, wingScore = 4168 },
    GRANDMASTER = { minScore = 4016, wingScore = 4054 },
    MASTER      = { minScore = 3893, wingScore = 3937 },
    DIAMOND     = { minScore = 3637, wingScore = 3738 },
    EMERALD     = { minScore = 3461, wingScore = 3541 },
    PLATINUM    = { minScore = 3167, wingScore = 3324 },
    GOLD        = { minScore = 2825, wingScore = 3018 },
    SILVER      = { minScore = 1774, wingScore = 2541 },
    BRONZE      = { minScore =  461, wingScore =  1044 },
    IRON        = { minScore =    1, wingScore =  241 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4286,
    CHALLENGER  = { minScore = 4028, wingScore = 4168 },
    GRANDMASTER = { minScore = 3982, wingScore = 4005 },
    MASTER      = { minScore = 3818, wingScore = 3900 },
    DIAMOND     = { minScore = 3680, wingScore = 3749 },
    EMERALD     = { minScore = 3496, wingScore = 3588 },
    PLATINUM    = { minScore = 3170, wingScore = 3310 },
    GOLD        = { minScore = 2825, wingScore = 2969 },
    SILVER      = { minScore = 1774, wingScore = 2541 },
    BRONZE      = { minScore =  461, wingScore =  1044 },
    IRON        = { minScore =    1, wingScore =  241 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4286,
    CHALLENGER  = { minScore = 4159, wingScore = 4168 },
    GRANDMASTER = { minScore = 4109, wingScore = 4134 },
    MASTER      = { minScore = 3935, wingScore = 4022 },
    DIAMOND     = { minScore = 3773, wingScore = 3854 },
    EMERALD     = { minScore = 3556, wingScore = 3665 },
    PLATINUM    = { minScore = 3216, wingScore = 3355 },
    GOLD        = { minScore = 2825, wingScore = 3018 },
    SILVER      = { minScore = 1774, wingScore = 2541 },
    BRONZE      = { minScore =  461, wingScore =  1044 },
    IRON        = { minScore =    1, wingScore =  241 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4240,
    CHALLENGER  = { minScore = 4088, wingScore = 4140 },
    GRANDMASTER = { minScore = 3981, wingScore = 4016 },
    MASTER      = { minScore = 3837, wingScore = 3895 },
    DIAMOND     = { minScore = 3550, wingScore = 3663 },
    EMERALD     = { minScore = 3412, wingScore = 3451 },
    PLATINUM    = { minScore = 3086, wingScore = 3222 },
    GOLD        = { minScore = 2727, wingScore = 2953 },
    SILVER      = { minScore = 1469, wingScore = 2328 },
    BRONZE      = { minScore =  354, wingScore =  849 },
    IRON        = { minScore =    1, wingScore =  183 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4240,
    CHALLENGER  = { minScore = 3983, wingScore = 4140 },
    GRANDMASTER = { minScore = 3930, wingScore = 3957 },
    MASTER      = { minScore = 3747, wingScore = 3839 },
    DIAMOND     = { minScore = 3599, wingScore = 3673 },
    EMERALD     = { minScore = 3401, wingScore = 3500 },
    PLATINUM    = { minScore = 3108, wingScore = 3224 },
    GOLD        = { minScore = 2727, wingScore = 2909 },
    SILVER      = { minScore = 1469, wingScore = 2328 },
    BRONZE      = { minScore =  354, wingScore =  849 },
    IRON        = { minScore =    1, wingScore =  183 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4240,
    CHALLENGER  = { minScore = 4135, wingScore = 4140 },
    GRANDMASTER = { minScore = 4082, wingScore = 4108 },
    MASTER      = { minScore = 3896, wingScore = 3989 },
    DIAMOND     = { minScore = 3733, wingScore = 3814 },
    EMERALD     = { minScore = 3515, wingScore = 3624 },
    PLATINUM    = { minScore = 3163, wingScore = 3309 },
    GOLD        = { minScore = 2727, wingScore = 2946 },
    SILVER      = { minScore = 1469, wingScore = 2328 },
    BRONZE      = { minScore =  354, wingScore =  849 },
    IRON        = { minScore =    1, wingScore =  183 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4286,
    CHALLENGER  = { minScore = 4113, wingScore = 4156 },
    GRANDMASTER = { minScore = 4001, wingScore = 4038 },
    MASTER      = { minScore = 3869, wingScore = 3919 },
    DIAMOND     = { minScore = 3600, wingScore = 3706 },
    EMERALD     = { minScore = 3440, wingScore = 3503 },
    PLATINUM    = { minScore = 3133, wingScore = 3281 },
    GOLD        = { minScore = 2784, wingScore = 2991 },
    SILVER      = { minScore = 1646, wingScore = 2452 },
    BRONZE      = { minScore =  416, wingScore =  962 },
    IRON        = { minScore =    1, wingScore =  217 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4286,
    CHALLENGER  = { minScore = 4010, wingScore = 4157 },
    GRANDMASTER = { minScore = 3961, wingScore = 3985 },
    MASTER      = { minScore = 3789, wingScore = 3875 },
    DIAMOND     = { minScore = 3647, wingScore = 3718 },
    EMERALD     = { minScore = 3457, wingScore = 3552 },
    PLATINUM    = { minScore = 3145, wingScore = 3275 },
    GOLD        = { minScore = 2785, wingScore = 2944 },
    SILVER      = { minScore = 1649, wingScore = 2454 },
    BRONZE      = { minScore =  417, wingScore =  964 },
    IRON        = { minScore =    1, wingScore =  217 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4286,
    CHALLENGER  = { minScore = 4149, wingScore = 4156 },
    GRANDMASTER = { minScore = 4097, wingScore = 4123 },
    MASTER      = { minScore = 3918, wingScore = 4008 },
    DIAMOND     = { minScore = 3756, wingScore = 3837 },
    EMERALD     = { minScore = 3538, wingScore = 3647 },
    PLATINUM    = { minScore = 3193, wingScore = 3335 },
    GOLD        = { minScore = 2783, wingScore = 2987 },
    SILVER      = { minScore = 1642, wingScore = 2449 },
    BRONZE      = { minScore =  415, wingScore =  960 },
    IRON        = { minScore =    1, wingScore =  216 },
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
