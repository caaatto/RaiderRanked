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
    top100Score = 4325,
    CHALLENGER  = { minScore = 4164, wingScore = 4223 },
    GRANDMASTER = { minScore = 4042, wingScore = 4097 },
    MASTER      = { minScore = 3920, wingScore = 3980 },
    DIAMOND     = { minScore = 3652, wingScore = 3761 },
    EMERALD     = { minScore = 3466, wingScore = 3547 },
    PLATINUM    = { minScore = 3170, wingScore = 3331 },
    GOLD        = { minScore = 2826, wingScore = 3019 },
    SILVER      = { minScore = 1755, wingScore = 2535 },
    BRONZE      = { minScore =  443, wingScore =  1031 },
    IRON        = { minScore =    1, wingScore =  238 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4325,
    CHALLENGER  = { minScore = 4063, wingScore = 4223 },
    GRANDMASTER = { minScore = 4017, wingScore = 4040 },
    MASTER      = { minScore = 3855, wingScore = 3936 },
    DIAMOND     = { minScore = 3705, wingScore = 3780 },
    EMERALD     = { minScore = 3506, wingScore = 3606 },
    PLATINUM    = { minScore = 3172, wingScore = 3312 },
    GOLD        = { minScore = 2826, wingScore = 2970 },
    SILVER      = { minScore = 1755, wingScore = 2535 },
    BRONZE      = { minScore =  443, wingScore =  1031 },
    IRON        = { minScore =    1, wingScore =  238 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4325,
    CHALLENGER  = { minScore = 4212, wingScore = 4223 },
    GRANDMASTER = { minScore = 4160, wingScore = 4186 },
    MASTER      = { minScore = 3976, wingScore = 4068 },
    DIAMOND     = { minScore = 3802, wingScore = 3889 },
    EMERALD     = { minScore = 3569, wingScore = 3685 },
    PLATINUM    = { minScore = 3218, wingScore = 3359 },
    GOLD        = { minScore = 2826, wingScore = 3019 },
    SILVER      = { minScore = 1755, wingScore = 2535 },
    BRONZE      = { minScore =  443, wingScore =  1031 },
    IRON        = { minScore =    1, wingScore =  238 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4273,
    CHALLENGER  = { minScore = 4139, wingScore = 4195 },
    GRANDMASTER = { minScore = 4014, wingScore = 4049 },
    MASTER      = { minScore = 3887, wingScore = 3930 },
    DIAMOND     = { minScore = 3559, wingScore = 3679 },
    EMERALD     = { minScore = 3415, wingScore = 3457 },
    PLATINUM    = { minScore = 3088, wingScore = 3228 },
    GOLD        = { minScore = 2727, wingScore = 2957 },
    SILVER      = { minScore = 1453, wingScore = 2320 },
    BRONZE      = { minScore =  349, wingScore =  838 },
    IRON        = { minScore =    1, wingScore =  181 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4273,
    CHALLENGER  = { minScore = 4015, wingScore = 4195 },
    GRANDMASTER = { minScore = 3963, wingScore = 3989 },
    MASTER      = { minScore = 3777, wingScore = 3870 },
    DIAMOND     = { minScore = 3622, wingScore = 3699 },
    EMERALD     = { minScore = 3414, wingScore = 3518 },
    PLATINUM    = { minScore = 3112, wingScore = 3231 },
    GOLD        = { minScore = 2727, wingScore = 2909 },
    SILVER      = { minScore = 1453, wingScore = 2320 },
    BRONZE      = { minScore =  349, wingScore =  838 },
    IRON        = { minScore =    1, wingScore =  181 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4273,
    CHALLENGER  = { minScore = 4183, wingScore = 4195 },
    GRANDMASTER = { minScore = 4127, wingScore = 4155 },
    MASTER      = { minScore = 3929, wingScore = 4028 },
    DIAMOND     = { minScore = 3756, wingScore = 3843 },
    EMERALD     = { minScore = 3525, wingScore = 3640 },
    PLATINUM    = { minScore = 3165, wingScore = 3311 },
    GOLD        = { minScore = 2727, wingScore = 2947 },
    SILVER      = { minScore = 1453, wingScore = 2320 },
    BRONZE      = { minScore =  349, wingScore =  838 },
    IRON        = { minScore =    1, wingScore =  181 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4325,
    CHALLENGER  = { minScore = 4153, wingScore = 4211 },
    GRANDMASTER = { minScore = 4030, wingScore = 4077 },
    MASTER      = { minScore = 3906, wingScore = 3959 },
    DIAMOND     = { minScore = 3613, wingScore = 3727 },
    EMERALD     = { minScore = 3445, wingScore = 3509 },
    PLATINUM    = { minScore = 3136, wingScore = 3288 },
    GOLD        = { minScore = 2784, wingScore = 2993 },
    SILVER      = { minScore = 1628, wingScore = 2445 },
    BRONZE      = { minScore =  403, wingScore =  950 },
    IRON        = { minScore =    1, wingScore =  214 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4325,
    CHALLENGER  = { minScore = 4043, wingScore = 4212 },
    GRANDMASTER = { minScore = 3995, wingScore = 4019 },
    MASTER      = { minScore = 3823, wingScore = 3909 },
    DIAMOND     = { minScore = 3671, wingScore = 3747 },
    EMERALD     = { minScore = 3468, wingScore = 3570 },
    PLATINUM    = { minScore = 3147, wingScore = 3279 },
    GOLD        = { minScore = 2785, wingScore = 2945 },
    SILVER      = { minScore = 1631, wingScore = 2447 },
    BRONZE      = { minScore =  404, wingScore =  952 },
    IRON        = { minScore =    1, wingScore =  215 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4325,
    CHALLENGER  = { minScore = 4199, wingScore = 4211 },
    GRANDMASTER = { minScore = 4146, wingScore = 4173 },
    MASTER      = { minScore = 3956, wingScore = 4051 },
    DIAMOND     = { minScore = 3782, wingScore = 3869 },
    EMERALD     = { minScore = 3550, wingScore = 3666 },
    PLATINUM    = { minScore = 3195, wingScore = 3338 },
    GOLD        = { minScore = 2783, wingScore = 2988 },
    SILVER      = { minScore = 1625, wingScore = 2442 },
    BRONZE      = { minScore =  402, wingScore =  948 },
    IRON        = { minScore =    1, wingScore =  213 },
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
