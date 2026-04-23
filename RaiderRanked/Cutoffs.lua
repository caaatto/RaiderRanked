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
    top100Score = 3846,
    CHALLENGER  = { minScore = 3707, wingScore = 3760 },
    GRANDMASTER = { minScore = 3629, wingScore = 3657 },
    MASTER      = { minScore = 3509, wingScore = 3550 },
    DIAMOND     = { minScore = 3314, wingScore = 3391 },
    EMERALD     = { minScore = 3170, wingScore = 3233 },
    PLATINUM    = { minScore = 2932, wingScore = 3033 },
    GOLD        = { minScore = 2635, wingScore = 2736 },
    SILVER      = { minScore = 1458, wingScore = 2238 },
    BRONZE      = { minScore =  365, wingScore =  878 },
    IRON        = { minScore =    1, wingScore =  197 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3846,
    CHALLENGER  = { minScore = 3656, wingScore = 3760 },
    GRANDMASTER = { minScore = 3611, wingScore = 3634 },
    MASTER      = { minScore = 3453, wingScore = 3532 },
    DIAMOND     = { minScore = 3330, wingScore = 3391 },
    EMERALD     = { minScore = 3165, wingScore = 3248 },
    PLATINUM    = { minScore = 2891, wingScore = 3006 },
    GOLD        = { minScore = 2635, wingScore = 2739 },
    SILVER      = { minScore = 1458, wingScore = 2238 },
    BRONZE      = { minScore =  365, wingScore =  878 },
    IRON        = { minScore =    1, wingScore =  197 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3846,
    CHALLENGER  = { minScore = 3746, wingScore = 3760 },
    GRANDMASTER = { minScore = 3701, wingScore = 3724 },
    MASTER      = { minScore = 3544, wingScore = 3623 },
    DIAMOND     = { minScore = 3411, wingScore = 3478 },
    EMERALD     = { minScore = 3234, wingScore = 3322 },
    PLATINUM    = { minScore = 2942, wingScore = 3064 },
    GOLD        = { minScore = 2635, wingScore = 2775 },
    SILVER      = { minScore = 1458, wingScore = 2238 },
    BRONZE      = { minScore =  365, wingScore =  878 },
    IRON        = { minScore =    1, wingScore =  197 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3795,
    CHALLENGER  = { minScore = 3671, wingScore = 3729 },
    GRANDMASTER = { minScore = 3571, wingScore = 3615 },
    MASTER      = { minScore = 3439, wingScore = 3495 },
    DIAMOND     = { minScore = 3227, wingScore = 3313 },
    EMERALD     = { minScore = 3083, wingScore = 3144 },
    PLATINUM    = { minScore = 2825, wingScore = 2988 },
    GOLD        = { minScore = 2532, wingScore = 2672 },
    SILVER      = { minScore = 1219, wingScore = 2036 },
    BRONZE      = { minScore =  335, wingScore =  715 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3795,
    CHALLENGER  = { minScore = 3590, wingScore = 3729 },
    GRANDMASTER = { minScore = 3543, wingScore = 3566 },
    MASTER      = { minScore = 3378, wingScore = 3460 },
    DIAMOND     = { minScore = 3259, wingScore = 3318 },
    EMERALD     = { minScore = 3100, wingScore = 3179 },
    PLATINUM    = { minScore = 2815, wingScore = 2938 },
    GOLD        = { minScore = 2532, wingScore = 2642 },
    SILVER      = { minScore = 1219, wingScore = 2036 },
    BRONZE      = { minScore =  335, wingScore =  715 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3795,
    CHALLENGER  = { minScore = 3714, wingScore = 3729 },
    GRANDMASTER = { minScore = 3664, wingScore = 3689 },
    MASTER      = { minScore = 3491, wingScore = 3577 },
    DIAMOND     = { minScore = 3350, wingScore = 3420 },
    EMERALD     = { minScore = 3162, wingScore = 3256 },
    PLATINUM    = { minScore = 2861, wingScore = 2985 },
    GOLD        = { minScore = 2532, wingScore = 2692 },
    SILVER      = { minScore = 1219, wingScore = 2036 },
    BRONZE      = { minScore =  335, wingScore =  715 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3846,
    CHALLENGER  = { minScore = 3692, wingScore = 3747 },
    GRANDMASTER = { minScore = 3605, wingScore = 3639 },
    MASTER      = { minScore = 3480, wingScore = 3527 },
    DIAMOND     = { minScore = 3278, wingScore = 3358 },
    EMERALD     = { minScore = 3134, wingScore = 3196 },
    PLATINUM    = { minScore = 2887, wingScore = 3014 },
    GOLD        = { minScore = 2592, wingScore = 2709 },
    SILVER      = { minScore = 1358, wingScore = 2154 },
    BRONZE      = { minScore =  352, wingScore =  810 },
    IRON        = { minScore =    1, wingScore =  186 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3846,
    CHALLENGER  = { minScore = 3629, wingScore = 3747 },
    GRANDMASTER = { minScore = 3583, wingScore = 3606 },
    MASTER      = { minScore = 3423, wingScore = 3503 },
    DIAMOND     = { minScore = 3301, wingScore = 3361 },
    EMERALD     = { minScore = 3139, wingScore = 3220 },
    PLATINUM    = { minScore = 2860, wingScore = 2978 },
    GOLD        = { minScore = 2593, wingScore = 2700 },
    SILVER      = { minScore = 1361, wingScore = 2156 },
    BRONZE      = { minScore =  353, wingScore =  812 },
    IRON        = { minScore =    1, wingScore =  186 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3846,
    CHALLENGER  = { minScore = 3732, wingScore = 3747 },
    GRANDMASTER = { minScore = 3685, wingScore = 3709 },
    MASTER      = { minScore = 3521, wingScore = 3603 },
    DIAMOND     = { minScore = 3385, wingScore = 3453 },
    EMERALD     = { minScore = 3203, wingScore = 3294 },
    PLATINUM    = { minScore = 2907, wingScore = 3030 },
    GOLD        = { minScore = 2591, wingScore = 2739 },
    SILVER      = { minScore = 1355, wingScore = 2151 },
    BRONZE      = { minScore =  352, wingScore =  808 },
    IRON        = { minScore =    1, wingScore =  185 },
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
