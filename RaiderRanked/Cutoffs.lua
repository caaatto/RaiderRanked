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
    top100Score = 4051,
    CHALLENGER  = { minScore = 3894, wingScore = 3934 },
    GRANDMASTER = { minScore = 3804, wingScore = 3843 },
    MASTER      = { minScore = 3684, wingScore = 3742 },
    DIAMOND     = { minScore = 3476, wingScore = 3557 },
    EMERALD     = { minScore = 3346, wingScore = 3412 },
    PLATINUM    = { minScore = 3063, wingScore = 3185 },
    GOLD        = { minScore = 2723, wingScore = 2908 },
    SILVER      = { minScore = 1668, wingScore = 2421 },
    BRONZE      = { minScore =  417, wingScore =  995 },
    IRON        = { minScore =    1, wingScore =  230 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4051,
    CHALLENGER  = { minScore = 3832, wingScore = 3934 },
    GRANDMASTER = { minScore = 3789, wingScore = 3811 },
    MASTER      = { minScore = 3637, wingScore = 3713 },
    DIAMOND     = { minScore = 3507, wingScore = 3572 },
    EMERALD     = { minScore = 3335, wingScore = 3421 },
    PLATINUM    = { minScore = 3080, wingScore = 3181 },
    GOLD        = { minScore = 2723, wingScore = 2900 },
    SILVER      = { minScore = 1668, wingScore = 2421 },
    BRONZE      = { minScore =  417, wingScore =  995 },
    IRON        = { minScore =    1, wingScore =  230 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4051,
    CHALLENGER  = { minScore = 3920, wingScore = 3934 },
    GRANDMASTER = { minScore = 3878, wingScore = 3899 },
    MASTER      = { minScore = 3732, wingScore = 3805 },
    DIAMOND     = { minScore = 3597, wingScore = 3665 },
    EMERALD     = { minScore = 3416, wingScore = 3507 },
    PLATINUM    = { minScore = 3122, wingScore = 3245 },
    GOLD        = { minScore = 2723, wingScore = 2927 },
    SILVER      = { minScore = 1668, wingScore = 2421 },
    BRONZE      = { minScore =  417, wingScore =  995 },
    IRON        = { minScore =    1, wingScore =  230 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3981,
    CHALLENGER  = { minScore = 3862, wingScore = 3901 },
    GRANDMASTER = { minScore = 3768, wingScore = 3791 },
    MASTER      = { minScore = 3624, wingScore = 3673 },
    DIAMOND     = { minScore = 3413, wingScore = 3481 },
    EMERALD     = { minScore = 3257, wingScore = 3330 },
    PLATINUM    = { minScore = 3015, wingScore = 3096 },
    GOLD        = { minScore = 2656, wingScore = 2806 },
    SILVER      = { minScore = 1373, wingScore = 2217 },
    BRONZE      = { minScore =  340, wingScore =  805 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3981,
    CHALLENGER  = { minScore = 3774, wingScore = 3901 },
    GRANDMASTER = { minScore = 3724, wingScore = 3749 },
    MASTER      = { minScore = 3548, wingScore = 3636 },
    DIAMOND     = { minScore = 3416, wingScore = 3482 },
    EMERALD     = { minScore = 3240, wingScore = 3328 },
    PLATINUM    = { minScore = 2970, wingScore = 3079 },
    GOLD        = { minScore = 2656, wingScore = 2799 },
    SILVER      = { minScore = 1373, wingScore = 2217 },
    BRONZE      = { minScore =  340, wingScore =  805 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3981,
    CHALLENGER  = { minScore = 3895, wingScore = 3901 },
    GRANDMASTER = { minScore = 3845, wingScore = 3870 },
    MASTER      = { minScore = 3671, wingScore = 3758 },
    DIAMOND     = { minScore = 3525, wingScore = 3598 },
    EMERALD     = { minScore = 3332, wingScore = 3428 },
    PLATINUM    = { minScore = 3049, wingScore = 3160 },
    GOLD        = { minScore = 2656, wingScore = 2861 },
    SILVER      = { minScore = 1373, wingScore = 2217 },
    BRONZE      = { minScore =  340, wingScore =  805 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4051,
    CHALLENGER  = { minScore = 3881, wingScore = 3920 },
    GRANDMASTER = { minScore = 3789, wingScore = 3821 },
    MASTER      = { minScore = 3659, wingScore = 3713 },
    DIAMOND     = { minScore = 3450, wingScore = 3525 },
    EMERALD     = { minScore = 3309, wingScore = 3378 },
    PLATINUM    = { minScore = 3043, wingScore = 3148 },
    GOLD        = { minScore = 2695, wingScore = 2865 },
    SILVER      = { minScore = 1545, wingScore = 2336 },
    BRONZE      = { minScore =  385, wingScore =  916 },
    IRON        = { minScore =    1, wingScore =  205 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4051,
    CHALLENGER  = { minScore = 3808, wingScore = 3921 },
    GRANDMASTER = { minScore = 3763, wingScore = 3786 },
    MASTER      = { minScore = 3601, wingScore = 3682 },
    DIAMOND     = { minScore = 3470, wingScore = 3536 },
    EMERALD     = { minScore = 3296, wingScore = 3383 },
    PLATINUM    = { minScore = 3035, wingScore = 3140 },
    GOLD        = { minScore = 2696, wingScore = 2859 },
    SILVER      = { minScore = 1548, wingScore = 2338 },
    BRONZE      = { minScore =  386, wingScore =  918 },
    IRON        = { minScore =    1, wingScore =  206 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4051,
    CHALLENGER  = { minScore = 3909, wingScore = 3920 },
    GRANDMASTER = { minScore = 3864, wingScore = 3887 },
    MASTER      = { minScore = 3706, wingScore = 3785 },
    DIAMOND     = { minScore = 3566, wingScore = 3636 },
    EMERALD     = { minScore = 3380, wingScore = 3473 },
    PLATINUM    = { minScore = 3091, wingScore = 3209 },
    GOLD        = { minScore = 2694, wingScore = 2899 },
    SILVER      = { minScore = 1541, wingScore = 2333 },
    BRONZE      = { minScore =  384, wingScore =  913 },
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
