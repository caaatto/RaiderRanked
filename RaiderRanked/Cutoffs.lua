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
    top100Score = 4329,
    CHALLENGER  = { minScore = 4169, wingScore = 4230 },
    GRANDMASTER = { minScore = 4046, wingScore = 4101 },
    MASTER      = { minScore = 3924, wingScore = 3984 },
    DIAMOND     = { minScore = 3653, wingScore = 3762 },
    EMERALD     = { minScore = 3467, wingScore = 3547 },
    PLATINUM    = { minScore = 3170, wingScore = 3332 },
    GOLD        = { minScore = 2825, wingScore = 3019 },
    SILVER      = { minScore = 1752, wingScore = 2534 },
    BRONZE      = { minScore =  441, wingScore =  1028 },
    IRON        = { minScore =    1, wingScore =  238 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4329,
    CHALLENGER  = { minScore = 4070, wingScore = 4230 },
    GRANDMASTER = { minScore = 4023, wingScore = 4047 },
    MASTER      = { minScore = 3861, wingScore = 3942 },
    DIAMOND     = { minScore = 3710, wingScore = 3786 },
    EMERALD     = { minScore = 3508, wingScore = 3609 },
    PLATINUM    = { minScore = 3172, wingScore = 3313 },
    GOLD        = { minScore = 2825, wingScore = 2970 },
    SILVER      = { minScore = 1752, wingScore = 2534 },
    BRONZE      = { minScore =  441, wingScore =  1028 },
    IRON        = { minScore =    1, wingScore =  238 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4329,
    CHALLENGER  = { minScore = 4221, wingScore = 4230 },
    GRANDMASTER = { minScore = 4168, wingScore = 4194 },
    MASTER      = { minScore = 3982, wingScore = 4075 },
    DIAMOND     = { minScore = 3806, wingScore = 3894 },
    EMERALD     = { minScore = 3570, wingScore = 3688 },
    PLATINUM    = { minScore = 3218, wingScore = 3359 },
    GOLD        = { minScore = 2825, wingScore = 3018 },
    SILVER      = { minScore = 1752, wingScore = 2534 },
    BRONZE      = { minScore =  441, wingScore =  1028 },
    IRON        = { minScore =    1, wingScore =  238 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4282,
    CHALLENGER  = { minScore = 4142, wingScore = 4197 },
    GRANDMASTER = { minScore = 4016, wingScore = 4056 },
    MASTER      = { minScore = 3891, wingScore = 3937 },
    DIAMOND     = { minScore = 3560, wingScore = 3681 },
    EMERALD     = { minScore = 3415, wingScore = 3458 },
    PLATINUM    = { minScore = 3087, wingScore = 3228 },
    GOLD        = { minScore = 2727, wingScore = 2957 },
    SILVER      = { minScore = 1449, wingScore = 2318 },
    BRONZE      = { minScore =  348, wingScore =  836 },
    IRON        = { minScore =    1, wingScore =  180 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4282,
    CHALLENGER  = { minScore = 4017, wingScore = 4197 },
    GRANDMASTER = { minScore = 3964, wingScore = 3990 },
    MASTER      = { minScore = 3779, wingScore = 3871 },
    DIAMOND     = { minScore = 3623, wingScore = 3701 },
    EMERALD     = { minScore = 3415, wingScore = 3519 },
    PLATINUM    = { minScore = 3112, wingScore = 3232 },
    GOLD        = { minScore = 2727, wingScore = 2909 },
    SILVER      = { minScore = 1449, wingScore = 2318 },
    BRONZE      = { minScore =  348, wingScore =  836 },
    IRON        = { minScore =    1, wingScore =  180 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4282,
    CHALLENGER  = { minScore = 4191, wingScore = 4197 },
    GRANDMASTER = { minScore = 4135, wingScore = 4163 },
    MASTER      = { minScore = 3936, wingScore = 4035 },
    DIAMOND     = { minScore = 3760, wingScore = 3848 },
    EMERALD     = { minScore = 3526, wingScore = 3643 },
    PLATINUM    = { minScore = 3164, wingScore = 3311 },
    GOLD        = { minScore = 2727, wingScore = 2947 },
    SILVER      = { minScore = 1449, wingScore = 2318 },
    BRONZE      = { minScore =  348, wingScore =  836 },
    IRON        = { minScore =    1, wingScore =  180 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4329,
    CHALLENGER  = { minScore = 4158, wingScore = 4216 },
    GRANDMASTER = { minScore = 4033, wingScore = 4082 },
    MASTER      = { minScore = 3910, wingScore = 3964 },
    DIAMOND     = { minScore = 3614, wingScore = 3728 },
    EMERALD     = { minScore = 3445, wingScore = 3510 },
    PLATINUM    = { minScore = 3135, wingScore = 3288 },
    GOLD        = { minScore = 2784, wingScore = 2993 },
    SILVER      = { minScore = 1625, wingScore = 2443 },
    BRONZE      = { minScore =  402, wingScore =  947 },
    IRON        = { minScore =    1, wingScore =  214 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4329,
    CHALLENGER  = { minScore = 4048, wingScore = 4216 },
    GRANDMASTER = { minScore = 3999, wingScore = 4024 },
    MASTER      = { minScore = 3827, wingScore = 3913 },
    DIAMOND     = { minScore = 3674, wingScore = 3751 },
    EMERALD     = { minScore = 3470, wingScore = 3572 },
    PLATINUM    = { minScore = 3147, wingScore = 3280 },
    GOLD        = { minScore = 2785, wingScore = 2945 },
    SILVER      = { minScore = 1628, wingScore = 2445 },
    BRONZE      = { minScore =  403, wingScore =  949 },
    IRON        = { minScore =    1, wingScore =  214 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4329,
    CHALLENGER  = { minScore = 4208, wingScore = 4216 },
    GRANDMASTER = { minScore = 4154, wingScore = 4181 },
    MASTER      = { minScore = 3962, wingScore = 4058 },
    DIAMOND     = { minScore = 3786, wingScore = 3874 },
    EMERALD     = { minScore = 3551, wingScore = 3669 },
    PLATINUM    = { minScore = 3195, wingScore = 3338 },
    GOLD        = { minScore = 2783, wingScore = 2987 },
    SILVER      = { minScore = 1621, wingScore = 2441 },
    BRONZE      = { minScore =  401, wingScore =  945 },
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
