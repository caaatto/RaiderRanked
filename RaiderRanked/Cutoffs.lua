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
    CHALLENGER  = { minScore = 4227, wingScore = 4255 },
    GRANDMASTER = { minScore = 4065, wingScore = 4119 },
    MASTER      = { minScore = 3992, wingScore = 4017 },
    DIAMOND     = { minScore = 3657, wingScore = 3774 },
    EMERALD     = { minScore = 3467, wingScore = 3548 },
    PLATINUM    = { minScore = 3167, wingScore = 3337 },
    GOLD        = { minScore = 2823, wingScore = 3018 },
    SILVER      = { minScore = 1722, wingScore = 2520 },
    BRONZE      = { minScore =  420, wingScore =  1009 },
    IRON        = { minScore =    1, wingScore =  230 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4350,
    CHALLENGER  = { minScore = 4087, wingScore = 4255 },
    GRANDMASTER = { minScore = 4044, wingScore = 4066 },
    MASTER      = { minScore = 3894, wingScore = 3969 },
    DIAMOND     = { minScore = 3732, wingScore = 3813 },
    EMERALD     = { minScore = 3517, wingScore = 3625 },
    PLATINUM    = { minScore = 3171, wingScore = 3314 },
    GOLD        = { minScore = 2823, wingScore = 2968 },
    SILVER      = { minScore = 1722, wingScore = 2520 },
    BRONZE      = { minScore =  420, wingScore =  1009 },
    IRON        = { minScore =    1, wingScore =  230 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4350,
    CHALLENGER  = { minScore = 4254, wingScore = 4255 },
    GRANDMASTER = { minScore = 4201, wingScore = 4227 },
    MASTER      = { minScore = 4016, wingScore = 4108 },
    DIAMOND     = { minScore = 3828, wingScore = 3922 },
    EMERALD     = { minScore = 3578, wingScore = 3703 },
    PLATINUM    = { minScore = 3214, wingScore = 3357 },
    GOLD        = { minScore = 2823, wingScore = 3014 },
    SILVER      = { minScore = 1722, wingScore = 2520 },
    BRONZE      = { minScore =  420, wingScore =  1009 },
    IRON        = { minScore =    1, wingScore =  230 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4313,
    CHALLENGER  = { minScore = 4204, wingScore = 4226 },
    GRANDMASTER = { minScore = 4030, wingScore = 4076 },
    MASTER      = { minScore = 3941, wingScore = 3981 },
    DIAMOND     = { minScore = 3564, wingScore = 3692 },
    EMERALD     = { minScore = 3419, wingScore = 3461 },
    PLATINUM    = { minScore = 3087, wingScore = 3233 },
    GOLD        = { minScore = 2725, wingScore = 2961 },
    SILVER      = { minScore = 1423, wingScore = 2304 },
    BRONZE      = { minScore =  342, wingScore =  823 },
    IRON        = { minScore =    1, wingScore =  176 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4313,
    CHALLENGER  = { minScore = 4031, wingScore = 4226 },
    GRANDMASTER = { minScore = 3982, wingScore = 4007 },
    MASTER      = { minScore = 3810, wingScore = 3896 },
    DIAMOND     = { minScore = 3648, wingScore = 3729 },
    EMERALD     = { minScore = 3432, wingScore = 3540 },
    PLATINUM    = { minScore = 3117, wingScore = 3242 },
    GOLD        = { minScore = 2725, wingScore = 2909 },
    SILVER      = { minScore = 1423, wingScore = 2304 },
    BRONZE      = { minScore =  342, wingScore =  823 },
    IRON        = { minScore =    1, wingScore =  176 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4313,
    CHALLENGER  = { minScore = 4223, wingScore = 4226 },
    GRANDMASTER = { minScore = 4169, wingScore = 4196 },
    MASTER      = { minScore = 3981, wingScore = 4075 },
    DIAMOND     = { minScore = 3791, wingScore = 3886 },
    EMERALD     = { minScore = 3539, wingScore = 3665 },
    PLATINUM    = { minScore = 3165, wingScore = 3314 },
    GOLD        = { minScore = 2725, wingScore = 2945 },
    SILVER      = { minScore = 1423, wingScore = 2304 },
    BRONZE      = { minScore =  342, wingScore =  823 },
    IRON        = { minScore =    1, wingScore =  176 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4350,
    CHALLENGER  = { minScore = 4217, wingScore = 4243 },
    GRANDMASTER = { minScore = 4050, wingScore = 4101 },
    MASTER      = { minScore = 3971, wingScore = 4002 },
    DIAMOND     = { minScore = 3618, wingScore = 3740 },
    EMERALD     = { minScore = 3447, wingScore = 3511 },
    PLATINUM    = { minScore = 3133, wingScore = 3293 },
    GOLD        = { minScore = 2782, wingScore = 2994 },
    SILVER      = { minScore = 1596, wingScore = 2429 },
    BRONZE      = { minScore =  387, wingScore =  931 },
    IRON        = { minScore =    1, wingScore =  207 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4350,
    CHALLENGER  = { minScore = 4064, wingScore = 4243 },
    GRANDMASTER = { minScore = 4019, wingScore = 4042 },
    MASTER      = { minScore = 3860, wingScore = 3939 },
    DIAMOND     = { minScore = 3698, wingScore = 3779 },
    EMERALD     = { minScore = 3482, wingScore = 3590 },
    PLATINUM    = { minScore = 3149, wingScore = 3284 },
    GOLD        = { minScore = 2783, wingScore = 2944 },
    SILVER      = { minScore = 1599, wingScore = 2431 },
    BRONZE      = { minScore =  388, wingScore =  933 },
    IRON        = { minScore =    1, wingScore =  208 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4350,
    CHALLENGER  = { minScore = 4241, wingScore = 4242 },
    GRANDMASTER = { minScore = 4187, wingScore = 4214 },
    MASTER      = { minScore = 4001, wingScore = 4094 },
    DIAMOND     = { minScore = 3812, wingScore = 3906 },
    EMERALD     = { minScore = 3561, wingScore = 3687 },
    PLATINUM    = { minScore = 3193, wingScore = 3338 },
    GOLD        = { minScore = 2781, wingScore = 2984 },
    SILVER      = { minScore = 1593, wingScore = 2427 },
    BRONZE      = { minScore =  386, wingScore =  929 },
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
