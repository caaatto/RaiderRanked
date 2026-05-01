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
    top100Score = 3938,
    CHALLENGER  = { minScore = 3788, wingScore = 3840 },
    GRANDMASTER = { minScore = 3704, wingScore = 3747 },
    MASTER      = { minScore = 3581, wingScore = 3640 },
    DIAMOND     = { minScore = 3391, wingScore = 3457 },
    EMERALD     = { minScore = 3241, wingScore = 3311 },
    PLATINUM    = { minScore = 3005, wingScore = 3085 },
    GOLD        = { minScore = 2662, wingScore = 2792 },
    SILVER      = { minScore = 1518, wingScore = 2297 },
    BRONZE      = { minScore =  369, wingScore =  907 },
    IRON        = { minScore =    1, wingScore =  200 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3938,
    CHALLENGER  = { minScore = 3742, wingScore = 3840 },
    GRANDMASTER = { minScore = 3697, wingScore = 3720 },
    MASTER      = { minScore = 3539, wingScore = 3618 },
    DIAMOND     = { minScore = 3409, wingScore = 3474 },
    EMERALD     = { minScore = 3235, wingScore = 3322 },
    PLATINUM    = { minScore = 2961, wingScore = 3074 },
    GOLD        = { minScore = 2662, wingScore = 2796 },
    SILVER      = { minScore = 1518, wingScore = 2297 },
    BRONZE      = { minScore =  369, wingScore =  907 },
    IRON        = { minScore =    1, wingScore =  200 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3938,
    CHALLENGER  = { minScore = 3822, wingScore = 3840 },
    GRANDMASTER = { minScore = 3779, wingScore = 3800 },
    MASTER      = { minScore = 3632, wingScore = 3706 },
    DIAMOND     = { minScore = 3494, wingScore = 3563 },
    EMERALD     = { minScore = 3311, wingScore = 3403 },
    PLATINUM    = { minScore = 3022, wingScore = 3141 },
    GOLD        = { minScore = 2662, wingScore = 2840 },
    SILVER      = { minScore = 1518, wingScore = 2297 },
    BRONZE      = { minScore =  369, wingScore =  907 },
    IRON        = { minScore =    1, wingScore =  200 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3894,
    CHALLENGER  = { minScore = 3764, wingScore = 3810 },
    GRANDMASTER = { minScore = 3658, wingScore = 3696 },
    MASTER      = { minScore = 3527, wingScore = 3570 },
    DIAMOND     = { minScore = 3313, wingScore = 3402 },
    EMERALD     = { minScore = 3153, wingScore = 3222 },
    PLATINUM    = { minScore = 2914, wingScore = 3027 },
    GOLD        = { minScore = 2591, wingScore = 2717 },
    SILVER      = { minScore = 1274, wingScore = 2096 },
    BRONZE      = { minScore =  337, wingScore =  732 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3894,
    CHALLENGER  = { minScore = 3669, wingScore = 3810 },
    GRANDMASTER = { minScore = 3620, wingScore = 3645 },
    MASTER      = { minScore = 3449, wingScore = 3534 },
    DIAMOND     = { minScore = 3321, wingScore = 3385 },
    EMERALD     = { minScore = 3151, wingScore = 3236 },
    PLATINUM    = { minScore = 2870, wingScore = 2988 },
    GOLD        = { minScore = 2591, wingScore = 2702 },
    SILVER      = { minScore = 1274, wingScore = 2096 },
    BRONZE      = { minScore =  337, wingScore =  732 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3894,
    CHALLENGER  = { minScore = 3796, wingScore = 3810 },
    GRANDMASTER = { minScore = 3746, wingScore = 3771 },
    MASTER      = { minScore = 3568, wingScore = 3657 },
    DIAMOND     = { minScore = 3423, wingScore = 3496 },
    EMERALD     = { minScore = 3230, wingScore = 3327 },
    PLATINUM    = { minScore = 2932, wingScore = 3053 },
    GOLD        = { minScore = 2591, wingScore = 2759 },
    SILVER      = { minScore = 1274, wingScore = 2096 },
    BRONZE      = { minScore =  337, wingScore =  732 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3938,
    CHALLENGER  = { minScore = 3778, wingScore = 3827 },
    GRANDMASTER = { minScore = 3685, wingScore = 3726 },
    MASTER      = { minScore = 3558, wingScore = 3611 },
    DIAMOND     = { minScore = 3358, wingScore = 3434 },
    EMERALD     = { minScore = 3204, wingScore = 3274 },
    PLATINUM    = { minScore = 2967, wingScore = 3061 },
    GOLD        = { minScore = 2632, wingScore = 2761 },
    SILVER      = { minScore = 1416, wingScore = 2213 },
    BRONZE      = { minScore =  356, wingScore =  834 },
    IRON        = { minScore =    1, wingScore =  187 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3938,
    CHALLENGER  = { minScore = 3712, wingScore = 3828 },
    GRANDMASTER = { minScore = 3666, wingScore = 3690 },
    MASTER      = { minScore = 3502, wingScore = 3584 },
    DIAMOND     = { minScore = 3373, wingScore = 3438 },
    EMERALD     = { minScore = 3201, wingScore = 3287 },
    PLATINUM    = { minScore = 2924, wingScore = 3039 },
    GOLD        = { minScore = 2633, wingScore = 2758 },
    SILVER      = { minScore = 1419, wingScore = 2215 },
    BRONZE      = { minScore =  356, wingScore =  836 },
    IRON        = { minScore =    1, wingScore =  188 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3938,
    CHALLENGER  = { minScore = 3811, wingScore = 3827 },
    GRANDMASTER = { minScore = 3765, wingScore = 3788 },
    MASTER      = { minScore = 3604, wingScore = 3685 },
    DIAMOND     = { minScore = 3463, wingScore = 3534 },
    EMERALD     = { minScore = 3276, wingScore = 3370 },
    PLATINUM    = { minScore = 2983, wingScore = 3103 },
    GOLD        = { minScore = 2631, wingScore = 2805 },
    SILVER      = { minScore = 1413, wingScore = 2210 },
    BRONZE      = { minScore =  355, wingScore =  832 },
    IRON        = { minScore =    1, wingScore =  187 },
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
