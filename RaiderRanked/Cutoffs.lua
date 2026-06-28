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
    top100Score = 4258,
    CHALLENGER  = { minScore = 4100, wingScore = 4140 },
    GRANDMASTER = { minScore = 4009, wingScore = 4028 },
    MASTER      = { minScore = 3869, wingScore = 3913 },
    DIAMOND     = { minScore = 3625, wingScore = 3721 },
    EMERALD     = { minScore = 3456, wingScore = 3536 },
    PLATINUM    = { minScore = 3165, wingScore = 3319 },
    GOLD        = { minScore = 2825, wingScore = 3018 },
    SILVER      = { minScore = 1800, wingScore = 2548 },
    BRONZE      = { minScore =  483, wingScore =  1068 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4258,
    CHALLENGER  = { minScore = 4015, wingScore = 4140 },
    GRANDMASTER = { minScore = 3967, wingScore = 3991 },
    MASTER      = { minScore = 3797, wingScore = 3882 },
    DIAMOND     = { minScore = 3665, wingScore = 3731 },
    EMERALD     = { minScore = 3489, wingScore = 3577 },
    PLATINUM    = { minScore = 3169, wingScore = 3308 },
    GOLD        = { minScore = 2825, wingScore = 2969 },
    SILVER      = { minScore = 1800, wingScore = 2548 },
    BRONZE      = { minScore =  483, wingScore =  1068 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4258,
    CHALLENGER  = { minScore = 4136, wingScore = 4140 },
    GRANDMASTER = { minScore = 4086, wingScore = 4111 },
    MASTER      = { minScore = 3912, wingScore = 3999 },
    DIAMOND     = { minScore = 3756, wingScore = 3834 },
    EMERALD     = { minScore = 3548, wingScore = 3652 },
    PLATINUM    = { minScore = 3214, wingScore = 3352 },
    GOLD        = { minScore = 2825, wingScore = 3017 },
    SILVER      = { minScore = 1800, wingScore = 2548 },
    BRONZE      = { minScore =  483, wingScore =  1068 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4213,
    CHALLENGER  = { minScore = 4053, wingScore = 4127 },
    GRANDMASTER = { minScore = 3951, wingScore = 4000 },
    MASTER      = { minScore = 3807, wingScore = 3875 },
    DIAMOND     = { minScore = 3541, wingScore = 3650 },
    EMERALD     = { minScore = 3409, wingScore = 3447 },
    PLATINUM    = { minScore = 3085, wingScore = 3218 },
    GOLD        = { minScore = 2727, wingScore = 2951 },
    SILVER      = { minScore = 1494, wingScore = 2336 },
    BRONZE      = { minScore =  361, wingScore =  867 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4213,
    CHALLENGER  = { minScore = 3956, wingScore = 4127 },
    GRANDMASTER = { minScore = 3904, wingScore = 3930 },
    MASTER      = { minScore = 3722, wingScore = 3813 },
    DIAMOND     = { minScore = 3579, wingScore = 3650 },
    EMERALD     = { minScore = 3389, wingScore = 3484 },
    PLATINUM    = { minScore = 3105, wingScore = 3219 },
    GOLD        = { minScore = 2727, wingScore = 2908 },
    SILVER      = { minScore = 1494, wingScore = 2336 },
    BRONZE      = { minScore =  361, wingScore =  867 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4213,
    CHALLENGER  = { minScore = 4113, wingScore = 4127 },
    GRANDMASTER = { minScore = 4060, wingScore = 4086 },
    MASTER      = { minScore = 3875, wingScore = 3967 },
    DIAMOND     = { minScore = 3718, wingScore = 3796 },
    EMERALD     = { minScore = 3508, wingScore = 3613 },
    PLATINUM    = { minScore = 3162, wingScore = 3306 },
    GOLD        = { minScore = 2727, wingScore = 2946 },
    SILVER      = { minScore = 1494, wingScore = 2336 },
    BRONZE      = { minScore =  361, wingScore =  867 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4258,
    CHALLENGER  = { minScore = 4080, wingScore = 4135 },
    GRANDMASTER = { minScore = 3985, wingScore = 4016 },
    MASTER      = { minScore = 3843, wingScore = 3897 },
    DIAMOND     = { minScore = 3590, wingScore = 3691 },
    EMERALD     = { minScore = 3436, wingScore = 3499 },
    PLATINUM    = { minScore = 3131, wingScore = 3277 },
    GOLD        = { minScore = 2784, wingScore = 2990 },
    SILVER      = { minScore = 1672, wingScore = 2459 },
    BRONZE      = { minScore =  432, wingScore =  984 },
    IRON        = { minScore =    1, wingScore =  220 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4258,
    CHALLENGER  = { minScore = 3991, wingScore = 4135 },
    GRANDMASTER = { minScore = 3941, wingScore = 3966 },
    MASTER      = { minScore = 3766, wingScore = 3854 },
    DIAMOND     = { minScore = 3630, wingScore = 3698 },
    EMERALD     = { minScore = 3448, wingScore = 3539 },
    PLATINUM    = { minScore = 3143, wingScore = 3272 },
    GOLD        = { minScore = 2785, wingScore = 2944 },
    SILVER      = { minScore = 1675, wingScore = 2461 },
    BRONZE      = { minScore =  433, wingScore =  986 },
    IRON        = { minScore =    1, wingScore =  221 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4258,
    CHALLENGER  = { minScore = 4126, wingScore = 4134 },
    GRANDMASTER = { minScore = 4075, wingScore = 4100 },
    MASTER      = { minScore = 3896, wingScore = 3985 },
    DIAMOND     = { minScore = 3740, wingScore = 3818 },
    EMERALD     = { minScore = 3531, wingScore = 3635 },
    PLATINUM    = { minScore = 3192, wingScore = 3332 },
    GOLD        = { minScore = 2783, wingScore = 2986 },
    SILVER      = { minScore = 1668, wingScore = 2457 },
    BRONZE      = { minScore =  430, wingScore =  981 },
    IRON        = { minScore =    1, wingScore =  219 },
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
