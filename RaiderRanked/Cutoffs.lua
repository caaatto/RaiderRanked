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
    top100Score = 4318,
    CHALLENGER  = { minScore = 4148, wingScore = 4207 },
    GRANDMASTER = { minScore = 4031, wingScore = 4083 },
    MASTER      = { minScore = 3908, wingScore = 3964 },
    DIAMOND     = { minScore = 3647, wingScore = 3753 },
    EMERALD     = { minScore = 3464, wingScore = 3545 },
    PLATINUM    = { minScore = 3169, wingScore = 3329 },
    GOLD        = { minScore = 2825, wingScore = 3019 },
    SILVER      = { minScore = 1760, wingScore = 2536 },
    BRONZE      = { minScore =  449, wingScore =  1034 },
    IRON        = { minScore =    1, wingScore =  239 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4318,
    CHALLENGER  = { minScore = 4053, wingScore = 4207 },
    GRANDMASTER = { minScore = 4005, wingScore = 4029 },
    MASTER      = { minScore = 3839, wingScore = 3922 },
    DIAMOND     = { minScore = 3694, wingScore = 3767 },
    EMERALD     = { minScore = 3502, wingScore = 3598 },
    PLATINUM    = { minScore = 3171, wingScore = 3312 },
    GOLD        = { minScore = 2825, wingScore = 2969 },
    SILVER      = { minScore = 1760, wingScore = 2536 },
    BRONZE      = { minScore =  449, wingScore =  1034 },
    IRON        = { minScore =    1, wingScore =  239 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4318,
    CHALLENGER  = { minScore = 4197, wingScore = 4207 },
    GRANDMASTER = { minScore = 4144, wingScore = 4170 },
    MASTER      = { minScore = 3959, wingScore = 4051 },
    DIAMOND     = { minScore = 3790, wingScore = 3874 },
    EMERALD     = { minScore = 3564, wingScore = 3677 },
    PLATINUM    = { minScore = 3217, wingScore = 3357 },
    GOLD        = { minScore = 2825, wingScore = 3018 },
    SILVER      = { minScore = 1760, wingScore = 2536 },
    BRONZE      = { minScore =  449, wingScore =  1034 },
    IRON        = { minScore =    1, wingScore =  239 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4263,
    CHALLENGER  = { minScore = 4132, wingScore = 4176 },
    GRANDMASTER = { minScore = 4009, wingScore = 4038 },
    MASTER      = { minScore = 3868, wingScore = 3915 },
    DIAMOND     = { minScore = 3556, wingScore = 3674 },
    EMERALD     = { minScore = 3414, wingScore = 3455 },
    PLATINUM    = { minScore = 3087, wingScore = 3226 },
    GOLD        = { minScore = 2727, wingScore = 2955 },
    SILVER      = { minScore = 1456, wingScore = 2322 },
    BRONZE      = { minScore =  350, wingScore =  840 },
    IRON        = { minScore =    1, wingScore =  181 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4263,
    CHALLENGER  = { minScore = 4010, wingScore = 4176 },
    GRANDMASTER = { minScore = 3956, wingScore = 3983 },
    MASTER      = { minScore = 3769, wingScore = 3863 },
    DIAMOND     = { minScore = 3615, wingScore = 3692 },
    EMERALD     = { minScore = 3410, wingScore = 3513 },
    PLATINUM    = { minScore = 3111, wingScore = 3229 },
    GOLD        = { minScore = 2727, wingScore = 2909 },
    SILVER      = { minScore = 1456, wingScore = 2322 },
    BRONZE      = { minScore =  350, wingScore =  840 },
    IRON        = { minScore =    1, wingScore =  181 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4263,
    CHALLENGER  = { minScore = 4166, wingScore = 4176 },
    GRANDMASTER = { minScore = 4110, wingScore = 4138 },
    MASTER      = { minScore = 3915, wingScore = 4013 },
    DIAMOND     = { minScore = 3746, wingScore = 3831 },
    EMERALD     = { minScore = 3520, wingScore = 3633 },
    PLATINUM    = { minScore = 3164, wingScore = 3310 },
    GOLD        = { minScore = 2727, wingScore = 2947 },
    SILVER      = { minScore = 1456, wingScore = 2322 },
    BRONZE      = { minScore =  350, wingScore =  840 },
    IRON        = { minScore =    1, wingScore =  181 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4318,
    CHALLENGER  = { minScore = 4141, wingScore = 4194 },
    GRANDMASTER = { minScore = 4022, wingScore = 4064 },
    MASTER      = { minScore = 3891, wingScore = 3943 },
    DIAMOND     = { minScore = 3609, wingScore = 3720 },
    EMERALD     = { minScore = 3443, wingScore = 3507 },
    PLATINUM    = { minScore = 3135, wingScore = 3286 },
    GOLD        = { minScore = 2784, wingScore = 2992 },
    SILVER      = { minScore = 1632, wingScore = 2446 },
    BRONZE      = { minScore =  407, wingScore =  952 },
    IRON        = { minScore =    1, wingScore =  215 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4318,
    CHALLENGER  = { minScore = 4035, wingScore = 4194 },
    GRANDMASTER = { minScore = 3985, wingScore = 4010 },
    MASTER      = { minScore = 3810, wingScore = 3898 },
    DIAMOND     = { minScore = 3662, wingScore = 3736 },
    EMERALD     = { minScore = 3464, wingScore = 3563 },
    PLATINUM    = { minScore = 3146, wingScore = 3278 },
    GOLD        = { minScore = 2785, wingScore = 2944 },
    SILVER      = { minScore = 1635, wingScore = 2448 },
    BRONZE      = { minScore =  408, wingScore =  955 },
    IRON        = { minScore =    1, wingScore =  215 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4318,
    CHALLENGER  = { minScore = 4184, wingScore = 4194 },
    GRANDMASTER = { minScore = 4129, wingScore = 4156 },
    MASTER      = { minScore = 3940, wingScore = 4035 },
    DIAMOND     = { minScore = 3771, wingScore = 3855 },
    EMERALD     = { minScore = 3545, wingScore = 3658 },
    PLATINUM    = { minScore = 3194, wingScore = 3337 },
    GOLD        = { minScore = 2783, wingScore = 2987 },
    SILVER      = { minScore = 1629, wingScore = 2444 },
    BRONZE      = { minScore =  406, wingScore =  950 },
    IRON        = { minScore =    1, wingScore =  214 },
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
