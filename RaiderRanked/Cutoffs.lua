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
    CHALLENGER  = { minScore = 4119, wingScore = 4157 },
    GRANDMASTER = { minScore = 4013, wingScore = 4042 },
    MASTER      = { minScore = 3887, wingScore = 3926 },
    DIAMOND     = { minScore = 3633, wingScore = 3732 },
    EMERALD     = { minScore = 3460, wingScore = 3540 },
    PLATINUM    = { minScore = 3168, wingScore = 3323 },
    GOLD        = { minScore = 2828, wingScore = 3019 },
    SILVER      = { minScore = 1795, wingScore = 2549 },
    BRONZE      = { minScore =  475, wingScore =  1061 },
    IRON        = { minScore =    1, wingScore =  244 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4276,
    CHALLENGER  = { minScore = 4021, wingScore = 4157 },
    GRANDMASTER = { minScore = 3974, wingScore = 3998 },
    MASTER      = { minScore = 3809, wingScore = 3891 },
    DIAMOND     = { minScore = 3673, wingScore = 3741 },
    EMERALD     = { minScore = 3493, wingScore = 3583 },
    PLATINUM    = { minScore = 3170, wingScore = 3310 },
    GOLD        = { minScore = 2828, wingScore = 2970 },
    SILVER      = { minScore = 1795, wingScore = 2549 },
    BRONZE      = { minScore =  475, wingScore =  1061 },
    IRON        = { minScore =    1, wingScore =  244 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4276,
    CHALLENGER  = { minScore = 4148, wingScore = 4157 },
    GRANDMASTER = { minScore = 4098, wingScore = 4123 },
    MASTER      = { minScore = 3925, wingScore = 4012 },
    DIAMOND     = { minScore = 3766, wingScore = 3846 },
    EMERALD     = { minScore = 3554, wingScore = 3660 },
    PLATINUM    = { minScore = 3216, wingScore = 3355 },
    GOLD        = { minScore = 2828, wingScore = 3020 },
    SILVER      = { minScore = 1795, wingScore = 2549 },
    BRONZE      = { minScore =  475, wingScore =  1061 },
    IRON        = { minScore =    1, wingScore =  244 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4229,
    CHALLENGER  = { minScore = 4072, wingScore = 4134 },
    GRANDMASTER = { minScore = 3968, wingScore = 4012 },
    MASTER      = { minScore = 3824, wingScore = 3891 },
    DIAMOND     = { minScore = 3547, wingScore = 3659 },
    EMERALD     = { minScore = 3411, wingScore = 3450 },
    PLATINUM    = { minScore = 3087, wingScore = 3222 },
    GOLD        = { minScore = 2729, wingScore = 2955 },
    SILVER      = { minScore = 1487, wingScore = 2336 },
    BRONZE      = { minScore =  358, wingScore =  860 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4229,
    CHALLENGER  = { minScore = 3971, wingScore = 4134 },
    GRANDMASTER = { minScore = 3919, wingScore = 3945 },
    MASTER      = { minScore = 3738, wingScore = 3828 },
    DIAMOND     = { minScore = 3592, wingScore = 3665 },
    EMERALD     = { minScore = 3398, wingScore = 3495 },
    PLATINUM    = { minScore = 3108, wingScore = 3224 },
    GOLD        = { minScore = 2729, wingScore = 2910 },
    SILVER      = { minScore = 1487, wingScore = 2336 },
    BRONZE      = { minScore =  358, wingScore =  860 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4229,
    CHALLENGER  = { minScore = 4131, wingScore = 4134 },
    GRANDMASTER = { minScore = 4078, wingScore = 4104 },
    MASTER      = { minScore = 3892, wingScore = 3985 },
    DIAMOND     = { minScore = 3729, wingScore = 3811 },
    EMERALD     = { minScore = 3513, wingScore = 3621 },
    PLATINUM    = { minScore = 3163, wingScore = 3308 },
    GOLD        = { minScore = 2729, wingScore = 2948 },
    SILVER      = { minScore = 1487, wingScore = 2336 },
    BRONZE      = { minScore =  358, wingScore =  860 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4276,
    CHALLENGER  = { minScore = 4099, wingScore = 4147 },
    GRANDMASTER = { minScore = 3994, wingScore = 4029 },
    MASTER      = { minScore = 3861, wingScore = 3911 },
    DIAMOND     = { minScore = 3597, wingScore = 3701 },
    EMERALD     = { minScore = 3439, wingScore = 3502 },
    PLATINUM    = { minScore = 3134, wingScore = 3281 },
    GOLD        = { minScore = 2786, wingScore = 2992 },
    SILVER      = { minScore = 1666, wingScore = 2460 },
    BRONZE      = { minScore =  426, wingScore =  977 },
    IRON        = { minScore =    1, wingScore =  219 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4276,
    CHALLENGER  = { minScore = 4001, wingScore = 4148 },
    GRANDMASTER = { minScore = 3952, wingScore = 3976 },
    MASTER      = { minScore = 3780, wingScore = 3865 },
    DIAMOND     = { minScore = 3640, wingScore = 3710 },
    EMERALD     = { minScore = 3454, wingScore = 3547 },
    PLATINUM    = { minScore = 3145, wingScore = 3275 },
    GOLD        = { minScore = 2788, wingScore = 2945 },
    SILVER      = { minScore = 1669, wingScore = 2462 },
    BRONZE      = { minScore =  427, wingScore =  979 },
    IRON        = { minScore =    1, wingScore =  220 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4276,
    CHALLENGER  = { minScore = 4141, wingScore = 4147 },
    GRANDMASTER = { minScore = 4089, wingScore = 4115 },
    MASTER      = { minScore = 3911, wingScore = 4000 },
    DIAMOND     = { minScore = 3750, wingScore = 3831 },
    EMERALD     = { minScore = 3536, wingScore = 3643 },
    PLATINUM    = { minScore = 3193, wingScore = 3335 },
    GOLD        = { minScore = 2785, wingScore = 2989 },
    SILVER      = { minScore = 1662, wingScore = 2457 },
    BRONZE      = { minScore =  425, wingScore =  974 },
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
