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
    top100Score = 4179,
    CHALLENGER  = { minScore = 4017, wingScore = 4064 },
    GRANDMASTER = { minScore = 3926, wingScore = 3968 },
    MASTER      = { minScore = 3800, wingScore = 3857 },
    DIAMOND     = { minScore = 3571, wingScore = 3665 },
    EMERALD     = { minScore = 3427, wingScore = 3484 },
    PLATINUM    = { minScore = 3127, wingScore = 3270 },
    GOLD        = { minScore = 2787, wingScore = 3002 },
    SILVER      = { minScore = 1752, wingScore = 2506 },
    BRONZE      = { minScore =  481, wingScore =  1042 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4179,
    CHALLENGER  = { minScore = 3954, wingScore = 4064 },
    GRANDMASTER = { minScore = 3908, wingScore = 3931 },
    MASTER      = { minScore = 3748, wingScore = 3828 },
    DIAMOND     = { minScore = 3612, wingScore = 3680 },
    EMERALD     = { minScore = 3432, wingScore = 3522 },
    PLATINUM    = { minScore = 3135, wingScore = 3259 },
    GOLD        = { minScore = 2787, wingScore = 2943 },
    SILVER      = { minScore = 1752, wingScore = 2506 },
    BRONZE      = { minScore =  481, wingScore =  1042 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4179,
    CHALLENGER  = { minScore = 4052, wingScore = 4064 },
    GRANDMASTER = { minScore = 4007, wingScore = 4030 },
    MASTER      = { minScore = 3851, wingScore = 3929 },
    DIAMOND     = { minScore = 3706, wingScore = 3779 },
    EMERALD     = { minScore = 3513, wingScore = 3610 },
    PLATINUM    = { minScore = 3185, wingScore = 3324 },
    GOLD        = { minScore = 2787, wingScore = 2983 },
    SILVER      = { minScore = 1752, wingScore = 2506 },
    BRONZE      = { minScore =  481, wingScore =  1042 },
    IRON        = { minScore =    1, wingScore =  245 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4135,
    CHALLENGER  = { minScore = 3991, wingScore = 4028 },
    GRANDMASTER = { minScore = 3892, wingScore = 3919 },
    MASTER      = { minScore = 3743, wingScore = 3793 },
    DIAMOND     = { minScore = 3489, wingScore = 3582 },
    EMERALD     = { minScore = 3362, wingScore = 3420 },
    PLATINUM    = { minScore = 3058, wingScore = 3174 },
    GOLD        = { minScore = 2697, wingScore = 2896 },
    SILVER      = { minScore = 1454, wingScore = 2297 },
    BRONZE      = { minScore =  360, wingScore =  850 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4135,
    CHALLENGER  = { minScore = 3896, wingScore = 4028 },
    GRANDMASTER = { minScore = 3844, wingScore = 3870 },
    MASTER      = { minScore = 3660, wingScore = 3752 },
    DIAMOND     = { minScore = 3520, wingScore = 3590 },
    EMERALD     = { minScore = 3334, wingScore = 3427 },
    PLATINUM    = { minScore = 3070, wingScore = 3173 },
    GOLD        = { minScore = 2697, wingScore = 2882 },
    SILVER      = { minScore = 1454, wingScore = 2297 },
    BRONZE      = { minScore =  360, wingScore =  850 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4135,
    CHALLENGER  = { minScore = 4021, wingScore = 4028 },
    GRANDMASTER = { minScore = 3970, wingScore = 3995 },
    MASTER      = { minScore = 3793, wingScore = 3881 },
    DIAMOND     = { minScore = 3641, wingScore = 3717 },
    EMERALD     = { minScore = 3439, wingScore = 3540 },
    PLATINUM    = { minScore = 3127, wingScore = 3254 },
    GOLD        = { minScore = 2697, wingScore = 2921 },
    SILVER      = { minScore = 1454, wingScore = 2297 },
    BRONZE      = { minScore =  360, wingScore =  850 },
    IRON        = { minScore =    1, wingScore =  185 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4179,
    CHALLENGER  = { minScore = 4006, wingScore = 4049 },
    GRANDMASTER = { minScore = 3912, wingScore = 3948 },
    MASTER      = { minScore = 3776, wingScore = 3830 },
    DIAMOND     = { minScore = 3537, wingScore = 3630 },
    EMERALD     = { minScore = 3400, wingScore = 3457 },
    PLATINUM    = { minScore = 3098, wingScore = 3230 },
    GOLD        = { minScore = 2749, wingScore = 2958 },
    SILVER      = { minScore = 1627, wingScore = 2419 },
    BRONZE      = { minScore =  430, wingScore =  962 },
    IRON        = { minScore =    1, wingScore =  220 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4179,
    CHALLENGER  = { minScore = 3930, wingScore = 4049 },
    GRANDMASTER = { minScore = 3882, wingScore = 3906 },
    MASTER      = { minScore = 3712, wingScore = 3797 },
    DIAMOND     = { minScore = 3575, wingScore = 3643 },
    EMERALD     = { minScore = 3392, wingScore = 3483 },
    PLATINUM    = { minScore = 3109, wingScore = 3224 },
    GOLD        = { minScore = 2750, wingScore = 2918 },
    SILVER      = { minScore = 1631, wingScore = 2421 },
    BRONZE      = { minScore =  432, wingScore =  964 },
    IRON        = { minScore =    1, wingScore =  221 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4179,
    CHALLENGER  = { minScore = 4039, wingScore = 4049 },
    GRANDMASTER = { minScore = 3991, wingScore = 4015 },
    MASTER      = { minScore = 3826, wingScore = 3908 },
    DIAMOND     = { minScore = 3678, wingScore = 3752 },
    EMERALD     = { minScore = 3481, wingScore = 3580 },
    PLATINUM    = { minScore = 3160, wingScore = 3294 },
    GOLD        = { minScore = 2748, wingScore = 2956 },
    SILVER      = { minScore = 1624, wingScore = 2416 },
    BRONZE      = { minScore =  429, wingScore =  959 },
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
