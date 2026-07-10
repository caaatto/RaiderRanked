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
    top100Score = 4288,
    CHALLENGER  = { minScore = 4133, wingScore = 4179 },
    GRANDMASTER = { minScore = 4020, wingScore = 4059 },
    MASTER      = { minScore = 3896, wingScore = 3942 },
    DIAMOND     = { minScore = 3640, wingScore = 3742 },
    EMERALD     = { minScore = 3462, wingScore = 3542 },
    PLATINUM    = { minScore = 3168, wingScore = 3326 },
    GOLD        = { minScore = 2825, wingScore = 3018 },
    SILVER      = { minScore = 1772, wingScore = 2541 },
    BRONZE      = { minScore =  460, wingScore =  1042 },
    IRON        = { minScore =    1, wingScore =  241 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4288,
    CHALLENGER  = { minScore = 4033, wingScore = 4179 },
    GRANDMASTER = { minScore = 3986, wingScore = 4010 },
    MASTER      = { minScore = 3822, wingScore = 3904 },
    DIAMOND     = { minScore = 3683, wingScore = 3753 },
    EMERALD     = { minScore = 3497, wingScore = 3590 },
    PLATINUM    = { minScore = 3170, wingScore = 3311 },
    GOLD        = { minScore = 2825, wingScore = 2969 },
    SILVER      = { minScore = 1772, wingScore = 2541 },
    BRONZE      = { minScore =  460, wingScore =  1042 },
    IRON        = { minScore =    1, wingScore =  241 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4288,
    CHALLENGER  = { minScore = 4167, wingScore = 4179 },
    GRANDMASTER = { minScore = 4116, wingScore = 4141 },
    MASTER      = { minScore = 3940, wingScore = 4028 },
    DIAMOND     = { minScore = 3776, wingScore = 3858 },
    EMERALD     = { minScore = 3558, wingScore = 3667 },
    PLATINUM    = { minScore = 3216, wingScore = 3356 },
    GOLD        = { minScore = 2825, wingScore = 3018 },
    SILVER      = { minScore = 1772, wingScore = 2541 },
    BRONZE      = { minScore =  460, wingScore =  1042 },
    IRON        = { minScore =    1, wingScore =  241 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4248,
    CHALLENGER  = { minScore = 4102, wingScore = 4149 },
    GRANDMASTER = { minScore = 3986, wingScore = 4021 },
    MASTER      = { minScore = 3845, wingScore = 3899 },
    DIAMOND     = { minScore = 3551, wingScore = 3666 },
    EMERALD     = { minScore = 3412, wingScore = 3453 },
    PLATINUM    = { minScore = 3086, wingScore = 3223 },
    GOLD        = { minScore = 2727, wingScore = 2954 },
    SILVER      = { minScore = 1467, wingScore = 2327 },
    BRONZE      = { minScore =  353, wingScore =  847 },
    IRON        = { minScore =    1, wingScore =  183 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4248,
    CHALLENGER  = { minScore = 3992, wingScore = 4149 },
    GRANDMASTER = { minScore = 3938, wingScore = 3965 },
    MASTER      = { minScore = 3751, wingScore = 3845 },
    DIAMOND     = { minScore = 3602, wingScore = 3677 },
    EMERALD     = { minScore = 3403, wingScore = 3502 },
    PLATINUM    = { minScore = 3109, wingScore = 3226 },
    GOLD        = { minScore = 2727, wingScore = 2909 },
    SILVER      = { minScore = 1467, wingScore = 2327 },
    BRONZE      = { minScore =  353, wingScore =  847 },
    IRON        = { minScore =    1, wingScore =  183 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4248,
    CHALLENGER  = { minScore = 4140, wingScore = 4149 },
    GRANDMASTER = { minScore = 4087, wingScore = 4114 },
    MASTER      = { minScore = 3899, wingScore = 3993 },
    DIAMOND     = { minScore = 3735, wingScore = 3817 },
    EMERALD     = { minScore = 3516, wingScore = 3625 },
    PLATINUM    = { minScore = 3163, wingScore = 3309 },
    GOLD        = { minScore = 2727, wingScore = 2946 },
    SILVER      = { minScore = 1467, wingScore = 2327 },
    BRONZE      = { minScore =  353, wingScore =  847 },
    IRON        = { minScore =    1, wingScore =  183 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4288,
    CHALLENGER  = { minScore = 4120, wingScore = 4166 },
    GRANDMASTER = { minScore = 4006, wingScore = 4043 },
    MASTER      = { minScore = 3875, wingScore = 3924 },
    DIAMOND     = { minScore = 3603, wingScore = 3710 },
    EMERALD     = { minScore = 3441, wingScore = 3505 },
    PLATINUM    = { minScore = 3134, wingScore = 3283 },
    GOLD        = { minScore = 2784, wingScore = 2991 },
    SILVER      = { minScore = 1644, wingScore = 2451 },
    BRONZE      = { minScore =  415, wingScore =  960 },
    IRON        = { minScore =    1, wingScore =  217 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4288,
    CHALLENGER  = { minScore = 4016, wingScore = 4167 },
    GRANDMASTER = { minScore = 3966, wingScore = 3992 },
    MASTER      = { minScore = 3793, wingScore = 3880 },
    DIAMOND     = { minScore = 3650, wingScore = 3722 },
    EMERALD     = { minScore = 3459, wingScore = 3554 },
    PLATINUM    = { minScore = 3145, wingScore = 3276 },
    GOLD        = { minScore = 2785, wingScore = 2944 },
    SILVER      = { minScore = 1647, wingScore = 2453 },
    BRONZE      = { minScore =  416, wingScore =  962 },
    IRON        = { minScore =    1, wingScore =  217 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4288,
    CHALLENGER  = { minScore = 4155, wingScore = 4166 },
    GRANDMASTER = { minScore = 4103, wingScore = 4129 },
    MASTER      = { minScore = 3922, wingScore = 4013 },
    DIAMOND     = { minScore = 3758, wingScore = 3840 },
    EMERALD     = { minScore = 3540, wingScore = 3649 },
    PLATINUM    = { minScore = 3193, wingScore = 3336 },
    GOLD        = { minScore = 2783, wingScore = 2987 },
    SILVER      = { minScore = 1640, wingScore = 2449 },
    BRONZE      = { minScore =  414, wingScore =  958 },
    IRON        = { minScore =    1, wingScore =  216 },
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
