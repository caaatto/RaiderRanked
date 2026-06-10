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
    top100Score = 4211,
    CHALLENGER  = { minScore = 4040, wingScore = 4098 },
    GRANDMASTER = { minScore = 3957, wingScore = 4001 },
    MASTER      = { minScore = 3823, wingScore = 3885 },
    DIAMOND     = { minScore = 3590, wingScore = 3684 },
    EMERALD     = { minScore = 3437, wingScore = 3505 },
    PLATINUM    = { minScore = 3142, wingScore = 3292 },
    GOLD        = { minScore = 2800, wingScore = 3008 },
    SILVER      = { minScore = 1765, wingScore = 2521 },
    BRONZE      = { minScore =  478, wingScore =  1049 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4211,
    CHALLENGER  = { minScore = 3983, wingScore = 4098 },
    GRANDMASTER = { minScore = 3936, wingScore = 3959 },
    MASTER      = { minScore = 3774, wingScore = 3855 },
    DIAMOND     = { minScore = 3637, wingScore = 3705 },
    EMERALD     = { minScore = 3454, wingScore = 3545 },
    PLATINUM    = { minScore = 3147, wingScore = 3277 },
    GOLD        = { minScore = 2800, wingScore = 2952 },
    SILVER      = { minScore = 1765, wingScore = 2521 },
    BRONZE      = { minScore =  478, wingScore =  1049 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4211,
    CHALLENGER  = { minScore = 4086, wingScore = 4098 },
    GRANDMASTER = { minScore = 4041, wingScore = 4064 },
    MASTER      = { minScore = 3881, wingScore = 3961 },
    DIAMOND     = { minScore = 3730, wingScore = 3806 },
    EMERALD     = { minScore = 3528, wingScore = 3629 },
    PLATINUM    = { minScore = 3196, wingScore = 3335 },
    GOLD        = { minScore = 2800, wingScore = 2997 },
    SILVER      = { minScore = 1765, wingScore = 2521 },
    BRONZE      = { minScore =  478, wingScore =  1049 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4157,
    CHALLENGER  = { minScore = 4014, wingScore = 4057 },
    GRANDMASTER = { minScore = 3907, wingScore = 3947 },
    MASTER      = { minScore = 3772, wingScore = 3822 },
    DIAMOND     = { minScore = 3511, wingScore = 3608 },
    EMERALD     = { minScore = 3393, wingScore = 3430 },
    PLATINUM    = { minScore = 3069, wingScore = 3192 },
    GOLD        = { minScore = 2709, wingScore = 2918 },
    SILVER      = { minScore = 1467, wingScore = 2313 },
    BRONZE      = { minScore =  359, wingScore =  855 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4157,
    CHALLENGER  = { minScore = 3911, wingScore = 4057 },
    GRANDMASTER = { minScore = 3860, wingScore = 3885 },
    MASTER      = { minScore = 3679, wingScore = 3769 },
    DIAMOND     = { minScore = 3540, wingScore = 3609 },
    EMERALD     = { minScore = 3354, wingScore = 3447 },
    PLATINUM    = { minScore = 3088, wingScore = 3192 },
    GOLD        = { minScore = 2709, wingScore = 2897 },
    SILVER      = { minScore = 1467, wingScore = 2313 },
    BRONZE      = { minScore =  359, wingScore =  855 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4157,
    CHALLENGER  = { minScore = 4047, wingScore = 4057 },
    GRANDMASTER = { minScore = 3997, wingScore = 4022 },
    MASTER      = { minScore = 3821, wingScore = 3909 },
    DIAMOND     = { minScore = 3669, wingScore = 3745 },
    EMERALD     = { minScore = 3465, wingScore = 3567 },
    PLATINUM    = { minScore = 3141, wingScore = 3274 },
    GOLD        = { minScore = 2709, wingScore = 2931 },
    SILVER      = { minScore = 1467, wingScore = 2313 },
    BRONZE      = { minScore =  359, wingScore =  855 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4211,
    CHALLENGER  = { minScore = 4029, wingScore = 4081 },
    GRANDMASTER = { minScore = 3936, wingScore = 3978 },
    MASTER      = { minScore = 3802, wingScore = 3859 },
    DIAMOND     = { minScore = 3557, wingScore = 3652 },
    EMERALD     = { minScore = 3419, wingScore = 3474 },
    PLATINUM    = { minScore = 3111, wingScore = 3250 },
    GOLD        = { minScore = 2762, wingScore = 2970 },
    SILVER      = { minScore = 1640, wingScore = 2434 },
    BRONZE      = { minScore =  428, wingScore =  968 },
    IRON        = { minScore =    1, wingScore =  220 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4211,
    CHALLENGER  = { minScore = 3954, wingScore = 4081 },
    GRANDMASTER = { minScore = 3905, wingScore = 3929 },
    MASTER      = { minScore = 3735, wingScore = 3820 },
    DIAMOND     = { minScore = 3598, wingScore = 3666 },
    EMERALD     = { minScore = 3413, wingScore = 3505 },
    PLATINUM    = { minScore = 3123, wingScore = 3242 },
    GOLD        = { minScore = 2763, wingScore = 2930 },
    SILVER      = { minScore = 1644, wingScore = 2436 },
    BRONZE      = { minScore =  430, wingScore =  970 },
    IRON        = { minScore =    1, wingScore =  221 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4211,
    CHALLENGER  = { minScore = 4069, wingScore = 4080 },
    GRANDMASTER = { minScore = 4022, wingScore = 4046 },
    MASTER      = { minScore = 3855, wingScore = 3939 },
    DIAMOND     = { minScore = 3704, wingScore = 3780 },
    EMERALD     = { minScore = 3501, wingScore = 3602 },
    PLATINUM    = { minScore = 3172, wingScore = 3309 },
    GOLD        = { minScore = 2761, wingScore = 2969 },
    SILVER      = { minScore = 1637, wingScore = 2432 },
    BRONZE      = { minScore =  427, wingScore =  966 },
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
