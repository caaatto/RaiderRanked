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
    top100Score = 4092,
    CHALLENGER  = { minScore = 3926, wingScore = 3982 },
    GRANDMASTER = { minScore = 3849, wingScore = 3889 },
    MASTER      = { minScore = 3724, wingScore = 3776 },
    DIAMOND     = { minScore = 3511, wingScore = 3587 },
    EMERALD     = { minScore = 3377, wingScore = 3430 },
    PLATINUM    = { minScore = 3080, wingScore = 3209 },
    GOLD        = { minScore = 2738, wingScore = 2937 },
    SILVER      = { minScore = 1672, wingScore = 2435 },
    BRONZE      = { minScore =  419, wingScore =  996 },
    IRON        = { minScore =    1, wingScore =  230 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4092,
    CHALLENGER  = { minScore = 3880, wingScore = 3982 },
    GRANDMASTER = { minScore = 3832, wingScore = 3856 },
    MASTER      = { minScore = 3664, wingScore = 3748 },
    DIAMOND     = { minScore = 3536, wingScore = 3600 },
    EMERALD     = { minScore = 3364, wingScore = 3450 },
    PLATINUM    = { minScore = 3098, wingScore = 3206 },
    GOLD        = { minScore = 2738, wingScore = 2912 },
    SILVER      = { minScore = 1672, wingScore = 2435 },
    BRONZE      = { minScore =  419, wingScore =  996 },
    IRON        = { minScore =    1, wingScore =  230 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4092,
    CHALLENGER  = { minScore = 3968, wingScore = 3982 },
    GRANDMASTER = { minScore = 3925, wingScore = 3947 },
    MASTER      = { minScore = 3774, wingScore = 3849 },
    DIAMOND     = { minScore = 3634, wingScore = 3704 },
    EMERALD     = { minScore = 3447, wingScore = 3540 },
    PLATINUM    = { minScore = 3139, wingScore = 3268 },
    GOLD        = { minScore = 2738, wingScore = 2941 },
    SILVER      = { minScore = 1672, wingScore = 2435 },
    BRONZE      = { minScore =  419, wingScore =  996 },
    IRON        = { minScore =    1, wingScore =  230 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4022,
    CHALLENGER  = { minScore = 3896, wingScore = 3936 },
    GRANDMASTER = { minScore = 3791, wingScore = 3835 },
    MASTER      = { minScore = 3659, wingScore = 3710 },
    DIAMOND     = { minScore = 3430, wingScore = 3514 },
    EMERALD     = { minScore = 3287, wingScore = 3360 },
    PLATINUM    = { minScore = 3026, wingScore = 3116 },
    GOLD        = { minScore = 2665, wingScore = 2830 },
    SILVER      = { minScore = 1382, wingScore = 2231 },
    BRONZE      = { minScore =  340, wingScore =  809 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4022,
    CHALLENGER  = { minScore = 3801, wingScore = 3936 },
    GRANDMASTER = { minScore = 3751, wingScore = 3776 },
    MASTER      = { minScore = 3574, wingScore = 3662 },
    DIAMOND     = { minScore = 3442, wingScore = 3508 },
    EMERALD     = { minScore = 3266, wingScore = 3354 },
    PLATINUM    = { minScore = 2998, wingScore = 3106 },
    GOLD        = { minScore = 2665, wingScore = 2821 },
    SILVER      = { minScore = 1382, wingScore = 2231 },
    BRONZE      = { minScore =  340, wingScore =  809 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4022,
    CHALLENGER  = { minScore = 3924, wingScore = 3936 },
    GRANDMASTER = { minScore = 3875, wingScore = 3899 },
    MASTER      = { minScore = 3706, wingScore = 3791 },
    DIAMOND     = { minScore = 3559, wingScore = 3633 },
    EMERALD     = { minScore = 3362, wingScore = 3461 },
    PLATINUM    = { minScore = 3080, wingScore = 3191 },
    GOLD        = { minScore = 2665, wingScore = 2886 },
    SILVER      = { minScore = 1382, wingScore = 2231 },
    BRONZE      = { minScore =  340, wingScore =  809 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4092,
    CHALLENGER  = { minScore = 3913, wingScore = 3963 },
    GRANDMASTER = { minScore = 3825, wingScore = 3866 },
    MASTER      = { minScore = 3697, wingScore = 3748 },
    DIAMOND     = { minScore = 3477, wingScore = 3557 },
    EMERALD     = { minScore = 3339, wingScore = 3401 },
    PLATINUM    = { minScore = 3057, wingScore = 3170 },
    GOLD        = { minScore = 2708, wingScore = 2892 },
    SILVER      = { minScore = 1551, wingScore = 2350 },
    BRONZE      = { minScore =  386, wingScore =  918 },
    IRON        = { minScore =    1, wingScore =  205 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4092,
    CHALLENGER  = { minScore = 3848, wingScore = 3963 },
    GRANDMASTER = { minScore = 3799, wingScore = 3824 },
    MASTER      = { minScore = 3628, wingScore = 3713 },
    DIAMOND     = { minScore = 3498, wingScore = 3563 },
    EMERALD     = { minScore = 3324, wingScore = 3411 },
    PLATINUM    = { minScore = 3057, wingScore = 3165 },
    GOLD        = { minScore = 2708, wingScore = 2875 },
    SILVER      = { minScore = 1554, wingScore = 2352 },
    BRONZE      = { minScore =  387, wingScore =  920 },
    IRON        = { minScore =    1, wingScore =  206 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4092,
    CHALLENGER  = { minScore = 3949, wingScore = 3962 },
    GRANDMASTER = { minScore = 3904, wingScore = 3926 },
    MASTER      = { minScore = 3745, wingScore = 3824 },
    DIAMOND     = { minScore = 3602, wingScore = 3674 },
    EMERALD     = { minScore = 3411, wingScore = 3506 },
    PLATINUM    = { minScore = 3114, wingScore = 3235 },
    GOLD        = { minScore = 2707, wingScore = 2917 },
    SILVER      = { minScore = 1548, wingScore = 2348 },
    BRONZE      = { minScore =  385, wingScore =  916 },
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
