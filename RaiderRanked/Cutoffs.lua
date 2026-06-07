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
    top100Score = 4201,
    CHALLENGER  = { minScore = 4030, wingScore = 4086 },
    GRANDMASTER = { minScore = 3949, wingScore = 3992 },
    MASTER      = { minScore = 3816, wingScore = 3876 },
    DIAMOND     = { minScore = 3584, wingScore = 3677 },
    EMERALD     = { minScore = 3434, wingScore = 3499 },
    PLATINUM    = { minScore = 3138, wingScore = 3286 },
    GOLD        = { minScore = 2798, wingScore = 3007 },
    SILVER      = { minScore = 1768, wingScore = 2520 },
    BRONZE      = { minScore =  485, wingScore =  1052 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4201,
    CHALLENGER  = { minScore = 3974, wingScore = 4086 },
    GRANDMASTER = { minScore = 3928, wingScore = 3951 },
    MASTER      = { minScore = 3767, wingScore = 3848 },
    DIAMOND     = { minScore = 3630, wingScore = 3699 },
    EMERALD     = { minScore = 3448, wingScore = 3539 },
    PLATINUM    = { minScore = 3144, wingScore = 3271 },
    GOLD        = { minScore = 2798, wingScore = 2950 },
    SILVER      = { minScore = 1768, wingScore = 2520 },
    BRONZE      = { minScore =  485, wingScore =  1052 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4201,
    CHALLENGER  = { minScore = 4075, wingScore = 4086 },
    GRANDMASTER = { minScore = 4030, wingScore = 4052 },
    MASTER      = { minScore = 3871, wingScore = 3950 },
    DIAMOND     = { minScore = 3722, wingScore = 3796 },
    EMERALD     = { minScore = 3524, wingScore = 3623 },
    PLATINUM    = { minScore = 3194, wingScore = 3332 },
    GOLD        = { minScore = 2798, wingScore = 2994 },
    SILVER      = { minScore = 1768, wingScore = 2520 },
    BRONZE      = { minScore =  485, wingScore =  1052 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4150,
    CHALLENGER  = { minScore = 4011, wingScore = 4044 },
    GRANDMASTER = { minScore = 3901, wingScore = 3937 },
    MASTER      = { minScore = 3763, wingScore = 3810 },
    DIAMOND     = { minScore = 3504, wingScore = 3600 },
    EMERALD     = { minScore = 3382, wingScore = 3427 },
    PLATINUM    = { minScore = 3066, wingScore = 3187 },
    GOLD        = { minScore = 2706, wingScore = 2912 },
    SILVER      = { minScore = 1467, wingScore = 2311 },
    BRONZE      = { minScore =  361, wingScore =  856 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4150,
    CHALLENGER  = { minScore = 3908, wingScore = 4044 },
    GRANDMASTER = { minScore = 3856, wingScore = 3882 },
    MASTER      = { minScore = 3674, wingScore = 3765 },
    DIAMOND     = { minScore = 3534, wingScore = 3604 },
    EMERALD     = { minScore = 3348, wingScore = 3441 },
    PLATINUM    = { minScore = 3085, wingScore = 3187 },
    GOLD        = { minScore = 2706, wingScore = 2894 },
    SILVER      = { minScore = 1467, wingScore = 2311 },
    BRONZE      = { minScore =  361, wingScore =  856 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4150,
    CHALLENGER  = { minScore = 4036, wingScore = 4044 },
    GRANDMASTER = { minScore = 3986, wingScore = 4011 },
    MASTER      = { minScore = 3810, wingScore = 3898 },
    DIAMOND     = { minScore = 3658, wingScore = 3734 },
    EMERALD     = { minScore = 3457, wingScore = 3558 },
    PLATINUM    = { minScore = 3136, wingScore = 3268 },
    GOLD        = { minScore = 2706, wingScore = 2929 },
    SILVER      = { minScore = 1467, wingScore = 2311 },
    BRONZE      = { minScore =  361, wingScore =  856 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4201,
    CHALLENGER  = { minScore = 4022, wingScore = 4068 },
    GRANDMASTER = { minScore = 3929, wingScore = 3969 },
    MASTER      = { minScore = 3794, wingScore = 3848 },
    DIAMOND     = { minScore = 3551, wingScore = 3645 },
    EMERALD     = { minScore = 3412, wingScore = 3469 },
    PLATINUM    = { minScore = 3108, wingScore = 3245 },
    GOLD        = { minScore = 2760, wingScore = 2967 },
    SILVER      = { minScore = 1642, wingScore = 2433 },
    BRONZE      = { minScore =  433, wingScore =  970 },
    IRON        = { minScore =    1, wingScore =  220 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4201,
    CHALLENGER  = { minScore = 3947, wingScore = 4069 },
    GRANDMASTER = { minScore = 3899, wingScore = 3923 },
    MASTER      = { minScore = 3729, wingScore = 3814 },
    DIAMOND     = { minScore = 3591, wingScore = 3660 },
    EMERALD     = { minScore = 3407, wingScore = 3499 },
    PLATINUM    = { minScore = 3120, wingScore = 3237 },
    GOLD        = { minScore = 2761, wingScore = 2927 },
    SILVER      = { minScore = 1646, wingScore = 2435 },
    BRONZE      = { minScore =  435, wingScore =  972 },
    IRON        = { minScore =    1, wingScore =  221 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4201,
    CHALLENGER  = { minScore = 4058, wingScore = 4068 },
    GRANDMASTER = { minScore = 4011, wingScore = 4034 },
    MASTER      = { minScore = 3845, wingScore = 3928 },
    DIAMOND     = { minScore = 3695, wingScore = 3769 },
    EMERALD     = { minScore = 3495, wingScore = 3595 },
    PLATINUM    = { minScore = 3169, wingScore = 3305 },
    GOLD        = { minScore = 2758, wingScore = 2966 },
    SILVER      = { minScore = 1639, wingScore = 2430 },
    BRONZE      = { minScore =  432, wingScore =  968 },
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
