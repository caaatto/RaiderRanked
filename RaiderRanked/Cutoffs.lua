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
    top100Score = 3794,
    CHALLENGER  = { minScore = 3659, wingScore = 3705 },
    GRANDMASTER = { minScore = 3568, wingScore = 3609 },
    MASTER      = { minScore = 3448, wingScore = 3503 },
    DIAMOND     = { minScore = 3258, wingScore = 3332 },
    EMERALD     = { minScore = 3112, wingScore = 3181 },
    PLATINUM    = { minScore = 2858, wingScore = 3006 },
    GOLD        = { minScore = 2598, wingScore = 2697 },
    SILVER      = { minScore = 1370, wingScore = 2159 },
    BRONZE      = { minScore =  366, wingScore =  845 },
    IRON        = { minScore =    1, wingScore =  196 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3794,
    CHALLENGER  = { minScore = 3608, wingScore = 3705 },
    GRANDMASTER = { minScore = 3563, wingScore = 3585 },
    MASTER      = { minScore = 3409, wingScore = 3486 },
    DIAMOND     = { minScore = 3286, wingScore = 3347 },
    EMERALD     = { minScore = 3122, wingScore = 3204 },
    PLATINUM    = { minScore = 2844, wingScore = 2962 },
    GOLD        = { minScore = 2598, wingScore = 2691 },
    SILVER      = { minScore = 1370, wingScore = 2159 },
    BRONZE      = { minScore =  366, wingScore =  845 },
    IRON        = { minScore =    1, wingScore =  196 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3794,
    CHALLENGER  = { minScore = 3687, wingScore = 3705 },
    GRANDMASTER = { minScore = 3644, wingScore = 3666 },
    MASTER      = { minScore = 3492, wingScore = 3568 },
    DIAMOND     = { minScore = 3358, wingScore = 3425 },
    EMERALD     = { minScore = 3179, wingScore = 3268 },
    PLATINUM    = { minScore = 2884, wingScore = 3008 },
    GOLD        = { minScore = 2598, wingScore = 2724 },
    SILVER      = { minScore = 1370, wingScore = 2159 },
    BRONZE      = { minScore =  366, wingScore =  845 },
    IRON        = { minScore =    1, wingScore =  196 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3754,
    CHALLENGER  = { minScore = 3630, wingScore = 3676 },
    GRANDMASTER = { minScore = 3533, wingScore = 3561 },
    MASTER      = { minScore = 3393, wingScore = 3439 },
    DIAMOND     = { minScore = 3174, wingScore = 3256 },
    EMERALD     = { minScore = 3042, wingScore = 3091 },
    PLATINUM    = { minScore = 2768, wingScore = 2909 },
    GOLD        = { minScore = 2460, wingScore = 2645 },
    SILVER      = { minScore = 1148, wingScore = 1961 },
    BRONZE      = { minScore =  336, wingScore =  693 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3754,
    CHALLENGER  = { minScore = 3547, wingScore = 3676 },
    GRANDMASTER = { minScore = 3497, wingScore = 3522 },
    MASTER      = { minScore = 3321, wingScore = 3409 },
    DIAMOND     = { minScore = 3213, wingScore = 3267 },
    EMERALD     = { minScore = 3069, wingScore = 3141 },
    PLATINUM    = { minScore = 2784, wingScore = 2912 },
    GOLD        = { minScore = 2460, wingScore = 2593 },
    SILVER      = { minScore = 1148, wingScore = 1961 },
    BRONZE      = { minScore =  336, wingScore =  693 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3754,
    CHALLENGER  = { minScore = 3667, wingScore = 3676 },
    GRANDMASTER = { minScore = 3616, wingScore = 3642 },
    MASTER      = { minScore = 3435, wingScore = 3526 },
    DIAMOND     = { minScore = 3300, wingScore = 3368 },
    EMERALD     = { minScore = 3119, wingScore = 3210 },
    PLATINUM    = { minScore = 2818, wingScore = 2945 },
    GOLD        = { minScore = 2460, wingScore = 2640 },
    SILVER      = { minScore = 1148, wingScore = 1961 },
    BRONZE      = { minScore =  336, wingScore =  693 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3794,
    CHALLENGER  = { minScore = 3647, wingScore = 3693 },
    GRANDMASTER = { minScore = 3553, wingScore = 3589 },
    MASTER      = { minScore = 3425, wingScore = 3476 },
    DIAMOND     = { minScore = 3223, wingScore = 3300 },
    EMERALD     = { minScore = 3083, wingScore = 3143 },
    PLATINUM    = { minScore = 2820, wingScore = 2965 },
    GOLD        = { minScore = 2540, wingScore = 2675 },
    SILVER      = { minScore = 1277, wingScore = 2076 },
    BRONZE      = { minScore =  353, wingScore =  781 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3794,
    CHALLENGER  = { minScore = 3583, wingScore = 3693 },
    GRANDMASTER = { minScore = 3536, wingScore = 3559 },
    MASTER      = { minScore = 3373, wingScore = 3455 },
    DIAMOND     = { minScore = 3256, wingScore = 3315 },
    EMERALD     = { minScore = 3100, wingScore = 3178 },
    PLATINUM    = { minScore = 2820, wingScore = 2942 },
    GOLD        = { minScore = 2542, wingScore = 2651 },
    SILVER      = { minScore = 1280, wingScore = 2079 },
    BRONZE      = { minScore =  354, wingScore =  783 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3794,
    CHALLENGER  = { minScore = 3678, wingScore = 3692 },
    GRANDMASTER = { minScore = 3632, wingScore = 3656 },
    MASTER      = { minScore = 3467, wingScore = 3550 },
    DIAMOND     = { minScore = 3333, wingScore = 3400 },
    EMERALD     = { minScore = 3153, wingScore = 3243 },
    PLATINUM    = { minScore = 2856, wingScore = 2981 },
    GOLD        = { minScore = 2538, wingScore = 2688 },
    SILVER      = { minScore = 1274, wingScore = 2074 },
    BRONZE      = { minScore =  353, wingScore =  779 },
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
