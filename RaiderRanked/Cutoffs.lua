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
    top100Score = 4190,
    CHALLENGER  = { minScore = 4019, wingScore = 4070 },
    GRANDMASTER = { minScore = 3930, wingScore = 3973 },
    MASTER      = { minScore = 3803, wingScore = 3861 },
    DIAMOND     = { minScore = 3573, wingScore = 3667 },
    EMERALD     = { minScore = 3428, wingScore = 3486 },
    PLATINUM    = { minScore = 3129, wingScore = 3272 },
    GOLD        = { minScore = 2788, wingScore = 3003 },
    SILVER      = { minScore = 1754, wingScore = 2509 },
    BRONZE      = { minScore =  487, wingScore =  1046 },
    IRON        = { minScore =    1, wingScore =  253 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4190,
    CHALLENGER  = { minScore = 3960, wingScore = 4070 },
    GRANDMASTER = { minScore = 3914, wingScore = 3937 },
    MASTER      = { minScore = 3751, wingScore = 3833 },
    DIAMOND     = { minScore = 3615, wingScore = 3683 },
    EMERALD     = { minScore = 3435, wingScore = 3525 },
    PLATINUM    = { minScore = 3137, wingScore = 3261 },
    GOLD        = { minScore = 2788, wingScore = 2944 },
    SILVER      = { minScore = 1754, wingScore = 2509 },
    BRONZE      = { minScore =  487, wingScore =  1046 },
    IRON        = { minScore =    1, wingScore =  253 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4190,
    CHALLENGER  = { minScore = 4058, wingScore = 4070 },
    GRANDMASTER = { minScore = 4013, wingScore = 4035 },
    MASTER      = { minScore = 3856, wingScore = 3934 },
    DIAMOND     = { minScore = 3710, wingScore = 3783 },
    EMERALD     = { minScore = 3515, wingScore = 3612 },
    PLATINUM    = { minScore = 3186, wingScore = 3325 },
    GOLD        = { minScore = 2788, wingScore = 2985 },
    SILVER      = { minScore = 1754, wingScore = 2509 },
    BRONZE      = { minScore =  487, wingScore =  1046 },
    IRON        = { minScore =    1, wingScore =  253 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4135,
    CHALLENGER  = { minScore = 3996, wingScore = 4032 },
    GRANDMASTER = { minScore = 3894, wingScore = 3921 },
    MASTER      = { minScore = 3746, wingScore = 3796 },
    DIAMOND     = { minScore = 3492, wingScore = 3584 },
    EMERALD     = { minScore = 3365, wingScore = 3421 },
    PLATINUM    = { minScore = 3060, wingScore = 3176 },
    GOLD        = { minScore = 2699, wingScore = 2899 },
    SILVER      = { minScore = 1460, wingScore = 2302 },
    BRONZE      = { minScore =  361, wingScore =  854 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4135,
    CHALLENGER  = { minScore = 3898, wingScore = 4032 },
    GRANDMASTER = { minScore = 3846, wingScore = 3872 },
    MASTER      = { minScore = 3662, wingScore = 3754 },
    DIAMOND     = { minScore = 3522, wingScore = 3592 },
    EMERALD     = { minScore = 3336, wingScore = 3429 },
    PLATINUM    = { minScore = 3073, wingScore = 3175 },
    GOLD        = { minScore = 2699, wingScore = 2884 },
    SILVER      = { minScore = 1460, wingScore = 2302 },
    BRONZE      = { minScore =  361, wingScore =  854 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4135,
    CHALLENGER  = { minScore = 4027, wingScore = 4032 },
    GRANDMASTER = { minScore = 3976, wingScore = 4001 },
    MASTER      = { minScore = 3796, wingScore = 3886 },
    DIAMOND     = { minScore = 3644, wingScore = 3720 },
    EMERALD     = { minScore = 3442, wingScore = 3543 },
    PLATINUM    = { minScore = 3129, wingScore = 3256 },
    GOLD        = { minScore = 2699, wingScore = 2923 },
    SILVER      = { minScore = 1460, wingScore = 2302 },
    BRONZE      = { minScore =  361, wingScore =  854 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4190,
    CHALLENGER  = { minScore = 4009, wingScore = 4054 },
    GRANDMASTER = { minScore = 3915, wingScore = 3951 },
    MASTER      = { minScore = 3779, wingScore = 3834 },
    DIAMOND     = { minScore = 3539, wingScore = 3632 },
    EMERALD     = { minScore = 3402, wingScore = 3459 },
    PLATINUM    = { minScore = 3100, wingScore = 3232 },
    GOLD        = { minScore = 2751, wingScore = 2960 },
    SILVER      = { minScore = 1631, wingScore = 2422 },
    BRONZE      = { minScore =  434, wingScore =  966 },
    IRON        = { minScore =    1, wingScore =  225 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4190,
    CHALLENGER  = { minScore = 3935, wingScore = 4055 },
    GRANDMASTER = { minScore = 3886, wingScore = 3911 },
    MASTER      = { minScore = 3715, wingScore = 3801 },
    DIAMOND     = { minScore = 3577, wingScore = 3646 },
    EMERALD     = { minScore = 3395, wingScore = 3486 },
    PLATINUM    = { minScore = 3111, wingScore = 3226 },
    GOLD        = { minScore = 2752, wingScore = 2920 },
    SILVER      = { minScore = 1634, wingScore = 2425 },
    BRONZE      = { minScore =  436, wingScore =  968 },
    IRON        = { minScore =    1, wingScore =  225 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4190,
    CHALLENGER  = { minScore = 4045, wingScore = 4054 },
    GRANDMASTER = { minScore = 3997, wingScore = 4020 },
    MASTER      = { minScore = 3830, wingScore = 3913 },
    DIAMOND     = { minScore = 3682, wingScore = 3756 },
    EMERALD     = { minScore = 3484, wingScore = 3582 },
    PLATINUM    = { minScore = 3162, wingScore = 3295 },
    GOLD        = { minScore = 2750, wingScore = 2958 },
    SILVER      = { minScore = 1628, wingScore = 2420 },
    BRONZE      = { minScore =  433, wingScore =  964 },
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
