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
    top100Score = 4298,
    CHALLENGER  = { minScore = 4135, wingScore = 4185 },
    GRANDMASTER = { minScore = 4023, wingScore = 4061 },
    MASTER      = { minScore = 3897, wingScore = 3946 },
    DIAMOND     = { minScore = 3642, wingScore = 3744 },
    EMERALD     = { minScore = 3462, wingScore = 3543 },
    PLATINUM    = { minScore = 3168, wingScore = 3326 },
    GOLD        = { minScore = 2826, wingScore = 3019 },
    SILVER      = { minScore = 1770, wingScore = 2540 },
    BRONZE      = { minScore =  459, wingScore =  1041 },
    IRON        = { minScore =    1, wingScore =  240 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4298,
    CHALLENGER  = { minScore = 4037, wingScore = 4185 },
    GRANDMASTER = { minScore = 3990, wingScore = 4014 },
    MASTER      = { minScore = 3825, wingScore = 3908 },
    DIAMOND     = { minScore = 3685, wingScore = 3755 },
    EMERALD     = { minScore = 3498, wingScore = 3591 },
    PLATINUM    = { minScore = 3170, wingScore = 3311 },
    GOLD        = { minScore = 2826, wingScore = 2969 },
    SILVER      = { minScore = 1770, wingScore = 2540 },
    BRONZE      = { minScore =  459, wingScore =  1041 },
    IRON        = { minScore =    1, wingScore =  240 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4298,
    CHALLENGER  = { minScore = 4171, wingScore = 4185 },
    GRANDMASTER = { minScore = 4120, wingScore = 4146 },
    MASTER      = { minScore = 3942, wingScore = 4031 },
    DIAMOND     = { minScore = 3778, wingScore = 3860 },
    EMERALD     = { minScore = 3559, wingScore = 3668 },
    PLATINUM    = { minScore = 3216, wingScore = 3356 },
    GOLD        = { minScore = 2826, wingScore = 3018 },
    SILVER      = { minScore = 1770, wingScore = 2540 },
    BRONZE      = { minScore =  459, wingScore =  1041 },
    IRON        = { minScore =    1, wingScore =  240 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4254,
    CHALLENGER  = { minScore = 4106, wingScore = 4152 },
    GRANDMASTER = { minScore = 3992, wingScore = 4024 },
    MASTER      = { minScore = 3848, wingScore = 3903 },
    DIAMOND     = { minScore = 3552, wingScore = 3667 },
    EMERALD     = { minScore = 3412, wingScore = 3453 },
    PLATINUM    = { minScore = 3087, wingScore = 3224 },
    GOLD        = { minScore = 2727, wingScore = 2954 },
    SILVER      = { minScore = 1465, wingScore = 2326 },
    BRONZE      = { minScore =  353, wingScore =  845 },
    IRON        = { minScore =    1, wingScore =  182 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4254,
    CHALLENGER  = { minScore = 3995, wingScore = 4152 },
    GRANDMASTER = { minScore = 3941, wingScore = 3968 },
    MASTER      = { minScore = 3755, wingScore = 3848 },
    DIAMOND     = { minScore = 3605, wingScore = 3680 },
    EMERALD     = { minScore = 3404, wingScore = 3505 },
    PLATINUM    = { minScore = 3109, wingScore = 3226 },
    GOLD        = { minScore = 2727, wingScore = 2909 },
    SILVER      = { minScore = 1465, wingScore = 2326 },
    BRONZE      = { minScore =  353, wingScore =  845 },
    IRON        = { minScore =    1, wingScore =  182 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4254,
    CHALLENGER  = { minScore = 4146, wingScore = 4152 },
    GRANDMASTER = { minScore = 4092, wingScore = 4119 },
    MASTER      = { minScore = 3902, wingScore = 3997 },
    DIAMOND     = { minScore = 3737, wingScore = 3820 },
    EMERALD     = { minScore = 3517, wingScore = 3627 },
    PLATINUM    = { minScore = 3163, wingScore = 3309 },
    GOLD        = { minScore = 2727, wingScore = 2947 },
    SILVER      = { minScore = 1465, wingScore = 2326 },
    BRONZE      = { minScore =  353, wingScore =  845 },
    IRON        = { minScore =    1, wingScore =  182 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4298,
    CHALLENGER  = { minScore = 4123, wingScore = 4171 },
    GRANDMASTER = { minScore = 4010, wingScore = 4045 },
    MASTER      = { minScore = 3876, wingScore = 3928 },
    DIAMOND     = { minScore = 3604, wingScore = 3712 },
    EMERALD     = { minScore = 3441, wingScore = 3505 },
    PLATINUM    = { minScore = 3134, wingScore = 3283 },
    GOLD        = { minScore = 2784, wingScore = 2992 },
    SILVER      = { minScore = 1642, wingScore = 2450 },
    BRONZE      = { minScore =  414, wingScore =  959 },
    IRON        = { minScore =    1, wingScore =  216 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4298,
    CHALLENGER  = { minScore = 4020, wingScore = 4171 },
    GRANDMASTER = { minScore = 3970, wingScore = 3995 },
    MASTER      = { minScore = 3796, wingScore = 3883 },
    DIAMOND     = { minScore = 3652, wingScore = 3724 },
    EMERALD     = { minScore = 3460, wingScore = 3556 },
    PLATINUM    = { minScore = 3145, wingScore = 3276 },
    GOLD        = { minScore = 2785, wingScore = 2944 },
    SILVER      = { minScore = 1645, wingScore = 2452 },
    BRONZE      = { minScore =  416, wingScore =  961 },
    IRON        = { minScore =    1, wingScore =  216 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4298,
    CHALLENGER  = { minScore = 4160, wingScore = 4171 },
    GRANDMASTER = { minScore = 4108, wingScore = 4134 },
    MASTER      = { minScore = 3925, wingScore = 4016 },
    DIAMOND     = { minScore = 3760, wingScore = 3843 },
    EMERALD     = { minScore = 3541, wingScore = 3650 },
    PLATINUM    = { minScore = 3193, wingScore = 3336 },
    GOLD        = { minScore = 2783, wingScore = 2987 },
    SILVER      = { minScore = 1638, wingScore = 2448 },
    BRONZE      = { minScore =  413, wingScore =  956 },
    IRON        = { minScore =    1, wingScore =  215 },
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
