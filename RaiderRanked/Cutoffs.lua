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
    top100Score = 4059,
    CHALLENGER  = { minScore = 3920, wingScore = 3978 },
    GRANDMASTER = { minScore = 3848, wingScore = 3890 },
    MASTER      = { minScore = 3726, wingScore = 3775 },
    DIAMOND     = { minScore = 3530, wingScore = 3602 },
    EMERALD     = { minScore = 3373, wingScore = 3438 },
    PLATINUM    = { minScore = 3075, wingScore = 3206 },
    GOLD        = { minScore = 2729, wingScore = 2938 },
    SILVER      = { minScore = 1369, wingScore = 2316 },
    BRONZE      = { minScore =  332, wingScore =  746 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4059,
    CHALLENGER  = { minScore = 3845, wingScore = 3978 },
    GRANDMASTER = { minScore = 3803, wingScore = 3824 },
    MASTER      = { minScore = 3657, wingScore = 3730 },
    DIAMOND     = { minScore = 3528, wingScore = 3593 },
    EMERALD     = { minScore = 3356, wingScore = 3442 },
    PLATINUM    = { minScore = 3093, wingScore = 3199 },
    GOLD        = { minScore = 2729, wingScore = 2905 },
    SILVER      = { minScore = 1369, wingScore = 2316 },
    BRONZE      = { minScore =  332, wingScore =  746 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4059,
    CHALLENGER  = { minScore = 3967, wingScore = 3978 },
    GRANDMASTER = { minScore = 3925, wingScore = 3946 },
    MASTER      = { minScore = 3777, wingScore = 3851 },
    DIAMOND     = { minScore = 3637, wingScore = 3707 },
    EMERALD     = { minScore = 3450, wingScore = 3543 },
    PLATINUM    = { minScore = 3138, wingScore = 3269 },
    GOLD        = { minScore = 2729, wingScore = 2938 },
    SILVER      = { minScore = 1369, wingScore = 2316 },
    BRONZE      = { minScore =  332, wingScore =  746 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4000,
    CHALLENGER  = { minScore = 3891, wingScore = 3926 },
    GRANDMASTER = { minScore = 3786, wingScore = 3823 },
    MASTER      = { minScore = 3658, wingScore = 3702 },
    DIAMOND     = { minScore = 3435, wingScore = 3527 },
    EMERALD     = { minScore = 3282, wingScore = 3349 },
    PLATINUM    = { minScore = 3024, wingScore = 3116 },
    GOLD        = { minScore = 2652, wingScore = 2839 },
    SILVER      = { minScore = 1173, wingScore = 2112 },
    BRONZE      = { minScore =  324, wingScore =  661 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4000,
    CHALLENGER  = { minScore = 3773, wingScore = 3926 },
    GRANDMASTER = { minScore = 3727, wingScore = 3750 },
    MASTER      = { minScore = 3567, wingScore = 3647 },
    DIAMOND     = { minScore = 3436, wingScore = 3502 },
    EMERALD     = { minScore = 3261, wingScore = 3348 },
    PLATINUM    = { minScore = 2999, wingScore = 3103 },
    GOLD        = { minScore = 2652, wingScore = 2818 },
    SILVER      = { minScore = 1173, wingScore = 2112 },
    BRONZE      = { minScore =  324, wingScore =  661 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4000,
    CHALLENGER  = { minScore = 3920, wingScore = 3926 },
    GRANDMASTER = { minScore = 3873, wingScore = 3897 },
    MASTER      = { minScore = 3710, wingScore = 3792 },
    DIAMOND     = { minScore = 3562, wingScore = 3636 },
    EMERALD     = { minScore = 3363, wingScore = 3462 },
    PLATINUM    = { minScore = 3083, wingScore = 3192 },
    GOLD        = { minScore = 2652, wingScore = 2887 },
    SILVER      = { minScore = 1173, wingScore = 2112 },
    BRONZE      = { minScore =  324, wingScore =  661 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4059,
    CHALLENGER  = { minScore = 3908, wingScore = 3956 },
    GRANDMASTER = { minScore = 3822, wingScore = 3862 },
    MASTER      = { minScore = 3698, wingScore = 3745 },
    DIAMOND     = { minScore = 3490, wingScore = 3571 },
    EMERALD     = { minScore = 3335, wingScore = 3401 },
    PLATINUM    = { minScore = 3054, wingScore = 3168 },
    GOLD        = { minScore = 2697, wingScore = 2897 },
    SILVER      = { minScore = 1287, wingScore = 2231 },
    BRONZE      = { minScore =  329, wingScore =  711 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4059,
    CHALLENGER  = { minScore = 3816, wingScore = 3957 },
    GRANDMASTER = { minScore = 3772, wingScore = 3794 },
    MASTER      = { minScore = 3620, wingScore = 3696 },
    DIAMOND     = { minScore = 3490, wingScore = 3556 },
    EMERALD     = { minScore = 3317, wingScore = 3404 },
    PLATINUM    = { minScore = 3055, wingScore = 3160 },
    GOLD        = { minScore = 2698, wingScore = 2870 },
    SILVER      = { minScore = 1289, wingScore = 2233 },
    BRONZE      = { minScore =  329, wingScore =  711 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4059,
    CHALLENGER  = { minScore = 3947, wingScore = 3956 },
    GRANDMASTER = { minScore = 3903, wingScore = 3925 },
    MASTER      = { minScore = 3749, wingScore = 3826 },
    DIAMOND     = { minScore = 3605, wingScore = 3677 },
    EMERALD     = { minScore = 3413, wingScore = 3509 },
    PLATINUM    = { minScore = 3115, wingScore = 3236 },
    GOLD        = { minScore = 2696, wingScore = 2916 },
    SILVER      = { minScore = 1286, wingScore = 2229 },
    BRONZE      = { minScore =  329, wingScore =  710 },
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
