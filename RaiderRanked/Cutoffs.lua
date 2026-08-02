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
    top100Score = 4345,
    CHALLENGER  = { minScore = 4204, wingScore = 4252 },
    GRANDMASTER = { minScore = 4060, wingScore = 4117 },
    MASTER      = { minScore = 3954, wingScore = 4011 },
    DIAMOND     = { minScore = 3657, wingScore = 3772 },
    EMERALD     = { minScore = 3468, wingScore = 3549 },
    PLATINUM    = { minScore = 3169, wingScore = 3335 },
    GOLD        = { minScore = 2824, wingScore = 3018 },
    SILVER      = { minScore = 1733, wingScore = 2525 },
    BRONZE      = { minScore =  434, wingScore =  1017 },
    IRON        = { minScore =    1, wingScore =  235 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4345,
    CHALLENGER  = { minScore = 4084, wingScore = 4252 },
    GRANDMASTER = { minScore = 4039, wingScore = 4061 },
    MASTER      = { minScore = 3883, wingScore = 3961 },
    DIAMOND     = { minScore = 3724, wingScore = 3804 },
    EMERALD     = { minScore = 3513, wingScore = 3619 },
    PLATINUM    = { minScore = 3171, wingScore = 3313 },
    GOLD        = { minScore = 2824, wingScore = 2969 },
    SILVER      = { minScore = 1733, wingScore = 2525 },
    BRONZE      = { minScore =  434, wingScore =  1017 },
    IRON        = { minScore =    1, wingScore =  235 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4345,
    CHALLENGER  = { minScore = 4248, wingScore = 4252 },
    GRANDMASTER = { minScore = 4195, wingScore = 4222 },
    MASTER      = { minScore = 4010, wingScore = 4102 },
    DIAMOND     = { minScore = 3824, wingScore = 3917 },
    EMERALD     = { minScore = 3577, wingScore = 3701 },
    PLATINUM    = { minScore = 3216, wingScore = 3359 },
    GOLD        = { minScore = 2824, wingScore = 3016 },
    SILVER      = { minScore = 1733, wingScore = 2525 },
    BRONZE      = { minScore =  434, wingScore =  1017 },
    IRON        = { minScore =    1, wingScore =  235 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4299,
    CHALLENGER  = { minScore = 4177, wingScore = 4220 },
    GRANDMASTER = { minScore = 4027, wingScore = 4073 },
    MASTER      = { minScore = 3908, wingScore = 3964 },
    DIAMOND     = { minScore = 3563, wingScore = 3689 },
    EMERALD     = { minScore = 3418, wingScore = 3460 },
    PLATINUM    = { minScore = 3087, wingScore = 3231 },
    GOLD        = { minScore = 2725, wingScore = 2957 },
    SILVER      = { minScore = 1433, wingScore = 2309 },
    BRONZE      = { minScore =  347, wingScore =  830 },
    IRON        = { minScore =    1, wingScore =  180 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4299,
    CHALLENGER  = { minScore = 4029, wingScore = 4220 },
    GRANDMASTER = { minScore = 3977, wingScore = 4003 },
    MASTER      = { minScore = 3798, wingScore = 3887 },
    DIAMOND     = { minScore = 3638, wingScore = 3718 },
    EMERALD     = { minScore = 3424, wingScore = 3531 },
    PLATINUM    = { minScore = 3115, wingScore = 3236 },
    GOLD        = { minScore = 2725, wingScore = 2909 },
    SILVER      = { minScore = 1433, wingScore = 2309 },
    BRONZE      = { minScore =  347, wingScore =  830 },
    IRON        = { minScore =    1, wingScore =  180 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4299,
    CHALLENGER  = { minScore = 4213, wingScore = 4220 },
    GRANDMASTER = { minScore = 4158, wingScore = 4185 },
    MASTER      = { minScore = 3963, wingScore = 4060 },
    DIAMOND     = { minScore = 3779, wingScore = 3871 },
    EMERALD     = { minScore = 3534, wingScore = 3656 },
    PLATINUM    = { minScore = 3165, wingScore = 3313 },
    GOLD        = { minScore = 2725, wingScore = 2946 },
    SILVER      = { minScore = 1433, wingScore = 2309 },
    BRONZE      = { minScore =  347, wingScore =  830 },
    IRON        = { minScore =    1, wingScore =  180 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4345,
    CHALLENGER  = { minScore = 4193, wingScore = 4239 },
    GRANDMASTER = { minScore = 4046, wingScore = 4098 },
    MASTER      = { minScore = 3935, wingScore = 3991 },
    DIAMOND     = { minScore = 3617, wingScore = 3737 },
    EMERALD     = { minScore = 3447, wingScore = 3512 },
    PLATINUM    = { minScore = 3134, wingScore = 3291 },
    GOLD        = { minScore = 2782, wingScore = 2992 },
    SILVER      = { minScore = 1607, wingScore = 2434 },
    BRONZE      = { minScore =  397, wingScore =  938 },
    IRON        = { minScore =    1, wingScore =  212 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4345,
    CHALLENGER  = { minScore = 4061, wingScore = 4239 },
    GRANDMASTER = { minScore = 4014, wingScore = 4037 },
    MASTER      = { minScore = 3848, wingScore = 3931 },
    DIAMOND     = { minScore = 3689, wingScore = 3769 },
    EMERALD     = { minScore = 3476, wingScore = 3583 },
    PLATINUM    = { minScore = 3148, wingScore = 3281 },
    GOLD        = { minScore = 2783, wingScore = 2944 },
    SILVER      = { minScore = 1610, wingScore = 2436 },
    BRONZE      = { minScore =  398, wingScore =  940 },
    IRON        = { minScore =    1, wingScore =  212 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4345,
    CHALLENGER  = { minScore = 4233, wingScore = 4238 },
    GRANDMASTER = { minScore = 4179, wingScore = 4206 },
    MASTER      = { minScore = 3990, wingScore = 4084 },
    DIAMOND     = { minScore = 3805, wingScore = 3897 },
    EMERALD     = { minScore = 3558, wingScore = 3682 },
    PLATINUM    = { minScore = 3194, wingScore = 3339 },
    GOLD        = { minScore = 2781, wingScore = 2986 },
    SILVER      = { minScore = 1603, wingScore = 2432 },
    BRONZE      = { minScore =  396, wingScore =  936 },
    IRON        = { minScore =    1, wingScore =  211 },
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
