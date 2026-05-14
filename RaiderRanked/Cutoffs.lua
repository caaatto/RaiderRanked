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
    top100Score = 4033,
    CHALLENGER  = { minScore = 3891, wingScore = 3923 },
    GRANDMASTER = { minScore = 3793, wingScore = 3832 },
    MASTER      = { minScore = 3676, wingScore = 3732 },
    DIAMOND     = { minScore = 3469, wingScore = 3552 },
    EMERALD     = { minScore = 3339, wingScore = 3408 },
    PLATINUM    = { minScore = 3057, wingScore = 3177 },
    GOLD        = { minScore = 2718, wingScore = 2897 },
    SILVER      = { minScore = 1664, wingScore = 2413 },
    BRONZE      = { minScore =  415, wingScore =  994 },
    IRON        = { minScore =    1, wingScore =  230 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4033,
    CHALLENGER  = { minScore = 3822, wingScore = 3923 },
    GRANDMASTER = { minScore = 3779, wingScore = 3801 },
    MASTER      = { minScore = 3629, wingScore = 3704 },
    DIAMOND     = { minScore = 3500, wingScore = 3564 },
    EMERALD     = { minScore = 3327, wingScore = 3414 },
    PLATINUM    = { minScore = 3071, wingScore = 3173 },
    GOLD        = { minScore = 2718, wingScore = 2892 },
    SILVER      = { minScore = 1664, wingScore = 2413 },
    BRONZE      = { minScore =  415, wingScore =  994 },
    IRON        = { minScore =    1, wingScore =  230 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4033,
    CHALLENGER  = { minScore = 3911, wingScore = 3923 },
    GRANDMASTER = { minScore = 3870, wingScore = 3890 },
    MASTER      = { minScore = 3725, wingScore = 3798 },
    DIAMOND     = { minScore = 3590, wingScore = 3658 },
    EMERALD     = { minScore = 3410, wingScore = 3500 },
    PLATINUM    = { minScore = 3117, wingScore = 3239 },
    GOLD        = { minScore = 2718, wingScore = 2921 },
    SILVER      = { minScore = 1664, wingScore = 2413 },
    BRONZE      = { minScore =  415, wingScore =  994 },
    IRON        = { minScore =    1, wingScore =  230 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3971,
    CHALLENGER  = { minScore = 3850, wingScore = 3896 },
    GRANDMASTER = { minScore = 3760, wingScore = 3786 },
    MASTER      = { minScore = 3617, wingScore = 3668 },
    DIAMOND     = { minScore = 3410, wingScore = 3475 },
    EMERALD     = { minScore = 3249, wingScore = 3324 },
    PLATINUM    = { minScore = 3012, wingScore = 3091 },
    GOLD        = { minScore = 2653, wingScore = 2799 },
    SILVER      = { minScore = 1370, wingScore = 2212 },
    BRONZE      = { minScore =  340, wingScore =  805 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3971,
    CHALLENGER  = { minScore = 3772, wingScore = 3896 },
    GRANDMASTER = { minScore = 3721, wingScore = 3746 },
    MASTER      = { minScore = 3543, wingScore = 3632 },
    DIAMOND     = { minScore = 3411, wingScore = 3477 },
    EMERALD     = { minScore = 3234, wingScore = 3322 },
    PLATINUM    = { minScore = 2963, wingScore = 3072 },
    GOLD        = { minScore = 2653, wingScore = 2793 },
    SILVER      = { minScore = 1370, wingScore = 2212 },
    BRONZE      = { minScore =  340, wingScore =  805 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3971,
    CHALLENGER  = { minScore = 3894, wingScore = 3896 },
    GRANDMASTER = { minScore = 3843, wingScore = 3868 },
    MASTER      = { minScore = 3667, wingScore = 3755 },
    DIAMOND     = { minScore = 3521, wingScore = 3594 },
    EMERALD     = { minScore = 3326, wingScore = 3424 },
    PLATINUM    = { minScore = 3041, wingScore = 3154 },
    GOLD        = { minScore = 2653, wingScore = 2854 },
    SILVER      = { minScore = 1370, wingScore = 2212 },
    BRONZE      = { minScore =  340, wingScore =  805 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4033,
    CHALLENGER  = { minScore = 3874, wingScore = 3912 },
    GRANDMASTER = { minScore = 3779, wingScore = 3813 },
    MASTER      = { minScore = 3651, wingScore = 3705 },
    DIAMOND     = { minScore = 3444, wingScore = 3520 },
    EMERALD     = { minScore = 3301, wingScore = 3373 },
    PLATINUM    = { minScore = 3038, wingScore = 3141 },
    GOLD        = { minScore = 2691, wingScore = 2856 },
    SILVER      = { minScore = 1541, wingScore = 2329 },
    BRONZE      = { minScore =  384, wingScore =  915 },
    IRON        = { minScore =    1, wingScore =  205 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4033,
    CHALLENGER  = { minScore = 3802, wingScore = 3912 },
    GRANDMASTER = { minScore = 3755, wingScore = 3779 },
    MASTER      = { minScore = 3594, wingScore = 3675 },
    DIAMOND     = { minScore = 3464, wingScore = 3529 },
    EMERALD     = { minScore = 3289, wingScore = 3377 },
    PLATINUM    = { minScore = 3027, wingScore = 3132 },
    GOLD        = { minScore = 2692, wingScore = 2852 },
    SILVER      = { minScore = 1545, wingScore = 2331 },
    BRONZE      = { minScore =  385, wingScore =  917 },
    IRON        = { minScore =    1, wingScore =  206 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4033,
    CHALLENGER  = { minScore = 3904, wingScore = 3911 },
    GRANDMASTER = { minScore = 3858, wingScore = 3881 },
    MASTER      = { minScore = 3700, wingScore = 3780 },
    DIAMOND     = { minScore = 3560, wingScore = 3631 },
    EMERALD     = { minScore = 3374, wingScore = 3467 },
    PLATINUM    = { minScore = 3084, wingScore = 3202 },
    GOLD        = { minScore = 2690, wingScore = 2892 },
    SILVER      = { minScore = 1538, wingScore = 2327 },
    BRONZE      = { minScore =  383, wingScore =  913 },
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
