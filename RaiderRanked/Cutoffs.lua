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
    top100Score = 4205,
    CHALLENGER  = { minScore = 4033, wingScore = 4089 },
    GRANDMASTER = { minScore = 3953, wingScore = 3996 },
    MASTER      = { minScore = 3819, wingScore = 3880 },
    DIAMOND     = { minScore = 3587, wingScore = 3680 },
    EMERALD     = { minScore = 3436, wingScore = 3502 },
    PLATINUM    = { minScore = 3140, wingScore = 3289 },
    GOLD        = { minScore = 2799, wingScore = 3008 },
    SILVER      = { minScore = 1769, wingScore = 2521 },
    BRONZE      = { minScore =  484, wingScore =  1053 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4205,
    CHALLENGER  = { minScore = 3979, wingScore = 4089 },
    GRANDMASTER = { minScore = 3933, wingScore = 3956 },
    MASTER      = { minScore = 3771, wingScore = 3852 },
    DIAMOND     = { minScore = 3634, wingScore = 3703 },
    EMERALD     = { minScore = 3451, wingScore = 3542 },
    PLATINUM    = { minScore = 3146, wingScore = 3274 },
    GOLD        = { minScore = 2799, wingScore = 2951 },
    SILVER      = { minScore = 1769, wingScore = 2521 },
    BRONZE      = { minScore =  484, wingScore =  1053 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4205,
    CHALLENGER  = { minScore = 4080, wingScore = 4089 },
    GRANDMASTER = { minScore = 4035, wingScore = 4057 },
    MASTER      = { minScore = 3877, wingScore = 3956 },
    DIAMOND     = { minScore = 3727, wingScore = 3802 },
    EMERALD     = { minScore = 3526, wingScore = 3627 },
    PLATINUM    = { minScore = 3195, wingScore = 3334 },
    GOLD        = { minScore = 2799, wingScore = 2995 },
    SILVER      = { minScore = 1769, wingScore = 2521 },
    BRONZE      = { minScore =  484, wingScore =  1053 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4153,
    CHALLENGER  = { minScore = 4013, wingScore = 4051 },
    GRANDMASTER = { minScore = 3905, wingScore = 3942 },
    MASTER      = { minScore = 3769, wingScore = 3817 },
    DIAMOND     = { minScore = 3508, wingScore = 3605 },
    EMERALD     = { minScore = 3388, wingScore = 3428 },
    PLATINUM    = { minScore = 3067, wingScore = 3190 },
    GOLD        = { minScore = 2707, wingScore = 2915 },
    SILVER      = { minScore = 1468, wingScore = 2312 },
    BRONZE      = { minScore =  360, wingScore =  856 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4153,
    CHALLENGER  = { minScore = 3910, wingScore = 4051 },
    GRANDMASTER = { minScore = 3858, wingScore = 3884 },
    MASTER      = { minScore = 3676, wingScore = 3767 },
    DIAMOND     = { minScore = 3537, wingScore = 3607 },
    EMERALD     = { minScore = 3352, wingScore = 3444 },
    PLATINUM    = { minScore = 3087, wingScore = 3190 },
    GOLD        = { minScore = 2707, wingScore = 2896 },
    SILVER      = { minScore = 1468, wingScore = 2312 },
    BRONZE      = { minScore =  360, wingScore =  856 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4153,
    CHALLENGER  = { minScore = 4043, wingScore = 4051 },
    GRANDMASTER = { minScore = 3993, wingScore = 4018 },
    MASTER      = { minScore = 3817, wingScore = 3905 },
    DIAMOND     = { minScore = 3665, wingScore = 3741 },
    EMERALD     = { minScore = 3462, wingScore = 3564 },
    PLATINUM    = { minScore = 3139, wingScore = 3272 },
    GOLD        = { minScore = 2707, wingScore = 2930 },
    SILVER      = { minScore = 1468, wingScore = 2312 },
    BRONZE      = { minScore =  360, wingScore =  856 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4205,
    CHALLENGER  = { minScore = 4025, wingScore = 4073 },
    GRANDMASTER = { minScore = 3933, wingScore = 3973 },
    MASTER      = { minScore = 3798, wingScore = 3854 },
    DIAMOND     = { minScore = 3554, wingScore = 3649 },
    EMERALD     = { minScore = 3416, wingScore = 3471 },
    PLATINUM    = { minScore = 3109, wingScore = 3248 },
    GOLD        = { minScore = 2761, wingScore = 2969 },
    SILVER      = { minScore = 1643, wingScore = 2434 },
    BRONZE      = { minScore =  432, wingScore =  971 },
    IRON        = { minScore =    1, wingScore =  220 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4205,
    CHALLENGER  = { minScore = 3951, wingScore = 4074 },
    GRANDMASTER = { minScore = 3902, wingScore = 3927 },
    MASTER      = { minScore = 3732, wingScore = 3817 },
    DIAMOND     = { minScore = 3595, wingScore = 3664 },
    EMERALD     = { minScore = 3411, wingScore = 3502 },
    PLATINUM    = { minScore = 3122, wingScore = 3240 },
    GOLD        = { minScore = 2762, wingScore = 2929 },
    SILVER      = { minScore = 1646, wingScore = 2436 },
    BRONZE      = { minScore =  434, wingScore =  973 },
    IRON        = { minScore =    1, wingScore =  221 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4205,
    CHALLENGER  = { minScore = 4064, wingScore = 4073 },
    GRANDMASTER = { minScore = 4017, wingScore = 4040 },
    MASTER      = { minScore = 3851, wingScore = 3934 },
    DIAMOND     = { minScore = 3700, wingScore = 3776 },
    EMERALD     = { minScore = 3498, wingScore = 3600 },
    PLATINUM    = { minScore = 3171, wingScore = 3307 },
    GOLD        = { minScore = 2759, wingScore = 2967 },
    SILVER      = { minScore = 1640, wingScore = 2431 },
    BRONZE      = { minScore =  431, wingScore =  968 },
    IRON        = { minScore =    1, wingScore =  219 },
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
