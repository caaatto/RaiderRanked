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
    top100Score = 3833,
    CHALLENGER  = { minScore = 3715, wingScore = 3770 },
    GRANDMASTER = { minScore = 3647, wingScore = 3667 },
    MASTER      = { minScore = 3533, wingScore = 3563 },
    DIAMOND     = { minScore = 3335, wingScore = 3416 },
    EMERALD     = { minScore = 3194, wingScore = 3259 },
    PLATINUM    = { minScore = 2945, wingScore = 3042 },
    GOLD        = { minScore = 2632, wingScore = 2751 },
    SILVER      = { minScore = 1208, wingScore = 2113 },
    BRONZE      = { minScore =  328, wingScore =  667 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3833,
    CHALLENGER  = { minScore = 3650, wingScore = 3770 },
    GRANDMASTER = { minScore = 3606, wingScore = 3628 },
    MASTER      = { minScore = 3454, wingScore = 3530 },
    DIAMOND     = { minScore = 3331, wingScore = 3393 },
    EMERALD     = { minScore = 3168, wingScore = 3250 },
    PLATINUM    = { minScore = 2898, wingScore = 3011 },
    GOLD        = { minScore = 2632, wingScore = 2740 },
    SILVER      = { minScore = 1208, wingScore = 2113 },
    BRONZE      = { minScore =  328, wingScore =  667 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3833,
    CHALLENGER  = { minScore = 3753, wingScore = 3770 },
    GRANDMASTER = { minScore = 3709, wingScore = 3731 },
    MASTER      = { minScore = 3556, wingScore = 3632 },
    DIAMOND     = { minScore = 3426, wingScore = 3491 },
    EMERALD     = { minScore = 3254, wingScore = 3340 },
    PLATINUM    = { minScore = 2961, wingScore = 3085 },
    GOLD        = { minScore = 2632, wingScore = 2785 },
    SILVER      = { minScore = 1208, wingScore = 2113 },
    BRONZE      = { minScore =  328, wingScore =  667 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3784,
    CHALLENGER  = { minScore = 3675, wingScore = 3719 },
    GRANDMASTER = { minScore = 3588, wingScore = 3630 },
    MASTER      = { minScore = 3463, wingScore = 3521 },
    DIAMOND     = { minScore = 3257, wingScore = 3339 },
    EMERALD     = { minScore = 3107, wingScore = 3176 },
    PLATINUM    = { minScore = 2859, wingScore = 3000 },
    GOLD        = { minScore = 2528, wingScore = 2690 },
    SILVER      = { minScore = 1017, wingScore = 1930 },
    BRONZE      = { minScore =  310, wingScore =  602 },
    IRON        = { minScore =    1, wingScore =  168 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3784,
    CHALLENGER  = { minScore = 3572, wingScore = 3719 },
    GRANDMASTER = { minScore = 3531, wingScore = 3552 },
    MASTER      = { minScore = 3388, wingScore = 3460 },
    DIAMOND     = { minScore = 3267, wingScore = 3328 },
    EMERALD     = { minScore = 3106, wingScore = 3187 },
    PLATINUM    = { minScore = 2830, wingScore = 2947 },
    GOLD        = { minScore = 2528, wingScore = 2648 },
    SILVER      = { minScore = 1017, wingScore = 1930 },
    BRONZE      = { minScore =  310, wingScore =  602 },
    IRON        = { minScore =    1, wingScore =  168 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3784,
    CHALLENGER  = { minScore = 3707, wingScore = 3719 },
    GRANDMASTER = { minScore = 3665, wingScore = 3686 },
    MASTER      = { minScore = 3518, wingScore = 3591 },
    DIAMOND     = { minScore = 3375, wingScore = 3446 },
    EMERALD     = { minScore = 3185, wingScore = 3280 },
    PLATINUM    = { minScore = 2891, wingScore = 3011 },
    GOLD        = { minScore = 2528, wingScore = 2715 },
    SILVER      = { minScore = 1017, wingScore = 1930 },
    BRONZE      = { minScore =  310, wingScore =  602 },
    IRON        = { minScore =    1, wingScore =  168 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3833,
    CHALLENGER  = { minScore = 3698, wingScore = 3748 },
    GRANDMASTER = { minScore = 3622, wingScore = 3651 },
    MASTER      = { minScore = 3503, wingScore = 3545 },
    DIAMOND     = { minScore = 3302, wingScore = 3384 },
    EMERALD     = { minScore = 3157, wingScore = 3224 },
    PLATINUM    = { minScore = 2909, wingScore = 3024 },
    GOLD        = { minScore = 2588, wingScore = 2725 },
    SILVER      = { minScore = 1127, wingScore = 2036 },
    BRONZE      = { minScore =  317, wingScore =  640 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3833,
    CHALLENGER  = { minScore = 3618, wingScore = 3749 },
    GRANDMASTER = { minScore = 3575, wingScore = 3597 },
    MASTER      = { minScore = 3427, wingScore = 3501 },
    DIAMOND     = { minScore = 3305, wingScore = 3366 },
    EMERALD     = { minScore = 3142, wingScore = 3224 },
    PLATINUM    = { minScore = 2870, wingScore = 2985 },
    GOLD        = { minScore = 2589, wingScore = 2702 },
    SILVER      = { minScore = 1129, wingScore = 2037 },
    BRONZE      = { minScore =  318, wingScore =  640 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3833,
    CHALLENGER  = { minScore = 3733, wingScore = 3748 },
    GRANDMASTER = { minScore = 3690, wingScore = 3712 },
    MASTER      = { minScore = 3540, wingScore = 3614 },
    DIAMOND     = { minScore = 3404, wingScore = 3472 },
    EMERALD     = { minScore = 3224, wingScore = 3314 },
    PLATINUM    = { minScore = 2931, wingScore = 3053 },
    GOLD        = { minScore = 2587, wingScore = 2755 },
    SILVER      = { minScore = 1125, wingScore = 2034 },
    BRONZE      = { minScore =  317, wingScore =  639 },
    IRON        = { minScore =    1, wingScore =  169 },
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
