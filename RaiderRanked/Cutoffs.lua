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
    top100Score = 4020,
    CHALLENGER  = { minScore = 3879, wingScore = 3910 },
    GRANDMASTER = { minScore = 3786, wingScore = 3819 },
    MASTER      = { minScore = 3666, wingScore = 3717 },
    DIAMOND     = { minScore = 3456, wingScore = 3543 },
    EMERALD     = { minScore = 3325, wingScore = 3398 },
    PLATINUM    = { minScore = 3046, wingScore = 3161 },
    GOLD        = { minScore = 2706, wingScore = 2878 },
    SILVER      = { minScore = 1648, wingScore = 2392 },
    BRONZE      = { minScore =  410, wingScore =  987 },
    IRON        = { minScore =    1, wingScore =  229 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4020,
    CHALLENGER  = { minScore = 3808, wingScore = 3910 },
    GRANDMASTER = { minScore = 3765, wingScore = 3787 },
    MASTER      = { minScore = 3614, wingScore = 3690 },
    DIAMOND     = { minScore = 3486, wingScore = 3550 },
    EMERALD     = { minScore = 3314, wingScore = 3400 },
    PLATINUM    = { minScore = 3056, wingScore = 3160 },
    GOLD        = { minScore = 2706, wingScore = 2877 },
    SILVER      = { minScore = 1648, wingScore = 2392 },
    BRONZE      = { minScore =  410, wingScore =  987 },
    IRON        = { minScore =    1, wingScore =  229 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4020,
    CHALLENGER  = { minScore = 3904, wingScore = 3910 },
    GRANDMASTER = { minScore = 3861, wingScore = 3882 },
    MASTER      = { minScore = 3712, wingScore = 3786 },
    DIAMOND     = { minScore = 3578, wingScore = 3645 },
    EMERALD     = { minScore = 3399, wingScore = 3488 },
    PLATINUM    = { minScore = 3110, wingScore = 3230 },
    GOLD        = { minScore = 2706, wingScore = 2913 },
    SILVER      = { minScore = 1648, wingScore = 2392 },
    BRONZE      = { minScore =  410, wingScore =  987 },
    IRON        = { minScore =    1, wingScore =  229 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3956,
    CHALLENGER  = { minScore = 3836, wingScore = 3893 },
    GRANDMASTER = { minScore = 3746, wingScore = 3777 },
    MASTER      = { minScore = 3603, wingScore = 3659 },
    DIAMOND     = { minScore = 3402, wingScore = 3462 },
    EMERALD     = { minScore = 3234, wingScore = 3311 },
    PLATINUM    = { minScore = 3006, wingScore = 3079 },
    GOLD        = { minScore = 2644, wingScore = 2783 },
    SILVER      = { minScore = 1354, wingScore = 2190 },
    BRONZE      = { minScore =  340, wingScore =  796 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3956,
    CHALLENGER  = { minScore = 3762, wingScore = 3893 },
    GRANDMASTER = { minScore = 3712, wingScore = 3737 },
    MASTER      = { minScore = 3537, wingScore = 3624 },
    DIAMOND     = { minScore = 3402, wingScore = 3469 },
    EMERALD     = { minScore = 3222, wingScore = 3312 },
    PLATINUM    = { minScore = 2946, wingScore = 3057 },
    GOLD        = { minScore = 2644, wingScore = 2777 },
    SILVER      = { minScore = 1354, wingScore = 2190 },
    BRONZE      = { minScore =  340, wingScore =  796 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3956,
    CHALLENGER  = { minScore = 3890, wingScore = 3893 },
    GRANDMASTER = { minScore = 3839, wingScore = 3865 },
    MASTER      = { minScore = 3659, wingScore = 3749 },
    DIAMOND     = { minScore = 3511, wingScore = 3585 },
    EMERALD     = { minScore = 3313, wingScore = 3412 },
    PLATINUM    = { minScore = 3022, wingScore = 3138 },
    GOLD        = { minScore = 2644, wingScore = 2837 },
    SILVER      = { minScore = 1354, wingScore = 2190 },
    BRONZE      = { minScore =  340, wingScore =  796 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4020,
    CHALLENGER  = { minScore = 3861, wingScore = 3903 },
    GRANDMASTER = { minScore = 3769, wingScore = 3801 },
    MASTER      = { minScore = 3640, wingScore = 3693 },
    DIAMOND     = { minScore = 3433, wingScore = 3509 },
    EMERALD     = { minScore = 3287, wingScore = 3362 },
    PLATINUM    = { minScore = 3029, wingScore = 3127 },
    GOLD        = { minScore = 2680, wingScore = 2838 },
    SILVER      = { minScore = 1525, wingScore = 2308 },
    BRONZE      = { minScore =  381, wingScore =  907 },
    IRON        = { minScore =    1, wingScore =  204 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4020,
    CHALLENGER  = { minScore = 3789, wingScore = 3903 },
    GRANDMASTER = { minScore = 3743, wingScore = 3767 },
    MASTER      = { minScore = 3583, wingScore = 3663 },
    DIAMOND     = { minScore = 3452, wingScore = 3517 },
    EMERALD     = { minScore = 3277, wingScore = 3364 },
    PLATINUM    = { minScore = 3011, wingScore = 3118 },
    GOLD        = { minScore = 2681, wingScore = 2836 },
    SILVER      = { minScore = 1529, wingScore = 2310 },
    BRONZE      = { minScore =  382, wingScore =  909 },
    IRON        = { minScore =    1, wingScore =  205 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4020,
    CHALLENGER  = { minScore = 3898, wingScore = 3903 },
    GRANDMASTER = { minScore = 3852, wingScore = 3875 },
    MASTER      = { minScore = 3689, wingScore = 3770 },
    DIAMOND     = { minScore = 3549, wingScore = 3619 },
    EMERALD     = { minScore = 3362, wingScore = 3455 },
    PLATINUM    = { minScore = 3072, wingScore = 3190 },
    GOLD        = { minScore = 2679, wingScore = 2880 },
    SILVER      = { minScore = 1522, wingScore = 2305 },
    BRONZE      = { minScore =  380, wingScore =  905 },
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
