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
    top100Score = 4010,
    CHALLENGER  = { minScore = 3852, wingScore = 3895 },
    GRANDMASTER = { minScore = 3774, wingScore = 3793 },
    MASTER      = { minScore = 3648, wingScore = 3687 },
    DIAMOND     = { minScore = 3432, wingScore = 3516 },
    EMERALD     = { minScore = 3298, wingScore = 3358 },
    PLATINUM    = { minScore = 3028, wingScore = 3128 },
    GOLD        = { minScore = 2686, wingScore = 2841 },
    SILVER      = { minScore = 1605, wingScore = 2353 },
    BRONZE      = { minScore =  398, wingScore =  963 },
    IRON        = { minScore =    1, wingScore =  225 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4010,
    CHALLENGER  = { minScore = 3788, wingScore = 3895 },
    GRANDMASTER = { minScore = 3741, wingScore = 3764 },
    MASTER      = { minScore = 3579, wingScore = 3660 },
    DIAMOND     = { minScore = 3452, wingScore = 3516 },
    EMERALD     = { minScore = 3283, wingScore = 3368 },
    PLATINUM    = { minScore = 3015, wingScore = 3125 },
    GOLD        = { minScore = 2686, wingScore = 2841 },
    SILVER      = { minScore = 1605, wingScore = 2353 },
    BRONZE      = { minScore =  398, wingScore =  963 },
    IRON        = { minScore =    1, wingScore =  225 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4010,
    CHALLENGER  = { minScore = 3891, wingScore = 3895 },
    GRANDMASTER = { minScore = 3845, wingScore = 3868 },
    MASTER      = { minScore = 3681, wingScore = 3763 },
    DIAMOND     = { minScore = 3545, wingScore = 3613 },
    EMERALD     = { minScore = 3363, wingScore = 3454 },
    PLATINUM    = { minScore = 3081, wingScore = 3195 },
    GOLD        = { minScore = 2686, wingScore = 2889 },
    SILVER      = { minScore = 1605, wingScore = 2353 },
    BRONZE      = { minScore =  398, wingScore =  963 },
    IRON        = { minScore =    1, wingScore =  225 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3935,
    CHALLENGER  = { minScore = 3811, wingScore = 3878 },
    GRANDMASTER = { minScore = 3714, wingScore = 3760 },
    MASTER      = { minScore = 3571, wingScore = 3635 },
    DIAMOND     = { minScore = 3363, wingScore = 3437 },
    EMERALD     = { minScore = 3203, wingScore = 3276 },
    PLATINUM    = { minScore = 2979, wingScore = 3057 },
    GOLD        = { minScore = 2628, wingScore = 2756 },
    SILVER      = { minScore = 1327, wingScore = 2158 },
    BRONZE      = { minScore =  339, wingScore =  771 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3935,
    CHALLENGER  = { minScore = 3728, wingScore = 3878 },
    GRANDMASTER = { minScore = 3678, wingScore = 3703 },
    MASTER      = { minScore = 3504, wingScore = 3591 },
    DIAMOND     = { minScore = 3370, wingScore = 3437 },
    EMERALD     = { minScore = 3192, wingScore = 3281 },
    PLATINUM    = { minScore = 2912, wingScore = 3026 },
    GOLD        = { minScore = 2628, wingScore = 2747 },
    SILVER      = { minScore = 1327, wingScore = 2158 },
    BRONZE      = { minScore =  339, wingScore =  771 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3935,
    CHALLENGER  = { minScore = 3863, wingScore = 3878 },
    GRANDMASTER = { minScore = 3811, wingScore = 3837 },
    MASTER      = { minScore = 3630, wingScore = 3721 },
    DIAMOND     = { minScore = 3481, wingScore = 3555 },
    EMERALD     = { minScore = 3282, wingScore = 3382 },
    PLATINUM    = { minScore = 2983, wingScore = 3103 },
    GOLD        = { minScore = 2628, wingScore = 2804 },
    SILVER      = { minScore = 1327, wingScore = 2158 },
    BRONZE      = { minScore =  339, wingScore =  771 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4010,
    CHALLENGER  = { minScore = 3835, wingScore = 3888 },
    GRANDMASTER = { minScore = 3749, wingScore = 3779 },
    MASTER      = { minScore = 3616, wingScore = 3665 },
    DIAMOND     = { minScore = 3403, wingScore = 3483 },
    EMERALD     = { minScore = 3258, wingScore = 3324 },
    PLATINUM    = { minScore = 3008, wingScore = 3098 },
    GOLD        = { minScore = 2662, wingScore = 2805 },
    SILVER      = { minScore = 1489, wingScore = 2272 },
    BRONZE      = { minScore =  373, wingScore =  883 },
    IRON        = { minScore =    1, wingScore =  202 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4010,
    CHALLENGER  = { minScore = 3764, wingScore = 3888 },
    GRANDMASTER = { minScore = 3715, wingScore = 3739 },
    MASTER      = { minScore = 3549, wingScore = 3632 },
    DIAMOND     = { minScore = 3419, wingScore = 3484 },
    EMERALD     = { minScore = 3246, wingScore = 3333 },
    PLATINUM    = { minScore = 2973, wingScore = 3085 },
    GOLD        = { minScore = 2662, wingScore = 2803 },
    SILVER      = { minScore = 1492, wingScore = 2274 },
    BRONZE      = { minScore =  374, wingScore =  885 },
    IRON        = { minScore =    1, wingScore =  203 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4010,
    CHALLENGER  = { minScore = 3879, wingScore = 3888 },
    GRANDMASTER = { minScore = 3830, wingScore = 3855 },
    MASTER      = { minScore = 3659, wingScore = 3745 },
    DIAMOND     = { minScore = 3517, wingScore = 3588 },
    EMERALD     = { minScore = 3328, wingScore = 3423 },
    PLATINUM    = { minScore = 3039, wingScore = 3155 },
    GOLD        = { minScore = 2661, wingScore = 2852 },
    SILVER      = { minScore = 1485, wingScore = 2269 },
    BRONZE      = { minScore =  373, wingScore =  880 },
    IRON        = { minScore =    1, wingScore =  201 },
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
