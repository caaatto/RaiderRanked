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
    top100Score = 3824,
    CHALLENGER  = { minScore = 3681, wingScore = 3738 },
    GRANDMASTER = { minScore = 3603, wingScore = 3641 },
    MASTER      = { minScore = 3481, wingScore = 3536 },
    DIAMOND     = { minScore = 3296, wingScore = 3364 },
    EMERALD     = { minScore = 3146, wingScore = 3212 },
    PLATINUM    = { minScore = 2900, wingScore = 3021 },
    GOLD        = { minScore = 2621, wingScore = 2718 },
    SILVER      = { minScore = 1423, wingScore = 2204 },
    BRONZE      = { minScore =  368, wingScore =  866 },
    IRON        = { minScore =    1, wingScore =  197 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3824,
    CHALLENGER  = { minScore = 3639, wingScore = 3738 },
    GRANDMASTER = { minScore = 3594, wingScore = 3617 },
    MASTER      = { minScore = 3434, wingScore = 3514 },
    DIAMOND     = { minScore = 3311, wingScore = 3373 },
    EMERALD     = { minScore = 3148, wingScore = 3230 },
    PLATINUM    = { minScore = 2871, wingScore = 2988 },
    GOLD        = { minScore = 2621, wingScore = 2719 },
    SILVER      = { minScore = 1423, wingScore = 2204 },
    BRONZE      = { minScore =  368, wingScore =  866 },
    IRON        = { minScore =    1, wingScore =  197 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3824,
    CHALLENGER  = { minScore = 3719, wingScore = 3738 },
    GRANDMASTER = { minScore = 3677, wingScore = 3698 },
    MASTER      = { minScore = 3530, wingScore = 3604 },
    DIAMOND     = { minScore = 3394, wingScore = 3462 },
    EMERALD     = { minScore = 3213, wingScore = 3304 },
    PLATINUM    = { minScore = 2918, wingScore = 3041 },
    GOLD        = { minScore = 2621, wingScore = 2754 },
    SILVER      = { minScore = 1423, wingScore = 2204 },
    BRONZE      = { minScore =  368, wingScore =  866 },
    IRON        = { minScore =    1, wingScore =  197 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3780,
    CHALLENGER  = { minScore = 3657, wingScore = 3701 },
    GRANDMASTER = { minScore = 3553, wingScore = 3590 },
    MASTER      = { minScore = 3422, wingScore = 3468 },
    DIAMOND     = { minScore = 3206, wingScore = 3293 },
    EMERALD     = { minScore = 3065, wingScore = 3121 },
    PLATINUM    = { minScore = 2800, wingScore = 2959 },
    GOLD        = { minScore = 2503, wingScore = 2660 },
    SILVER      = { minScore = 1192, wingScore = 2010 },
    BRONZE      = { minScore =  336, wingScore =  707 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3780,
    CHALLENGER  = { minScore = 3569, wingScore = 3701 },
    GRANDMASTER = { minScore = 3520, wingScore = 3545 },
    MASTER      = { minScore = 3351, wingScore = 3436 },
    DIAMOND     = { minScore = 3237, wingScore = 3294 },
    EMERALD     = { minScore = 3086, wingScore = 3162 },
    PLATINUM    = { minScore = 2801, wingScore = 2927 },
    GOLD        = { minScore = 2503, wingScore = 2619 },
    SILVER      = { minScore = 1192, wingScore = 2010 },
    BRONZE      = { minScore =  336, wingScore =  707 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3780,
    CHALLENGER  = { minScore = 3687, wingScore = 3701 },
    GRANDMASTER = { minScore = 3637, wingScore = 3662 },
    MASTER      = { minScore = 3462, wingScore = 3550 },
    DIAMOND     = { minScore = 3325, wingScore = 3394 },
    EMERALD     = { minScore = 3142, wingScore = 3233 },
    PLATINUM    = { minScore = 2842, wingScore = 2967 },
    GOLD        = { minScore = 2503, wingScore = 2670 },
    SILVER      = { minScore = 1192, wingScore = 2010 },
    BRONZE      = { minScore =  336, wingScore =  707 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3824,
    CHALLENGER  = { minScore = 3671, wingScore = 3722 },
    GRANDMASTER = { minScore = 3582, wingScore = 3620 },
    MASTER      = { minScore = 3456, wingScore = 3508 },
    DIAMOND     = { minScore = 3258, wingScore = 3334 },
    EMERALD     = { minScore = 3112, wingScore = 3174 },
    PLATINUM    = { minScore = 2858, wingScore = 2995 },
    GOLD        = { minScore = 2572, wingScore = 2694 },
    SILVER      = { minScore = 1326, wingScore = 2123 },
    BRONZE      = { minScore =  355, wingScore =  799 },
    IRON        = { minScore =    1, wingScore =  186 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3824,
    CHALLENGER  = { minScore = 3611, wingScore = 3723 },
    GRANDMASTER = { minScore = 3564, wingScore = 3588 },
    MASTER      = { minScore = 3400, wingScore = 3482 },
    DIAMOND     = { minScore = 3281, wingScore = 3341 },
    EMERALD     = { minScore = 3123, wingScore = 3202 },
    PLATINUM    = { minScore = 2843, wingScore = 2963 },
    GOLD        = { minScore = 2573, wingScore = 2678 },
    SILVER      = { minScore = 1329, wingScore = 2125 },
    BRONZE      = { minScore =  355, wingScore =  801 },
    IRON        = { minScore =    1, wingScore =  186 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3824,
    CHALLENGER  = { minScore = 3705, wingScore = 3722 },
    GRANDMASTER = { minScore = 3660, wingScore = 3682 },
    MASTER      = { minScore = 3501, wingScore = 3581 },
    DIAMOND     = { minScore = 3364, wingScore = 3433 },
    EMERALD     = { minScore = 3182, wingScore = 3273 },
    PLATINUM    = { minScore = 2885, wingScore = 3009 },
    GOLD        = { minScore = 2570, wingScore = 2718 },
    SILVER      = { minScore = 1323, wingScore = 2120 },
    BRONZE      = { minScore =  354, wingScore =  797 },
    IRON        = { minScore =    1, wingScore =  185 },
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
