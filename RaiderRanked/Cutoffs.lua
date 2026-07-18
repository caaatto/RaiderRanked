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
    top100Score = 4320,
    CHALLENGER  = { minScore = 4155, wingScore = 4212 },
    GRANDMASTER = { minScore = 4037, wingScore = 4087 },
    MASTER      = { minScore = 3912, wingScore = 3969 },
    DIAMOND     = { minScore = 3649, wingScore = 3757 },
    EMERALD     = { minScore = 3465, wingScore = 3546 },
    PLATINUM    = { minScore = 3170, wingScore = 3330 },
    GOLD        = { minScore = 2826, wingScore = 3019 },
    SILVER      = { minScore = 1760, wingScore = 2537 },
    BRONZE      = { minScore =  449, wingScore =  1033 },
    IRON        = { minScore =    1, wingScore =  239 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4320,
    CHALLENGER  = { minScore = 4058, wingScore = 4212 },
    GRANDMASTER = { minScore = 4011, wingScore = 4034 },
    MASTER      = { minScore = 3847, wingScore = 3929 },
    DIAMOND     = { minScore = 3700, wingScore = 3773 },
    EMERALD     = { minScore = 3504, wingScore = 3602 },
    PLATINUM    = { minScore = 3171, wingScore = 3312 },
    GOLD        = { minScore = 2826, wingScore = 2970 },
    SILVER      = { minScore = 1760, wingScore = 2537 },
    BRONZE      = { minScore =  449, wingScore =  1033 },
    IRON        = { minScore =    1, wingScore =  239 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4320,
    CHALLENGER  = { minScore = 4205, wingScore = 4212 },
    GRANDMASTER = { minScore = 4152, wingScore = 4178 },
    MASTER      = { minScore = 3967, wingScore = 4059 },
    DIAMOND     = { minScore = 3795, wingScore = 3881 },
    EMERALD     = { minScore = 3566, wingScore = 3681 },
    PLATINUM    = { minScore = 3217, wingScore = 3358 },
    GOLD        = { minScore = 2826, wingScore = 3019 },
    SILVER      = { minScore = 1760, wingScore = 2537 },
    BRONZE      = { minScore =  449, wingScore =  1033 },
    IRON        = { minScore =    1, wingScore =  239 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4268,
    CHALLENGER  = { minScore = 4134, wingScore = 4181 },
    GRANDMASTER = { minScore = 4011, wingScore = 4043 },
    MASTER      = { minScore = 3877, wingScore = 3922 },
    DIAMOND     = { minScore = 3557, wingScore = 3676 },
    EMERALD     = { minScore = 3414, wingScore = 3456 },
    PLATINUM    = { minScore = 3087, wingScore = 3227 },
    GOLD        = { minScore = 2727, wingScore = 2956 },
    SILVER      = { minScore = 1455, wingScore = 2322 },
    BRONZE      = { minScore =  350, wingScore =  840 },
    IRON        = { minScore =    1, wingScore =  181 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4268,
    CHALLENGER  = { minScore = 4012, wingScore = 4181 },
    GRANDMASTER = { minScore = 3959, wingScore = 3986 },
    MASTER      = { minScore = 3773, wingScore = 3866 },
    DIAMOND     = { minScore = 3618, wingScore = 3695 },
    EMERALD     = { minScore = 3412, wingScore = 3515 },
    PLATINUM    = { minScore = 3111, wingScore = 3230 },
    GOLD        = { minScore = 2727, wingScore = 2909 },
    SILVER      = { minScore = 1455, wingScore = 2322 },
    BRONZE      = { minScore =  350, wingScore =  840 },
    IRON        = { minScore =    1, wingScore =  181 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4268,
    CHALLENGER  = { minScore = 4172, wingScore = 4181 },
    GRANDMASTER = { minScore = 4116, wingScore = 4144 },
    MASTER      = { minScore = 3921, wingScore = 4019 },
    DIAMOND     = { minScore = 3750, wingScore = 3836 },
    EMERALD     = { minScore = 3522, wingScore = 3636 },
    PLATINUM    = { minScore = 3164, wingScore = 3311 },
    GOLD        = { minScore = 2727, wingScore = 2947 },
    SILVER      = { minScore = 1455, wingScore = 2322 },
    BRONZE      = { minScore =  350, wingScore =  840 },
    IRON        = { minScore =    1, wingScore =  181 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4320,
    CHALLENGER  = { minScore = 4146, wingScore = 4199 },
    GRANDMASTER = { minScore = 4026, wingScore = 4069 },
    MASTER      = { minScore = 3897, wingScore = 3949 },
    DIAMOND     = { minScore = 3610, wingScore = 3723 },
    EMERALD     = { minScore = 3444, wingScore = 3508 },
    PLATINUM    = { minScore = 3135, wingScore = 3287 },
    GOLD        = { minScore = 2784, wingScore = 2993 },
    SILVER      = { minScore = 1632, wingScore = 2447 },
    BRONZE      = { minScore =  407, wingScore =  952 },
    IRON        = { minScore =    1, wingScore =  215 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4320,
    CHALLENGER  = { minScore = 4039, wingScore = 4199 },
    GRANDMASTER = { minScore = 3990, wingScore = 4014 },
    MASTER      = { minScore = 3817, wingScore = 3903 },
    DIAMOND     = { minScore = 3666, wingScore = 3741 },
    EMERALD     = { minScore = 3466, wingScore = 3566 },
    PLATINUM    = { minScore = 3146, wingScore = 3278 },
    GOLD        = { minScore = 2785, wingScore = 2945 },
    SILVER      = { minScore = 1635, wingScore = 2449 },
    BRONZE      = { minScore =  408, wingScore =  954 },
    IRON        = { minScore =    1, wingScore =  215 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4320,
    CHALLENGER  = { minScore = 4191, wingScore = 4199 },
    GRANDMASTER = { minScore = 4136, wingScore = 4163 },
    MASTER      = { minScore = 3947, wingScore = 4042 },
    DIAMOND     = { minScore = 3776, wingScore = 3862 },
    EMERALD     = { minScore = 3547, wingScore = 3662 },
    PLATINUM    = { minScore = 3194, wingScore = 3338 },
    GOLD        = { minScore = 2783, wingScore = 2988 },
    SILVER      = { minScore = 1628, wingScore = 2444 },
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
