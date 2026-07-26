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
    top100Score = 4335,
    CHALLENGER  = { minScore = 4180, wingScore = 4238 },
    GRANDMASTER = { minScore = 4053, wingScore = 4104 },
    MASTER      = { minScore = 3932, wingScore = 3995 },
    DIAMOND     = { minScore = 3655, wingScore = 3766 },
    EMERALD     = { minScore = 3467, wingScore = 3548 },
    PLATINUM    = { minScore = 3170, wingScore = 3333 },
    GOLD        = { minScore = 2825, wingScore = 3019 },
    SILVER      = { minScore = 1746, wingScore = 2531 },
    BRONZE      = { minScore =  439, wingScore =  1024 },
    IRON        = { minScore =    1, wingScore =  237 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4335,
    CHALLENGER  = { minScore = 4073, wingScore = 4238 },
    GRANDMASTER = { minScore = 4027, wingScore = 4050 },
    MASTER      = { minScore = 3867, wingScore = 3947 },
    DIAMOND     = { minScore = 3714, wingScore = 3790 },
    EMERALD     = { minScore = 3509, wingScore = 3611 },
    PLATINUM    = { minScore = 3172, wingScore = 3313 },
    GOLD        = { minScore = 2825, wingScore = 2969 },
    SILVER      = { minScore = 1746, wingScore = 2531 },
    BRONZE      = { minScore =  439, wingScore =  1024 },
    IRON        = { minScore =    1, wingScore =  237 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4335,
    CHALLENGER  = { minScore = 4227, wingScore = 4238 },
    GRANDMASTER = { minScore = 4175, wingScore = 4201 },
    MASTER      = { minScore = 3990, wingScore = 4083 },
    DIAMOND     = { minScore = 3811, wingScore = 3901 },
    EMERALD     = { minScore = 3572, wingScore = 3692 },
    PLATINUM    = { minScore = 3217, wingScore = 3359 },
    GOLD        = { minScore = 2825, wingScore = 3018 },
    SILVER      = { minScore = 1746, wingScore = 2531 },
    BRONZE      = { minScore =  439, wingScore =  1024 },
    IRON        = { minScore =    1, wingScore =  237 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4287,
    CHALLENGER  = { minScore = 4151, wingScore = 4207 },
    GRANDMASTER = { minScore = 4019, wingScore = 4061 },
    MASTER      = { minScore = 3894, wingScore = 3944 },
    DIAMOND     = { minScore = 3561, wingScore = 3684 },
    EMERALD     = { minScore = 3416, wingScore = 3458 },
    PLATINUM    = { minScore = 3087, wingScore = 3229 },
    GOLD        = { minScore = 2726, wingScore = 2956 },
    SILVER      = { minScore = 1442, wingScore = 2315 },
    BRONZE      = { minScore =  348, wingScore =  834 },
    IRON        = { minScore =    1, wingScore =  180 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4287,
    CHALLENGER  = { minScore = 4020, wingScore = 4207 },
    GRANDMASTER = { minScore = 3967, wingScore = 3994 },
    MASTER      = { minScore = 3782, wingScore = 3875 },
    DIAMOND     = { minScore = 3626, wingScore = 3704 },
    EMERALD     = { minScore = 3417, wingScore = 3522 },
    PLATINUM    = { minScore = 3113, wingScore = 3233 },
    GOLD        = { minScore = 2726, wingScore = 2909 },
    SILVER      = { minScore = 1442, wingScore = 2315 },
    BRONZE      = { minScore =  348, wingScore =  834 },
    IRON        = { minScore =    1, wingScore =  180 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4287,
    CHALLENGER  = { minScore = 4198, wingScore = 4207 },
    GRANDMASTER = { minScore = 4141, wingScore = 4169 },
    MASTER      = { minScore = 3942, wingScore = 4041 },
    DIAMOND     = { minScore = 3764, wingScore = 3853 },
    EMERALD     = { minScore = 3528, wingScore = 3646 },
    PLATINUM    = { minScore = 3165, wingScore = 3312 },
    GOLD        = { minScore = 2726, wingScore = 2946 },
    SILVER      = { minScore = 1442, wingScore = 2315 },
    BRONZE      = { minScore =  348, wingScore =  834 },
    IRON        = { minScore =    1, wingScore =  180 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4335,
    CHALLENGER  = { minScore = 4168, wingScore = 4225 },
    GRANDMASTER = { minScore = 4039, wingScore = 4086 },
    MASTER      = { minScore = 3916, wingScore = 3974 },
    DIAMOND     = { minScore = 3615, wingScore = 3732 },
    EMERALD     = { minScore = 3446, wingScore = 3510 },
    PLATINUM    = { minScore = 3135, wingScore = 3289 },
    GOLD        = { minScore = 2783, wingScore = 2992 },
    SILVER      = { minScore = 1618, wingScore = 2440 },
    BRONZE      = { minScore =  401, wingScore =  944 },
    IRON        = { minScore =    1, wingScore =  213 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4335,
    CHALLENGER  = { minScore = 4051, wingScore = 4225 },
    GRANDMASTER = { minScore = 4002, wingScore = 4027 },
    MASTER      = { minScore = 3832, wingScore = 3917 },
    DIAMOND     = { minScore = 3678, wingScore = 3755 },
    EMERALD     = { minScore = 3471, wingScore = 3575 },
    PLATINUM    = { minScore = 3148, wingScore = 3280 },
    GOLD        = { minScore = 2784, wingScore = 2944 },
    SILVER      = { minScore = 1621, wingScore = 2442 },
    BRONZE      = { minScore =  402, wingScore =  946 },
    IRON        = { minScore =    1, wingScore =  214 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4335,
    CHALLENGER  = { minScore = 4214, wingScore = 4225 },
    GRANDMASTER = { minScore = 4160, wingScore = 4187 },
    MASTER      = { minScore = 3969, wingScore = 4065 },
    DIAMOND     = { minScore = 3791, wingScore = 3880 },
    EMERALD     = { minScore = 3553, wingScore = 3672 },
    PLATINUM    = { minScore = 3195, wingScore = 3339 },
    GOLD        = { minScore = 2782, wingScore = 2987 },
    SILVER      = { minScore = 1615, wingScore = 2438 },
    BRONZE      = { minScore =  400, wingScore =  942 },
    IRON        = { minScore =    1, wingScore =  212 },
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
