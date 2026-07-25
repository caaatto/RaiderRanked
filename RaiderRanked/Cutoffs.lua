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
    top100Score = 4334,
    CHALLENGER  = { minScore = 4179, wingScore = 4236 },
    GRANDMASTER = { minScore = 4050, wingScore = 4103 },
    MASTER      = { minScore = 3928, wingScore = 3992 },
    DIAMOND     = { minScore = 3654, wingScore = 3764 },
    EMERALD     = { minScore = 3467, wingScore = 3548 },
    PLATINUM    = { minScore = 3170, wingScore = 3332 },
    GOLD        = { minScore = 2825, wingScore = 3019 },
    SILVER      = { minScore = 1748, wingScore = 2533 },
    BRONZE      = { minScore =  440, wingScore =  1026 },
    IRON        = { minScore =    1, wingScore =  237 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4334,
    CHALLENGER  = { minScore = 4072, wingScore = 4236 },
    GRANDMASTER = { minScore = 4026, wingScore = 4049 },
    MASTER      = { minScore = 3865, wingScore = 3946 },
    DIAMOND     = { minScore = 3712, wingScore = 3789 },
    EMERALD     = { minScore = 3509, wingScore = 3610 },
    PLATINUM    = { minScore = 3172, wingScore = 3313 },
    GOLD        = { minScore = 2825, wingScore = 2970 },
    SILVER      = { minScore = 1748, wingScore = 2533 },
    BRONZE      = { minScore =  440, wingScore =  1026 },
    IRON        = { minScore =    1, wingScore =  237 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4334,
    CHALLENGER  = { minScore = 4224, wingScore = 4236 },
    GRANDMASTER = { minScore = 4171, wingScore = 4198 },
    MASTER      = { minScore = 3986, wingScore = 4079 },
    DIAMOND     = { minScore = 3808, wingScore = 3897 },
    EMERALD     = { minScore = 3571, wingScore = 3690 },
    PLATINUM    = { minScore = 3218, wingScore = 3359 },
    GOLD        = { minScore = 2825, wingScore = 3018 },
    SILVER      = { minScore = 1748, wingScore = 2533 },
    BRONZE      = { minScore =  440, wingScore =  1026 },
    IRON        = { minScore =    1, wingScore =  237 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4286,
    CHALLENGER  = { minScore = 4148, wingScore = 4205 },
    GRANDMASTER = { minScore = 4018, wingScore = 4059 },
    MASTER      = { minScore = 3893, wingScore = 3940 },
    DIAMOND     = { minScore = 3560, wingScore = 3683 },
    EMERALD     = { minScore = 3416, wingScore = 3458 },
    PLATINUM    = { minScore = 3087, wingScore = 3228 },
    GOLD        = { minScore = 2726, wingScore = 2956 },
    SILVER      = { minScore = 1445, wingScore = 2317 },
    BRONZE      = { minScore =  348, wingScore =  835 },
    IRON        = { minScore =    1, wingScore =  180 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4286,
    CHALLENGER  = { minScore = 4019, wingScore = 4205 },
    GRANDMASTER = { minScore = 3966, wingScore = 3993 },
    MASTER      = { minScore = 3781, wingScore = 3874 },
    DIAMOND     = { minScore = 3625, wingScore = 3703 },
    EMERALD     = { minScore = 3416, wingScore = 3521 },
    PLATINUM    = { minScore = 3113, wingScore = 3232 },
    GOLD        = { minScore = 2726, wingScore = 2909 },
    SILVER      = { minScore = 1445, wingScore = 2317 },
    BRONZE      = { minScore =  348, wingScore =  835 },
    IRON        = { minScore =    1, wingScore =  180 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4286,
    CHALLENGER  = { minScore = 4195, wingScore = 4205 },
    GRANDMASTER = { minScore = 4138, wingScore = 4166 },
    MASTER      = { minScore = 3939, wingScore = 4039 },
    DIAMOND     = { minScore = 3763, wingScore = 3851 },
    EMERALD     = { minScore = 3527, wingScore = 3645 },
    PLATINUM    = { minScore = 3165, wingScore = 3311 },
    GOLD        = { minScore = 2726, wingScore = 2947 },
    SILVER      = { minScore = 1445, wingScore = 2317 },
    BRONZE      = { minScore =  348, wingScore =  835 },
    IRON        = { minScore =    1, wingScore =  180 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4334,
    CHALLENGER  = { minScore = 4166, wingScore = 4223 },
    GRANDMASTER = { minScore = 4037, wingScore = 4084 },
    MASTER      = { minScore = 3913, wingScore = 3970 },
    DIAMOND     = { minScore = 3614, wingScore = 3730 },
    EMERALD     = { minScore = 3446, wingScore = 3510 },
    PLATINUM    = { minScore = 3135, wingScore = 3288 },
    GOLD        = { minScore = 2783, wingScore = 2993 },
    SILVER      = { minScore = 1621, wingScore = 2442 },
    BRONZE      = { minScore =  401, wingScore =  946 },
    IRON        = { minScore =    1, wingScore =  213 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4334,
    CHALLENGER  = { minScore = 4050, wingScore = 4223 },
    GRANDMASTER = { minScore = 4001, wingScore = 4026 },
    MASTER      = { minScore = 3831, wingScore = 3916 },
    DIAMOND     = { minScore = 3676, wingScore = 3754 },
    EMERALD     = { minScore = 3471, wingScore = 3574 },
    PLATINUM    = { minScore = 3148, wingScore = 3280 },
    GOLD        = { minScore = 2784, wingScore = 2945 },
    SILVER      = { minScore = 1624, wingScore = 2444 },
    BRONZE      = { minScore =  402, wingScore =  948 },
    IRON        = { minScore =    1, wingScore =  214 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4334,
    CHALLENGER  = { minScore = 4211, wingScore = 4223 },
    GRANDMASTER = { minScore = 4157, wingScore = 4184 },
    MASTER      = { minScore = 3966, wingScore = 4062 },
    DIAMOND     = { minScore = 3789, wingScore = 3877 },
    EMERALD     = { minScore = 3552, wingScore = 3671 },
    PLATINUM    = { minScore = 3195, wingScore = 3338 },
    GOLD        = { minScore = 2782, wingScore = 2987 },
    SILVER      = { minScore = 1617, wingScore = 2440 },
    BRONZE      = { minScore =  400, wingScore =  944 },
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
