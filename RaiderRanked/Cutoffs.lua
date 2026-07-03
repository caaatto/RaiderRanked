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
    top100Score = 4270,
    CHALLENGER  = { minScore = 4117, wingScore = 4152 },
    GRANDMASTER = { minScore = 4012, wingScore = 4040 },
    MASTER      = { minScore = 3883, wingScore = 3925 },
    DIAMOND     = { minScore = 3632, wingScore = 3730 },
    EMERALD     = { minScore = 3459, wingScore = 3540 },
    PLATINUM    = { minScore = 3168, wingScore = 3323 },
    GOLD        = { minScore = 2828, wingScore = 3019 },
    SILVER      = { minScore = 1799, wingScore = 2550 },
    BRONZE      = { minScore =  479, wingScore =  1065 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4270,
    CHALLENGER  = { minScore = 4019, wingScore = 4152 },
    GRANDMASTER = { minScore = 3972, wingScore = 3996 },
    MASTER      = { minScore = 3807, wingScore = 3890 },
    DIAMOND     = { minScore = 3672, wingScore = 3740 },
    EMERALD     = { minScore = 3493, wingScore = 3583 },
    PLATINUM    = { minScore = 3170, wingScore = 3310 },
    GOLD        = { minScore = 2828, wingScore = 2971 },
    SILVER      = { minScore = 1799, wingScore = 2550 },
    BRONZE      = { minScore =  479, wingScore =  1065 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4270,
    CHALLENGER  = { minScore = 4146, wingScore = 4152 },
    GRANDMASTER = { minScore = 4096, wingScore = 4121 },
    MASTER      = { minScore = 3924, wingScore = 4010 },
    DIAMOND     = { minScore = 3765, wingScore = 3844 },
    EMERALD     = { minScore = 3553, wingScore = 3659 },
    PLATINUM    = { minScore = 3216, wingScore = 3355 },
    GOLD        = { minScore = 2828, wingScore = 3020 },
    SILVER      = { minScore = 1799, wingScore = 2550 },
    BRONZE      = { minScore =  479, wingScore =  1065 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4225,
    CHALLENGER  = { minScore = 4069, wingScore = 4133 },
    GRANDMASTER = { minScore = 3966, wingScore = 4011 },
    MASTER      = { minScore = 3821, wingScore = 3890 },
    DIAMOND     = { minScore = 3547, wingScore = 3658 },
    EMERALD     = { minScore = 3411, wingScore = 3450 },
    PLATINUM    = { minScore = 3087, wingScore = 3222 },
    GOLD        = { minScore = 2730, wingScore = 2955 },
    SILVER      = { minScore = 1492, wingScore = 2338 },
    BRONZE      = { minScore =  360, wingScore =  864 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4225,
    CHALLENGER  = { minScore = 3968, wingScore = 4133 },
    GRANDMASTER = { minScore = 3917, wingScore = 3943 },
    MASTER      = { minScore = 3736, wingScore = 3826 },
    DIAMOND     = { minScore = 3590, wingScore = 3663 },
    EMERALD     = { minScore = 3397, wingScore = 3494 },
    PLATINUM    = { minScore = 3108, wingScore = 3223 },
    GOLD        = { minScore = 2730, wingScore = 2910 },
    SILVER      = { minScore = 1492, wingScore = 2338 },
    BRONZE      = { minScore =  360, wingScore =  864 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4225,
    CHALLENGER  = { minScore = 4130, wingScore = 4133 },
    GRANDMASTER = { minScore = 4077, wingScore = 4104 },
    MASTER      = { minScore = 3890, wingScore = 3984 },
    DIAMOND     = { minScore = 3729, wingScore = 3809 },
    EMERALD     = { minScore = 3513, wingScore = 3621 },
    PLATINUM    = { minScore = 3163, wingScore = 3308 },
    GOLD        = { minScore = 2730, wingScore = 2948 },
    SILVER      = { minScore = 1492, wingScore = 2338 },
    BRONZE      = { minScore =  360, wingScore =  864 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4270,
    CHALLENGER  = { minScore = 4097, wingScore = 4144 },
    GRANDMASTER = { minScore = 3993, wingScore = 4028 },
    MASTER      = { minScore = 3857, wingScore = 3910 },
    DIAMOND     = { minScore = 3596, wingScore = 3700 },
    EMERALD     = { minScore = 3439, wingScore = 3502 },
    PLATINUM    = { minScore = 3134, wingScore = 3281 },
    GOLD        = { minScore = 2787, wingScore = 2992 },
    SILVER      = { minScore = 1670, wingScore = 2461 },
    BRONZE      = { minScore =  429, wingScore =  981 },
    IRON        = { minScore =    1, wingScore =  220 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4270,
    CHALLENGER  = { minScore = 3998, wingScore = 4144 },
    GRANDMASTER = { minScore = 3950, wingScore = 3974 },
    MASTER      = { minScore = 3778, wingScore = 3864 },
    DIAMOND     = { minScore = 3638, wingScore = 3709 },
    EMERALD     = { minScore = 3454, wingScore = 3547 },
    PLATINUM    = { minScore = 3145, wingScore = 3274 },
    GOLD        = { minScore = 2788, wingScore = 2946 },
    SILVER      = { minScore = 1674, wingScore = 2463 },
    BRONZE      = { minScore =  430, wingScore =  983 },
    IRON        = { minScore =    1, wingScore =  220 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4270,
    CHALLENGER  = { minScore = 4139, wingScore = 4144 },
    GRANDMASTER = { minScore = 4088, wingScore = 4114 },
    MASTER      = { minScore = 3909, wingScore = 3999 },
    DIAMOND     = { minScore = 3749, wingScore = 3829 },
    EMERALD     = { minScore = 3536, wingScore = 3643 },
    PLATINUM    = { minScore = 3193, wingScore = 3335 },
    GOLD        = { minScore = 2786, wingScore = 2989 },
    SILVER      = { minScore = 1667, wingScore = 2459 },
    BRONZE      = { minScore =  428, wingScore =  978 },
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
