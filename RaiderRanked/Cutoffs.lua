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
    top100Score = 4133,
    CHALLENGER  = { minScore = 3953, wingScore = 4011 },
    GRANDMASTER = { minScore = 3873, wingScore = 3898 },
    MASTER      = { minScore = 3746, wingScore = 3788 },
    DIAMOND     = { minScore = 3528, wingScore = 3604 },
    EMERALD     = { minScore = 3397, wingScore = 3439 },
    PLATINUM    = { minScore = 3090, wingScore = 3220 },
    GOLD        = { minScore = 2748, wingScore = 2953 },
    SILVER      = { minScore = 1683, wingScore = 2450 },
    BRONZE      = { minScore =  424, wingScore =  1000 },
    IRON        = { minScore =    1, wingScore =  232 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4133,
    CHALLENGER  = { minScore = 3895, wingScore = 4011 },
    GRANDMASTER = { minScore = 3847, wingScore = 3871 },
    MASTER      = { minScore = 3679, wingScore = 3763 },
    DIAMOND     = { minScore = 3551, wingScore = 3615 },
    EMERALD     = { minScore = 3380, wingScore = 3465 },
    PLATINUM    = { minScore = 3107, wingScore = 3219 },
    GOLD        = { minScore = 2748, wingScore = 2919 },
    SILVER      = { minScore = 1683, wingScore = 2450 },
    BRONZE      = { minScore =  424, wingScore =  1000 },
    IRON        = { minScore =    1, wingScore =  232 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4133,
    CHALLENGER  = { minScore = 3998, wingScore = 4011 },
    GRANDMASTER = { minScore = 3951, wingScore = 3975 },
    MASTER      = { minScore = 3785, wingScore = 3868 },
    DIAMOND     = { minScore = 3647, wingScore = 3716 },
    EMERALD     = { minScore = 3463, wingScore = 3555 },
    PLATINUM    = { minScore = 3150, wingScore = 3282 },
    GOLD        = { minScore = 2748, wingScore = 2950 },
    SILVER      = { minScore = 1683, wingScore = 2450 },
    BRONZE      = { minScore =  424, wingScore =  1000 },
    IRON        = { minScore =    1, wingScore =  232 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4044,
    CHALLENGER  = { minScore = 3910, wingScore = 3963 },
    GRANDMASTER = { minScore = 3812, wingScore = 3863 },
    MASTER      = { minScore = 3673, wingScore = 3733 },
    DIAMOND     = { minScore = 3441, wingScore = 3533 },
    EMERALD     = { minScore = 3305, wingScore = 3381 },
    PLATINUM    = { minScore = 3033, wingScore = 3129 },
    GOLD        = { minScore = 2671, wingScore = 2846 },
    SILVER      = { minScore = 1393, wingScore = 2245 },
    BRONZE      = { minScore =  340, wingScore =  815 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4044,
    CHALLENGER  = { minScore = 3827, wingScore = 3963 },
    GRANDMASTER = { minScore = 3776, wingScore = 3801 },
    MASTER      = { minScore = 3595, wingScore = 3685 },
    DIAMOND     = { minScore = 3461, wingScore = 3528 },
    EMERALD     = { minScore = 3283, wingScore = 3372 },
    PLATINUM    = { minScore = 3016, wingScore = 3122 },
    GOLD        = { minScore = 2671, wingScore = 2836 },
    SILVER      = { minScore = 1393, wingScore = 2245 },
    BRONZE      = { minScore =  340, wingScore =  815 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4044,
    CHALLENGER  = { minScore = 3947, wingScore = 3963 },
    GRANDMASTER = { minScore = 3899, wingScore = 3923 },
    MASTER      = { minScore = 3731, wingScore = 3815 },
    DIAMOND     = { minScore = 3581, wingScore = 3656 },
    EMERALD     = { minScore = 3382, wingScore = 3481 },
    PLATINUM    = { minScore = 3095, wingScore = 3207 },
    GOLD        = { minScore = 2671, wingScore = 2898 },
    SILVER      = { minScore = 1393, wingScore = 2245 },
    BRONZE      = { minScore =  340, wingScore =  815 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4133,
    CHALLENGER  = { minScore = 3935, wingScore = 3991 },
    GRANDMASTER = { minScore = 3848, wingScore = 3883 },
    MASTER      = { minScore = 3716, wingScore = 3765 },
    DIAMOND     = { minScore = 3492, wingScore = 3574 },
    EMERALD     = { minScore = 3359, wingScore = 3415 },
    PLATINUM    = { minScore = 3066, wingScore = 3182 },
    GOLD        = { minScore = 2716, wingScore = 2908 },
    SILVER      = { minScore = 1562, wingScore = 2365 },
    BRONZE      = { minScore =  389, wingScore =  923 },
    IRON        = { minScore =    1, wingScore =  206 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4133,
    CHALLENGER  = { minScore = 3867, wingScore = 3992 },
    GRANDMASTER = { minScore = 3818, wingScore = 3843 },
    MASTER      = { minScore = 3645, wingScore = 3731 },
    DIAMOND     = { minScore = 3515, wingScore = 3580 },
    EMERALD     = { minScore = 3341, wingScore = 3427 },
    PLATINUM    = { minScore = 3070, wingScore = 3180 },
    GOLD        = { minScore = 2717, wingScore = 2885 },
    SILVER      = { minScore = 1566, wingScore = 2367 },
    BRONZE      = { minScore =  390, wingScore =  925 },
    IRON        = { minScore =    1, wingScore =  207 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4133,
    CHALLENGER  = { minScore = 3976, wingScore = 3990 },
    GRANDMASTER = { minScore = 3929, wingScore = 3953 },
    MASTER      = { minScore = 3762, wingScore = 3845 },
    DIAMOND     = { minScore = 3619, wingScore = 3690 },
    EMERALD     = { minScore = 3428, wingScore = 3523 },
    PLATINUM    = { minScore = 3126, wingScore = 3250 },
    GOLD        = { minScore = 2715, wingScore = 2928 },
    SILVER      = { minScore = 1559, wingScore = 2362 },
    BRONZE      = { minScore =  388, wingScore =  921 },
    IRON        = { minScore =    1, wingScore =  205 },
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
