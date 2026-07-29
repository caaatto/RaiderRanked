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
    top100Score = 4338,
    CHALLENGER  = { minScore = 4190, wingScore = 4246 },
    GRANDMASTER = { minScore = 4057, wingScore = 4113 },
    MASTER      = { minScore = 3940, wingScore = 4003 },
    DIAMOND     = { minScore = 3655, wingScore = 3769 },
    EMERALD     = { minScore = 3467, wingScore = 3548 },
    PLATINUM    = { minScore = 3169, wingScore = 3333 },
    GOLD        = { minScore = 2823, wingScore = 3018 },
    SILVER      = { minScore = 1735, wingScore = 2526 },
    BRONZE      = { minScore =  440, wingScore =  1019 },
    IRON        = { minScore =    1, wingScore =  237 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4338,
    CHALLENGER  = { minScore = 4079, wingScore = 4246 },
    GRANDMASTER = { minScore = 4033, wingScore = 4056 },
    MASTER      = { minScore = 3874, wingScore = 3954 },
    DIAMOND     = { minScore = 3719, wingScore = 3796 },
    EMERALD     = { minScore = 3511, wingScore = 3615 },
    PLATINUM    = { minScore = 3171, wingScore = 3313 },
    GOLD        = { minScore = 2823, wingScore = 2969 },
    SILVER      = { minScore = 1735, wingScore = 2526 },
    BRONZE      = { minScore =  440, wingScore =  1019 },
    IRON        = { minScore =    1, wingScore =  237 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4338,
    CHALLENGER  = { minScore = 4236, wingScore = 4246 },
    GRANDMASTER = { minScore = 4184, wingScore = 4210 },
    MASTER      = { minScore = 4000, wingScore = 4092 },
    DIAMOND     = { minScore = 3818, wingScore = 3909 },
    EMERALD     = { minScore = 3574, wingScore = 3696 },
    PLATINUM    = { minScore = 3217, wingScore = 3358 },
    GOLD        = { minScore = 2823, wingScore = 3016 },
    SILVER      = { minScore = 1735, wingScore = 2526 },
    BRONZE      = { minScore =  440, wingScore =  1019 },
    IRON        = { minScore =    1, wingScore =  237 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4298,
    CHALLENGER  = { minScore = 4161, wingScore = 4211 },
    GRANDMASTER = { minScore = 4024, wingScore = 4068 },
    MASTER      = { minScore = 3897, wingScore = 3953 },
    DIAMOND     = { minScore = 3561, wingScore = 3686 },
    EMERALD     = { minScore = 3416, wingScore = 3459 },
    PLATINUM    = { minScore = 3087, wingScore = 3229 },
    GOLD        = { minScore = 2725, wingScore = 2955 },
    SILVER      = { minScore = 1435, wingScore = 2311 },
    BRONZE      = { minScore =  349, wingScore =  832 },
    IRON        = { minScore =    1, wingScore =  181 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4298,
    CHALLENGER  = { minScore = 4026, wingScore = 4211 },
    GRANDMASTER = { minScore = 3973, wingScore = 4000 },
    MASTER      = { minScore = 3789, wingScore = 3881 },
    DIAMOND     = { minScore = 3631, wingScore = 3710 },
    EMERALD     = { minScore = 3420, wingScore = 3525 },
    PLATINUM    = { minScore = 3113, wingScore = 3234 },
    GOLD        = { minScore = 2725, wingScore = 2908 },
    SILVER      = { minScore = 1435, wingScore = 2311 },
    BRONZE      = { minScore =  349, wingScore =  832 },
    IRON        = { minScore =    1, wingScore =  181 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4298,
    CHALLENGER  = { minScore = 4207, wingScore = 4211 },
    GRANDMASTER = { minScore = 4151, wingScore = 4179 },
    MASTER      = { minScore = 3952, wingScore = 4051 },
    DIAMOND     = { minScore = 3771, wingScore = 3862 },
    EMERALD     = { minScore = 3530, wingScore = 3651 },
    PLATINUM    = { minScore = 3164, wingScore = 3312 },
    GOLD        = { minScore = 2725, wingScore = 2945 },
    SILVER      = { minScore = 1435, wingScore = 2311 },
    BRONZE      = { minScore =  349, wingScore =  832 },
    IRON        = { minScore =    1, wingScore =  181 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4338,
    CHALLENGER  = { minScore = 4178, wingScore = 4231 },
    GRANDMASTER = { minScore = 4043, wingScore = 4094 },
    MASTER      = { minScore = 3922, wingScore = 3982 },
    DIAMOND     = { minScore = 3615, wingScore = 3734 },
    EMERALD     = { minScore = 3446, wingScore = 3511 },
    PLATINUM    = { minScore = 3135, wingScore = 3289 },
    GOLD        = { minScore = 2782, wingScore = 2991 },
    SILVER      = { minScore = 1609, wingScore = 2436 },
    BRONZE      = { minScore =  402, wingScore =  940 },
    IRON        = { minScore =    1, wingScore =  213 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4338,
    CHALLENGER  = { minScore = 4057, wingScore = 4232 },
    GRANDMASTER = { minScore = 4008, wingScore = 4033 },
    MASTER      = { minScore = 3839, wingScore = 3924 },
    DIAMOND     = { minScore = 3683, wingScore = 3761 },
    EMERALD     = { minScore = 3474, wingScore = 3578 },
    PLATINUM    = { minScore = 3147, wingScore = 3281 },
    GOLD        = { minScore = 2783, wingScore = 2944 },
    SILVER      = { minScore = 1612, wingScore = 2438 },
    BRONZE      = { minScore =  403, wingScore =  942 },
    IRON        = { minScore =    1, wingScore =  214 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4338,
    CHALLENGER  = { minScore = 4223, wingScore = 4231 },
    GRANDMASTER = { minScore = 4170, wingScore = 4197 },
    MASTER      = { minScore = 3979, wingScore = 4074 },
    DIAMOND     = { minScore = 3798, wingScore = 3889 },
    EMERALD     = { minScore = 3555, wingScore = 3677 },
    PLATINUM    = { minScore = 3194, wingScore = 3338 },
    GOLD        = { minScore = 2781, wingScore = 2985 },
    SILVER      = { minScore = 1606, wingScore = 2433 },
    BRONZE      = { minScore =  401, wingScore =  938 },
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
