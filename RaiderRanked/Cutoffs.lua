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
    top100Score = 3970,
    CHALLENGER  = { minScore = 3812, wingScore = 3868 },
    GRANDMASTER = { minScore = 3740, wingScore = 3771 },
    MASTER      = { minScore = 3609, wingScore = 3659 },
    DIAMOND     = { minScore = 3412, wingScore = 3481 },
    EMERALD     = { minScore = 3265, wingScore = 3330 },
    PLATINUM    = { minScore = 3013, wingScore = 3103 },
    GOLD        = { minScore = 2671, wingScore = 2812 },
    SILVER      = { minScore = 1557, wingScore = 2321 },
    BRONZE      = { minScore =  392, wingScore =  935 },
    IRON        = { minScore =    1, wingScore =  216 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3970,
    CHALLENGER  = { minScore = 3766, wingScore = 3868 },
    GRANDMASTER = { minScore = 3718, wingScore = 3742 },
    MASTER      = { minScore = 3553, wingScore = 3636 },
    DIAMOND     = { minScore = 3426, wingScore = 3489 },
    EMERALD     = { minScore = 3256, wingScore = 3341 },
    PLATINUM    = { minScore = 2984, wingScore = 3096 },
    GOLD        = { minScore = 2671, wingScore = 2815 },
    SILVER      = { minScore = 1557, wingScore = 2321 },
    BRONZE      = { minScore =  392, wingScore =  935 },
    IRON        = { minScore =    1, wingScore =  216 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3970,
    CHALLENGER  = { minScore = 3856, wingScore = 3868 },
    GRANDMASTER = { minScore = 3812, wingScore = 3834 },
    MASTER      = { minScore = 3656, wingScore = 3734 },
    DIAMOND     = { minScore = 3518, wingScore = 3587 },
    EMERALD     = { minScore = 3334, wingScore = 3426 },
    PLATINUM    = { minScore = 3049, wingScore = 3164 },
    GOLD        = { minScore = 2671, wingScore = 2862 },
    SILVER      = { minScore = 1557, wingScore = 2321 },
    BRONZE      = { minScore =  392, wingScore =  935 },
    IRON        = { minScore =    1, wingScore =  216 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3907,
    CHALLENGER  = { minScore = 3778, wingScore = 3834 },
    GRANDMASTER = { minScore = 3674, wingScore = 3720 },
    MASTER      = { minScore = 3543, wingScore = 3594 },
    DIAMOND     = { minScore = 3331, wingScore = 3415 },
    EMERALD     = { minScore = 3173, wingScore = 3242 },
    PLATINUM    = { minScore = 2940, wingScore = 3037 },
    GOLD        = { minScore = 2606, wingScore = 2731 },
    SILVER      = { minScore = 1298, wingScore = 2119 },
    BRONZE      = { minScore =  338, wingScore =  747 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3907,
    CHALLENGER  = { minScore = 3691, wingScore = 3834 },
    GRANDMASTER = { minScore = 3642, wingScore = 3666 },
    MASTER      = { minScore = 3468, wingScore = 3555 },
    DIAMOND     = { minScore = 3339, wingScore = 3403 },
    EMERALD     = { minScore = 3166, wingScore = 3252 },
    PLATINUM    = { minScore = 2885, wingScore = 3002 },
    GOLD        = { minScore = 2606, wingScore = 2718 },
    SILVER      = { minScore = 1298, wingScore = 2119 },
    BRONZE      = { minScore =  338, wingScore =  747 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3907,
    CHALLENGER  = { minScore = 3820, wingScore = 3834 },
    GRANDMASTER = { minScore = 3769, wingScore = 3794 },
    MASTER      = { minScore = 3591, wingScore = 3680 },
    DIAMOND     = { minScore = 3445, wingScore = 3518 },
    EMERALD     = { minScore = 3250, wingScore = 3347 },
    PLATINUM    = { minScore = 2951, wingScore = 3072 },
    GOLD        = { minScore = 2606, wingScore = 2776 },
    SILVER      = { minScore = 1298, wingScore = 2119 },
    BRONZE      = { minScore =  338, wingScore =  747 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3970,
    CHALLENGER  = { minScore = 3798, wingScore = 3854 },
    GRANDMASTER = { minScore = 3712, wingScore = 3750 },
    MASTER      = { minScore = 3581, wingScore = 3632 },
    DIAMOND     = { minScore = 3378, wingScore = 3453 },
    EMERALD     = { minScore = 3227, wingScore = 3293 },
    PLATINUM    = { minScore = 2982, wingScore = 3075 },
    GOLD        = { minScore = 2644, wingScore = 2778 },
    SILVER      = { minScore = 1449, wingScore = 2237 },
    BRONZE      = { minScore =  369, wingScore =  856 },
    IRON        = { minScore =    1, wingScore =  197 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3970,
    CHALLENGER  = { minScore = 3736, wingScore = 3854 },
    GRANDMASTER = { minScore = 3687, wingScore = 3711 },
    MASTER      = { minScore = 3519, wingScore = 3603 },
    DIAMOND     = { minScore = 3391, wingScore = 3454 },
    EMERALD     = { minScore = 3219, wingScore = 3305 },
    PLATINUM    = { minScore = 2944, wingScore = 3058 },
    GOLD        = { minScore = 2645, wingScore = 2776 },
    SILVER      = { minScore = 1452, wingScore = 2239 },
    BRONZE      = { minScore =  370, wingScore =  859 },
    IRON        = { minScore =    1, wingScore =  197 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3970,
    CHALLENGER  = { minScore = 3841, wingScore = 3853 },
    GRANDMASTER = { minScore = 3793, wingScore = 3817 },
    MASTER      = { minScore = 3628, wingScore = 3711 },
    DIAMOND     = { minScore = 3487, wingScore = 3557 },
    EMERALD     = { minScore = 3298, wingScore = 3392 },
    PLATINUM    = { minScore = 3007, wingScore = 3124 },
    GOLD        = { minScore = 2643, wingScore = 2825 },
    SILVER      = { minScore = 1446, wingScore = 2234 },
    BRONZE      = { minScore =  369, wingScore =  854 },
    IRON        = { minScore =    1, wingScore =  196 },
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
