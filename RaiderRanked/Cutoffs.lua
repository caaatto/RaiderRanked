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
    top100Score = 3902,
    CHALLENGER  = { minScore = 3764, wingScore = 3796 },
    GRANDMASTER = { minScore = 3669, wingScore = 3702 },
    MASTER      = { minScore = 3551, wingScore = 3600 },
    DIAMOND     = { minScore = 3357, wingScore = 3432 },
    EMERALD     = { minScore = 3216, wingScore = 3285 },
    PLATINUM    = { minScore = 2988, wingScore = 3066 },
    GOLD        = { minScore = 2651, wingScore = 2769 },
    SILVER      = { minScore = 1490, wingScore = 2272 },
    BRONZE      = { minScore =  369, wingScore =  894 },
    IRON        = { minScore =    1, wingScore =  198 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3902,
    CHALLENGER  = { minScore = 3697, wingScore = 3796 },
    GRANDMASTER = { minScore = 3655, wingScore = 3676 },
    MASTER      = { minScore = 3509, wingScore = 3582 },
    DIAMOND     = { minScore = 3381, wingScore = 3445 },
    EMERALD     = { minScore = 3210, wingScore = 3295 },
    PLATINUM    = { minScore = 2934, wingScore = 3048 },
    GOLD        = { minScore = 2651, wingScore = 2774 },
    SILVER      = { minScore = 1490, wingScore = 2272 },
    BRONZE      = { minScore =  369, wingScore =  894 },
    IRON        = { minScore =    1, wingScore =  198 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3902,
    CHALLENGER  = { minScore = 3786, wingScore = 3796 },
    GRANDMASTER = { minScore = 3742, wingScore = 3764 },
    MASTER      = { minScore = 3591, wingScore = 3667 },
    DIAMOND     = { minScore = 3459, wingScore = 3525 },
    EMERALD     = { minScore = 3284, wingScore = 3372 },
    PLATINUM    = { minScore = 2994, wingScore = 3115 },
    GOLD        = { minScore = 2651, wingScore = 2815 },
    SILVER      = { minScore = 1490, wingScore = 2272 },
    BRONZE      = { minScore =  369, wingScore =  894 },
    IRON        = { minScore =    1, wingScore =  198 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3852,
    CHALLENGER  = { minScore = 3722, wingScore = 3777 },
    GRANDMASTER = { minScore = 3626, wingScore = 3660 },
    MASTER      = { minScore = 3489, wingScore = 3542 },
    DIAMOND     = { minScore = 3281, wingScore = 3362 },
    EMERALD     = { minScore = 3124, wingScore = 3194 },
    PLATINUM    = { minScore = 2878, wingScore = 3013 },
    GOLD        = { minScore = 2565, wingScore = 2697 },
    SILVER      = { minScore = 1245, wingScore = 2067 },
    BRONZE      = { minScore =  336, wingScore =  723 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3852,
    CHALLENGER  = { minScore = 3640, wingScore = 3777 },
    GRANDMASTER = { minScore = 3592, wingScore = 3616 },
    MASTER      = { minScore = 3426, wingScore = 3509 },
    DIAMOND     = { minScore = 3299, wingScore = 3362 },
    EMERALD     = { minScore = 3130, wingScore = 3215 },
    PLATINUM    = { minScore = 2846, wingScore = 2966 },
    GOLD        = { minScore = 2565, wingScore = 2676 },
    SILVER      = { minScore = 1245, wingScore = 2067 },
    BRONZE      = { minScore =  336, wingScore =  723 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3852,
    CHALLENGER  = { minScore = 3766, wingScore = 3777 },
    GRANDMASTER = { minScore = 3716, wingScore = 3741 },
    MASTER      = { minScore = 3539, wingScore = 3627 },
    DIAMOND     = { minScore = 3395, wingScore = 3467 },
    EMERALD     = { minScore = 3202, wingScore = 3299 },
    PLATINUM    = { minScore = 2902, wingScore = 3025 },
    GOLD        = { minScore = 2565, wingScore = 2731 },
    SILVER      = { minScore = 1245, wingScore = 2067 },
    BRONZE      = { minScore =  336, wingScore =  723 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3902,
    CHALLENGER  = { minScore = 3746, wingScore = 3788 },
    GRANDMASTER = { minScore = 3651, wingScore = 3684 },
    MASTER      = { minScore = 3525, wingScore = 3576 },
    DIAMOND     = { minScore = 3325, wingScore = 3403 },
    EMERALD     = { minScore = 3178, wingScore = 3247 },
    PLATINUM    = { minScore = 2942, wingScore = 3044 },
    GOLD        = { minScore = 2615, wingScore = 2739 },
    SILVER      = { minScore = 1387, wingScore = 2186 },
    BRONZE      = { minScore =  355, wingScore =  822 },
    IRON        = { minScore =    1, wingScore =  186 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3902,
    CHALLENGER  = { minScore = 3674, wingScore = 3788 },
    GRANDMASTER = { minScore = 3629, wingScore = 3652 },
    MASTER      = { minScore = 3475, wingScore = 3552 },
    DIAMOND     = { minScore = 3348, wingScore = 3411 },
    EMERALD     = { minScore = 3178, wingScore = 3263 },
    PLATINUM    = { minScore = 2898, wingScore = 3015 },
    GOLD        = { minScore = 2616, wingScore = 2734 },
    SILVER      = { minScore = 1391, wingScore = 2189 },
    BRONZE      = { minScore =  356, wingScore =  825 },
    IRON        = { minScore =    1, wingScore =  187 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3902,
    CHALLENGER  = { minScore = 3777, wingScore = 3788 },
    GRANDMASTER = { minScore = 3731, wingScore = 3754 },
    MASTER      = { minScore = 3569, wingScore = 3650 },
    DIAMOND     = { minScore = 3431, wingScore = 3500 },
    EMERALD     = { minScore = 3249, wingScore = 3341 },
    PLATINUM    = { minScore = 2954, wingScore = 3076 },
    GOLD        = { minScore = 2614, wingScore = 2779 },
    SILVER      = { minScore = 1384, wingScore = 2184 },
    BRONZE      = { minScore =  355, wingScore =  820 },
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
