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
    top100Score = 4255,
    CHALLENGER  = { minScore = 4087, wingScore = 4136 },
    GRANDMASTER = { minScore = 4000, wingScore = 4022 },
    MASTER      = { minScore = 3862, wingScore = 3908 },
    DIAMOND     = { minScore = 3619, wingScore = 3714 },
    EMERALD     = { minScore = 3453, wingScore = 3531 },
    PLATINUM    = { minScore = 3162, wingScore = 3316 },
    GOLD        = { minScore = 2822, wingScore = 3017 },
    SILVER      = { minScore = 1796, wingScore = 2545 },
    BRONZE      = { minScore =  483, wingScore =  1065 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4255,
    CHALLENGER  = { minScore = 4012, wingScore = 4136 },
    GRANDMASTER = { minScore = 3963, wingScore = 3988 },
    MASTER      = { minScore = 3791, wingScore = 3877 },
    DIAMOND     = { minScore = 3661, wingScore = 3726 },
    EMERALD     = { minScore = 3486, wingScore = 3573 },
    PLATINUM    = { minScore = 3167, wingScore = 3306 },
    GOLD        = { minScore = 2822, wingScore = 2966 },
    SILVER      = { minScore = 1796, wingScore = 2545 },
    BRONZE      = { minScore =  483, wingScore =  1065 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4255,
    CHALLENGER  = { minScore = 4134, wingScore = 4136 },
    GRANDMASTER = { minScore = 4083, wingScore = 4108 },
    MASTER      = { minScore = 3908, wingScore = 3995 },
    DIAMOND     = { minScore = 3752, wingScore = 3830 },
    EMERALD     = { minScore = 3545, wingScore = 3649 },
    PLATINUM    = { minScore = 3211, wingScore = 3350 },
    GOLD        = { minScore = 2822, wingScore = 3015 },
    SILVER      = { minScore = 1796, wingScore = 2545 },
    BRONZE      = { minScore =  483, wingScore =  1065 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4204,
    CHALLENGER  = { minScore = 4041, wingScore = 4116 },
    GRANDMASTER = { minScore = 3941, wingScore = 3990 },
    MASTER      = { minScore = 3799, wingScore = 3862 },
    DIAMOND     = { minScore = 3537, wingScore = 3643 },
    EMERALD     = { minScore = 3407, wingScore = 3444 },
    PLATINUM    = { minScore = 3083, wingScore = 3214 },
    GOLD        = { minScore = 2725, wingScore = 2947 },
    SILVER      = { minScore = 1488, wingScore = 2333 },
    BRONZE      = { minScore =  360, wingScore =  864 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4204,
    CHALLENGER  = { minScore = 3950, wingScore = 4116 },
    GRANDMASTER = { minScore = 3898, wingScore = 3924 },
    MASTER      = { minScore = 3713, wingScore = 3806 },
    DIAMOND     = { minScore = 3572, wingScore = 3643 },
    EMERALD     = { minScore = 3383, wingScore = 3477 },
    PLATINUM    = { minScore = 3103, wingScore = 3214 },
    GOLD        = { minScore = 2725, wingScore = 2907 },
    SILVER      = { minScore = 1488, wingScore = 2333 },
    BRONZE      = { minScore =  360, wingScore =  864 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4204,
    CHALLENGER  = { minScore = 4096, wingScore = 4116 },
    GRANDMASTER = { minScore = 4044, wingScore = 4070 },
    MASTER      = { minScore = 3862, wingScore = 3953 },
    DIAMOND     = { minScore = 3708, wingScore = 3785 },
    EMERALD     = { minScore = 3504, wingScore = 3606 },
    PLATINUM    = { minScore = 3160, wingScore = 3305 },
    GOLD        = { minScore = 2725, wingScore = 2944 },
    SILVER      = { minScore = 1488, wingScore = 2333 },
    BRONZE      = { minScore =  360, wingScore =  864 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4255,
    CHALLENGER  = { minScore = 4068, wingScore = 4128 },
    GRANDMASTER = { minScore = 3975, wingScore = 4009 },
    MASTER      = { minScore = 3836, wingScore = 3889 },
    DIAMOND     = { minScore = 3585, wingScore = 3684 },
    EMERALD     = { minScore = 3434, wingScore = 3495 },
    PLATINUM    = { minScore = 3129, wingScore = 3273 },
    GOLD        = { minScore = 2781, wingScore = 2988 },
    SILVER      = { minScore = 1667, wingScore = 2456 },
    BRONZE      = { minScore =  431, wingScore =  981 },
    IRON        = { minScore =    1, wingScore =  220 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4255,
    CHALLENGER  = { minScore = 3987, wingScore = 4128 },
    GRANDMASTER = { minScore = 3936, wingScore = 3962 },
    MASTER      = { minScore = 3759, wingScore = 3848 },
    DIAMOND     = { minScore = 3625, wingScore = 3692 },
    EMERALD     = { minScore = 3444, wingScore = 3534 },
    PLATINUM    = { minScore = 3141, wingScore = 3268 },
    GOLD        = { minScore = 2782, wingScore = 2942 },
    SILVER      = { minScore = 1670, wingScore = 2459 },
    BRONZE      = { minScore =  433, wingScore =  983 },
    IRON        = { minScore =    1, wingScore =  221 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4255,
    CHALLENGER  = { minScore = 4118, wingScore = 4127 },
    GRANDMASTER = { minScore = 4066, wingScore = 4092 },
    MASTER      = { minScore = 3888, wingScore = 3977 },
    DIAMOND     = { minScore = 3733, wingScore = 3811 },
    EMERALD     = { minScore = 3527, wingScore = 3630 },
    PLATINUM    = { minScore = 3189, wingScore = 3331 },
    GOLD        = { minScore = 2780, wingScore = 2984 },
    SILVER      = { minScore = 1663, wingScore = 2454 },
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
