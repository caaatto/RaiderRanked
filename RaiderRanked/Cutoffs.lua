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
    top100Score = 4336,
    CHALLENGER  = { minScore = 4188, wingScore = 4241 },
    GRANDMASTER = { minScore = 4056, wingScore = 4110 },
    MASTER      = { minScore = 3937, wingScore = 4000 },
    DIAMOND     = { minScore = 3655, wingScore = 3768 },
    EMERALD     = { minScore = 3467, wingScore = 3548 },
    PLATINUM    = { minScore = 3169, wingScore = 3333 },
    GOLD        = { minScore = 2824, wingScore = 3018 },
    SILVER      = { minScore = 1740, wingScore = 2528 },
    BRONZE      = { minScore =  440, wingScore =  1021 },
    IRON        = { minScore =    1, wingScore =  237 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4336,
    CHALLENGER  = { minScore = 4075, wingScore = 4241 },
    GRANDMASTER = { minScore = 4030, wingScore = 4053 },
    MASTER      = { minScore = 3871, wingScore = 3951 },
    DIAMOND     = { minScore = 3717, wingScore = 3794 },
    EMERALD     = { minScore = 3510, wingScore = 3613 },
    PLATINUM    = { minScore = 3171, wingScore = 3313 },
    GOLD        = { minScore = 2824, wingScore = 2969 },
    SILVER      = { minScore = 1740, wingScore = 2528 },
    BRONZE      = { minScore =  440, wingScore =  1021 },
    IRON        = { minScore =    1, wingScore =  237 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4336,
    CHALLENGER  = { minScore = 4231, wingScore = 4241 },
    GRANDMASTER = { minScore = 4179, wingScore = 4205 },
    MASTER      = { minScore = 3997, wingScore = 4088 },
    DIAMOND     = { minScore = 3816, wingScore = 3906 },
    EMERALD     = { minScore = 3574, wingScore = 3695 },
    PLATINUM    = { minScore = 3217, wingScore = 3359 },
    GOLD        = { minScore = 2824, wingScore = 3017 },
    SILVER      = { minScore = 1740, wingScore = 2528 },
    BRONZE      = { minScore =  440, wingScore =  1021 },
    IRON        = { minScore =    1, wingScore =  237 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4290,
    CHALLENGER  = { minScore = 4157, wingScore = 4210 },
    GRANDMASTER = { minScore = 4022, wingScore = 4065 },
    MASTER      = { minScore = 3896, wingScore = 3951 },
    DIAMOND     = { minScore = 3561, wingScore = 3685 },
    EMERALD     = { minScore = 3416, wingScore = 3459 },
    PLATINUM    = { minScore = 3087, wingScore = 3229 },
    GOLD        = { minScore = 2725, wingScore = 2955 },
    SILVER      = { minScore = 1437, wingScore = 2312 },
    BRONZE      = { minScore =  348, wingScore =  832 },
    IRON        = { minScore =    1, wingScore =  180 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4290,
    CHALLENGER  = { minScore = 4023, wingScore = 4210 },
    GRANDMASTER = { minScore = 3970, wingScore = 3997 },
    MASTER      = { minScore = 3787, wingScore = 3879 },
    DIAMOND     = { minScore = 3629, wingScore = 3708 },
    EMERALD     = { minScore = 3419, wingScore = 3524 },
    PLATINUM    = { minScore = 3113, wingScore = 3233 },
    GOLD        = { minScore = 2725, wingScore = 2908 },
    SILVER      = { minScore = 1437, wingScore = 2312 },
    BRONZE      = { minScore =  348, wingScore =  832 },
    IRON        = { minScore =    1, wingScore =  180 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4290,
    CHALLENGER  = { minScore = 4206, wingScore = 4210 },
    GRANDMASTER = { minScore = 4149, wingScore = 4178 },
    MASTER      = { minScore = 3949, wingScore = 4049 },
    DIAMOND     = { minScore = 3769, wingScore = 3859 },
    EMERALD     = { minScore = 3530, wingScore = 3649 },
    PLATINUM    = { minScore = 3164, wingScore = 3312 },
    GOLD        = { minScore = 2725, wingScore = 2946 },
    SILVER      = { minScore = 1437, wingScore = 2312 },
    BRONZE      = { minScore =  348, wingScore =  832 },
    IRON        = { minScore =    1, wingScore =  180 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4336,
    CHALLENGER  = { minScore = 4175, wingScore = 4228 },
    GRANDMASTER = { minScore = 4042, wingScore = 4091 },
    MASTER      = { minScore = 3920, wingScore = 3979 },
    DIAMOND     = { minScore = 3615, wingScore = 3733 },
    EMERALD     = { minScore = 3446, wingScore = 3511 },
    PLATINUM    = { minScore = 3134, wingScore = 3289 },
    GOLD        = { minScore = 2782, wingScore = 2991 },
    SILVER      = { minScore = 1612, wingScore = 2437 },
    BRONZE      = { minScore =  401, wingScore =  941 },
    IRON        = { minScore =    1, wingScore =  213 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4336,
    CHALLENGER  = { minScore = 4054, wingScore = 4228 },
    GRANDMASTER = { minScore = 4005, wingScore = 4030 },
    MASTER      = { minScore = 3837, wingScore = 3921 },
    DIAMOND     = { minScore = 3681, wingScore = 3759 },
    EMERALD     = { minScore = 3473, wingScore = 3577 },
    PLATINUM    = { minScore = 3147, wingScore = 3280 },
    GOLD        = { minScore = 2783, wingScore = 2944 },
    SILVER      = { minScore = 1616, wingScore = 2439 },
    BRONZE      = { minScore =  402, wingScore =  943 },
    IRON        = { minScore =    1, wingScore =  214 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4336,
    CHALLENGER  = { minScore = 4220, wingScore = 4228 },
    GRANDMASTER = { minScore = 4166, wingScore = 4193 },
    MASTER      = { minScore = 3976, wingScore = 4071 },
    DIAMOND     = { minScore = 3796, wingScore = 3886 },
    EMERALD     = { minScore = 3555, wingScore = 3675 },
    PLATINUM    = { minScore = 3194, wingScore = 3339 },
    GOLD        = { minScore = 2781, wingScore = 2986 },
    SILVER      = { minScore = 1609, wingScore = 2435 },
    BRONZE      = { minScore =  400, wingScore =  939 },
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
