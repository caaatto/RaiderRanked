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
    CHALLENGER  = { minScore = 4206, wingScore = 4253 },
    GRANDMASTER = { minScore = 4061, wingScore = 4117 },
    MASTER      = { minScore = 3956, wingScore = 4011 },
    DIAMOND     = { minScore = 3657, wingScore = 3772 },
    EMERALD     = { minScore = 3468, wingScore = 3549 },
    PLATINUM    = { minScore = 3169, wingScore = 3335 },
    GOLD        = { minScore = 2823, wingScore = 3018 },
    SILVER      = { minScore = 1732, wingScore = 2525 },
    BRONZE      = { minScore =  432, wingScore =  1016 },
    IRON        = { minScore =    1, wingScore =  234 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4347,
    CHALLENGER  = { minScore = 4084, wingScore = 4253 },
    GRANDMASTER = { minScore = 4040, wingScore = 4062 },
    MASTER      = { minScore = 3885, wingScore = 3963 },
    DIAMOND     = { minScore = 3726, wingScore = 3806 },
    EMERALD     = { minScore = 3514, wingScore = 3620 },
    PLATINUM    = { minScore = 3171, wingScore = 3313 },
    GOLD        = { minScore = 2823, wingScore = 2969 },
    SILVER      = { minScore = 1732, wingScore = 2525 },
    BRONZE      = { minScore =  432, wingScore =  1016 },
    IRON        = { minScore =    1, wingScore =  234 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4347,
    CHALLENGER  = { minScore = 4249, wingScore = 4253 },
    GRANDMASTER = { minScore = 4196, wingScore = 4222 },
    MASTER      = { minScore = 4010, wingScore = 4103 },
    DIAMOND     = { minScore = 3825, wingScore = 3918 },
    EMERALD     = { minScore = 3577, wingScore = 3701 },
    PLATINUM    = { minScore = 3216, wingScore = 3358 },
    GOLD        = { minScore = 2823, wingScore = 3016 },
    SILVER      = { minScore = 1732, wingScore = 2525 },
    BRONZE      = { minScore =  432, wingScore =  1016 },
    IRON        = { minScore =    1, wingScore =  234 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4299,
    CHALLENGER  = { minScore = 4178, wingScore = 4221 },
    GRANDMASTER = { minScore = 4027, wingScore = 4073 },
    MASTER      = { minScore = 3909, wingScore = 3965 },
    DIAMOND     = { minScore = 3563, wingScore = 3689 },
    EMERALD     = { minScore = 3418, wingScore = 3460 },
    PLATINUM    = { minScore = 3087, wingScore = 3231 },
    GOLD        = { minScore = 2725, wingScore = 2957 },
    SILVER      = { minScore = 1432, wingScore = 2309 },
    BRONZE      = { minScore =  347, wingScore =  830 },
    IRON        = { minScore =    1, wingScore =  179 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4299,
    CHALLENGER  = { minScore = 4029, wingScore = 4221 },
    GRANDMASTER = { minScore = 3978, wingScore = 4003 },
    MASTER      = { minScore = 3798, wingScore = 3888 },
    DIAMOND     = { minScore = 3638, wingScore = 3718 },
    EMERALD     = { minScore = 3425, wingScore = 3531 },
    PLATINUM    = { minScore = 3115, wingScore = 3237 },
    GOLD        = { minScore = 2725, wingScore = 2909 },
    SILVER      = { minScore = 1432, wingScore = 2309 },
    BRONZE      = { minScore =  347, wingScore =  830 },
    IRON        = { minScore =    1, wingScore =  179 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4299,
    CHALLENGER  = { minScore = 4214, wingScore = 4221 },
    GRANDMASTER = { minScore = 4158, wingScore = 4186 },
    MASTER      = { minScore = 3964, wingScore = 4061 },
    DIAMOND     = { minScore = 3780, wingScore = 3872 },
    EMERALD     = { minScore = 3534, wingScore = 3657 },
    PLATINUM    = { minScore = 3165, wingScore = 3313 },
    GOLD        = { minScore = 2725, wingScore = 2946 },
    SILVER      = { minScore = 1432, wingScore = 2309 },
    BRONZE      = { minScore =  347, wingScore =  830 },
    IRON        = { minScore =    1, wingScore =  179 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4347,
    CHALLENGER  = { minScore = 4194, wingScore = 4240 },
    GRANDMASTER = { minScore = 4047, wingScore = 4098 },
    MASTER      = { minScore = 3936, wingScore = 3992 },
    DIAMOND     = { minScore = 3617, wingScore = 3737 },
    EMERALD     = { minScore = 3447, wingScore = 3512 },
    PLATINUM    = { minScore = 3134, wingScore = 3291 },
    GOLD        = { minScore = 2782, wingScore = 2992 },
    SILVER      = { minScore = 1606, wingScore = 2434 },
    BRONZE      = { minScore =  396, wingScore =  938 },
    IRON        = { minScore =    1, wingScore =  211 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4347,
    CHALLENGER  = { minScore = 4061, wingScore = 4240 },
    GRANDMASTER = { minScore = 4015, wingScore = 4038 },
    MASTER      = { minScore = 3849, wingScore = 3932 },
    DIAMOND     = { minScore = 3690, wingScore = 3770 },
    EMERALD     = { minScore = 3478, wingScore = 3584 },
    PLATINUM    = { minScore = 3148, wingScore = 3282 },
    GOLD        = { minScore = 2783, wingScore = 2944 },
    SILVER      = { minScore = 1609, wingScore = 2436 },
    BRONZE      = { minScore =  397, wingScore =  940 },
    IRON        = { minScore =    1, wingScore =  211 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4347,
    CHALLENGER  = { minScore = 4234, wingScore = 4239 },
    GRANDMASTER = { minScore = 4180, wingScore = 4206 },
    MASTER      = { minScore = 3990, wingScore = 4085 },
    DIAMOND     = { minScore = 3806, wingScore = 3898 },
    EMERALD     = { minScore = 3558, wingScore = 3682 },
    PLATINUM    = { minScore = 3194, wingScore = 3339 },
    GOLD        = { minScore = 2781, wingScore = 2986 },
    SILVER      = { minScore = 1602, wingScore = 2432 },
    BRONZE      = { minScore =  395, wingScore =  936 },
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
