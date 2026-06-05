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
    top100Score = 4193,
    CHALLENGER  = { minScore = 4025, wingScore = 4078 },
    GRANDMASTER = { minScore = 3938, wingScore = 3982 },
    MASTER      = { minScore = 3808, wingScore = 3867 },
    DIAMOND     = { minScore = 3578, wingScore = 3672 },
    EMERALD     = { minScore = 3431, wingScore = 3492 },
    PLATINUM    = { minScore = 3134, wingScore = 3279 },
    GOLD        = { minScore = 2794, wingScore = 3005 },
    SILVER      = { minScore = 1766, wingScore = 2517 },
    BRONZE      = { minScore =  487, wingScore =  1052 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4193,
    CHALLENGER  = { minScore = 3967, wingScore = 4078 },
    GRANDMASTER = { minScore = 3921, wingScore = 3944 },
    MASTER      = { minScore = 3759, wingScore = 3840 },
    DIAMOND     = { minScore = 3622, wingScore = 3690 },
    EMERALD     = { minScore = 3440, wingScore = 3531 },
    PLATINUM    = { minScore = 3140, wingScore = 3265 },
    GOLD        = { minScore = 2794, wingScore = 2948 },
    SILVER      = { minScore = 1766, wingScore = 2517 },
    BRONZE      = { minScore =  487, wingScore =  1052 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4193,
    CHALLENGER  = { minScore = 4064, wingScore = 4078 },
    GRANDMASTER = { minScore = 4019, wingScore = 4041 },
    MASTER      = { minScore = 3863, wingScore = 3941 },
    DIAMOND     = { minScore = 3716, wingScore = 3790 },
    EMERALD     = { minScore = 3519, wingScore = 3618 },
    PLATINUM    = { minScore = 3190, wingScore = 3328 },
    GOLD        = { minScore = 2794, wingScore = 2989 },
    SILVER      = { minScore = 1766, wingScore = 2517 },
    BRONZE      = { minScore =  487, wingScore =  1052 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4138,
    CHALLENGER  = { minScore = 4004, wingScore = 4039 },
    GRANDMASTER = { minScore = 3896, wingScore = 3926 },
    MASTER      = { minScore = 3754, wingScore = 3804 },
    DIAMOND     = { minScore = 3498, wingScore = 3591 },
    EMERALD     = { minScore = 3373, wingScore = 3424 },
    PLATINUM    = { minScore = 3063, wingScore = 3182 },
    GOLD        = { minScore = 2703, wingScore = 2906 },
    SILVER      = { minScore = 1464, wingScore = 2307 },
    BRONZE      = { minScore =  361, wingScore =  856 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4138,
    CHALLENGER  = { minScore = 3903, wingScore = 4039 },
    GRANDMASTER = { minScore = 3851, wingScore = 3877 },
    MASTER      = { minScore = 3667, wingScore = 3759 },
    DIAMOND     = { minScore = 3527, wingScore = 3597 },
    EMERALD     = { minScore = 3342, wingScore = 3435 },
    PLATINUM    = { minScore = 3079, wingScore = 3181 },
    GOLD        = { minScore = 2703, wingScore = 2889 },
    SILVER      = { minScore = 1464, wingScore = 2307 },
    BRONZE      = { minScore =  361, wingScore =  856 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4138,
    CHALLENGER  = { minScore = 4030, wingScore = 4039 },
    GRANDMASTER = { minScore = 3980, wingScore = 4005 },
    MASTER      = { minScore = 3803, wingScore = 3892 },
    DIAMOND     = { minScore = 3652, wingScore = 3728 },
    EMERALD     = { minScore = 3449, wingScore = 3550 },
    PLATINUM    = { minScore = 3132, wingScore = 3262 },
    GOLD        = { minScore = 2703, wingScore = 2926 },
    SILVER      = { minScore = 1464, wingScore = 2307 },
    BRONZE      = { minScore =  361, wingScore =  856 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4193,
    CHALLENGER  = { minScore = 4016, wingScore = 4062 },
    GRANDMASTER = { minScore = 3920, wingScore = 3959 },
    MASTER      = { minScore = 3785, wingScore = 3841 },
    DIAMOND     = { minScore = 3545, wingScore = 3638 },
    EMERALD     = { minScore = 3407, wingScore = 3464 },
    PLATINUM    = { minScore = 3104, wingScore = 3238 },
    GOLD        = { minScore = 2756, wingScore = 2964 },
    SILVER      = { minScore = 1640, wingScore = 2429 },
    BRONZE      = { minScore =  434, wingScore =  970 },
    IRON        = { minScore =    1, wingScore =  220 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4193,
    CHALLENGER  = { minScore = 3941, wingScore = 4062 },
    GRANDMASTER = { minScore = 3893, wingScore = 3917 },
    MASTER      = { minScore = 3722, wingScore = 3807 },
    DIAMOND     = { minScore = 3583, wingScore = 3652 },
    EMERALD     = { minScore = 3400, wingScore = 3492 },
    PLATINUM    = { minScore = 3115, wingScore = 3231 },
    GOLD        = { minScore = 2757, wingScore = 2924 },
    SILVER      = { minScore = 1643, wingScore = 2432 },
    BRONZE      = { minScore =  436, wingScore =  972 },
    IRON        = { minScore =    1, wingScore =  221 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4193,
    CHALLENGER  = { minScore = 4049, wingScore = 4061 },
    GRANDMASTER = { minScore = 4002, wingScore = 4026 },
    MASTER      = { minScore = 3837, wingScore = 3920 },
    DIAMOND     = { minScore = 3689, wingScore = 3763 },
    EMERALD     = { minScore = 3489, wingScore = 3589 },
    PLATINUM    = { minScore = 3165, wingScore = 3300 },
    GOLD        = { minScore = 2755, wingScore = 2962 },
    SILVER      = { minScore = 1636, wingScore = 2427 },
    BRONZE      = { minScore =  433, wingScore =  968 },
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
