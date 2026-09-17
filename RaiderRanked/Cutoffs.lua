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
    top100Score = 3881,
    CHALLENGER  = { minScore = 3756, wingScore = 3789 },
    GRANDMASTER = { minScore = 3665, wingScore = 3694 },
    MASTER      = { minScore = 3551, wingScore = 3595 },
    DIAMOND     = { minScore = 3363, wingScore = 3437 },
    EMERALD     = { minScore = 3218, wingScore = 3291 },
    PLATINUM    = { minScore = 2975, wingScore = 3062 },
    GOLD        = { minScore = 2643, wingScore = 2772 },
    SILVER      = { minScore = 1259, wingScore = 2144 },
    BRONZE      = { minScore =  331, wingScore =  696 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3881,
    CHALLENGER  = { minScore = 3668, wingScore = 3789 },
    GRANDMASTER = { minScore = 3629, wingScore = 3648 },
    MASTER      = { minScore = 3493, wingScore = 3561 },
    DIAMOND     = { minScore = 3368, wingScore = 3431 },
    EMERALD     = { minScore = 3201, wingScore = 3284 },
    PLATINUM    = { minScore = 2928, wingScore = 3041 },
    GOLD        = { minScore = 2643, wingScore = 2766 },
    SILVER      = { minScore = 1259, wingScore = 2144 },
    BRONZE      = { minScore =  331, wingScore =  696 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3881,
    CHALLENGER  = { minScore = 3782, wingScore = 3789 },
    GRANDMASTER = { minScore = 3740, wingScore = 3761 },
    MASTER      = { minScore = 3593, wingScore = 3667 },
    DIAMOND     = { minScore = 3462, wingScore = 3528 },
    EMERALD     = { minScore = 3288, wingScore = 3375 },
    PLATINUM    = { minScore = 2994, wingScore = 3118 },
    GOLD        = { minScore = 2643, wingScore = 2812 },
    SILVER      = { minScore = 1259, wingScore = 2144 },
    BRONZE      = { minScore =  331, wingScore =  696 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3816,
    CHALLENGER  = { minScore = 3707, wingScore = 3760 },
    GRANDMASTER = { minScore = 3626, wingScore = 3657 },
    MASTER      = { minScore = 3494, wingScore = 3541 },
    DIAMOND     = { minScore = 3287, wingScore = 3365 },
    EMERALD     = { minScore = 3131, wingScore = 3201 },
    PLATINUM    = { minScore = 2890, wingScore = 3013 },
    GOLD        = { minScore = 2552, wingScore = 2706 },
    SILVER      = { minScore = 1055, wingScore = 1957 },
    BRONZE      = { minScore =  323, wingScore =  652 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3816,
    CHALLENGER  = { minScore = 3608, wingScore = 3760 },
    GRANDMASTER = { minScore = 3566, wingScore = 3587 },
    MASTER      = { minScore = 3418, wingScore = 3492 },
    DIAMOND     = { minScore = 3293, wingScore = 3356 },
    EMERALD     = { minScore = 3127, wingScore = 3210 },
    PLATINUM    = { minScore = 2851, wingScore = 2967 },
    GOLD        = { minScore = 2552, wingScore = 2674 },
    SILVER      = { minScore = 1055, wingScore = 1957 },
    BRONZE      = { minScore =  323, wingScore =  652 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3816,
    CHALLENGER  = { minScore = 3749, wingScore = 3760 },
    GRANDMASTER = { minScore = 3703, wingScore = 3726 },
    MASTER      = { minScore = 3542, wingScore = 3623 },
    DIAMOND     = { minScore = 3399, wingScore = 3471 },
    EMERALD     = { minScore = 3208, wingScore = 3304 },
    PLATINUM    = { minScore = 2917, wingScore = 3034 },
    GOLD        = { minScore = 2552, wingScore = 2741 },
    SILVER      = { minScore = 1055, wingScore = 1957 },
    BRONZE      = { minScore =  323, wingScore =  652 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3881,
    CHALLENGER  = { minScore = 3735, wingScore = 3777 },
    GRANDMASTER = { minScore = 3649, wingScore = 3678 },
    MASTER      = { minScore = 3527, wingScore = 3572 },
    DIAMOND     = { minScore = 3331, wingScore = 3407 },
    EMERALD     = { minScore = 3181, wingScore = 3253 },
    PLATINUM    = { minScore = 2939, wingScore = 3041 },
    GOLD        = { minScore = 2605, wingScore = 2744 },
    SILVER      = { minScore = 1173, wingScore = 2065 },
    BRONZE      = { minScore =  328, wingScore =  677 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3881,
    CHALLENGER  = { minScore = 3643, wingScore = 3777 },
    GRANDMASTER = { minScore = 3603, wingScore = 3623 },
    MASTER      = { minScore = 3462, wingScore = 3533 },
    DIAMOND     = { minScore = 3337, wingScore = 3400 },
    EMERALD     = { minScore = 3171, wingScore = 3254 },
    PLATINUM    = { minScore = 2896, wingScore = 3011 },
    GOLD        = { minScore = 2606, wingScore = 2728 },
    SILVER      = { minScore = 1175, wingScore = 2067 },
    BRONZE      = { minScore =  328, wingScore =  678 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3881,
    CHALLENGER  = { minScore = 3768, wingScore = 3777 },
    GRANDMASTER = { minScore = 3724, wingScore = 3746 },
    MASTER      = { minScore = 3571, wingScore = 3648 },
    DIAMOND     = { minScore = 3435, wingScore = 3503 },
    EMERALD     = { minScore = 3254, wingScore = 3344 },
    PLATINUM    = { minScore = 2961, wingScore = 3082 },
    GOLD        = { minScore = 2604, wingScore = 2781 },
    SILVER      = { minScore = 1171, wingScore = 2064 },
    BRONZE      = { minScore =  328, wingScore =  677 },
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
