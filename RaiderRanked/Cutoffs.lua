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
    top100Score = 4255,
    CHALLENGER  = { minScore = 4090, wingScore = 4137 },
    GRANDMASTER = { minScore = 4002, wingScore = 4025 },
    MASTER      = { minScore = 3864, wingScore = 3909 },
    DIAMOND     = { minScore = 3621, wingScore = 3716 },
    EMERALD     = { minScore = 3454, wingScore = 3533 },
    PLATINUM    = { minScore = 3163, wingScore = 3317 },
    GOLD        = { minScore = 2823, wingScore = 3017 },
    SILVER      = { minScore = 1797, wingScore = 2546 },
    BRONZE      = { minScore =  483, wingScore =  1067 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4255,
    CHALLENGER  = { minScore = 4013, wingScore = 4137 },
    GRANDMASTER = { minScore = 3964, wingScore = 3988 },
    MASTER      = { minScore = 3793, wingScore = 3879 },
    DIAMOND     = { minScore = 3662, wingScore = 3728 },
    EMERALD     = { minScore = 3487, wingScore = 3575 },
    PLATINUM    = { minScore = 3168, wingScore = 3307 },
    GOLD        = { minScore = 2823, wingScore = 2967 },
    SILVER      = { minScore = 1797, wingScore = 2546 },
    BRONZE      = { minScore =  483, wingScore =  1067 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4255,
    CHALLENGER  = { minScore = 4134, wingScore = 4137 },
    GRANDMASTER = { minScore = 4084, wingScore = 4109 },
    MASTER      = { minScore = 3909, wingScore = 3997 },
    DIAMOND     = { minScore = 3754, wingScore = 3831 },
    EMERALD     = { minScore = 3546, wingScore = 3650 },
    PLATINUM    = { minScore = 3212, wingScore = 3350 },
    GOLD        = { minScore = 2823, wingScore = 3015 },
    SILVER      = { minScore = 1797, wingScore = 2546 },
    BRONZE      = { minScore =  483, wingScore =  1067 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4206,
    CHALLENGER  = { minScore = 4044, wingScore = 4119 },
    GRANDMASTER = { minScore = 3944, wingScore = 3995 },
    MASTER      = { minScore = 3802, wingScore = 3865 },
    DIAMOND     = { minScore = 3539, wingScore = 3646 },
    EMERALD     = { minScore = 3408, wingScore = 3445 },
    PLATINUM    = { minScore = 3083, wingScore = 3215 },
    GOLD        = { minScore = 2726, wingScore = 2948 },
    SILVER      = { minScore = 1490, wingScore = 2334 },
    BRONZE      = { minScore =  361, wingScore =  865 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4206,
    CHALLENGER  = { minScore = 3952, wingScore = 4119 },
    GRANDMASTER = { minScore = 3900, wingScore = 3926 },
    MASTER      = { minScore = 3716, wingScore = 3808 },
    DIAMOND     = { minScore = 3574, wingScore = 3645 },
    EMERALD     = { minScore = 3385, wingScore = 3480 },
    PLATINUM    = { minScore = 3104, wingScore = 3216 },
    GOLD        = { minScore = 2726, wingScore = 2907 },
    SILVER      = { minScore = 1490, wingScore = 2334 },
    BRONZE      = { minScore =  361, wingScore =  865 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4206,
    CHALLENGER  = { minScore = 4101, wingScore = 4119 },
    GRANDMASTER = { minScore = 4049, wingScore = 4075 },
    MASTER      = { minScore = 3865, wingScore = 3957 },
    DIAMOND     = { minScore = 3711, wingScore = 3788 },
    EMERALD     = { minScore = 3505, wingScore = 3608 },
    PLATINUM    = { minScore = 3161, wingScore = 3305 },
    GOLD        = { minScore = 2726, wingScore = 2945 },
    SILVER      = { minScore = 1490, wingScore = 2334 },
    BRONZE      = { minScore =  361, wingScore =  865 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4255,
    CHALLENGER  = { minScore = 4071, wingScore = 4129 },
    GRANDMASTER = { minScore = 3978, wingScore = 4012 },
    MASTER      = { minScore = 3838, wingScore = 3891 },
    DIAMOND     = { minScore = 3587, wingScore = 3687 },
    EMERALD     = { minScore = 3435, wingScore = 3496 },
    PLATINUM    = { minScore = 3129, wingScore = 3274 },
    GOLD        = { minScore = 2782, wingScore = 2988 },
    SILVER      = { minScore = 1668, wingScore = 2457 },
    BRONZE      = { minScore =  432, wingScore =  982 },
    IRON        = { minScore =    1, wingScore =  220 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4255,
    CHALLENGER  = { minScore = 3988, wingScore = 4130 },
    GRANDMASTER = { minScore = 3938, wingScore = 3963 },
    MASTER      = { minScore = 3762, wingScore = 3850 },
    DIAMOND     = { minScore = 3626, wingScore = 3694 },
    EMERALD     = { minScore = 3445, wingScore = 3536 },
    PLATINUM    = { minScore = 3142, wingScore = 3270 },
    GOLD        = { minScore = 2783, wingScore = 2943 },
    SILVER      = { minScore = 1672, wingScore = 2460 },
    BRONZE      = { minScore =  433, wingScore =  985 },
    IRON        = { minScore =    1, wingScore =  221 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4255,
    CHALLENGER  = { minScore = 4120, wingScore = 4129 },
    GRANDMASTER = { minScore = 4069, wingScore = 4094 },
    MASTER      = { minScore = 3890, wingScore = 3980 },
    DIAMOND     = { minScore = 3735, wingScore = 3812 },
    EMERALD     = { minScore = 3528, wingScore = 3632 },
    PLATINUM    = { minScore = 3190, wingScore = 3331 },
    GOLD        = { minScore = 2781, wingScore = 2985 },
    SILVER      = { minScore = 1665, wingScore = 2455 },
    BRONZE      = { minScore =  430, wingScore =  980 },
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
