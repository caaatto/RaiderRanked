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
    top100Score = 3782,
    CHALLENGER  = { minScore = 3653, wingScore = 3684 },
    GRANDMASTER = { minScore = 3553, wingScore = 3589 },
    MASTER      = { minScore = 3434, wingScore = 3482 },
    DIAMOND     = { minScore = 3238, wingScore = 3317 },
    EMERALD     = { minScore = 3095, wingScore = 3161 },
    PLATINUM    = { minScore = 2837, wingScore = 2999 },
    GOLD        = { minScore = 2584, wingScore = 2687 },
    SILVER      = { minScore = 1349, wingScore = 2140 },
    BRONZE      = { minScore =  366, wingScore =  838 },
    IRON        = { minScore =    1, wingScore =  196 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3782,
    CHALLENGER  = { minScore = 3588, wingScore = 3684 },
    GRANDMASTER = { minScore = 3544, wingScore = 3566 },
    MASTER      = { minScore = 3388, wingScore = 3466 },
    DIAMOND     = { minScore = 3268, wingScore = 3328 },
    EMERALD     = { minScore = 3109, wingScore = 3189 },
    PLATINUM    = { minScore = 2831, wingScore = 2950 },
    GOLD        = { minScore = 2584, wingScore = 2677 },
    SILVER      = { minScore = 1349, wingScore = 2140 },
    BRONZE      = { minScore =  366, wingScore =  838 },
    IRON        = { minScore =    1, wingScore =  196 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3782,
    CHALLENGER  = { minScore = 3671, wingScore = 3684 },
    GRANDMASTER = { minScore = 3627, wingScore = 3649 },
    MASTER      = { minScore = 3473, wingScore = 3550 },
    DIAMOND     = { minScore = 3340, wingScore = 3406 },
    EMERALD     = { minScore = 3163, wingScore = 3252 },
    PLATINUM    = { minScore = 2869, wingScore = 2992 },
    GOLD        = { minScore = 2584, wingScore = 2709 },
    SILVER      = { minScore = 1349, wingScore = 2140 },
    BRONZE      = { minScore =  366, wingScore =  838 },
    IRON        = { minScore =    1, wingScore =  196 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3742,
    CHALLENGER  = { minScore = 3614, wingScore = 3667 },
    GRANDMASTER = { minScore = 3520, wingScore = 3550 },
    MASTER      = { minScore = 3374, wingScore = 3428 },
    DIAMOND     = { minScore = 3157, wingScore = 3240 },
    EMERALD     = { minScore = 3032, wingScore = 3079 },
    PLATINUM    = { minScore = 2755, wingScore = 2889 },
    GOLD        = { minScore = 2443, wingScore = 2638 },
    SILVER      = { minScore = 1131, wingScore = 1938 },
    BRONZE      = { minScore =  335, wingScore =  689 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3742,
    CHALLENGER  = { minScore = 3536, wingScore = 3667 },
    GRANDMASTER = { minScore = 3486, wingScore = 3511 },
    MASTER      = { minScore = 3310, wingScore = 3398 },
    DIAMOND     = { minScore = 3199, wingScore = 3254 },
    EMERALD     = { minScore = 3050, wingScore = 3124 },
    PLATINUM    = { minScore = 2771, wingScore = 2894 },
    GOLD        = { minScore = 2443, wingScore = 2582 },
    SILVER      = { minScore = 1131, wingScore = 1938 },
    BRONZE      = { minScore =  335, wingScore =  689 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3742,
    CHALLENGER  = { minScore = 3655, wingScore = 3667 },
    GRANDMASTER = { minScore = 3604, wingScore = 3630 },
    MASTER      = { minScore = 3425, wingScore = 3514 },
    DIAMOND     = { minScore = 3290, wingScore = 3357 },
    EMERALD     = { minScore = 3110, wingScore = 3200 },
    PLATINUM    = { minScore = 2809, wingScore = 2936 },
    GOLD        = { minScore = 2443, wingScore = 2627 },
    SILVER      = { minScore = 1131, wingScore = 1938 },
    BRONZE      = { minScore =  335, wingScore =  689 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3782,
    CHALLENGER  = { minScore = 3637, wingScore = 3677 },
    GRANDMASTER = { minScore = 3539, wingScore = 3573 },
    MASTER      = { minScore = 3409, wingScore = 3459 },
    DIAMOND     = { minScore = 3204, wingScore = 3285 },
    EMERALD     = { minScore = 3069, wingScore = 3127 },
    PLATINUM    = { minScore = 2803, wingScore = 2953 },
    GOLD        = { minScore = 2525, wingScore = 2666 },
    SILVER      = { minScore = 1258, wingScore = 2055 },
    BRONZE      = { minScore =  353, wingScore =  776 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3782,
    CHALLENGER  = { minScore = 3567, wingScore = 3677 },
    GRANDMASTER = { minScore = 3520, wingScore = 3544 },
    MASTER      = { minScore = 3356, wingScore = 3438 },
    DIAMOND     = { minScore = 3240, wingScore = 3298 },
    EMERALD     = { minScore = 3085, wingScore = 3163 },
    PLATINUM    = { minScore = 2807, wingScore = 2927 },
    GOLD        = { minScore = 2527, wingScore = 2638 },
    SILVER      = { minScore = 1260, wingScore = 2058 },
    BRONZE      = { minScore =  353, wingScore =  778 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3782,
    CHALLENGER  = { minScore = 3664, wingScore = 3677 },
    GRANDMASTER = { minScore = 3617, wingScore = 3641 },
    MASTER      = { minScore = 3452, wingScore = 3534 },
    DIAMOND     = { minScore = 3318, wingScore = 3385 },
    EMERALD     = { minScore = 3140, wingScore = 3230 },
    PLATINUM    = { minScore = 2843, wingScore = 2968 },
    GOLD        = { minScore = 2523, wingScore = 2674 },
    SILVER      = { minScore = 1255, wingScore = 2053 },
    BRONZE      = { minScore =  353, wingScore =  774 },
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
