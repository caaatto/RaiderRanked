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
    top100Score = 3876,
    CHALLENGER  = { minScore = 3736, wingScore = 3776 },
    GRANDMASTER = { minScore = 3652, wingScore = 3673 },
    MASTER      = { minScore = 3535, wingScore = 3567 },
    DIAMOND     = { minScore = 3332, wingScore = 3414 },
    EMERALD     = { minScore = 3193, wingScore = 3256 },
    PLATINUM    = { minScore = 2961, wingScore = 3048 },
    GOLD        = { minScore = 2644, wingScore = 2752 },
    SILVER      = { minScore = 1474, wingScore = 2256 },
    BRONZE      = { minScore =  368, wingScore =  887 },
    IRON        = { minScore =    1, wingScore =  198 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3876,
    CHALLENGER  = { minScore = 3670, wingScore = 3776 },
    GRANDMASTER = { minScore = 3627, wingScore = 3649 },
    MASTER      = { minScore = 3475, wingScore = 3551 },
    DIAMOND     = { minScore = 3351, wingScore = 3413 },
    EMERALD     = { minScore = 3185, wingScore = 3268 },
    PLATINUM    = { minScore = 2912, wingScore = 3026 },
    GOLD        = { minScore = 2644, wingScore = 2756 },
    SILVER      = { minScore = 1474, wingScore = 2256 },
    BRONZE      = { minScore =  368, wingScore =  887 },
    IRON        = { minScore =    1, wingScore =  198 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3876,
    CHALLENGER  = { minScore = 3770, wingScore = 3776 },
    GRANDMASTER = { minScore = 3723, wingScore = 3747 },
    MASTER      = { minScore = 3560, wingScore = 3642 },
    DIAMOND     = { minScore = 3430, wingScore = 3495 },
    EMERALD     = { minScore = 3256, wingScore = 3343 },
    PLATINUM    = { minScore = 2967, wingScore = 3088 },
    GOLD        = { minScore = 2644, wingScore = 2794 },
    SILVER      = { minScore = 1474, wingScore = 2256 },
    BRONZE      = { minScore =  368, wingScore =  887 },
    IRON        = { minScore =    1, wingScore =  198 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3820,
    CHALLENGER  = { minScore = 3690, wingScore = 3746 },
    GRANDMASTER = { minScore = 3591, wingScore = 3638 },
    MASTER      = { minScore = 3457, wingScore = 3518 },
    DIAMOND     = { minScore = 3250, wingScore = 3333 },
    EMERALD     = { minScore = 3101, wingScore = 3166 },
    PLATINUM    = { minScore = 2848, wingScore = 3004 },
    GOLD        = { minScore = 2547, wingScore = 2683 },
    SILVER      = { minScore = 1230, wingScore = 2051 },
    BRONZE      = { minScore =  336, wingScore =  720 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3820,
    CHALLENGER  = { minScore = 3613, wingScore = 3746 },
    GRANDMASTER = { minScore = 3567, wingScore = 3590 },
    MASTER      = { minScore = 3404, wingScore = 3485 },
    DIAMOND     = { minScore = 3280, wingScore = 3342 },
    EMERALD     = { minScore = 3114, wingScore = 3197 },
    PLATINUM    = { minScore = 2829, wingScore = 2950 },
    GOLD        = { minScore = 2547, wingScore = 2658 },
    SILVER      = { minScore = 1230, wingScore = 2051 },
    BRONZE      = { minScore =  336, wingScore =  720 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3820,
    CHALLENGER  = { minScore = 3732, wingScore = 3746 },
    GRANDMASTER = { minScore = 3683, wingScore = 3708 },
    MASTER      = { minScore = 3512, wingScore = 3598 },
    DIAMOND     = { minScore = 3370, wingScore = 3441 },
    EMERALD     = { minScore = 3179, wingScore = 3275 },
    PLATINUM    = { minScore = 2879, wingScore = 3002 },
    GOLD        = { minScore = 2547, wingScore = 2710 },
    SILVER      = { minScore = 1230, wingScore = 2051 },
    BRONZE      = { minScore =  336, wingScore =  720 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3876,
    CHALLENGER  = { minScore = 3717, wingScore = 3763 },
    GRANDMASTER = { minScore = 3626, wingScore = 3658 },
    MASTER      = { minScore = 3502, wingScore = 3547 },
    DIAMOND     = { minScore = 3298, wingScore = 3380 },
    EMERALD     = { minScore = 3155, wingScore = 3218 },
    PLATINUM    = { minScore = 2914, wingScore = 3030 },
    GOLD        = { minScore = 2603, wingScore = 2723 },
    SILVER      = { minScore = 1372, wingScore = 2170 },
    BRONZE      = { minScore =  355, wingScore =  817 },
    IRON        = { minScore =    1, wingScore =  186 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3876,
    CHALLENGER  = { minScore = 3647, wingScore = 3764 },
    GRANDMASTER = { minScore = 3603, wingScore = 3625 },
    MASTER      = { minScore = 3446, wingScore = 3524 },
    DIAMOND     = { minScore = 3322, wingScore = 3384 },
    EMERALD     = { minScore = 3156, wingScore = 3239 },
    PLATINUM    = { minScore = 2878, wingScore = 2995 },
    GOLD        = { minScore = 2605, wingScore = 2716 },
    SILVER      = { minScore = 1375, wingScore = 2173 },
    BRONZE      = { minScore =  355, wingScore =  819 },
    IRON        = { minScore =    1, wingScore =  187 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3876,
    CHALLENGER  = { minScore = 3754, wingScore = 3763 },
    GRANDMASTER = { minScore = 3706, wingScore = 3730 },
    MASTER      = { minScore = 3539, wingScore = 3623 },
    DIAMOND     = { minScore = 3404, wingScore = 3472 },
    EMERALD     = { minScore = 3223, wingScore = 3314 },
    PLATINUM    = { minScore = 2929, wingScore = 3051 },
    GOLD        = { minScore = 2602, wingScore = 2758 },
    SILVER      = { minScore = 1369, wingScore = 2168 },
    BRONZE      = { minScore =  354, wingScore =  815 },
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
