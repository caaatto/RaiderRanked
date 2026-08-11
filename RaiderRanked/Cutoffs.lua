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
    CHALLENGER  = { minScore = 4233, wingScore = 4255 },
    GRANDMASTER = { minScore = 4065, wingScore = 4119 },
    MASTER      = { minScore = 3997, wingScore = 4019 },
    DIAMOND     = { minScore = 3656, wingScore = 3774 },
    EMERALD     = { minScore = 3467, wingScore = 3548 },
    PLATINUM    = { minScore = 3167, wingScore = 3338 },
    GOLD        = { minScore = 2823, wingScore = 3018 },
    SILVER      = { minScore = 1721, wingScore = 2520 },
    BRONZE      = { minScore =  417, wingScore =  1008 },
    IRON        = { minScore =    1, wingScore =  230 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4350,
    CHALLENGER  = { minScore = 4087, wingScore = 4255 },
    GRANDMASTER = { minScore = 4045, wingScore = 4066 },
    MASTER      = { minScore = 3895, wingScore = 3970 },
    DIAMOND     = { minScore = 3733, wingScore = 3814 },
    EMERALD     = { minScore = 3517, wingScore = 3625 },
    PLATINUM    = { minScore = 3171, wingScore = 3314 },
    GOLD        = { minScore = 2823, wingScore = 2968 },
    SILVER      = { minScore = 1721, wingScore = 2520 },
    BRONZE      = { minScore =  417, wingScore =  1008 },
    IRON        = { minScore =    1, wingScore =  230 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4350,
    CHALLENGER  = { minScore = 4254, wingScore = 4255 },
    GRANDMASTER = { minScore = 4201, wingScore = 4228 },
    MASTER      = { minScore = 4017, wingScore = 4109 },
    DIAMOND     = { minScore = 3829, wingScore = 3923 },
    EMERALD     = { minScore = 3578, wingScore = 3703 },
    PLATINUM    = { minScore = 3214, wingScore = 3357 },
    GOLD        = { minScore = 2823, wingScore = 3014 },
    SILVER      = { minScore = 1721, wingScore = 2520 },
    BRONZE      = { minScore =  417, wingScore =  1008 },
    IRON        = { minScore =    1, wingScore =  230 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4313,
    CHALLENGER  = { minScore = 4207, wingScore = 4228 },
    GRANDMASTER = { minScore = 4030, wingScore = 4076 },
    MASTER      = { minScore = 3951, wingScore = 3983 },
    DIAMOND     = { minScore = 3563, wingScore = 3692 },
    EMERALD     = { minScore = 3420, wingScore = 3461 },
    PLATINUM    = { minScore = 3086, wingScore = 3233 },
    GOLD        = { minScore = 2725, wingScore = 2962 },
    SILVER      = { minScore = 1422, wingScore = 2304 },
    BRONZE      = { minScore =  341, wingScore =  823 },
    IRON        = { minScore =    1, wingScore =  176 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4313,
    CHALLENGER  = { minScore = 4032, wingScore = 4228 },
    GRANDMASTER = { minScore = 3983, wingScore = 4007 },
    MASTER      = { minScore = 3811, wingScore = 3897 },
    DIAMOND     = { minScore = 3649, wingScore = 3730 },
    EMERALD     = { minScore = 3434, wingScore = 3542 },
    PLATINUM    = { minScore = 3118, wingScore = 3243 },
    GOLD        = { minScore = 2725, wingScore = 2909 },
    SILVER      = { minScore = 1422, wingScore = 2304 },
    BRONZE      = { minScore =  341, wingScore =  823 },
    IRON        = { minScore =    1, wingScore =  176 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4313,
    CHALLENGER  = { minScore = 4225, wingScore = 4228 },
    GRANDMASTER = { minScore = 4171, wingScore = 4198 },
    MASTER      = { minScore = 3982, wingScore = 4077 },
    DIAMOND     = { minScore = 3793, wingScore = 3888 },
    EMERALD     = { minScore = 3539, wingScore = 3666 },
    PLATINUM    = { minScore = 3165, wingScore = 3314 },
    GOLD        = { minScore = 2725, wingScore = 2945 },
    SILVER      = { minScore = 1422, wingScore = 2304 },
    BRONZE      = { minScore =  341, wingScore =  823 },
    IRON        = { minScore =    1, wingScore =  176 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4350,
    CHALLENGER  = { minScore = 4222, wingScore = 4244 },
    GRANDMASTER = { minScore = 4050, wingScore = 4101 },
    MASTER      = { minScore = 3978, wingScore = 4004 },
    DIAMOND     = { minScore = 3617, wingScore = 3740 },
    EMERALD     = { minScore = 3447, wingScore = 3511 },
    PLATINUM    = { minScore = 3133, wingScore = 3294 },
    GOLD        = { minScore = 2782, wingScore = 2994 },
    SILVER      = { minScore = 1595, wingScore = 2429 },
    BRONZE      = { minScore =  385, wingScore =  930 },
    IRON        = { minScore =    1, wingScore =  207 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4350,
    CHALLENGER  = { minScore = 4064, wingScore = 4244 },
    GRANDMASTER = { minScore = 4020, wingScore = 4042 },
    MASTER      = { minScore = 3861, wingScore = 3940 },
    DIAMOND     = { minScore = 3699, wingScore = 3780 },
    EMERALD     = { minScore = 3483, wingScore = 3591 },
    PLATINUM    = { minScore = 3149, wingScore = 3285 },
    GOLD        = { minScore = 2783, wingScore = 2944 },
    SILVER      = { minScore = 1598, wingScore = 2431 },
    BRONZE      = { minScore =  386, wingScore =  932 },
    IRON        = { minScore =    1, wingScore =  208 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4350,
    CHALLENGER  = { minScore = 4241, wingScore = 4243 },
    GRANDMASTER = { minScore = 4188, wingScore = 4215 },
    MASTER      = { minScore = 4002, wingScore = 4095 },
    DIAMOND     = { minScore = 3813, wingScore = 3908 },
    EMERALD     = { minScore = 3561, wingScore = 3687 },
    PLATINUM    = { minScore = 3193, wingScore = 3338 },
    GOLD        = { minScore = 2781, wingScore = 2984 },
    SILVER      = { minScore = 1592, wingScore = 2427 },
    BRONZE      = { minScore =  384, wingScore =  928 },
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
