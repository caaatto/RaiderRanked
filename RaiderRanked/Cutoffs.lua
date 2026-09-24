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
    top100Score = 3921,
    CHALLENGER  = { minScore = 3803, wingScore = 3851 },
    GRANDMASTER = { minScore = 3729, wingScore = 3768 },
    MASTER      = { minScore = 3610, wingScore = 3657 },
    DIAMOND     = { minScore = 3419, wingScore = 3492 },
    EMERALD     = { minScore = 3273, wingScore = 3336 },
    PLATINUM    = { minScore = 3013, wingScore = 3106 },
    GOLD        = { minScore = 2664, wingScore = 2823 },
    SILVER      = { minScore = 1293, wingScore = 2197 },
    BRONZE      = { minScore =  330, wingScore =  695 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3921,
    CHALLENGER  = { minScore = 3730, wingScore = 3851 },
    GRANDMASTER = { minScore = 3689, wingScore = 3709 },
    MASTER      = { minScore = 3545, wingScore = 3617 },
    DIAMOND     = { minScore = 3421, wingScore = 3483 },
    EMERALD     = { minScore = 3256, wingScore = 3339 },
    PLATINUM    = { minScore = 2988, wingScore = 3099 },
    GOLD        = { minScore = 2664, wingScore = 2815 },
    SILVER      = { minScore = 1293, wingScore = 2197 },
    BRONZE      = { minScore =  330, wingScore =  695 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3921,
    CHALLENGER  = { minScore = 3845, wingScore = 3851 },
    GRANDMASTER = { minScore = 3803, wingScore = 3824 },
    MASTER      = { minScore = 3657, wingScore = 3730 },
    DIAMOND     = { minScore = 3523, wingScore = 3590 },
    EMERALD     = { minScore = 3343, wingScore = 3433 },
    PLATINUM    = { minScore = 3057, wingScore = 3175 },
    GOLD        = { minScore = 2664, wingScore = 2866 },
    SILVER      = { minScore = 1293, wingScore = 2197 },
    BRONZE      = { minScore =  330, wingScore =  695 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3883,
    CHALLENGER  = { minScore = 3773, wingScore = 3812 },
    GRANDMASTER = { minScore = 3672, wingScore = 3710 },
    MASTER      = { minScore = 3543, wingScore = 3593 },
    DIAMOND     = { minScore = 3332, wingScore = 3418 },
    EMERALD     = { minScore = 3183, wingScore = 3248 },
    PLATINUM    = { minScore = 2956, wingScore = 3043 },
    GOLD        = { minScore = 2595, wingScore = 2745 },
    SILVER      = { minScore = 1091, wingScore = 2013 },
    BRONZE      = { minScore =  322, wingScore =  650 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3883,
    CHALLENGER  = { minScore = 3659, wingScore = 3812 },
    GRANDMASTER = { minScore = 3614, wingScore = 3637 },
    MASTER      = { minScore = 3459, wingScore = 3537 },
    DIAMOND     = { minScore = 3335, wingScore = 3397 },
    EMERALD     = { minScore = 3169, wingScore = 3252 },
    PLATINUM    = { minScore = 2898, wingScore = 3011 },
    GOLD        = { minScore = 2595, wingScore = 2722 },
    SILVER      = { minScore = 1091, wingScore = 2013 },
    BRONZE      = { minScore =  322, wingScore =  650 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3883,
    CHALLENGER  = { minScore = 3806, wingScore = 3812 },
    GRANDMASTER = { minScore = 3759, wingScore = 3783 },
    MASTER      = { minScore = 3597, wingScore = 3678 },
    DIAMOND     = { minScore = 3453, wingScore = 3525 },
    EMERALD     = { minScore = 3262, wingScore = 3357 },
    PLATINUM    = { minScore = 2974, wingScore = 3089 },
    GOLD        = { minScore = 2595, wingScore = 2793 },
    SILVER      = { minScore = 1091, wingScore = 2013 },
    BRONZE      = { minScore =  322, wingScore =  650 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3921,
    CHALLENGER  = { minScore = 3790, wingScore = 3835 },
    GRANDMASTER = { minScore = 3705, wingScore = 3744 },
    MASTER      = { minScore = 3582, wingScore = 3630 },
    DIAMOND     = { minScore = 3383, wingScore = 3461 },
    EMERALD     = { minScore = 3235, wingScore = 3299 },
    PLATINUM    = { minScore = 2989, wingScore = 3080 },
    GOLD        = { minScore = 2635, wingScore = 2790 },
    SILVER      = { minScore = 1208, wingScore = 2120 },
    BRONZE      = { minScore =  327, wingScore =  676 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3921,
    CHALLENGER  = { minScore = 3701, wingScore = 3835 },
    GRANDMASTER = { minScore = 3658, wingScore = 3679 },
    MASTER      = { minScore = 3510, wingScore = 3584 },
    DIAMOND     = { minScore = 3386, wingScore = 3448 },
    EMERALD     = { minScore = 3220, wingScore = 3303 },
    PLATINUM    = { minScore = 2951, wingScore = 3063 },
    GOLD        = { minScore = 2636, wingScore = 2777 },
    SILVER      = { minScore = 1210, wingScore = 2122 },
    BRONZE      = { minScore =  327, wingScore =  677 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3921,
    CHALLENGER  = { minScore = 3828, wingScore = 3834 },
    GRANDMASTER = { minScore = 3784, wingScore = 3806 },
    MASTER      = { minScore = 3631, wingScore = 3708 },
    DIAMOND     = { minScore = 3493, wingScore = 3562 },
    EMERALD     = { minScore = 3308, wingScore = 3400 },
    PLATINUM    = { minScore = 3021, wingScore = 3138 },
    GOLD        = { minScore = 2634, wingScore = 2835 },
    SILVER      = { minScore = 1207, wingScore = 2118 },
    BRONZE      = { minScore =  327, wingScore =  676 },
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
