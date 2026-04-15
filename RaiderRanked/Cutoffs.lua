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
    CHALLENGER  = { minScore = 3635, wingScore = 3668 },
    GRANDMASTER = { minScore = 3541, wingScore = 3567 },
    MASTER      = { minScore = 3421, wingScore = 3462 },
    DIAMOND     = { minScore = 3218, wingScore = 3303 },
    EMERALD     = { minScore = 3075, wingScore = 3136 },
    PLATINUM    = { minScore = 2809, wingScore = 2969 },
    GOLD        = { minScore = 2562, wingScore = 2673 },
    SILVER      = { minScore = 1325, wingScore = 2108 },
    BRONZE      = { minScore =  363, wingScore =  821 },
    IRON        = { minScore =    1, wingScore =  196 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3774,
    CHALLENGER  = { minScore = 3566, wingScore = 3668 },
    GRANDMASTER = { minScore = 3521, wingScore = 3544 },
    MASTER      = { minScore = 3365, wingScore = 3443 },
    DIAMOND     = { minScore = 3248, wingScore = 3307 },
    EMERALD     = { minScore = 3093, wingScore = 3170 },
    PLATINUM    = { minScore = 2812, wingScore = 2934 },
    GOLD        = { minScore = 2562, wingScore = 2656 },
    SILVER      = { minScore = 1325, wingScore = 2108 },
    BRONZE      = { minScore =  363, wingScore =  821 },
    IRON        = { minScore =    1, wingScore =  196 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3774,
    CHALLENGER  = { minScore = 3659, wingScore = 3668 },
    GRANDMASTER = { minScore = 3613, wingScore = 3636 },
    MASTER      = { minScore = 3452, wingScore = 3533 },
    DIAMOND     = { minScore = 3319, wingScore = 3386 },
    EMERALD     = { minScore = 3142, wingScore = 3230 },
    PLATINUM    = { minScore = 2846, wingScore = 2970 },
    GOLD        = { minScore = 2562, wingScore = 2687 },
    SILVER      = { minScore = 1325, wingScore = 2108 },
    BRONZE      = { minScore =  363, wingScore =  821 },
    IRON        = { minScore =    1, wingScore =  196 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3725,
    CHALLENGER  = { minScore = 3593, wingScore = 3650 },
    GRANDMASTER = { minScore = 3498, wingScore = 3535 },
    MASTER      = { minScore = 3354, wingScore = 3414 },
    DIAMOND     = { minScore = 3134, wingScore = 3220 },
    EMERALD     = { minScore = 3020, wingScore = 3061 },
    PLATINUM    = { minScore = 2737, wingScore = 2861 },
    GOLD        = { minScore = 2418, wingScore = 2628 },
    SILVER      = { minScore = 1107, wingScore = 1903 },
    BRONZE      = { minScore =  335, wingScore =  683 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3725,
    CHALLENGER  = { minScore = 3521, wingScore = 3650 },
    GRANDMASTER = { minScore = 3470, wingScore = 3495 },
    MASTER      = { minScore = 3292, wingScore = 3381 },
    DIAMOND     = { minScore = 3177, wingScore = 3234 },
    EMERALD     = { minScore = 3023, wingScore = 3100 },
    PLATINUM    = { minScore = 2755, wingScore = 2869 },
    GOLD        = { minScore = 2418, wingScore = 2567 },
    SILVER      = { minScore = 1107, wingScore = 1903 },
    BRONZE      = { minScore =  335, wingScore =  683 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3725,
    CHALLENGER  = { minScore = 3634, wingScore = 3650 },
    GRANDMASTER = { minScore = 3584, wingScore = 3609 },
    MASTER      = { minScore = 3408, wingScore = 3496 },
    DIAMOND     = { minScore = 3276, wingScore = 3342 },
    EMERALD     = { minScore = 3099, wingScore = 3187 },
    PLATINUM    = { minScore = 2797, wingScore = 2925 },
    GOLD        = { minScore = 2418, wingScore = 2611 },
    SILVER      = { minScore = 1107, wingScore = 1903 },
    BRONZE      = { minScore =  335, wingScore =  683 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3774,
    CHALLENGER  = { minScore = 3617, wingScore = 3660 },
    GRANDMASTER = { minScore = 3523, wingScore = 3554 },
    MASTER      = { minScore = 3393, wingScore = 3442 },
    DIAMOND     = { minScore = 3183, wingScore = 3268 },
    EMERALD     = { minScore = 3052, wingScore = 3105 },
    PLATINUM    = { minScore = 2779, wingScore = 2924 },
    GOLD        = { minScore = 2502, wingScore = 2654 },
    SILVER      = { minScore = 1234, wingScore = 2022 },
    BRONZE      = { minScore =  351, wingScore =  763 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3774,
    CHALLENGER  = { minScore = 3548, wingScore = 3661 },
    GRANDMASTER = { minScore = 3500, wingScore = 3524 },
    MASTER      = { minScore = 3335, wingScore = 3418 },
    DIAMOND     = { minScore = 3219, wingScore = 3277 },
    EMERALD     = { minScore = 3065, wingScore = 3142 },
    PLATINUM    = { minScore = 2789, wingScore = 2908 },
    GOLD        = { minScore = 2503, wingScore = 2620 },
    SILVER      = { minScore = 1236, wingScore = 2025 },
    BRONZE      = { minScore =  352, wingScore =  765 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3774,
    CHALLENGER  = { minScore = 3648, wingScore = 3660 },
    GRANDMASTER = { minScore = 3600, wingScore = 3624 },
    MASTER      = { minScore = 3433, wingScore = 3517 },
    DIAMOND     = { minScore = 3300, wingScore = 3367 },
    EMERALD     = { minScore = 3123, wingScore = 3211 },
    PLATINUM    = { minScore = 2825, wingScore = 2951 },
    GOLD        = { minScore = 2500, wingScore = 2654 },
    SILVER      = { minScore = 1231, wingScore = 2019 },
    BRONZE      = { minScore =  351, wingScore =  761 },
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

--- Returns the cutoff table for the given region/faction, falling back
--- to eu/all if the selection is unknown (e.g. invalid SavedVariables).
function RR:GetCutoffSet(region, faction)
    local byRegion = self.CUTOFFS[region] or self.CUTOFFS.eu
    return byRegion[faction] or byRegion.all or self.CUTOFFS.eu.all
end
