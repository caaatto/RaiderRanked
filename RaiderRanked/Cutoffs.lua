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
    top100Score = 4106,
    CHALLENGER  = { minScore = 3937, wingScore = 3995 },
    GRANDMASTER = { minScore = 3856, wingScore = 3893 },
    MASTER      = { minScore = 3732, wingScore = 3779 },
    DIAMOND     = { minScore = 3516, wingScore = 3592 },
    EMERALD     = { minScore = 3381, wingScore = 3432 },
    PLATINUM    = { minScore = 3082, wingScore = 3211 },
    GOLD        = { minScore = 2739, wingScore = 2940 },
    SILVER      = { minScore = 1670, wingScore = 2435 },
    BRONZE      = { minScore =  409, wingScore =  994 },
    IRON        = { minScore =    1, wingScore =  230 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4106,
    CHALLENGER  = { minScore = 3890, wingScore = 3995 },
    GRANDMASTER = { minScore = 3841, wingScore = 3865 },
    MASTER      = { minScore = 3670, wingScore = 3756 },
    DIAMOND     = { minScore = 3541, wingScore = 3606 },
    EMERALD     = { minScore = 3369, wingScore = 3455 },
    PLATINUM    = { minScore = 3101, wingScore = 3210 },
    GOLD        = { minScore = 2739, wingScore = 2914 },
    SILVER      = { minScore = 1670, wingScore = 2435 },
    BRONZE      = { minScore =  409, wingScore =  994 },
    IRON        = { minScore =    1, wingScore =  230 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4106,
    CHALLENGER  = { minScore = 3980, wingScore = 3995 },
    GRANDMASTER = { minScore = 3935, wingScore = 3957 },
    MASTER      = { minScore = 3777, wingScore = 3856 },
    DIAMOND     = { minScore = 3638, wingScore = 3707 },
    EMERALD     = { minScore = 3451, wingScore = 3544 },
    PLATINUM    = { minScore = 3142, wingScore = 3272 },
    GOLD        = { minScore = 2739, wingScore = 2942 },
    SILVER      = { minScore = 1670, wingScore = 2435 },
    BRONZE      = { minScore =  409, wingScore =  994 },
    IRON        = { minScore =    1, wingScore =  230 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4034,
    CHALLENGER  = { minScore = 3901, wingScore = 3944 },
    GRANDMASTER = { minScore = 3799, wingScore = 3847 },
    MASTER      = { minScore = 3664, wingScore = 3719 },
    DIAMOND     = { minScore = 3435, wingScore = 3522 },
    EMERALD     = { minScore = 3295, wingScore = 3368 },
    PLATINUM    = { minScore = 3029, wingScore = 3121 },
    GOLD        = { minScore = 2667, wingScore = 2837 },
    SILVER      = { minScore = 1385, wingScore = 2236 },
    BRONZE      = { minScore =  340, wingScore =  811 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4034,
    CHALLENGER  = { minScore = 3815, wingScore = 3944 },
    GRANDMASTER = { minScore = 3763, wingScore = 3789 },
    MASTER      = { minScore = 3583, wingScore = 3673 },
    DIAMOND     = { minScore = 3451, wingScore = 3517 },
    EMERALD     = { minScore = 3274, wingScore = 3362 },
    PLATINUM    = { minScore = 3007, wingScore = 3114 },
    GOLD        = { minScore = 2667, wingScore = 2829 },
    SILVER      = { minScore = 1385, wingScore = 2236 },
    BRONZE      = { minScore =  340, wingScore =  811 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4034,
    CHALLENGER  = { minScore = 3937, wingScore = 3944 },
    GRANDMASTER = { minScore = 3888, wingScore = 3912 },
    MASTER      = { minScore = 3717, wingScore = 3803 },
    DIAMOND     = { minScore = 3569, wingScore = 3643 },
    EMERALD     = { minScore = 3371, wingScore = 3470 },
    PLATINUM    = { minScore = 3088, wingScore = 3198 },
    GOLD        = { minScore = 2667, wingScore = 2893 },
    SILVER      = { minScore = 1385, wingScore = 2236 },
    BRONZE      = { minScore =  340, wingScore =  811 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4106,
    CHALLENGER  = { minScore = 3922, wingScore = 3974 },
    GRANDMASTER = { minScore = 3832, wingScore = 3874 },
    MASTER      = { minScore = 3704, wingScore = 3754 },
    DIAMOND     = { minScore = 3482, wingScore = 3563 },
    EMERALD     = { minScore = 3345, wingScore = 3405 },
    PLATINUM    = { minScore = 3060, wingScore = 3174 },
    GOLD        = { minScore = 2709, wingScore = 2897 },
    SILVER      = { minScore = 1551, wingScore = 2352 },
    BRONZE      = { minScore =  380, wingScore =  918 },
    IRON        = { minScore =    1, wingScore =  205 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4106,
    CHALLENGER  = { minScore = 3860, wingScore = 3974 },
    GRANDMASTER = { minScore = 3809, wingScore = 3834 },
    MASTER      = { minScore = 3635, wingScore = 3722 },
    DIAMOND     = { minScore = 3505, wingScore = 3570 },
    EMERALD     = { minScore = 3331, wingScore = 3417 },
    PLATINUM    = { minScore = 3063, wingScore = 3171 },
    GOLD        = { minScore = 2710, wingScore = 2880 },
    SILVER      = { minScore = 1555, wingScore = 2354 },
    BRONZE      = { minScore =  381, wingScore =  920 },
    IRON        = { minScore =    1, wingScore =  206 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4106,
    CHALLENGER  = { minScore = 3962, wingScore = 3973 },
    GRANDMASTER = { minScore = 3915, wingScore = 3938 },
    MASTER      = { minScore = 3751, wingScore = 3833 },
    DIAMOND     = { minScore = 3608, wingScore = 3680 },
    EMERALD     = { minScore = 3417, wingScore = 3512 },
    PLATINUM    = { minScore = 3119, wingScore = 3240 },
    GOLD        = { minScore = 2708, wingScore = 2921 },
    SILVER      = { minScore = 1548, wingScore = 2350 },
    BRONZE      = { minScore =  379, wingScore =  916 },
    IRON        = { minScore =    1, wingScore =  204 },
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
