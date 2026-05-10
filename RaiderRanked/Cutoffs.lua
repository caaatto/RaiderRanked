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
    top100Score = 4018,
    CHALLENGER  = { minScore = 3875, wingScore = 3907 },
    GRANDMASTER = { minScore = 3780, wingScore = 3812 },
    MASTER      = { minScore = 3661, wingScore = 3710 },
    DIAMOND     = { minScore = 3450, wingScore = 3539 },
    EMERALD     = { minScore = 3319, wingScore = 3387 },
    PLATINUM    = { minScore = 3041, wingScore = 3153 },
    GOLD        = { minScore = 2701, wingScore = 2869 },
    SILVER      = { minScore = 1639, wingScore = 2382 },
    BRONZE      = { minScore =  404, wingScore =  983 },
    IRON        = { minScore =    1, wingScore =  229 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4018,
    CHALLENGER  = { minScore = 3803, wingScore = 3907 },
    GRANDMASTER = { minScore = 3760, wingScore = 3781 },
    MASTER      = { minScore = 3606, wingScore = 3683 },
    DIAMOND     = { minScore = 3478, wingScore = 3542 },
    EMERALD     = { minScore = 3307, wingScore = 3392 },
    PLATINUM    = { minScore = 3046, wingScore = 3151 },
    GOLD        = { minScore = 2701, wingScore = 2869 },
    SILVER      = { minScore = 1639, wingScore = 2382 },
    BRONZE      = { minScore =  404, wingScore =  983 },
    IRON        = { minScore =    1, wingScore =  229 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4018,
    CHALLENGER  = { minScore = 3898, wingScore = 3907 },
    GRANDMASTER = { minScore = 3855, wingScore = 3876 },
    MASTER      = { minScore = 3704, wingScore = 3779 },
    DIAMOND     = { minScore = 3570, wingScore = 3637 },
    EMERALD     = { minScore = 3392, wingScore = 3481 },
    PLATINUM    = { minScore = 3105, wingScore = 3224 },
    GOLD        = { minScore = 2701, wingScore = 2910 },
    SILVER      = { minScore = 1639, wingScore = 2382 },
    BRONZE      = { minScore =  404, wingScore =  983 },
    IRON        = { minScore =    1, wingScore =  229 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3946,
    CHALLENGER  = { minScore = 3830, wingScore = 3892 },
    GRANDMASTER = { minScore = 3737, wingScore = 3775 },
    MASTER      = { minScore = 3595, wingScore = 3656 },
    DIAMOND     = { minScore = 3394, wingScore = 3455 },
    EMERALD     = { minScore = 3226, wingScore = 3304 },
    PLATINUM    = { minScore = 3003, wingScore = 3074 },
    GOLD        = { minScore = 2641, wingScore = 2776 },
    SILVER      = { minScore = 1346, wingScore = 2183 },
    BRONZE      = { minScore =  340, wingScore =  791 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3946,
    CHALLENGER  = { minScore = 3757, wingScore = 3892 },
    GRANDMASTER = { minScore = 3707, wingScore = 3732 },
    MASTER      = { minScore = 3531, wingScore = 3619 },
    DIAMOND     = { minScore = 3395, wingScore = 3463 },
    EMERALD     = { minScore = 3215, wingScore = 3305 },
    PLATINUM    = { minScore = 2938, wingScore = 3050 },
    GOLD        = { minScore = 2641, wingScore = 2770 },
    SILVER      = { minScore = 1346, wingScore = 2183 },
    BRONZE      = { minScore =  340, wingScore =  791 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3946,
    CHALLENGER  = { minScore = 3885, wingScore = 3892 },
    GRANDMASTER = { minScore = 3833, wingScore = 3859 },
    MASTER      = { minScore = 3655, wingScore = 3744 },
    DIAMOND     = { minScore = 3506, wingScore = 3580 },
    EMERALD     = { minScore = 3307, wingScore = 3406 },
    PLATINUM    = { minScore = 3012, wingScore = 3130 },
    GOLD        = { minScore = 2641, wingScore = 2829 },
    SILVER      = { minScore = 1346, wingScore = 2183 },
    BRONZE      = { minScore =  340, wingScore =  791 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4018,
    CHALLENGER  = { minScore = 3856, wingScore = 3901 },
    GRANDMASTER = { minScore = 3762, wingScore = 3797 },
    MASTER      = { minScore = 3633, wingScore = 3687 },
    DIAMOND     = { minScore = 3427, wingScore = 3504 },
    EMERALD     = { minScore = 3280, wingScore = 3352 },
    PLATINUM    = { minScore = 3025, wingScore = 3120 },
    GOLD        = { minScore = 2676, wingScore = 2830 },
    SILVER      = { minScore = 1517, wingScore = 2299 },
    BRONZE      = { minScore =  377, wingScore =  903 },
    IRON        = { minScore =    1, wingScore =  204 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4018,
    CHALLENGER  = { minScore = 3784, wingScore = 3901 },
    GRANDMASTER = { minScore = 3738, wingScore = 3761 },
    MASTER      = { minScore = 3576, wingScore = 3657 },
    DIAMOND     = { minScore = 3444, wingScore = 3510 },
    EMERALD     = { minScore = 3270, wingScore = 3357 },
    PLATINUM    = { minScore = 3002, wingScore = 3110 },
    GOLD        = { minScore = 2677, wingScore = 2829 },
    SILVER      = { minScore = 1520, wingScore = 2301 },
    BRONZE      = { minScore =  378, wingScore =  905 },
    IRON        = { minScore =    1, wingScore =  205 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4018,
    CHALLENGER  = { minScore = 3892, wingScore = 3901 },
    GRANDMASTER = { minScore = 3846, wingScore = 3869 },
    MASTER      = { minScore = 3683, wingScore = 3764 },
    DIAMOND     = { minScore = 3542, wingScore = 3612 },
    EMERALD     = { minScore = 3355, wingScore = 3449 },
    PLATINUM    = { minScore = 3065, wingScore = 3184 },
    GOLD        = { minScore = 2675, wingScore = 2875 },
    SILVER      = { minScore = 1513, wingScore = 2296 },
    BRONZE      = { minScore =  376, wingScore =  900 },
    IRON        = { minScore =    1, wingScore =  204 },
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
