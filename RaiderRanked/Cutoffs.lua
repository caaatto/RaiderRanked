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
    top100Score = 4279,
    CHALLENGER  = { minScore = 4130, wingScore = 4165 },
    GRANDMASTER = { minScore = 4015, wingScore = 4051 },
    MASTER      = { minScore = 3892, wingScore = 3935 },
    DIAMOND     = { minScore = 3637, wingScore = 3737 },
    EMERALD     = { minScore = 3461, wingScore = 3541 },
    PLATINUM    = { minScore = 3168, wingScore = 3324 },
    GOLD        = { minScore = 2826, wingScore = 3019 },
    SILVER      = { minScore = 1780, wingScore = 2543 },
    BRONZE      = { minScore =  467, wingScore =  1048 },
    IRON        = { minScore =    1, wingScore =  242 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4279,
    CHALLENGER  = { minScore = 4027, wingScore = 4165 },
    GRANDMASTER = { minScore = 3980, wingScore = 4004 },
    MASTER      = { minScore = 3816, wingScore = 3898 },
    DIAMOND     = { minScore = 3679, wingScore = 3748 },
    EMERALD     = { minScore = 3495, wingScore = 3587 },
    PLATINUM    = { minScore = 3170, wingScore = 3310 },
    GOLD        = { minScore = 2826, wingScore = 2970 },
    SILVER      = { minScore = 1780, wingScore = 2543 },
    BRONZE      = { minScore =  467, wingScore =  1048 },
    IRON        = { minScore =    1, wingScore =  242 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4279,
    CHALLENGER  = { minScore = 4154, wingScore = 4165 },
    GRANDMASTER = { minScore = 4105, wingScore = 4130 },
    MASTER      = { minScore = 3933, wingScore = 4019 },
    DIAMOND     = { minScore = 3771, wingScore = 3852 },
    EMERALD     = { minScore = 3556, wingScore = 3664 },
    PLATINUM    = { minScore = 3216, wingScore = 3355 },
    GOLD        = { minScore = 2826, wingScore = 3019 },
    SILVER      = { minScore = 1780, wingScore = 2543 },
    BRONZE      = { minScore =  467, wingScore =  1048 },
    IRON        = { minScore =    1, wingScore =  242 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4240,
    CHALLENGER  = { minScore = 4085, wingScore = 4137 },
    GRANDMASTER = { minScore = 3978, wingScore = 4015 },
    MASTER      = { minScore = 3834, wingScore = 3894 },
    DIAMOND     = { minScore = 3549, wingScore = 3662 },
    EMERALD     = { minScore = 3411, wingScore = 3451 },
    PLATINUM    = { minScore = 3086, wingScore = 3222 },
    GOLD        = { minScore = 2727, wingScore = 2954 },
    SILVER      = { minScore = 1473, wingScore = 2329 },
    BRONZE      = { minScore =  355, wingScore =  851 },
    IRON        = { minScore =    1, wingScore =  183 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4240,
    CHALLENGER  = { minScore = 3982, wingScore = 4137 },
    GRANDMASTER = { minScore = 3929, wingScore = 3955 },
    MASTER      = { minScore = 3746, wingScore = 3838 },
    DIAMOND     = { minScore = 3598, wingScore = 3672 },
    EMERALD     = { minScore = 3400, wingScore = 3499 },
    PLATINUM    = { minScore = 3108, wingScore = 3224 },
    GOLD        = { minScore = 2727, wingScore = 2909 },
    SILVER      = { minScore = 1473, wingScore = 2329 },
    BRONZE      = { minScore =  355, wingScore =  851 },
    IRON        = { minScore =    1, wingScore =  183 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4240,
    CHALLENGER  = { minScore = 4134, wingScore = 4137 },
    GRANDMASTER = { minScore = 4081, wingScore = 4108 },
    MASTER      = { minScore = 3895, wingScore = 3988 },
    DIAMOND     = { minScore = 3732, wingScore = 3814 },
    EMERALD     = { minScore = 3514, wingScore = 3623 },
    PLATINUM    = { minScore = 3163, wingScore = 3309 },
    GOLD        = { minScore = 2727, wingScore = 2947 },
    SILVER      = { minScore = 1473, wingScore = 2329 },
    BRONZE      = { minScore =  355, wingScore =  851 },
    IRON        = { minScore =    1, wingScore =  183 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4279,
    CHALLENGER  = { minScore = 4111, wingScore = 4153 },
    GRANDMASTER = { minScore = 3999, wingScore = 4036 },
    MASTER      = { minScore = 3868, wingScore = 3918 },
    DIAMOND     = { minScore = 3600, wingScore = 3705 },
    EMERALD     = { minScore = 3440, wingScore = 3503 },
    PLATINUM    = { minScore = 3134, wingScore = 3281 },
    GOLD        = { minScore = 2784, wingScore = 2992 },
    SILVER      = { minScore = 1651, wingScore = 2453 },
    BRONZE      = { minScore =  420, wingScore =  965 },
    IRON        = { minScore =    1, wingScore =  217 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4279,
    CHALLENGER  = { minScore = 4009, wingScore = 4154 },
    GRANDMASTER = { minScore = 3959, wingScore = 3984 },
    MASTER      = { minScore = 3787, wingScore = 3873 },
    DIAMOND     = { minScore = 3646, wingScore = 3717 },
    EMERALD     = { minScore = 3456, wingScore = 3551 },
    PLATINUM    = { minScore = 3145, wingScore = 3275 },
    GOLD        = { minScore = 2785, wingScore = 2945 },
    SILVER      = { minScore = 1654, wingScore = 2455 },
    BRONZE      = { minScore =  421, wingScore =  967 },
    IRON        = { minScore =    1, wingScore =  218 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4279,
    CHALLENGER  = { minScore = 4145, wingScore = 4153 },
    GRANDMASTER = { minScore = 4095, wingScore = 4121 },
    MASTER      = { minScore = 3917, wingScore = 4006 },
    DIAMOND     = { minScore = 3754, wingScore = 3836 },
    EMERALD     = { minScore = 3538, wingScore = 3646 },
    PLATINUM    = { minScore = 3193, wingScore = 3335 },
    GOLD        = { minScore = 2783, wingScore = 2988 },
    SILVER      = { minScore = 1648, wingScore = 2451 },
    BRONZE      = { minScore =  419, wingScore =  963 },
    IRON        = { minScore =    1, wingScore =  217 },
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
