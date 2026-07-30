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
    top100Score = 4339,
    CHALLENGER  = { minScore = 4192, wingScore = 4249 },
    GRANDMASTER = { minScore = 4057, wingScore = 4114 },
    MASTER      = { minScore = 3942, wingScore = 4007 },
    DIAMOND     = { minScore = 3656, wingScore = 3769 },
    EMERALD     = { minScore = 3467, wingScore = 3548 },
    PLATINUM    = { minScore = 3169, wingScore = 3333 },
    GOLD        = { minScore = 2823, wingScore = 3018 },
    SILVER      = { minScore = 1736, wingScore = 2526 },
    BRONZE      = { minScore =  439, wingScore =  1019 },
    IRON        = { minScore =    1, wingScore =  237 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4339,
    CHALLENGER  = { minScore = 4080, wingScore = 4249 },
    GRANDMASTER = { minScore = 4035, wingScore = 4058 },
    MASTER      = { minScore = 3876, wingScore = 3956 },
    DIAMOND     = { minScore = 3720, wingScore = 3798 },
    EMERALD     = { minScore = 3511, wingScore = 3616 },
    PLATINUM    = { minScore = 3171, wingScore = 3313 },
    GOLD        = { minScore = 2823, wingScore = 2969 },
    SILVER      = { minScore = 1736, wingScore = 2526 },
    BRONZE      = { minScore =  439, wingScore =  1019 },
    IRON        = { minScore =    1, wingScore =  237 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4339,
    CHALLENGER  = { minScore = 4238, wingScore = 4249 },
    GRANDMASTER = { minScore = 4186, wingScore = 4212 },
    MASTER      = { minScore = 4002, wingScore = 4094 },
    DIAMOND     = { minScore = 3819, wingScore = 3910 },
    EMERALD     = { minScore = 3575, wingScore = 3697 },
    PLATINUM    = { minScore = 3217, wingScore = 3358 },
    GOLD        = { minScore = 2823, wingScore = 3016 },
    SILVER      = { minScore = 1736, wingScore = 2526 },
    BRONZE      = { minScore =  439, wingScore =  1019 },
    IRON        = { minScore =    1, wingScore =  237 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4298,
    CHALLENGER  = { minScore = 4164, wingScore = 4212 },
    GRANDMASTER = { minScore = 4024, wingScore = 4070 },
    MASTER      = { minScore = 3899, wingScore = 3954 },
    DIAMOND     = { minScore = 3562, wingScore = 3686 },
    EMERALD     = { minScore = 3417, wingScore = 3459 },
    PLATINUM    = { minScore = 3087, wingScore = 3229 },
    GOLD        = { minScore = 2725, wingScore = 2956 },
    SILVER      = { minScore = 1435, wingScore = 2311 },
    BRONZE      = { minScore =  348, wingScore =  832 },
    IRON        = { minScore =    1, wingScore =  180 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4298,
    CHALLENGER  = { minScore = 4026, wingScore = 4212 },
    GRANDMASTER = { minScore = 3974, wingScore = 4000 },
    MASTER      = { minScore = 3791, wingScore = 3882 },
    DIAMOND     = { minScore = 3632, wingScore = 3711 },
    EMERALD     = { minScore = 3420, wingScore = 3526 },
    PLATINUM    = { minScore = 3113, wingScore = 3234 },
    GOLD        = { minScore = 2725, wingScore = 2908 },
    SILVER      = { minScore = 1435, wingScore = 2311 },
    BRONZE      = { minScore =  348, wingScore =  832 },
    IRON        = { minScore =    1, wingScore =  180 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4298,
    CHALLENGER  = { minScore = 4208, wingScore = 4212 },
    GRANDMASTER = { minScore = 4152, wingScore = 4180 },
    MASTER      = { minScore = 3953, wingScore = 4052 },
    DIAMOND     = { minScore = 3772, wingScore = 3863 },
    EMERALD     = { minScore = 3531, wingScore = 3652 },
    PLATINUM    = { minScore = 3164, wingScore = 3312 },
    GOLD        = { minScore = 2725, wingScore = 2946 },
    SILVER      = { minScore = 1435, wingScore = 2311 },
    BRONZE      = { minScore =  348, wingScore =  832 },
    IRON        = { minScore =    1, wingScore =  180 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4339,
    CHALLENGER  = { minScore = 4180, wingScore = 4233 },
    GRANDMASTER = { minScore = 4043, wingScore = 4095 },
    MASTER      = { minScore = 3924, wingScore = 3985 },
    DIAMOND     = { minScore = 3616, wingScore = 3734 },
    EMERALD     = { minScore = 3446, wingScore = 3511 },
    PLATINUM    = { minScore = 3135, wingScore = 3289 },
    GOLD        = { minScore = 2782, wingScore = 2992 },
    SILVER      = { minScore = 1609, wingScore = 2436 },
    BRONZE      = { minScore =  401, wingScore =  940 },
    IRON        = { minScore =    1, wingScore =  213 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4339,
    CHALLENGER  = { minScore = 4058, wingScore = 4234 },
    GRANDMASTER = { minScore = 4010, wingScore = 4034 },
    MASTER      = { minScore = 3841, wingScore = 3926 },
    DIAMOND     = { minScore = 3684, wingScore = 3762 },
    EMERALD     = { minScore = 3474, wingScore = 3579 },
    PLATINUM    = { minScore = 3147, wingScore = 3281 },
    GOLD        = { minScore = 2783, wingScore = 2944 },
    SILVER      = { minScore = 1613, wingScore = 2438 },
    BRONZE      = { minScore =  402, wingScore =  942 },
    IRON        = { minScore =    1, wingScore =  214 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4339,
    CHALLENGER  = { minScore = 4225, wingScore = 4233 },
    GRANDMASTER = { minScore = 4171, wingScore = 4198 },
    MASTER      = { minScore = 3981, wingScore = 4076 },
    DIAMOND     = { minScore = 3799, wingScore = 3890 },
    EMERALD     = { minScore = 3556, wingScore = 3678 },
    PLATINUM    = { minScore = 3194, wingScore = 3338 },
    GOLD        = { minScore = 2781, wingScore = 2986 },
    SILVER      = { minScore = 1606, wingScore = 2433 },
    BRONZE      = { minScore =  400, wingScore =  938 },
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
