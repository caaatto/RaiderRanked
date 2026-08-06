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
    CHALLENGER  = { minScore = 4212, wingScore = 4254 },
    GRANDMASTER = { minScore = 4063, wingScore = 4118 },
    MASTER      = { minScore = 3969, wingScore = 4013 },
    DIAMOND     = { minScore = 3657, wingScore = 3773 },
    EMERALD     = { minScore = 3467, wingScore = 3548 },
    PLATINUM    = { minScore = 3168, wingScore = 3336 },
    GOLD        = { minScore = 2823, wingScore = 3018 },
    SILVER      = { minScore = 1726, wingScore = 2522 },
    BRONZE      = { minScore =  426, wingScore =  1012 },
    IRON        = { minScore =    1, wingScore =  230 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4347,
    CHALLENGER  = { minScore = 4087, wingScore = 4254 },
    GRANDMASTER = { minScore = 4043, wingScore = 4065 },
    MASTER      = { minScore = 3891, wingScore = 3967 },
    DIAMOND     = { minScore = 3730, wingScore = 3811 },
    EMERALD     = { minScore = 3516, wingScore = 3623 },
    PLATINUM    = { minScore = 3171, wingScore = 3313 },
    GOLD        = { minScore = 2823, wingScore = 2968 },
    SILVER      = { minScore = 1726, wingScore = 2522 },
    BRONZE      = { minScore =  426, wingScore =  1012 },
    IRON        = { minScore =    1, wingScore =  230 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4347,
    CHALLENGER  = { minScore = 4251, wingScore = 4254 },
    GRANDMASTER = { minScore = 4198, wingScore = 4224 },
    MASTER      = { minScore = 4012, wingScore = 4105 },
    DIAMOND     = { minScore = 3826, wingScore = 3919 },
    EMERALD     = { minScore = 3577, wingScore = 3702 },
    PLATINUM    = { minScore = 3215, wingScore = 3358 },
    GOLD        = { minScore = 2823, wingScore = 3015 },
    SILVER      = { minScore = 1726, wingScore = 2522 },
    BRONZE      = { minScore =  426, wingScore =  1012 },
    IRON        = { minScore =    1, wingScore =  230 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4301,
    CHALLENGER  = { minScore = 4188, wingScore = 4223 },
    GRANDMASTER = { minScore = 4028, wingScore = 4075 },
    MASTER      = { minScore = 3920, wingScore = 3970 },
    DIAMOND     = { minScore = 3564, wingScore = 3690 },
    EMERALD     = { minScore = 3419, wingScore = 3460 },
    PLATINUM    = { minScore = 3087, wingScore = 3232 },
    GOLD        = { minScore = 2725, wingScore = 2958 },
    SILVER      = { minScore = 1427, wingScore = 2307 },
    BRONZE      = { minScore =  344, wingScore =  827 },
    IRON        = { minScore =    1, wingScore =  178 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4301,
    CHALLENGER  = { minScore = 4030, wingScore = 4223 },
    GRANDMASTER = { minScore = 3980, wingScore = 4005 },
    MASTER      = { minScore = 3803, wingScore = 3892 },
    DIAMOND     = { minScore = 3642, wingScore = 3723 },
    EMERALD     = { minScore = 3428, wingScore = 3535 },
    PLATINUM    = { minScore = 3115, wingScore = 3238 },
    GOLD        = { minScore = 2725, wingScore = 2909 },
    SILVER      = { minScore = 1427, wingScore = 2307 },
    BRONZE      = { minScore =  344, wingScore =  827 },
    IRON        = { minScore =    1, wingScore =  178 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4301,
    CHALLENGER  = { minScore = 4220, wingScore = 4223 },
    GRANDMASTER = { minScore = 4164, wingScore = 4192 },
    MASTER      = { minScore = 3969, wingScore = 4067 },
    DIAMOND     = { minScore = 3783, wingScore = 3876 },
    EMERALD     = { minScore = 3536, wingScore = 3660 },
    PLATINUM    = { minScore = 3165, wingScore = 3313 },
    GOLD        = { minScore = 2725, wingScore = 2945 },
    SILVER      = { minScore = 1427, wingScore = 2307 },
    BRONZE      = { minScore =  344, wingScore =  827 },
    IRON        = { minScore =    1, wingScore =  178 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4347,
    CHALLENGER  = { minScore = 4202, wingScore = 4241 },
    GRANDMASTER = { minScore = 4048, wingScore = 4100 },
    MASTER      = { minScore = 3948, wingScore = 3995 },
    DIAMOND     = { minScore = 3618, wingScore = 3738 },
    EMERALD     = { minScore = 3447, wingScore = 3511 },
    PLATINUM    = { minScore = 3134, wingScore = 3292 },
    GOLD        = { minScore = 2782, wingScore = 2993 },
    SILVER      = { minScore = 1600, wingScore = 2432 },
    BRONZE      = { minScore =  392, wingScore =  934 },
    IRON        = { minScore =    1, wingScore =  208 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4347,
    CHALLENGER  = { minScore = 4064, wingScore = 4241 },
    GRANDMASTER = { minScore = 4017, wingScore = 4040 },
    MASTER      = { minScore = 3855, wingScore = 3936 },
    DIAMOND     = { minScore = 3694, wingScore = 3775 },
    EMERALD     = { minScore = 3480, wingScore = 3587 },
    PLATINUM    = { minScore = 3148, wingScore = 3282 },
    GOLD        = { minScore = 2783, wingScore = 2944 },
    SILVER      = { minScore = 1603, wingScore = 2434 },
    BRONZE      = { minScore =  392, wingScore =  936 },
    IRON        = { minScore =    1, wingScore =  209 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4347,
    CHALLENGER  = { minScore = 4238, wingScore = 4241 },
    GRANDMASTER = { minScore = 4183, wingScore = 4210 },
    MASTER      = { minScore = 3993, wingScore = 4089 },
    DIAMOND     = { minScore = 3807, wingScore = 3900 },
    EMERALD     = { minScore = 3559, wingScore = 3684 },
    PLATINUM    = { minScore = 3193, wingScore = 3339 },
    GOLD        = { minScore = 2781, wingScore = 2985 },
    SILVER      = { minScore = 1597, wingScore = 2429 },
    BRONZE      = { minScore =  391, wingScore =  932 },
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
