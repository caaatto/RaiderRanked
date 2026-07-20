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
    top100Score = 4324,
    CHALLENGER  = { minScore = 4161, wingScore = 4221 },
    GRANDMASTER = { minScore = 4041, wingScore = 4091 },
    MASTER      = { minScore = 3917, wingScore = 3977 },
    DIAMOND     = { minScore = 3651, wingScore = 3759 },
    EMERALD     = { minScore = 3466, wingScore = 3547 },
    PLATINUM    = { minScore = 3170, wingScore = 3331 },
    GOLD        = { minScore = 2826, wingScore = 3019 },
    SILVER      = { minScore = 1757, wingScore = 2536 },
    BRONZE      = { minScore =  445, wingScore =  1032 },
    IRON        = { minScore =    1, wingScore =  238 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4324,
    CHALLENGER  = { minScore = 4061, wingScore = 4221 },
    GRANDMASTER = { minScore = 4014, wingScore = 4038 },
    MASTER      = { minScore = 3853, wingScore = 3934 },
    DIAMOND     = { minScore = 3704, wingScore = 3778 },
    EMERALD     = { minScore = 3505, wingScore = 3605 },
    PLATINUM    = { minScore = 3172, wingScore = 3312 },
    GOLD        = { minScore = 2826, wingScore = 2970 },
    SILVER      = { minScore = 1757, wingScore = 2536 },
    BRONZE      = { minScore =  445, wingScore =  1032 },
    IRON        = { minScore =    1, wingScore =  238 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4324,
    CHALLENGER  = { minScore = 4209, wingScore = 4221 },
    GRANDMASTER = { minScore = 4157, wingScore = 4183 },
    MASTER      = { minScore = 3973, wingScore = 4065 },
    DIAMOND     = { minScore = 3799, wingScore = 3886 },
    EMERALD     = { minScore = 3568, wingScore = 3684 },
    PLATINUM    = { minScore = 3218, wingScore = 3359 },
    GOLD        = { minScore = 2826, wingScore = 3019 },
    SILVER      = { minScore = 1757, wingScore = 2536 },
    BRONZE      = { minScore =  445, wingScore =  1032 },
    IRON        = { minScore =    1, wingScore =  238 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4273,
    CHALLENGER  = { minScore = 4137, wingScore = 4192 },
    GRANDMASTER = { minScore = 4013, wingScore = 4047 },
    MASTER      = { minScore = 3884, wingScore = 3927 },
    DIAMOND     = { minScore = 3559, wingScore = 3679 },
    EMERALD     = { minScore = 3415, wingScore = 3457 },
    PLATINUM    = { minScore = 3087, wingScore = 3228 },
    GOLD        = { minScore = 2727, wingScore = 2956 },
    SILVER      = { minScore = 1453, wingScore = 2320 },
    BRONZE      = { minScore =  349, wingScore =  839 },
    IRON        = { minScore =    1, wingScore =  180 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4273,
    CHALLENGER  = { minScore = 4014, wingScore = 4192 },
    GRANDMASTER = { minScore = 3961, wingScore = 3988 },
    MASTER      = { minScore = 3776, wingScore = 3869 },
    DIAMOND     = { minScore = 3621, wingScore = 3698 },
    EMERALD     = { minScore = 3414, wingScore = 3517 },
    PLATINUM    = { minScore = 3112, wingScore = 3231 },
    GOLD        = { minScore = 2727, wingScore = 2909 },
    SILVER      = { minScore = 1453, wingScore = 2320 },
    BRONZE      = { minScore =  349, wingScore =  839 },
    IRON        = { minScore =    1, wingScore =  180 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4273,
    CHALLENGER  = { minScore = 4181, wingScore = 4192 },
    GRANDMASTER = { minScore = 4124, wingScore = 4152 },
    MASTER      = { minScore = 3927, wingScore = 4025 },
    DIAMOND     = { minScore = 3754, wingScore = 3840 },
    EMERALD     = { minScore = 3524, wingScore = 3639 },
    PLATINUM    = { minScore = 3164, wingScore = 3311 },
    GOLD        = { minScore = 2727, wingScore = 2947 },
    SILVER      = { minScore = 1453, wingScore = 2320 },
    BRONZE      = { minScore =  349, wingScore =  839 },
    IRON        = { minScore =    1, wingScore =  180 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4324,
    CHALLENGER  = { minScore = 4151, wingScore = 4209 },
    GRANDMASTER = { minScore = 4029, wingScore = 4072 },
    MASTER      = { minScore = 3903, wingScore = 3956 },
    DIAMOND     = { minScore = 3612, wingScore = 3725 },
    EMERALD     = { minScore = 3445, wingScore = 3509 },
    PLATINUM    = { minScore = 3135, wingScore = 3288 },
    GOLD        = { minScore = 2784, wingScore = 2992 },
    SILVER      = { minScore = 1629, wingScore = 2445 },
    BRONZE      = { minScore =  405, wingScore =  951 },
    IRON        = { minScore =    1, wingScore =  214 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4324,
    CHALLENGER  = { minScore = 4042, wingScore = 4209 },
    GRANDMASTER = { minScore = 3992, wingScore = 4018 },
    MASTER      = { minScore = 3821, wingScore = 3907 },
    DIAMOND     = { minScore = 3670, wingScore = 3745 },
    EMERALD     = { minScore = 3468, wingScore = 3569 },
    PLATINUM    = { minScore = 3147, wingScore = 3279 },
    GOLD        = { minScore = 2785, wingScore = 2945 },
    SILVER      = { minScore = 1632, wingScore = 2447 },
    BRONZE      = { minScore =  406, wingScore =  953 },
    IRON        = { minScore =    1, wingScore =  214 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4324,
    CHALLENGER  = { minScore = 4197, wingScore = 4208 },
    GRANDMASTER = { minScore = 4143, wingScore = 4170 },
    MASTER      = { minScore = 3953, wingScore = 4048 },
    DIAMOND     = { minScore = 3780, wingScore = 3866 },
    EMERALD     = { minScore = 3549, wingScore = 3665 },
    PLATINUM    = { minScore = 3195, wingScore = 3338 },
    GOLD        = { minScore = 2783, wingScore = 2988 },
    SILVER      = { minScore = 1626, wingScore = 2443 },
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
