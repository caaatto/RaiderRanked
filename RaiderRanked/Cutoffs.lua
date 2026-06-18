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
    top100Score = 4231,
    CHALLENGER  = { minScore = 4060, wingScore = 4124 },
    GRANDMASTER = { minScore = 3979, wingScore = 4013 },
    MASTER      = { minScore = 3842, wingScore = 3895 },
    DIAMOND     = { minScore = 3605, wingScore = 3699 },
    EMERALD     = { minScore = 3446, wingScore = 3519 },
    PLATINUM    = { minScore = 3154, wingScore = 3307 },
    GOLD        = { minScore = 2814, wingScore = 3014 },
    SILVER      = { minScore = 1795, wingScore = 2540 },
    BRONZE      = { minScore =  486, wingScore =  1067 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4231,
    CHALLENGER  = { minScore = 4002, wingScore = 4124 },
    GRANDMASTER = { minScore = 3952, wingScore = 3977 },
    MASTER      = { minScore = 3780, wingScore = 3866 },
    DIAMOND     = { minScore = 3647, wingScore = 3713 },
    EMERALD     = { minScore = 3470, wingScore = 3559 },
    PLATINUM    = { minScore = 3158, wingScore = 3292 },
    GOLD        = { minScore = 2814, wingScore = 2961 },
    SILVER      = { minScore = 1795, wingScore = 2540 },
    BRONZE      = { minScore =  486, wingScore =  1067 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4231,
    CHALLENGER  = { minScore = 4113, wingScore = 4124 },
    GRANDMASTER = { minScore = 4064, wingScore = 4088 },
    MASTER      = { minScore = 3895, wingScore = 3980 },
    DIAMOND     = { minScore = 3742, wingScore = 3818 },
    EMERALD     = { minScore = 3538, wingScore = 3640 },
    PLATINUM    = { minScore = 3205, wingScore = 3343 },
    GOLD        = { minScore = 2814, wingScore = 3008 },
    SILVER      = { minScore = 1795, wingScore = 2540 },
    BRONZE      = { minScore =  486, wingScore =  1067 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4179,
    CHALLENGER  = { minScore = 4026, wingScore = 4083 },
    GRANDMASTER = { minScore = 3923, wingScore = 3969 },
    MASTER      = { minScore = 3782, wingScore = 3841 },
    DIAMOND     = { minScore = 3526, wingScore = 3625 },
    EMERALD     = { minScore = 3404, wingScore = 3437 },
    PLATINUM    = { minScore = 3077, wingScore = 3205 },
    GOLD        = { minScore = 2719, wingScore = 2936 },
    SILVER      = { minScore = 1487, wingScore = 2329 },
    BRONZE      = { minScore =  361, wingScore =  865 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4179,
    CHALLENGER  = { minScore = 3925, wingScore = 4083 },
    GRANDMASTER = { minScore = 3874, wingScore = 3900 },
    MASTER      = { minScore = 3695, wingScore = 3784 },
    DIAMOND     = { minScore = 3555, wingScore = 3625 },
    EMERALD     = { minScore = 3370, wingScore = 3463 },
    PLATINUM    = { minScore = 3097, wingScore = 3205 },
    GOLD        = { minScore = 2719, wingScore = 2903 },
    SILVER      = { minScore = 1487, wingScore = 2329 },
    BRONZE      = { minScore =  361, wingScore =  865 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4179,
    CHALLENGER  = { minScore = 4072, wingScore = 4083 },
    GRANDMASTER = { minScore = 4021, wingScore = 4046 },
    MASTER      = { minScore = 3842, wingScore = 3931 },
    DIAMOND     = { minScore = 3690, wingScore = 3766 },
    EMERALD     = { minScore = 3487, wingScore = 3588 },
    PLATINUM    = { minScore = 3152, wingScore = 3292 },
    GOLD        = { minScore = 2719, wingScore = 2939 },
    SILVER      = { minScore = 1487, wingScore = 2329 },
    BRONZE      = { minScore =  361, wingScore =  865 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4231,
    CHALLENGER  = { minScore = 4046, wingScore = 4107 },
    GRANDMASTER = { minScore = 3956, wingScore = 3995 },
    MASTER      = { minScore = 3817, wingScore = 3872 },
    DIAMOND     = { minScore = 3572, wingScore = 3668 },
    EMERALD     = { minScore = 3428, wingScore = 3485 },
    PLATINUM    = { minScore = 3122, wingScore = 3264 },
    GOLD        = { minScore = 2774, wingScore = 2981 },
    SILVER      = { minScore = 1666, wingScore = 2452 },
    BRONZE      = { minScore =  434, wingScore =  983 },
    IRON        = { minScore =    1, wingScore =  220 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4231,
    CHALLENGER  = { minScore = 3971, wingScore = 4107 },
    GRANDMASTER = { minScore = 3920, wingScore = 3946 },
    MASTER      = { minScore = 3745, wingScore = 3833 },
    DIAMOND     = { minScore = 3610, wingScore = 3677 },
    EMERALD     = { minScore = 3429, wingScore = 3520 },
    PLATINUM    = { minScore = 3133, wingScore = 3257 },
    GOLD        = { minScore = 2775, wingScore = 2937 },
    SILVER      = { minScore = 1670, wingScore = 2454 },
    BRONZE      = { minScore =  435, wingScore =  985 },
    IRON        = { minScore =    1, wingScore =  221 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4231,
    CHALLENGER  = { minScore = 4095, wingScore = 4106 },
    GRANDMASTER = { minScore = 4046, wingScore = 4070 },
    MASTER      = { minScore = 3872, wingScore = 3959 },
    DIAMOND     = { minScore = 3720, wingScore = 3796 },
    EMERALD     = { minScore = 3516, wingScore = 3618 },
    PLATINUM    = { minScore = 3182, wingScore = 3321 },
    GOLD        = { minScore = 2773, wingScore = 2978 },
    SILVER      = { minScore = 1663, wingScore = 2449 },
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
