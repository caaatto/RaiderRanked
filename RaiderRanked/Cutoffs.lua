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
    top100Score = 3859,
    CHALLENGER  = { minScore = 3740, wingScore = 3780 },
    GRANDMASTER = { minScore = 3657, wingScore = 3681 },
    MASTER      = { minScore = 3542, wingScore = 3580 },
    DIAMOND     = { minScore = 3351, wingScore = 3427 },
    EMERALD     = { minScore = 3208, wingScore = 3277 },
    PLATINUM    = { minScore = 2962, wingScore = 3052 },
    GOLD        = { minScore = 2638, wingScore = 2761 },
    SILVER      = { minScore = 1238, wingScore = 2129 },
    BRONZE      = { minScore =  330, wingScore =  682 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3859,
    CHALLENGER  = { minScore = 3660, wingScore = 3780 },
    GRANDMASTER = { minScore = 3620, wingScore = 3640 },
    MASTER      = { minScore = 3479, wingScore = 3549 },
    DIAMOND     = { minScore = 3354, wingScore = 3417 },
    EMERALD     = { minScore = 3189, wingScore = 3271 },
    PLATINUM    = { minScore = 2916, wingScore = 3030 },
    GOLD        = { minScore = 2638, wingScore = 2756 },
    SILVER      = { minScore = 1238, wingScore = 2129 },
    BRONZE      = { minScore =  330, wingScore =  682 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3859,
    CHALLENGER  = { minScore = 3774, wingScore = 3780 },
    GRANDMASTER = { minScore = 3731, wingScore = 3753 },
    MASTER      = { minScore = 3578, wingScore = 3655 },
    DIAMOND     = { minScore = 3449, wingScore = 3514 },
    EMERALD     = { minScore = 3277, wingScore = 3363 },
    PLATINUM    = { minScore = 2982, wingScore = 3107 },
    GOLD        = { minScore = 2638, wingScore = 2802 },
    SILVER      = { minScore = 1238, wingScore = 2129 },
    BRONZE      = { minScore =  330, wingScore =  682 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3793,
    CHALLENGER  = { minScore = 3690, wingScore = 3741 },
    GRANDMASTER = { minScore = 3609, wingScore = 3651 },
    MASTER      = { minScore = 3479, wingScore = 3534 },
    DIAMOND     = { minScore = 3270, wingScore = 3351 },
    EMERALD     = { minScore = 3116, wingScore = 3187 },
    PLATINUM    = { minScore = 2870, wingScore = 3005 },
    GOLD        = { minScore = 2537, wingScore = 2695 },
    SILVER      = { minScore = 1035, wingScore = 1937 },
    BRONZE      = { minScore =  322, wingScore =  637 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3793,
    CHALLENGER  = { minScore = 3594, wingScore = 3741 },
    GRANDMASTER = { minScore = 3553, wingScore = 3574 },
    MASTER      = { minScore = 3408, wingScore = 3481 },
    DIAMOND     = { minScore = 3283, wingScore = 3346 },
    EMERALD     = { minScore = 3117, wingScore = 3200 },
    PLATINUM    = { minScore = 2839, wingScore = 2956 },
    GOLD        = { minScore = 2537, wingScore = 2660 },
    SILVER      = { minScore = 1035, wingScore = 1937 },
    BRONZE      = { minScore =  322, wingScore =  637 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3793,
    CHALLENGER  = { minScore = 3728, wingScore = 3741 },
    GRANDMASTER = { minScore = 3685, wingScore = 3707 },
    MASTER      = { minScore = 3535, wingScore = 3610 },
    DIAMOND     = { minScore = 3390, wingScore = 3463 },
    EMERALD     = { minScore = 3197, wingScore = 3294 },
    PLATINUM    = { minScore = 2903, wingScore = 3022 },
    GOLD        = { minScore = 2537, wingScore = 2727 },
    SILVER      = { minScore = 1035, wingScore = 1937 },
    BRONZE      = { minScore =  322, wingScore =  637 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3859,
    CHALLENGER  = { minScore = 3719, wingScore = 3764 },
    GRANDMASTER = { minScore = 3637, wingScore = 3668 },
    MASTER      = { minScore = 3515, wingScore = 3561 },
    DIAMOND     = { minScore = 3317, wingScore = 3395 },
    EMERALD     = { minScore = 3169, wingScore = 3239 },
    PLATINUM    = { minScore = 2923, wingScore = 3032 },
    GOLD        = { minScore = 2595, wingScore = 2733 },
    SILVER      = { minScore = 1152, wingScore = 2048 },
    BRONZE      = { minScore =  327, wingScore =  663 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3859,
    CHALLENGER  = { minScore = 3633, wingScore = 3764 },
    GRANDMASTER = { minScore = 3592, wingScore = 3613 },
    MASTER      = { minScore = 3450, wingScore = 3521 },
    DIAMOND     = { minScore = 3325, wingScore = 3388 },
    EMERALD     = { minScore = 3159, wingScore = 3242 },
    PLATINUM    = { minScore = 2884, wingScore = 2999 },
    GOLD        = { minScore = 2596, wingScore = 2716 },
    SILVER      = { minScore = 1154, wingScore = 2050 },
    BRONZE      = { minScore =  327, wingScore =  663 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3859,
    CHALLENGER  = { minScore = 3754, wingScore = 3763 },
    GRANDMASTER = { minScore = 3711, wingScore = 3733 },
    MASTER      = { minScore = 3559, wingScore = 3636 },
    DIAMOND     = { minScore = 3424, wingScore = 3492 },
    EMERALD     = { minScore = 3242, wingScore = 3333 },
    PLATINUM    = { minScore = 2948, wingScore = 3070 },
    GOLD        = { minScore = 2594, wingScore = 2770 },
    SILVER      = { minScore = 1150, wingScore = 2046 },
    BRONZE      = { minScore =  327, wingScore =  663 },
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
