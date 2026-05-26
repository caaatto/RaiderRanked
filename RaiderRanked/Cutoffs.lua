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
    top100Score = 4152,
    CHALLENGER  = { minScore = 3995, wingScore = 4029 },
    GRANDMASTER = { minScore = 3897, wingScore = 3927 },
    MASTER      = { minScore = 3776, wingScore = 3819 },
    DIAMOND     = { minScore = 3549, wingScore = 3639 },
    EMERALD     = { minScore = 3411, wingScore = 3459 },
    PLATINUM    = { minScore = 3107, wingScore = 3243 },
    GOLD        = { minScore = 2764, wingScore = 2979 },
    SILVER      = { minScore = 1712, wingScore = 2475 },
    BRONZE      = { minScore =  441, wingScore =  1015 },
    IRON        = { minScore =    1, wingScore =  237 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4152,
    CHALLENGER  = { minScore = 3918, wingScore = 4029 },
    GRANDMASTER = { minScore = 3871, wingScore = 3894 },
    MASTER      = { minScore = 3710, wingScore = 3790 },
    DIAMOND     = { minScore = 3579, wingScore = 3644 },
    EMERALD     = { minScore = 3404, wingScore = 3491 },
    PLATINUM    = { minScore = 3120, wingScore = 3238 },
    GOLD        = { minScore = 2764, wingScore = 2929 },
    SILVER      = { minScore = 1712, wingScore = 2475 },
    BRONZE      = { minScore =  441, wingScore =  1015 },
    IRON        = { minScore =    1, wingScore =  237 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4152,
    CHALLENGER  = { minScore = 4018, wingScore = 4029 },
    GRANDMASTER = { minScore = 3973, wingScore = 3996 },
    MASTER      = { minScore = 3813, wingScore = 3893 },
    DIAMOND     = { minScore = 3676, wingScore = 3744 },
    EMERALD     = { minScore = 3493, wingScore = 3584 },
    PLATINUM    = { minScore = 3169, wingScore = 3309 },
    GOLD        = { minScore = 2764, wingScore = 2964 },
    SILVER      = { minScore = 1712, wingScore = 2475 },
    BRONZE      = { minScore =  441, wingScore =  1015 },
    IRON        = { minScore =    1, wingScore =  237 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4090,
    CHALLENGER  = { minScore = 3943, wingScore = 4009 },
    GRANDMASTER = { minScore = 3852, wingScore = 3894 },
    MASTER      = { minScore = 3703, wingScore = 3771 },
    DIAMOND     = { minScore = 3462, wingScore = 3554 },
    EMERALD     = { minScore = 3329, wingScore = 3406 },
    PLATINUM    = { minScore = 3044, wingScore = 3149 },
    GOLD        = { minScore = 2681, wingScore = 2868 },
    SILVER      = { minScore = 1419, wingScore = 2267 },
    BRONZE      = { minScore =  346, wingScore =  830 },
    IRON        = { minScore =    1, wingScore =  177 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4090,
    CHALLENGER  = { minScore = 3867, wingScore = 4009 },
    GRANDMASTER = { minScore = 3813, wingScore = 3840 },
    MASTER      = { minScore = 3628, wingScore = 3721 },
    DIAMOND     = { minScore = 3490, wingScore = 3559 },
    EMERALD     = { minScore = 3306, wingScore = 3398 },
    PLATINUM    = { minScore = 3041, wingScore = 3145 },
    GOLD        = { minScore = 2681, wingScore = 2857 },
    SILVER      = { minScore = 1419, wingScore = 2267 },
    BRONZE      = { minScore =  346, wingScore =  830 },
    IRON        = { minScore =    1, wingScore =  177 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4090,
    CHALLENGER  = { minScore = 3996, wingScore = 4009 },
    GRANDMASTER = { minScore = 3945, wingScore = 3971 },
    MASTER      = { minScore = 3769, wingScore = 3857 },
    DIAMOND     = { minScore = 3615, wingScore = 3692 },
    EMERALD     = { minScore = 3411, wingScore = 3513 },
    PLATINUM    = { minScore = 3110, wingScore = 3229 },
    GOLD        = { minScore = 2681, wingScore = 2908 },
    SILVER      = { minScore = 1419, wingScore = 2267 },
    BRONZE      = { minScore =  346, wingScore =  830 },
    IRON        = { minScore =    1, wingScore =  177 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4152,
    CHALLENGER  = { minScore = 3973, wingScore = 4021 },
    GRANDMASTER = { minScore = 3878, wingScore = 3913 },
    MASTER      = { minScore = 3746, wingScore = 3799 },
    DIAMOND     = { minScore = 3513, wingScore = 3604 },
    EMERALD     = { minScore = 3377, wingScore = 3437 },
    PLATINUM    = { minScore = 3081, wingScore = 3204 },
    GOLD        = { minScore = 2729, wingScore = 2933 },
    SILVER      = { minScore = 1590, wingScore = 2388 },
    BRONZE      = { minScore =  401, wingScore =  938 },
    IRON        = { minScore =    1, wingScore =  212 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4152,
    CHALLENGER  = { minScore = 3897, wingScore = 4021 },
    GRANDMASTER = { minScore = 3847, wingScore = 3872 },
    MASTER      = { minScore = 3677, wingScore = 3762 },
    DIAMOND     = { minScore = 3543, wingScore = 3610 },
    EMERALD     = { minScore = 3364, wingScore = 3453 },
    PLATINUM    = { minScore = 3088, wingScore = 3200 },
    GOLD        = { minScore = 2730, wingScore = 2900 },
    SILVER      = { minScore = 1593, wingScore = 2391 },
    BRONZE      = { minScore =  402, wingScore =  940 },
    IRON        = { minScore =    1, wingScore =  213 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4152,
    CHALLENGER  = { minScore = 4009, wingScore = 4020 },
    GRANDMASTER = { minScore = 3961, wingScore = 3985 },
    MASTER      = { minScore = 3794, wingScore = 3878 },
    DIAMOND     = { minScore = 3650, wingScore = 3722 },
    EMERALD     = { minScore = 3458, wingScore = 3554 },
    PLATINUM    = { minScore = 3144, wingScore = 3275 },
    GOLD        = { minScore = 2728, wingScore = 2940 },
    SILVER      = { minScore = 1586, wingScore = 2386 },
    BRONZE      = { minScore =  400, wingScore =  936 },
    IRON        = { minScore =    1, wingScore =  211 },
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
