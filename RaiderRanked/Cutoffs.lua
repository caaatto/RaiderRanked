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
    top100Score = 4244,
    CHALLENGER  = { minScore = 4068, wingScore = 4130 },
    GRANDMASTER = { minScore = 3983, wingScore = 4014 },
    MASTER      = { minScore = 3848, wingScore = 3898 },
    DIAMOND     = { minScore = 3609, wingScore = 3703 },
    EMERALD     = { minScore = 3448, wingScore = 3523 },
    PLATINUM    = { minScore = 3156, wingScore = 3310 },
    GOLD        = { minScore = 2817, wingScore = 3015 },
    SILVER      = { minScore = 1796, wingScore = 2542 },
    BRONZE      = { minScore =  485, wingScore =  1067 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4244,
    CHALLENGER  = { minScore = 4008, wingScore = 4130 },
    GRANDMASTER = { minScore = 3958, wingScore = 3983 },
    MASTER      = { minScore = 3782, wingScore = 3870 },
    DIAMOND     = { minScore = 3650, wingScore = 3716 },
    EMERALD     = { minScore = 3474, wingScore = 3562 },
    PLATINUM    = { minScore = 3160, wingScore = 3295 },
    GOLD        = { minScore = 2817, wingScore = 2963 },
    SILVER      = { minScore = 1796, wingScore = 2542 },
    BRONZE      = { minScore =  485, wingScore =  1067 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4244,
    CHALLENGER  = { minScore = 4118, wingScore = 4130 },
    GRANDMASTER = { minScore = 4069, wingScore = 4094 },
    MASTER      = { minScore = 3897, wingScore = 3983 },
    DIAMOND     = { minScore = 3744, wingScore = 3821 },
    EMERALD     = { minScore = 3540, wingScore = 3642 },
    PLATINUM    = { minScore = 3207, wingScore = 3345 },
    GOLD        = { minScore = 2817, wingScore = 3010 },
    SILVER      = { minScore = 1796, wingScore = 2542 },
    BRONZE      = { minScore =  485, wingScore =  1067 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4182,
    CHALLENGER  = { minScore = 4029, wingScore = 4092 },
    GRANDMASTER = { minScore = 3926, wingScore = 3975 },
    MASTER      = { minScore = 3786, wingScore = 3847 },
    DIAMOND     = { minScore = 3529, wingScore = 3629 },
    EMERALD     = { minScore = 3405, wingScore = 3439 },
    PLATINUM    = { minScore = 3079, wingScore = 3208 },
    GOLD        = { minScore = 2721, wingScore = 2939 },
    SILVER      = { minScore = 1487, wingScore = 2330 },
    BRONZE      = { minScore =  361, wingScore =  864 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4182,
    CHALLENGER  = { minScore = 3933, wingScore = 4092 },
    GRANDMASTER = { minScore = 3881, wingScore = 3907 },
    MASTER      = { minScore = 3699, wingScore = 3790 },
    DIAMOND     = { minScore = 3560, wingScore = 3630 },
    EMERALD     = { minScore = 3373, wingScore = 3466 },
    PLATINUM    = { minScore = 3099, wingScore = 3208 },
    GOLD        = { minScore = 2721, wingScore = 2904 },
    SILVER      = { minScore = 1487, wingScore = 2330 },
    BRONZE      = { minScore =  361, wingScore =  864 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4182,
    CHALLENGER  = { minScore = 4077, wingScore = 4092 },
    GRANDMASTER = { minScore = 4026, wingScore = 4051 },
    MASTER      = { minScore = 3847, wingScore = 3936 },
    DIAMOND     = { minScore = 3695, wingScore = 3771 },
    EMERALD     = { minScore = 3492, wingScore = 3593 },
    PLATINUM    = { minScore = 3155, wingScore = 3296 },
    GOLD        = { minScore = 2721, wingScore = 2941 },
    SILVER      = { minScore = 1487, wingScore = 2330 },
    BRONZE      = { minScore =  361, wingScore =  864 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4244,
    CHALLENGER  = { minScore = 4052, wingScore = 4114 },
    GRANDMASTER = { minScore = 3959, wingScore = 3998 },
    MASTER      = { minScore = 3822, wingScore = 3877 },
    DIAMOND     = { minScore = 3576, wingScore = 3672 },
    EMERALD     = { minScore = 3430, wingScore = 3488 },
    PLATINUM    = { minScore = 3124, wingScore = 3267 },
    GOLD        = { minScore = 2777, wingScore = 2983 },
    SILVER      = { minScore = 1667, wingScore = 2453 },
    BRONZE      = { minScore =  433, wingScore =  982 },
    IRON        = { minScore =    1, wingScore =  220 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4244,
    CHALLENGER  = { minScore = 3977, wingScore = 4115 },
    GRANDMASTER = { minScore = 3927, wingScore = 3952 },
    MASTER      = { minScore = 3748, wingScore = 3837 },
    DIAMOND     = { minScore = 3613, wingScore = 3681 },
    EMERALD     = { minScore = 3433, wingScore = 3523 },
    PLATINUM    = { minScore = 3135, wingScore = 3260 },
    GOLD        = { minScore = 2778, wingScore = 2939 },
    SILVER      = { minScore = 1670, wingScore = 2456 },
    BRONZE      = { minScore =  434, wingScore =  984 },
    IRON        = { minScore =    1, wingScore =  221 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4244,
    CHALLENGER  = { minScore = 4100, wingScore = 4114 },
    GRANDMASTER = { minScore = 4051, wingScore = 4076 },
    MASTER      = { minScore = 3876, wingScore = 3963 },
    DIAMOND     = { minScore = 3723, wingScore = 3800 },
    EMERALD     = { minScore = 3519, wingScore = 3621 },
    PLATINUM    = { minScore = 3185, wingScore = 3324 },
    GOLD        = { minScore = 2776, wingScore = 2980 },
    SILVER      = { minScore = 1663, wingScore = 2451 },
    BRONZE      = { minScore =  432, wingScore =  980 },
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
