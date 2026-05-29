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
    top100Score = 4169,
    CHALLENGER  = { minScore = 4010, wingScore = 4043 },
    GRANDMASTER = { minScore = 3908, wingScore = 3942 },
    MASTER      = { minScore = 3784, wingScore = 3835 },
    DIAMOND     = { minScore = 3556, wingScore = 3654 },
    EMERALD     = { minScore = 3418, wingScore = 3469 },
    PLATINUM    = { minScore = 3115, wingScore = 3254 },
    GOLD        = { minScore = 2774, wingScore = 2991 },
    SILVER      = { minScore = 1729, wingScore = 2490 },
    BRONZE      = { minScore =  456, wingScore =  1026 },
    IRON        = { minScore =    1, wingScore =  240 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4169,
    CHALLENGER  = { minScore = 3933, wingScore = 4043 },
    GRANDMASTER = { minScore = 3887, wingScore = 3910 },
    MASTER      = { minScore = 3726, wingScore = 3807 },
    DIAMOND     = { minScore = 3593, wingScore = 3660 },
    EMERALD     = { minScore = 3416, wingScore = 3504 },
    PLATINUM    = { minScore = 3126, wingScore = 3247 },
    GOLD        = { minScore = 2774, wingScore = 2936 },
    SILVER      = { minScore = 1729, wingScore = 2490 },
    BRONZE      = { minScore =  456, wingScore =  1026 },
    IRON        = { minScore =    1, wingScore =  240 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4169,
    CHALLENGER  = { minScore = 4032, wingScore = 4043 },
    GRANDMASTER = { minScore = 3987, wingScore = 4009 },
    MASTER      = { minScore = 3830, wingScore = 3909 },
    DIAMOND     = { minScore = 3689, wingScore = 3760 },
    EMERALD     = { minScore = 3502, wingScore = 3596 },
    PLATINUM    = { minScore = 3176, wingScore = 3315 },
    GOLD        = { minScore = 2774, wingScore = 2973 },
    SILVER      = { minScore = 1729, wingScore = 2490 },
    BRONZE      = { minScore =  456, wingScore =  1026 },
    IRON        = { minScore =    1, wingScore =  240 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4110,
    CHALLENGER  = { minScore = 3966, wingScore = 4015 },
    GRANDMASTER = { minScore = 3873, wingScore = 3904 },
    MASTER      = { minScore = 3719, wingScore = 3779 },
    DIAMOND     = { minScore = 3472, wingScore = 3564 },
    EMERALD     = { minScore = 3341, wingScore = 3411 },
    PLATINUM    = { minScore = 3050, wingScore = 3160 },
    GOLD        = { minScore = 2688, wingScore = 2881 },
    SILVER      = { minScore = 1434, wingScore = 2281 },
    BRONZE      = { minScore =  350, wingScore =  836 },
    IRON        = { minScore =    1, wingScore =  180 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4110,
    CHALLENGER  = { minScore = 3883, wingScore = 4015 },
    GRANDMASTER = { minScore = 3830, wingScore = 3857 },
    MASTER      = { minScore = 3645, wingScore = 3738 },
    DIAMOND     = { minScore = 3505, wingScore = 3575 },
    EMERALD     = { minScore = 3319, wingScore = 3412 },
    PLATINUM    = { minScore = 3054, wingScore = 3157 },
    GOLD        = { minScore = 2688, wingScore = 2869 },
    SILVER      = { minScore = 1434, wingScore = 2281 },
    BRONZE      = { minScore =  350, wingScore =  836 },
    IRON        = { minScore =    1, wingScore =  180 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4110,
    CHALLENGER  = { minScore = 4012, wingScore = 4015 },
    GRANDMASTER = { minScore = 3960, wingScore = 3986 },
    MASTER      = { minScore = 3778, wingScore = 3869 },
    DIAMOND     = { minScore = 3626, wingScore = 3702 },
    EMERALD     = { minScore = 3423, wingScore = 3524 },
    PLATINUM    = { minScore = 3118, wingScore = 3240 },
    GOLD        = { minScore = 2688, wingScore = 2914 },
    SILVER      = { minScore = 1434, wingScore = 2281 },
    BRONZE      = { minScore =  350, wingScore =  836 },
    IRON        = { minScore =    1, wingScore =  180 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4169,
    CHALLENGER  = { minScore = 3992, wingScore = 4031 },
    GRANDMASTER = { minScore = 3893, wingScore = 3926 },
    MASTER      = { minScore = 3757, wingScore = 3812 },
    DIAMOND     = { minScore = 3521, wingScore = 3616 },
    EMERALD     = { minScore = 3386, wingScore = 3445 },
    PLATINUM    = { minScore = 3088, wingScore = 3215 },
    GOLD        = { minScore = 2738, wingScore = 2945 },
    SILVER      = { minScore = 1606, wingScore = 2403 },
    BRONZE      = { minScore =  412, wingScore =  947 },
    IRON        = { minScore =    1, wingScore =  215 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4169,
    CHALLENGER  = { minScore = 3913, wingScore = 4032 },
    GRANDMASTER = { minScore = 3864, wingScore = 3888 },
    MASTER      = { minScore = 3693, wingScore = 3779 },
    DIAMOND     = { minScore = 3557, wingScore = 3625 },
    EMERALD     = { minScore = 3377, wingScore = 3467 },
    PLATINUM    = { minScore = 3097, wingScore = 3210 },
    GOLD        = { minScore = 2739, wingScore = 2909 },
    SILVER      = { minScore = 1609, wingScore = 2405 },
    BRONZE      = { minScore =  413, wingScore =  949 },
    IRON        = { minScore =    1, wingScore =  216 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4169,
    CHALLENGER  = { minScore = 4023, wingScore = 4031 },
    GRANDMASTER = { minScore = 3975, wingScore = 3999 },
    MASTER      = { minScore = 3808, wingScore = 3892 },
    DIAMOND     = { minScore = 3662, wingScore = 3735 },
    EMERALD     = { minScore = 3468, wingScore = 3565 },
    PLATINUM    = { minScore = 3151, wingScore = 3283 },
    GOLD        = { minScore = 2737, wingScore = 2948 },
    SILVER      = { minScore = 1602, wingScore = 2400 },
    BRONZE      = { minScore =  411, wingScore =  944 },
    IRON        = { minScore =    1, wingScore =  214 },
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
