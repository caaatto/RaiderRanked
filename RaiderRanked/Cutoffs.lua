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
    top100Score = 4029,
    CHALLENGER  = { minScore = 3900, wingScore = 3943 },
    GRANDMASTER = { minScore = 3818, wingScore = 3861 },
    MASTER      = { minScore = 3698, wingScore = 3758 },
    DIAMOND     = { minScore = 3504, wingScore = 3576 },
    EMERALD     = { minScore = 3352, wingScore = 3423 },
    PLATINUM    = { minScore = 3063, wingScore = 3191 },
    GOLD        = { minScore = 2718, wingScore = 2917 },
    SILVER      = { minScore = 1364, wingScore = 2309 },
    BRONZE      = { minScore =  332, wingScore =  743 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4029,
    CHALLENGER  = { minScore = 3816, wingScore = 3943 },
    GRANDMASTER = { minScore = 3777, wingScore = 3797 },
    MASTER      = { minScore = 3641, wingScore = 3709 },
    DIAMOND     = { minScore = 3511, wingScore = 3576 },
    EMERALD     = { minScore = 3338, wingScore = 3424 },
    PLATINUM    = { minScore = 3079, wingScore = 3182 },
    GOLD        = { minScore = 2718, wingScore = 2895 },
    SILVER      = { minScore = 1364, wingScore = 2309 },
    BRONZE      = { minScore =  332, wingScore =  743 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4029,
    CHALLENGER  = { minScore = 3938, wingScore = 3943 },
    GRANDMASTER = { minScore = 3899, wingScore = 3918 },
    MASTER      = { minScore = 3762, wingScore = 3831 },
    DIAMOND     = { minScore = 3621, wingScore = 3692 },
    EMERALD     = { minScore = 3432, wingScore = 3526 },
    PLATINUM    = { minScore = 3126, wingScore = 3253 },
    GOLD        = { minScore = 2718, wingScore = 2928 },
    SILVER      = { minScore = 1364, wingScore = 2309 },
    BRONZE      = { minScore =  332, wingScore =  743 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3974,
    CHALLENGER  = { minScore = 3872, wingScore = 3907 },
    GRANDMASTER = { minScore = 3773, wingScore = 3801 },
    MASTER      = { minScore = 3641, wingScore = 3683 },
    DIAMOND     = { minScore = 3420, wingScore = 3503 },
    EMERALD     = { minScore = 3264, wingScore = 3332 },
    PLATINUM    = { minScore = 3017, wingScore = 3104 },
    GOLD        = { minScore = 2646, wingScore = 2823 },
    SILVER      = { minScore = 1170, wingScore = 2103 },
    BRONZE      = { minScore =  324, wingScore =  661 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3974,
    CHALLENGER  = { minScore = 3756, wingScore = 3907 },
    GRANDMASTER = { minScore = 3709, wingScore = 3732 },
    MASTER      = { minScore = 3548, wingScore = 3629 },
    DIAMOND     = { minScore = 3417, wingScore = 3483 },
    EMERALD     = { minScore = 3243, wingScore = 3330 },
    PLATINUM    = { minScore = 2980, wingScore = 3086 },
    GOLD        = { minScore = 2646, wingScore = 2803 },
    SILVER      = { minScore = 1170, wingScore = 2103 },
    BRONZE      = { minScore =  324, wingScore =  661 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3974,
    CHALLENGER  = { minScore = 3902, wingScore = 3907 },
    GRANDMASTER = { minScore = 3854, wingScore = 3878 },
    MASTER      = { minScore = 3687, wingScore = 3771 },
    DIAMOND     = { minScore = 3540, wingScore = 3613 },
    EMERALD     = { minScore = 3344, wingScore = 3442 },
    PLATINUM    = { minScore = 3066, wingScore = 3174 },
    GOLD        = { minScore = 2646, wingScore = 2873 },
    SILVER      = { minScore = 1170, wingScore = 2103 },
    BRONZE      = { minScore =  324, wingScore =  661 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4029,
    CHALLENGER  = { minScore = 3888, wingScore = 3928 },
    GRANDMASTER = { minScore = 3799, wingScore = 3836 },
    MASTER      = { minScore = 3674, wingScore = 3727 },
    DIAMOND     = { minScore = 3469, wingScore = 3546 },
    EMERALD     = { minScore = 3315, wingScore = 3385 },
    PLATINUM    = { minScore = 3044, wingScore = 3155 },
    GOLD        = { minScore = 2688, wingScore = 2878 },
    SILVER      = { minScore = 1283, wingScore = 2223 },
    BRONZE      = { minScore =  329, wingScore =  709 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4029,
    CHALLENGER  = { minScore = 3791, wingScore = 3928 },
    GRANDMASTER = { minScore = 3749, wingScore = 3770 },
    MASTER      = { minScore = 3603, wingScore = 3676 },
    DIAMOND     = { minScore = 3473, wingScore = 3538 },
    EMERALD     = { minScore = 3299, wingScore = 3386 },
    PLATINUM    = { minScore = 3039, wingScore = 3143 },
    GOLD        = { minScore = 2689, wingScore = 2857 },
    SILVER      = { minScore = 1285, wingScore = 2225 },
    BRONZE      = { minScore =  329, wingScore =  709 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4029,
    CHALLENGER  = { minScore = 3923, wingScore = 3928 },
    GRANDMASTER = { minScore = 3880, wingScore = 3901 },
    MASTER      = { minScore = 3730, wingScore = 3805 },
    DIAMOND     = { minScore = 3586, wingScore = 3658 },
    EMERALD     = { minScore = 3395, wingScore = 3490 },
    PLATINUM    = { minScore = 3100, wingScore = 3219 },
    GOLD        = { minScore = 2687, wingScore = 2905 },
    SILVER      = { minScore = 1281, wingScore = 2221 },
    BRONZE      = { minScore =  329, wingScore =  708 },
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
