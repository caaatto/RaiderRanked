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
    top100Score = 4120,
    CHALLENGER  = { minScore = 3942, wingScore = 4002 },
    GRANDMASTER = { minScore = 3863, wingScore = 3895 },
    MASTER      = { minScore = 3738, wingScore = 3782 },
    DIAMOND     = { minScore = 3521, wingScore = 3598 },
    EMERALD     = { minScore = 3387, wingScore = 3435 },
    PLATINUM    = { minScore = 3085, wingScore = 3215 },
    GOLD        = { minScore = 2744, wingScore = 2946 },
    SILVER      = { minScore = 1676, wingScore = 2443 },
    BRONZE      = { minScore =  415, wingScore =  998 },
    IRON        = { minScore =    1, wingScore =  230 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4120,
    CHALLENGER  = { minScore = 3892, wingScore = 4002 },
    GRANDMASTER = { minScore = 3843, wingScore = 3868 },
    MASTER      = { minScore = 3673, wingScore = 3758 },
    DIAMOND     = { minScore = 3544, wingScore = 3608 },
    EMERALD     = { minScore = 3373, wingScore = 3458 },
    PLATINUM    = { minScore = 3103, wingScore = 3213 },
    GOLD        = { minScore = 2744, wingScore = 2916 },
    SILVER      = { minScore = 1676, wingScore = 2443 },
    BRONZE      = { minScore =  415, wingScore =  998 },
    IRON        = { minScore =    1, wingScore =  230 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4120,
    CHALLENGER  = { minScore = 3984, wingScore = 4002 },
    GRANDMASTER = { minScore = 3939, wingScore = 3962 },
    MASTER      = { minScore = 3778, wingScore = 3859 },
    DIAMOND     = { minScore = 3640, wingScore = 3709 },
    EMERALD     = { minScore = 3455, wingScore = 3547 },
    PLATINUM    = { minScore = 3145, wingScore = 3276 },
    GOLD        = { minScore = 2744, wingScore = 2945 },
    SILVER      = { minScore = 1676, wingScore = 2443 },
    BRONZE      = { minScore =  415, wingScore =  998 },
    IRON        = { minScore =    1, wingScore =  230 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4040,
    CHALLENGER  = { minScore = 3904, wingScore = 3952 },
    GRANDMASTER = { minScore = 3804, wingScore = 3850 },
    MASTER      = { minScore = 3667, wingScore = 3724 },
    DIAMOND     = { minScore = 3437, wingScore = 3526 },
    EMERALD     = { minScore = 3299, wingScore = 3373 },
    PLATINUM    = { minScore = 3030, wingScore = 3124 },
    GOLD        = { minScore = 2669, wingScore = 2840 },
    SILVER      = { minScore = 1388, wingScore = 2239 },
    BRONZE      = { minScore =  340, wingScore =  812 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4040,
    CHALLENGER  = { minScore = 3817, wingScore = 3952 },
    GRANDMASTER = { minScore = 3765, wingScore = 3791 },
    MASTER      = { minScore = 3585, wingScore = 3675 },
    DIAMOND     = { minScore = 3453, wingScore = 3519 },
    EMERALD     = { minScore = 3276, wingScore = 3364 },
    PLATINUM    = { minScore = 3008, wingScore = 3116 },
    GOLD        = { minScore = 2669, wingScore = 2830 },
    SILVER      = { minScore = 1388, wingScore = 2239 },
    BRONZE      = { minScore =  340, wingScore =  812 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4040,
    CHALLENGER  = { minScore = 3938, wingScore = 3952 },
    GRANDMASTER = { minScore = 3889, wingScore = 3913 },
    MASTER      = { minScore = 3720, wingScore = 3805 },
    DIAMOND     = { minScore = 3571, wingScore = 3646 },
    EMERALD     = { minScore = 3373, wingScore = 3472 },
    PLATINUM    = { minScore = 3091, wingScore = 3201 },
    GOLD        = { minScore = 2669, wingScore = 2895 },
    SILVER      = { minScore = 1388, wingScore = 2239 },
    BRONZE      = { minScore =  340, wingScore =  812 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4120,
    CHALLENGER  = { minScore = 3926, wingScore = 3981 },
    GRANDMASTER = { minScore = 3838, wingScore = 3876 },
    MASTER      = { minScore = 3708, wingScore = 3758 },
    DIAMOND     = { minScore = 3486, wingScore = 3568 },
    EMERALD     = { minScore = 3350, wingScore = 3409 },
    PLATINUM    = { minScore = 3062, wingScore = 3177 },
    GOLD        = { minScore = 2713, wingScore = 2902 },
    SILVER      = { minScore = 1556, wingScore = 2358 },
    BRONZE      = { minScore =  384, wingScore =  921 },
    IRON        = { minScore =    1, wingScore =  205 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4120,
    CHALLENGER  = { minScore = 3862, wingScore = 3982 },
    GRANDMASTER = { minScore = 3811, wingScore = 3837 },
    MASTER      = { minScore = 3637, wingScore = 3724 },
    DIAMOND     = { minScore = 3507, wingScore = 3572 },
    EMERALD     = { minScore = 3334, wingScore = 3420 },
    PLATINUM    = { minScore = 3065, wingScore = 3174 },
    GOLD        = { minScore = 2714, wingScore = 2881 },
    SILVER      = { minScore = 1559, wingScore = 2360 },
    BRONZE      = { minScore =  385, wingScore =  923 },
    IRON        = { minScore =    1, wingScore =  206 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4120,
    CHALLENGER  = { minScore = 3964, wingScore = 3981 },
    GRANDMASTER = { minScore = 3918, wingScore = 3941 },
    MASTER      = { minScore = 3753, wingScore = 3836 },
    DIAMOND     = { minScore = 3610, wingScore = 3682 },
    EMERALD     = { minScore = 3420, wingScore = 3515 },
    PLATINUM    = { minScore = 3122, wingScore = 3244 },
    GOLD        = { minScore = 2712, wingScore = 2924 },
    SILVER      = { minScore = 1553, wingScore = 2356 },
    BRONZE      = { minScore =  383, wingScore =  918 },
    IRON        = { minScore =    1, wingScore =  204 },
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
