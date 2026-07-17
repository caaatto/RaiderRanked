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
    top100Score = 4319,
    CHALLENGER  = { minScore = 4150, wingScore = 4209 },
    GRANDMASTER = { minScore = 4033, wingScore = 4085 },
    MASTER      = { minScore = 3910, wingScore = 3967 },
    DIAMOND     = { minScore = 3648, wingScore = 3755 },
    EMERALD     = { minScore = 3465, wingScore = 3545 },
    PLATINUM    = { minScore = 3169, wingScore = 3329 },
    GOLD        = { minScore = 2825, wingScore = 3019 },
    SILVER      = { minScore = 1760, wingScore = 2537 },
    BRONZE      = { minScore =  448, wingScore =  1033 },
    IRON        = { minScore =    1, wingScore =  239 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4319,
    CHALLENGER  = { minScore = 4056, wingScore = 4209 },
    GRANDMASTER = { minScore = 4009, wingScore = 4032 },
    MASTER      = { minScore = 3843, wingScore = 3926 },
    DIAMOND     = { minScore = 3697, wingScore = 3770 },
    EMERALD     = { minScore = 3503, wingScore = 3600 },
    PLATINUM    = { minScore = 3171, wingScore = 3312 },
    GOLD        = { minScore = 2825, wingScore = 2970 },
    SILVER      = { minScore = 1760, wingScore = 2537 },
    BRONZE      = { minScore =  448, wingScore =  1033 },
    IRON        = { minScore =    1, wingScore =  239 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4319,
    CHALLENGER  = { minScore = 4199, wingScore = 4209 },
    GRANDMASTER = { minScore = 4147, wingScore = 4173 },
    MASTER      = { minScore = 3965, wingScore = 4056 },
    DIAMOND     = { minScore = 3794, wingScore = 3879 },
    EMERALD     = { minScore = 3566, wingScore = 3680 },
    PLATINUM    = { minScore = 3217, wingScore = 3358 },
    GOLD        = { minScore = 2825, wingScore = 3018 },
    SILVER      = { minScore = 1760, wingScore = 2537 },
    BRONZE      = { minScore =  448, wingScore =  1033 },
    IRON        = { minScore =    1, wingScore =  239 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4263,
    CHALLENGER  = { minScore = 4133, wingScore = 4179 },
    GRANDMASTER = { minScore = 4011, wingScore = 4041 },
    MASTER      = { minScore = 3872, wingScore = 3919 },
    DIAMOND     = { minScore = 3557, wingScore = 3675 },
    EMERALD     = { minScore = 3414, wingScore = 3456 },
    PLATINUM    = { minScore = 3087, wingScore = 3226 },
    GOLD        = { minScore = 2727, wingScore = 2955 },
    SILVER      = { minScore = 1456, wingScore = 2322 },
    BRONZE      = { minScore =  350, wingScore =  840 },
    IRON        = { minScore =    1, wingScore =  181 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4263,
    CHALLENGER  = { minScore = 4012, wingScore = 4179 },
    GRANDMASTER = { minScore = 3958, wingScore = 3985 },
    MASTER      = { minScore = 3772, wingScore = 3865 },
    DIAMOND     = { minScore = 3617, wingScore = 3694 },
    EMERALD     = { minScore = 3411, wingScore = 3514 },
    PLATINUM    = { minScore = 3111, wingScore = 3229 },
    GOLD        = { minScore = 2727, wingScore = 2909 },
    SILVER      = { minScore = 1456, wingScore = 2322 },
    BRONZE      = { minScore =  350, wingScore =  840 },
    IRON        = { minScore =    1, wingScore =  181 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4263,
    CHALLENGER  = { minScore = 4167, wingScore = 4179 },
    GRANDMASTER = { minScore = 4112, wingScore = 4140 },
    MASTER      = { minScore = 3919, wingScore = 4016 },
    DIAMOND     = { minScore = 3749, wingScore = 3834 },
    EMERALD     = { minScore = 3522, wingScore = 3635 },
    PLATINUM    = { minScore = 3164, wingScore = 3310 },
    GOLD        = { minScore = 2727, wingScore = 2947 },
    SILVER      = { minScore = 1456, wingScore = 2322 },
    BRONZE      = { minScore =  350, wingScore =  840 },
    IRON        = { minScore =    1, wingScore =  181 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4319,
    CHALLENGER  = { minScore = 4143, wingScore = 4196 },
    GRANDMASTER = { minScore = 4024, wingScore = 4067 },
    MASTER      = { minScore = 3894, wingScore = 3947 },
    DIAMOND     = { minScore = 3610, wingScore = 3721 },
    EMERALD     = { minScore = 3444, wingScore = 3508 },
    PLATINUM    = { minScore = 3135, wingScore = 3286 },
    GOLD        = { minScore = 2784, wingScore = 2992 },
    SILVER      = { minScore = 1632, wingScore = 2447 },
    BRONZE      = { minScore =  407, wingScore =  952 },
    IRON        = { minScore =    1, wingScore =  215 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4319,
    CHALLENGER  = { minScore = 4038, wingScore = 4197 },
    GRANDMASTER = { minScore = 3988, wingScore = 4013 },
    MASTER      = { minScore = 3814, wingScore = 3901 },
    DIAMOND     = { minScore = 3664, wingScore = 3739 },
    EMERALD     = { minScore = 3465, wingScore = 3565 },
    PLATINUM    = { minScore = 3146, wingScore = 3278 },
    GOLD        = { minScore = 2785, wingScore = 2945 },
    SILVER      = { minScore = 1635, wingScore = 2449 },
    BRONZE      = { minScore =  408, wingScore =  954 },
    IRON        = { minScore =    1, wingScore =  215 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4319,
    CHALLENGER  = { minScore = 4185, wingScore = 4196 },
    GRANDMASTER = { minScore = 4132, wingScore = 4159 },
    MASTER      = { minScore = 3945, wingScore = 4039 },
    DIAMOND     = { minScore = 3775, wingScore = 3860 },
    EMERALD     = { minScore = 3547, wingScore = 3661 },
    PLATINUM    = { minScore = 3194, wingScore = 3337 },
    GOLD        = { minScore = 2783, wingScore = 2987 },
    SILVER      = { minScore = 1629, wingScore = 2444 },
    BRONZE      = { minScore =  406, wingScore =  950 },
    IRON        = { minScore =    1, wingScore =  214 },
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
