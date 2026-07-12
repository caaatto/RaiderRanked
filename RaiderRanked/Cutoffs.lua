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
    top100Score = 4302,
    CHALLENGER  = { minScore = 4137, wingScore = 4191 },
    GRANDMASTER = { minScore = 4025, wingScore = 4068 },
    MASTER      = { minScore = 3899, wingScore = 3951 },
    DIAMOND     = { minScore = 3643, wingScore = 3746 },
    EMERALD     = { minScore = 3463, wingScore = 3543 },
    PLATINUM    = { minScore = 3169, wingScore = 3327 },
    GOLD        = { minScore = 2826, wingScore = 3019 },
    SILVER      = { minScore = 1768, wingScore = 2539 },
    BRONZE      = { minScore =  459, wingScore =  1040 },
    IRON        = { minScore =    1, wingScore =  240 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4302,
    CHALLENGER  = { minScore = 4042, wingScore = 4191 },
    GRANDMASTER = { minScore = 3995, wingScore = 4018 },
    MASTER      = { minScore = 3830, wingScore = 3912 },
    DIAMOND     = { minScore = 3688, wingScore = 3759 },
    EMERALD     = { minScore = 3499, wingScore = 3594 },
    PLATINUM    = { minScore = 3171, wingScore = 3311 },
    GOLD        = { minScore = 2826, wingScore = 2970 },
    SILVER      = { minScore = 1768, wingScore = 2539 },
    BRONZE      = { minScore =  459, wingScore =  1040 },
    IRON        = { minScore =    1, wingScore =  240 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4302,
    CHALLENGER  = { minScore = 4179, wingScore = 4191 },
    GRANDMASTER = { minScore = 4128, wingScore = 4154 },
    MASTER      = { minScore = 3949, wingScore = 4038 },
    DIAMOND     = { minScore = 3783, wingScore = 3866 },
    EMERALD     = { minScore = 3561, wingScore = 3672 },
    PLATINUM    = { minScore = 3217, wingScore = 3357 },
    GOLD        = { minScore = 2826, wingScore = 3018 },
    SILVER      = { minScore = 1768, wingScore = 2539 },
    BRONZE      = { minScore =  459, wingScore =  1040 },
    IRON        = { minScore =    1, wingScore =  240 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4255,
    CHALLENGER  = { minScore = 4115, wingScore = 4159 },
    GRANDMASTER = { minScore = 3995, wingScore = 4026 },
    MASTER      = { minScore = 3852, wingScore = 3906 },
    DIAMOND     = { minScore = 3553, wingScore = 3669 },
    EMERALD     = { minScore = 3413, wingScore = 3454 },
    PLATINUM    = { minScore = 3087, wingScore = 3224 },
    GOLD        = { minScore = 2727, wingScore = 2954 },
    SILVER      = { minScore = 1462, wingScore = 2325 },
    BRONZE      = { minScore =  352, wingScore =  844 },
    IRON        = { minScore =    1, wingScore =  182 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4255,
    CHALLENGER  = { minScore = 3996, wingScore = 4159 },
    GRANDMASTER = { minScore = 3944, wingScore = 3970 },
    MASTER      = { minScore = 3760, wingScore = 3852 },
    DIAMOND     = { minScore = 3608, wingScore = 3684 },
    EMERALD     = { minScore = 3406, wingScore = 3507 },
    PLATINUM    = { minScore = 3110, wingScore = 3227 },
    GOLD        = { minScore = 2727, wingScore = 2909 },
    SILVER      = { minScore = 1462, wingScore = 2325 },
    BRONZE      = { minScore =  352, wingScore =  844 },
    IRON        = { minScore =    1, wingScore =  182 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4255,
    CHALLENGER  = { minScore = 4150, wingScore = 4159 },
    GRANDMASTER = { minScore = 4096, wingScore = 4123 },
    MASTER      = { minScore = 3906, wingScore = 4001 },
    DIAMOND     = { minScore = 3740, wingScore = 3823 },
    EMERALD     = { minScore = 3518, wingScore = 3629 },
    PLATINUM    = { minScore = 3164, wingScore = 3310 },
    GOLD        = { minScore = 2727, wingScore = 2947 },
    SILVER      = { minScore = 1462, wingScore = 2325 },
    BRONZE      = { minScore =  352, wingScore =  844 },
    IRON        = { minScore =    1, wingScore =  182 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4302,
    CHALLENGER  = { minScore = 4128, wingScore = 4178 },
    GRANDMASTER = { minScore = 4012, wingScore = 4050 },
    MASTER      = { minScore = 3879, wingScore = 3932 },
    DIAMOND     = { minScore = 3605, wingScore = 3714 },
    EMERALD     = { minScore = 3442, wingScore = 3506 },
    PLATINUM    = { minScore = 3135, wingScore = 3284 },
    GOLD        = { minScore = 2784, wingScore = 2992 },
    SILVER      = { minScore = 1639, wingScore = 2449 },
    BRONZE      = { minScore =  414, wingScore =  958 },
    IRON        = { minScore =    1, wingScore =  216 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4302,
    CHALLENGER  = { minScore = 4023, wingScore = 4178 },
    GRANDMASTER = { minScore = 3974, wingScore = 3998 },
    MASTER      = { minScore = 3801, wingScore = 3887 },
    DIAMOND     = { minScore = 3655, wingScore = 3728 },
    EMERALD     = { minScore = 3461, wingScore = 3558 },
    PLATINUM    = { minScore = 3146, wingScore = 3277 },
    GOLD        = { minScore = 2785, wingScore = 2945 },
    SILVER      = { minScore = 1643, wingScore = 2451 },
    BRONZE      = { minScore =  415, wingScore =  960 },
    IRON        = { minScore =    1, wingScore =  216 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4302,
    CHALLENGER  = { minScore = 4166, wingScore = 4177 },
    GRANDMASTER = { minScore = 4114, wingScore = 4141 },
    MASTER      = { minScore = 3930, wingScore = 4022 },
    DIAMOND     = { minScore = 3764, wingScore = 3847 },
    EMERALD     = { minScore = 3542, wingScore = 3653 },
    PLATINUM    = { minScore = 3194, wingScore = 3337 },
    GOLD        = { minScore = 2783, wingScore = 2987 },
    SILVER      = { minScore = 1636, wingScore = 2447 },
    BRONZE      = { minScore =  413, wingScore =  955 },
    IRON        = { minScore =    1, wingScore =  215 },
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
