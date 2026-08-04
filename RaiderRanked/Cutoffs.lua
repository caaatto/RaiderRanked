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
    top100Score = 4347,
    CHALLENGER  = { minScore = 4207, wingScore = 4253 },
    GRANDMASTER = { minScore = 4062, wingScore = 4117 },
    MASTER      = { minScore = 3961, wingScore = 4012 },
    DIAMOND     = { minScore = 3657, wingScore = 3773 },
    EMERALD     = { minScore = 3468, wingScore = 3549 },
    PLATINUM    = { minScore = 3169, wingScore = 3335 },
    GOLD        = { minScore = 2823, wingScore = 3018 },
    SILVER      = { minScore = 1730, wingScore = 2524 },
    BRONZE      = { minScore =  430, wingScore =  1015 },
    IRON        = { minScore =    1, wingScore =  233 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4347,
    CHALLENGER  = { minScore = 4085, wingScore = 4253 },
    GRANDMASTER = { minScore = 4041, wingScore = 4063 },
    MASTER      = { minScore = 3888, wingScore = 3964 },
    DIAMOND     = { minScore = 3728, wingScore = 3808 },
    EMERALD     = { minScore = 3515, wingScore = 3621 },
    PLATINUM    = { minScore = 3171, wingScore = 3313 },
    GOLD        = { minScore = 2823, wingScore = 2969 },
    SILVER      = { minScore = 1730, wingScore = 2524 },
    BRONZE      = { minScore =  430, wingScore =  1015 },
    IRON        = { minScore =    1, wingScore =  233 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4347,
    CHALLENGER  = { minScore = 4249, wingScore = 4253 },
    GRANDMASTER = { minScore = 4197, wingScore = 4223 },
    MASTER      = { minScore = 4011, wingScore = 4104 },
    DIAMOND     = { minScore = 3825, wingScore = 3918 },
    EMERALD     = { minScore = 3577, wingScore = 3701 },
    PLATINUM    = { minScore = 3216, wingScore = 3358 },
    GOLD        = { minScore = 2823, wingScore = 3016 },
    SILVER      = { minScore = 1730, wingScore = 2524 },
    BRONZE      = { minScore =  430, wingScore =  1015 },
    IRON        = { minScore =    1, wingScore =  233 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4299,
    CHALLENGER  = { minScore = 4181, wingScore = 4221 },
    GRANDMASTER = { minScore = 4028, wingScore = 4074 },
    MASTER      = { minScore = 3912, wingScore = 3967 },
    DIAMOND     = { minScore = 3563, wingScore = 3689 },
    EMERALD     = { minScore = 3418, wingScore = 3460 },
    PLATINUM    = { minScore = 3087, wingScore = 3231 },
    GOLD        = { minScore = 2725, wingScore = 2957 },
    SILVER      = { minScore = 1431, wingScore = 2308 },
    BRONZE      = { minScore =  346, wingScore =  829 },
    IRON        = { minScore =    1, wingScore =  179 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4299,
    CHALLENGER  = { minScore = 4029, wingScore = 4221 },
    GRANDMASTER = { minScore = 3978, wingScore = 4004 },
    MASTER      = { minScore = 3800, wingScore = 3889 },
    DIAMOND     = { minScore = 3639, wingScore = 3720 },
    EMERALD     = { minScore = 3426, wingScore = 3533 },
    PLATINUM    = { minScore = 3115, wingScore = 3237 },
    GOLD        = { minScore = 2725, wingScore = 2909 },
    SILVER      = { minScore = 1431, wingScore = 2308 },
    BRONZE      = { minScore =  346, wingScore =  829 },
    IRON        = { minScore =    1, wingScore =  179 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4299,
    CHALLENGER  = { minScore = 4215, wingScore = 4221 },
    GRANDMASTER = { minScore = 4160, wingScore = 4188 },
    MASTER      = { minScore = 3966, wingScore = 4063 },
    DIAMOND     = { minScore = 3781, wingScore = 3873 },
    EMERALD     = { minScore = 3535, wingScore = 3658 },
    PLATINUM    = { minScore = 3165, wingScore = 3313 },
    GOLD        = { minScore = 2725, wingScore = 2946 },
    SILVER      = { minScore = 1431, wingScore = 2308 },
    BRONZE      = { minScore =  346, wingScore =  829 },
    IRON        = { minScore =    1, wingScore =  179 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4347,
    CHALLENGER  = { minScore = 4196, wingScore = 4240 },
    GRANDMASTER = { minScore = 4048, wingScore = 4099 },
    MASTER      = { minScore = 3940, wingScore = 3993 },
    DIAMOND     = { minScore = 3617, wingScore = 3738 },
    EMERALD     = { minScore = 3447, wingScore = 3512 },
    PLATINUM    = { minScore = 3134, wingScore = 3291 },
    GOLD        = { minScore = 2782, wingScore = 2992 },
    SILVER      = { minScore = 1604, wingScore = 2433 },
    BRONZE      = { minScore =  395, wingScore =  937 },
    IRON        = { minScore =    1, wingScore =  210 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4347,
    CHALLENGER  = { minScore = 4062, wingScore = 4240 },
    GRANDMASTER = { minScore = 4015, wingScore = 4039 },
    MASTER      = { minScore = 3852, wingScore = 3933 },
    DIAMOND     = { minScore = 3691, wingScore = 3772 },
    EMERALD     = { minScore = 3478, wingScore = 3585 },
    PLATINUM    = { minScore = 3148, wingScore = 3282 },
    GOLD        = { minScore = 2783, wingScore = 2944 },
    SILVER      = { minScore = 1607, wingScore = 2435 },
    BRONZE      = { minScore =  396, wingScore =  939 },
    IRON        = { minScore =    1, wingScore =  211 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4347,
    CHALLENGER  = { minScore = 4234, wingScore = 4239 },
    GRANDMASTER = { minScore = 4181, wingScore = 4208 },
    MASTER      = { minScore = 3992, wingScore = 4086 },
    DIAMOND     = { minScore = 3806, wingScore = 3899 },
    EMERALD     = { minScore = 3559, wingScore = 3682 },
    PLATINUM    = { minScore = 3194, wingScore = 3339 },
    GOLD        = { minScore = 2781, wingScore = 2986 },
    SILVER      = { minScore = 1601, wingScore = 2431 },
    BRONZE      = { minScore =  394, wingScore =  935 },
    IRON        = { minScore =    1, wingScore =  210 },
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
