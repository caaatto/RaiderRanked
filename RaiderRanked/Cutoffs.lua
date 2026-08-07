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
    top100Score = 4347,
    CHALLENGER  = { minScore = 4217, wingScore = 4254 },
    GRANDMASTER = { minScore = 4063, wingScore = 4118 },
    MASTER      = { minScore = 3974, wingScore = 4014 },
    DIAMOND     = { minScore = 3657, wingScore = 3774 },
    EMERALD     = { minScore = 3467, wingScore = 3548 },
    PLATINUM    = { minScore = 3168, wingScore = 3336 },
    GOLD        = { minScore = 2823, wingScore = 3018 },
    SILVER      = { minScore = 1725, wingScore = 2522 },
    BRONZE      = { minScore =  425, wingScore =  1012 },
    IRON        = { minScore =    1, wingScore =  230 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4347,
    CHALLENGER  = { minScore = 4087, wingScore = 4254 },
    GRANDMASTER = { minScore = 4043, wingScore = 4065 },
    MASTER      = { minScore = 3892, wingScore = 3968 },
    DIAMOND     = { minScore = 3731, wingScore = 3812 },
    EMERALD     = { minScore = 3516, wingScore = 3623 },
    PLATINUM    = { minScore = 3171, wingScore = 3314 },
    GOLD        = { minScore = 2823, wingScore = 2968 },
    SILVER      = { minScore = 1725, wingScore = 2522 },
    BRONZE      = { minScore =  425, wingScore =  1012 },
    IRON        = { minScore =    1, wingScore =  230 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4347,
    CHALLENGER  = { minScore = 4252, wingScore = 4254 },
    GRANDMASTER = { minScore = 4199, wingScore = 4225 },
    MASTER      = { minScore = 4013, wingScore = 4106 },
    DIAMOND     = { minScore = 3826, wingScore = 3920 },
    EMERALD     = { minScore = 3577, wingScore = 3702 },
    PLATINUM    = { minScore = 3215, wingScore = 3358 },
    GOLD        = { minScore = 2823, wingScore = 3015 },
    SILVER      = { minScore = 1725, wingScore = 2522 },
    BRONZE      = { minScore =  425, wingScore =  1012 },
    IRON        = { minScore =    1, wingScore =  230 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4302,
    CHALLENGER  = { minScore = 4192, wingScore = 4225 },
    GRANDMASTER = { minScore = 4029, wingScore = 4076 },
    MASTER      = { minScore = 3924, wingScore = 3973 },
    DIAMOND     = { minScore = 3564, wingScore = 3691 },
    EMERALD     = { minScore = 3419, wingScore = 3460 },
    PLATINUM    = { minScore = 3087, wingScore = 3232 },
    GOLD        = { minScore = 2725, wingScore = 2959 },
    SILVER      = { minScore = 1427, wingScore = 2307 },
    BRONZE      = { minScore =  344, wingScore =  826 },
    IRON        = { minScore =    1, wingScore =  178 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4302,
    CHALLENGER  = { minScore = 4031, wingScore = 4225 },
    GRANDMASTER = { minScore = 3981, wingScore = 4006 },
    MASTER      = { minScore = 3805, wingScore = 3893 },
    DIAMOND     = { minScore = 3644, wingScore = 3725 },
    EMERALD     = { minScore = 3429, wingScore = 3536 },
    PLATINUM    = { minScore = 3116, wingScore = 3239 },
    GOLD        = { minScore = 2725, wingScore = 2909 },
    SILVER      = { minScore = 1427, wingScore = 2307 },
    BRONZE      = { minScore =  344, wingScore =  826 },
    IRON        = { minScore =    1, wingScore =  178 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4302,
    CHALLENGER  = { minScore = 4221, wingScore = 4225 },
    GRANDMASTER = { minScore = 4165, wingScore = 4193 },
    MASTER      = { minScore = 3971, wingScore = 4068 },
    DIAMOND     = { minScore = 3785, wingScore = 3878 },
    EMERALD     = { minScore = 3536, wingScore = 3660 },
    PLATINUM    = { minScore = 3165, wingScore = 3313 },
    GOLD        = { minScore = 2725, wingScore = 2945 },
    SILVER      = { minScore = 1427, wingScore = 2307 },
    BRONZE      = { minScore =  344, wingScore =  826 },
    IRON        = { minScore =    1, wingScore =  178 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4347,
    CHALLENGER  = { minScore = 4206, wingScore = 4242 },
    GRANDMASTER = { minScore = 4049, wingScore = 4100 },
    MASTER      = { minScore = 3953, wingScore = 3997 },
    DIAMOND     = { minScore = 3618, wingScore = 3739 },
    EMERALD     = { minScore = 3447, wingScore = 3511 },
    PLATINUM    = { minScore = 3134, wingScore = 3292 },
    GOLD        = { minScore = 2782, wingScore = 2993 },
    SILVER      = { minScore = 1600, wingScore = 2432 },
    BRONZE      = { minScore =  391, wingScore =  934 },
    IRON        = { minScore =    1, wingScore =  208 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4347,
    CHALLENGER  = { minScore = 4064, wingScore = 4242 },
    GRANDMASTER = { minScore = 4018, wingScore = 4041 },
    MASTER      = { minScore = 3856, wingScore = 3937 },
    DIAMOND     = { minScore = 3695, wingScore = 3776 },
    EMERALD     = { minScore = 3480, wingScore = 3587 },
    PLATINUM    = { minScore = 3148, wingScore = 3283 },
    GOLD        = { minScore = 2783, wingScore = 2944 },
    SILVER      = { minScore = 1603, wingScore = 2434 },
    BRONZE      = { minScore =  392, wingScore =  936 },
    IRON        = { minScore =    1, wingScore =  209 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4347,
    CHALLENGER  = { minScore = 4239, wingScore = 4241 },
    GRANDMASTER = { minScore = 4184, wingScore = 4211 },
    MASTER      = { minScore = 3995, wingScore = 4090 },
    DIAMOND     = { minScore = 3808, wingScore = 3902 },
    EMERALD     = { minScore = 3559, wingScore = 3684 },
    PLATINUM    = { minScore = 3193, wingScore = 3339 },
    GOLD        = { minScore = 2781, wingScore = 2985 },
    SILVER      = { minScore = 1596, wingScore = 2429 },
    BRONZE      = { minScore =  390, wingScore =  932 },
    IRON        = { minScore =    1, wingScore =  208 },
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
