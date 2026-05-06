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
    top100Score = 4008,
    CHALLENGER  = { minScore = 3848, wingScore = 3893 },
    GRANDMASTER = { minScore = 3771, wingScore = 3790 },
    MASTER      = { minScore = 3640, wingScore = 3682 },
    DIAMOND     = { minScore = 3427, wingScore = 3508 },
    EMERALD     = { minScore = 3289, wingScore = 3350 },
    PLATINUM    = { minScore = 3022, wingScore = 3120 },
    GOLD        = { minScore = 2680, wingScore = 2831 },
    SILVER      = { minScore = 1591, wingScore = 2343 },
    BRONZE      = { minScore =  396, wingScore =  955 },
    IRON        = { minScore =    1, wingScore =  224 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4008,
    CHALLENGER  = { minScore = 3785, wingScore = 3893 },
    GRANDMASTER = { minScore = 3738, wingScore = 3762 },
    MASTER      = { minScore = 3574, wingScore = 3656 },
    DIAMOND     = { minScore = 3447, wingScore = 3511 },
    EMERALD     = { minScore = 3277, wingScore = 3362 },
    PLATINUM    = { minScore = 3008, wingScore = 3119 },
    GOLD        = { minScore = 2680, wingScore = 2834 },
    SILVER      = { minScore = 1591, wingScore = 2343 },
    BRONZE      = { minScore =  396, wingScore =  955 },
    IRON        = { minScore =    1, wingScore =  224 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4008,
    CHALLENGER  = { minScore = 3890, wingScore = 3893 },
    GRANDMASTER = { minScore = 3842, wingScore = 3866 },
    MASTER      = { minScore = 3677, wingScore = 3760 },
    DIAMOND     = { minScore = 3540, wingScore = 3608 },
    EMERALD     = { minScore = 3357, wingScore = 3448 },
    PLATINUM    = { minScore = 3073, wingScore = 3188 },
    GOLD        = { minScore = 2680, wingScore = 2882 },
    SILVER      = { minScore = 1591, wingScore = 2343 },
    BRONZE      = { minScore =  396, wingScore =  955 },
    IRON        = { minScore =    1, wingScore =  224 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3931,
    CHALLENGER  = { minScore = 3806, wingScore = 3873 },
    GRANDMASTER = { minScore = 3708, wingScore = 3755 },
    MASTER      = { minScore = 3564, wingScore = 3627 },
    DIAMOND     = { minScore = 3354, wingScore = 3431 },
    EMERALD     = { minScore = 3195, wingScore = 3267 },
    PLATINUM    = { minScore = 2969, wingScore = 3050 },
    GOLD        = { minScore = 2623, wingScore = 2748 },
    SILVER      = { minScore = 1321, wingScore = 2148 },
    BRONZE      = { minScore =  338, wingScore =  764 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3931,
    CHALLENGER  = { minScore = 3722, wingScore = 3873 },
    GRANDMASTER = { minScore = 3672, wingScore = 3697 },
    MASTER      = { minScore = 3496, wingScore = 3584 },
    DIAMOND     = { minScore = 3363, wingScore = 3429 },
    EMERALD     = { minScore = 3185, wingScore = 3274 },
    PLATINUM    = { minScore = 2905, wingScore = 3020 },
    GOLD        = { minScore = 2623, wingScore = 2740 },
    SILVER      = { minScore = 1321, wingScore = 2148 },
    BRONZE      = { minScore =  338, wingScore =  764 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3931,
    CHALLENGER  = { minScore = 3858, wingScore = 3873 },
    GRANDMASTER = { minScore = 3806, wingScore = 3832 },
    MASTER      = { minScore = 3624, wingScore = 3715 },
    DIAMOND     = { minScore = 3474, wingScore = 3549 },
    EMERALD     = { minScore = 3275, wingScore = 3375 },
    PLATINUM    = { minScore = 2975, wingScore = 3095 },
    GOLD        = { minScore = 2623, wingScore = 2796 },
    SILVER      = { minScore = 1321, wingScore = 2148 },
    BRONZE      = { minScore =  338, wingScore =  764 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4008,
    CHALLENGER  = { minScore = 3830, wingScore = 3885 },
    GRANDMASTER = { minScore = 3745, wingScore = 3775 },
    MASTER      = { minScore = 3608, wingScore = 3659 },
    DIAMOND     = { minScore = 3397, wingScore = 3476 },
    EMERALD     = { minScore = 3250, wingScore = 3315 },
    PLATINUM    = { minScore = 3000, wingScore = 3091 },
    GOLD        = { minScore = 2656, wingScore = 2796 },
    SILVER      = { minScore = 1478, wingScore = 2262 },
    BRONZE      = { minScore =  372, wingScore =  875 },
    IRON        = { minScore =    1, wingScore =  201 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4008,
    CHALLENGER  = { minScore = 3759, wingScore = 3885 },
    GRANDMASTER = { minScore = 3711, wingScore = 3736 },
    MASTER      = { minScore = 3542, wingScore = 3627 },
    DIAMOND     = { minScore = 3413, wingScore = 3478 },
    EMERALD     = { minScore = 3240, wingScore = 3326 },
    PLATINUM    = { minScore = 2966, wingScore = 3079 },
    GOLD        = { minScore = 2657, wingScore = 2796 },
    SILVER      = { minScore = 1481, wingScore = 2264 },
    BRONZE      = { minScore =  372, wingScore =  877 },
    IRON        = { minScore =    1, wingScore =  202 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4008,
    CHALLENGER  = { minScore = 3876, wingScore = 3884 },
    GRANDMASTER = { minScore = 3827, wingScore = 3851 },
    MASTER      = { minScore = 3654, wingScore = 3741 },
    DIAMOND     = { minScore = 3512, wingScore = 3583 },
    EMERALD     = { minScore = 3322, wingScore = 3417 },
    PLATINUM    = { minScore = 3031, wingScore = 3148 },
    GOLD        = { minScore = 2655, wingScore = 2845 },
    SILVER      = { minScore = 1475, wingScore = 2259 },
    BRONZE      = { minScore =  371, wingScore =  873 },
    IRON        = { minScore =    1, wingScore =  201 },
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
