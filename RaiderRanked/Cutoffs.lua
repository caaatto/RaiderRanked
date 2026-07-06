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
    top100Score = 4276,
    CHALLENGER  = { minScore = 4128, wingScore = 4164 },
    GRANDMASTER = { minScore = 4014, wingScore = 4048 },
    MASTER      = { minScore = 3891, wingScore = 3933 },
    DIAMOND     = { minScore = 3636, wingScore = 3736 },
    EMERALD     = { minScore = 3461, wingScore = 3541 },
    PLATINUM    = { minScore = 3168, wingScore = 3324 },
    GOLD        = { minScore = 2827, wingScore = 3019 },
    SILVER      = { minScore = 1784, wingScore = 2545 },
    BRONZE      = { minScore =  470, wingScore =  1052 },
    IRON        = { minScore =    1, wingScore =  242 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4276,
    CHALLENGER  = { minScore = 4026, wingScore = 4164 },
    GRANDMASTER = { minScore = 3979, wingScore = 4002 },
    MASTER      = { minScore = 3814, wingScore = 3896 },
    DIAMOND     = { minScore = 3677, wingScore = 3746 },
    EMERALD     = { minScore = 3495, wingScore = 3586 },
    PLATINUM    = { minScore = 3170, wingScore = 3310 },
    GOLD        = { minScore = 2827, wingScore = 2970 },
    SILVER      = { minScore = 1784, wingScore = 2545 },
    BRONZE      = { minScore =  470, wingScore =  1052 },
    IRON        = { minScore =    1, wingScore =  242 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4276,
    CHALLENGER  = { minScore = 4152, wingScore = 4164 },
    GRANDMASTER = { minScore = 4103, wingScore = 4127 },
    MASTER      = { minScore = 3930, wingScore = 4016 },
    DIAMOND     = { minScore = 3769, wingScore = 3850 },
    EMERALD     = { minScore = 3555, wingScore = 3662 },
    PLATINUM    = { minScore = 3216, wingScore = 3355 },
    GOLD        = { minScore = 2827, wingScore = 3019 },
    SILVER      = { minScore = 1784, wingScore = 2545 },
    BRONZE      = { minScore =  470, wingScore =  1052 },
    IRON        = { minScore =    1, wingScore =  242 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4231,
    CHALLENGER  = { minScore = 4081, wingScore = 4137 },
    GRANDMASTER = { minScore = 3976, wingScore = 4014 },
    MASTER      = { minScore = 3832, wingScore = 3894 },
    DIAMOND     = { minScore = 3549, wingScore = 3661 },
    EMERALD     = { minScore = 3411, wingScore = 3451 },
    PLATINUM    = { minScore = 3086, wingScore = 3222 },
    GOLD        = { minScore = 2728, wingScore = 2954 },
    SILVER      = { minScore = 1478, wingScore = 2332 },
    BRONZE      = { minScore =  357, wingScore =  855 },
    IRON        = { minScore =    1, wingScore =  184 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4231,
    CHALLENGER  = { minScore = 3978, wingScore = 4137 },
    GRANDMASTER = { minScore = 3926, wingScore = 3952 },
    MASTER      = { minScore = 3743, wingScore = 3835 },
    DIAMOND     = { minScore = 3596, wingScore = 3670 },
    EMERALD     = { minScore = 3400, wingScore = 3498 },
    PLATINUM    = { minScore = 3109, wingScore = 3224 },
    GOLD        = { minScore = 2728, wingScore = 2909 },
    SILVER      = { minScore = 1478, wingScore = 2332 },
    BRONZE      = { minScore =  357, wingScore =  855 },
    IRON        = { minScore =    1, wingScore =  184 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4231,
    CHALLENGER  = { minScore = 4133, wingScore = 4137 },
    GRANDMASTER = { minScore = 4080, wingScore = 4106 },
    MASTER      = { minScore = 3894, wingScore = 3987 },
    DIAMOND     = { minScore = 3731, wingScore = 3812 },
    EMERALD     = { minScore = 3514, wingScore = 3623 },
    PLATINUM    = { minScore = 3163, wingScore = 3309 },
    GOLD        = { minScore = 2728, wingScore = 2947 },
    SILVER      = { minScore = 1478, wingScore = 2332 },
    BRONZE      = { minScore =  357, wingScore =  855 },
    IRON        = { minScore =    1, wingScore =  184 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4276,
    CHALLENGER  = { minScore = 4108, wingScore = 4153 },
    GRANDMASTER = { minScore = 3998, wingScore = 4034 },
    MASTER      = { minScore = 3866, wingScore = 3917 },
    DIAMOND     = { minScore = 3599, wingScore = 3704 },
    EMERALD     = { minScore = 3440, wingScore = 3503 },
    PLATINUM    = { minScore = 3134, wingScore = 3281 },
    GOLD        = { minScore = 2785, wingScore = 2992 },
    SILVER      = { minScore = 1655, wingScore = 2456 },
    BRONZE      = { minScore =  423, wingScore =  969 },
    IRON        = { minScore =    1, wingScore =  218 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4276,
    CHALLENGER  = { minScore = 4006, wingScore = 4153 },
    GRANDMASTER = { minScore = 3957, wingScore = 3982 },
    MASTER      = { minScore = 3785, wingScore = 3871 },
    DIAMOND     = { minScore = 3644, wingScore = 3715 },
    EMERALD     = { minScore = 3456, wingScore = 3550 },
    PLATINUM    = { minScore = 3145, wingScore = 3275 },
    GOLD        = { minScore = 2787, wingScore = 2945 },
    SILVER      = { minScore = 1659, wingScore = 2458 },
    BRONZE      = { minScore =  424, wingScore =  971 },
    IRON        = { minScore =    1, wingScore =  218 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4276,
    CHALLENGER  = { minScore = 4144, wingScore = 4152 },
    GRANDMASTER = { minScore = 4093, wingScore = 4118 },
    MASTER      = { minScore = 3914, wingScore = 4003 },
    DIAMOND     = { minScore = 3753, wingScore = 3834 },
    EMERALD     = { minScore = 3537, wingScore = 3645 },
    PLATINUM    = { minScore = 3193, wingScore = 3335 },
    GOLD        = { minScore = 2784, wingScore = 2988 },
    SILVER      = { minScore = 1652, wingScore = 2453 },
    BRONZE      = { minScore =  421, wingScore =  967 },
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
