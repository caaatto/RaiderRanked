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
    top100Score = 3890,
    CHALLENGER  = { minScore = 3753, wingScore = 3787 },
    GRANDMASTER = { minScore = 3659, wingScore = 3688 },
    MASTER      = { minScore = 3543, wingScore = 3583 },
    DIAMOND     = { minScore = 3345, wingScore = 3424 },
    EMERALD     = { minScore = 3205, wingScore = 3271 },
    PLATINUM    = { minScore = 2976, wingScore = 3058 },
    GOLD        = { minScore = 2648, wingScore = 2762 },
    SILVER      = { minScore = 1482, wingScore = 2265 },
    BRONZE      = { minScore =  369, wingScore =  891 },
    IRON        = { minScore =    1, wingScore =  198 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3890,
    CHALLENGER  = { minScore = 3679, wingScore = 3787 },
    GRANDMASTER = { minScore = 3637, wingScore = 3658 },
    MASTER      = { minScore = 3490, wingScore = 3563 },
    DIAMOND     = { minScore = 3364, wingScore = 3427 },
    EMERALD     = { minScore = 3195, wingScore = 3280 },
    PLATINUM    = { minScore = 2922, wingScore = 3036 },
    GOLD        = { minScore = 2648, wingScore = 2765 },
    SILVER      = { minScore = 1482, wingScore = 2265 },
    BRONZE      = { minScore =  369, wingScore =  891 },
    IRON        = { minScore =    1, wingScore =  198 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3890,
    CHALLENGER  = { minScore = 3776, wingScore = 3787 },
    GRANDMASTER = { minScore = 3731, wingScore = 3753 },
    MASTER      = { minScore = 3572, wingScore = 3652 },
    DIAMOND     = { minScore = 3442, wingScore = 3507 },
    EMERALD     = { minScore = 3269, wingScore = 3355 },
    PLATINUM    = { minScore = 2979, wingScore = 3101 },
    GOLD        = { minScore = 2648, wingScore = 2804 },
    SILVER      = { minScore = 1482, wingScore = 2265 },
    BRONZE      = { minScore =  369, wingScore =  891 },
    IRON        = { minScore =    1, wingScore =  198 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3840,
    CHALLENGER  = { minScore = 3705, wingScore = 3762 },
    GRANDMASTER = { minScore = 3609, wingScore = 3651 },
    MASTER      = { minScore = 3473, wingScore = 3533 },
    DIAMOND     = { minScore = 3267, wingScore = 3349 },
    EMERALD     = { minScore = 3114, wingScore = 3182 },
    PLATINUM    = { minScore = 2864, wingScore = 3009 },
    GOLD        = { minScore = 2557, wingScore = 2690 },
    SILVER      = { minScore = 1239, wingScore = 2060 },
    BRONZE      = { minScore =  336, wingScore =  722 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3840,
    CHALLENGER  = { minScore = 3625, wingScore = 3762 },
    GRANDMASTER = { minScore = 3579, wingScore = 3602 },
    MASTER      = { minScore = 3416, wingScore = 3497 },
    DIAMOND     = { minScore = 3290, wingScore = 3353 },
    EMERALD     = { minScore = 3122, wingScore = 3206 },
    PLATINUM    = { minScore = 2837, wingScore = 2958 },
    GOLD        = { minScore = 2557, wingScore = 2666 },
    SILVER      = { minScore = 1239, wingScore = 2060 },
    BRONZE      = { minScore =  336, wingScore =  722 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3840,
    CHALLENGER  = { minScore = 3747, wingScore = 3762 },
    GRANDMASTER = { minScore = 3698, wingScore = 3723 },
    MASTER      = { minScore = 3527, wingScore = 3612 },
    DIAMOND     = { minScore = 3383, wingScore = 3455 },
    EMERALD     = { minScore = 3191, wingScore = 3287 },
    PLATINUM    = { minScore = 2890, wingScore = 3013 },
    GOLD        = { minScore = 2557, wingScore = 2720 },
    SILVER      = { minScore = 1239, wingScore = 2060 },
    BRONZE      = { minScore =  336, wingScore =  722 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3890,
    CHALLENGER  = { minScore = 3733, wingScore = 3777 },
    GRANDMASTER = { minScore = 3638, wingScore = 3673 },
    MASTER      = { minScore = 3514, wingScore = 3562 },
    DIAMOND     = { minScore = 3312, wingScore = 3393 },
    EMERALD     = { minScore = 3167, wingScore = 3234 },
    PLATINUM    = { minScore = 2929, wingScore = 3038 },
    GOLD        = { minScore = 2610, wingScore = 2732 },
    SILVER      = { minScore = 1380, wingScore = 2179 },
    BRONZE      = { minScore =  355, wingScore =  820 },
    IRON        = { minScore =    1, wingScore =  186 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3890,
    CHALLENGER  = { minScore = 3657, wingScore = 3777 },
    GRANDMASTER = { minScore = 3613, wingScore = 3635 },
    MASTER      = { minScore = 3460, wingScore = 3536 },
    DIAMOND     = { minScore = 3334, wingScore = 3397 },
    EMERALD     = { minScore = 3165, wingScore = 3250 },
    PLATINUM    = { minScore = 2887, wingScore = 3004 },
    GOLD        = { minScore = 2611, wingScore = 2725 },
    SILVER      = { minScore = 1383, wingScore = 2182 },
    BRONZE      = { minScore =  356, wingScore =  822 },
    IRON        = { minScore =    1, wingScore =  187 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3890,
    CHALLENGER  = { minScore = 3763, wingScore = 3776 },
    GRANDMASTER = { minScore = 3717, wingScore = 3740 },
    MASTER      = { minScore = 3553, wingScore = 3635 },
    DIAMOND     = { minScore = 3417, wingScore = 3485 },
    EMERALD     = { minScore = 3235, wingScore = 3326 },
    PLATINUM    = { minScore = 2941, wingScore = 3063 },
    GOLD        = { minScore = 2609, wingScore = 2768 },
    SILVER      = { minScore = 1377, wingScore = 2177 },
    BRONZE      = { minScore =  355, wingScore =  818 },
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
