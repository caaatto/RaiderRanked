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
    top100Score = 4164,
    CHALLENGER  = { minScore = 4000, wingScore = 4032 },
    GRANDMASTER = { minScore = 3900, wingScore = 3933 },
    MASTER      = { minScore = 3778, wingScore = 3824 },
    DIAMOND     = { minScore = 3551, wingScore = 3644 },
    EMERALD     = { minScore = 3413, wingScore = 3462 },
    PLATINUM    = { minScore = 3109, wingScore = 3246 },
    GOLD        = { minScore = 2766, wingScore = 2982 },
    SILVER      = { minScore = 1714, wingScore = 2479 },
    BRONZE      = { minScore =  441, wingScore =  1016 },
    IRON        = { minScore =    1, wingScore =  238 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4164,
    CHALLENGER  = { minScore = 3923, wingScore = 4032 },
    GRANDMASTER = { minScore = 3877, wingScore = 3900 },
    MASTER      = { minScore = 3716, wingScore = 3797 },
    DIAMOND     = { minScore = 3584, wingScore = 3650 },
    EMERALD     = { minScore = 3408, wingScore = 3496 },
    PLATINUM    = { minScore = 3122, wingScore = 3241 },
    GOLD        = { minScore = 2766, wingScore = 2931 },
    SILVER      = { minScore = 1714, wingScore = 2479 },
    BRONZE      = { minScore =  441, wingScore =  1016 },
    IRON        = { minScore =    1, wingScore =  238 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4164,
    CHALLENGER  = { minScore = 4024, wingScore = 4032 },
    GRANDMASTER = { minScore = 3979, wingScore = 4001 },
    MASTER      = { minScore = 3819, wingScore = 3899 },
    DIAMOND     = { minScore = 3681, wingScore = 3750 },
    EMERALD     = { minScore = 3496, wingScore = 3589 },
    PLATINUM    = { minScore = 3171, wingScore = 3311 },
    GOLD        = { minScore = 2766, wingScore = 2967 },
    SILVER      = { minScore = 1714, wingScore = 2479 },
    BRONZE      = { minScore =  441, wingScore =  1016 },
    IRON        = { minScore =    1, wingScore =  238 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4100,
    CHALLENGER  = { minScore = 3949, wingScore = 4012 },
    GRANDMASTER = { minScore = 3861, wingScore = 3896 },
    MASTER      = { minScore = 3708, wingScore = 3774 },
    DIAMOND     = { minScore = 3465, wingScore = 3557 },
    EMERALD     = { minScore = 3333, wingScore = 3408 },
    PLATINUM    = { minScore = 3046, wingScore = 3152 },
    GOLD        = { minScore = 2683, wingScore = 2872 },
    SILVER      = { minScore = 1424, wingScore = 2272 },
    BRONZE      = { minScore =  346, wingScore =  831 },
    IRON        = { minScore =    1, wingScore =  178 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4100,
    CHALLENGER  = { minScore = 3872, wingScore = 4012 },
    GRANDMASTER = { minScore = 3819, wingScore = 3846 },
    MASTER      = { minScore = 3635, wingScore = 3727 },
    DIAMOND     = { minScore = 3496, wingScore = 3565 },
    EMERALD     = { minScore = 3311, wingScore = 3403 },
    PLATINUM    = { minScore = 3045, wingScore = 3149 },
    GOLD        = { minScore = 2683, wingScore = 2861 },
    SILVER      = { minScore = 1424, wingScore = 2272 },
    BRONZE      = { minScore =  346, wingScore =  831 },
    IRON        = { minScore =    1, wingScore =  178 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4100,
    CHALLENGER  = { minScore = 4005, wingScore = 4012 },
    GRANDMASTER = { minScore = 3953, wingScore = 3979 },
    MASTER      = { minScore = 3774, wingScore = 3863 },
    DIAMOND     = { minScore = 3620, wingScore = 3697 },
    EMERALD     = { minScore = 3415, wingScore = 3517 },
    PLATINUM    = { minScore = 3112, wingScore = 3233 },
    GOLD        = { minScore = 2683, wingScore = 2910 },
    SILVER      = { minScore = 1424, wingScore = 2272 },
    BRONZE      = { minScore =  346, wingScore =  831 },
    IRON        = { minScore =    1, wingScore =  178 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4164,
    CHALLENGER  = { minScore = 3979, wingScore = 4024 },
    GRANDMASTER = { minScore = 3884, wingScore = 3918 },
    MASTER      = { minScore = 3749, wingScore = 3803 },
    DIAMOND     = { minScore = 3515, wingScore = 3608 },
    EMERALD     = { minScore = 3380, wingScore = 3439 },
    PLATINUM    = { minScore = 3083, wingScore = 3207 },
    GOLD        = { minScore = 2731, wingScore = 2936 },
    SILVER      = { minScore = 1593, wingScore = 2393 },
    BRONZE      = { minScore =  401, wingScore =  939 },
    IRON        = { minScore =    1, wingScore =  213 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4164,
    CHALLENGER  = { minScore = 3902, wingScore = 4024 },
    GRANDMASTER = { minScore = 3853, wingScore = 3878 },
    MASTER      = { minScore = 3683, wingScore = 3769 },
    DIAMOND     = { minScore = 3548, wingScore = 3615 },
    EMERALD     = { minScore = 3369, wingScore = 3458 },
    PLATINUM    = { minScore = 3091, wingScore = 3204 },
    GOLD        = { minScore = 2732, wingScore = 2903 },
    SILVER      = { minScore = 1596, wingScore = 2395 },
    BRONZE      = { minScore =  402, wingScore =  941 },
    IRON        = { minScore =    1, wingScore =  214 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4164,
    CHALLENGER  = { minScore = 4016, wingScore = 4023 },
    GRANDMASTER = { minScore = 3968, wingScore = 3992 },
    MASTER      = { minScore = 3800, wingScore = 3884 },
    DIAMOND     = { minScore = 3655, wingScore = 3727 },
    EMERALD     = { minScore = 3461, wingScore = 3558 },
    PLATINUM    = { minScore = 3146, wingScore = 3278 },
    GOLD        = { minScore = 2730, wingScore = 2943 },
    SILVER      = { minScore = 1590, wingScore = 2390 },
    BRONZE      = { minScore =  400, wingScore =  937 },
    IRON        = { minScore =    1, wingScore =  212 },
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
