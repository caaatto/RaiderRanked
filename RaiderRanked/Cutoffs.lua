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
    top100Score = 4335,
    CHALLENGER  = { minScore = 4183, wingScore = 4239 },
    GRANDMASTER = { minScore = 4055, wingScore = 4107 },
    MASTER      = { minScore = 3935, wingScore = 3998 },
    DIAMOND     = { minScore = 3655, wingScore = 3767 },
    EMERALD     = { minScore = 3467, wingScore = 3548 },
    PLATINUM    = { minScore = 3170, wingScore = 3333 },
    GOLD        = { minScore = 2824, wingScore = 3019 },
    SILVER      = { minScore = 1743, wingScore = 2530 },
    BRONZE      = { minScore =  440, wingScore =  1022 },
    IRON        = { minScore =    1, wingScore =  237 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4335,
    CHALLENGER  = { minScore = 4074, wingScore = 4239 },
    GRANDMASTER = { minScore = 4029, wingScore = 4052 },
    MASTER      = { minScore = 3869, wingScore = 3949 },
    DIAMOND     = { minScore = 3715, wingScore = 3792 },
    EMERALD     = { minScore = 3510, wingScore = 3612 },
    PLATINUM    = { minScore = 3171, wingScore = 3313 },
    GOLD        = { minScore = 2824, wingScore = 2969 },
    SILVER      = { minScore = 1743, wingScore = 2530 },
    BRONZE      = { minScore =  440, wingScore =  1022 },
    IRON        = { minScore =    1, wingScore =  237 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4335,
    CHALLENGER  = { minScore = 4230, wingScore = 4239 },
    GRANDMASTER = { minScore = 4177, wingScore = 4203 },
    MASTER      = { minScore = 3994, wingScore = 4086 },
    DIAMOND     = { minScore = 3814, wingScore = 3904 },
    EMERALD     = { minScore = 3573, wingScore = 3694 },
    PLATINUM    = { minScore = 3217, wingScore = 3359 },
    GOLD        = { minScore = 2824, wingScore = 3018 },
    SILVER      = { minScore = 1743, wingScore = 2530 },
    BRONZE      = { minScore =  440, wingScore =  1022 },
    IRON        = { minScore =    1, wingScore =  237 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4288,
    CHALLENGER  = { minScore = 4153, wingScore = 4209 },
    GRANDMASTER = { minScore = 4020, wingScore = 4063 },
    MASTER      = { minScore = 3895, wingScore = 3948 },
    DIAMOND     = { minScore = 3561, wingScore = 3684 },
    EMERALD     = { minScore = 3416, wingScore = 3459 },
    PLATINUM    = { minScore = 3087, wingScore = 3229 },
    GOLD        = { minScore = 2725, wingScore = 2956 },
    SILVER      = { minScore = 1439, wingScore = 2313 },
    BRONZE      = { minScore =  348, wingScore =  833 },
    IRON        = { minScore =    1, wingScore =  180 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4288,
    CHALLENGER  = { minScore = 4021, wingScore = 4209 },
    GRANDMASTER = { minScore = 3968, wingScore = 3995 },
    MASTER      = { minScore = 3785, wingScore = 3877 },
    DIAMOND     = { minScore = 3628, wingScore = 3707 },
    EMERALD     = { minScore = 3418, wingScore = 3523 },
    PLATINUM    = { minScore = 3113, wingScore = 3233 },
    GOLD        = { minScore = 2725, wingScore = 2909 },
    SILVER      = { minScore = 1439, wingScore = 2313 },
    BRONZE      = { minScore =  348, wingScore =  833 },
    IRON        = { minScore =    1, wingScore =  180 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4288,
    CHALLENGER  = { minScore = 4202, wingScore = 4209 },
    GRANDMASTER = { minScore = 4145, wingScore = 4173 },
    MASTER      = { minScore = 3945, wingScore = 4045 },
    DIAMOND     = { minScore = 3767, wingScore = 3856 },
    EMERALD     = { minScore = 3529, wingScore = 3648 },
    PLATINUM    = { minScore = 3165, wingScore = 3312 },
    GOLD        = { minScore = 2725, wingScore = 2946 },
    SILVER      = { minScore = 1439, wingScore = 2313 },
    BRONZE      = { minScore =  348, wingScore =  833 },
    IRON        = { minScore =    1, wingScore =  180 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4335,
    CHALLENGER  = { minScore = 4170, wingScore = 4226 },
    GRANDMASTER = { minScore = 4040, wingScore = 4088 },
    MASTER      = { minScore = 3918, wingScore = 3977 },
    DIAMOND     = { minScore = 3615, wingScore = 3732 },
    EMERALD     = { minScore = 3446, wingScore = 3511 },
    PLATINUM    = { minScore = 3135, wingScore = 3289 },
    GOLD        = { minScore = 2782, wingScore = 2992 },
    SILVER      = { minScore = 1615, wingScore = 2439 },
    BRONZE      = { minScore =  401, wingScore =  942 },
    IRON        = { minScore =    1, wingScore =  213 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4335,
    CHALLENGER  = { minScore = 4052, wingScore = 4227 },
    GRANDMASTER = { minScore = 4004, wingScore = 4029 },
    MASTER      = { minScore = 3835, wingScore = 3919 },
    DIAMOND     = { minScore = 3679, wingScore = 3757 },
    EMERALD     = { minScore = 3472, wingScore = 3576 },
    PLATINUM    = { minScore = 3147, wingScore = 3280 },
    GOLD        = { minScore = 2783, wingScore = 2944 },
    SILVER      = { minScore = 1618, wingScore = 2441 },
    BRONZE      = { minScore =  402, wingScore =  945 },
    IRON        = { minScore =    1, wingScore =  214 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4335,
    CHALLENGER  = { minScore = 4218, wingScore = 4226 },
    GRANDMASTER = { minScore = 4163, wingScore = 4190 },
    MASTER      = { minScore = 3973, wingScore = 4068 },
    DIAMOND     = { minScore = 3794, wingScore = 3883 },
    EMERALD     = { minScore = 3554, wingScore = 3674 },
    PLATINUM    = { minScore = 3195, wingScore = 3339 },
    GOLD        = { minScore = 2781, wingScore = 2987 },
    SILVER      = { minScore = 1612, wingScore = 2436 },
    BRONZE      = { minScore =  400, wingScore =  940 },
    IRON        = { minScore =    1, wingScore =  212 },
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
