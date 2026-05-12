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
    top100Score = 4025,
    CHALLENGER  = { minScore = 3886, wingScore = 3916 },
    GRANDMASTER = { minScore = 3789, wingScore = 3823 },
    MASTER      = { minScore = 3671, wingScore = 3724 },
    DIAMOND     = { minScore = 3461, wingScore = 3546 },
    EMERALD     = { minScore = 3330, wingScore = 3403 },
    PLATINUM    = { minScore = 3049, wingScore = 3167 },
    GOLD        = { minScore = 2709, wingScore = 2884 },
    SILVER      = { minScore = 1654, wingScore = 2399 },
    BRONZE      = { minScore =  413, wingScore =  990 },
    IRON        = { minScore =    1, wingScore =  230 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4025,
    CHALLENGER  = { minScore = 3813, wingScore = 3916 },
    GRANDMASTER = { minScore = 3770, wingScore = 3791 },
    MASTER      = { minScore = 3620, wingScore = 3695 },
    DIAMOND     = { minScore = 3491, wingScore = 3555 },
    EMERALD     = { minScore = 3319, wingScore = 3405 },
    PLATINUM    = { minScore = 3061, wingScore = 3164 },
    GOLD        = { minScore = 2709, wingScore = 2882 },
    SILVER      = { minScore = 1654, wingScore = 2399 },
    BRONZE      = { minScore =  413, wingScore =  990 },
    IRON        = { minScore =    1, wingScore =  230 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4025,
    CHALLENGER  = { minScore = 3906, wingScore = 3916 },
    GRANDMASTER = { minScore = 3864, wingScore = 3885 },
    MASTER      = { minScore = 3716, wingScore = 3790 },
    DIAMOND     = { minScore = 3582, wingScore = 3649 },
    EMERALD     = { minScore = 3403, wingScore = 3492 },
    PLATINUM    = { minScore = 3112, wingScore = 3233 },
    GOLD        = { minScore = 2709, wingScore = 2916 },
    SILVER      = { minScore = 1654, wingScore = 2399 },
    BRONZE      = { minScore =  413, wingScore =  990 },
    IRON        = { minScore =    1, wingScore =  230 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3964,
    CHALLENGER  = { minScore = 3841, wingScore = 3894 },
    GRANDMASTER = { minScore = 3753, wingScore = 3780 },
    MASTER      = { minScore = 3609, wingScore = 3663 },
    DIAMOND     = { minScore = 3405, wingScore = 3467 },
    EMERALD     = { minScore = 3239, wingScore = 3316 },
    PLATINUM    = { minScore = 3008, wingScore = 3083 },
    GOLD        = { minScore = 2647, wingScore = 2788 },
    SILVER      = { minScore = 1360, wingScore = 2198 },
    BRONZE      = { minScore =  340, wingScore =  799 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3964,
    CHALLENGER  = { minScore = 3768, wingScore = 3894 },
    GRANDMASTER = { minScore = 3717, wingScore = 3742 },
    MASTER      = { minScore = 3539, wingScore = 3628 },
    DIAMOND     = { minScore = 3405, wingScore = 3472 },
    EMERALD     = { minScore = 3225, wingScore = 3315 },
    PLATINUM    = { minScore = 2950, wingScore = 3062 },
    GOLD        = { minScore = 2647, wingScore = 2782 },
    SILVER      = { minScore = 1360, wingScore = 2198 },
    BRONZE      = { minScore =  340, wingScore =  799 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3964,
    CHALLENGER  = { minScore = 3892, wingScore = 3894 },
    GRANDMASTER = { minScore = 3841, wingScore = 3866 },
    MASTER      = { minScore = 3661, wingScore = 3751 },
    DIAMOND     = { minScore = 3514, wingScore = 3588 },
    EMERALD     = { minScore = 3318, wingScore = 3416 },
    PLATINUM    = { minScore = 3027, wingScore = 3143 },
    GOLD        = { minScore = 2647, wingScore = 2842 },
    SILVER      = { minScore = 1360, wingScore = 2198 },
    BRONZE      = { minScore =  340, wingScore =  799 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4025,
    CHALLENGER  = { minScore = 3867, wingScore = 3907 },
    GRANDMASTER = { minScore = 3774, wingScore = 3805 },
    MASTER      = { minScore = 3645, wingScore = 3699 },
    DIAMOND     = { minScore = 3438, wingScore = 3513 },
    EMERALD     = { minScore = 3292, wingScore = 3367 },
    PLATINUM    = { minScore = 3032, wingScore = 3132 },
    GOLD        = { minScore = 2683, wingScore = 2844 },
    SILVER      = { minScore = 1531, wingScore = 2315 },
    BRONZE      = { minScore =  382, wingScore =  910 },
    IRON        = { minScore =    1, wingScore =  205 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4025,
    CHALLENGER  = { minScore = 3795, wingScore = 3907 },
    GRANDMASTER = { minScore = 3748, wingScore = 3771 },
    MASTER      = { minScore = 3587, wingScore = 3668 },
    DIAMOND     = { minScore = 3456, wingScore = 3521 },
    EMERALD     = { minScore = 3281, wingScore = 3368 },
    PLATINUM    = { minScore = 3016, wingScore = 3123 },
    GOLD        = { minScore = 2684, wingScore = 2841 },
    SILVER      = { minScore = 1535, wingScore = 2317 },
    BRONZE      = { minScore =  383, wingScore =  912 },
    IRON        = { minScore =    1, wingScore =  206 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4025,
    CHALLENGER  = { minScore = 3900, wingScore = 3907 },
    GRANDMASTER = { minScore = 3854, wingScore = 3877 },
    MASTER      = { minScore = 3692, wingScore = 3773 },
    DIAMOND     = { minScore = 3553, wingScore = 3623 },
    EMERALD     = { minScore = 3366, wingScore = 3459 },
    PLATINUM    = { minScore = 3075, wingScore = 3194 },
    GOLD        = { minScore = 2682, wingScore = 2884 },
    SILVER      = { minScore = 1528, wingScore = 2313 },
    BRONZE      = { minScore =  382, wingScore =  908 },
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
