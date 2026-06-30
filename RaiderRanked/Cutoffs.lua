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
    top100Score = 4260,
    CHALLENGER  = { minScore = 4105, wingScore = 4145 },
    GRANDMASTER = { minScore = 4011, wingScore = 4032 },
    MASTER      = { minScore = 3877, wingScore = 3919 },
    DIAMOND     = { minScore = 3629, wingScore = 3726 },
    EMERALD     = { minScore = 3458, wingScore = 3538 },
    PLATINUM    = { minScore = 3167, wingScore = 3321 },
    GOLD        = { minScore = 2827, wingScore = 3019 },
    SILVER      = { minScore = 1802, wingScore = 2550 },
    BRONZE      = { minScore =  484, wingScore =  1069 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4260,
    CHALLENGER  = { minScore = 4017, wingScore = 4145 },
    GRANDMASTER = { minScore = 3969, wingScore = 3993 },
    MASTER      = { minScore = 3803, wingScore = 3886 },
    DIAMOND     = { minScore = 3669, wingScore = 3736 },
    EMERALD     = { minScore = 3491, wingScore = 3580 },
    PLATINUM    = { minScore = 3170, wingScore = 3309 },
    GOLD        = { minScore = 2827, wingScore = 2970 },
    SILVER      = { minScore = 1802, wingScore = 2550 },
    BRONZE      = { minScore =  484, wingScore =  1069 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4260,
    CHALLENGER  = { minScore = 4139, wingScore = 4145 },
    GRANDMASTER = { minScore = 4090, wingScore = 4114 },
    MASTER      = { minScore = 3917, wingScore = 4003 },
    DIAMOND     = { minScore = 3760, wingScore = 3839 },
    EMERALD     = { minScore = 3551, wingScore = 3655 },
    PLATINUM    = { minScore = 3215, wingScore = 3353 },
    GOLD        = { minScore = 2827, wingScore = 3019 },
    SILVER      = { minScore = 1802, wingScore = 2550 },
    BRONZE      = { minScore =  484, wingScore =  1069 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4222,
    CHALLENGER  = { minScore = 4060, wingScore = 4131 },
    GRANDMASTER = { minScore = 3956, wingScore = 4008 },
    MASTER      = { minScore = 3815, wingScore = 3881 },
    DIAMOND     = { minScore = 3544, wingScore = 3654 },
    EMERALD     = { minScore = 3410, wingScore = 3448 },
    PLATINUM    = { minScore = 3086, wingScore = 3220 },
    GOLD        = { minScore = 2729, wingScore = 2954 },
    SILVER      = { minScore = 1496, wingScore = 2339 },
    BRONZE      = { minScore =  361, wingScore =  868 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4222,
    CHALLENGER  = { minScore = 3961, wingScore = 4131 },
    GRANDMASTER = { minScore = 3909, wingScore = 3935 },
    MASTER      = { minScore = 3729, wingScore = 3819 },
    DIAMOND     = { minScore = 3585, wingScore = 3657 },
    EMERALD     = { minScore = 3393, wingScore = 3489 },
    PLATINUM    = { minScore = 3107, wingScore = 3221 },
    GOLD        = { minScore = 2729, wingScore = 2909 },
    SILVER      = { minScore = 1496, wingScore = 2339 },
    BRONZE      = { minScore =  361, wingScore =  868 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4222,
    CHALLENGER  = { minScore = 4122, wingScore = 4131 },
    GRANDMASTER = { minScore = 4069, wingScore = 4095 },
    MASTER      = { minScore = 3882, wingScore = 3975 },
    DIAMOND     = { minScore = 3722, wingScore = 3802 },
    EMERALD     = { minScore = 3510, wingScore = 3616 },
    PLATINUM    = { minScore = 3163, wingScore = 3307 },
    GOLD        = { minScore = 2729, wingScore = 2947 },
    SILVER      = { minScore = 1496, wingScore = 2339 },
    BRONZE      = { minScore =  361, wingScore =  868 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4260,
    CHALLENGER  = { minScore = 4086, wingScore = 4139 },
    GRANDMASTER = { minScore = 3988, wingScore = 4022 },
    MASTER      = { minScore = 3851, wingScore = 3903 },
    DIAMOND     = { minScore = 3593, wingScore = 3696 },
    EMERALD     = { minScore = 3438, wingScore = 3500 },
    PLATINUM    = { minScore = 3133, wingScore = 3279 },
    GOLD        = { minScore = 2786, wingScore = 2992 },
    SILVER      = { minScore = 1674, wingScore = 2461 },
    BRONZE      = { minScore =  432, wingScore =  985 },
    IRON        = { minScore =    1, wingScore =  220 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4260,
    CHALLENGER  = { minScore = 3994, wingScore = 4139 },
    GRANDMASTER = { minScore = 3944, wingScore = 3969 },
    MASTER      = { minScore = 3773, wingScore = 3859 },
    DIAMOND     = { minScore = 3635, wingScore = 3704 },
    EMERALD     = { minScore = 3451, wingScore = 3543 },
    PLATINUM    = { minScore = 3144, wingScore = 3273 },
    GOLD        = { minScore = 2787, wingScore = 2945 },
    SILVER      = { minScore = 1677, wingScore = 2464 },
    BRONZE      = { minScore =  434, wingScore =  987 },
    IRON        = { minScore =    1, wingScore =  220 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4260,
    CHALLENGER  = { minScore = 4132, wingScore = 4139 },
    GRANDMASTER = { minScore = 4081, wingScore = 4106 },
    MASTER      = { minScore = 3902, wingScore = 3991 },
    DIAMOND     = { minScore = 3744, wingScore = 3823 },
    EMERALD     = { minScore = 3533, wingScore = 3638 },
    PLATINUM    = { minScore = 3193, wingScore = 3333 },
    GOLD        = { minScore = 2785, wingScore = 2988 },
    SILVER      = { minScore = 1670, wingScore = 2459 },
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
