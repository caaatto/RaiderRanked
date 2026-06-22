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
    top100Score = 4252,
    CHALLENGER  = { minScore = 4076, wingScore = 4133 },
    GRANDMASTER = { minScore = 3993, wingScore = 4016 },
    MASTER      = { minScore = 3854, wingScore = 3903 },
    DIAMOND     = { minScore = 3614, wingScore = 3708 },
    EMERALD     = { minScore = 3451, wingScore = 3528 },
    PLATINUM    = { minScore = 3159, wingScore = 3313 },
    GOLD        = { minScore = 2820, wingScore = 3016 },
    SILVER      = { minScore = 1795, wingScore = 2543 },
    BRONZE      = { minScore =  484, wingScore =  1065 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4252,
    CHALLENGER  = { minScore = 4010, wingScore = 4133 },
    GRANDMASTER = { minScore = 3961, wingScore = 3985 },
    MASTER      = { minScore = 3787, wingScore = 3874 },
    DIAMOND     = { minScore = 3655, wingScore = 3721 },
    EMERALD     = { minScore = 3480, wingScore = 3568 },
    PLATINUM    = { minScore = 3164, wingScore = 3301 },
    GOLD        = { minScore = 2820, wingScore = 2965 },
    SILVER      = { minScore = 1795, wingScore = 2543 },
    BRONZE      = { minScore =  484, wingScore =  1065 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4252,
    CHALLENGER  = { minScore = 4129, wingScore = 4133 },
    GRANDMASTER = { minScore = 4079, wingScore = 4104 },
    MASTER      = { minScore = 3901, wingScore = 3990 },
    DIAMOND     = { minScore = 3747, wingScore = 3824 },
    EMERALD     = { minScore = 3542, wingScore = 3645 },
    PLATINUM    = { minScore = 3209, wingScore = 3348 },
    GOLD        = { minScore = 2820, wingScore = 3012 },
    SILVER      = { minScore = 1795, wingScore = 2543 },
    BRONZE      = { minScore =  484, wingScore =  1065 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4195,
    CHALLENGER  = { minScore = 4035, wingScore = 4104 },
    GRANDMASTER = { minScore = 3935, wingScore = 3983 },
    MASTER      = { minScore = 3792, wingScore = 3853 },
    DIAMOND     = { minScore = 3534, wingScore = 3637 },
    EMERALD     = { minScore = 3406, wingScore = 3441 },
    PLATINUM    = { minScore = 3081, wingScore = 3211 },
    GOLD        = { minScore = 2723, wingScore = 2943 },
    SILVER      = { minScore = 1487, wingScore = 2331 },
    BRONZE      = { minScore =  360, wingScore =  864 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4195,
    CHALLENGER  = { minScore = 3940, wingScore = 4104 },
    GRANDMASTER = { minScore = 3888, wingScore = 3914 },
    MASTER      = { minScore = 3705, wingScore = 3796 },
    DIAMOND     = { minScore = 3565, wingScore = 3635 },
    EMERALD     = { minScore = 3378, wingScore = 3472 },
    PLATINUM    = { minScore = 3101, wingScore = 3211 },
    GOLD        = { minScore = 2723, wingScore = 2906 },
    SILVER      = { minScore = 1487, wingScore = 2331 },
    BRONZE      = { minScore =  360, wingScore =  864 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4195,
    CHALLENGER  = { minScore = 4086, wingScore = 4104 },
    GRANDMASTER = { minScore = 4034, wingScore = 4060 },
    MASTER      = { minScore = 3853, wingScore = 3944 },
    DIAMOND     = { minScore = 3702, wingScore = 3777 },
    EMERALD     = { minScore = 3500, wingScore = 3601 },
    PLATINUM    = { minScore = 3159, wingScore = 3303 },
    GOLD        = { minScore = 2723, wingScore = 2943 },
    SILVER      = { minScore = 1487, wingScore = 2331 },
    BRONZE      = { minScore =  360, wingScore =  864 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4252,
    CHALLENGER  = { minScore = 4059, wingScore = 4121 },
    GRANDMASTER = { minScore = 3969, wingScore = 4002 },
    MASTER      = { minScore = 3828, wingScore = 3882 },
    DIAMOND     = { minScore = 3580, wingScore = 3678 },
    EMERALD     = { minScore = 3432, wingScore = 3492 },
    PLATINUM    = { minScore = 3126, wingScore = 3270 },
    GOLD        = { minScore = 2779, wingScore = 2985 },
    SILVER      = { minScore = 1666, wingScore = 2454 },
    BRONZE      = { minScore =  432, wingScore =  981 },
    IRON        = { minScore =    1, wingScore =  220 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4252,
    CHALLENGER  = { minScore = 3981, wingScore = 4121 },
    GRANDMASTER = { minScore = 3931, wingScore = 3956 },
    MASTER      = { minScore = 3754, wingScore = 3842 },
    DIAMOND     = { minScore = 3618, wingScore = 3686 },
    EMERALD     = { minScore = 3438, wingScore = 3529 },
    PLATINUM    = { minScore = 3138, wingScore = 3264 },
    GOLD        = { minScore = 2780, wingScore = 2941 },
    SILVER      = { minScore = 1669, wingScore = 2457 },
    BRONZE      = { minScore =  433, wingScore =  983 },
    IRON        = { minScore =    1, wingScore =  221 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4252,
    CHALLENGER  = { minScore = 4111, wingScore = 4121 },
    GRANDMASTER = { minScore = 4060, wingScore = 4085 },
    MASTER      = { minScore = 3880, wingScore = 3970 },
    DIAMOND     = { minScore = 3728, wingScore = 3804 },
    EMERALD     = { minScore = 3524, wingScore = 3626 },
    PLATINUM    = { minScore = 3187, wingScore = 3329 },
    GOLD        = { minScore = 2778, wingScore = 2982 },
    SILVER      = { minScore = 1663, wingScore = 2452 },
    BRONZE      = { minScore =  431, wingScore =  979 },
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
