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
    top100Score = 4211,
    CHALLENGER  = { minScore = 4041, wingScore = 4098 },
    GRANDMASTER = { minScore = 3957, wingScore = 4002 },
    MASTER      = { minScore = 3824, wingScore = 3886 },
    DIAMOND     = { minScore = 3591, wingScore = 3684 },
    EMERALD     = { minScore = 3437, wingScore = 3505 },
    PLATINUM    = { minScore = 3142, wingScore = 3292 },
    GOLD        = { minScore = 2800, wingScore = 3008 },
    SILVER      = { minScore = 1765, wingScore = 2521 },
    BRONZE      = { minScore =  476, wingScore =  1048 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4211,
    CHALLENGER  = { minScore = 3983, wingScore = 4098 },
    GRANDMASTER = { minScore = 3936, wingScore = 3959 },
    MASTER      = { minScore = 3774, wingScore = 3855 },
    DIAMOND     = { minScore = 3637, wingScore = 3705 },
    EMERALD     = { minScore = 3454, wingScore = 3545 },
    PLATINUM    = { minScore = 3147, wingScore = 3277 },
    GOLD        = { minScore = 2800, wingScore = 2952 },
    SILVER      = { minScore = 1765, wingScore = 2521 },
    BRONZE      = { minScore =  476, wingScore =  1048 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4211,
    CHALLENGER  = { minScore = 4086, wingScore = 4098 },
    GRANDMASTER = { minScore = 4041, wingScore = 4064 },
    MASTER      = { minScore = 3882, wingScore = 3962 },
    DIAMOND     = { minScore = 3731, wingScore = 3806 },
    EMERALD     = { minScore = 3529, wingScore = 3630 },
    PLATINUM    = { minScore = 3196, wingScore = 3335 },
    GOLD        = { minScore = 2800, wingScore = 2997 },
    SILVER      = { minScore = 1765, wingScore = 2521 },
    BRONZE      = { minScore =  476, wingScore =  1048 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4158,
    CHALLENGER  = { minScore = 4014, wingScore = 4058 },
    GRANDMASTER = { minScore = 3908, wingScore = 3949 },
    MASTER      = { minScore = 3772, wingScore = 3822 },
    DIAMOND     = { minScore = 3511, wingScore = 3609 },
    EMERALD     = { minScore = 3395, wingScore = 3430 },
    PLATINUM    = { minScore = 3069, wingScore = 3193 },
    GOLD        = { minScore = 2709, wingScore = 2919 },
    SILVER      = { minScore = 1468, wingScore = 2314 },
    BRONZE      = { minScore =  359, wingScore =  855 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4158,
    CHALLENGER  = { minScore = 3913, wingScore = 4058 },
    GRANDMASTER = { minScore = 3861, wingScore = 3887 },
    MASTER      = { minScore = 3680, wingScore = 3771 },
    DIAMOND     = { minScore = 3541, wingScore = 3610 },
    EMERALD     = { minScore = 3355, wingScore = 3448 },
    PLATINUM    = { minScore = 3089, wingScore = 3193 },
    GOLD        = { minScore = 2709, wingScore = 2897 },
    SILVER      = { minScore = 1468, wingScore = 2314 },
    BRONZE      = { minScore =  359, wingScore =  855 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4158,
    CHALLENGER  = { minScore = 4048, wingScore = 4058 },
    GRANDMASTER = { minScore = 3998, wingScore = 4023 },
    MASTER      = { minScore = 3823, wingScore = 3910 },
    DIAMOND     = { minScore = 3670, wingScore = 3746 },
    EMERALD     = { minScore = 3467, wingScore = 3569 },
    PLATINUM    = { minScore = 3141, wingScore = 3276 },
    GOLD        = { minScore = 2709, wingScore = 2932 },
    SILVER      = { minScore = 1468, wingScore = 2314 },
    BRONZE      = { minScore =  359, wingScore =  855 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4211,
    CHALLENGER  = { minScore = 4030, wingScore = 4081 },
    GRANDMASTER = { minScore = 3937, wingScore = 3980 },
    MASTER      = { minScore = 3802, wingScore = 3859 },
    DIAMOND     = { minScore = 3558, wingScore = 3653 },
    EMERALD     = { minScore = 3419, wingScore = 3474 },
    PLATINUM    = { minScore = 3111, wingScore = 3251 },
    GOLD        = { minScore = 2762, wingScore = 2971 },
    SILVER      = { minScore = 1641, wingScore = 2434 },
    BRONZE      = { minScore =  427, wingScore =  967 },
    IRON        = { minScore =    1, wingScore =  220 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4211,
    CHALLENGER  = { minScore = 3955, wingScore = 4082 },
    GRANDMASTER = { minScore = 3905, wingScore = 3930 },
    MASTER      = { minScore = 3736, wingScore = 3821 },
    DIAMOND     = { minScore = 3598, wingScore = 3666 },
    EMERALD     = { minScore = 3414, wingScore = 3506 },
    PLATINUM    = { minScore = 3123, wingScore = 3243 },
    GOLD        = { minScore = 2763, wingScore = 2930 },
    SILVER      = { minScore = 1644, wingScore = 2437 },
    BRONZE      = { minScore =  428, wingScore =  969 },
    IRON        = { minScore =    1, wingScore =  221 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4211,
    CHALLENGER  = { minScore = 4070, wingScore = 4081 },
    GRANDMASTER = { minScore = 4023, wingScore = 4046 },
    MASTER      = { minScore = 3857, wingScore = 3940 },
    DIAMOND     = { minScore = 3705, wingScore = 3780 },
    EMERALD     = { minScore = 3502, wingScore = 3604 },
    PLATINUM    = { minScore = 3172, wingScore = 3310 },
    GOLD        = { minScore = 2761, wingScore = 2969 },
    SILVER      = { minScore = 1637, wingScore = 2432 },
    BRONZE      = { minScore =  426, wingScore =  965 },
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
