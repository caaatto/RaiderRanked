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
    top100Score = 3812,
    CHALLENGER  = { minScore = 3670, wingScore = 3725 },
    GRANDMASTER = { minScore = 3587, wingScore = 3628 },
    MASTER      = { minScore = 3467, wingScore = 3524 },
    DIAMOND     = { minScore = 3279, wingScore = 3349 },
    EMERALD     = { minScore = 3131, wingScore = 3199 },
    PLATINUM    = { minScore = 2881, wingScore = 3014 },
    GOLD        = { minScore = 2611, wingScore = 2708 },
    SILVER      = { minScore = 1399, wingScore = 2183 },
    BRONZE      = { minScore =  368, wingScore =  857 },
    IRON        = { minScore =    1, wingScore =  196 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3812,
    CHALLENGER  = { minScore = 3629, wingScore = 3725 },
    GRANDMASTER = { minScore = 3583, wingScore = 3606 },
    MASTER      = { minScore = 3425, wingScore = 3504 },
    DIAMOND     = { minScore = 3302, wingScore = 3363 },
    EMERALD     = { minScore = 3138, wingScore = 3220 },
    PLATINUM    = { minScore = 2860, wingScore = 2977 },
    GOLD        = { minScore = 2611, wingScore = 2708 },
    SILVER      = { minScore = 1399, wingScore = 2183 },
    BRONZE      = { minScore =  368, wingScore =  857 },
    IRON        = { minScore =    1, wingScore =  196 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3812,
    CHALLENGER  = { minScore = 3710, wingScore = 3725 },
    GRANDMASTER = { minScore = 3667, wingScore = 3688 },
    MASTER      = { minScore = 3515, wingScore = 3591 },
    DIAMOND     = { minScore = 3380, wingScore = 3448 },
    EMERALD     = { minScore = 3200, wingScore = 3290 },
    PLATINUM    = { minScore = 2905, wingScore = 3028 },
    GOLD        = { minScore = 2611, wingScore = 2742 },
    SILVER      = { minScore = 1399, wingScore = 2183 },
    BRONZE      = { minScore =  368, wingScore =  857 },
    IRON        = { minScore =    1, wingScore =  196 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3763,
    CHALLENGER  = { minScore = 3647, wingScore = 3688 },
    GRANDMASTER = { minScore = 3542, wingScore = 3577 },
    MASTER      = { minScore = 3411, wingScore = 3453 },
    DIAMOND     = { minScore = 3193, wingScore = 3276 },
    EMERALD     = { minScore = 3054, wingScore = 3108 },
    PLATINUM    = { minScore = 2786, wingScore = 2937 },
    GOLD        = { minScore = 2484, wingScore = 2653 },
    SILVER      = { minScore = 1171, wingScore = 1990 },
    BRONZE      = { minScore =  336, wingScore =  701 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3763,
    CHALLENGER  = { minScore = 3559, wingScore = 3688 },
    GRANDMASTER = { minScore = 3510, wingScore = 3535 },
    MASTER      = { minScore = 3339, wingScore = 3424 },
    DIAMOND     = { minScore = 3228, wingScore = 3283 },
    EMERALD     = { minScore = 3080, wingScore = 3154 },
    PLATINUM    = { minScore = 2794, wingScore = 2921 },
    GOLD        = { minScore = 2484, wingScore = 2608 },
    SILVER      = { minScore = 1171, wingScore = 1990 },
    BRONZE      = { minScore =  336, wingScore =  701 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3763,
    CHALLENGER  = { minScore = 3676, wingScore = 3688 },
    GRANDMASTER = { minScore = 3626, wingScore = 3651 },
    MASTER      = { minScore = 3450, wingScore = 3538 },
    DIAMOND     = { minScore = 3314, wingScore = 3382 },
    EMERALD     = { minScore = 3132, wingScore = 3223 },
    PLATINUM    = { minScore = 2833, wingScore = 2958 },
    GOLD        = { minScore = 2484, wingScore = 2659 },
    SILVER      = { minScore = 1171, wingScore = 1990 },
    BRONZE      = { minScore =  336, wingScore =  701 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3812,
    CHALLENGER  = { minScore = 3660, wingScore = 3710 },
    GRANDMASTER = { minScore = 3568, wingScore = 3607 },
    MASTER      = { minScore = 3444, wingScore = 3494 },
    DIAMOND     = { minScore = 3243, wingScore = 3318 },
    EMERALD     = { minScore = 3099, wingScore = 3161 },
    PLATINUM    = { minScore = 2841, wingScore = 2982 },
    GOLD        = { minScore = 2558, wingScore = 2685 },
    SILVER      = { minScore = 1304, wingScore = 2102 },
    BRONZE      = { minScore =  355, wingScore =  792 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3812,
    CHALLENGER  = { minScore = 3601, wingScore = 3710 },
    GRANDMASTER = { minScore = 3553, wingScore = 3577 },
    MASTER      = { minScore = 3390, wingScore = 3471 },
    DIAMOND     = { minScore = 3272, wingScore = 3330 },
    EMERALD     = { minScore = 3114, wingScore = 3193 },
    PLATINUM    = { minScore = 2833, wingScore = 2954 },
    GOLD        = { minScore = 2559, wingScore = 2667 },
    SILVER      = { minScore = 1306, wingScore = 2105 },
    BRONZE      = { minScore =  355, wingScore =  794 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3812,
    CHALLENGER  = { minScore = 3695, wingScore = 3709 },
    GRANDMASTER = { minScore = 3649, wingScore = 3672 },
    MASTER      = { minScore = 3487, wingScore = 3568 },
    DIAMOND     = { minScore = 3352, wingScore = 3420 },
    EMERALD     = { minScore = 3171, wingScore = 3261 },
    PLATINUM    = { minScore = 2874, wingScore = 2998 },
    GOLD        = { minScore = 2556, wingScore = 2706 },
    SILVER      = { minScore = 1301, wingScore = 2100 },
    BRONZE      = { minScore =  354, wingScore =  790 },
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
