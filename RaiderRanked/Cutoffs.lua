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
    top100Score = 4230,
    CHALLENGER  = { minScore = 4056, wingScore = 4118 },
    GRANDMASTER = { minScore = 3976, wingScore = 4012 },
    MASTER      = { minScore = 3839, wingScore = 3894 },
    DIAMOND     = { minScore = 3603, wingScore = 3697 },
    EMERALD     = { minScore = 3445, wingScore = 3517 },
    PLATINUM    = { minScore = 3152, wingScore = 3305 },
    GOLD        = { minScore = 2812, wingScore = 3013 },
    SILVER      = { minScore = 1791, wingScore = 2537 },
    BRONZE      = { minScore =  487, wingScore =  1066 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4230,
    CHALLENGER  = { minScore = 3999, wingScore = 4118 },
    GRANDMASTER = { minScore = 3950, wingScore = 3974 },
    MASTER      = { minScore = 3779, wingScore = 3864 },
    DIAMOND     = { minScore = 3646, wingScore = 3712 },
    EMERALD     = { minScore = 3468, wingScore = 3557 },
    PLATINUM    = { minScore = 3157, wingScore = 3290 },
    GOLD        = { minScore = 2812, wingScore = 2960 },
    SILVER      = { minScore = 1791, wingScore = 2537 },
    BRONZE      = { minScore =  487, wingScore =  1066 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4230,
    CHALLENGER  = { minScore = 4106, wingScore = 4118 },
    GRANDMASTER = { minScore = 4058, wingScore = 4082 },
    MASTER      = { minScore = 3894, wingScore = 3976 },
    DIAMOND     = { minScore = 3741, wingScore = 3817 },
    EMERALD     = { minScore = 3537, wingScore = 3639 },
    PLATINUM    = { minScore = 3204, wingScore = 3342 },
    GOLD        = { minScore = 2812, wingScore = 3006 },
    SILVER      = { minScore = 1791, wingScore = 2537 },
    BRONZE      = { minScore =  487, wingScore =  1066 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4177,
    CHALLENGER  = { minScore = 4023, wingScore = 4079 },
    GRANDMASTER = { minScore = 3921, wingScore = 3967 },
    MASTER      = { minScore = 3781, wingScore = 3839 },
    DIAMOND     = { minScore = 3524, wingScore = 3623 },
    EMERALD     = { minScore = 3403, wingScore = 3436 },
    PLATINUM    = { minScore = 3076, wingScore = 3204 },
    GOLD        = { minScore = 2717, wingScore = 2933 },
    SILVER      = { minScore = 1486, wingScore = 2327 },
    BRONZE      = { minScore =  361, wingScore =  864 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4177,
    CHALLENGER  = { minScore = 3924, wingScore = 4079 },
    GRANDMASTER = { minScore = 3873, wingScore = 3899 },
    MASTER      = { minScore = 3693, wingScore = 3783 },
    DIAMOND     = { minScore = 3554, wingScore = 3623 },
    EMERALD     = { minScore = 3368, wingScore = 3461 },
    PLATINUM    = { minScore = 3096, wingScore = 3204 },
    GOLD        = { minScore = 2717, wingScore = 2902 },
    SILVER      = { minScore = 1486, wingScore = 2327 },
    BRONZE      = { minScore =  361, wingScore =  864 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4177,
    CHALLENGER  = { minScore = 4071, wingScore = 4079 },
    GRANDMASTER = { minScore = 4019, wingScore = 4045 },
    MASTER      = { minScore = 3840, wingScore = 3930 },
    DIAMOND     = { minScore = 3688, wingScore = 3764 },
    EMERALD     = { minScore = 3485, wingScore = 3586 },
    PLATINUM    = { minScore = 3151, wingScore = 3290 },
    GOLD        = { minScore = 2717, wingScore = 2938 },
    SILVER      = { minScore = 1486, wingScore = 2327 },
    BRONZE      = { minScore =  361, wingScore =  864 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4230,
    CHALLENGER  = { minScore = 4042, wingScore = 4102 },
    GRANDMASTER = { minScore = 3953, wingScore = 3993 },
    MASTER      = { minScore = 3815, wingScore = 3871 },
    DIAMOND     = { minScore = 3570, wingScore = 3666 },
    EMERALD     = { minScore = 3427, wingScore = 3483 },
    PLATINUM    = { minScore = 3120, wingScore = 3263 },
    GOLD        = { minScore = 2772, wingScore = 2980 },
    SILVER      = { minScore = 1663, wingScore = 2449 },
    BRONZE      = { minScore =  434, wingScore =  981 },
    IRON        = { minScore =    1, wingScore =  220 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4230,
    CHALLENGER  = { minScore = 3968, wingScore = 4102 },
    GRANDMASTER = { minScore = 3919, wingScore = 3943 },
    MASTER      = { minScore = 3744, wingScore = 3831 },
    DIAMOND     = { minScore = 3609, wingScore = 3676 },
    EMERALD     = { minScore = 3427, wingScore = 3518 },
    PLATINUM    = { minScore = 3132, wingScore = 3255 },
    GOLD        = { minScore = 2773, wingScore = 2936 },
    SILVER      = { minScore = 1667, wingScore = 2451 },
    BRONZE      = { minScore =  436, wingScore =  984 },
    IRON        = { minScore =    1, wingScore =  221 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4230,
    CHALLENGER  = { minScore = 4091, wingScore = 4101 },
    GRANDMASTER = { minScore = 4041, wingScore = 4066 },
    MASTER      = { minScore = 3871, wingScore = 3956 },
    DIAMOND     = { minScore = 3718, wingScore = 3794 },
    EMERALD     = { minScore = 3515, wingScore = 3616 },
    PLATINUM    = { minScore = 3181, wingScore = 3320 },
    GOLD        = { minScore = 2771, wingScore = 2977 },
    SILVER      = { minScore = 1660, wingScore = 2447 },
    BRONZE      = { minScore =  433, wingScore =  979 },
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
