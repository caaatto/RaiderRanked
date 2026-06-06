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
    top100Score = 4198,
    CHALLENGER  = { minScore = 4028, wingScore = 4084 },
    GRANDMASTER = { minScore = 3943, wingScore = 3986 },
    MASTER      = { minScore = 3812, wingScore = 3871 },
    DIAMOND     = { minScore = 3581, wingScore = 3675 },
    EMERALD     = { minScore = 3433, wingScore = 3496 },
    PLATINUM    = { minScore = 3136, wingScore = 3283 },
    GOLD        = { minScore = 2796, wingScore = 3006 },
    SILVER      = { minScore = 1767, wingScore = 2519 },
    BRONZE      = { minScore =  486, wingScore =  1052 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4198,
    CHALLENGER  = { minScore = 3969, wingScore = 4084 },
    GRANDMASTER = { minScore = 3923, wingScore = 3946 },
    MASTER      = { minScore = 3762, wingScore = 3842 },
    DIAMOND     = { minScore = 3625, wingScore = 3693 },
    EMERALD     = { minScore = 3443, wingScore = 3534 },
    PLATINUM    = { minScore = 3142, wingScore = 3268 },
    GOLD        = { minScore = 2796, wingScore = 2949 },
    SILVER      = { minScore = 1767, wingScore = 2519 },
    BRONZE      = { minScore =  486, wingScore =  1052 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4198,
    CHALLENGER  = { minScore = 4071, wingScore = 4084 },
    GRANDMASTER = { minScore = 4025, wingScore = 4048 },
    MASTER      = { minScore = 3866, wingScore = 3946 },
    DIAMOND     = { minScore = 3718, wingScore = 3792 },
    EMERALD     = { minScore = 3521, wingScore = 3620 },
    PLATINUM    = { minScore = 3192, wingScore = 3330 },
    GOLD        = { minScore = 2796, wingScore = 2991 },
    SILVER      = { minScore = 1767, wingScore = 2519 },
    BRONZE      = { minScore =  486, wingScore =  1052 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4140,
    CHALLENGER  = { minScore = 4008, wingScore = 4042 },
    GRANDMASTER = { minScore = 3898, wingScore = 3931 },
    MASTER      = { minScore = 3758, wingScore = 3806 },
    DIAMOND     = { minScore = 3501, wingScore = 3595 },
    EMERALD     = { minScore = 3377, wingScore = 3425 },
    PLATINUM    = { minScore = 3064, wingScore = 3184 },
    GOLD        = { minScore = 2704, wingScore = 2908 },
    SILVER      = { minScore = 1466, wingScore = 2309 },
    BRONZE      = { minScore =  361, wingScore =  856 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4140,
    CHALLENGER  = { minScore = 3906, wingScore = 4042 },
    GRANDMASTER = { minScore = 3853, wingScore = 3880 },
    MASTER      = { minScore = 3670, wingScore = 3762 },
    DIAMOND     = { minScore = 3531, wingScore = 3600 },
    EMERALD     = { minScore = 3345, wingScore = 3438 },
    PLATINUM    = { minScore = 3082, wingScore = 3184 },
    GOLD        = { minScore = 2704, wingScore = 2892 },
    SILVER      = { minScore = 1466, wingScore = 2309 },
    BRONZE      = { minScore =  361, wingScore =  856 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4140,
    CHALLENGER  = { minScore = 4032, wingScore = 4042 },
    GRANDMASTER = { minScore = 3982, wingScore = 4007 },
    MASTER      = { minScore = 3806, wingScore = 3894 },
    DIAMOND     = { minScore = 3654, wingScore = 3730 },
    EMERALD     = { minScore = 3453, wingScore = 3554 },
    PLATINUM    = { minScore = 3134, wingScore = 3265 },
    GOLD        = { minScore = 2704, wingScore = 2927 },
    SILVER      = { minScore = 1466, wingScore = 2309 },
    BRONZE      = { minScore =  361, wingScore =  856 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4198,
    CHALLENGER  = { minScore = 4020, wingScore = 4066 },
    GRANDMASTER = { minScore = 3924, wingScore = 3963 },
    MASTER      = { minScore = 3789, wingScore = 3844 },
    DIAMOND     = { minScore = 3548, wingScore = 3642 },
    EMERALD     = { minScore = 3410, wingScore = 3466 },
    PLATINUM    = { minScore = 3106, wingScore = 3242 },
    GOLD        = { minScore = 2758, wingScore = 2965 },
    SILVER      = { minScore = 1641, wingScore = 2431 },
    BRONZE      = { minScore =  434, wingScore =  970 },
    IRON        = { minScore =    1, wingScore =  220 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4198,
    CHALLENGER  = { minScore = 3943, wingScore = 4067 },
    GRANDMASTER = { minScore = 3895, wingScore = 3919 },
    MASTER      = { minScore = 3725, wingScore = 3809 },
    DIAMOND     = { minScore = 3587, wingScore = 3655 },
    EMERALD     = { minScore = 3403, wingScore = 3495 },
    PLATINUM    = { minScore = 3118, wingScore = 3234 },
    GOLD        = { minScore = 2759, wingScore = 2926 },
    SILVER      = { minScore = 1645, wingScore = 2434 },
    BRONZE      = { minScore =  435, wingScore =  972 },
    IRON        = { minScore =    1, wingScore =  221 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4198,
    CHALLENGER  = { minScore = 4054, wingScore = 4066 },
    GRANDMASTER = { minScore = 4007, wingScore = 4030 },
    MASTER      = { minScore = 3840, wingScore = 3924 },
    DIAMOND     = { minScore = 3691, wingScore = 3765 },
    EMERALD     = { minScore = 3492, wingScore = 3592 },
    PLATINUM    = { minScore = 3167, wingScore = 3302 },
    GOLD        = { minScore = 2756, wingScore = 2964 },
    SILVER      = { minScore = 1638, wingScore = 2429 },
    BRONZE      = { minScore =  432, wingScore =  968 },
    IRON        = { minScore =    1, wingScore =  219 },
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
