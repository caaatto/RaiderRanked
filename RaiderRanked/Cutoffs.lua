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
    top100Score = 3911,
    CHALLENGER  = { minScore = 3773, wingScore = 3808 },
    GRANDMASTER = { minScore = 3677, wingScore = 3716 },
    MASTER      = { minScore = 3559, wingScore = 3614 },
    DIAMOND     = { minScore = 3367, wingScore = 3440 },
    EMERALD     = { minScore = 3223, wingScore = 3295 },
    PLATINUM    = { minScore = 2997, wingScore = 3071 },
    GOLD        = { minScore = 2654, wingScore = 2775 },
    SILVER      = { minScore = 1492, wingScore = 2276 },
    BRONZE      = { minScore =  368, wingScore =  894 },
    IRON        = { minScore =    1, wingScore =  198 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3911,
    CHALLENGER  = { minScore = 3711, wingScore = 3808 },
    GRANDMASTER = { minScore = 3669, wingScore = 3690 },
    MASTER      = { minScore = 3523, wingScore = 3596 },
    DIAMOND     = { minScore = 3392, wingScore = 3458 },
    EMERALD     = { minScore = 3219, wingScore = 3306 },
    PLATINUM    = { minScore = 2942, wingScore = 3056 },
    GOLD        = { minScore = 2654, wingScore = 2780 },
    SILVER      = { minScore = 1492, wingScore = 2276 },
    BRONZE      = { minScore =  368, wingScore =  894 },
    IRON        = { minScore =    1, wingScore =  198 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3911,
    CHALLENGER  = { minScore = 3794, wingScore = 3808 },
    GRANDMASTER = { minScore = 3752, wingScore = 3773 },
    MASTER      = { minScore = 3605, wingScore = 3679 },
    DIAMOND     = { minScore = 3471, wingScore = 3538 },
    EMERALD     = { minScore = 3293, wingScore = 3382 },
    PLATINUM    = { minScore = 3002, wingScore = 3123 },
    GOLD        = { minScore = 2654, wingScore = 2822 },
    SILVER      = { minScore = 1492, wingScore = 2276 },
    BRONZE      = { minScore =  368, wingScore =  894 },
    IRON        = { minScore =    1, wingScore =  198 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3876,
    CHALLENGER  = { minScore = 3740, wingScore = 3789 },
    GRANDMASTER = { minScore = 3641, wingScore = 3673 },
    MASTER      = { minScore = 3504, wingScore = 3552 },
    DIAMOND     = { minScore = 3293, wingScore = 3376 },
    EMERALD     = { minScore = 3132, wingScore = 3203 },
    PLATINUM    = { minScore = 2888, wingScore = 3017 },
    GOLD        = { minScore = 2573, wingScore = 2702 },
    SILVER      = { minScore = 1249, wingScore = 2074 },
    BRONZE      = { minScore =  335, wingScore =  720 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3876,
    CHALLENGER  = { minScore = 3653, wingScore = 3789 },
    GRANDMASTER = { minScore = 3605, wingScore = 3629 },
    MASTER      = { minScore = 3434, wingScore = 3520 },
    DIAMOND     = { minScore = 3307, wingScore = 3371 },
    EMERALD     = { minScore = 3137, wingScore = 3222 },
    PLATINUM    = { minScore = 2854, wingScore = 2973 },
    GOLD        = { minScore = 2573, wingScore = 2685 },
    SILVER      = { minScore = 1249, wingScore = 2074 },
    BRONZE      = { minScore =  335, wingScore =  720 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3876,
    CHALLENGER  = { minScore = 3778, wingScore = 3789 },
    GRANDMASTER = { minScore = 3728, wingScore = 3753 },
    MASTER      = { minScore = 3551, wingScore = 3639 },
    DIAMOND     = { minScore = 3406, wingScore = 3478 },
    EMERALD     = { minScore = 3212, wingScore = 3309 },
    PLATINUM    = { minScore = 2912, wingScore = 3034 },
    GOLD        = { minScore = 2573, wingScore = 2740 },
    SILVER      = { minScore = 1249, wingScore = 2074 },
    BRONZE      = { minScore =  335, wingScore =  720 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3911,
    CHALLENGER  = { minScore = 3759, wingScore = 3800 },
    GRANDMASTER = { minScore = 3662, wingScore = 3698 },
    MASTER      = { minScore = 3536, wingScore = 3588 },
    DIAMOND     = { minScore = 3336, wingScore = 3413 },
    EMERALD     = { minScore = 3185, wingScore = 3256 },
    PLATINUM    = { minScore = 2951, wingScore = 3048 },
    GOLD        = { minScore = 2620, wingScore = 2744 },
    SILVER      = { minScore = 1390, wingScore = 2191 },
    BRONZE      = { minScore =  354, wingScore =  821 },
    IRON        = { minScore =    1, wingScore =  186 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3911,
    CHALLENGER  = { minScore = 3687, wingScore = 3800 },
    GRANDMASTER = { minScore = 3643, wingScore = 3665 },
    MASTER      = { minScore = 3487, wingScore = 3565 },
    DIAMOND     = { minScore = 3357, wingScore = 3423 },
    EMERALD     = { minScore = 3186, wingScore = 3272 },
    PLATINUM    = { minScore = 2906, wingScore = 3022 },
    GOLD        = { minScore = 2621, wingScore = 2741 },
    SILVER      = { minScore = 1393, wingScore = 2194 },
    BRONZE      = { minScore =  355, wingScore =  823 },
    IRON        = { minScore =    1, wingScore =  187 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3911,
    CHALLENGER  = { minScore = 3787, wingScore = 3800 },
    GRANDMASTER = { minScore = 3742, wingScore = 3764 },
    MASTER      = { minScore = 3582, wingScore = 3662 },
    DIAMOND     = { minScore = 3443, wingScore = 3512 },
    EMERALD     = { minScore = 3258, wingScore = 3350 },
    PLATINUM    = { minScore = 2963, wingScore = 3084 },
    GOLD        = { minScore = 2619, wingScore = 2787 },
    SILVER      = { minScore = 1387, wingScore = 2189 },
    BRONZE      = { minScore =  354, wingScore =  819 },
    IRON        = { minScore =    1, wingScore =  186 },
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
