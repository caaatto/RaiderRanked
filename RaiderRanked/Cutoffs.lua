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
    top100Score = 4189,
    CHALLENGER  = { minScore = 4028, wingScore = 4097 },
    GRANDMASTER = { minScore = 3928, wingScore = 3981 },
    MASTER      = { minScore = 3800, wingScore = 3865 },
    DIAMOND     = { minScore = 3584, wingScore = 3664 },
    EMERALD     = { minScore = 3426, wingScore = 3498 },
    PLATINUM    = { minScore = 3106, wingScore = 3248 },
    GOLD        = { minScore = 2761, wingScore = 2982 },
    SILVER      = { minScore = 1413, wingScore = 2358 },
    BRONZE      = { minScore =  333, wingScore =  771 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4189,
    CHALLENGER  = { minScore = 3917, wingScore = 4097 },
    GRANDMASTER = { minScore = 3872, wingScore = 3894 },
    MASTER      = { minScore = 3717, wingScore = 3795 },
    DIAMOND     = { minScore = 3583, wingScore = 3650 },
    EMERALD     = { minScore = 3404, wingScore = 3494 },
    PLATINUM    = { minScore = 3117, wingScore = 3236 },
    GOLD        = { minScore = 2761, wingScore = 2924 },
    SILVER      = { minScore = 1413, wingScore = 2358 },
    BRONZE      = { minScore =  333, wingScore =  771 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4189,
    CHALLENGER  = { minScore = 4086, wingScore = 4097 },
    GRANDMASTER = { minScore = 4039, wingScore = 4062 },
    MASTER      = { minScore = 3874, wingScore = 3956 },
    DIAMOND     = { minScore = 3721, wingScore = 3797 },
    EMERALD     = { minScore = 3516, wingScore = 3619 },
    PLATINUM    = { minScore = 3174, wingScore = 3318 },
    GOLD        = { minScore = 2761, wingScore = 2966 },
    SILVER      = { minScore = 1413, wingScore = 2358 },
    BRONZE      = { minScore =  333, wingScore =  771 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4133,
    CHALLENGER  = { minScore = 4001, wingScore = 4041 },
    GRANDMASTER = { minScore = 3888, wingScore = 3915 },
    MASTER      = { minScore = 3725, wingScore = 3783 },
    DIAMOND     = { minScore = 3495, wingScore = 3589 },
    EMERALD     = { minScore = 3325, wingScore = 3405 },
    PLATINUM    = { minScore = 3043, wingScore = 3151 },
    GOLD        = { minScore = 2671, wingScore = 2878 },
    SILVER      = { minScore = 1200, wingScore = 2147 },
    BRONZE      = { minScore =  325, wingScore =  665 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4133,
    CHALLENGER  = { minScore = 3852, wingScore = 4041 },
    GRANDMASTER = { minScore = 3805, wingScore = 3829 },
    MASTER      = { minScore = 3639, wingScore = 3722 },
    DIAMOND     = { minScore = 3496, wingScore = 3567 },
    EMERALD     = { minScore = 3304, wingScore = 3400 },
    PLATINUM    = { minScore = 3040, wingScore = 3141 },
    GOLD        = { minScore = 2671, wingScore = 2853 },
    SILVER      = { minScore = 1200, wingScore = 2147 },
    BRONZE      = { minScore =  325, wingScore =  665 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4133,
    CHALLENGER  = { minScore = 4035, wingScore = 4041 },
    GRANDMASTER = { minScore = 3980, wingScore = 4008 },
    MASTER      = { minScore = 3788, wingScore = 3884 },
    DIAMOND     = { minScore = 3629, wingScore = 3709 },
    EMERALD     = { minScore = 3417, wingScore = 3523 },
    PLATINUM    = { minScore = 3112, wingScore = 3231 },
    GOLD        = { minScore = 2671, wingScore = 2907 },
    SILVER      = { minScore = 1200, wingScore = 2147 },
    BRONZE      = { minScore =  325, wingScore =  665 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4189,
    CHALLENGER  = { minScore = 4017, wingScore = 4074 },
    GRANDMASTER = { minScore = 3911, wingScore = 3954 },
    MASTER      = { minScore = 3769, wingScore = 3831 },
    DIAMOND     = { minScore = 3547, wingScore = 3633 },
    EMERALD     = { minScore = 3384, wingScore = 3459 },
    PLATINUM    = { minScore = 3080, wingScore = 3208 },
    GOLD        = { minScore = 2724, wingScore = 2939 },
    SILVER      = { minScore = 1324, wingScore = 2270 },
    BRONZE      = { minScore =  330, wingScore =  727 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4189,
    CHALLENGER  = { minScore = 3891, wingScore = 4074 },
    GRANDMASTER = { minScore = 3845, wingScore = 3868 },
    MASTER      = { minScore = 3685, wingScore = 3765 },
    DIAMOND     = { minScore = 3548, wingScore = 3616 },
    EMERALD     = { minScore = 3363, wingScore = 3456 },
    PLATINUM    = { minScore = 3086, wingScore = 3197 },
    GOLD        = { minScore = 2724, wingScore = 2895 },
    SILVER      = { minScore = 1326, wingScore = 2272 },
    BRONZE      = { minScore =  330, wingScore =  728 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4189,
    CHALLENGER  = { minScore = 4064, wingScore = 4073 },
    GRANDMASTER = { minScore = 4014, wingScore = 4039 },
    MASTER      = { minScore = 3838, wingScore = 3925 },
    DIAMOND     = { minScore = 3682, wingScore = 3760 },
    EMERALD     = { minScore = 3474, wingScore = 3578 },
    PLATINUM    = { minScore = 3148, wingScore = 3281 },
    GOLD        = { minScore = 2723, wingScore = 2941 },
    SILVER      = { minScore = 1323, wingScore = 2268 },
    BRONZE      = { minScore =  330, wingScore =  726 },
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
