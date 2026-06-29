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
    top100Score = 4259,
    CHALLENGER  = { minScore = 4103, wingScore = 4142 },
    GRANDMASTER = { minScore = 4010, wingScore = 4030 },
    MASTER      = { minScore = 3875, wingScore = 3917 },
    DIAMOND     = { minScore = 3628, wingScore = 3724 },
    EMERALD     = { minScore = 3457, wingScore = 3537 },
    PLATINUM    = { minScore = 3166, wingScore = 3321 },
    GOLD        = { minScore = 2827, wingScore = 3018 },
    SILVER      = { minScore = 1802, wingScore = 2550 },
    BRONZE      = { minScore =  484, wingScore =  1069 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4259,
    CHALLENGER  = { minScore = 4016, wingScore = 4142 },
    GRANDMASTER = { minScore = 3969, wingScore = 3992 },
    MASTER      = { minScore = 3802, wingScore = 3885 },
    DIAMOND     = { minScore = 3668, wingScore = 3735 },
    EMERALD     = { minScore = 3491, wingScore = 3579 },
    PLATINUM    = { minScore = 3170, wingScore = 3309 },
    GOLD        = { minScore = 2827, wingScore = 2970 },
    SILVER      = { minScore = 1802, wingScore = 2550 },
    BRONZE      = { minScore =  484, wingScore =  1069 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4259,
    CHALLENGER  = { minScore = 4139, wingScore = 4142 },
    GRANDMASTER = { minScore = 4089, wingScore = 4114 },
    MASTER      = { minScore = 3916, wingScore = 4002 },
    DIAMOND     = { minScore = 3759, wingScore = 3837 },
    EMERALD     = { minScore = 3550, wingScore = 3654 },
    PLATINUM    = { minScore = 3215, wingScore = 3353 },
    GOLD        = { minScore = 2827, wingScore = 3018 },
    SILVER      = { minScore = 1802, wingScore = 2550 },
    BRONZE      = { minScore =  484, wingScore =  1069 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4216,
    CHALLENGER  = { minScore = 4059, wingScore = 4130 },
    GRANDMASTER = { minScore = 3955, wingScore = 4007 },
    MASTER      = { minScore = 3813, wingScore = 3880 },
    DIAMOND     = { minScore = 3544, wingScore = 3654 },
    EMERALD     = { minScore = 3410, wingScore = 3448 },
    PLATINUM    = { minScore = 3086, wingScore = 3220 },
    GOLD        = { minScore = 2729, wingScore = 2953 },
    SILVER      = { minScore = 1496, wingScore = 2338 },
    BRONZE      = { minScore =  361, wingScore =  868 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4216,
    CHALLENGER  = { minScore = 3961, wingScore = 4130 },
    GRANDMASTER = { minScore = 3909, wingScore = 3935 },
    MASTER      = { minScore = 3728, wingScore = 3819 },
    DIAMOND     = { minScore = 3584, wingScore = 3656 },
    EMERALD     = { minScore = 3393, wingScore = 3489 },
    PLATINUM    = { minScore = 3107, wingScore = 3221 },
    GOLD        = { minScore = 2729, wingScore = 2909 },
    SILVER      = { minScore = 1496, wingScore = 2338 },
    BRONZE      = { minScore =  361, wingScore =  868 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4216,
    CHALLENGER  = { minScore = 4122, wingScore = 4130 },
    GRANDMASTER = { minScore = 4069, wingScore = 4095 },
    MASTER      = { minScore = 3881, wingScore = 3975 },
    DIAMOND     = { minScore = 3722, wingScore = 3801 },
    EMERALD     = { minScore = 3510, wingScore = 3616 },
    PLATINUM    = { minScore = 3162, wingScore = 3307 },
    GOLD        = { minScore = 2729, wingScore = 2947 },
    SILVER      = { minScore = 1496, wingScore = 2338 },
    BRONZE      = { minScore =  361, wingScore =  868 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4259,
    CHALLENGER  = { minScore = 4085, wingScore = 4137 },
    GRANDMASTER = { minScore = 3987, wingScore = 4020 },
    MASTER      = { minScore = 3849, wingScore = 3901 },
    DIAMOND     = { minScore = 3593, wingScore = 3695 },
    EMERALD     = { minScore = 3437, wingScore = 3500 },
    PLATINUM    = { minScore = 3132, wingScore = 3279 },
    GOLD        = { minScore = 2786, wingScore = 2991 },
    SILVER      = { minScore = 1674, wingScore = 2461 },
    BRONZE      = { minScore =  432, wingScore =  985 },
    IRON        = { minScore =    1, wingScore =  220 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4259,
    CHALLENGER  = { minScore = 3994, wingScore = 4137 },
    GRANDMASTER = { minScore = 3944, wingScore = 3969 },
    MASTER      = { minScore = 3772, wingScore = 3858 },
    DIAMOND     = { minScore = 3634, wingScore = 3703 },
    EMERALD     = { minScore = 3451, wingScore = 3542 },
    PLATINUM    = { minScore = 3144, wingScore = 3273 },
    GOLD        = { minScore = 2787, wingScore = 2945 },
    SILVER      = { minScore = 1677, wingScore = 2463 },
    BRONZE      = { minScore =  434, wingScore =  987 },
    IRON        = { minScore =    1, wingScore =  220 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4259,
    CHALLENGER  = { minScore = 4132, wingScore = 4137 },
    GRANDMASTER = { minScore = 4080, wingScore = 4106 },
    MASTER      = { minScore = 3901, wingScore = 3990 },
    DIAMOND     = { minScore = 3743, wingScore = 3821 },
    EMERALD     = { minScore = 3533, wingScore = 3638 },
    PLATINUM    = { minScore = 3192, wingScore = 3333 },
    GOLD        = { minScore = 2785, wingScore = 2987 },
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
