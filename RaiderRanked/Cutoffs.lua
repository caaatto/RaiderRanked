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
    top100Score = 3987,
    CHALLENGER  = { minScore = 3875, wingScore = 3908 },
    GRANDMASTER = { minScore = 3780, wingScore = 3809 },
    MASTER      = { minScore = 3663, wingScore = 3711 },
    DIAMOND     = { minScore = 3463, wingScore = 3545 },
    EMERALD     = { minScore = 3321, wingScore = 3390 },
    PLATINUM    = { minScore = 3040, wingScore = 3155 },
    GOLD        = { minScore = 2695, wingScore = 2878 },
    SILVER      = { minScore = 1335, wingScore = 2274 },
    BRONZE      = { minScore =  331, wingScore =  726 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3987,
    CHALLENGER  = { minScore = 3779, wingScore = 3908 },
    GRANDMASTER = { minScore = 3739, wingScore = 3759 },
    MASTER      = { minScore = 3598, wingScore = 3668 },
    DIAMOND     = { minScore = 3471, wingScore = 3534 },
    EMERALD     = { minScore = 3303, wingScore = 3387 },
    PLATINUM    = { minScore = 3046, wingScore = 3150 },
    GOLD        = { minScore = 2695, wingScore = 2866 },
    SILVER      = { minScore = 1335, wingScore = 2274 },
    BRONZE      = { minScore =  331, wingScore =  726 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3987,
    CHALLENGER  = { minScore = 3903, wingScore = 3908 },
    GRANDMASTER = { minScore = 3861, wingScore = 3882 },
    MASTER      = { minScore = 3713, wingScore = 3787 },
    DIAMOND     = { minScore = 3578, wingScore = 3646 },
    EMERALD     = { minScore = 3398, wingScore = 3488 },
    PLATINUM    = { minScore = 3106, wingScore = 3227 },
    GOLD        = { minScore = 2695, wingScore = 2908 },
    SILVER      = { minScore = 1335, wingScore = 2274 },
    BRONZE      = { minScore =  331, wingScore =  726 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3937,
    CHALLENGER  = { minScore = 3824, wingScore = 3885 },
    GRANDMASTER = { minScore = 3731, wingScore = 3773 },
    MASTER      = { minScore = 3597, wingScore = 3655 },
    DIAMOND     = { minScore = 3386, wingScore = 3463 },
    EMERALD     = { minScore = 3230, wingScore = 3303 },
    PLATINUM    = { minScore = 3004, wingScore = 3078 },
    GOLD        = { minScore = 2631, wingScore = 2791 },
    SILVER      = { minScore = 1147, wingScore = 2073 },
    BRONZE      = { minScore =  324, wingScore =  658 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3937,
    CHALLENGER  = { minScore = 3711, wingScore = 3885 },
    GRANDMASTER = { minScore = 3668, wingScore = 3690 },
    MASTER      = { minScore = 3517, wingScore = 3593 },
    DIAMOND     = { minScore = 3387, wingScore = 3452 },
    EMERALD     = { minScore = 3214, wingScore = 3300 },
    PLATINUM    = { minScore = 2947, wingScore = 3055 },
    GOLD        = { minScore = 2631, wingScore = 2773 },
    SILVER      = { minScore = 1147, wingScore = 2073 },
    BRONZE      = { minScore =  324, wingScore =  658 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3937,
    CHALLENGER  = { minScore = 3876, wingScore = 3885 },
    GRANDMASTER = { minScore = 3827, wingScore = 3852 },
    MASTER      = { minScore = 3657, wingScore = 3742 },
    DIAMOND     = { minScore = 3509, wingScore = 3583 },
    EMERALD     = { minScore = 3313, wingScore = 3411 },
    PLATINUM    = { minScore = 3031, wingScore = 3141 },
    GOLD        = { minScore = 2631, wingScore = 2843 },
    SILVER      = { minScore = 1147, wingScore = 2073 },
    BRONZE      = { minScore =  324, wingScore =  658 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3987,
    CHALLENGER  = { minScore = 3854, wingScore = 3898 },
    GRANDMASTER = { minScore = 3760, wingScore = 3794 },
    MASTER      = { minScore = 3635, wingScore = 3688 },
    DIAMOND     = { minScore = 3431, wingScore = 3511 },
    EMERALD     = { minScore = 3283, wingScore = 3354 },
    PLATINUM    = { minScore = 3025, wingScore = 3123 },
    GOLD        = { minScore = 2668, wingScore = 2842 },
    SILVER      = { minScore = 1256, wingScore = 2190 },
    BRONZE      = { minScore =  328, wingScore =  698 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3987,
    CHALLENGER  = { minScore = 3751, wingScore = 3899 },
    GRANDMASTER = { minScore = 3710, wingScore = 3731 },
    MASTER      = { minScore = 3565, wingScore = 3637 },
    DIAMOND     = { minScore = 3437, wingScore = 3500 },
    EMERALD     = { minScore = 3267, wingScore = 3351 },
    PLATINUM    = { minScore = 3005, wingScore = 3111 },
    GOLD        = { minScore = 2669, wingScore = 2828 },
    SILVER      = { minScore = 1258, wingScore = 2192 },
    BRONZE      = { minScore =  328, wingScore =  698 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3987,
    CHALLENGER  = { minScore = 3891, wingScore = 3898 },
    GRANDMASTER = { minScore = 3846, wingScore = 3869 },
    MASTER      = { minScore = 3689, wingScore = 3768 },
    DIAMOND     = { minScore = 3549, wingScore = 3619 },
    EMERALD     = { minScore = 3362, wingScore = 3455 },
    PLATINUM    = { minScore = 3074, wingScore = 3190 },
    GOLD        = { minScore = 2668, wingScore = 2880 },
    SILVER      = { minScore = 1255, wingScore = 2188 },
    BRONZE      = { minScore =  328, wingScore =  697 },
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
