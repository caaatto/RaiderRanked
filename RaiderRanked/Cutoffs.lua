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
    top100Score = 4016,
    CHALLENGER  = { minScore = 3865, wingScore = 3902 },
    GRANDMASTER = { minScore = 3777, wingScore = 3805 },
    MASTER      = { minScore = 3657, wingScore = 3701 },
    DIAMOND     = { minScore = 3443, wingScore = 3533 },
    EMERALD     = { minScore = 3312, wingScore = 3376 },
    PLATINUM    = { minScore = 3036, wingScore = 3144 },
    GOLD        = { minScore = 2696, wingScore = 2860 },
    SILVER      = { minScore = 1627, wingScore = 2371 },
    BRONZE      = { minScore =  400, wingScore =  976 },
    IRON        = { minScore =    1, wingScore =  227 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4016,
    CHALLENGER  = { minScore = 3796, wingScore = 3902 },
    GRANDMASTER = { minScore = 3752, wingScore = 3774 },
    MASTER      = { minScore = 3597, wingScore = 3674 },
    DIAMOND     = { minScore = 3469, wingScore = 3533 },
    EMERALD     = { minScore = 3299, wingScore = 3384 },
    PLATINUM    = { minScore = 3036, wingScore = 3143 },
    GOLD        = { minScore = 2696, wingScore = 2860 },
    SILVER      = { minScore = 1627, wingScore = 2371 },
    BRONZE      = { minScore =  400, wingScore =  976 },
    IRON        = { minScore =    1, wingScore =  227 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4016,
    CHALLENGER  = { minScore = 3895, wingScore = 3902 },
    GRANDMASTER = { minScore = 3851, wingScore = 3873 },
    MASTER      = { minScore = 3694, wingScore = 3772 },
    DIAMOND     = { minScore = 3560, wingScore = 3627 },
    EMERALD     = { minScore = 3382, wingScore = 3471 },
    PLATINUM    = { minScore = 3099, wingScore = 3215 },
    GOLD        = { minScore = 2696, wingScore = 2905 },
    SILVER      = { minScore = 1627, wingScore = 2371 },
    BRONZE      = { minScore =  400, wingScore =  976 },
    IRON        = { minScore =    1, wingScore =  227 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3944,
    CHALLENGER  = { minScore = 3824, wingScore = 3890 },
    GRANDMASTER = { minScore = 3730, wingScore = 3772 },
    MASTER      = { minScore = 3585, wingScore = 3651 },
    DIAMOND     = { minScore = 3381, wingScore = 3448 },
    EMERALD     = { minScore = 3217, wingScore = 3294 },
    PLATINUM    = { minScore = 2997, wingScore = 3067 },
    GOLD        = { minScore = 2636, wingScore = 2768 },
    SILVER      = { minScore = 1337, wingScore = 2173 },
    BRONZE      = { minScore =  340, wingScore =  784 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3944,
    CHALLENGER  = { minScore = 3746, wingScore = 3890 },
    GRANDMASTER = { minScore = 3696, wingScore = 3721 },
    MASTER      = { minScore = 3520, wingScore = 3608 },
    DIAMOND     = { minScore = 3386, wingScore = 3453 },
    EMERALD     = { minScore = 3206, wingScore = 3296 },
    PLATINUM    = { minScore = 2929, wingScore = 3041 },
    GOLD        = { minScore = 2636, wingScore = 2762 },
    SILVER      = { minScore = 1337, wingScore = 2173 },
    BRONZE      = { minScore =  340, wingScore =  784 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3944,
    CHALLENGER  = { minScore = 3879, wingScore = 3890 },
    GRANDMASTER = { minScore = 3827, wingScore = 3853 },
    MASTER      = { minScore = 3648, wingScore = 3738 },
    DIAMOND     = { minScore = 3498, wingScore = 3573 },
    EMERALD     = { minScore = 3299, wingScore = 3399 },
    PLATINUM    = { minScore = 3002, wingScore = 3121 },
    GOLD        = { minScore = 2636, wingScore = 2820 },
    SILVER      = { minScore = 1337, wingScore = 2173 },
    BRONZE      = { minScore =  340, wingScore =  784 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4016,
    CHALLENGER  = { minScore = 3848, wingScore = 3897 },
    GRANDMASTER = { minScore = 3757, wingScore = 3791 },
    MASTER      = { minScore = 3627, wingScore = 3680 },
    DIAMOND     = { minScore = 3417, wingScore = 3498 },
    EMERALD     = { minScore = 3272, wingScore = 3342 },
    PLATINUM    = { minScore = 3020, wingScore = 3112 },
    GOLD        = { minScore = 2671, wingScore = 2822 },
    SILVER      = { minScore = 1506, wingScore = 2288 },
    BRONZE      = { minScore =  375, wingScore =  896 },
    IRON        = { minScore =    1, wingScore =  203 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4016,
    CHALLENGER  = { minScore = 3776, wingScore = 3897 },
    GRANDMASTER = { minScore = 3729, wingScore = 3752 },
    MASTER      = { minScore = 3566, wingScore = 3647 },
    DIAMOND     = { minScore = 3435, wingScore = 3501 },
    EMERALD     = { minScore = 3261, wingScore = 3348 },
    PLATINUM    = { minScore = 2993, wingScore = 3102 },
    GOLD        = { minScore = 2672, wingScore = 2820 },
    SILVER      = { minScore = 1509, wingScore = 2291 },
    BRONZE      = { minScore =  376, wingScore =  898 },
    IRON        = { minScore =    1, wingScore =  204 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4016,
    CHALLENGER  = { minScore = 3888, wingScore = 3897 },
    GRANDMASTER = { minScore = 3841, wingScore = 3864 },
    MASTER      = { minScore = 3674, wingScore = 3757 },
    DIAMOND     = { minScore = 3533, wingScore = 3604 },
    EMERALD     = { minScore = 3346, wingScore = 3440 },
    PLATINUM    = { minScore = 3057, wingScore = 3175 },
    GOLD        = { minScore = 2670, wingScore = 2868 },
    SILVER      = { minScore = 1502, wingScore = 2286 },
    BRONZE      = { minScore =  374, wingScore =  893 },
    IRON        = { minScore =    1, wingScore =  202 },
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
