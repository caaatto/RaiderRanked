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
    top100Score = 4318,
    CHALLENGER  = { minScore = 4146, wingScore = 4205 },
    GRANDMASTER = { minScore = 4030, wingScore = 4079 },
    MASTER      = { minScore = 3907, wingScore = 3960 },
    DIAMOND     = { minScore = 3646, wingScore = 3751 },
    EMERALD     = { minScore = 3464, wingScore = 3545 },
    PLATINUM    = { minScore = 3169, wingScore = 3328 },
    GOLD        = { minScore = 2825, wingScore = 3019 },
    SILVER      = { minScore = 1760, wingScore = 2536 },
    BRONZE      = { minScore =  448, wingScore =  1033 },
    IRON        = { minScore =    1, wingScore =  239 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4318,
    CHALLENGER  = { minScore = 4048, wingScore = 4205 },
    GRANDMASTER = { minScore = 4001, wingScore = 4025 },
    MASTER      = { minScore = 3837, wingScore = 3919 },
    DIAMOND     = { minScore = 3693, wingScore = 3765 },
    EMERALD     = { minScore = 3501, wingScore = 3597 },
    PLATINUM    = { minScore = 3171, wingScore = 3311 },
    GOLD        = { minScore = 2825, wingScore = 2969 },
    SILVER      = { minScore = 1760, wingScore = 2536 },
    BRONZE      = { minScore =  448, wingScore =  1033 },
    IRON        = { minScore =    1, wingScore =  239 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4318,
    CHALLENGER  = { minScore = 4193, wingScore = 4205 },
    GRANDMASTER = { minScore = 4141, wingScore = 4167 },
    MASTER      = { minScore = 3956, wingScore = 4048 },
    DIAMOND     = { minScore = 3788, wingScore = 3872 },
    EMERALD     = { minScore = 3563, wingScore = 3675 },
    PLATINUM    = { minScore = 3217, wingScore = 3357 },
    GOLD        = { minScore = 2825, wingScore = 3018 },
    SILVER      = { minScore = 1760, wingScore = 2536 },
    BRONZE      = { minScore =  448, wingScore =  1033 },
    IRON        = { minScore =    1, wingScore =  239 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4259,
    CHALLENGER  = { minScore = 4130, wingScore = 4171 },
    GRANDMASTER = { minScore = 4007, wingScore = 4035 },
    MASTER      = { minScore = 3865, wingScore = 3913 },
    DIAMOND     = { minScore = 3555, wingScore = 3673 },
    EMERALD     = { minScore = 3413, wingScore = 3455 },
    PLATINUM    = { minScore = 3087, wingScore = 3225 },
    GOLD        = { minScore = 2726, wingScore = 2954 },
    SILVER      = { minScore = 1456, wingScore = 2322 },
    BRONZE      = { minScore =  350, wingScore =  840 },
    IRON        = { minScore =    1, wingScore =  181 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4259,
    CHALLENGER  = { minScore = 4007, wingScore = 4171 },
    GRANDMASTER = { minScore = 3954, wingScore = 3981 },
    MASTER      = { minScore = 3767, wingScore = 3860 },
    DIAMOND     = { minScore = 3613, wingScore = 3690 },
    EMERALD     = { minScore = 3409, wingScore = 3511 },
    PLATINUM    = { minScore = 3110, wingScore = 3228 },
    GOLD        = { minScore = 2726, wingScore = 2909 },
    SILVER      = { minScore = 1456, wingScore = 2322 },
    BRONZE      = { minScore =  350, wingScore =  840 },
    IRON        = { minScore =    1, wingScore =  181 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4259,
    CHALLENGER  = { minScore = 4163, wingScore = 4171 },
    GRANDMASTER = { minScore = 4108, wingScore = 4136 },
    MASTER      = { minScore = 3913, wingScore = 4010 },
    DIAMOND     = { minScore = 3745, wingScore = 3829 },
    EMERALD     = { minScore = 3520, wingScore = 3632 },
    PLATINUM    = { minScore = 3164, wingScore = 3310 },
    GOLD        = { minScore = 2726, wingScore = 2946 },
    SILVER      = { minScore = 1456, wingScore = 2322 },
    BRONZE      = { minScore =  350, wingScore =  840 },
    IRON        = { minScore =    1, wingScore =  181 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4318,
    CHALLENGER  = { minScore = 4139, wingScore = 4191 },
    GRANDMASTER = { minScore = 4020, wingScore = 4061 },
    MASTER      = { minScore = 3889, wingScore = 3940 },
    DIAMOND     = { minScore = 3608, wingScore = 3718 },
    EMERALD     = { minScore = 3443, wingScore = 3507 },
    PLATINUM    = { minScore = 3135, wingScore = 3285 },
    GOLD        = { minScore = 2783, wingScore = 2992 },
    SILVER      = { minScore = 1632, wingScore = 2446 },
    BRONZE      = { minScore =  407, wingScore =  952 },
    IRON        = { minScore =    1, wingScore =  215 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4318,
    CHALLENGER  = { minScore = 4031, wingScore = 4191 },
    GRANDMASTER = { minScore = 3982, wingScore = 4007 },
    MASTER      = { minScore = 3808, wingScore = 3895 },
    DIAMOND     = { minScore = 3660, wingScore = 3734 },
    EMERALD     = { minScore = 3463, wingScore = 3562 },
    PLATINUM    = { minScore = 3146, wingScore = 3277 },
    GOLD        = { minScore = 2784, wingScore = 2944 },
    SILVER      = { minScore = 1635, wingScore = 2448 },
    BRONZE      = { minScore =  408, wingScore =  954 },
    IRON        = { minScore =    1, wingScore =  215 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4318,
    CHALLENGER  = { minScore = 4180, wingScore = 4190 },
    GRANDMASTER = { minScore = 4127, wingScore = 4154 },
    MASTER      = { minScore = 3937, wingScore = 4032 },
    DIAMOND     = { minScore = 3769, wingScore = 3853 },
    EMERALD     = { minScore = 3544, wingScore = 3656 },
    PLATINUM    = { minScore = 3194, wingScore = 3337 },
    GOLD        = { minScore = 2782, wingScore = 2987 },
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
