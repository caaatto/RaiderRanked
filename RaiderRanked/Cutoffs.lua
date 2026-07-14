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
    top100Score = 4317,
    CHALLENGER  = { minScore = 4141, wingScore = 4200 },
    GRANDMASTER = { minScore = 4028, wingScore = 4075 },
    MASTER      = { minScore = 3905, wingScore = 3956 },
    DIAMOND     = { minScore = 3645, wingScore = 3750 },
    EMERALD     = { minScore = 3464, wingScore = 3544 },
    PLATINUM    = { minScore = 3169, wingScore = 3328 },
    GOLD        = { minScore = 2825, wingScore = 3019 },
    SILVER      = { minScore = 1764, wingScore = 2538 },
    BRONZE      = { minScore =  454, wingScore =  1036 },
    IRON        = { minScore =    1, wingScore =  239 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4317,
    CHALLENGER  = { minScore = 4045, wingScore = 4200 },
    GRANDMASTER = { minScore = 3999, wingScore = 4022 },
    MASTER      = { minScore = 3835, wingScore = 3917 },
    DIAMOND     = { minScore = 3692, wingScore = 3764 },
    EMERALD     = { minScore = 3501, wingScore = 3596 },
    PLATINUM    = { minScore = 3171, wingScore = 3311 },
    GOLD        = { minScore = 2825, wingScore = 2970 },
    SILVER      = { minScore = 1764, wingScore = 2538 },
    BRONZE      = { minScore =  454, wingScore =  1036 },
    IRON        = { minScore =    1, wingScore =  239 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4317,
    CHALLENGER  = { minScore = 4190, wingScore = 4200 },
    GRANDMASTER = { minScore = 4138, wingScore = 4164 },
    MASTER      = { minScore = 3954, wingScore = 4046 },
    DIAMOND     = { minScore = 3786, wingScore = 3870 },
    EMERALD     = { minScore = 3563, wingScore = 3674 },
    PLATINUM    = { minScore = 3217, wingScore = 3357 },
    GOLD        = { minScore = 2825, wingScore = 3018 },
    SILVER      = { minScore = 1764, wingScore = 2538 },
    BRONZE      = { minScore =  454, wingScore =  1036 },
    IRON        = { minScore =    1, wingScore =  239 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4259,
    CHALLENGER  = { minScore = 4125, wingScore = 4167 },
    GRANDMASTER = { minScore = 4002, wingScore = 4031 },
    MASTER      = { minScore = 3862, wingScore = 3911 },
    DIAMOND     = { minScore = 3555, wingScore = 3672 },
    EMERALD     = { minScore = 3413, wingScore = 3455 },
    PLATINUM    = { minScore = 3087, wingScore = 3225 },
    GOLD        = { minScore = 2726, wingScore = 2955 },
    SILVER      = { minScore = 1459, wingScore = 2323 },
    BRONZE      = { minScore =  351, wingScore =  842 },
    IRON        = { minScore =    1, wingScore =  182 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4259,
    CHALLENGER  = { minScore = 4005, wingScore = 4167 },
    GRANDMASTER = { minScore = 3952, wingScore = 3978 },
    MASTER      = { minScore = 3765, wingScore = 3858 },
    DIAMOND     = { minScore = 3612, wingScore = 3689 },
    EMERALD     = { minScore = 3408, wingScore = 3510 },
    PLATINUM    = { minScore = 3110, wingScore = 3228 },
    GOLD        = { minScore = 2726, wingScore = 2909 },
    SILVER      = { minScore = 1459, wingScore = 2323 },
    BRONZE      = { minScore =  351, wingScore =  842 },
    IRON        = { minScore =    1, wingScore =  182 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4259,
    CHALLENGER  = { minScore = 4158, wingScore = 4167 },
    GRANDMASTER = { minScore = 4103, wingScore = 4130 },
    MASTER      = { minScore = 3911, wingScore = 4007 },
    DIAMOND     = { minScore = 3743, wingScore = 3827 },
    EMERALD     = { minScore = 3519, wingScore = 3631 },
    PLATINUM    = { minScore = 3164, wingScore = 3310 },
    GOLD        = { minScore = 2726, wingScore = 2946 },
    SILVER      = { minScore = 1459, wingScore = 2323 },
    BRONZE      = { minScore =  351, wingScore =  842 },
    IRON        = { minScore =    1, wingScore =  182 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4317,
    CHALLENGER  = { minScore = 4134, wingScore = 4186 },
    GRANDMASTER = { minScore = 4017, wingScore = 4057 },
    MASTER      = { minScore = 3887, wingScore = 3937 },
    DIAMOND     = { minScore = 3607, wingScore = 3717 },
    EMERALD     = { minScore = 3443, wingScore = 3507 },
    PLATINUM    = { minScore = 3135, wingScore = 3285 },
    GOLD        = { minScore = 2783, wingScore = 2992 },
    SILVER      = { minScore = 1636, wingScore = 2448 },
    BRONZE      = { minScore =  411, wingScore =  954 },
    IRON        = { minScore =    1, wingScore =  215 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4317,
    CHALLENGER  = { minScore = 4029, wingScore = 4186 },
    GRANDMASTER = { minScore = 3980, wingScore = 4004 },
    MASTER      = { minScore = 3806, wingScore = 3893 },
    DIAMOND     = { minScore = 3659, wingScore = 3733 },
    EMERALD     = { minScore = 3463, wingScore = 3561 },
    PLATINUM    = { minScore = 3146, wingScore = 3277 },
    GOLD        = { minScore = 2784, wingScore = 2945 },
    SILVER      = { minScore = 1639, wingScore = 2450 },
    BRONZE      = { minScore =  412, wingScore =  957 },
    IRON        = { minScore =    1, wingScore =  216 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4317,
    CHALLENGER  = { minScore = 4176, wingScore = 4186 },
    GRANDMASTER = { minScore = 4123, wingScore = 4149 },
    MASTER      = { minScore = 3935, wingScore = 4029 },
    DIAMOND     = { minScore = 3767, wingScore = 3851 },
    EMERALD     = { minScore = 3544, wingScore = 3655 },
    PLATINUM    = { minScore = 3194, wingScore = 3337 },
    GOLD        = { minScore = 2782, wingScore = 2987 },
    SILVER      = { minScore = 1632, wingScore = 2445 },
    BRONZE      = { minScore =  410, wingScore =  952 },
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
