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
    top100Score = 4138,
    CHALLENGER  = { minScore = 3976, wingScore = 4019 },
    GRANDMASTER = { minScore = 3891, wingScore = 3912 },
    MASTER      = { minScore = 3767, wingScore = 3804 },
    DIAMOND     = { minScore = 3541, wingScore = 3622 },
    EMERALD     = { minScore = 3405, wingScore = 3449 },
    PLATINUM    = { minScore = 3099, wingScore = 3232 },
    GOLD        = { minScore = 2757, wingScore = 2968 },
    SILVER      = { minScore = 1698, wingScore = 2463 },
    BRONZE      = { minScore =  434, wingScore =  1007 },
    IRON        = { minScore =    1, wingScore =  235 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4138,
    CHALLENGER  = { minScore = 3907, wingScore = 4019 },
    GRANDMASTER = { minScore = 3860, wingScore = 3884 },
    MASTER      = { minScore = 3696, wingScore = 3778 },
    DIAMOND     = { minScore = 3566, wingScore = 3631 },
    EMERALD     = { minScore = 3394, wingScore = 3480 },
    PLATINUM    = { minScore = 3114, wingScore = 3230 },
    GOLD        = { minScore = 2757, wingScore = 2925 },
    SILVER      = { minScore = 1698, wingScore = 2463 },
    BRONZE      = { minScore =  434, wingScore =  1007 },
    IRON        = { minScore =    1, wingScore =  235 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4138,
    CHALLENGER  = { minScore = 4013, wingScore = 4019 },
    GRANDMASTER = { minScore = 3966, wingScore = 3989 },
    MASTER      = { minScore = 3799, wingScore = 3882 },
    DIAMOND     = { minScore = 3662, wingScore = 3730 },
    EMERALD     = { minScore = 3480, wingScore = 3571 },
    PLATINUM    = { minScore = 3161, wingScore = 3297 },
    GOLD        = { minScore = 2757, wingScore = 2958 },
    SILVER      = { minScore = 1698, wingScore = 2463 },
    BRONZE      = { minScore =  434, wingScore =  1007 },
    IRON        = { minScore =    1, wingScore =  235 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4059,
    CHALLENGER  = { minScore = 3926, wingScore = 3985 },
    GRANDMASTER = { minScore = 3833, wingScore = 3883 },
    MASTER      = { minScore = 3688, wingScore = 3754 },
    DIAMOND     = { minScore = 3451, wingScore = 3544 },
    EMERALD     = { minScore = 3317, wingScore = 3400 },
    PLATINUM    = { minScore = 3038, wingScore = 3140 },
    GOLD        = { minScore = 2676, wingScore = 2858 },
    SILVER      = { minScore = 1406, wingScore = 2256 },
    BRONZE      = { minScore =  343, wingScore =  824 },
    IRON        = { minScore =    1, wingScore =  174 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4059,
    CHALLENGER  = { minScore = 3850, wingScore = 3985 },
    GRANDMASTER = { minScore = 3797, wingScore = 3824 },
    MASTER      = { minScore = 3613, wingScore = 3705 },
    DIAMOND     = { minScore = 3477, wingScore = 3545 },
    EMERALD     = { minScore = 3296, wingScore = 3387 },
    PLATINUM    = { minScore = 3029, wingScore = 3135 },
    GOLD        = { minScore = 2676, wingScore = 2848 },
    SILVER      = { minScore = 1406, wingScore = 2256 },
    BRONZE      = { minScore =  343, wingScore =  824 },
    IRON        = { minScore =    1, wingScore =  174 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4059,
    CHALLENGER  = { minScore = 3971, wingScore = 3985 },
    GRANDMASTER = { minScore = 3922, wingScore = 3947 },
    MASTER      = { minScore = 3751, wingScore = 3837 },
    DIAMOND     = { minScore = 3600, wingScore = 3676 },
    EMERALD     = { minScore = 3398, wingScore = 3499 },
    PLATINUM    = { minScore = 3104, wingScore = 3220 },
    GOLD        = { minScore = 2676, wingScore = 2904 },
    SILVER      = { minScore = 1406, wingScore = 2256 },
    BRONZE      = { minScore =  343, wingScore =  824 },
    IRON        = { minScore =    1, wingScore =  174 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4138,
    CHALLENGER  = { minScore = 3955, wingScore = 4005 },
    GRANDMASTER = { minScore = 3867, wingScore = 3900 },
    MASTER      = { minScore = 3734, wingScore = 3783 },
    DIAMOND     = { minScore = 3503, wingScore = 3589 },
    EMERALD     = { minScore = 3368, wingScore = 3429 },
    PLATINUM    = { minScore = 3074, wingScore = 3194 },
    GOLD        = { minScore = 2723, wingScore = 2922 },
    SILVER      = { minScore = 1576, wingScore = 2377 },
    BRONZE      = { minScore =  396, wingScore =  931 },
    IRON        = { minScore =    1, wingScore =  210 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4138,
    CHALLENGER  = { minScore = 3884, wingScore = 4005 },
    GRANDMASTER = { minScore = 3834, wingScore = 3860 },
    MASTER      = { minScore = 3662, wingScore = 3748 },
    DIAMOND     = { minScore = 3530, wingScore = 3596 },
    EMERALD     = { minScore = 3354, wingScore = 3442 },
    PLATINUM    = { minScore = 3080, wingScore = 3192 },
    GOLD        = { minScore = 2724, wingScore = 2894 },
    SILVER      = { minScore = 1580, wingScore = 2379 },
    BRONZE      = { minScore =  397, wingScore =  933 },
    IRON        = { minScore =    1, wingScore =  210 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4138,
    CHALLENGER  = { minScore = 3995, wingScore = 4004 },
    GRANDMASTER = { minScore = 3947, wingScore = 3971 },
    MASTER      = { minScore = 3778, wingScore = 3863 },
    DIAMOND     = { minScore = 3635, wingScore = 3707 },
    EMERALD     = { minScore = 3445, wingScore = 3540 },
    PLATINUM    = { minScore = 3137, wingScore = 3264 },
    GOLD        = { minScore = 2722, wingScore = 2935 },
    SILVER      = { minScore = 1573, wingScore = 2374 },
    BRONZE      = { minScore =  395, wingScore =  929 },
    IRON        = { minScore =    1, wingScore =  209 },
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
