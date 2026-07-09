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
    top100Score = 4286,
    CHALLENGER  = { minScore = 4132, wingScore = 4176 },
    GRANDMASTER = { minScore = 4018, wingScore = 4056 },
    MASTER      = { minScore = 3894, wingScore = 3939 },
    DIAMOND     = { minScore = 3639, wingScore = 3740 },
    EMERALD     = { minScore = 3461, wingScore = 3542 },
    PLATINUM    = { minScore = 3168, wingScore = 3325 },
    GOLD        = { minScore = 2825, wingScore = 3018 },
    SILVER      = { minScore = 1773, wingScore = 2541 },
    BRONZE      = { minScore =  460, wingScore =  1043 },
    IRON        = { minScore =    1, wingScore =  241 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4286,
    CHALLENGER  = { minScore = 4030, wingScore = 4176 },
    GRANDMASTER = { minScore = 3984, wingScore = 4007 },
    MASTER      = { minScore = 3820, wingScore = 3902 },
    DIAMOND     = { minScore = 3681, wingScore = 3751 },
    EMERALD     = { minScore = 3496, wingScore = 3589 },
    PLATINUM    = { minScore = 3170, wingScore = 3310 },
    GOLD        = { minScore = 2825, wingScore = 2969 },
    SILVER      = { minScore = 1773, wingScore = 2541 },
    BRONZE      = { minScore =  460, wingScore =  1043 },
    IRON        = { minScore =    1, wingScore =  241 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4286,
    CHALLENGER  = { minScore = 4163, wingScore = 4176 },
    GRANDMASTER = { minScore = 4113, wingScore = 4138 },
    MASTER      = { minScore = 3938, wingScore = 4025 },
    DIAMOND     = { minScore = 3775, wingScore = 3856 },
    EMERALD     = { minScore = 3557, wingScore = 3666 },
    PLATINUM    = { minScore = 3216, wingScore = 3355 },
    GOLD        = { minScore = 2825, wingScore = 3018 },
    SILVER      = { minScore = 1773, wingScore = 2541 },
    BRONZE      = { minScore =  460, wingScore =  1043 },
    IRON        = { minScore =    1, wingScore =  241 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4241,
    CHALLENGER  = { minScore = 4093, wingScore = 4145 },
    GRANDMASTER = { minScore = 3983, wingScore = 4018 },
    MASTER      = { minScore = 3840, wingScore = 3897 },
    DIAMOND     = { minScore = 3550, wingScore = 3664 },
    EMERALD     = { minScore = 3412, wingScore = 3452 },
    PLATINUM    = { minScore = 3086, wingScore = 3223 },
    GOLD        = { minScore = 2727, wingScore = 2954 },
    SILVER      = { minScore = 1468, wingScore = 2328 },
    BRONZE      = { minScore =  354, wingScore =  848 },
    IRON        = { minScore =    1, wingScore =  183 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4241,
    CHALLENGER  = { minScore = 3985, wingScore = 4145 },
    GRANDMASTER = { minScore = 3932, wingScore = 3958 },
    MASTER      = { minScore = 3749, wingScore = 3841 },
    DIAMOND     = { minScore = 3600, wingScore = 3675 },
    EMERALD     = { minScore = 3402, wingScore = 3501 },
    PLATINUM    = { minScore = 3109, wingScore = 3225 },
    GOLD        = { minScore = 2727, wingScore = 2909 },
    SILVER      = { minScore = 1468, wingScore = 2328 },
    BRONZE      = { minScore =  354, wingScore =  848 },
    IRON        = { minScore =    1, wingScore =  183 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4241,
    CHALLENGER  = { minScore = 4136, wingScore = 4145 },
    GRANDMASTER = { minScore = 4083, wingScore = 4110 },
    MASTER      = { minScore = 3897, wingScore = 3990 },
    DIAMOND     = { minScore = 3734, wingScore = 3816 },
    EMERALD     = { minScore = 3515, wingScore = 3624 },
    PLATINUM    = { minScore = 3163, wingScore = 3309 },
    GOLD        = { minScore = 2727, wingScore = 2946 },
    SILVER      = { minScore = 1468, wingScore = 2328 },
    BRONZE      = { minScore =  354, wingScore =  848 },
    IRON        = { minScore =    1, wingScore =  183 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4286,
    CHALLENGER  = { minScore = 4116, wingScore = 4163 },
    GRANDMASTER = { minScore = 4003, wingScore = 4040 },
    MASTER      = { minScore = 3871, wingScore = 3921 },
    DIAMOND     = { minScore = 3602, wingScore = 3708 },
    EMERALD     = { minScore = 3440, wingScore = 3504 },
    PLATINUM    = { minScore = 3134, wingScore = 3282 },
    GOLD        = { minScore = 2784, wingScore = 2991 },
    SILVER      = { minScore = 1645, wingScore = 2452 },
    BRONZE      = { minScore =  415, wingScore =  961 },
    IRON        = { minScore =    1, wingScore =  217 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4286,
    CHALLENGER  = { minScore = 4012, wingScore = 4163 },
    GRANDMASTER = { minScore = 3963, wingScore = 3987 },
    MASTER      = { minScore = 3791, wingScore = 3877 },
    DIAMOND     = { minScore = 3648, wingScore = 3720 },
    EMERALD     = { minScore = 3458, wingScore = 3553 },
    PLATINUM    = { minScore = 3145, wingScore = 3275 },
    GOLD        = { minScore = 2785, wingScore = 2944 },
    SILVER      = { minScore = 1648, wingScore = 2454 },
    BRONZE      = { minScore =  417, wingScore =  963 },
    IRON        = { minScore =    1, wingScore =  217 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4286,
    CHALLENGER  = { minScore = 4151, wingScore = 4163 },
    GRANDMASTER = { minScore = 4100, wingScore = 4126 },
    MASTER      = { minScore = 3920, wingScore = 4010 },
    DIAMOND     = { minScore = 3757, wingScore = 3839 },
    EMERALD     = { minScore = 3539, wingScore = 3648 },
    PLATINUM    = { minScore = 3193, wingScore = 3335 },
    GOLD        = { minScore = 2783, wingScore = 2987 },
    SILVER      = { minScore = 1641, wingScore = 2449 },
    BRONZE      = { minScore =  414, wingScore =  959 },
    IRON        = { minScore =    1, wingScore =  216 },
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
