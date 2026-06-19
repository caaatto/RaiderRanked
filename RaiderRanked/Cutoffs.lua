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
    top100Score = 4236,
    CHALLENGER  = { minScore = 4062, wingScore = 4128 },
    GRANDMASTER = { minScore = 3981, wingScore = 4014 },
    MASTER      = { minScore = 3845, wingScore = 3896 },
    DIAMOND     = { minScore = 3607, wingScore = 3701 },
    EMERALD     = { minScore = 3447, wingScore = 3521 },
    PLATINUM    = { minScore = 3155, wingScore = 3308 },
    GOLD        = { minScore = 2816, wingScore = 3014 },
    SILVER      = { minScore = 1795, wingScore = 2541 },
    BRONZE      = { minScore =  486, wingScore =  1067 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4236,
    CHALLENGER  = { minScore = 4007, wingScore = 4128 },
    GRANDMASTER = { minScore = 3956, wingScore = 3981 },
    MASTER      = { minScore = 3780, wingScore = 3868 },
    DIAMOND     = { minScore = 3648, wingScore = 3714 },
    EMERALD     = { minScore = 3472, wingScore = 3560 },
    PLATINUM    = { minScore = 3159, wingScore = 3294 },
    GOLD        = { minScore = 2816, wingScore = 2962 },
    SILVER      = { minScore = 1795, wingScore = 2541 },
    BRONZE      = { minScore =  486, wingScore =  1067 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4236,
    CHALLENGER  = { minScore = 4116, wingScore = 4128 },
    GRANDMASTER = { minScore = 4067, wingScore = 4091 },
    MASTER      = { minScore = 3896, wingScore = 3981 },
    DIAMOND     = { minScore = 3743, wingScore = 3819 },
    EMERALD     = { minScore = 3538, wingScore = 3641 },
    PLATINUM    = { minScore = 3206, wingScore = 3344 },
    GOLD        = { minScore = 2816, wingScore = 3009 },
    SILVER      = { minScore = 1795, wingScore = 2541 },
    BRONZE      = { minScore =  486, wingScore =  1067 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4180,
    CHALLENGER  = { minScore = 4027, wingScore = 4088 },
    GRANDMASTER = { minScore = 3924, wingScore = 3972 },
    MASTER      = { minScore = 3784, wingScore = 3844 },
    DIAMOND     = { minScore = 3527, wingScore = 3627 },
    EMERALD     = { minScore = 3404, wingScore = 3438 },
    PLATINUM    = { minScore = 3078, wingScore = 3207 },
    GOLD        = { minScore = 2720, wingScore = 2938 },
    SILVER      = { minScore = 1488, wingScore = 2330 },
    BRONZE      = { minScore =  361, wingScore =  866 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4180,
    CHALLENGER  = { minScore = 3927, wingScore = 4088 },
    GRANDMASTER = { minScore = 3876, wingScore = 3902 },
    MASTER      = { minScore = 3697, wingScore = 3787 },
    DIAMOND     = { minScore = 3557, wingScore = 3627 },
    EMERALD     = { minScore = 3371, wingScore = 3464 },
    PLATINUM    = { minScore = 3098, wingScore = 3206 },
    GOLD        = { minScore = 2720, wingScore = 2904 },
    SILVER      = { minScore = 1488, wingScore = 2330 },
    BRONZE      = { minScore =  361, wingScore =  866 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4180,
    CHALLENGER  = { minScore = 4074, wingScore = 4088 },
    GRANDMASTER = { minScore = 4023, wingScore = 4049 },
    MASTER      = { minScore = 3844, wingScore = 3934 },
    DIAMOND     = { minScore = 3692, wingScore = 3768 },
    EMERALD     = { minScore = 3489, wingScore = 3590 },
    PLATINUM    = { minScore = 3153, wingScore = 3294 },
    GOLD        = { minScore = 2720, wingScore = 2940 },
    SILVER      = { minScore = 1488, wingScore = 2330 },
    BRONZE      = { minScore =  361, wingScore =  866 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4236,
    CHALLENGER  = { minScore = 4047, wingScore = 4111 },
    GRANDMASTER = { minScore = 3957, wingScore = 3996 },
    MASTER      = { minScore = 3819, wingScore = 3874 },
    DIAMOND     = { minScore = 3574, wingScore = 3670 },
    EMERALD     = { minScore = 3429, wingScore = 3486 },
    PLATINUM    = { minScore = 3123, wingScore = 3266 },
    GOLD        = { minScore = 2776, wingScore = 2982 },
    SILVER      = { minScore = 1667, wingScore = 2453 },
    BRONZE      = { minScore =  434, wingScore =  983 },
    IRON        = { minScore =    1, wingScore =  220 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4236,
    CHALLENGER  = { minScore = 3974, wingScore = 4112 },
    GRANDMASTER = { minScore = 3923, wingScore = 3949 },
    MASTER      = { minScore = 3746, wingScore = 3835 },
    DIAMOND     = { minScore = 3611, wingScore = 3679 },
    EMERALD     = { minScore = 3431, wingScore = 3521 },
    PLATINUM    = { minScore = 3134, wingScore = 3258 },
    GOLD        = { minScore = 2777, wingScore = 2938 },
    SILVER      = { minScore = 1670, wingScore = 2455 },
    BRONZE      = { minScore =  435, wingScore =  985 },
    IRON        = { minScore =    1, wingScore =  221 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4236,
    CHALLENGER  = { minScore = 4098, wingScore = 4111 },
    GRANDMASTER = { minScore = 4048, wingScore = 4073 },
    MASTER      = { minScore = 3874, wingScore = 3961 },
    DIAMOND     = { minScore = 3721, wingScore = 3797 },
    EMERALD     = { minScore = 3517, wingScore = 3619 },
    PLATINUM    = { minScore = 3183, wingScore = 3323 },
    GOLD        = { minScore = 2775, wingScore = 2979 },
    SILVER      = { minScore = 1663, wingScore = 2450 },
    BRONZE      = { minScore =  432, wingScore =  981 },
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
