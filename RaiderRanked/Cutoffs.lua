-- RaiderRanked: Cutoffs.lua
-- Per-region / per-faction M+ rating cutoffs.
--
-- Auto-patched by scripts/patch_addon.py from thresholds.json. Each
-- RR.CUTOFFS.<region>.<faction> block is a discrete patch target - do
-- not reformat the minScore/wingScore lines or the patcher will miss
-- them.
--
-- Regions: us | eu | all   (all = population-weighted merge of us+eu)
-- Factions: alliance | horde | all
--
-- All 9 slots carry their own computed snapshot. The addon reads the
-- active slot at login via RR:ApplyCutoffSelection(); the selection
-- itself lives in db.cutoffRegion / db.cutoffFaction.

local ADDON_NAME, RR = ...

RR.CUTOFFS = { us = {}, eu = {}, all = {} }

RR.CUTOFFS.eu.all = {
    top100Score = 3891,
    CHALLENGER  = { minScore = 3768, wingScore = 3802 },
    GRANDMASTER = { minScore = 3671, wingScore = 3704 },
    MASTER      = { minScore = 3557, wingScore = 3608 },
    DIAMOND     = { minScore = 3372, wingScore = 3443 },
    EMERALD     = { minScore = 3227, wingScore = 3300 },
    PLATINUM    = { minScore = 2984, wingScore = 3070 },
    GOLD        = { minScore = 2647, wingScore = 2781 },
    SILVER      = { minScore = 1266, wingScore = 2154 },
    BRONZE      = { minScore =  331, wingScore =  697 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3891,
    CHALLENGER  = { minScore = 3673, wingScore = 3802 },
    GRANDMASTER = { minScore = 3635, wingScore = 3654 },
    MASTER      = { minScore = 3503, wingScore = 3569 },
    DIAMOND     = { minScore = 3377, wingScore = 3440 },
    EMERALD     = { minScore = 3210, wingScore = 3294 },
    PLATINUM    = { minScore = 2937, wingScore = 3050 },
    GOLD        = { minScore = 2647, wingScore = 2774 },
    SILVER      = { minScore = 1266, wingScore = 2154 },
    BRONZE      = { minScore =  331, wingScore =  697 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3891,
    CHALLENGER  = { minScore = 3790, wingScore = 3802 },
    GRANDMASTER = { minScore = 3749, wingScore = 3770 },
    MASTER      = { minScore = 3605, wingScore = 3677 },
    DIAMOND     = { minScore = 3473, wingScore = 3539 },
    EMERALD     = { minScore = 3297, wingScore = 3385 },
    PLATINUM    = { minScore = 3004, wingScore = 3127 },
    GOLD        = { minScore = 2647, wingScore = 2821 },
    SILVER      = { minScore = 1266, wingScore = 2154 },
    BRONZE      = { minScore =  331, wingScore =  697 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3830,
    CHALLENGER  = { minScore = 3717, wingScore = 3772 },
    GRANDMASTER = { minScore = 3638, wingScore = 3665 },
    MASTER      = { minScore = 3504, wingScore = 3550 },
    DIAMOND     = { minScore = 3296, wingScore = 3375 },
    EMERALD     = { minScore = 3140, wingScore = 3208 },
    PLATINUM    = { minScore = 2901, wingScore = 3018 },
    GOLD        = { minScore = 2560, wingScore = 2712 },
    SILVER      = { minScore = 1062, wingScore = 1967 },
    BRONZE      = { minScore =  323, wingScore =  652 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3830,
    CHALLENGER  = { minScore = 3616, wingScore = 3772 },
    GRANDMASTER = { minScore = 3573, wingScore = 3595 },
    MASTER      = { minScore = 3423, wingScore = 3498 },
    DIAMOND     = { minScore = 3299, wingScore = 3361 },
    EMERALD     = { minScore = 3134, wingScore = 3216 },
    PLATINUM    = { minScore = 2859, wingScore = 2974 },
    GOLD        = { minScore = 2560, wingScore = 2682 },
    SILVER      = { minScore = 1062, wingScore = 1967 },
    BRONZE      = { minScore =  323, wingScore =  652 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3830,
    CHALLENGER  = { minScore = 3763, wingScore = 3772 },
    GRANDMASTER = { minScore = 3715, wingScore = 3739 },
    MASTER      = { minScore = 3551, wingScore = 3633 },
    DIAMOND     = { minScore = 3408, wingScore = 3479 },
    EMERALD     = { minScore = 3217, wingScore = 3312 },
    PLATINUM    = { minScore = 2927, wingScore = 3044 },
    GOLD        = { minScore = 2560, wingScore = 2750 },
    SILVER      = { minScore = 1062, wingScore = 1967 },
    BRONZE      = { minScore =  323, wingScore =  652 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3891,
    CHALLENGER  = { minScore = 3747, wingScore = 3789 },
    GRANDMASTER = { minScore = 3657, wingScore = 3688 },
    MASTER      = { minScore = 3535, wingScore = 3584 },
    DIAMOND     = { minScore = 3340, wingScore = 3414 },
    EMERALD     = { minScore = 3190, wingScore = 3261 },
    PLATINUM    = { minScore = 2949, wingScore = 3048 },
    GOLD        = { minScore = 2610, wingScore = 2752 },
    SILVER      = { minScore = 1180, wingScore = 2075 },
    BRONZE      = { minScore =  328, wingScore =  678 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3891,
    CHALLENGER  = { minScore = 3650, wingScore = 3790 },
    GRANDMASTER = { minScore = 3609, wingScore = 3630 },
    MASTER      = { minScore = 3470, wingScore = 3540 },
    DIAMOND     = { minScore = 3345, wingScore = 3407 },
    EMERALD     = { minScore = 3179, wingScore = 3262 },
    PLATINUM    = { minScore = 2905, wingScore = 3019 },
    GOLD        = { minScore = 2611, wingScore = 2736 },
    SILVER      = { minScore = 1182, wingScore = 2077 },
    BRONZE      = { minScore =  328, wingScore =  678 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3891,
    CHALLENGER  = { minScore = 3778, wingScore = 3789 },
    GRANDMASTER = { minScore = 3734, wingScore = 3757 },
    MASTER      = { minScore = 3582, wingScore = 3658 },
    DIAMOND     = { minScore = 3445, wingScore = 3513 },
    EMERALD     = { minScore = 3263, wingScore = 3354 },
    PLATINUM    = { minScore = 2971, wingScore = 3091 },
    GOLD        = { minScore = 2610, wingScore = 2790 },
    SILVER      = { minScore = 1178, wingScore = 2074 },
    BRONZE      = { minScore =  328, wingScore =  678 },
    IRON        = { minScore =    1, wingScore =  170 },
}


-- ── Previous season ────────────────────────────────────────────────────────
-- The ladders as they stood when the last season closed, shipped so a result
-- from it can still be ranked by someone who installed the addon afterwards.
-- Rewritten by scripts/patch_addon.py at the moment a season rolls over, from
-- the values that are about to be replaced.
--
-- Without this, last season's rank could only be shown to players who happened
-- to be running the addon through the rollover.

RR.PREV_SEASON_NAME = "MN Season 1 • Full"

RR.PREV_CUTOFFS = {
    eu = {
        all = {
            CHALLENGER   = { minScore =  4236, wingScore =  4255 },
            GRANDMASTER  = { minScore =  4066, wingScore =  4119 },
            MASTER       = { minScore =  4008, wingScore =  4021 },
            DIAMOND      = { minScore =  3656, wingScore =  3774 },
            EMERALD      = { minScore =  3466, wingScore =  3547 },
            PLATINUM     = { minScore =  3166, wingScore =  3338 },
            GOLD         = { minScore =  2822, wingScore =  3018 },
            SILVER       = { minScore =  1718, wingScore =  2519 },
            BRONZE       = { minScore =   413, wingScore =  1006 },
            IRON         = { minScore =     1, wingScore =   230 },
        },
        horde = {
            CHALLENGER   = { minScore =  4087, wingScore =  4255 },
            GRANDMASTER  = { minScore =  4044, wingScore =  4066 },
            MASTER       = { minScore =  3894, wingScore =  3969 },
            DIAMOND      = { minScore =  3732, wingScore =  3813 },
            EMERALD      = { minScore =  3517, wingScore =  3625 },
            PLATINUM     = { minScore =  3171, wingScore =  3314 },
            GOLD         = { minScore =  2822, wingScore =  2967 },
            SILVER       = { minScore =  1718, wingScore =  2519 },
            BRONZE       = { minScore =   413, wingScore =  1006 },
            IRON         = { minScore =     1, wingScore =   230 },
        },
        alliance = {
            CHALLENGER   = { minScore =  4254, wingScore =  4255 },
            GRANDMASTER  = { minScore =  4202, wingScore =  4228 },
            MASTER       = { minScore =  4019, wingScore =  4110 },
            DIAMOND      = { minScore =  3830, wingScore =  3925 },
            EMERALD      = { minScore =  3579, wingScore =  3704 },
            PLATINUM     = { minScore =  3214, wingScore =  3357 },
            GOLD         = { minScore =  2822, wingScore =  3014 },
            SILVER       = { minScore =  1718, wingScore =  2519 },
            BRONZE       = { minScore =   413, wingScore =  1006 },
            IRON         = { minScore =     1, wingScore =   230 },
        },
    },
    us = {
        all = {
            CHALLENGER   = { minScore =  4210, wingScore =  4228 },
            GRANDMASTER  = { minScore =  4030, wingScore =  4076 },
            MASTER       = { minScore =  3960, wingScore =  3984 },
            DIAMOND      = { minScore =  3563, wingScore =  3692 },
            EMERALD      = { minScore =  3420, wingScore =  3461 },
            PLATINUM     = { minScore =  3086, wingScore =  3234 },
            GOLD         = { minScore =  2725, wingScore =  2963 },
            SILVER       = { minScore =  1422, wingScore =  2305 },
            BRONZE       = { minScore =   341, wingScore =   822 },
            IRON         = { minScore =     1, wingScore =   175 },
        },
        horde = {
            CHALLENGER   = { minScore =  4031, wingScore =  4228 },
            GRANDMASTER  = { minScore =  3982, wingScore =  4007 },
            MASTER       = { minScore =  3809, wingScore =  3896 },
            DIAMOND      = { minScore =  3648, wingScore =  3729 },
            EMERALD      = { minScore =  3433, wingScore =  3540 },
            PLATINUM     = { minScore =  3118, wingScore =  3242 },
            GOLD         = { minScore =  2725, wingScore =  2909 },
            SILVER       = { minScore =  1422, wingScore =  2305 },
            BRONZE       = { minScore =   341, wingScore =   822 },
            IRON         = { minScore =     1, wingScore =   175 },
        },
        alliance = {
            CHALLENGER   = { minScore =  4226, wingScore =  4228 },
            GRANDMASTER  = { minScore =  4172, wingScore =  4199 },
            MASTER       = { minScore =  3984, wingScore =  4078 },
            DIAMOND      = { minScore =  3794, wingScore =  3889 },
            EMERALD      = { minScore =  3540, wingScore =  3667 },
            PLATINUM     = { minScore =  3166, wingScore =  3314 },
            GOLD         = { minScore =  2725, wingScore =  2946 },
            SILVER       = { minScore =  1422, wingScore =  2305 },
            BRONZE       = { minScore =   341, wingScore =   822 },
            IRON         = { minScore =     1, wingScore =   175 },
        },
    },
    all = {
        all = {
            CHALLENGER   = { minScore =  4225, wingScore =  4244 },
            GRANDMASTER  = { minScore =  4051, wingScore =  4101 },
            MASTER       = { minScore =  3988, wingScore =  4005 },
            DIAMOND      = { minScore =  3617, wingScore =  3740 },
            EMERALD      = { minScore =  3447, wingScore =  3511 },
            PLATINUM     = { minScore =  3132, wingScore =  3294 },
            GOLD         = { minScore =  2781, wingScore =  2995 },
            SILVER       = { minScore =  1594, wingScore =  2429 },
            BRONZE       = { minScore =   383, wingScore =   929 },
            IRON         = { minScore =     1, wingScore =   207 },
        },
        horde = {
            CHALLENGER   = { minScore =  4064, wingScore =  4244 },
            GRANDMASTER  = { minScore =  4019, wingScore =  4042 },
            MASTER       = { minScore =  3859, wingScore =  3939 },
            DIAMOND      = { minScore =  3698, wingScore =  3779 },
            EMERALD      = { minScore =  3483, wingScore =  3590 },
            PLATINUM     = { minScore =  3149, wingScore =  3285 },
            GOLD         = { minScore =  2782, wingScore =  2943 },
            SILVER       = { minScore =  1597, wingScore =  2431 },
            BRONZE       = { minScore =   384, wingScore =   931 },
            IRON         = { minScore =     1, wingScore =   207 },
        },
        alliance = {
            CHALLENGER   = { minScore =  4242, wingScore =  4243 },
            GRANDMASTER  = { minScore =  4189, wingScore =  4215 },
            MASTER       = { minScore =  4004, wingScore =  4096 },
            DIAMOND      = { minScore =  3814, wingScore =  3909 },
            EMERALD      = { minScore =  3562, wingScore =  3688 },
            PLATINUM     = { minScore =  3193, wingScore =  3338 },
            GOLD         = { minScore =  2780, wingScore =  2985 },
            SILVER       = { minScore =  1590, wingScore =  2427 },
            BRONZE       = { minScore =   382, wingScore =   927 },
            IRON         = { minScore =     1, wingScore =   206 },
        },
    },
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
