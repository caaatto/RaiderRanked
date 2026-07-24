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
    top100Score = 4331,
    CHALLENGER  = { minScore = 4176, wingScore = 4234 },
    GRANDMASTER = { minScore = 4047, wingScore = 4102 },
    MASTER      = { minScore = 3926, wingScore = 3987 },
    DIAMOND     = { minScore = 3654, wingScore = 3763 },
    EMERALD     = { minScore = 3467, wingScore = 3548 },
    PLATINUM    = { minScore = 3170, wingScore = 3332 },
    GOLD        = { minScore = 2825, wingScore = 3019 },
    SILVER      = { minScore = 1750, wingScore = 2533 },
    BRONZE      = { minScore =  440, wingScore =  1027 },
    IRON        = { minScore =    1, wingScore =  237 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4331,
    CHALLENGER  = { minScore = 4071, wingScore = 4234 },
    GRANDMASTER = { minScore = 4025, wingScore = 4048 },
    MASTER      = { minScore = 3863, wingScore = 3944 },
    DIAMOND     = { minScore = 3711, wingScore = 3787 },
    EMERALD     = { minScore = 3508, wingScore = 3610 },
    PLATINUM    = { minScore = 3172, wingScore = 3313 },
    GOLD        = { minScore = 2825, wingScore = 2970 },
    SILVER      = { minScore = 1750, wingScore = 2533 },
    BRONZE      = { minScore =  440, wingScore =  1027 },
    IRON        = { minScore =    1, wingScore =  237 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4331,
    CHALLENGER  = { minScore = 4223, wingScore = 4234 },
    GRANDMASTER = { minScore = 4170, wingScore = 4197 },
    MASTER      = { minScore = 3984, wingScore = 4077 },
    DIAMOND     = { minScore = 3807, wingScore = 3896 },
    EMERALD     = { minScore = 3571, wingScore = 3689 },
    PLATINUM    = { minScore = 3218, wingScore = 3359 },
    GOLD        = { minScore = 2825, wingScore = 3018 },
    SILVER      = { minScore = 1750, wingScore = 2533 },
    BRONZE      = { minScore =  440, wingScore =  1027 },
    IRON        = { minScore =    1, wingScore =  237 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4282,
    CHALLENGER  = { minScore = 4146, wingScore = 4203 },
    GRANDMASTER = { minScore = 4017, wingScore = 4057 },
    MASTER      = { minScore = 3892, wingScore = 3938 },
    DIAMOND     = { minScore = 3560, wingScore = 3682 },
    EMERALD     = { minScore = 3416, wingScore = 3458 },
    PLATINUM    = { minScore = 3087, wingScore = 3228 },
    GOLD        = { minScore = 2726, wingScore = 2956 },
    SILVER      = { minScore = 1447, wingScore = 2317 },
    BRONZE      = { minScore =  348, wingScore =  835 },
    IRON        = { minScore =    1, wingScore =  180 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4282,
    CHALLENGER  = { minScore = 4018, wingScore = 4203 },
    GRANDMASTER = { minScore = 3965, wingScore = 3992 },
    MASTER      = { minScore = 3780, wingScore = 3873 },
    DIAMOND     = { minScore = 3624, wingScore = 3702 },
    EMERALD     = { minScore = 3416, wingScore = 3520 },
    PLATINUM    = { minScore = 3112, wingScore = 3232 },
    GOLD        = { minScore = 2726, wingScore = 2909 },
    SILVER      = { minScore = 1447, wingScore = 2317 },
    BRONZE      = { minScore =  348, wingScore =  835 },
    IRON        = { minScore =    1, wingScore =  180 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4282,
    CHALLENGER  = { minScore = 4192, wingScore = 4203 },
    GRANDMASTER = { minScore = 4136, wingScore = 4164 },
    MASTER      = { minScore = 3938, wingScore = 4037 },
    DIAMOND     = { minScore = 3762, wingScore = 3850 },
    EMERALD     = { minScore = 3527, wingScore = 3644 },
    PLATINUM    = { minScore = 3165, wingScore = 3311 },
    GOLD        = { minScore = 2726, wingScore = 2947 },
    SILVER      = { minScore = 1447, wingScore = 2317 },
    BRONZE      = { minScore =  348, wingScore =  835 },
    IRON        = { minScore =    1, wingScore =  180 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4331,
    CHALLENGER  = { minScore = 4163, wingScore = 4221 },
    GRANDMASTER = { minScore = 4034, wingScore = 4083 },
    MASTER      = { minScore = 3912, wingScore = 3966 },
    DIAMOND     = { minScore = 3614, wingScore = 3729 },
    EMERALD     = { minScore = 3446, wingScore = 3510 },
    PLATINUM    = { minScore = 3135, wingScore = 3288 },
    GOLD        = { minScore = 2783, wingScore = 2993 },
    SILVER      = { minScore = 1623, wingScore = 2442 },
    BRONZE      = { minScore =  401, wingScore =  946 },
    IRON        = { minScore =    1, wingScore =  213 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4331,
    CHALLENGER  = { minScore = 4049, wingScore = 4221 },
    GRANDMASTER = { minScore = 4000, wingScore = 4025 },
    MASTER      = { minScore = 3829, wingScore = 3915 },
    DIAMOND     = { minScore = 3675, wingScore = 3752 },
    EMERALD     = { minScore = 3470, wingScore = 3573 },
    PLATINUM    = { minScore = 3147, wingScore = 3280 },
    GOLD        = { minScore = 2784, wingScore = 2945 },
    SILVER      = { minScore = 1626, wingScore = 2444 },
    BRONZE      = { minScore =  402, wingScore =  948 },
    IRON        = { minScore =    1, wingScore =  214 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4331,
    CHALLENGER  = { minScore = 4210, wingScore = 4221 },
    GRANDMASTER = { minScore = 4155, wingScore = 4183 },
    MASTER      = { minScore = 3964, wingScore = 4060 },
    DIAMOND     = { minScore = 3788, wingScore = 3876 },
    EMERALD     = { minScore = 3552, wingScore = 3670 },
    PLATINUM    = { minScore = 3195, wingScore = 3338 },
    GOLD        = { minScore = 2782, wingScore = 2987 },
    SILVER      = { minScore = 1619, wingScore = 2440 },
    BRONZE      = { minScore =  400, wingScore =  944 },
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
