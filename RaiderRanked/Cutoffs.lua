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
    top100Score = 4225,
    CHALLENGER  = { minScore = 4054, wingScore = 4112 },
    GRANDMASTER = { minScore = 3969, wingScore = 4010 },
    MASTER      = { minScore = 3835, wingScore = 3893 },
    DIAMOND     = { minScore = 3599, wingScore = 3692 },
    EMERALD     = { minScore = 3442, wingScore = 3513 },
    PLATINUM    = { minScore = 3149, wingScore = 3301 },
    GOLD        = { minScore = 2808, wingScore = 3011 },
    SILVER      = { minScore = 1784, wingScore = 2532 },
    BRONZE      = { minScore =  485, wingScore =  1060 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4225,
    CHALLENGER  = { minScore = 3994, wingScore = 4112 },
    GRANDMASTER = { minScore = 3946, wingScore = 3970 },
    MASTER      = { minScore = 3777, wingScore = 3861 },
    DIAMOND     = { minScore = 3643, wingScore = 3710 },
    EMERALD     = { minScore = 3463, wingScore = 3553 },
    PLATINUM    = { minScore = 3153, wingScore = 3285 },
    GOLD        = { minScore = 2808, wingScore = 2958 },
    SILVER      = { minScore = 1784, wingScore = 2532 },
    BRONZE      = { minScore =  485, wingScore =  1060 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4225,
    CHALLENGER  = { minScore = 4101, wingScore = 4112 },
    GRANDMASTER = { minScore = 4054, wingScore = 4078 },
    MASTER      = { minScore = 3892, wingScore = 3973 },
    DIAMOND     = { minScore = 3739, wingScore = 3815 },
    EMERALD     = { minScore = 3534, wingScore = 3636 },
    PLATINUM    = { minScore = 3201, wingScore = 3340 },
    GOLD        = { minScore = 2808, wingScore = 3003 },
    SILVER      = { minScore = 1784, wingScore = 2532 },
    BRONZE      = { minScore =  485, wingScore =  1060 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4170,
    CHALLENGER  = { minScore = 4018, wingScore = 4071 },
    GRANDMASTER = { minScore = 3914, wingScore = 3958 },
    MASTER      = { minScore = 3777, wingScore = 3833 },
    DIAMOND     = { minScore = 3519, wingScore = 3618 },
    EMERALD     = { minScore = 3401, wingScore = 3434 },
    PLATINUM    = { minScore = 3074, wingScore = 3200 },
    GOLD        = { minScore = 2714, wingScore = 2928 },
    SILVER      = { minScore = 1480, wingScore = 2322 },
    BRONZE      = { minScore =  360, wingScore =  861 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4170,
    CHALLENGER  = { minScore = 3922, wingScore = 4071 },
    GRANDMASTER = { minScore = 3870, wingScore = 3896 },
    MASTER      = { minScore = 3687, wingScore = 3779 },
    DIAMOND     = { minScore = 3548, wingScore = 3618 },
    EMERALD     = { minScore = 3363, wingScore = 3455 },
    PLATINUM    = { minScore = 3093, wingScore = 3199 },
    GOLD        = { minScore = 2714, wingScore = 2900 },
    SILVER      = { minScore = 1480, wingScore = 2322 },
    BRONZE      = { minScore =  360, wingScore =  861 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4170,
    CHALLENGER  = { minScore = 4059, wingScore = 4071 },
    GRANDMASTER = { minScore = 4009, wingScore = 4034 },
    MASTER      = { minScore = 3833, wingScore = 3921 },
    DIAMOND     = { minScore = 3681, wingScore = 3757 },
    EMERALD     = { minScore = 3477, wingScore = 3579 },
    PLATINUM    = { minScore = 3147, wingScore = 3284 },
    GOLD        = { minScore = 2714, wingScore = 2936 },
    SILVER      = { minScore = 1480, wingScore = 2322 },
    BRONZE      = { minScore =  360, wingScore =  861 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4225,
    CHALLENGER  = { minScore = 4039, wingScore = 4095 },
    GRANDMASTER = { minScore = 3946, wingScore = 3988 },
    MASTER      = { minScore = 3811, wingScore = 3868 },
    DIAMOND     = { minScore = 3566, wingScore = 3661 },
    EMERALD     = { minScore = 3425, wingScore = 3480 },
    PLATINUM    = { minScore = 3118, wingScore = 3259 },
    GOLD        = { minScore = 2769, wingScore = 2976 },
    SILVER      = { minScore = 1657, wingScore = 2444 },
    BRONZE      = { minScore =  433, wingScore =  977 },
    IRON        = { minScore =    1, wingScore =  220 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4225,
    CHALLENGER  = { minScore = 3965, wingScore = 4095 },
    GRANDMASTER = { minScore = 3915, wingScore = 3940 },
    MASTER      = { minScore = 3740, wingScore = 3828 },
    DIAMOND     = { minScore = 3604, wingScore = 3673 },
    EMERALD     = { minScore = 3422, wingScore = 3513 },
    PLATINUM    = { minScore = 3129, wingScore = 3250 },
    GOLD        = { minScore = 2770, wingScore = 2934 },
    SILVER      = { minScore = 1660, wingScore = 2447 },
    BRONZE      = { minScore =  434, wingScore =  979 },
    IRON        = { minScore =    1, wingScore =  221 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4225,
    CHALLENGER  = { minScore = 4083, wingScore = 4094 },
    GRANDMASTER = { minScore = 4035, wingScore = 4059 },
    MASTER      = { minScore = 3867, wingScore = 3951 },
    DIAMOND     = { minScore = 3714, wingScore = 3790 },
    EMERALD     = { minScore = 3510, wingScore = 3612 },
    PLATINUM    = { minScore = 3178, wingScore = 3316 },
    GOLD        = { minScore = 2768, wingScore = 2974 },
    SILVER      = { minScore = 1653, wingScore = 2442 },
    BRONZE      = { minScore =  431, wingScore =  975 },
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
