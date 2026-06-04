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
    top100Score = 4191,
    CHALLENGER  = { minScore = 4023, wingScore = 4072 },
    GRANDMASTER = { minScore = 3935, wingScore = 3979 },
    MASTER      = { minScore = 3806, wingScore = 3864 },
    DIAMOND     = { minScore = 3575, wingScore = 3670 },
    EMERALD     = { minScore = 3429, wingScore = 3489 },
    PLATINUM    = { minScore = 3131, wingScore = 3276 },
    GOLD        = { minScore = 2792, wingScore = 3004 },
    SILVER      = { minScore = 1763, wingScore = 2514 },
    BRONZE      = { minScore =  488, wingScore =  1051 },
    IRON        = { minScore =    1, wingScore =  254 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4191,
    CHALLENGER  = { minScore = 3964, wingScore = 4072 },
    GRANDMASTER = { minScore = 3917, wingScore = 3941 },
    MASTER      = { minScore = 3754, wingScore = 3836 },
    DIAMOND     = { minScore = 3618, wingScore = 3686 },
    EMERALD     = { minScore = 3437, wingScore = 3527 },
    PLATINUM    = { minScore = 3138, wingScore = 3263 },
    GOLD        = { minScore = 2792, wingScore = 2946 },
    SILVER      = { minScore = 1763, wingScore = 2514 },
    BRONZE      = { minScore =  488, wingScore =  1051 },
    IRON        = { minScore =    1, wingScore =  254 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4191,
    CHALLENGER  = { minScore = 4059, wingScore = 4072 },
    GRANDMASTER = { minScore = 4015, wingScore = 4037 },
    MASTER      = { minScore = 3860, wingScore = 3937 },
    DIAMOND     = { minScore = 3713, wingScore = 3786 },
    EMERALD     = { minScore = 3517, wingScore = 3615 },
    PLATINUM    = { minScore = 3188, wingScore = 3326 },
    GOLD        = { minScore = 2792, wingScore = 2987 },
    SILVER      = { minScore = 1763, wingScore = 2514 },
    BRONZE      = { minScore =  488, wingScore =  1051 },
    IRON        = { minScore =    1, wingScore =  254 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4138,
    CHALLENGER  = { minScore = 3999, wingScore = 4034 },
    GRANDMASTER = { minScore = 3895, wingScore = 3924 },
    MASTER      = { minScore = 3749, wingScore = 3801 },
    DIAMOND     = { minScore = 3495, wingScore = 3588 },
    EMERALD     = { minScore = 3369, wingScore = 3422 },
    PLATINUM    = { minScore = 3061, wingScore = 3179 },
    GOLD        = { minScore = 2701, wingScore = 2903 },
    SILVER      = { minScore = 1463, wingScore = 2305 },
    BRONZE      = { minScore =  361, wingScore =  855 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4138,
    CHALLENGER  = { minScore = 3901, wingScore = 4034 },
    GRANDMASTER = { minScore = 3848, wingScore = 3875 },
    MASTER      = { minScore = 3663, wingScore = 3756 },
    DIAMOND     = { minScore = 3524, wingScore = 3594 },
    EMERALD     = { minScore = 3339, wingScore = 3431 },
    PLATINUM    = { minScore = 3076, wingScore = 3178 },
    GOLD        = { minScore = 2701, wingScore = 2887 },
    SILVER      = { minScore = 1463, wingScore = 2305 },
    BRONZE      = { minScore =  361, wingScore =  855 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4138,
    CHALLENGER  = { minScore = 4028, wingScore = 4034 },
    GRANDMASTER = { minScore = 3977, wingScore = 4002 },
    MASTER      = { minScore = 3799, wingScore = 3888 },
    DIAMOND     = { minScore = 3648, wingScore = 3723 },
    EMERALD     = { minScore = 3446, wingScore = 3547 },
    PLATINUM    = { minScore = 3131, wingScore = 3259 },
    GOLD        = { minScore = 2701, wingScore = 2924 },
    SILVER      = { minScore = 1463, wingScore = 2305 },
    BRONZE      = { minScore =  361, wingScore =  855 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4191,
    CHALLENGER  = { minScore = 4013, wingScore = 4056 },
    GRANDMASTER = { minScore = 3918, wingScore = 3956 },
    MASTER      = { minScore = 3782, wingScore = 3838 },
    DIAMOND     = { minScore = 3542, wingScore = 3636 },
    EMERALD     = { minScore = 3404, wingScore = 3461 },
    PLATINUM    = { minScore = 3102, wingScore = 3235 },
    GOLD        = { minScore = 2754, wingScore = 2962 },
    SILVER      = { minScore = 1638, wingScore = 2427 },
    BRONZE      = { minScore =  435, wingScore =  969 },
    IRON        = { minScore =    1, wingScore =  225 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4191,
    CHALLENGER  = { minScore = 3938, wingScore = 4057 },
    GRANDMASTER = { minScore = 3889, wingScore = 3914 },
    MASTER      = { minScore = 3717, wingScore = 3803 },
    DIAMOND     = { minScore = 3580, wingScore = 3649 },
    EMERALD     = { minScore = 3397, wingScore = 3488 },
    PLATINUM    = { minScore = 3113, wingScore = 3228 },
    GOLD        = { minScore = 2755, wingScore = 2922 },
    SILVER      = { minScore = 1641, wingScore = 2429 },
    BRONZE      = { minScore =  436, wingScore =  971 },
    IRON        = { minScore =    1, wingScore =  226 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4191,
    CHALLENGER  = { minScore = 4046, wingScore = 4056 },
    GRANDMASTER = { minScore = 3999, wingScore = 4022 },
    MASTER      = { minScore = 3834, wingScore = 3916 },
    DIAMOND     = { minScore = 3685, wingScore = 3759 },
    EMERALD     = { minScore = 3486, wingScore = 3586 },
    PLATINUM    = { minScore = 3164, wingScore = 3297 },
    GOLD        = { minScore = 2753, wingScore = 2960 },
    SILVER      = { minScore = 1634, wingScore = 2424 },
    BRONZE      = { minScore =  433, wingScore =  967 },
    IRON        = { minScore =    1, wingScore =  224 },
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
