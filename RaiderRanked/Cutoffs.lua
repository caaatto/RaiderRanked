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
    top100Score = 4201,
    CHALLENGER  = { minScore = 4031, wingScore = 4086 },
    GRANDMASTER = { minScore = 3950, wingScore = 3992 },
    MASTER      = { minScore = 3817, wingScore = 3877 },
    DIAMOND     = { minScore = 3585, wingScore = 3678 },
    EMERALD     = { minScore = 3435, wingScore = 3500 },
    PLATINUM    = { minScore = 3139, wingScore = 3286 },
    GOLD        = { minScore = 2798, wingScore = 3007 },
    SILVER      = { minScore = 1768, wingScore = 2521 },
    BRONZE      = { minScore =  485, wingScore =  1052 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4201,
    CHALLENGER  = { minScore = 3975, wingScore = 4086 },
    GRANDMASTER = { minScore = 3929, wingScore = 3952 },
    MASTER      = { minScore = 3769, wingScore = 3849 },
    DIAMOND     = { minScore = 3631, wingScore = 3700 },
    EMERALD     = { minScore = 3448, wingScore = 3540 },
    PLATINUM    = { minScore = 3144, wingScore = 3272 },
    GOLD        = { minScore = 2798, wingScore = 2951 },
    SILVER      = { minScore = 1768, wingScore = 2521 },
    BRONZE      = { minScore =  485, wingScore =  1052 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4201,
    CHALLENGER  = { minScore = 4076, wingScore = 4086 },
    GRANDMASTER = { minScore = 4031, wingScore = 4053 },
    MASTER      = { minScore = 3872, wingScore = 3951 },
    DIAMOND     = { minScore = 3723, wingScore = 3798 },
    EMERALD     = { minScore = 3525, wingScore = 3624 },
    PLATINUM    = { minScore = 3194, wingScore = 3333 },
    GOLD        = { minScore = 2798, wingScore = 2994 },
    SILVER      = { minScore = 1768, wingScore = 2521 },
    BRONZE      = { minScore =  485, wingScore =  1052 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4151,
    CHALLENGER  = { minScore = 4011, wingScore = 4046 },
    GRANDMASTER = { minScore = 3903, wingScore = 3939 },
    MASTER      = { minScore = 3765, wingScore = 3813 },
    DIAMOND     = { minScore = 3506, wingScore = 3601 },
    EMERALD     = { minScore = 3385, wingScore = 3427 },
    PLATINUM    = { minScore = 3066, wingScore = 3188 },
    GOLD        = { minScore = 2706, wingScore = 2913 },
    SILVER      = { minScore = 1468, wingScore = 2312 },
    BRONZE      = { minScore =  361, wingScore =  857 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4151,
    CHALLENGER  = { minScore = 3909, wingScore = 4046 },
    GRANDMASTER = { minScore = 3857, wingScore = 3883 },
    MASTER      = { minScore = 3675, wingScore = 3766 },
    DIAMOND     = { minScore = 3536, wingScore = 3605 },
    EMERALD     = { minScore = 3350, wingScore = 3443 },
    PLATINUM    = { minScore = 3086, wingScore = 3188 },
    GOLD        = { minScore = 2706, wingScore = 2895 },
    SILVER      = { minScore = 1468, wingScore = 2312 },
    BRONZE      = { minScore =  361, wingScore =  857 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4151,
    CHALLENGER  = { minScore = 4040, wingScore = 4046 },
    GRANDMASTER = { minScore = 3990, wingScore = 4015 },
    MASTER      = { minScore = 3813, wingScore = 3901 },
    DIAMOND     = { minScore = 3661, wingScore = 3737 },
    EMERALD     = { minScore = 3459, wingScore = 3560 },
    PLATINUM    = { minScore = 3138, wingScore = 3270 },
    GOLD        = { minScore = 2706, wingScore = 2929 },
    SILVER      = { minScore = 1468, wingScore = 2312 },
    BRONZE      = { minScore =  361, wingScore =  857 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4201,
    CHALLENGER  = { minScore = 4023, wingScore = 4069 },
    GRANDMASTER = { minScore = 3930, wingScore = 3970 },
    MASTER      = { minScore = 3795, wingScore = 3850 },
    DIAMOND     = { minScore = 3552, wingScore = 3646 },
    EMERALD     = { minScore = 3414, wingScore = 3469 },
    PLATINUM    = { minScore = 3108, wingScore = 3245 },
    GOLD        = { minScore = 2760, wingScore = 2968 },
    SILVER      = { minScore = 1643, wingScore = 2434 },
    BRONZE      = { minScore =  433, wingScore =  970 },
    IRON        = { minScore =    1, wingScore =  220 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4201,
    CHALLENGER  = { minScore = 3948, wingScore = 4070 },
    GRANDMASTER = { minScore = 3900, wingScore = 3924 },
    MASTER      = { minScore = 3731, wingScore = 3815 },
    DIAMOND     = { minScore = 3592, wingScore = 3661 },
    EMERALD     = { minScore = 3408, wingScore = 3501 },
    PLATINUM    = { minScore = 3120, wingScore = 3238 },
    GOLD        = { minScore = 2761, wingScore = 2928 },
    SILVER      = { minScore = 1646, wingScore = 2436 },
    BRONZE      = { minScore =  435, wingScore =  973 },
    IRON        = { minScore =    1, wingScore =  221 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4201,
    CHALLENGER  = { minScore = 4061, wingScore = 4069 },
    GRANDMASTER = { minScore = 4013, wingScore = 4037 },
    MASTER      = { minScore = 3847, wingScore = 3930 },
    DIAMOND     = { minScore = 3696, wingScore = 3772 },
    EMERALD     = { minScore = 3497, wingScore = 3596 },
    PLATINUM    = { minScore = 3170, wingScore = 3306 },
    GOLD        = { minScore = 2758, wingScore = 2966 },
    SILVER      = { minScore = 1639, wingScore = 2431 },
    BRONZE      = { minScore =  432, wingScore =  968 },
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
