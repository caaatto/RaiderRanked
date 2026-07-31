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
    top100Score = 4344,
    CHALLENGER  = { minScore = 4196, wingScore = 4250 },
    GRANDMASTER = { minScore = 4058, wingScore = 4115 },
    MASTER      = { minScore = 3945, wingScore = 4008 },
    DIAMOND     = { minScore = 3656, wingScore = 3770 },
    EMERALD     = { minScore = 3467, wingScore = 3548 },
    PLATINUM    = { minScore = 3169, wingScore = 3334 },
    GOLD        = { minScore = 2824, wingScore = 3018 },
    SILVER      = { minScore = 1736, wingScore = 2527 },
    BRONZE      = { minScore =  438, wingScore =  1019 },
    IRON        = { minScore =    1, wingScore =  237 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4344,
    CHALLENGER  = { minScore = 4080, wingScore = 4250 },
    GRANDMASTER = { minScore = 4035, wingScore = 4058 },
    MASTER      = { minScore = 3878, wingScore = 3956 },
    DIAMOND     = { minScore = 3721, wingScore = 3799 },
    EMERALD     = { minScore = 3512, wingScore = 3616 },
    PLATINUM    = { minScore = 3171, wingScore = 3313 },
    GOLD        = { minScore = 2824, wingScore = 2969 },
    SILVER      = { minScore = 1736, wingScore = 2527 },
    BRONZE      = { minScore =  438, wingScore =  1019 },
    IRON        = { minScore =    1, wingScore =  237 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4344,
    CHALLENGER  = { minScore = 4239, wingScore = 4250 },
    GRANDMASTER = { minScore = 4187, wingScore = 4213 },
    MASTER      = { minScore = 4004, wingScore = 4096 },
    DIAMOND     = { minScore = 3821, wingScore = 3912 },
    EMERALD     = { minScore = 3575, wingScore = 3698 },
    PLATINUM    = { minScore = 3217, wingScore = 3358 },
    GOLD        = { minScore = 2824, wingScore = 3016 },
    SILVER      = { minScore = 1736, wingScore = 2527 },
    BRONZE      = { minScore =  438, wingScore =  1019 },
    IRON        = { minScore =    1, wingScore =  237 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4298,
    CHALLENGER  = { minScore = 4167, wingScore = 4213 },
    GRANDMASTER = { minScore = 4025, wingScore = 4071 },
    MASTER      = { minScore = 3901, wingScore = 3956 },
    DIAMOND     = { minScore = 3562, wingScore = 3687 },
    EMERALD     = { minScore = 3417, wingScore = 3459 },
    PLATINUM    = { minScore = 3087, wingScore = 3230 },
    GOLD        = { minScore = 2725, wingScore = 2956 },
    SILVER      = { minScore = 1435, wingScore = 2310 },
    BRONZE      = { minScore =  348, wingScore =  832 },
    IRON        = { minScore =    1, wingScore =  180 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4298,
    CHALLENGER  = { minScore = 4027, wingScore = 4213 },
    GRANDMASTER = { minScore = 3974, wingScore = 4000 },
    MASTER      = { minScore = 3792, wingScore = 3883 },
    DIAMOND     = { minScore = 3633, wingScore = 3713 },
    EMERALD     = { minScore = 3421, wingScore = 3527 },
    PLATINUM    = { minScore = 3113, wingScore = 3234 },
    GOLD        = { minScore = 2725, wingScore = 2908 },
    SILVER      = { minScore = 1435, wingScore = 2310 },
    BRONZE      = { minScore =  348, wingScore =  832 },
    IRON        = { minScore =    1, wingScore =  180 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4298,
    CHALLENGER  = { minScore = 4209, wingScore = 4213 },
    GRANDMASTER = { minScore = 4153, wingScore = 4181 },
    MASTER      = { minScore = 3955, wingScore = 4054 },
    DIAMOND     = { minScore = 3773, wingScore = 3864 },
    EMERALD     = { minScore = 3531, wingScore = 3652 },
    PLATINUM    = { minScore = 3165, wingScore = 3312 },
    GOLD        = { minScore = 2725, wingScore = 2946 },
    SILVER      = { minScore = 1435, wingScore = 2310 },
    BRONZE      = { minScore =  348, wingScore =  832 },
    IRON        = { minScore =    1, wingScore =  180 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4344,
    CHALLENGER  = { minScore = 4184, wingScore = 4234 },
    GRANDMASTER = { minScore = 4044, wingScore = 4096 },
    MASTER      = { minScore = 3926, wingScore = 3986 },
    DIAMOND     = { minScore = 3616, wingScore = 3735 },
    EMERALD     = { minScore = 3446, wingScore = 3511 },
    PLATINUM    = { minScore = 3135, wingScore = 3290 },
    GOLD        = { minScore = 2782, wingScore = 2992 },
    SILVER      = { minScore = 1609, wingScore = 2436 },
    BRONZE      = { minScore =  400, wingScore =  940 },
    IRON        = { minScore =    1, wingScore =  213 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4344,
    CHALLENGER  = { minScore = 4058, wingScore = 4235 },
    GRANDMASTER = { minScore = 4010, wingScore = 4034 },
    MASTER      = { minScore = 3843, wingScore = 3926 },
    DIAMOND     = { minScore = 3685, wingScore = 3764 },
    EMERALD     = { minScore = 3475, wingScore = 3580 },
    PLATINUM    = { minScore = 3147, wingScore = 3281 },
    GOLD        = { minScore = 2783, wingScore = 2944 },
    SILVER      = { minScore = 1613, wingScore = 2438 },
    BRONZE      = { minScore =  401, wingScore =  942 },
    IRON        = { minScore =    1, wingScore =  214 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4344,
    CHALLENGER  = { minScore = 4226, wingScore = 4234 },
    GRANDMASTER = { minScore = 4172, wingScore = 4199 },
    MASTER      = { minScore = 3983, wingScore = 4078 },
    DIAMOND     = { minScore = 3800, wingScore = 3891 },
    EMERALD     = { minScore = 3556, wingScore = 3678 },
    PLATINUM    = { minScore = 3195, wingScore = 3338 },
    GOLD        = { minScore = 2781, wingScore = 2986 },
    SILVER      = { minScore = 1606, wingScore = 2433 },
    BRONZE      = { minScore =  399, wingScore =  938 },
    IRON        = { minScore =    1, wingScore =  212 },
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
