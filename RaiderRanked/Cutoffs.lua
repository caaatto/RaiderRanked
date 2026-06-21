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
    top100Score = 4251,
    CHALLENGER  = { minScore = 4072, wingScore = 4132 },
    GRANDMASTER = { minScore = 3986, wingScore = 4015 },
    MASTER      = { minScore = 3851, wingScore = 3900 },
    DIAMOND     = { minScore = 3612, wingScore = 3705 },
    EMERALD     = { minScore = 3449, wingScore = 3525 },
    PLATINUM    = { minScore = 3158, wingScore = 3311 },
    GOLD        = { minScore = 2818, wingScore = 3015 },
    SILVER      = { minScore = 1795, wingScore = 2543 },
    BRONZE      = { minScore =  484, wingScore =  1066 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4251,
    CHALLENGER  = { minScore = 4009, wingScore = 4132 },
    GRANDMASTER = { minScore = 3959, wingScore = 3984 },
    MASTER      = { minScore = 3784, wingScore = 3872 },
    DIAMOND     = { minScore = 3652, wingScore = 3718 },
    EMERALD     = { minScore = 3476, wingScore = 3564 },
    PLATINUM    = { minScore = 3162, wingScore = 3298 },
    GOLD        = { minScore = 2818, wingScore = 2964 },
    SILVER      = { minScore = 1795, wingScore = 2543 },
    BRONZE      = { minScore =  484, wingScore =  1066 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4251,
    CHALLENGER  = { minScore = 4124, wingScore = 4132 },
    GRANDMASTER = { minScore = 4074, wingScore = 4099 },
    MASTER      = { minScore = 3899, wingScore = 3986 },
    DIAMOND     = { minScore = 3745, wingScore = 3822 },
    EMERALD     = { minScore = 3541, wingScore = 3643 },
    PLATINUM    = { minScore = 3208, wingScore = 3347 },
    GOLD        = { minScore = 2818, wingScore = 3011 },
    SILVER      = { minScore = 1795, wingScore = 2543 },
    BRONZE      = { minScore =  484, wingScore =  1066 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4191,
    CHALLENGER  = { minScore = 4032, wingScore = 4100 },
    GRANDMASTER = { minScore = 3931, wingScore = 3980 },
    MASTER      = { minScore = 3789, wingScore = 3850 },
    DIAMOND     = { minScore = 3532, wingScore = 3633 },
    EMERALD     = { minScore = 3406, wingScore = 3440 },
    PLATINUM    = { minScore = 3080, wingScore = 3210 },
    GOLD        = { minScore = 2722, wingScore = 2941 },
    SILVER      = { minScore = 1488, wingScore = 2331 },
    BRONZE      = { minScore =  361, wingScore =  864 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4191,
    CHALLENGER  = { minScore = 3938, wingScore = 4100 },
    GRANDMASTER = { minScore = 3885, wingScore = 3911 },
    MASTER      = { minScore = 3702, wingScore = 3794 },
    DIAMOND     = { minScore = 3562, wingScore = 3632 },
    EMERALD     = { minScore = 3376, wingScore = 3469 },
    PLATINUM    = { minScore = 3100, wingScore = 3209 },
    GOLD        = { minScore = 2722, wingScore = 2905 },
    SILVER      = { minScore = 1488, wingScore = 2331 },
    BRONZE      = { minScore =  361, wingScore =  864 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4191,
    CHALLENGER  = { minScore = 4081, wingScore = 4100 },
    GRANDMASTER = { minScore = 4029, wingScore = 4055 },
    MASTER      = { minScore = 3850, wingScore = 3940 },
    DIAMOND     = { minScore = 3698, wingScore = 3774 },
    EMERALD     = { minScore = 3496, wingScore = 3597 },
    PLATINUM    = { minScore = 3157, wingScore = 3300 },
    GOLD        = { minScore = 2722, wingScore = 2942 },
    SILVER      = { minScore = 1488, wingScore = 2331 },
    BRONZE      = { minScore =  361, wingScore =  864 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4251,
    CHALLENGER  = { minScore = 4055, wingScore = 4119 },
    GRANDMASTER = { minScore = 3963, wingScore = 4000 },
    MASTER      = { minScore = 3825, wingScore = 3879 },
    DIAMOND     = { minScore = 3579, wingScore = 3675 },
    EMERALD     = { minScore = 3431, wingScore = 3489 },
    PLATINUM    = { minScore = 3125, wingScore = 3269 },
    GOLD        = { minScore = 2778, wingScore = 2984 },
    SILVER      = { minScore = 1667, wingScore = 2454 },
    BRONZE      = { minScore =  433, wingScore =  981 },
    IRON        = { minScore =    1, wingScore =  220 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4251,
    CHALLENGER  = { minScore = 3980, wingScore = 4119 },
    GRANDMASTER = { minScore = 3929, wingScore = 3954 },
    MASTER      = { minScore = 3751, wingScore = 3840 },
    DIAMOND     = { minScore = 3615, wingScore = 3683 },
    EMERALD     = { minScore = 3435, wingScore = 3525 },
    PLATINUM    = { minScore = 3137, wingScore = 3262 },
    GOLD        = { minScore = 2779, wingScore = 2940 },
    SILVER      = { minScore = 1670, wingScore = 2457 },
    BRONZE      = { minScore =  434, wingScore =  984 },
    IRON        = { minScore =    1, wingScore =  221 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4251,
    CHALLENGER  = { minScore = 4106, wingScore = 4118 },
    GRANDMASTER = { minScore = 4055, wingScore = 4080 },
    MASTER      = { minScore = 3878, wingScore = 3966 },
    DIAMOND     = { minScore = 3725, wingScore = 3801 },
    EMERALD     = { minScore = 3522, wingScore = 3623 },
    PLATINUM    = { minScore = 3186, wingScore = 3327 },
    GOLD        = { minScore = 2777, wingScore = 2981 },
    SILVER      = { minScore = 1663, wingScore = 2452 },
    BRONZE      = { minScore =  431, wingScore =  979 },
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
