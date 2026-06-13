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
    top100Score = 4220,
    CHALLENGER  = { minScore = 4050, wingScore = 4107 },
    GRANDMASTER = { minScore = 3967, wingScore = 4009 },
    MASTER      = { minScore = 3832, wingScore = 3891 },
    DIAMOND     = { minScore = 3597, wingScore = 3689 },
    EMERALD     = { minScore = 3441, wingScore = 3510 },
    PLATINUM    = { minScore = 3147, wingScore = 3298 },
    GOLD        = { minScore = 2806, wingScore = 3011 },
    SILVER      = { minScore = 1778, wingScore = 2529 },
    BRONZE      = { minScore =  483, wingScore =  1057 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4220,
    CHALLENGER  = { minScore = 3990, wingScore = 4107 },
    GRANDMASTER = { minScore = 3942, wingScore = 3966 },
    MASTER      = { minScore = 3776, wingScore = 3859 },
    DIAMOND     = { minScore = 3641, wingScore = 3708 },
    EMERALD     = { minScore = 3460, wingScore = 3550 },
    PLATINUM    = { minScore = 3151, wingScore = 3282 },
    GOLD        = { minScore = 2806, wingScore = 2956 },
    SILVER      = { minScore = 1778, wingScore = 2529 },
    BRONZE      = { minScore =  483, wingScore =  1057 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4220,
    CHALLENGER  = { minScore = 4096, wingScore = 4107 },
    GRANDMASTER = { minScore = 4050, wingScore = 4073 },
    MASTER      = { minScore = 3890, wingScore = 3970 },
    DIAMOND     = { minScore = 3737, wingScore = 3814 },
    EMERALD     = { minScore = 3533, wingScore = 3635 },
    PLATINUM    = { minScore = 3200, wingScore = 3338 },
    GOLD        = { minScore = 2806, wingScore = 3001 },
    SILVER      = { minScore = 1778, wingScore = 2529 },
    BRONZE      = { minScore =  483, wingScore =  1057 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4170,
    CHALLENGER  = { minScore = 4017, wingScore = 4064 },
    GRANDMASTER = { minScore = 3912, wingScore = 3955 },
    MASTER      = { minScore = 3776, wingScore = 3830 },
    DIAMOND     = { minScore = 3516, wingScore = 3615 },
    EMERALD     = { minScore = 3400, wingScore = 3433 },
    PLATINUM    = { minScore = 3072, wingScore = 3198 },
    GOLD        = { minScore = 2713, wingScore = 2925 },
    SILVER      = { minScore = 1475, wingScore = 2320 },
    BRONZE      = { minScore =  360, wingScore =  858 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4170,
    CHALLENGER  = { minScore = 3920, wingScore = 4064 },
    GRANDMASTER = { minScore = 3868, wingScore = 3894 },
    MASTER      = { minScore = 3686, wingScore = 3777 },
    DIAMOND     = { minScore = 3546, wingScore = 3616 },
    EMERALD     = { minScore = 3360, wingScore = 3453 },
    PLATINUM    = { minScore = 3092, wingScore = 3197 },
    GOLD        = { minScore = 2713, wingScore = 2899 },
    SILVER      = { minScore = 1475, wingScore = 2320 },
    BRONZE      = { minScore =  360, wingScore =  858 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4170,
    CHALLENGER  = { minScore = 4056, wingScore = 4064 },
    GRANDMASTER = { minScore = 4005, wingScore = 4031 },
    MASTER      = { minScore = 3829, wingScore = 3917 },
    DIAMOND     = { minScore = 3677, wingScore = 3753 },
    EMERALD     = { minScore = 3473, wingScore = 3575 },
    PLATINUM    = { minScore = 3145, wingScore = 3281 },
    GOLD        = { minScore = 2713, wingScore = 2934 },
    SILVER      = { minScore = 1475, wingScore = 2320 },
    BRONZE      = { minScore =  360, wingScore =  858 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4220,
    CHALLENGER  = { minScore = 4036, wingScore = 4089 },
    GRANDMASTER = { minScore = 3944, wingScore = 3986 },
    MASTER      = { minScore = 3809, wingScore = 3866 },
    DIAMOND     = { minScore = 3563, wingScore = 3658 },
    EMERALD     = { minScore = 3424, wingScore = 3478 },
    PLATINUM    = { minScore = 3116, wingScore = 3256 },
    GOLD        = { minScore = 2767, wingScore = 2975 },
    SILVER      = { minScore = 1651, wingScore = 2442 },
    BRONZE      = { minScore =  432, wingScore =  974 },
    IRON        = { minScore =    1, wingScore =  220 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4220,
    CHALLENGER  = { minScore = 3962, wingScore = 4090 },
    GRANDMASTER = { minScore = 3912, wingScore = 3937 },
    MASTER      = { minScore = 3739, wingScore = 3826 },
    DIAMOND     = { minScore = 3602, wingScore = 3671 },
    EMERALD     = { minScore = 3419, wingScore = 3511 },
    PLATINUM    = { minScore = 3127, wingScore = 3247 },
    GOLD        = { minScore = 2768, wingScore = 2933 },
    SILVER      = { minScore = 1655, wingScore = 2444 },
    BRONZE      = { minScore =  433, wingScore =  976 },
    IRON        = { minScore =    1, wingScore =  221 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4220,
    CHALLENGER  = { minScore = 4079, wingScore = 4089 },
    GRANDMASTER = { minScore = 4031, wingScore = 4055 },
    MASTER      = { minScore = 3864, wingScore = 3947 },
    DIAMOND     = { minScore = 3711, wingScore = 3788 },
    EMERALD     = { minScore = 3507, wingScore = 3609 },
    PLATINUM    = { minScore = 3176, wingScore = 3314 },
    GOLD        = { minScore = 2766, wingScore = 2972 },
    SILVER      = { minScore = 1648, wingScore = 2439 },
    BRONZE      = { minScore =  430, wingScore =  972 },
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
