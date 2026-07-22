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
    top100Score = 4327,
    CHALLENGER  = { minScore = 4166, wingScore = 4227 },
    GRANDMASTER = { minScore = 4044, wingScore = 4100 },
    MASTER      = { minScore = 3922, wingScore = 3982 },
    DIAMOND     = { minScore = 3653, wingScore = 3762 },
    EMERALD     = { minScore = 3466, wingScore = 3547 },
    PLATINUM    = { minScore = 3170, wingScore = 3332 },
    GOLD        = { minScore = 2825, wingScore = 3019 },
    SILVER      = { minScore = 1753, wingScore = 2534 },
    BRONZE      = { minScore =  441, wingScore =  1029 },
    IRON        = { minScore =    1, wingScore =  238 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4327,
    CHALLENGER  = { minScore = 4069, wingScore = 4227 },
    GRANDMASTER = { minScore = 4022, wingScore = 4045 },
    MASTER      = { minScore = 3858, wingScore = 3940 },
    DIAMOND     = { minScore = 3707, wingScore = 3783 },
    EMERALD     = { minScore = 3507, wingScore = 3607 },
    PLATINUM    = { minScore = 3172, wingScore = 3313 },
    GOLD        = { minScore = 2825, wingScore = 2970 },
    SILVER      = { minScore = 1753, wingScore = 2534 },
    BRONZE      = { minScore =  441, wingScore =  1029 },
    IRON        = { minScore =    1, wingScore =  238 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4327,
    CHALLENGER  = { minScore = 4218, wingScore = 4227 },
    GRANDMASTER = { minScore = 4165, wingScore = 4191 },
    MASTER      = { minScore = 3980, wingScore = 4073 },
    DIAMOND     = { minScore = 3805, wingScore = 3892 },
    EMERALD     = { minScore = 3570, wingScore = 3687 },
    PLATINUM    = { minScore = 3218, wingScore = 3359 },
    GOLD        = { minScore = 2825, wingScore = 3019 },
    SILVER      = { minScore = 1753, wingScore = 2534 },
    BRONZE      = { minScore =  441, wingScore =  1029 },
    IRON        = { minScore =    1, wingScore =  238 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4275,
    CHALLENGER  = { minScore = 4140, wingScore = 4196 },
    GRANDMASTER = { minScore = 4015, wingScore = 4054 },
    MASTER      = { minScore = 3890, wingScore = 3934 },
    DIAMOND     = { minScore = 3559, wingScore = 3680 },
    EMERALD     = { minScore = 3415, wingScore = 3458 },
    PLATINUM    = { minScore = 3087, wingScore = 3228 },
    GOLD        = { minScore = 2727, wingScore = 2957 },
    SILVER      = { minScore = 1451, wingScore = 2319 },
    BRONZE      = { minScore =  348, wingScore =  837 },
    IRON        = { minScore =    1, wingScore =  180 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4275,
    CHALLENGER  = { minScore = 4016, wingScore = 4196 },
    GRANDMASTER = { minScore = 3963, wingScore = 3990 },
    MASTER      = { minScore = 3778, wingScore = 3871 },
    DIAMOND     = { minScore = 3622, wingScore = 3700 },
    EMERALD     = { minScore = 3415, wingScore = 3519 },
    PLATINUM    = { minScore = 3112, wingScore = 3231 },
    GOLD        = { minScore = 2727, wingScore = 2909 },
    SILVER      = { minScore = 1451, wingScore = 2319 },
    BRONZE      = { minScore =  348, wingScore =  837 },
    IRON        = { minScore =    1, wingScore =  180 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4275,
    CHALLENGER  = { minScore = 4190, wingScore = 4196 },
    GRANDMASTER = { minScore = 4133, wingScore = 4161 },
    MASTER      = { minScore = 3933, wingScore = 4033 },
    DIAMOND     = { minScore = 3758, wingScore = 3846 },
    EMERALD     = { minScore = 3526, wingScore = 3642 },
    PLATINUM    = { minScore = 3164, wingScore = 3311 },
    GOLD        = { minScore = 2727, wingScore = 2947 },
    SILVER      = { minScore = 1451, wingScore = 2319 },
    BRONZE      = { minScore =  348, wingScore =  837 },
    IRON        = { minScore =    1, wingScore =  180 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4327,
    CHALLENGER  = { minScore = 4155, wingScore = 4214 },
    GRANDMASTER = { minScore = 4032, wingScore = 4081 },
    MASTER      = { minScore = 3909, wingScore = 3962 },
    DIAMOND     = { minScore = 3613, wingScore = 3728 },
    EMERALD     = { minScore = 3445, wingScore = 3510 },
    PLATINUM    = { minScore = 3135, wingScore = 3288 },
    GOLD        = { minScore = 2784, wingScore = 2993 },
    SILVER      = { minScore = 1626, wingScore = 2444 },
    BRONZE      = { minScore =  402, wingScore =  948 },
    IRON        = { minScore =    1, wingScore =  214 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4327,
    CHALLENGER  = { minScore = 4047, wingScore = 4214 },
    GRANDMASTER = { minScore = 3998, wingScore = 4022 },
    MASTER      = { minScore = 3825, wingScore = 3912 },
    DIAMOND     = { minScore = 3672, wingScore = 3749 },
    EMERALD     = { minScore = 3469, wingScore = 3571 },
    PLATINUM    = { minScore = 3147, wingScore = 3279 },
    GOLD        = { minScore = 2785, wingScore = 2945 },
    SILVER      = { minScore = 1629, wingScore = 2446 },
    BRONZE      = { minScore =  403, wingScore =  950 },
    IRON        = { minScore =    1, wingScore =  214 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4327,
    CHALLENGER  = { minScore = 4206, wingScore = 4214 },
    GRANDMASTER = { minScore = 4151, wingScore = 4178 },
    MASTER      = { minScore = 3960, wingScore = 4056 },
    DIAMOND     = { minScore = 3785, wingScore = 3872 },
    EMERALD     = { minScore = 3551, wingScore = 3668 },
    PLATINUM    = { minScore = 3195, wingScore = 3338 },
    GOLD        = { minScore = 2783, wingScore = 2988 },
    SILVER      = { minScore = 1623, wingScore = 2441 },
    BRONZE      = { minScore =  401, wingScore =  946 },
    IRON        = { minScore =    1, wingScore =  213 },
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
