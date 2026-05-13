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
    top100Score = 4032,
    CHALLENGER  = { minScore = 3890, wingScore = 3921 },
    GRANDMASTER = { minScore = 3792, wingScore = 3830 },
    MASTER      = { minScore = 3674, wingScore = 3730 },
    DIAMOND     = { minScore = 3465, wingScore = 3550 },
    EMERALD     = { minScore = 3334, wingScore = 3406 },
    PLATINUM    = { minScore = 3052, wingScore = 3171 },
    GOLD        = { minScore = 2712, wingScore = 2889 },
    SILVER      = { minScore = 1658, wingScore = 2404 },
    BRONZE      = { minScore =  411, wingScore =  991 },
    IRON        = { minScore =    1, wingScore =  230 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4032,
    CHALLENGER  = { minScore = 3820, wingScore = 3921 },
    GRANDMASTER = { minScore = 3777, wingScore = 3798 },
    MASTER      = { minScore = 3626, wingScore = 3702 },
    DIAMOND     = { minScore = 3497, wingScore = 3561 },
    EMERALD     = { minScore = 3324, wingScore = 3410 },
    PLATINUM    = { minScore = 3066, wingScore = 3169 },
    GOLD        = { minScore = 2712, wingScore = 2886 },
    SILVER      = { minScore = 1658, wingScore = 2404 },
    BRONZE      = { minScore =  411, wingScore =  991 },
    IRON        = { minScore =    1, wingScore =  230 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4032,
    CHALLENGER  = { minScore = 3909, wingScore = 3921 },
    GRANDMASTER = { minScore = 3868, wingScore = 3889 },
    MASTER      = { minScore = 3722, wingScore = 3795 },
    DIAMOND     = { minScore = 3587, wingScore = 3655 },
    EMERALD     = { minScore = 3407, wingScore = 3497 },
    PLATINUM    = { minScore = 3115, wingScore = 3236 },
    GOLD        = { minScore = 2712, wingScore = 2918 },
    SILVER      = { minScore = 1658, wingScore = 2404 },
    BRONZE      = { minScore =  411, wingScore =  991 },
    IRON        = { minScore =    1, wingScore =  230 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3967,
    CHALLENGER  = { minScore = 3845, wingScore = 3895 },
    GRANDMASTER = { minScore = 3757, wingScore = 3782 },
    MASTER      = { minScore = 3613, wingScore = 3666 },
    DIAMOND     = { minScore = 3408, wingScore = 3470 },
    EMERALD     = { minScore = 3243, wingScore = 3319 },
    PLATINUM    = { minScore = 3010, wingScore = 3086 },
    GOLD        = { minScore = 2650, wingScore = 2793 },
    SILVER      = { minScore = 1365, wingScore = 2206 },
    BRONZE      = { minScore =  340, wingScore =  802 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3967,
    CHALLENGER  = { minScore = 3770, wingScore = 3895 },
    GRANDMASTER = { minScore = 3720, wingScore = 3745 },
    MASTER      = { minScore = 3541, wingScore = 3630 },
    DIAMOND     = { minScore = 3408, wingScore = 3474 },
    EMERALD     = { minScore = 3229, wingScore = 3318 },
    PLATINUM    = { minScore = 2956, wingScore = 3066 },
    GOLD        = { minScore = 2650, wingScore = 2787 },
    SILVER      = { minScore = 1365, wingScore = 2206 },
    BRONZE      = { minScore =  340, wingScore =  802 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3967,
    CHALLENGER  = { minScore = 3893, wingScore = 3895 },
    GRANDMASTER = { minScore = 3842, wingScore = 3867 },
    MASTER      = { minScore = 3664, wingScore = 3753 },
    DIAMOND     = { minScore = 3517, wingScore = 3591 },
    EMERALD     = { minScore = 3321, wingScore = 3419 },
    PLATINUM    = { minScore = 3033, wingScore = 3147 },
    GOLD        = { minScore = 2650, wingScore = 2847 },
    SILVER      = { minScore = 1365, wingScore = 2206 },
    BRONZE      = { minScore =  340, wingScore =  802 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4032,
    CHALLENGER  = { minScore = 3871, wingScore = 3910 },
    GRANDMASTER = { minScore = 3777, wingScore = 3810 },
    MASTER      = { minScore = 3649, wingScore = 3703 },
    DIAMOND     = { minScore = 3441, wingScore = 3517 },
    EMERALD     = { minScore = 3296, wingScore = 3370 },
    PLATINUM    = { minScore = 3034, wingScore = 3136 },
    GOLD        = { minScore = 2686, wingScore = 2849 },
    SILVER      = { minScore = 1536, wingScore = 2321 },
    BRONZE      = { minScore =  381, wingScore =  912 },
    IRON        = { minScore =    1, wingScore =  205 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4032,
    CHALLENGER  = { minScore = 3800, wingScore = 3910 },
    GRANDMASTER = { minScore = 3754, wingScore = 3776 },
    MASTER      = { minScore = 3591, wingScore = 3673 },
    DIAMOND     = { minScore = 3461, wingScore = 3526 },
    EMERALD     = { minScore = 3285, wingScore = 3373 },
    PLATINUM    = { minScore = 3021, wingScore = 3127 },
    GOLD        = { minScore = 2687, wingScore = 2846 },
    SILVER      = { minScore = 1539, wingScore = 2324 },
    BRONZE      = { minScore =  382, wingScore =  914 },
    IRON        = { minScore =    1, wingScore =  206 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4032,
    CHALLENGER  = { minScore = 3902, wingScore = 3910 },
    GRANDMASTER = { minScore = 3857, wingScore = 3880 },
    MASTER      = { minScore = 3697, wingScore = 3777 },
    DIAMOND     = { minScore = 3557, wingScore = 3627 },
    EMERALD     = { minScore = 3370, wingScore = 3463 },
    PLATINUM    = { minScore = 3080, wingScore = 3198 },
    GOLD        = { minScore = 2685, wingScore = 2887 },
    SILVER      = { minScore = 1532, wingScore = 2319 },
    BRONZE      = { minScore =  380, wingScore =  910 },
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
