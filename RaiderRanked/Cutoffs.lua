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
    top100Score = 4210,
    CHALLENGER  = { minScore = 4036, wingScore = 4092 },
    GRANDMASTER = { minScore = 3955, wingScore = 3998 },
    MASTER      = { minScore = 3821, wingScore = 3882 },
    DIAMOND     = { minScore = 3589, wingScore = 3682 },
    EMERALD     = { minScore = 3437, wingScore = 3503 },
    PLATINUM    = { minScore = 3141, wingScore = 3291 },
    GOLD        = { minScore = 2800, wingScore = 3008 },
    SILVER      = { minScore = 1768, wingScore = 2522 },
    BRONZE      = { minScore =  483, wingScore =  1052 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4210,
    CHALLENGER  = { minScore = 3981, wingScore = 4092 },
    GRANDMASTER = { minScore = 3934, wingScore = 3958 },
    MASTER      = { minScore = 3772, wingScore = 3853 },
    DIAMOND     = { minScore = 3635, wingScore = 3704 },
    EMERALD     = { minScore = 3452, wingScore = 3544 },
    PLATINUM    = { minScore = 3146, wingScore = 3275 },
    GOLD        = { minScore = 2800, wingScore = 2952 },
    SILVER      = { minScore = 1768, wingScore = 2522 },
    BRONZE      = { minScore =  483, wingScore =  1052 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4210,
    CHALLENGER  = { minScore = 4083, wingScore = 4092 },
    GRANDMASTER = { minScore = 4037, wingScore = 4060 },
    MASTER      = { minScore = 3879, wingScore = 3958 },
    DIAMOND     = { minScore = 3728, wingScore = 3803 },
    EMERALD     = { minScore = 3527, wingScore = 3628 },
    PLATINUM    = { minScore = 3196, wingScore = 3334 },
    GOLD        = { minScore = 2800, wingScore = 2996 },
    SILVER      = { minScore = 1768, wingScore = 2522 },
    BRONZE      = { minScore =  483, wingScore =  1052 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4154,
    CHALLENGER  = { minScore = 4013, wingScore = 4052 },
    GRANDMASTER = { minScore = 3906, wingScore = 3944 },
    MASTER      = { minScore = 3771, wingScore = 3819 },
    DIAMOND     = { minScore = 3509, wingScore = 3605 },
    EMERALD     = { minScore = 3390, wingScore = 3429 },
    PLATINUM    = { minScore = 3068, wingScore = 3191 },
    GOLD        = { minScore = 2707, wingScore = 2916 },
    SILVER      = { minScore = 1467, wingScore = 2312 },
    BRONZE      = { minScore =  360, wingScore =  855 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4154,
    CHALLENGER  = { minScore = 3911, wingScore = 4052 },
    GRANDMASTER = { minScore = 3859, wingScore = 3885 },
    MASTER      = { minScore = 3677, wingScore = 3768 },
    DIAMOND     = { minScore = 3538, wingScore = 3607 },
    EMERALD     = { minScore = 3352, wingScore = 3445 },
    PLATINUM    = { minScore = 3088, wingScore = 3191 },
    GOLD        = { minScore = 2707, wingScore = 2896 },
    SILVER      = { minScore = 1467, wingScore = 2312 },
    BRONZE      = { minScore =  360, wingScore =  855 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4154,
    CHALLENGER  = { minScore = 4044, wingScore = 4052 },
    GRANDMASTER = { minScore = 3994, wingScore = 4019 },
    MASTER      = { minScore = 3819, wingScore = 3906 },
    DIAMOND     = { minScore = 3667, wingScore = 3743 },
    EMERALD     = { minScore = 3464, wingScore = 3565 },
    PLATINUM    = { minScore = 3140, wingScore = 3273 },
    GOLD        = { minScore = 2707, wingScore = 2930 },
    SILVER      = { minScore = 1467, wingScore = 2312 },
    BRONZE      = { minScore =  360, wingScore =  855 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4210,
    CHALLENGER  = { minScore = 4026, wingScore = 4075 },
    GRANDMASTER = { minScore = 3935, wingScore = 3975 },
    MASTER      = { minScore = 3800, wingScore = 3856 },
    DIAMOND     = { minScore = 3556, wingScore = 3650 },
    EMERALD     = { minScore = 3417, wingScore = 3472 },
    PLATINUM    = { minScore = 3110, wingScore = 3249 },
    GOLD        = { minScore = 2761, wingScore = 2970 },
    SILVER      = { minScore = 1642, wingScore = 2434 },
    BRONZE      = { minScore =  432, wingScore =  970 },
    IRON        = { minScore =    1, wingScore =  220 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4210,
    CHALLENGER  = { minScore = 3953, wingScore = 4076 },
    GRANDMASTER = { minScore = 3903, wingScore = 3928 },
    MASTER      = { minScore = 3733, wingScore = 3818 },
    DIAMOND     = { minScore = 3596, wingScore = 3665 },
    EMERALD     = { minScore = 3411, wingScore = 3504 },
    PLATINUM    = { minScore = 3122, wingScore = 3241 },
    GOLD        = { minScore = 2762, wingScore = 2929 },
    SILVER      = { minScore = 1646, wingScore = 2437 },
    BRONZE      = { minScore =  433, wingScore =  972 },
    IRON        = { minScore =    1, wingScore =  221 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4210,
    CHALLENGER  = { minScore = 4066, wingScore = 4075 },
    GRANDMASTER = { minScore = 4019, wingScore = 4042 },
    MASTER      = { minScore = 3853, wingScore = 3936 },
    DIAMOND     = { minScore = 3702, wingScore = 3777 },
    EMERALD     = { minScore = 3500, wingScore = 3601 },
    PLATINUM    = { minScore = 3172, wingScore = 3308 },
    GOLD        = { minScore = 2760, wingScore = 2968 },
    SILVER      = { minScore = 1639, wingScore = 2432 },
    BRONZE      = { minScore =  430, wingScore =  967 },
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
