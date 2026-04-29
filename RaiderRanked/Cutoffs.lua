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
    top100Score = 3916,
    CHALLENGER  = { minScore = 3775, wingScore = 3816 },
    GRANDMASTER = { minScore = 3684, wingScore = 3727 },
    MASTER      = { minScore = 3565, wingScore = 3622 },
    DIAMOND     = { minScore = 3372, wingScore = 3444 },
    EMERALD     = { minScore = 3226, wingScore = 3299 },
    PLATINUM    = { minScore = 2999, wingScore = 3073 },
    GOLD        = { minScore = 2654, wingScore = 2776 },
    SILVER      = { minScore = 1489, wingScore = 2277 },
    BRONZE      = { minScore =  366, wingScore =  891 },
    IRON        = { minScore =    1, wingScore =  199 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3916,
    CHALLENGER  = { minScore = 3718, wingScore = 3816 },
    GRANDMASTER = { minScore = 3676, wingScore = 3697 },
    MASTER      = { minScore = 3529, wingScore = 3602 },
    DIAMOND     = { minScore = 3397, wingScore = 3463 },
    EMERALD     = { minScore = 3222, wingScore = 3310 },
    PLATINUM    = { minScore = 2945, wingScore = 3059 },
    GOLD        = { minScore = 2654, wingScore = 2782 },
    SILVER      = { minScore = 1489, wingScore = 2277 },
    BRONZE      = { minScore =  366, wingScore =  891 },
    IRON        = { minScore =    1, wingScore =  199 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3916,
    CHALLENGER  = { minScore = 3802, wingScore = 3816 },
    GRANDMASTER = { minScore = 3760, wingScore = 3781 },
    MASTER      = { minScore = 3614, wingScore = 3687 },
    DIAMOND     = { minScore = 3478, wingScore = 3546 },
    EMERALD     = { minScore = 3297, wingScore = 3387 },
    PLATINUM    = { minScore = 3005, wingScore = 3126 },
    GOLD        = { minScore = 2654, wingScore = 2823 },
    SILVER      = { minScore = 1489, wingScore = 2277 },
    BRONZE      = { minScore =  366, wingScore =  891 },
    IRON        = { minScore =    1, wingScore =  199 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3880,
    CHALLENGER  = { minScore = 3743, wingScore = 3791 },
    GRANDMASTER = { minScore = 3643, wingScore = 3674 },
    MASTER      = { minScore = 3508, wingScore = 3554 },
    DIAMOND     = { minScore = 3297, wingScore = 3379 },
    EMERALD     = { minScore = 3136, wingScore = 3206 },
    PLATINUM    = { minScore = 2893, wingScore = 3019 },
    GOLD        = { minScore = 2576, wingScore = 2705 },
    SILVER      = { minScore = 1252, wingScore = 2077 },
    BRONZE      = { minScore =  335, wingScore =  721 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3880,
    CHALLENGER  = { minScore = 3654, wingScore = 3791 },
    GRANDMASTER = { minScore = 3606, wingScore = 3630 },
    MASTER      = { minScore = 3437, wingScore = 3522 },
    DIAMOND     = { minScore = 3310, wingScore = 3373 },
    EMERALD     = { minScore = 3140, wingScore = 3225 },
    PLATINUM    = { minScore = 2857, wingScore = 2976 },
    GOLD        = { minScore = 2576, wingScore = 2688 },
    SILVER      = { minScore = 1252, wingScore = 2077 },
    BRONZE      = { minScore =  335, wingScore =  721 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3880,
    CHALLENGER  = { minScore = 3782, wingScore = 3791 },
    GRANDMASTER = { minScore = 3731, wingScore = 3756 },
    MASTER      = { minScore = 3553, wingScore = 3642 },
    DIAMOND     = { minScore = 3408, wingScore = 3481 },
    EMERALD     = { minScore = 3215, wingScore = 3312 },
    PLATINUM    = { minScore = 2916, wingScore = 3037 },
    GOLD        = { minScore = 2576, wingScore = 2744 },
    SILVER      = { minScore = 1252, wingScore = 2077 },
    BRONZE      = { minScore =  335, wingScore =  721 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3916,
    CHALLENGER  = { minScore = 3762, wingScore = 3806 },
    GRANDMASTER = { minScore = 3667, wingScore = 3705 },
    MASTER      = { minScore = 3541, wingScore = 3594 },
    DIAMOND     = { minScore = 3341, wingScore = 3417 },
    EMERALD     = { minScore = 3188, wingScore = 3260 },
    PLATINUM    = { minScore = 2955, wingScore = 3050 },
    GOLD        = { minScore = 2621, wingScore = 2746 },
    SILVER      = { minScore = 1390, wingScore = 2193 },
    BRONZE      = { minScore =  353, wingScore =  820 },
    IRON        = { minScore =    1, wingScore =  187 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3916,
    CHALLENGER  = { minScore = 3692, wingScore = 3806 },
    GRANDMASTER = { minScore = 3648, wingScore = 3670 },
    MASTER      = { minScore = 3492, wingScore = 3570 },
    DIAMOND     = { minScore = 3362, wingScore = 3426 },
    EMERALD     = { minScore = 3189, wingScore = 3275 },
    PLATINUM    = { minScore = 2909, wingScore = 3025 },
    GOLD        = { minScore = 2622, wingScore = 2744 },
    SILVER      = { minScore = 1393, wingScore = 2196 },
    BRONZE      = { minScore =  353, wingScore =  822 },
    IRON        = { minScore =    1, wingScore =  187 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3916,
    CHALLENGER  = { minScore = 3793, wingScore = 3805 },
    GRANDMASTER = { minScore = 3747, wingScore = 3770 },
    MASTER      = { minScore = 3588, wingScore = 3668 },
    DIAMOND     = { minScore = 3448, wingScore = 3518 },
    EMERALD     = { minScore = 3262, wingScore = 3355 },
    PLATINUM    = { minScore = 2967, wingScore = 3088 },
    GOLD        = { minScore = 2620, wingScore = 2789 },
    SILVER      = { minScore = 1387, wingScore = 2191 },
    BRONZE      = { minScore =  353, wingScore =  818 },
    IRON        = { minScore =    1, wingScore =  186 },
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
