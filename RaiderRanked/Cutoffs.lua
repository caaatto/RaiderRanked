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
    top100Score = 3987,
    CHALLENGER  = { minScore = 3836, wingScore = 3890 },
    GRANDMASTER = { minScore = 3762, wingScore = 3783 },
    MASTER      = { minScore = 3632, wingScore = 3674 },
    DIAMOND     = { minScore = 3424, wingScore = 3501 },
    EMERALD     = { minScore = 3283, wingScore = 3345 },
    PLATINUM    = { minScore = 3020, wingScore = 3117 },
    GOLD        = { minScore = 2678, wingScore = 2827 },
    SILVER      = { minScore = 1584, wingScore = 2337 },
    BRONZE      = { minScore =  396, wingScore =  951 },
    IRON        = { minScore =    1, wingScore =  222 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3987,
    CHALLENGER  = { minScore = 3779, wingScore = 3890 },
    GRANDMASTER = { minScore = 3732, wingScore = 3755 },
    MASTER      = { minScore = 3569, wingScore = 3651 },
    DIAMOND     = { minScore = 3442, wingScore = 3506 },
    EMERALD     = { minScore = 3273, wingScore = 3358 },
    PLATINUM    = { minScore = 3002, wingScore = 3114 },
    GOLD        = { minScore = 2678, wingScore = 2829 },
    SILVER      = { minScore = 1584, wingScore = 2337 },
    BRONZE      = { minScore =  396, wingScore =  951 },
    IRON        = { minScore =    1, wingScore =  222 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3987,
    CHALLENGER  = { minScore = 3879, wingScore = 3890 },
    GRANDMASTER = { minScore = 3832, wingScore = 3855 },
    MASTER      = { minScore = 3671, wingScore = 3752 },
    DIAMOND     = { minScore = 3534, wingScore = 3603 },
    EMERALD     = { minScore = 3351, wingScore = 3443 },
    PLATINUM    = { minScore = 3068, wingScore = 3183 },
    GOLD        = { minScore = 2678, wingScore = 2878 },
    SILVER      = { minScore = 1584, wingScore = 2337 },
    BRONZE      = { minScore =  396, wingScore =  951 },
    IRON        = { minScore =    1, wingScore =  222 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3923,
    CHALLENGER  = { minScore = 3800, wingScore = 3865 },
    GRANDMASTER = { minScore = 3699, wingScore = 3745 },
    MASTER      = { minScore = 3559, wingScore = 3619 },
    DIAMOND     = { minScore = 3348, wingScore = 3427 },
    EMERALD     = { minScore = 3190, wingScore = 3261 },
    PLATINUM    = { minScore = 2961, wingScore = 3046 },
    GOLD        = { minScore = 2618, wingScore = 2743 },
    SILVER      = { minScore = 1316, wingScore = 2140 },
    BRONZE      = { minScore =  338, wingScore =  761 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3923,
    CHALLENGER  = { minScore = 3713, wingScore = 3865 },
    GRANDMASTER = { minScore = 3664, wingScore = 3688 },
    MASTER      = { minScore = 3490, wingScore = 3577 },
    DIAMOND     = { minScore = 3357, wingScore = 3423 },
    EMERALD     = { minScore = 3180, wingScore = 3268 },
    PLATINUM    = { minScore = 2899, wingScore = 3015 },
    GOLD        = { minScore = 2618, wingScore = 2733 },
    SILVER      = { minScore = 1316, wingScore = 2140 },
    BRONZE      = { minScore =  338, wingScore =  761 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3923,
    CHALLENGER  = { minScore = 3849, wingScore = 3865 },
    GRANDMASTER = { minScore = 3797, wingScore = 3823 },
    MASTER      = { minScore = 3615, wingScore = 3706 },
    DIAMOND     = { minScore = 3467, wingScore = 3541 },
    EMERALD     = { minScore = 3268, wingScore = 3367 },
    PLATINUM    = { minScore = 2968, wingScore = 3089 },
    GOLD        = { minScore = 2618, wingScore = 2791 },
    SILVER      = { minScore = 1316, wingScore = 2140 },
    BRONZE      = { minScore =  338, wingScore =  761 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3987,
    CHALLENGER  = { minScore = 3821, wingScore = 3880 },
    GRANDMASTER = { minScore = 3736, wingScore = 3767 },
    MASTER      = { minScore = 3601, wingScore = 3651 },
    DIAMOND     = { minScore = 3392, wingScore = 3470 },
    EMERALD     = { minScore = 3244, wingScore = 3310 },
    PLATINUM    = { minScore = 2995, wingScore = 3087 },
    GOLD        = { minScore = 2653, wingScore = 2792 },
    SILVER      = { minScore = 1472, wingScore = 2255 },
    BRONZE      = { minScore =  372, wingScore =  872 },
    IRON        = { minScore =    1, wingScore =  200 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3987,
    CHALLENGER  = { minScore = 3752, wingScore = 3880 },
    GRANDMASTER = { minScore = 3704, wingScore = 3728 },
    MASTER      = { minScore = 3537, wingScore = 3621 },
    DIAMOND     = { minScore = 3407, wingScore = 3472 },
    EMERALD     = { minScore = 3235, wingScore = 3321 },
    PLATINUM    = { minScore = 2960, wingScore = 3074 },
    GOLD        = { minScore = 2654, wingScore = 2790 },
    SILVER      = { minScore = 1475, wingScore = 2257 },
    BRONZE      = { minScore =  372, wingScore =  874 },
    IRON        = { minScore =    1, wingScore =  201 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3987,
    CHALLENGER  = { minScore = 3866, wingScore = 3879 },
    GRANDMASTER = { minScore = 3817, wingScore = 3841 },
    MASTER      = { minScore = 3647, wingScore = 3732 },
    DIAMOND     = { minScore = 3505, wingScore = 3576 },
    EMERALD     = { minScore = 3315, wingScore = 3410 },
    PLATINUM    = { minScore = 3025, wingScore = 3143 },
    GOLD        = { minScore = 2652, wingScore = 2841 },
    SILVER      = { minScore = 1469, wingScore = 2252 },
    BRONZE      = { minScore =  371, wingScore =  869 },
    IRON        = { minScore =    1, wingScore =  200 },
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
