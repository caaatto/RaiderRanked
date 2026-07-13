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
    top100Score = 4310,
    CHALLENGER  = { minScore = 4138, wingScore = 4196 },
    GRANDMASTER = { minScore = 4027, wingScore = 4072 },
    MASTER      = { minScore = 3902, wingScore = 3954 },
    DIAMOND     = { minScore = 3644, wingScore = 3748 },
    EMERALD     = { minScore = 3463, wingScore = 3544 },
    PLATINUM    = { minScore = 3169, wingScore = 3328 },
    GOLD        = { minScore = 2825, wingScore = 3019 },
    SILVER      = { minScore = 1766, wingScore = 2538 },
    BRONZE      = { minScore =  456, wingScore =  1038 },
    IRON        = { minScore =    1, wingScore =  240 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4310,
    CHALLENGER  = { minScore = 4044, wingScore = 4196 },
    GRANDMASTER = { minScore = 3997, wingScore = 4021 },
    MASTER      = { minScore = 3834, wingScore = 3915 },
    DIAMOND     = { minScore = 3691, wingScore = 3762 },
    EMERALD     = { minScore = 3500, wingScore = 3595 },
    PLATINUM    = { minScore = 3171, wingScore = 3311 },
    GOLD        = { minScore = 2825, wingScore = 2970 },
    SILVER      = { minScore = 1766, wingScore = 2538 },
    BRONZE      = { minScore =  456, wingScore =  1038 },
    IRON        = { minScore =    1, wingScore =  240 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4310,
    CHALLENGER  = { minScore = 4183, wingScore = 4196 },
    GRANDMASTER = { minScore = 4131, wingScore = 4157 },
    MASTER      = { minScore = 3952, wingScore = 4042 },
    DIAMOND     = { minScore = 3785, wingScore = 3868 },
    EMERALD     = { minScore = 3562, wingScore = 3673 },
    PLATINUM    = { minScore = 3217, wingScore = 3357 },
    GOLD        = { minScore = 2825, wingScore = 3018 },
    SILVER      = { minScore = 1766, wingScore = 2538 },
    BRONZE      = { minScore =  456, wingScore =  1038 },
    IRON        = { minScore =    1, wingScore =  240 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4257,
    CHALLENGER  = { minScore = 4121, wingScore = 4165 },
    GRANDMASTER = { minScore = 3999, wingScore = 4029 },
    MASTER      = { minScore = 3858, wingScore = 3909 },
    DIAMOND     = { minScore = 3554, wingScore = 3671 },
    EMERALD     = { minScore = 3413, wingScore = 3454 },
    PLATINUM    = { minScore = 3087, wingScore = 3225 },
    GOLD        = { minScore = 2726, wingScore = 2954 },
    SILVER      = { minScore = 1460, wingScore = 2324 },
    BRONZE      = { minScore =  352, wingScore =  843 },
    IRON        = { minScore =    1, wingScore =  182 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4257,
    CHALLENGER  = { minScore = 4000, wingScore = 4165 },
    GRANDMASTER = { minScore = 3948, wingScore = 3974 },
    MASTER      = { minScore = 3763, wingScore = 3855 },
    DIAMOND     = { minScore = 3610, wingScore = 3687 },
    EMERALD     = { minScore = 3407, wingScore = 3509 },
    PLATINUM    = { minScore = 3110, wingScore = 3227 },
    GOLD        = { minScore = 2726, wingScore = 2909 },
    SILVER      = { minScore = 1460, wingScore = 2324 },
    BRONZE      = { minScore =  352, wingScore =  843 },
    IRON        = { minScore =    1, wingScore =  182 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4257,
    CHALLENGER  = { minScore = 4155, wingScore = 4165 },
    GRANDMASTER = { minScore = 4100, wingScore = 4127 },
    MASTER      = { minScore = 3909, wingScore = 4004 },
    DIAMOND     = { minScore = 3742, wingScore = 3825 },
    EMERALD     = { minScore = 3519, wingScore = 3630 },
    PLATINUM    = { minScore = 3164, wingScore = 3310 },
    GOLD        = { minScore = 2726, wingScore = 2946 },
    SILVER      = { minScore = 1460, wingScore = 2324 },
    BRONZE      = { minScore =  352, wingScore =  843 },
    IRON        = { minScore =    1, wingScore =  182 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4310,
    CHALLENGER  = { minScore = 4131, wingScore = 4183 },
    GRANDMASTER = { minScore = 4015, wingScore = 4054 },
    MASTER      = { minScore = 3884, wingScore = 3935 },
    DIAMOND     = { minScore = 3606, wingScore = 3716 },
    EMERALD     = { minScore = 3442, wingScore = 3506 },
    PLATINUM    = { minScore = 3135, wingScore = 3285 },
    GOLD        = { minScore = 2783, wingScore = 2992 },
    SILVER      = { minScore = 1637, wingScore = 2448 },
    BRONZE      = { minScore =  412, wingScore =  956 },
    IRON        = { minScore =    1, wingScore =  216 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4310,
    CHALLENGER  = { minScore = 4026, wingScore = 4183 },
    GRANDMASTER = { minScore = 3977, wingScore = 4002 },
    MASTER      = { minScore = 3805, wingScore = 3890 },
    DIAMOND     = { minScore = 3658, wingScore = 3731 },
    EMERALD     = { minScore = 3462, wingScore = 3560 },
    PLATINUM    = { minScore = 3146, wingScore = 3277 },
    GOLD        = { minScore = 2784, wingScore = 2945 },
    SILVER      = { minScore = 1641, wingScore = 2450 },
    BRONZE      = { minScore =  413, wingScore =  958 },
    IRON        = { minScore =    1, wingScore =  216 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4310,
    CHALLENGER  = { minScore = 4171, wingScore = 4183 },
    GRANDMASTER = { minScore = 4118, wingScore = 4144 },
    MASTER      = { minScore = 3933, wingScore = 4026 },
    DIAMOND     = { minScore = 3766, wingScore = 3849 },
    EMERALD     = { minScore = 3543, wingScore = 3654 },
    PLATINUM    = { minScore = 3194, wingScore = 3337 },
    GOLD        = { minScore = 2782, wingScore = 2987 },
    SILVER      = { minScore = 1634, wingScore = 2446 },
    BRONZE      = { minScore =  411, wingScore =  954 },
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
