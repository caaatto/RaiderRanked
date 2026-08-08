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
    CHALLENGER  = { minScore = 4220, wingScore = 4254 },
    GRANDMASTER = { minScore = 4064, wingScore = 4119 },
    MASTER      = { minScore = 3980, wingScore = 4015 },
    DIAMOND     = { minScore = 3657, wingScore = 3774 },
    EMERALD     = { minScore = 3467, wingScore = 3548 },
    PLATINUM    = { minScore = 3168, wingScore = 3336 },
    GOLD        = { minScore = 2823, wingScore = 3018 },
    SILVER      = { minScore = 1726, wingScore = 2522 },
    BRONZE      = { minScore =  424, wingScore =  1012 },
    IRON        = { minScore =    1, wingScore =  230 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4350,
    CHALLENGER  = { minScore = 4087, wingScore = 4254 },
    GRANDMASTER = { minScore = 4043, wingScore = 4065 },
    MASTER      = { minScore = 3892, wingScore = 3968 },
    DIAMOND     = { minScore = 3731, wingScore = 3812 },
    EMERALD     = { minScore = 3516, wingScore = 3623 },
    PLATINUM    = { minScore = 3171, wingScore = 3314 },
    GOLD        = { minScore = 2823, wingScore = 2968 },
    SILVER      = { minScore = 1726, wingScore = 2522 },
    BRONZE      = { minScore =  424, wingScore =  1012 },
    IRON        = { minScore =    1, wingScore =  230 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4350,
    CHALLENGER  = { minScore = 4252, wingScore = 4254 },
    GRANDMASTER = { minScore = 4199, wingScore = 4225 },
    MASTER      = { minScore = 4013, wingScore = 4106 },
    DIAMOND     = { minScore = 3826, wingScore = 3920 },
    EMERALD     = { minScore = 3577, wingScore = 3702 },
    PLATINUM    = { minScore = 3215, wingScore = 3358 },
    GOLD        = { minScore = 2823, wingScore = 3015 },
    SILVER      = { minScore = 1726, wingScore = 2522 },
    BRONZE      = { minScore =  424, wingScore =  1012 },
    IRON        = { minScore =    1, wingScore =  230 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4303,
    CHALLENGER  = { minScore = 4194, wingScore = 4225 },
    GRANDMASTER = { minScore = 4029, wingScore = 4076 },
    MASTER      = { minScore = 3928, wingScore = 3976 },
    DIAMOND     = { minScore = 3564, wingScore = 3691 },
    EMERALD     = { minScore = 3419, wingScore = 3460 },
    PLATINUM    = { minScore = 3087, wingScore = 3233 },
    GOLD        = { minScore = 2725, wingScore = 2959 },
    SILVER      = { minScore = 1426, wingScore = 2306 },
    BRONZE      = { minScore =  343, wingScore =  826 },
    IRON        = { minScore =    1, wingScore =  177 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4303,
    CHALLENGER  = { minScore = 4031, wingScore = 4225 },
    GRANDMASTER = { minScore = 3981, wingScore = 4006 },
    MASTER      = { minScore = 3806, wingScore = 3894 },
    DIAMOND     = { minScore = 3645, wingScore = 3726 },
    EMERALD     = { minScore = 3430, wingScore = 3537 },
    PLATINUM    = { minScore = 3116, wingScore = 3240 },
    GOLD        = { minScore = 2725, wingScore = 2909 },
    SILVER      = { minScore = 1426, wingScore = 2306 },
    BRONZE      = { minScore =  343, wingScore =  826 },
    IRON        = { minScore =    1, wingScore =  177 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4303,
    CHALLENGER  = { minScore = 4222, wingScore = 4225 },
    GRANDMASTER = { minScore = 4166, wingScore = 4194 },
    MASTER      = { minScore = 3972, wingScore = 4069 },
    DIAMOND     = { minScore = 3785, wingScore = 3879 },
    EMERALD     = { minScore = 3537, wingScore = 3661 },
    PLATINUM    = { minScore = 3165, wingScore = 3313 },
    GOLD        = { minScore = 2725, wingScore = 2945 },
    SILVER      = { minScore = 1426, wingScore = 2306 },
    BRONZE      = { minScore =  343, wingScore =  826 },
    IRON        = { minScore =    1, wingScore =  177 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4350,
    CHALLENGER  = { minScore = 4209, wingScore = 4242 },
    GRANDMASTER = { minScore = 4049, wingScore = 4101 },
    MASTER      = { minScore = 3958, wingScore = 3999 },
    DIAMOND     = { minScore = 3618, wingScore = 3739 },
    EMERALD     = { minScore = 3447, wingScore = 3511 },
    PLATINUM    = { minScore = 3134, wingScore = 3293 },
    GOLD        = { minScore = 2782, wingScore = 2993 },
    SILVER      = { minScore = 1600, wingScore = 2431 },
    BRONZE      = { minScore =  390, wingScore =  934 },
    IRON        = { minScore =    1, wingScore =  208 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4350,
    CHALLENGER  = { minScore = 4064, wingScore = 4242 },
    GRANDMASTER = { minScore = 4018, wingScore = 4041 },
    MASTER      = { minScore = 3857, wingScore = 3938 },
    DIAMOND     = { minScore = 3696, wingScore = 3777 },
    EMERALD     = { minScore = 3481, wingScore = 3588 },
    PLATINUM    = { minScore = 3148, wingScore = 3284 },
    GOLD        = { minScore = 2783, wingScore = 2944 },
    SILVER      = { minScore = 1603, wingScore = 2433 },
    BRONZE      = { minScore =  391, wingScore =  936 },
    IRON        = { minScore =    1, wingScore =  208 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4350,
    CHALLENGER  = { minScore = 4239, wingScore = 4241 },
    GRANDMASTER = { minScore = 4185, wingScore = 4212 },
    MASTER      = { minScore = 3995, wingScore = 4090 },
    DIAMOND     = { minScore = 3808, wingScore = 3902 },
    EMERALD     = { minScore = 3560, wingScore = 3684 },
    PLATINUM    = { minScore = 3193, wingScore = 3339 },
    GOLD        = { minScore = 2781, wingScore = 2985 },
    SILVER      = { minScore = 1597, wingScore = 2429 },
    BRONZE      = { minScore =  389, wingScore =  932 },
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
