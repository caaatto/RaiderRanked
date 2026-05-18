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
    top100Score = 4089,
    CHALLENGER  = { minScore = 3920, wingScore = 3973 },
    GRANDMASTER = { minScore = 3841, wingScore = 3881 },
    MASTER      = { minScore = 3716, wingScore = 3773 },
    DIAMOND     = { minScore = 3505, wingScore = 3581 },
    EMERALD     = { minScore = 3371, wingScore = 3427 },
    PLATINUM    = { minScore = 3077, wingScore = 3205 },
    GOLD        = { minScore = 2736, wingScore = 2932 },
    SILVER      = { minScore = 1673, wingScore = 2434 },
    BRONZE      = { minScore =  422, wingScore =  997 },
    IRON        = { minScore =    1, wingScore =  230 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4089,
    CHALLENGER  = { minScore = 3875, wingScore = 3973 },
    GRANDMASTER = { minScore = 3828, wingScore = 3852 },
    MASTER      = { minScore = 3661, wingScore = 3745 },
    DIAMOND     = { minScore = 3532, wingScore = 3597 },
    EMERALD     = { minScore = 3360, wingScore = 3446 },
    PLATINUM    = { minScore = 3096, wingScore = 3203 },
    GOLD        = { minScore = 2736, wingScore = 2911 },
    SILVER      = { minScore = 1673, wingScore = 2434 },
    BRONZE      = { minScore =  422, wingScore =  997 },
    IRON        = { minScore =    1, wingScore =  230 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4089,
    CHALLENGER  = { minScore = 3960, wingScore = 3973 },
    GRANDMASTER = { minScore = 3918, wingScore = 3939 },
    MASTER      = { minScore = 3771, wingScore = 3845 },
    DIAMOND     = { minScore = 3631, wingScore = 3701 },
    EMERALD     = { minScore = 3443, wingScore = 3537 },
    PLATINUM    = { minScore = 3137, wingScore = 3265 },
    GOLD        = { minScore = 2736, wingScore = 2939 },
    SILVER      = { minScore = 1673, wingScore = 2434 },
    BRONZE      = { minScore =  422, wingScore =  997 },
    IRON        = { minScore =    1, wingScore =  230 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4015,
    CHALLENGER  = { minScore = 3892, wingScore = 3927 },
    GRANDMASTER = { minScore = 3786, wingScore = 3823 },
    MASTER      = { minScore = 3655, wingScore = 3702 },
    DIAMOND     = { minScore = 3427, wingScore = 3508 },
    EMERALD     = { minScore = 3282, wingScore = 3354 },
    PLATINUM    = { minScore = 3024, wingScore = 3112 },
    GOLD        = { minScore = 2663, wingScore = 2826 },
    SILVER      = { minScore = 1381, wingScore = 2228 },
    BRONZE      = { minScore =  340, wingScore =  809 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4015,
    CHALLENGER  = { minScore = 3792, wingScore = 3927 },
    GRANDMASTER = { minScore = 3743, wingScore = 3768 },
    MASTER      = { minScore = 3569, wingScore = 3656 },
    DIAMOND     = { minScore = 3437, wingScore = 3503 },
    EMERALD     = { minScore = 3262, wingScore = 3350 },
    PLATINUM    = { minScore = 2994, wingScore = 3102 },
    GOLD        = { minScore = 2663, wingScore = 2818 },
    SILVER      = { minScore = 1381, wingScore = 2228 },
    BRONZE      = { minScore =  340, wingScore =  809 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4015,
    CHALLENGER  = { minScore = 3917, wingScore = 3927 },
    GRANDMASTER = { minScore = 3869, wingScore = 3893 },
    MASTER      = { minScore = 3700, wingScore = 3784 },
    DIAMOND     = { minScore = 3553, wingScore = 3626 },
    EMERALD     = { minScore = 3357, wingScore = 3455 },
    PLATINUM    = { minScore = 3076, wingScore = 3186 },
    GOLD        = { minScore = 2663, wingScore = 2882 },
    SILVER      = { minScore = 1381, wingScore = 2228 },
    BRONZE      = { minScore =  340, wingScore =  809 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4089,
    CHALLENGER  = { minScore = 3908, wingScore = 3954 },
    GRANDMASTER = { minScore = 3818, wingScore = 3857 },
    MASTER      = { minScore = 3691, wingScore = 3743 },
    DIAMOND     = { minScore = 3473, wingScore = 3551 },
    EMERALD     = { minScore = 3334, wingScore = 3397 },
    PLATINUM    = { minScore = 3055, wingScore = 3166 },
    GOLD        = { minScore = 2706, wingScore = 2888 },
    SILVER      = { minScore = 1551, wingScore = 2348 },
    BRONZE      = { minScore =  388, wingScore =  919 },
    IRON        = { minScore =    1, wingScore =  205 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4089,
    CHALLENGER  = { minScore = 3841, wingScore = 3954 },
    GRANDMASTER = { minScore = 3794, wingScore = 3818 },
    MASTER      = { minScore = 3624, wingScore = 3709 },
    DIAMOND     = { minScore = 3494, wingScore = 3559 },
    EMERALD     = { minScore = 3320, wingScore = 3407 },
    PLATINUM    = { minScore = 3055, wingScore = 3162 },
    GOLD        = { minScore = 2706, wingScore = 2873 },
    SILVER      = { minScore = 1555, wingScore = 2351 },
    BRONZE      = { minScore =  389, wingScore =  921 },
    IRON        = { minScore =    1, wingScore =  206 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4089,
    CHALLENGER  = { minScore = 3942, wingScore = 3953 },
    GRANDMASTER = { minScore = 3897, wingScore = 3919 },
    MASTER      = { minScore = 3741, wingScore = 3819 },
    DIAMOND     = { minScore = 3598, wingScore = 3669 },
    EMERALD     = { minScore = 3406, wingScore = 3502 },
    PLATINUM    = { minScore = 3111, wingScore = 3231 },
    GOLD        = { minScore = 2705, wingScore = 2915 },
    SILVER      = { minScore = 1548, wingScore = 2346 },
    BRONZE      = { minScore =  387, wingScore =  916 },
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
