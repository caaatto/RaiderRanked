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
    top100Score = 4347,
    CHALLENGER  = { minScore = 4209, wingScore = 4253 },
    GRANDMASTER = { minScore = 4062, wingScore = 4118 },
    MASTER      = { minScore = 3966, wingScore = 4013 },
    DIAMOND     = { minScore = 3657, wingScore = 3773 },
    EMERALD     = { minScore = 3467, wingScore = 3548 },
    PLATINUM    = { minScore = 3168, wingScore = 3335 },
    GOLD        = { minScore = 2822, wingScore = 3018 },
    SILVER      = { minScore = 1726, wingScore = 2522 },
    BRONZE      = { minScore =  426, wingScore =  1013 },
    IRON        = { minScore =    1, wingScore =  232 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4347,
    CHALLENGER  = { minScore = 4086, wingScore = 4253 },
    GRANDMASTER = { minScore = 4042, wingScore = 4064 },
    MASTER      = { minScore = 3890, wingScore = 3966 },
    DIAMOND     = { minScore = 3729, wingScore = 3810 },
    EMERALD     = { minScore = 3515, wingScore = 3622 },
    PLATINUM    = { minScore = 3171, wingScore = 3313 },
    GOLD        = { minScore = 2822, wingScore = 2968 },
    SILVER      = { minScore = 1726, wingScore = 2522 },
    BRONZE      = { minScore =  426, wingScore =  1013 },
    IRON        = { minScore =    1, wingScore =  232 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4347,
    CHALLENGER  = { minScore = 4250, wingScore = 4253 },
    GRANDMASTER = { minScore = 4197, wingScore = 4224 },
    MASTER      = { minScore = 4012, wingScore = 4105 },
    DIAMOND     = { minScore = 3826, wingScore = 3919 },
    EMERALD     = { minScore = 3577, wingScore = 3701 },
    PLATINUM    = { minScore = 3216, wingScore = 3358 },
    GOLD        = { minScore = 2822, wingScore = 3015 },
    SILVER      = { minScore = 1726, wingScore = 2522 },
    BRONZE      = { minScore =  426, wingScore =  1013 },
    IRON        = { minScore =    1, wingScore =  232 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4300,
    CHALLENGER  = { minScore = 4183, wingScore = 4222 },
    GRANDMASTER = { minScore = 4028, wingScore = 4074 },
    MASTER      = { minScore = 3916, wingScore = 3969 },
    DIAMOND     = { minScore = 3563, wingScore = 3690 },
    EMERALD     = { minScore = 3418, wingScore = 3460 },
    PLATINUM    = { minScore = 3087, wingScore = 3232 },
    GOLD        = { minScore = 2724, wingScore = 2958 },
    SILVER      = { minScore = 1429, wingScore = 2307 },
    BRONZE      = { minScore =  345, wingScore =  828 },
    IRON        = { minScore =    1, wingScore =  179 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4300,
    CHALLENGER  = { minScore = 4030, wingScore = 4222 },
    GRANDMASTER = { minScore = 3979, wingScore = 4005 },
    MASTER      = { minScore = 3802, wingScore = 3891 },
    DIAMOND     = { minScore = 3641, wingScore = 3721 },
    EMERALD     = { minScore = 3427, wingScore = 3534 },
    PLATINUM    = { minScore = 3115, wingScore = 3238 },
    GOLD        = { minScore = 2724, wingScore = 2909 },
    SILVER      = { minScore = 1429, wingScore = 2307 },
    BRONZE      = { minScore =  345, wingScore =  828 },
    IRON        = { minScore =    1, wingScore =  179 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4300,
    CHALLENGER  = { minScore = 4217, wingScore = 4222 },
    GRANDMASTER = { minScore = 4162, wingScore = 4190 },
    MASTER      = { minScore = 3968, wingScore = 4065 },
    DIAMOND     = { minScore = 3782, wingScore = 3875 },
    EMERALD     = { minScore = 3535, wingScore = 3659 },
    PLATINUM    = { minScore = 3165, wingScore = 3313 },
    GOLD        = { minScore = 2724, wingScore = 2945 },
    SILVER      = { minScore = 1429, wingScore = 2307 },
    BRONZE      = { minScore =  345, wingScore =  828 },
    IRON        = { minScore =    1, wingScore =  179 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4347,
    CHALLENGER  = { minScore = 4198, wingScore = 4240 },
    GRANDMASTER = { minScore = 4048, wingScore = 4099 },
    MASTER      = { minScore = 3945, wingScore = 3994 },
    DIAMOND     = { minScore = 3617, wingScore = 3738 },
    EMERALD     = { minScore = 3446, wingScore = 3511 },
    PLATINUM    = { minScore = 3134, wingScore = 3292 },
    GOLD        = { minScore = 2781, wingScore = 2993 },
    SILVER      = { minScore = 1601, wingScore = 2432 },
    BRONZE      = { minScore =  392, wingScore =  935 },
    IRON        = { minScore =    1, wingScore =  210 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4347,
    CHALLENGER  = { minScore = 4063, wingScore = 4240 },
    GRANDMASTER = { minScore = 4016, wingScore = 4040 },
    MASTER      = { minScore = 3854, wingScore = 3935 },
    DIAMOND     = { minScore = 3693, wingScore = 3774 },
    EMERALD     = { minScore = 3479, wingScore = 3586 },
    PLATINUM    = { minScore = 3148, wingScore = 3282 },
    GOLD        = { minScore = 2782, wingScore = 2944 },
    SILVER      = { minScore = 1604, wingScore = 2434 },
    BRONZE      = { minScore =  393, wingScore =  937 },
    IRON        = { minScore =    1, wingScore =  210 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4347,
    CHALLENGER  = { minScore = 4236, wingScore = 4240 },
    GRANDMASTER = { minScore = 4182, wingScore = 4209 },
    MASTER      = { minScore = 3993, wingScore = 4088 },
    DIAMOND     = { minScore = 3807, wingScore = 3900 },
    EMERALD     = { minScore = 3559, wingScore = 3683 },
    PLATINUM    = { minScore = 3194, wingScore = 3339 },
    GOLD        = { minScore = 2780, wingScore = 2985 },
    SILVER      = { minScore = 1598, wingScore = 2429 },
    BRONZE      = { minScore =  391, wingScore =  933 },
    IRON        = { minScore =    1, wingScore =  209 },
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
