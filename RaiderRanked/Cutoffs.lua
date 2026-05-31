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
    top100Score = 4173,
    CHALLENGER  = { minScore = 4014, wingScore = 4054 },
    GRANDMASTER = { minScore = 3918, wingScore = 3958 },
    MASTER      = { minScore = 3792, wingScore = 3847 },
    DIAMOND     = { minScore = 3564, wingScore = 3660 },
    EMERALD     = { minScore = 3423, wingScore = 3477 },
    PLATINUM    = { minScore = 3122, wingScore = 3263 },
    GOLD        = { minScore = 2782, wingScore = 2999 },
    SILVER      = { minScore = 1743, wingScore = 2500 },
    BRONZE      = { minScore =  469, wingScore =  1035 },
    IRON        = { minScore =    1, wingScore =  242 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4173,
    CHALLENGER  = { minScore = 3943, wingScore = 4054 },
    GRANDMASTER = { minScore = 3897, wingScore = 3920 },
    MASTER      = { minScore = 3738, wingScore = 3818 },
    DIAMOND     = { minScore = 3603, wingScore = 3671 },
    EMERALD     = { minScore = 3424, wingScore = 3514 },
    PLATINUM    = { minScore = 3131, wingScore = 3253 },
    GOLD        = { minScore = 2782, wingScore = 2939 },
    SILVER      = { minScore = 1743, wingScore = 2500 },
    BRONZE      = { minScore =  469, wingScore =  1035 },
    IRON        = { minScore =    1, wingScore =  242 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4173,
    CHALLENGER  = { minScore = 4043, wingScore = 4054 },
    GRANDMASTER = { minScore = 3998, wingScore = 4020 },
    MASTER      = { minScore = 3840, wingScore = 3919 },
    DIAMOND     = { minScore = 3697, wingScore = 3769 },
    EMERALD     = { minScore = 3507, wingScore = 3602 },
    PLATINUM    = { minScore = 3180, wingScore = 3319 },
    GOLD        = { minScore = 2782, wingScore = 2978 },
    SILVER      = { minScore = 1743, wingScore = 2500 },
    BRONZE      = { minScore =  469, wingScore =  1035 },
    IRON        = { minScore =    1, wingScore =  242 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4124,
    CHALLENGER  = { minScore = 3980, wingScore = 4020 },
    GRANDMASTER = { minScore = 3887, wingScore = 3911 },
    MASTER      = { minScore = 3731, wingScore = 3787 },
    DIAMOND     = { minScore = 3482, wingScore = 3574 },
    EMERALD     = { minScore = 3352, wingScore = 3416 },
    PLATINUM    = { minScore = 3055, wingScore = 3168 },
    GOLD        = { minScore = 2693, wingScore = 2890 },
    SILVER      = { minScore = 1446, wingScore = 2291 },
    BRONZE      = { minScore =  355, wingScore =  843 },
    IRON        = { minScore =    1, wingScore =  182 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4124,
    CHALLENGER  = { minScore = 3893, wingScore = 4020 },
    GRANDMASTER = { minScore = 3840, wingScore = 3867 },
    MASTER      = { minScore = 3655, wingScore = 3748 },
    DIAMOND     = { minScore = 3514, wingScore = 3585 },
    EMERALD     = { minScore = 3327, wingScore = 3421 },
    PLATINUM    = { minScore = 3062, wingScore = 3165 },
    GOLD        = { minScore = 2693, wingScore = 2876 },
    SILVER      = { minScore = 1446, wingScore = 2291 },
    BRONZE      = { minScore =  355, wingScore =  843 },
    IRON        = { minScore =    1, wingScore =  182 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4124,
    CHALLENGER  = { minScore = 4016, wingScore = 4020 },
    GRANDMASTER = { minScore = 3964, wingScore = 3990 },
    MASTER      = { minScore = 3785, wingScore = 3875 },
    DIAMOND     = { minScore = 3633, wingScore = 3709 },
    EMERALD     = { minScore = 3431, wingScore = 3532 },
    PLATINUM    = { minScore = 3122, wingScore = 3247 },
    GOLD        = { minScore = 2693, wingScore = 2918 },
    SILVER      = { minScore = 1446, wingScore = 2291 },
    BRONZE      = { minScore =  355, wingScore =  843 },
    IRON        = { minScore =    1, wingScore =  182 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4173,
    CHALLENGER  = { minScore = 4000, wingScore = 4040 },
    GRANDMASTER = { minScore = 3905, wingScore = 3938 },
    MASTER      = { minScore = 3767, wingScore = 3822 },
    DIAMOND     = { minScore = 3530, wingScore = 3624 },
    EMERALD     = { minScore = 3393, wingScore = 3452 },
    PLATINUM    = { minScore = 3094, wingScore = 3223 },
    GOLD        = { minScore = 2745, wingScore = 2953 },
    SILVER      = { minScore = 1619, wingScore = 2413 },
    BRONZE      = { minScore =  421, wingScore =  955 },
    IRON        = { minScore =    1, wingScore =  217 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4173,
    CHALLENGER  = { minScore = 3923, wingScore = 4040 },
    GRANDMASTER = { minScore = 3874, wingScore = 3898 },
    MASTER      = { minScore = 3704, wingScore = 3790 },
    DIAMOND     = { minScore = 3567, wingScore = 3636 },
    EMERALD     = { minScore = 3385, wingScore = 3476 },
    PLATINUM    = { minScore = 3103, wingScore = 3217 },
    GOLD        = { minScore = 2746, wingScore = 2913 },
    SILVER      = { minScore = 1622, wingScore = 2415 },
    BRONZE      = { minScore =  423, wingScore =  957 },
    IRON        = { minScore =    1, wingScore =  218 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4173,
    CHALLENGER  = { minScore = 4031, wingScore = 4039 },
    GRANDMASTER = { minScore = 3983, wingScore = 4007 },
    MASTER      = { minScore = 3816, wingScore = 3900 },
    DIAMOND     = { minScore = 3670, wingScore = 3743 },
    EMERALD     = { minScore = 3474, wingScore = 3572 },
    PLATINUM    = { minScore = 3155, wingScore = 3288 },
    GOLD        = { minScore = 2744, wingScore = 2952 },
    SILVER      = { minScore = 1615, wingScore = 2410 },
    BRONZE      = { minScore =  420, wingScore =  953 },
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
