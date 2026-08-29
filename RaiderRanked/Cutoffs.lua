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
    top100Score = 3550,
    CHALLENGER  = { minScore = 3453, wingScore = 3496 },
    GRANDMASTER = { minScore = 3382, wingScore = 3414 },
    MASTER      = { minScore = 3266, wingScore = 3313 },
    DIAMOND     = { minScore = 3067, wingScore = 3143 },
    EMERALD     = { minScore = 2954, wingScore = 3008 },
    PLATINUM    = { minScore = 2695, wingScore = 2783 },
    GOLD        = { minScore = 2305, wingScore = 2587 },
    SILVER      = { minScore = 905, wingScore = 1656 },
    BRONZE      = { minScore =  310, wingScore =  507 },
    IRON        = { minScore =    1, wingScore =  168 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3550,
    CHALLENGER  = { minScore = 3403, wingScore = 3496 },
    GRANDMASTER = { minScore = 3359, wingScore = 3381 },
    MASTER      = { minScore = 3207, wingScore = 3283 },
    DIAMOND     = { minScore = 3084, wingScore = 3146 },
    EMERALD     = { minScore = 2919, wingScore = 3001 },
    PLATINUM    = { minScore = 2699, wingScore = 2782 },
    GOLD        = { minScore = 2305, wingScore = 2511 },
    SILVER      = { minScore = 905, wingScore = 1656 },
    BRONZE      = { minScore =  310, wingScore =  507 },
    IRON        = { minScore =    1, wingScore =  168 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3550,
    CHALLENGER  = { minScore = 3483, wingScore = 3496 },
    GRANDMASTER = { minScore = 3445, wingScore = 3464 },
    MASTER      = { minScore = 3309, wingScore = 3377 },
    DIAMOND     = { minScore = 3182, wingScore = 3245 },
    EMERALD     = { minScore = 3013, wingScore = 3098 },
    PLATINUM    = { minScore = 2750, wingScore = 2857 },
    GOLD        = { minScore = 2305, wingScore = 2551 },
    SILVER      = { minScore = 905, wingScore = 1656 },
    BRONZE      = { minScore =  310, wingScore =  507 },
    IRON        = { minScore =    1, wingScore =  168 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3520,
    CHALLENGER  = { minScore = 3430, wingScore = 3477 },
    GRANDMASTER = { minScore = 3337, wingScore = 3374 },
    MASTER      = { minScore = 3211, wingScore = 3267 },
    DIAMOND     = { minScore = 3017, wingScore = 3079 },
    EMERALD     = { minScore = 2870, wingScore = 2954 },
    PLATINUM    = { minScore = 2648, wingScore = 2728 },
    GOLD        = { minScore = 2155, wingScore = 2463 },
    SILVER      = { minScore = 780, wingScore = 1456 },
    BRONZE      = { minScore =  310, wingScore =  465 },
    IRON        = { minScore =    1, wingScore =  166 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3520,
    CHALLENGER  = { minScore = 3343, wingScore = 3477 },
    GRANDMASTER = { minScore = 3297, wingScore = 3320 },
    MASTER      = { minScore = 3135, wingScore = 3216 },
    DIAMOND     = { minScore = 3010, wingScore = 3073 },
    EMERALD     = { minScore = 2842, wingScore = 2926 },
    PLATINUM    = { minScore = 2610, wingScore = 2699 },
    GOLD        = { minScore = 2155, wingScore = 2389 },
    SILVER      = { minScore = 780, wingScore = 1456 },
    BRONZE      = { minScore =  310, wingScore =  465 },
    IRON        = { minScore =    1, wingScore =  166 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3520,
    CHALLENGER  = { minScore = 3458, wingScore = 3477 },
    GRANDMASTER = { minScore = 3412, wingScore = 3435 },
    MASTER      = { minScore = 3253, wingScore = 3332 },
    DIAMOND     = { minScore = 3119, wingScore = 3186 },
    EMERALD     = { minScore = 2940, wingScore = 3029 },
    PLATINUM    = { minScore = 2692, wingScore = 2787 },
    GOLD        = { minScore = 2155, wingScore = 2474 },
    SILVER      = { minScore = 780, wingScore = 1456 },
    BRONZE      = { minScore =  310, wingScore =  465 },
    IRON        = { minScore =    1, wingScore =  166 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3550,
    CHALLENGER  = { minScore = 3443, wingScore = 3488 },
    GRANDMASTER = { minScore = 3363, wingScore = 3397 },
    MASTER      = { minScore = 3243, wingScore = 3294 },
    DIAMOND     = { minScore = 3046, wingScore = 3116 },
    EMERALD     = { minScore = 2919, wingScore = 2985 },
    PLATINUM    = { minScore = 2675, wingScore = 2760 },
    GOLD        = { minScore = 2242, wingScore = 2535 },
    SILVER      = { minScore = 852, wingScore = 1571 },
    BRONZE      = { minScore =  310, wingScore =  481 },
    IRON        = { minScore =    1, wingScore =  167 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3550,
    CHALLENGER  = { minScore = 3378, wingScore = 3488 },
    GRANDMASTER = { minScore = 3333, wingScore = 3356 },
    MASTER      = { minScore = 3177, wingScore = 3255 },
    DIAMOND     = { minScore = 3054, wingScore = 3116 },
    EMERALD     = { minScore = 2887, wingScore = 2970 },
    PLATINUM    = { minScore = 2662, wingScore = 2748 },
    GOLD        = { minScore = 2243, wingScore = 2461 },
    SILVER      = { minScore = 853, wingScore = 1574 },
    BRONZE      = { minScore =  310, wingScore =  482 },
    IRON        = { minScore =    1, wingScore =  167 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3550,
    CHALLENGER  = { minScore = 3472, wingScore = 3488 },
    GRANDMASTER = { minScore = 3431, wingScore = 3452 },
    MASTER      = { minScore = 3285, wingScore = 3358 },
    DIAMOND     = { minScore = 3155, wingScore = 3220 },
    EMERALD     = { minScore = 2982, wingScore = 3068 },
    PLATINUM    = { minScore = 2725, wingScore = 2827 },
    GOLD        = { minScore = 2240, wingScore = 2518 },
    SILVER      = { minScore = 851, wingScore = 1570 },
    BRONZE      = { minScore =  310, wingScore =  481 },
    IRON        = { minScore =    1, wingScore =  167 },
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
