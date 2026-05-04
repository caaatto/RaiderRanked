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
    top100Score = 3976,
    CHALLENGER  = { minScore = 3823, wingScore = 3877 },
    GRANDMASTER = { minScore = 3752, wingScore = 3776 },
    MASTER      = { minScore = 3622, wingScore = 3666 },
    DIAMOND     = { minScore = 3419, wingScore = 3492 },
    EMERALD     = { minScore = 3275, wingScore = 3338 },
    PLATINUM    = { minScore = 3017, wingScore = 3111 },
    GOLD        = { minScore = 2675, wingScore = 2820 },
    SILVER      = { minScore = 1572, wingScore = 2330 },
    BRONZE      = { minScore =  395, wingScore =  945 },
    IRON        = { minScore =    1, wingScore =  221 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3976,
    CHALLENGER  = { minScore = 3772, wingScore = 3877 },
    GRANDMASTER = { minScore = 3725, wingScore = 3749 },
    MASTER      = { minScore = 3561, wingScore = 3643 },
    DIAMOND     = { minScore = 3434, wingScore = 3498 },
    EMERALD     = { minScore = 3266, wingScore = 3350 },
    PLATINUM    = { minScore = 2994, wingScore = 3106 },
    GOLD        = { minScore = 2675, wingScore = 2823 },
    SILVER      = { minScore = 1572, wingScore = 2330 },
    BRONZE      = { minScore =  395, wingScore =  945 },
    IRON        = { minScore =    1, wingScore =  221 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3976,
    CHALLENGER  = { minScore = 3866, wingScore = 3877 },
    GRANDMASTER = { minScore = 3820, wingScore = 3843 },
    MASTER      = { minScore = 3661, wingScore = 3741 },
    DIAMOND     = { minScore = 3525, wingScore = 3593 },
    EMERALD     = { minScore = 3343, wingScore = 3434 },
    PLATINUM    = { minScore = 3059, wingScore = 3175 },
    GOLD        = { minScore = 2675, wingScore = 2871 },
    SILVER      = { minScore = 1572, wingScore = 2330 },
    BRONZE      = { minScore =  395, wingScore =  945 },
    IRON        = { minScore =    1, wingScore =  221 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3915,
    CHALLENGER  = { minScore = 3789, wingScore = 3846 },
    GRANDMASTER = { minScore = 3686, wingScore = 3732 },
    MASTER      = { minScore = 3551, wingScore = 3607 },
    DIAMOND     = { minScore = 3340, wingScore = 3422 },
    EMERALD     = { minScore = 3183, wingScore = 3253 },
    PLATINUM    = { minScore = 2952, wingScore = 3042 },
    GOLD        = { minScore = 2612, wingScore = 2737 },
    SILVER      = { minScore = 1310, wingScore = 2130 },
    BRONZE      = { minScore =  338, wingScore =  756 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3915,
    CHALLENGER  = { minScore = 3703, wingScore = 3846 },
    GRANDMASTER = { minScore = 3653, wingScore = 3678 },
    MASTER      = { minScore = 3479, wingScore = 3566 },
    DIAMOND     = { minScore = 3348, wingScore = 3413 },
    EMERALD     = { minScore = 3174, wingScore = 3261 },
    PLATINUM    = { minScore = 2893, wingScore = 3009 },
    GOLD        = { minScore = 2612, wingScore = 2727 },
    SILVER      = { minScore = 1310, wingScore = 2130 },
    BRONZE      = { minScore =  338, wingScore =  756 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3915,
    CHALLENGER  = { minScore = 3831, wingScore = 3846 },
    GRANDMASTER = { minScore = 3780, wingScore = 3806 },
    MASTER      = { minScore = 3604, wingScore = 3692 },
    DIAMOND     = { minScore = 3456, wingScore = 3530 },
    EMERALD     = { minScore = 3260, wingScore = 3358 },
    PLATINUM    = { minScore = 2961, wingScore = 3081 },
    GOLD        = { minScore = 2612, wingScore = 2785 },
    SILVER      = { minScore = 1310, wingScore = 2130 },
    BRONZE      = { minScore =  338, wingScore =  756 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3976,
    CHALLENGER  = { minScore = 3809, wingScore = 3864 },
    GRANDMASTER = { minScore = 3724, wingScore = 3758 },
    MASTER      = { minScore = 3592, wingScore = 3641 },
    DIAMOND     = { minScore = 3386, wingScore = 3463 },
    EMERALD     = { minScore = 3237, wingScore = 3302 },
    PLATINUM    = { minScore = 2990, wingScore = 3082 },
    GOLD        = { minScore = 2649, wingScore = 2785 },
    SILVER      = { minScore = 1462, wingScore = 2246 },
    BRONZE      = { minScore =  371, wingScore =  866 },
    IRON        = { minScore =    1, wingScore =  200 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3976,
    CHALLENGER  = { minScore = 3744, wingScore = 3864 },
    GRANDMASTER = { minScore = 3696, wingScore = 3720 },
    MASTER      = { minScore = 3528, wingScore = 3612 },
    DIAMOND     = { minScore = 3399, wingScore = 3464 },
    EMERALD     = { minScore = 3229, wingScore = 3314 },
    PLATINUM    = { minScore = 2953, wingScore = 3067 },
    GOLD        = { minScore = 2649, wingScore = 2784 },
    SILVER      = { minScore = 1466, wingScore = 2249 },
    BRONZE      = { minScore =  372, wingScore =  868 },
    IRON        = { minScore =    1, wingScore =  200 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3976,
    CHALLENGER  = { minScore = 3851, wingScore = 3864 },
    GRANDMASTER = { minScore = 3803, wingScore = 3827 },
    MASTER      = { minScore = 3636, wingScore = 3720 },
    DIAMOND     = { minScore = 3495, wingScore = 3566 },
    EMERALD     = { minScore = 3307, wingScore = 3401 },
    PLATINUM    = { minScore = 3017, wingScore = 3135 },
    GOLD        = { minScore = 2648, wingScore = 2834 },
    SILVER      = { minScore = 1459, wingScore = 2244 },
    BRONZE      = { minScore =  370, wingScore =  864 },
    IRON        = { minScore =    1, wingScore =  199 },
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
