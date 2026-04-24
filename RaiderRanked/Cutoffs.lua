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
    top100Score = 3862,
    CHALLENGER  = { minScore = 3718, wingScore = 3770 },
    GRANDMASTER = { minScore = 3640, wingScore = 3662 },
    MASTER      = { minScore = 3522, wingScore = 3556 },
    DIAMOND     = { minScore = 3322, wingScore = 3403 },
    EMERALD     = { minScore = 3182, wingScore = 3244 },
    PLATINUM    = { minScore = 2946, wingScore = 3040 },
    GOLD        = { minScore = 2640, wingScore = 2744 },
    SILVER      = { minScore = 1465, wingScore = 2247 },
    BRONZE      = { minScore =  367, wingScore =  883 },
    IRON        = { minScore =    1, wingScore =  198 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3862,
    CHALLENGER  = { minScore = 3660, wingScore = 3770 },
    GRANDMASTER = { minScore = 3616, wingScore = 3638 },
    MASTER      = { minScore = 3463, wingScore = 3540 },
    DIAMOND     = { minScore = 3340, wingScore = 3401 },
    EMERALD     = { minScore = 3175, wingScore = 3257 },
    PLATINUM    = { minScore = 2901, wingScore = 3016 },
    GOLD        = { minScore = 2640, wingScore = 2748 },
    SILVER      = { minScore = 1465, wingScore = 2247 },
    BRONZE      = { minScore =  367, wingScore =  883 },
    IRON        = { minScore =    1, wingScore =  198 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3862,
    CHALLENGER  = { minScore = 3758, wingScore = 3770 },
    GRANDMASTER = { minScore = 3712, wingScore = 3735 },
    MASTER      = { minScore = 3551, wingScore = 3632 },
    DIAMOND     = { minScore = 3420, wingScore = 3486 },
    EMERALD     = { minScore = 3244, wingScore = 3332 },
    PLATINUM    = { minScore = 2954, wingScore = 3076 },
    GOLD        = { minScore = 2640, wingScore = 2785 },
    SILVER      = { minScore = 1465, wingScore = 2247 },
    BRONZE      = { minScore =  367, wingScore =  883 },
    IRON        = { minScore =    1, wingScore =  198 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3806,
    CHALLENGER  = { minScore = 3682, wingScore = 3737 },
    GRANDMASTER = { minScore = 3580, wingScore = 3625 },
    MASTER      = { minScore = 3448, wingScore = 3506 },
    DIAMOND     = { minScore = 3238, wingScore = 3323 },
    EMERALD     = { minScore = 3092, wingScore = 3155 },
    PLATINUM    = { minScore = 2837, wingScore = 3000 },
    GOLD        = { minScore = 2540, wingScore = 2677 },
    SILVER      = { minScore = 1225, wingScore = 2044 },
    BRONZE      = { minScore =  336, wingScore =  718 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3806,
    CHALLENGER  = { minScore = 3600, wingScore = 3737 },
    GRANDMASTER = { minScore = 3554, wingScore = 3577 },
    MASTER      = { minScore = 3393, wingScore = 3474 },
    DIAMOND     = { minScore = 3271, wingScore = 3332 },
    EMERALD     = { minScore = 3108, wingScore = 3189 },
    PLATINUM    = { minScore = 2822, wingScore = 2944 },
    GOLD        = { minScore = 2540, wingScore = 2650 },
    SILVER      = { minScore = 1225, wingScore = 2044 },
    BRONZE      = { minScore =  336, wingScore =  718 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3806,
    CHALLENGER  = { minScore = 3725, wingScore = 3737 },
    GRANDMASTER = { minScore = 3675, wingScore = 3700 },
    MASTER      = { minScore = 3501, wingScore = 3588 },
    DIAMOND     = { minScore = 3359, wingScore = 3430 },
    EMERALD     = { minScore = 3171, wingScore = 3265 },
    PLATINUM    = { minScore = 2870, wingScore = 2994 },
    GOLD        = { minScore = 2540, wingScore = 2701 },
    SILVER      = { minScore = 1225, wingScore = 2044 },
    BRONZE      = { minScore =  336, wingScore =  718 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3862,
    CHALLENGER  = { minScore = 3703, wingScore = 3756 },
    GRANDMASTER = { minScore = 3615, wingScore = 3647 },
    MASTER      = { minScore = 3491, wingScore = 3535 },
    DIAMOND     = { minScore = 3287, wingScore = 3370 },
    EMERALD     = { minScore = 3144, wingScore = 3207 },
    PLATINUM    = { minScore = 2900, wingScore = 3023 },
    GOLD        = { minScore = 2598, wingScore = 2716 },
    SILVER      = { minScore = 1365, wingScore = 2162 },
    BRONZE      = { minScore =  354, wingScore =  814 },
    IRON        = { minScore =    1, wingScore =  186 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3862,
    CHALLENGER  = { minScore = 3636, wingScore = 3757 },
    GRANDMASTER = { minScore = 3591, wingScore = 3613 },
    MASTER      = { minScore = 3435, wingScore = 3513 },
    DIAMOND     = { minScore = 3312, wingScore = 3373 },
    EMERALD     = { minScore = 3148, wingScore = 3229 },
    PLATINUM    = { minScore = 2869, wingScore = 2987 },
    GOLD        = { minScore = 2599, wingScore = 2708 },
    SILVER      = { minScore = 1368, wingScore = 2165 },
    BRONZE      = { minScore =  354, wingScore =  816 },
    IRON        = { minScore =    1, wingScore =  187 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3862,
    CHALLENGER  = { minScore = 3744, wingScore = 3756 },
    GRANDMASTER = { minScore = 3696, wingScore = 3720 },
    MASTER      = { minScore = 3529, wingScore = 3613 },
    DIAMOND     = { minScore = 3394, wingScore = 3462 },
    EMERALD     = { minScore = 3213, wingScore = 3303 },
    PLATINUM    = { minScore = 2918, wingScore = 3041 },
    GOLD        = { minScore = 2597, wingScore = 2749 },
    SILVER      = { minScore = 1362, wingScore = 2159 },
    BRONZE      = { minScore =  354, wingScore =  812 },
    IRON        = { minScore =    1, wingScore =  186 },
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
