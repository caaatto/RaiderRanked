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
    CHALLENGER  = { minScore = 4058, wingScore = 4120 },
    GRANDMASTER = { minScore = 3978, wingScore = 4013 },
    MASTER      = { minScore = 3841, wingScore = 3895 },
    DIAMOND     = { minScore = 3604, wingScore = 3698 },
    EMERALD     = { minScore = 3445, wingScore = 3518 },
    PLATINUM    = { minScore = 3153, wingScore = 3306 },
    GOLD        = { minScore = 2813, wingScore = 3013 },
    SILVER      = { minScore = 1793, wingScore = 2538 },
    BRONZE      = { minScore =  486, wingScore =  1067 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4230,
    CHALLENGER  = { minScore = 4001, wingScore = 4120 },
    GRANDMASTER = { minScore = 3951, wingScore = 3976 },
    MASTER      = { minScore = 3779, wingScore = 3865 },
    DIAMOND     = { minScore = 3647, wingScore = 3713 },
    EMERALD     = { minScore = 3469, wingScore = 3558 },
    PLATINUM    = { minScore = 3158, wingScore = 3291 },
    GOLD        = { minScore = 2813, wingScore = 2961 },
    SILVER      = { minScore = 1793, wingScore = 2538 },
    BRONZE      = { minScore =  486, wingScore =  1067 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4230,
    CHALLENGER  = { minScore = 4111, wingScore = 4120 },
    GRANDMASTER = { minScore = 4063, wingScore = 4087 },
    MASTER      = { minScore = 3894, wingScore = 3979 },
    DIAMOND     = { minScore = 3741, wingScore = 3818 },
    EMERALD     = { minScore = 3537, wingScore = 3639 },
    PLATINUM    = { minScore = 3205, wingScore = 3343 },
    GOLD        = { minScore = 2813, wingScore = 3007 },
    SILVER      = { minScore = 1793, wingScore = 2538 },
    BRONZE      = { minScore =  486, wingScore =  1067 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4178,
    CHALLENGER  = { minScore = 4024, wingScore = 4080 },
    GRANDMASTER = { minScore = 3921, wingScore = 3968 },
    MASTER      = { minScore = 3781, wingScore = 3839 },
    DIAMOND     = { minScore = 3524, wingScore = 3624 },
    EMERALD     = { minScore = 3403, wingScore = 3436 },
    PLATINUM    = { minScore = 3076, wingScore = 3204 },
    GOLD        = { minScore = 2718, wingScore = 2934 },
    SILVER      = { minScore = 1487, wingScore = 2328 },
    BRONZE      = { minScore =  361, wingScore =  865 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4178,
    CHALLENGER  = { minScore = 3925, wingScore = 4080 },
    GRANDMASTER = { minScore = 3873, wingScore = 3899 },
    MASTER      = { minScore = 3693, wingScore = 3783 },
    DIAMOND     = { minScore = 3554, wingScore = 3623 },
    EMERALD     = { minScore = 3368, wingScore = 3461 },
    PLATINUM    = { minScore = 3096, wingScore = 3204 },
    GOLD        = { minScore = 2718, wingScore = 2903 },
    SILVER      = { minScore = 1487, wingScore = 2328 },
    BRONZE      = { minScore =  361, wingScore =  865 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4178,
    CHALLENGER  = { minScore = 4071, wingScore = 4080 },
    GRANDMASTER = { minScore = 4020, wingScore = 4046 },
    MASTER      = { minScore = 3840, wingScore = 3930 },
    DIAMOND     = { minScore = 3688, wingScore = 3764 },
    EMERALD     = { minScore = 3485, wingScore = 3587 },
    PLATINUM    = { minScore = 3151, wingScore = 3291 },
    GOLD        = { minScore = 2718, wingScore = 2939 },
    SILVER      = { minScore = 1487, wingScore = 2328 },
    BRONZE      = { minScore =  361, wingScore =  865 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4230,
    CHALLENGER  = { minScore = 4044, wingScore = 4103 },
    GRANDMASTER = { minScore = 3954, wingScore = 3994 },
    MASTER      = { minScore = 3816, wingScore = 3872 },
    DIAMOND     = { minScore = 3571, wingScore = 3667 },
    EMERALD     = { minScore = 3427, wingScore = 3484 },
    PLATINUM    = { minScore = 3121, wingScore = 3263 },
    GOLD        = { minScore = 2773, wingScore = 2980 },
    SILVER      = { minScore = 1665, wingScore = 2450 },
    BRONZE      = { minScore =  434, wingScore =  983 },
    IRON        = { minScore =    1, wingScore =  220 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4230,
    CHALLENGER  = { minScore = 3970, wingScore = 4104 },
    GRANDMASTER = { minScore = 3919, wingScore = 3945 },
    MASTER      = { minScore = 3744, wingScore = 3832 },
    DIAMOND     = { minScore = 3609, wingScore = 3676 },
    EMERALD     = { minScore = 3428, wingScore = 3519 },
    PLATINUM    = { minScore = 3133, wingScore = 3256 },
    GOLD        = { minScore = 2774, wingScore = 2937 },
    SILVER      = { minScore = 1668, wingScore = 2453 },
    BRONZE      = { minScore =  435, wingScore =  985 },
    IRON        = { minScore =    1, wingScore =  221 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4230,
    CHALLENGER  = { minScore = 4094, wingScore = 4103 },
    GRANDMASTER = { minScore = 4045, wingScore = 4069 },
    MASTER      = { minScore = 3871, wingScore = 3958 },
    DIAMOND     = { minScore = 3718, wingScore = 3795 },
    EMERALD     = { minScore = 3515, wingScore = 3617 },
    PLATINUM    = { minScore = 3182, wingScore = 3321 },
    GOLD        = { minScore = 2772, wingScore = 2978 },
    SILVER      = { minScore = 1662, wingScore = 2448 },
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
