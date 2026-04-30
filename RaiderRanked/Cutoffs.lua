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
    top100Score = 3928,
    CHALLENGER  = { minScore = 3779, wingScore = 3825 },
    GRANDMASTER = { minScore = 3691, wingScore = 3735 },
    MASTER      = { minScore = 3570, wingScore = 3629 },
    DIAMOND     = { minScore = 3380, wingScore = 3449 },
    EMERALD     = { minScore = 3233, wingScore = 3305 },
    PLATINUM    = { minScore = 3002, wingScore = 3078 },
    GOLD        = { minScore = 2658, wingScore = 2784 },
    SILVER      = { minScore = 1501, wingScore = 2287 },
    BRONZE      = { minScore =  367, wingScore =  898 },
    IRON        = { minScore =    1, wingScore =  199 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3928,
    CHALLENGER  = { minScore = 3727, wingScore = 3825 },
    GRANDMASTER = { minScore = 3684, wingScore = 3706 },
    MASTER      = { minScore = 3534, wingScore = 3609 },
    DIAMOND     = { minScore = 3403, wingScore = 3468 },
    EMERALD     = { minScore = 3228, wingScore = 3316 },
    PLATINUM    = { minScore = 2952, wingScore = 3065 },
    GOLD        = { minScore = 2658, wingScore = 2788 },
    SILVER      = { minScore = 1501, wingScore = 2287 },
    BRONZE      = { minScore =  367, wingScore =  898 },
    IRON        = { minScore =    1, wingScore =  199 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3928,
    CHALLENGER  = { minScore = 3810, wingScore = 3825 },
    GRANDMASTER = { minScore = 3768, wingScore = 3789 },
    MASTER      = { minScore = 3620, wingScore = 3694 },
    DIAMOND     = { minScore = 3484, wingScore = 3552 },
    EMERALD     = { minScore = 3303, wingScore = 3393 },
    PLATINUM    = { minScore = 3012, wingScore = 3132 },
    GOLD        = { minScore = 2658, wingScore = 2831 },
    SILVER      = { minScore = 1501, wingScore = 2287 },
    BRONZE      = { minScore =  367, wingScore =  898 },
    IRON        = { minScore =    1, wingScore =  199 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3890,
    CHALLENGER  = { minScore = 3756, wingScore = 3800 },
    GRANDMASTER = { minScore = 3652, wingScore = 3686 },
    MASTER      = { minScore = 3517, wingScore = 3562 },
    DIAMOND     = { minScore = 3305, wingScore = 3391 },
    EMERALD     = { minScore = 3144, wingScore = 3214 },
    PLATINUM    = { minScore = 2904, wingScore = 3023 },
    GOLD        = { minScore = 2583, wingScore = 2711 },
    SILVER      = { minScore = 1262, wingScore = 2087 },
    BRONZE      = { minScore =  336, wingScore =  727 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3890,
    CHALLENGER  = { minScore = 3659, wingScore = 3800 },
    GRANDMASTER = { minScore = 3611, wingScore = 3635 },
    MASTER      = { minScore = 3441, wingScore = 3526 },
    DIAMOND     = { minScore = 3314, wingScore = 3378 },
    EMERALD     = { minScore = 3145, wingScore = 3230 },
    PLATINUM    = { minScore = 2863, wingScore = 2981 },
    GOLD        = { minScore = 2583, wingScore = 2695 },
    SILVER      = { minScore = 1262, wingScore = 2087 },
    BRONZE      = { minScore =  336, wingScore =  727 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3890,
    CHALLENGER  = { minScore = 3789, wingScore = 3800 },
    GRANDMASTER = { minScore = 3738, wingScore = 3763 },
    MASTER      = { minScore = 3559, wingScore = 3649 },
    DIAMOND     = { minScore = 3415, wingScore = 3487 },
    EMERALD     = { minScore = 3222, wingScore = 3318 },
    PLATINUM    = { minScore = 2923, wingScore = 3044 },
    GOLD        = { minScore = 2583, wingScore = 2751 },
    SILVER      = { minScore = 1262, wingScore = 2087 },
    BRONZE      = { minScore =  336, wingScore =  727 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3928,
    CHALLENGER  = { minScore = 3769, wingScore = 3815 },
    GRANDMASTER = { minScore = 3675, wingScore = 3715 },
    MASTER      = { minScore = 3548, wingScore = 3601 },
    DIAMOND     = { minScore = 3349, wingScore = 3425 },
    EMERALD     = { minScore = 3196, wingScore = 3267 },
    PLATINUM    = { minScore = 2961, wingScore = 3055 },
    GOLD        = { minScore = 2627, wingScore = 2753 },
    SILVER      = { minScore = 1401, wingScore = 2203 },
    BRONZE      = { minScore =  354, wingScore =  827 },
    IRON        = { minScore =    1, wingScore =  187 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3928,
    CHALLENGER  = { minScore = 3699, wingScore = 3815 },
    GRANDMASTER = { minScore = 3654, wingScore = 3677 },
    MASTER      = { minScore = 3496, wingScore = 3575 },
    DIAMOND     = { minScore = 3367, wingScore = 3431 },
    EMERALD     = { minScore = 3194, wingScore = 3281 },
    PLATINUM    = { minScore = 2916, wingScore = 3031 },
    GOLD        = { minScore = 2628, wingScore = 2750 },
    SILVER      = { minScore = 1404, wingScore = 2206 },
    BRONZE      = { minScore =  354, wingScore =  829 },
    IRON        = { minScore =    1, wingScore =  187 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3928,
    CHALLENGER  = { minScore = 3801, wingScore = 3814 },
    GRANDMASTER = { minScore = 3755, wingScore = 3778 },
    MASTER      = { minScore = 3594, wingScore = 3675 },
    DIAMOND     = { minScore = 3454, wingScore = 3524 },
    EMERALD     = { minScore = 3268, wingScore = 3361 },
    PLATINUM    = { minScore = 2974, wingScore = 3094 },
    GOLD        = { minScore = 2626, wingScore = 2797 },
    SILVER      = { minScore = 1398, wingScore = 2201 },
    BRONZE      = { minScore =  354, wingScore =  824 },
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
