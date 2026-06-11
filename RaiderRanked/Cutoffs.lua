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
    top100Score = 4217,
    CHALLENGER  = { minScore = 4043, wingScore = 4100 },
    GRANDMASTER = { minScore = 3961, wingScore = 4005 },
    MASTER      = { minScore = 3826, wingScore = 3888 },
    DIAMOND     = { minScore = 3592, wingScore = 3686 },
    EMERALD     = { minScore = 3438, wingScore = 3506 },
    PLATINUM    = { minScore = 3143, wingScore = 3294 },
    GOLD        = { minScore = 2802, wingScore = 3009 },
    SILVER      = { minScore = 1769, wingScore = 2523 },
    BRONZE      = { minScore =  479, wingScore =  1050 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4217,
    CHALLENGER  = { minScore = 3984, wingScore = 4100 },
    GRANDMASTER = { minScore = 3937, wingScore = 3960 },
    MASTER      = { minScore = 3774, wingScore = 3856 },
    DIAMOND     = { minScore = 3638, wingScore = 3706 },
    EMERALD     = { minScore = 3456, wingScore = 3547 },
    PLATINUM    = { minScore = 3149, wingScore = 3278 },
    GOLD        = { minScore = 2802, wingScore = 2953 },
    SILVER      = { minScore = 1769, wingScore = 2523 },
    BRONZE      = { minScore =  479, wingScore =  1050 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4217,
    CHALLENGER  = { minScore = 4087, wingScore = 4100 },
    GRANDMASTER = { minScore = 4042, wingScore = 4065 },
    MASTER      = { minScore = 3884, wingScore = 3963 },
    DIAMOND     = { minScore = 3732, wingScore = 3808 },
    EMERALD     = { minScore = 3530, wingScore = 3631 },
    PLATINUM    = { minScore = 3197, wingScore = 3336 },
    GOLD        = { minScore = 2802, wingScore = 2998 },
    SILVER      = { minScore = 1769, wingScore = 2523 },
    BRONZE      = { minScore =  479, wingScore =  1050 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4158,
    CHALLENGER  = { minScore = 4015, wingScore = 4059 },
    GRANDMASTER = { minScore = 3909, wingScore = 3951 },
    MASTER      = { minScore = 3773, wingScore = 3824 },
    DIAMOND     = { minScore = 3512, wingScore = 3610 },
    EMERALD     = { minScore = 3397, wingScore = 3430 },
    PLATINUM    = { minScore = 3070, wingScore = 3194 },
    GOLD        = { minScore = 2710, wingScore = 2920 },
    SILVER      = { minScore = 1469, wingScore = 2315 },
    BRONZE      = { minScore =  359, wingScore =  855 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4158,
    CHALLENGER  = { minScore = 3915, wingScore = 4059 },
    GRANDMASTER = { minScore = 3863, wingScore = 3889 },
    MASTER      = { minScore = 3681, wingScore = 3772 },
    DIAMOND     = { minScore = 3542, wingScore = 3611 },
    EMERALD     = { minScore = 3356, wingScore = 3449 },
    PLATINUM    = { minScore = 3090, wingScore = 3194 },
    GOLD        = { minScore = 2710, wingScore = 2898 },
    SILVER      = { minScore = 1469, wingScore = 2315 },
    BRONZE      = { minScore =  359, wingScore =  855 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4158,
    CHALLENGER  = { minScore = 4050, wingScore = 4059 },
    GRANDMASTER = { minScore = 4000, wingScore = 4025 },
    MASTER      = { minScore = 3823, wingScore = 3912 },
    DIAMOND     = { minScore = 3671, wingScore = 3747 },
    EMERALD     = { minScore = 3468, wingScore = 3570 },
    PLATINUM    = { minScore = 3142, wingScore = 3277 },
    GOLD        = { minScore = 2710, wingScore = 2932 },
    SILVER      = { minScore = 1469, wingScore = 2315 },
    BRONZE      = { minScore =  359, wingScore =  855 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4217,
    CHALLENGER  = { minScore = 4031, wingScore = 4083 },
    GRANDMASTER = { minScore = 3939, wingScore = 3982 },
    MASTER      = { minScore = 3804, wingScore = 3861 },
    DIAMOND     = { minScore = 3559, wingScore = 3654 },
    EMERALD     = { minScore = 3421, wingScore = 3474 },
    PLATINUM    = { minScore = 3112, wingScore = 3252 },
    GOLD        = { minScore = 2764, wingScore = 2972 },
    SILVER      = { minScore = 1644, wingScore = 2436 },
    BRONZE      = { minScore =  429, wingScore =  968 },
    IRON        = { minScore =    1, wingScore =  220 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4217,
    CHALLENGER  = { minScore = 3956, wingScore = 4083 },
    GRANDMASTER = { minScore = 3907, wingScore = 3931 },
    MASTER      = { minScore = 3736, wingScore = 3822 },
    DIAMOND     = { minScore = 3599, wingScore = 3667 },
    EMERALD     = { minScore = 3415, wingScore = 3507 },
    PLATINUM    = { minScore = 3125, wingScore = 3244 },
    GOLD        = { minScore = 2765, wingScore = 2931 },
    SILVER      = { minScore = 1647, wingScore = 2438 },
    BRONZE      = { minScore =  430, wingScore =  971 },
    IRON        = { minScore =    1, wingScore =  221 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4217,
    CHALLENGER  = { minScore = 4071, wingScore = 4082 },
    GRANDMASTER = { minScore = 4024, wingScore = 4048 },
    MASTER      = { minScore = 3858, wingScore = 3941 },
    DIAMOND     = { minScore = 3706, wingScore = 3782 },
    EMERALD     = { minScore = 3503, wingScore = 3605 },
    PLATINUM    = { minScore = 3173, wingScore = 3311 },
    GOLD        = { minScore = 2762, wingScore = 2970 },
    SILVER      = { minScore = 1640, wingScore = 2434 },
    BRONZE      = { minScore =  427, wingScore =  966 },
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
