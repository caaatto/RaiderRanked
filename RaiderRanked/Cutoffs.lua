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
    top100Score = 4178,
    CHALLENGER  = { minScore = 4015, wingScore = 4059 },
    GRANDMASTER = { minScore = 3923, wingScore = 3965 },
    MASTER      = { minScore = 3796, wingScore = 3852 },
    DIAMOND     = { minScore = 3568, wingScore = 3662 },
    EMERALD     = { minScore = 3425, wingScore = 3481 },
    PLATINUM    = { minScore = 3125, wingScore = 3267 },
    GOLD        = { minScore = 2784, wingScore = 3001 },
    SILVER      = { minScore = 1748, wingScore = 2504 },
    BRONZE      = { minScore =  475, wingScore =  1039 },
    IRON        = { minScore =    1, wingScore =  244 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4178,
    CHALLENGER  = { minScore = 3951, wingScore = 4059 },
    GRANDMASTER = { minScore = 3905, wingScore = 3928 },
    MASTER      = { minScore = 3745, wingScore = 3825 },
    DIAMOND     = { minScore = 3609, wingScore = 3677 },
    EMERALD     = { minScore = 3429, wingScore = 3519 },
    PLATINUM    = { minScore = 3133, wingScore = 3257 },
    GOLD        = { minScore = 2784, wingScore = 2942 },
    SILVER      = { minScore = 1748, wingScore = 2504 },
    BRONZE      = { minScore =  475, wingScore =  1039 },
    IRON        = { minScore =    1, wingScore =  244 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4178,
    CHALLENGER  = { minScore = 4048, wingScore = 4059 },
    GRANDMASTER = { minScore = 4004, wingScore = 4026 },
    MASTER      = { minScore = 3848, wingScore = 3926 },
    DIAMOND     = { minScore = 3704, wingScore = 3776 },
    EMERALD     = { minScore = 3511, wingScore = 3607 },
    PLATINUM    = { minScore = 3183, wingScore = 3322 },
    GOLD        = { minScore = 2784, wingScore = 2982 },
    SILVER      = { minScore = 1748, wingScore = 2504 },
    BRONZE      = { minScore =  475, wingScore =  1039 },
    IRON        = { minScore =    1, wingScore =  244 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4130,
    CHALLENGER  = { minScore = 3985, wingScore = 4026 },
    GRANDMASTER = { minScore = 3891, wingScore = 3914 },
    MASTER      = { minScore = 3737, wingScore = 3791 },
    DIAMOND     = { minScore = 3486, wingScore = 3578 },
    EMERALD     = { minScore = 3358, wingScore = 3418 },
    PLATINUM    = { minScore = 3057, wingScore = 3172 },
    GOLD        = { minScore = 2695, wingScore = 2893 },
    SILVER      = { minScore = 1450, wingScore = 2294 },
    BRONZE      = { minScore =  358, wingScore =  847 },
    IRON        = { minScore =    1, wingScore =  184 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4130,
    CHALLENGER  = { minScore = 3896, wingScore = 4026 },
    GRANDMASTER = { minScore = 3843, wingScore = 3869 },
    MASTER      = { minScore = 3659, wingScore = 3751 },
    DIAMOND     = { minScore = 3518, wingScore = 3588 },
    EMERALD     = { minScore = 3331, wingScore = 3425 },
    PLATINUM    = { minScore = 3067, wingScore = 3170 },
    GOLD        = { minScore = 2695, wingScore = 2880 },
    SILVER      = { minScore = 1450, wingScore = 2294 },
    BRONZE      = { minScore =  358, wingScore =  847 },
    IRON        = { minScore =    1, wingScore =  184 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4130,
    CHALLENGER  = { minScore = 4018, wingScore = 4026 },
    GRANDMASTER = { minScore = 3968, wingScore = 3993 },
    MASTER      = { minScore = 3790, wingScore = 3879 },
    DIAMOND     = { minScore = 3638, wingScore = 3714 },
    EMERALD     = { minScore = 3436, wingScore = 3537 },
    PLATINUM    = { minScore = 3125, wingScore = 3251 },
    GOLD        = { minScore = 2695, wingScore = 2920 },
    SILVER      = { minScore = 1450, wingScore = 2294 },
    BRONZE      = { minScore =  358, wingScore =  847 },
    IRON        = { minScore =    1, wingScore =  184 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4178,
    CHALLENGER  = { minScore = 4002, wingScore = 4045 },
    GRANDMASTER = { minScore = 3910, wingScore = 3944 },
    MASTER      = { minScore = 3771, wingScore = 3826 },
    DIAMOND     = { minScore = 3534, wingScore = 3627 },
    EMERALD     = { minScore = 3397, wingScore = 3455 },
    PLATINUM    = { minScore = 3097, wingScore = 3227 },
    GOLD        = { minScore = 2747, wingScore = 2956 },
    SILVER      = { minScore = 1623, wingScore = 2416 },
    BRONZE      = { minScore =  426, wingScore =  959 },
    IRON        = { minScore =    1, wingScore =  219 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4178,
    CHALLENGER  = { minScore = 3929, wingScore = 4046 },
    GRANDMASTER = { minScore = 3880, wingScore = 3904 },
    MASTER      = { minScore = 3710, wingScore = 3795 },
    DIAMOND     = { minScore = 3572, wingScore = 3641 },
    EMERALD     = { minScore = 3389, wingScore = 3481 },
    PLATINUM    = { minScore = 3106, wingScore = 3222 },
    GOLD        = { minScore = 2748, wingScore = 2917 },
    SILVER      = { minScore = 1627, wingScore = 2419 },
    BRONZE      = { minScore =  427, wingScore =  961 },
    IRON        = { minScore =    1, wingScore =  220 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4178,
    CHALLENGER  = { minScore = 4035, wingScore = 4045 },
    GRANDMASTER = { minScore = 3989, wingScore = 4012 },
    MASTER      = { minScore = 3823, wingScore = 3906 },
    DIAMOND     = { minScore = 3676, wingScore = 3749 },
    EMERALD     = { minScore = 3479, wingScore = 3577 },
    PLATINUM    = { minScore = 3158, wingScore = 3291 },
    GOLD        = { minScore = 2746, wingScore = 2955 },
    SILVER      = { minScore = 1620, wingScore = 2414 },
    BRONZE      = { minScore =  425, wingScore =  957 },
    IRON        = { minScore =    1, wingScore =  218 },
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
