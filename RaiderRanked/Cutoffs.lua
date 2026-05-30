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
    top100Score = 4170,
    CHALLENGER  = { minScore = 4012, wingScore = 4048 },
    GRANDMASTER = { minScore = 3912, wingScore = 3951 },
    MASTER      = { minScore = 3789, wingScore = 3840 },
    DIAMOND     = { minScore = 3560, wingScore = 3657 },
    EMERALD     = { minScore = 3420, wingScore = 3473 },
    PLATINUM    = { minScore = 3119, wingScore = 3259 },
    GOLD        = { minScore = 2778, wingScore = 2995 },
    SILVER      = { minScore = 1737, wingScore = 2495 },
    BRONZE      = { minScore =  463, wingScore =  1030 },
    IRON        = { minScore =    1, wingScore =  241 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4170,
    CHALLENGER  = { minScore = 3938, wingScore = 4048 },
    GRANDMASTER = { minScore = 3893, wingScore = 3916 },
    MASTER      = { minScore = 3732, wingScore = 3812 },
    DIAMOND     = { minScore = 3599, wingScore = 3665 },
    EMERALD     = { minScore = 3420, wingScore = 3509 },
    PLATINUM    = { minScore = 3129, wingScore = 3250 },
    GOLD        = { minScore = 2778, wingScore = 2938 },
    SILVER      = { minScore = 1737, wingScore = 2495 },
    BRONZE      = { minScore =  463, wingScore =  1030 },
    IRON        = { minScore =    1, wingScore =  241 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4170,
    CHALLENGER  = { minScore = 4039, wingScore = 4048 },
    GRANDMASTER = { minScore = 3993, wingScore = 4016 },
    MASTER      = { minScore = 3835, wingScore = 3914 },
    DIAMOND     = { minScore = 3694, wingScore = 3765 },
    EMERALD     = { minScore = 3505, wingScore = 3599 },
    PLATINUM    = { minScore = 3178, wingScore = 3317 },
    GOLD        = { minScore = 2778, wingScore = 2976 },
    SILVER      = { minScore = 1737, wingScore = 2495 },
    BRONZE      = { minScore =  463, wingScore =  1030 },
    IRON        = { minScore =    1, wingScore =  241 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4116,
    CHALLENGER  = { minScore = 3971, wingScore = 4017 },
    GRANDMASTER = { minScore = 3879, wingScore = 3908 },
    MASTER      = { minScore = 3725, wingScore = 3782 },
    DIAMOND     = { minScore = 3477, wingScore = 3569 },
    EMERALD     = { minScore = 3346, wingScore = 3413 },
    PLATINUM    = { minScore = 3052, wingScore = 3163 },
    GOLD        = { minScore = 2691, wingScore = 2885 },
    SILVER      = { minScore = 1441, wingScore = 2286 },
    BRONZE      = { minScore =  352, wingScore =  839 },
    IRON        = { minScore =    1, wingScore =  181 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4116,
    CHALLENGER  = { minScore = 3890, wingScore = 4017 },
    GRANDMASTER = { minScore = 3837, wingScore = 3864 },
    MASTER      = { minScore = 3651, wingScore = 3744 },
    DIAMOND     = { minScore = 3511, wingScore = 3581 },
    EMERALD     = { minScore = 3323, wingScore = 3417 },
    PLATINUM    = { minScore = 3059, wingScore = 3161 },
    GOLD        = { minScore = 2691, wingScore = 2873 },
    SILVER      = { minScore = 1441, wingScore = 2286 },
    BRONZE      = { minScore =  352, wingScore =  839 },
    IRON        = { minScore =    1, wingScore =  181 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4116,
    CHALLENGER  = { minScore = 4014, wingScore = 4017 },
    GRANDMASTER = { minScore = 3962, wingScore = 3988 },
    MASTER      = { minScore = 3781, wingScore = 3872 },
    DIAMOND     = { minScore = 3629, wingScore = 3705 },
    EMERALD     = { minScore = 3426, wingScore = 3528 },
    PLATINUM    = { minScore = 3120, wingScore = 3243 },
    GOLD        = { minScore = 2691, wingScore = 2916 },
    SILVER      = { minScore = 1441, wingScore = 2286 },
    BRONZE      = { minScore =  352, wingScore =  839 },
    IRON        = { minScore =    1, wingScore =  181 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4170,
    CHALLENGER  = { minScore = 3995, wingScore = 4035 },
    GRANDMASTER = { minScore = 3898, wingScore = 3933 },
    MASTER      = { minScore = 3762, wingScore = 3816 },
    DIAMOND     = { minScore = 3525, wingScore = 3620 },
    EMERALD     = { minScore = 3389, wingScore = 3448 },
    PLATINUM    = { minScore = 3091, wingScore = 3219 },
    GOLD        = { minScore = 2742, wingScore = 2949 },
    SILVER      = { minScore = 1613, wingScore = 2408 },
    BRONZE      = { minScore =  417, wingScore =  950 },
    IRON        = { minScore =    1, wingScore =  216 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4170,
    CHALLENGER  = { minScore = 3918, wingScore = 4035 },
    GRANDMASTER = { minScore = 3870, wingScore = 3895 },
    MASTER      = { minScore = 3699, wingScore = 3784 },
    DIAMOND     = { minScore = 3563, wingScore = 3631 },
    EMERALD     = { minScore = 3381, wingScore = 3472 },
    PLATINUM    = { minScore = 3101, wingScore = 3214 },
    GOLD        = { minScore = 2743, wingScore = 2912 },
    SILVER      = { minScore = 1617, wingScore = 2410 },
    BRONZE      = { minScore =  418, wingScore =  952 },
    IRON        = { minScore =    1, wingScore =  217 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4170,
    CHALLENGER  = { minScore = 4028, wingScore = 4035 },
    GRANDMASTER = { minScore = 3980, wingScore = 4004 },
    MASTER      = { minScore = 3812, wingScore = 3896 },
    DIAMOND     = { minScore = 3666, wingScore = 3739 },
    EMERALD     = { minScore = 3471, wingScore = 3569 },
    PLATINUM    = { minScore = 3153, wingScore = 3285 },
    GOLD        = { minScore = 2741, wingScore = 2950 },
    SILVER      = { minScore = 1610, wingScore = 2405 },
    BRONZE      = { minScore =  415, wingScore =  948 },
    IRON        = { minScore =    1, wingScore =  215 },
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
