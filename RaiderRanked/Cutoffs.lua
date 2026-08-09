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
-- All 9 slots carry their own computed snapshot. The addon reads the
-- active slot at login via RR:ApplyCutoffSelection(); the selection
-- itself lives in db.cutoffRegion / db.cutoffFaction.

local ADDON_NAME, RR = ...

RR.CUTOFFS = { us = {}, eu = {}, all = {} }

RR.CUTOFFS.eu.all = {
    top100Score = 4350,
    CHALLENGER  = { minScore = 4222, wingScore = 4255 },
    GRANDMASTER = { minScore = 4064, wingScore = 4119 },
    MASTER      = { minScore = 3983, wingScore = 4016 },
    DIAMOND     = { minScore = 3657, wingScore = 3774 },
    EMERALD     = { minScore = 3467, wingScore = 3548 },
    PLATINUM    = { minScore = 3168, wingScore = 3337 },
    GOLD        = { minScore = 2823, wingScore = 3018 },
    SILVER      = { minScore = 1724, wingScore = 2521 },
    BRONZE      = { minScore =  423, wingScore =  1011 },
    IRON        = { minScore =    1, wingScore =  230 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4350,
    CHALLENGER  = { minScore = 4087, wingScore = 4255 },
    GRANDMASTER = { minScore = 4044, wingScore = 4066 },
    MASTER      = { minScore = 3894, wingScore = 3969 },
    DIAMOND     = { minScore = 3732, wingScore = 3813 },
    EMERALD     = { minScore = 3516, wingScore = 3624 },
    PLATINUM    = { minScore = 3171, wingScore = 3314 },
    GOLD        = { minScore = 2823, wingScore = 2968 },
    SILVER      = { minScore = 1724, wingScore = 2521 },
    BRONZE      = { minScore =  423, wingScore =  1011 },
    IRON        = { minScore =    1, wingScore =  230 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4350,
    CHALLENGER  = { minScore = 4253, wingScore = 4255 },
    GRANDMASTER = { minScore = 4200, wingScore = 4227 },
    MASTER      = { minScore = 4015, wingScore = 4107 },
    DIAMOND     = { minScore = 3827, wingScore = 3921 },
    EMERALD     = { minScore = 3578, wingScore = 3702 },
    PLATINUM    = { minScore = 3215, wingScore = 3358 },
    GOLD        = { minScore = 2823, wingScore = 3015 },
    SILVER      = { minScore = 1724, wingScore = 2521 },
    BRONZE      = { minScore =  423, wingScore =  1011 },
    IRON        = { minScore =    1, wingScore =  230 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4312,
    CHALLENGER  = { minScore = 4198, wingScore = 4226 },
    GRANDMASTER = { minScore = 4030, wingScore = 4076 },
    MASTER      = { minScore = 3935, wingScore = 3979 },
    DIAMOND     = { minScore = 3564, wingScore = 3692 },
    EMERALD     = { minScore = 3419, wingScore = 3461 },
    PLATINUM    = { minScore = 3087, wingScore = 3233 },
    GOLD        = { minScore = 2725, wingScore = 2960 },
    SILVER      = { minScore = 1425, wingScore = 2306 },
    BRONZE      = { minScore =  343, wingScore =  825 },
    IRON        = { minScore =    1, wingScore =  177 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4312,
    CHALLENGER  = { minScore = 4031, wingScore = 4226 },
    GRANDMASTER = { minScore = 3982, wingScore = 4006 },
    MASTER      = { minScore = 3808, wingScore = 3895 },
    DIAMOND     = { minScore = 3647, wingScore = 3728 },
    EMERALD     = { minScore = 3431, wingScore = 3539 },
    PLATINUM    = { minScore = 3117, wingScore = 3241 },
    GOLD        = { minScore = 2725, wingScore = 2909 },
    SILVER      = { minScore = 1425, wingScore = 2306 },
    BRONZE      = { minScore =  343, wingScore =  825 },
    IRON        = { minScore =    1, wingScore =  177 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4312,
    CHALLENGER  = { minScore = 4223, wingScore = 4226 },
    GRANDMASTER = { minScore = 4168, wingScore = 4195 },
    MASTER      = { minScore = 3977, wingScore = 4073 },
    DIAMOND     = { minScore = 3789, wingScore = 3883 },
    EMERALD     = { minScore = 3538, wingScore = 3663 },
    PLATINUM    = { minScore = 3165, wingScore = 3313 },
    GOLD        = { minScore = 2725, wingScore = 2945 },
    SILVER      = { minScore = 1425, wingScore = 2306 },
    BRONZE      = { minScore =  343, wingScore =  825 },
    IRON        = { minScore =    1, wingScore =  177 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4350,
    CHALLENGER  = { minScore = 4212, wingScore = 4243 },
    GRANDMASTER = { minScore = 4050, wingScore = 4101 },
    MASTER      = { minScore = 3963, wingScore = 4000 },
    DIAMOND     = { minScore = 3618, wingScore = 3740 },
    EMERALD     = { minScore = 3447, wingScore = 3511 },
    PLATINUM    = { minScore = 3134, wingScore = 3293 },
    GOLD        = { minScore = 2782, wingScore = 2994 },
    SILVER      = { minScore = 1598, wingScore = 2431 },
    BRONZE      = { minScore =  389, wingScore =  933 },
    IRON        = { minScore =    1, wingScore =  208 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4350,
    CHALLENGER  = { minScore = 4064, wingScore = 4243 },
    GRANDMASTER = { minScore = 4019, wingScore = 4041 },
    MASTER      = { minScore = 3859, wingScore = 3939 },
    DIAMOND     = { minScore = 3697, wingScore = 3778 },
    EMERALD     = { minScore = 3481, wingScore = 3589 },
    PLATINUM    = { minScore = 3149, wingScore = 3284 },
    GOLD        = { minScore = 2783, wingScore = 2944 },
    SILVER      = { minScore = 1601, wingScore = 2433 },
    BRONZE      = { minScore =  390, wingScore =  935 },
    IRON        = { minScore =    1, wingScore =  208 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4350,
    CHALLENGER  = { minScore = 4240, wingScore = 4242 },
    GRANDMASTER = { minScore = 4186, wingScore = 4213 },
    MASTER      = { minScore = 3999, wingScore = 4092 },
    DIAMOND     = { minScore = 3811, wingScore = 3905 },
    EMERALD     = { minScore = 3561, wingScore = 3685 },
    PLATINUM    = { minScore = 3193, wingScore = 3339 },
    GOLD        = { minScore = 2781, wingScore = 2985 },
    SILVER      = { minScore = 1595, wingScore = 2428 },
    BRONZE      = { minScore =  388, wingScore =  931 },
    IRON        = { minScore =    1, wingScore =  207 },
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
