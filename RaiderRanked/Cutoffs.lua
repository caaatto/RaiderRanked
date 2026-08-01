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
    top100Score = 4344,
    CHALLENGER  = { minScore = 4198, wingScore = 4251 },
    GRANDMASTER = { minScore = 4059, wingScore = 4116 },
    MASTER      = { minScore = 3950, wingScore = 4009 },
    DIAMOND     = { minScore = 3656, wingScore = 3771 },
    EMERALD     = { minScore = 3467, wingScore = 3548 },
    PLATINUM    = { minScore = 3169, wingScore = 3334 },
    GOLD        = { minScore = 2824, wingScore = 3018 },
    SILVER      = { minScore = 1734, wingScore = 2526 },
    BRONZE      = { minScore =  437, wingScore =  1018 },
    IRON        = { minScore =    1, wingScore =  236 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4344,
    CHALLENGER  = { minScore = 4082, wingScore = 4251 },
    GRANDMASTER = { minScore = 4037, wingScore = 4059 },
    MASTER      = { minScore = 3879, wingScore = 3958 },
    DIAMOND     = { minScore = 3722, wingScore = 3801 },
    EMERALD     = { minScore = 3512, wingScore = 3617 },
    PLATINUM    = { minScore = 3171, wingScore = 3313 },
    GOLD        = { minScore = 2824, wingScore = 2969 },
    SILVER      = { minScore = 1734, wingScore = 2526 },
    BRONZE      = { minScore =  437, wingScore =  1018 },
    IRON        = { minScore =    1, wingScore =  236 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4344,
    CHALLENGER  = { minScore = 4242, wingScore = 4251 },
    GRANDMASTER = { minScore = 4190, wingScore = 4216 },
    MASTER      = { minScore = 4008, wingScore = 4099 },
    DIAMOND     = { minScore = 3823, wingScore = 3915 },
    EMERALD     = { minScore = 3576, wingScore = 3700 },
    PLATINUM    = { minScore = 3217, wingScore = 3358 },
    GOLD        = { minScore = 2824, wingScore = 3016 },
    SILVER      = { minScore = 1734, wingScore = 2526 },
    BRONZE      = { minScore =  437, wingScore =  1018 },
    IRON        = { minScore =    1, wingScore =  236 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4299,
    CHALLENGER  = { minScore = 4171, wingScore = 4214 },
    GRANDMASTER = { minScore = 4025, wingScore = 4072 },
    MASTER      = { minScore = 3904, wingScore = 3958 },
    DIAMOND     = { minScore = 3563, wingScore = 3687 },
    EMERALD     = { minScore = 3417, wingScore = 3460 },
    PLATINUM    = { minScore = 3087, wingScore = 3230 },
    GOLD        = { minScore = 2725, wingScore = 2957 },
    SILVER      = { minScore = 1434, wingScore = 2310 },
    BRONZE      = { minScore =  348, wingScore =  831 },
    IRON        = { minScore =    1, wingScore =  180 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4299,
    CHALLENGER  = { minScore = 4027, wingScore = 4214 },
    GRANDMASTER = { minScore = 3975, wingScore = 4001 },
    MASTER      = { minScore = 3794, wingScore = 3885 },
    DIAMOND     = { minScore = 3635, wingScore = 3714 },
    EMERALD     = { minScore = 3422, wingScore = 3528 },
    PLATINUM    = { minScore = 3114, wingScore = 3235 },
    GOLD        = { minScore = 2725, wingScore = 2909 },
    SILVER      = { minScore = 1434, wingScore = 2310 },
    BRONZE      = { minScore =  348, wingScore =  831 },
    IRON        = { minScore =    1, wingScore =  180 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4299,
    CHALLENGER  = { minScore = 4211, wingScore = 4214 },
    GRANDMASTER = { minScore = 4154, wingScore = 4182 },
    MASTER      = { minScore = 3957, wingScore = 4055 },
    DIAMOND     = { minScore = 3775, wingScore = 3866 },
    EMERALD     = { minScore = 3532, wingScore = 3653 },
    PLATINUM    = { minScore = 3165, wingScore = 3312 },
    GOLD        = { minScore = 2725, wingScore = 2946 },
    SILVER      = { minScore = 1434, wingScore = 2310 },
    BRONZE      = { minScore =  348, wingScore =  831 },
    IRON        = { minScore =    1, wingScore =  180 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4344,
    CHALLENGER  = { minScore = 4187, wingScore = 4235 },
    GRANDMASTER = { minScore = 4045, wingScore = 4097 },
    MASTER      = { minScore = 3931, wingScore = 3988 },
    DIAMOND     = { minScore = 3617, wingScore = 3736 },
    EMERALD     = { minScore = 3446, wingScore = 3511 },
    PLATINUM    = { minScore = 3135, wingScore = 3290 },
    GOLD        = { minScore = 2782, wingScore = 2992 },
    SILVER      = { minScore = 1608, wingScore = 2435 },
    BRONZE      = { minScore =  400, wingScore =  939 },
    IRON        = { minScore =    1, wingScore =  212 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4344,
    CHALLENGER  = { minScore = 4059, wingScore = 4236 },
    GRANDMASTER = { minScore = 4012, wingScore = 4035 },
    MASTER      = { minScore = 3844, wingScore = 3928 },
    DIAMOND     = { minScore = 3686, wingScore = 3765 },
    EMERALD     = { minScore = 3475, wingScore = 3581 },
    PLATINUM    = { minScore = 3148, wingScore = 3281 },
    GOLD        = { minScore = 2783, wingScore = 2944 },
    SILVER      = { minScore = 1611, wingScore = 2437 },
    BRONZE      = { minScore =  401, wingScore =  941 },
    IRON        = { minScore =    1, wingScore =  213 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4344,
    CHALLENGER  = { minScore = 4229, wingScore = 4235 },
    GRANDMASTER = { minScore = 4174, wingScore = 4201 },
    MASTER      = { minScore = 3986, wingScore = 4080 },
    DIAMOND     = { minScore = 3802, wingScore = 3894 },
    EMERALD     = { minScore = 3557, wingScore = 3680 },
    PLATINUM    = { minScore = 3195, wingScore = 3338 },
    GOLD        = { minScore = 2781, wingScore = 2986 },
    SILVER      = { minScore = 1605, wingScore = 2433 },
    BRONZE      = { minScore =  399, wingScore =  937 },
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
