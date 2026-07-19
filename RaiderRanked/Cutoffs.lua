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
    top100Score = 4323,
    CHALLENGER  = { minScore = 4158, wingScore = 4218 },
    GRANDMASTER = { minScore = 4039, wingScore = 4089 },
    MASTER      = { minScore = 3914, wingScore = 3972 },
    DIAMOND     = { minScore = 3651, wingScore = 3758 },
    EMERALD     = { minScore = 3466, wingScore = 3546 },
    PLATINUM    = { minScore = 3170, wingScore = 3331 },
    GOLD        = { minScore = 2826, wingScore = 3019 },
    SILVER      = { minScore = 1758, wingScore = 2536 },
    BRONZE      = { minScore =  445, wingScore =  1032 },
    IRON        = { minScore =    1, wingScore =  238 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4323,
    CHALLENGER  = { minScore = 4059, wingScore = 4218 },
    GRANDMASTER = { minScore = 4013, wingScore = 4036 },
    MASTER      = { minScore = 3850, wingScore = 3931 },
    DIAMOND     = { minScore = 3702, wingScore = 3776 },
    EMERALD     = { minScore = 3505, wingScore = 3603 },
    PLATINUM    = { minScore = 3171, wingScore = 3312 },
    GOLD        = { minScore = 2826, wingScore = 2970 },
    SILVER      = { minScore = 1758, wingScore = 2536 },
    BRONZE      = { minScore =  445, wingScore =  1032 },
    IRON        = { minScore =    1, wingScore =  238 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4323,
    CHALLENGER  = { minScore = 4207, wingScore = 4218 },
    GRANDMASTER = { minScore = 4154, wingScore = 4181 },
    MASTER      = { minScore = 3969, wingScore = 4062 },
    DIAMOND     = { minScore = 3797, wingScore = 3883 },
    EMERALD     = { minScore = 3567, wingScore = 3682 },
    PLATINUM    = { minScore = 3218, wingScore = 3358 },
    GOLD        = { minScore = 2826, wingScore = 3019 },
    SILVER      = { minScore = 1758, wingScore = 2536 },
    BRONZE      = { minScore =  445, wingScore =  1032 },
    IRON        = { minScore =    1, wingScore =  238 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4271,
    CHALLENGER  = { minScore = 4136, wingScore = 4185 },
    GRANDMASTER = { minScore = 4012, wingScore = 4045 },
    MASTER      = { minScore = 3880, wingScore = 3924 },
    DIAMOND     = { minScore = 3558, wingScore = 3677 },
    EMERALD     = { minScore = 3415, wingScore = 3457 },
    PLATINUM    = { minScore = 3087, wingScore = 3227 },
    GOLD        = { minScore = 2727, wingScore = 2956 },
    SILVER      = { minScore = 1455, wingScore = 2321 },
    BRONZE      = { minScore =  350, wingScore =  839 },
    IRON        = { minScore =    1, wingScore =  181 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4271,
    CHALLENGER  = { minScore = 4013, wingScore = 4185 },
    GRANDMASTER = { minScore = 3960, wingScore = 3986 },
    MASTER      = { minScore = 3774, wingScore = 3867 },
    DIAMOND     = { minScore = 3619, wingScore = 3697 },
    EMERALD     = { minScore = 3413, wingScore = 3516 },
    PLATINUM    = { minScore = 3111, wingScore = 3230 },
    GOLD        = { minScore = 2727, wingScore = 2909 },
    SILVER      = { minScore = 1455, wingScore = 2321 },
    BRONZE      = { minScore =  350, wingScore =  839 },
    IRON        = { minScore =    1, wingScore =  181 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4271,
    CHALLENGER  = { minScore = 4178, wingScore = 4185 },
    GRANDMASTER = { minScore = 4121, wingScore = 4150 },
    MASTER      = { minScore = 3924, wingScore = 4023 },
    DIAMOND     = { minScore = 3752, wingScore = 3838 },
    EMERALD     = { minScore = 3523, wingScore = 3638 },
    PLATINUM    = { minScore = 3164, wingScore = 3311 },
    GOLD        = { minScore = 2727, wingScore = 2947 },
    SILVER      = { minScore = 1455, wingScore = 2321 },
    BRONZE      = { minScore =  350, wingScore =  839 },
    IRON        = { minScore =    1, wingScore =  181 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4323,
    CHALLENGER  = { minScore = 4149, wingScore = 4204 },
    GRANDMASTER = { minScore = 4028, wingScore = 4070 },
    MASTER      = { minScore = 3900, wingScore = 3952 },
    DIAMOND     = { minScore = 3612, wingScore = 3724 },
    EMERALD     = { minScore = 3445, wingScore = 3509 },
    PLATINUM    = { minScore = 3135, wingScore = 3287 },
    GOLD        = { minScore = 2784, wingScore = 2993 },
    SILVER      = { minScore = 1631, wingScore = 2446 },
    BRONZE      = { minScore =  405, wingScore =  951 },
    IRON        = { minScore =    1, wingScore =  214 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4323,
    CHALLENGER  = { minScore = 4040, wingScore = 4204 },
    GRANDMASTER = { minScore = 3991, wingScore = 4016 },
    MASTER      = { minScore = 3819, wingScore = 3905 },
    DIAMOND     = { minScore = 3668, wingScore = 3744 },
    EMERALD     = { minScore = 3467, wingScore = 3567 },
    PLATINUM    = { minScore = 3146, wingScore = 3278 },
    GOLD        = { minScore = 2785, wingScore = 2945 },
    SILVER      = { minScore = 1634, wingScore = 2448 },
    BRONZE      = { minScore =  406, wingScore =  953 },
    IRON        = { minScore =    1, wingScore =  215 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4323,
    CHALLENGER  = { minScore = 4194, wingScore = 4204 },
    GRANDMASTER = { minScore = 4140, wingScore = 4168 },
    MASTER      = { minScore = 3950, wingScore = 4045 },
    DIAMOND     = { minScore = 3778, wingScore = 3864 },
    EMERALD     = { minScore = 3548, wingScore = 3663 },
    PLATINUM    = { minScore = 3195, wingScore = 3338 },
    GOLD        = { minScore = 2783, wingScore = 2988 },
    SILVER      = { minScore = 1627, wingScore = 2443 },
    BRONZE      = { minScore =  404, wingScore =  949 },
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
