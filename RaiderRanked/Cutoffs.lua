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
    top100Score = 3774,
    CHALLENGER  = { minScore = 3638, wingScore = 3669 },
    GRANDMASTER = { minScore = 3543, wingScore = 3571 },
    MASTER      = { minScore = 3423, wingScore = 3465 },
    DIAMOND     = { minScore = 3222, wingScore = 3305 },
    EMERALD     = { minScore = 3080, wingScore = 3142 },
    PLATINUM    = { minScore = 2816, wingScore = 2976 },
    GOLD        = { minScore = 2568, wingScore = 2677 },
    SILVER      = { minScore = 1331, wingScore = 2117 },
    BRONZE      = { minScore =  364, wingScore =  827 },
    IRON        = { minScore =    1, wingScore =  196 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3774,
    CHALLENGER  = { minScore = 3566, wingScore = 3669 },
    GRANDMASTER = { minScore = 3521, wingScore = 3544 },
    MASTER      = { minScore = 3365, wingScore = 3443 },
    DIAMOND     = { minScore = 3248, wingScore = 3307 },
    EMERALD     = { minScore = 3093, wingScore = 3170 },
    PLATINUM    = { minScore = 2812, wingScore = 2934 },
    GOLD        = { minScore = 2568, wingScore = 2656 },
    SILVER      = { minScore = 1331, wingScore = 2117 },
    BRONZE      = { minScore =  364, wingScore =  827 },
    IRON        = { minScore =    1, wingScore =  196 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3774,
    CHALLENGER  = { minScore = 3659, wingScore = 3669 },
    GRANDMASTER = { minScore = 3613, wingScore = 3636 },
    MASTER      = { minScore = 3452, wingScore = 3533 },
    DIAMOND     = { minScore = 3319, wingScore = 3386 },
    EMERALD     = { minScore = 3142, wingScore = 3230 },
    PLATINUM    = { minScore = 2846, wingScore = 2970 },
    GOLD        = { minScore = 2568, wingScore = 2687 },
    SILVER      = { minScore = 1331, wingScore = 2117 },
    BRONZE      = { minScore =  364, wingScore =  827 },
    IRON        = { minScore =    1, wingScore =  196 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3729,
    CHALLENGER  = { minScore = 3599, wingScore = 3657 },
    GRANDMASTER = { minScore = 3504, wingScore = 3540 },
    MASTER      = { minScore = 3358, wingScore = 3418 },
    DIAMOND     = { minScore = 3140, wingScore = 3225 },
    EMERALD     = { minScore = 3023, wingScore = 3066 },
    PLATINUM    = { minScore = 2741, wingScore = 2867 },
    GOLD        = { minScore = 2423, wingScore = 2631 },
    SILVER      = { minScore = 1113, wingScore = 1910 },
    BRONZE      = { minScore =  335, wingScore =  685 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3729,
    CHALLENGER  = { minScore = 3521, wingScore = 3657 },
    GRANDMASTER = { minScore = 3470, wingScore = 3495 },
    MASTER      = { minScore = 3292, wingScore = 3381 },
    DIAMOND     = { minScore = 3177, wingScore = 3234 },
    EMERALD     = { minScore = 3023, wingScore = 3100 },
    PLATINUM    = { minScore = 2755, wingScore = 2869 },
    GOLD        = { minScore = 2423, wingScore = 2567 },
    SILVER      = { minScore = 1113, wingScore = 1910 },
    BRONZE      = { minScore =  335, wingScore =  685 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3729,
    CHALLENGER  = { minScore = 3634, wingScore = 3657 },
    GRANDMASTER = { minScore = 3584, wingScore = 3609 },
    MASTER      = { minScore = 3408, wingScore = 3496 },
    DIAMOND     = { minScore = 3276, wingScore = 3342 },
    EMERALD     = { minScore = 3099, wingScore = 3187 },
    PLATINUM    = { minScore = 2797, wingScore = 2925 },
    GOLD        = { minScore = 2423, wingScore = 2611 },
    SILVER      = { minScore = 1113, wingScore = 1910 },
    BRONZE      = { minScore =  335, wingScore =  685 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3774,
    CHALLENGER  = { minScore = 3622, wingScore = 3664 },
    GRANDMASTER = { minScore = 3527, wingScore = 3558 },
    MASTER      = { minScore = 3396, wingScore = 3445 },
    DIAMOND     = { minScore = 3188, wingScore = 3271 },
    EMERALD     = { minScore = 3056, wingScore = 3110 },
    PLATINUM    = { minScore = 2785, wingScore = 2930 },
    GOLD        = { minScore = 2507, wingScore = 2658 },
    SILVER      = { minScore = 1240, wingScore = 2030 },
    BRONZE      = { minScore =  352, wingScore =  768 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3774,
    CHALLENGER  = { minScore = 3548, wingScore = 3664 },
    GRANDMASTER = { minScore = 3500, wingScore = 3524 },
    MASTER      = { minScore = 3335, wingScore = 3418 },
    DIAMOND     = { minScore = 3219, wingScore = 3277 },
    EMERALD     = { minScore = 3065, wingScore = 3142 },
    PLATINUM    = { minScore = 2789, wingScore = 2908 },
    GOLD        = { minScore = 2509, wingScore = 2620 },
    SILVER      = { minScore = 1242, wingScore = 2033 },
    BRONZE      = { minScore =  352, wingScore =  769 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3774,
    CHALLENGER  = { minScore = 3648, wingScore = 3664 },
    GRANDMASTER = { minScore = 3600, wingScore = 3624 },
    MASTER      = { minScore = 3433, wingScore = 3517 },
    DIAMOND     = { minScore = 3300, wingScore = 3367 },
    EMERALD     = { minScore = 3123, wingScore = 3211 },
    PLATINUM    = { minScore = 2825, wingScore = 2951 },
    GOLD        = { minScore = 2505, wingScore = 2654 },
    SILVER      = { minScore = 1237, wingScore = 2027 },
    BRONZE      = { minScore =  351, wingScore =  766 },
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
