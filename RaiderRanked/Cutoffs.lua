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
    top100Score = 4065,
    CHALLENGER  = { minScore = 3900, wingScore = 3946 },
    GRANDMASTER = { minScore = 3816, wingScore = 3857 },
    MASTER      = { minScore = 3694, wingScore = 3756 },
    DIAMOND     = { minScore = 3486, wingScore = 3564 },
    EMERALD     = { minScore = 3354, wingScore = 3418 },
    PLATINUM    = { minScore = 3068, wingScore = 3192 },
    GOLD        = { minScore = 2728, wingScore = 2917 },
    SILVER      = { minScore = 1670, wingScore = 2427 },
    BRONZE      = { minScore =  420, wingScore =  996 },
    IRON        = { minScore =    1, wingScore =  230 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4065,
    CHALLENGER  = { minScore = 3846, wingScore = 3946 },
    GRANDMASTER = { minScore = 3802, wingScore = 3824 },
    MASTER      = { minScore = 3647, wingScore = 3724 },
    DIAMOND     = { minScore = 3516, wingScore = 3582 },
    EMERALD     = { minScore = 3343, wingScore = 3429 },
    PLATINUM    = { minScore = 3086, wingScore = 3188 },
    GOLD        = { minScore = 2728, wingScore = 2905 },
    SILVER      = { minScore = 1670, wingScore = 2427 },
    BRONZE      = { minScore =  420, wingScore =  996 },
    IRON        = { minScore =    1, wingScore =  230 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4065,
    CHALLENGER  = { minScore = 3929, wingScore = 3946 },
    GRANDMASTER = { minScore = 3888, wingScore = 3908 },
    MASTER      = { minScore = 3746, wingScore = 3817 },
    DIAMOND     = { minScore = 3608, wingScore = 3677 },
    EMERALD     = { minScore = 3425, wingScore = 3517 },
    PLATINUM    = { minScore = 3127, wingScore = 3251 },
    GOLD        = { minScore = 2728, wingScore = 2931 },
    SILVER      = { minScore = 1670, wingScore = 2427 },
    BRONZE      = { minScore =  420, wingScore =  996 },
    IRON        = { minScore =    1, wingScore =  230 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3996,
    CHALLENGER  = { minScore = 3870, wingScore = 3909 },
    GRANDMASTER = { minScore = 3773, wingScore = 3800 },
    MASTER      = { minScore = 3634, wingScore = 3680 },
    DIAMOND     = { minScore = 3418, wingScore = 3489 },
    EMERALD     = { minScore = 3264, wingScore = 3336 },
    PLATINUM    = { minScore = 3018, wingScore = 3101 },
    GOLD        = { minScore = 2658, wingScore = 2813 },
    SILVER      = { minScore = 1376, wingScore = 2221 },
    BRONZE      = { minScore =  340, wingScore =  807 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3996,
    CHALLENGER  = { minScore = 3777, wingScore = 3909 },
    GRANDMASTER = { minScore = 3727, wingScore = 3752 },
    MASTER      = { minScore = 3553, wingScore = 3640 },
    DIAMOND     = { minScore = 3422, wingScore = 3487 },
    EMERALD     = { minScore = 3246, wingScore = 3334 },
    PLATINUM    = { minScore = 2977, wingScore = 3086 },
    GOLD        = { minScore = 2658, wingScore = 2805 },
    SILVER      = { minScore = 1376, wingScore = 2221 },
    BRONZE      = { minScore =  340, wingScore =  807 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3996,
    CHALLENGER  = { minScore = 3899, wingScore = 3909 },
    GRANDMASTER = { minScore = 3849, wingScore = 3874 },
    MASTER      = { minScore = 3677, wingScore = 3763 },
    DIAMOND     = { minScore = 3532, wingScore = 3604 },
    EMERALD     = { minScore = 3338, wingScore = 3435 },
    PLATINUM    = { minScore = 3058, wingScore = 3168 },
    GOLD        = { minScore = 2658, wingScore = 2868 },
    SILVER      = { minScore = 1376, wingScore = 2221 },
    BRONZE      = { minScore =  340, wingScore =  807 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4065,
    CHALLENGER  = { minScore = 3887, wingScore = 3931 },
    GRANDMASTER = { minScore = 3798, wingScore = 3833 },
    MASTER      = { minScore = 3669, wingScore = 3724 },
    DIAMOND     = { minScore = 3458, wingScore = 3533 },
    EMERALD     = { minScore = 3316, wingScore = 3384 },
    PLATINUM    = { minScore = 3047, wingScore = 3154 },
    GOLD        = { minScore = 2699, wingScore = 2874 },
    SILVER      = { minScore = 1547, wingScore = 2341 },
    BRONZE      = { minScore =  387, wingScore =  917 },
    IRON        = { minScore =    1, wingScore =  205 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4065,
    CHALLENGER  = { minScore = 3818, wingScore = 3931 },
    GRANDMASTER = { minScore = 3772, wingScore = 3795 },
    MASTER      = { minScore = 3609, wingScore = 3690 },
    DIAMOND     = { minScore = 3478, wingScore = 3543 },
    EMERALD     = { minScore = 3304, wingScore = 3390 },
    PLATINUM    = { minScore = 3042, wingScore = 3147 },
    GOLD        = { minScore = 2700, wingScore = 2864 },
    SILVER      = { minScore = 1551, wingScore = 2344 },
    BRONZE      = { minScore =  388, wingScore =  919 },
    IRON        = { minScore =    1, wingScore =  206 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4065,
    CHALLENGER  = { minScore = 3916, wingScore = 3930 },
    GRANDMASTER = { minScore = 3871, wingScore = 3893 },
    MASTER      = { minScore = 3716, wingScore = 3794 },
    DIAMOND     = { minScore = 3575, wingScore = 3646 },
    EMERALD     = { minScore = 3388, wingScore = 3482 },
    PLATINUM    = { minScore = 3097, wingScore = 3215 },
    GOLD        = { minScore = 2698, wingScore = 2904 },
    SILVER      = { minScore = 1544, wingScore = 2339 },
    BRONZE      = { minScore =  386, wingScore =  915 },
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
