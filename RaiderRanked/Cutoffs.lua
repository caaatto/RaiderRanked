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
    top100Score = 3951,
    CHALLENGER  = { minScore = 3796, wingScore = 3854 },
    GRANDMASTER = { minScore = 3723, wingScore = 3760 },
    MASTER      = { minScore = 3595, wingScore = 3652 },
    DIAMOND     = { minScore = 3404, wingScore = 3468 },
    EMERALD     = { minScore = 3253, wingScore = 3321 },
    PLATINUM    = { minScore = 3010, wingScore = 3094 },
    GOLD        = { minScore = 2667, wingScore = 2803 },
    SILVER      = { minScore = 1539, wingScore = 2310 },
    BRONZE      = { minScore =  384, wingScore =  923 },
    IRON        = { minScore =    1, wingScore =  200 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3951,
    CHALLENGER  = { minScore = 3751, wingScore = 3854 },
    GRANDMASTER = { minScore = 3704, wingScore = 3727 },
    MASTER      = { minScore = 3542, wingScore = 3623 },
    DIAMOND     = { minScore = 3413, wingScore = 3477 },
    EMERALD     = { minScore = 3241, wingScore = 3327 },
    PLATINUM    = { minScore = 2968, wingScore = 3080 },
    GOLD        = { minScore = 2667, wingScore = 2802 },
    SILVER      = { minScore = 1539, wingScore = 2310 },
    BRONZE      = { minScore =  384, wingScore =  923 },
    IRON        = { minScore =    1, wingScore =  200 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3951,
    CHALLENGER  = { minScore = 3834, wingScore = 3854 },
    GRANDMASTER = { minScore = 3791, wingScore = 3813 },
    MASTER      = { minScore = 3640, wingScore = 3716 },
    DIAMOND     = { minScore = 3502, wingScore = 3571 },
    EMERALD     = { minScore = 3318, wingScore = 3410 },
    PLATINUM    = { minScore = 3030, wingScore = 3148 },
    GOLD        = { minScore = 2667, wingScore = 2846 },
    SILVER      = { minScore = 1539, wingScore = 2310 },
    BRONZE      = { minScore =  384, wingScore =  923 },
    IRON        = { minScore =    1, wingScore =  200 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3896,
    CHALLENGER  = { minScore = 3773, wingScore = 3819 },
    GRANDMASTER = { minScore = 3666, wingScore = 3706 },
    MASTER      = { minScore = 3536, wingScore = 3581 },
    DIAMOND     = { minScore = 3320, wingScore = 3408 },
    EMERALD     = { minScore = 3162, wingScore = 3231 },
    PLATINUM    = { minScore = 2925, wingScore = 3032 },
    GOLD        = { minScore = 2597, wingScore = 2723 },
    SILVER      = { minScore = 1284, wingScore = 2105 },
    BRONZE      = { minScore =  337, wingScore =  737 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3896,
    CHALLENGER  = { minScore = 3677, wingScore = 3819 },
    GRANDMASTER = { minScore = 3627, wingScore = 3652 },
    MASTER      = { minScore = 3454, wingScore = 3541 },
    DIAMOND     = { minScore = 3326, wingScore = 3390 },
    EMERALD     = { minScore = 3156, wingScore = 3241 },
    PLATINUM    = { minScore = 2875, wingScore = 2993 },
    GOLD        = { minScore = 2597, wingScore = 2707 },
    SILVER      = { minScore = 1284, wingScore = 2105 },
    BRONZE      = { minScore =  337, wingScore =  737 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3896,
    CHALLENGER  = { minScore = 3803, wingScore = 3819 },
    GRANDMASTER = { minScore = 3753, wingScore = 3778 },
    MASTER      = { minScore = 3575, wingScore = 3664 },
    DIAMOND     = { minScore = 3430, wingScore = 3503 },
    EMERALD     = { minScore = 3237, wingScore = 3333 },
    PLATINUM    = { minScore = 2938, wingScore = 3059 },
    GOLD        = { minScore = 2597, wingScore = 2765 },
    SILVER      = { minScore = 1284, wingScore = 2105 },
    BRONZE      = { minScore =  337, wingScore =  737 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3951,
    CHALLENGER  = { minScore = 3786, wingScore = 3839 },
    GRANDMASTER = { minScore = 3699, wingScore = 3737 },
    MASTER      = { minScore = 3570, wingScore = 3622 },
    DIAMOND     = { minScore = 3369, wingScore = 3443 },
    EMERALD     = { minScore = 3215, wingScore = 3283 },
    PLATINUM    = { minScore = 2974, wingScore = 3068 },
    GOLD        = { minScore = 2638, wingScore = 2770 },
    SILVER      = { minScore = 1432, wingScore = 2224 },
    BRONZE      = { minScore =  364, wingScore =  845 },
    IRON        = { minScore =    1, wingScore =  187 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3951,
    CHALLENGER  = { minScore = 3721, wingScore = 3840 },
    GRANDMASTER = { minScore = 3673, wingScore = 3697 },
    MASTER      = { minScore = 3506, wingScore = 3590 },
    DIAMOND     = { minScore = 3378, wingScore = 3442 },
    EMERALD     = { minScore = 3206, wingScore = 3292 },
    PLATINUM    = { minScore = 2930, wingScore = 3045 },
    GOLD        = { minScore = 2639, wingScore = 2763 },
    SILVER      = { minScore = 1435, wingScore = 2227 },
    BRONZE      = { minScore =  365, wingScore =  847 },
    IRON        = { minScore =    1, wingScore =  188 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3951,
    CHALLENGER  = { minScore = 3821, wingScore = 3839 },
    GRANDMASTER = { minScore = 3775, wingScore = 3798 },
    MASTER      = { minScore = 3612, wingScore = 3694 },
    DIAMOND     = { minScore = 3471, wingScore = 3542 },
    EMERALD     = { minScore = 3283, wingScore = 3377 },
    PLATINUM    = { minScore = 2990, wingScore = 3110 },
    GOLD        = { minScore = 2637, wingScore = 2811 },
    SILVER      = { minScore = 1429, wingScore = 2222 },
    BRONZE      = { minScore =  364, wingScore =  843 },
    IRON        = { minScore =    1, wingScore =  187 },
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
