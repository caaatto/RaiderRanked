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
    top100Score = 4264,
    CHALLENGER  = { minScore = 4114, wingScore = 4150 },
    GRANDMASTER = { minScore = 4012, wingScore = 4038 },
    MASTER      = { minScore = 3881, wingScore = 3922 },
    DIAMOND     = { minScore = 3631, wingScore = 3729 },
    EMERALD     = { minScore = 3459, wingScore = 3539 },
    PLATINUM    = { minScore = 3168, wingScore = 3323 },
    GOLD        = { minScore = 2828, wingScore = 3019 },
    SILVER      = { minScore = 1803, wingScore = 2551 },
    BRONZE      = { minScore =  483, wingScore =  1068 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4264,
    CHALLENGER  = { minScore = 4019, wingScore = 4150 },
    GRANDMASTER = { minScore = 3971, wingScore = 3995 },
    MASTER      = { minScore = 3806, wingScore = 3889 },
    DIAMOND     = { minScore = 3672, wingScore = 3739 },
    EMERALD     = { minScore = 3492, wingScore = 3582 },
    PLATINUM    = { minScore = 3170, wingScore = 3310 },
    GOLD        = { minScore = 2828, wingScore = 2971 },
    SILVER      = { minScore = 1803, wingScore = 2551 },
    BRONZE      = { minScore =  483, wingScore =  1068 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4264,
    CHALLENGER  = { minScore = 4141, wingScore = 4150 },
    GRANDMASTER = { minScore = 4093, wingScore = 4117 },
    MASTER      = { minScore = 3922, wingScore = 4007 },
    DIAMOND     = { minScore = 3764, wingScore = 3843 },
    EMERALD     = { minScore = 3552, wingScore = 3658 },
    PLATINUM    = { minScore = 3216, wingScore = 3354 },
    GOLD        = { minScore = 2828, wingScore = 3020 },
    SILVER      = { minScore = 1803, wingScore = 2551 },
    BRONZE      = { minScore =  483, wingScore =  1068 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4225,
    CHALLENGER  = { minScore = 4066, wingScore = 4132 },
    GRANDMASTER = { minScore = 3963, wingScore = 4011 },
    MASTER      = { minScore = 3819, wingScore = 3888 },
    DIAMOND     = { minScore = 3546, wingScore = 3657 },
    EMERALD     = { minScore = 3410, wingScore = 3450 },
    PLATINUM    = { minScore = 3087, wingScore = 3221 },
    GOLD        = { minScore = 2730, wingScore = 2955 },
    SILVER      = { minScore = 1495, wingScore = 2339 },
    BRONZE      = { minScore =  360, wingScore =  866 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4225,
    CHALLENGER  = { minScore = 3967, wingScore = 4132 },
    GRANDMASTER = { minScore = 3915, wingScore = 3941 },
    MASTER      = { minScore = 3733, wingScore = 3824 },
    DIAMOND     = { minScore = 3588, wingScore = 3661 },
    EMERALD     = { minScore = 3396, wingScore = 3492 },
    PLATINUM    = { minScore = 3108, wingScore = 3223 },
    GOLD        = { minScore = 2730, wingScore = 2910 },
    SILVER      = { minScore = 1495, wingScore = 2339 },
    BRONZE      = { minScore =  360, wingScore =  866 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4225,
    CHALLENGER  = { minScore = 4128, wingScore = 4132 },
    GRANDMASTER = { minScore = 4075, wingScore = 4102 },
    MASTER      = { minScore = 3888, wingScore = 3982 },
    DIAMOND     = { minScore = 3727, wingScore = 3808 },
    EMERALD     = { minScore = 3512, wingScore = 3620 },
    PLATINUM    = { minScore = 3163, wingScore = 3308 },
    GOLD        = { minScore = 2730, wingScore = 2948 },
    SILVER      = { minScore = 1495, wingScore = 2339 },
    BRONZE      = { minScore =  360, wingScore =  866 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4264,
    CHALLENGER  = { minScore = 4094, wingScore = 4142 },
    GRANDMASTER = { minScore = 3991, wingScore = 4027 },
    MASTER      = { minScore = 3855, wingScore = 3908 },
    DIAMOND     = { minScore = 3595, wingScore = 3699 },
    EMERALD     = { minScore = 3438, wingScore = 3502 },
    PLATINUM    = { minScore = 3134, wingScore = 3280 },
    GOLD        = { minScore = 2787, wingScore = 2992 },
    SILVER      = { minScore = 1674, wingScore = 2462 },
    BRONZE      = { minScore =  431, wingScore =  983 },
    IRON        = { minScore =    1, wingScore =  220 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4264,
    CHALLENGER  = { minScore = 3998, wingScore = 4143 },
    GRANDMASTER = { minScore = 3948, wingScore = 3973 },
    MASTER      = { minScore = 3776, wingScore = 3862 },
    DIAMOND     = { minScore = 3638, wingScore = 3707 },
    EMERALD     = { minScore = 3453, wingScore = 3545 },
    PLATINUM    = { minScore = 3145, wingScore = 3274 },
    GOLD        = { minScore = 2788, wingScore = 2946 },
    SILVER      = { minScore = 1677, wingScore = 2464 },
    BRONZE      = { minScore =  433, wingScore =  985 },
    IRON        = { minScore =    1, wingScore =  220 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4264,
    CHALLENGER  = { minScore = 4135, wingScore = 4142 },
    GRANDMASTER = { minScore = 4085, wingScore = 4111 },
    MASTER      = { minScore = 3907, wingScore = 3996 },
    DIAMOND     = { minScore = 3748, wingScore = 3828 },
    EMERALD     = { minScore = 3535, wingScore = 3642 },
    PLATINUM    = { minScore = 3193, wingScore = 3334 },
    GOLD        = { minScore = 2786, wingScore = 2989 },
    SILVER      = { minScore = 1670, wingScore = 2460 },
    BRONZE      = { minScore =  430, wingScore =  981 },
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
