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
    top100Score = 3909,
    CHALLENGER  = { minScore = 3787, wingScore = 3833 },
    GRANDMASTER = { minScore = 3706, wingScore = 3746 },
    MASTER      = { minScore = 3589, wingScore = 3649 },
    DIAMOND     = { minScore = 3406, wingScore = 3473 },
    EMERALD     = { minScore = 3257, wingScore = 3322 },
    PLATINUM    = { minScore = 3006, wingScore = 3093 },
    GOLD        = { minScore = 2658, wingScore = 2807 },
    SILVER      = { minScore = 1285, wingScore = 2181 },
    BRONZE      = { minScore =  330, wingScore =  699 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3909,
    CHALLENGER  = { minScore = 3707, wingScore = 3833 },
    GRANDMASTER = { minScore = 3669, wingScore = 3688 },
    MASTER      = { minScore = 3535, wingScore = 3602 },
    DIAMOND     = { minScore = 3409, wingScore = 3472 },
    EMERALD     = { minScore = 3240, wingScore = 3324 },
    PLATINUM    = { minScore = 2968, wingScore = 3081 },
    GOLD        = { minScore = 2658, wingScore = 2798 },
    SILVER      = { minScore = 1285, wingScore = 2181 },
    BRONZE      = { minScore =  330, wingScore =  699 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3909,
    CHALLENGER  = { minScore = 3823, wingScore = 3833 },
    GRANDMASTER = { minScore = 3783, wingScore = 3803 },
    MASTER      = { minScore = 3644, wingScore = 3714 },
    DIAMOND     = { minScore = 3508, wingScore = 3576 },
    EMERALD     = { minScore = 3327, wingScore = 3418 },
    PLATINUM    = { minScore = 3038, wingScore = 3157 },
    GOLD        = { minScore = 2658, wingScore = 2849 },
    SILVER      = { minScore = 1285, wingScore = 2181 },
    BRONZE      = { minScore =  330, wingScore =  699 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3859,
    CHALLENGER  = { minScore = 3752, wingScore = 3790 },
    GRANDMASTER = { minScore = 3657, wingScore = 3687 },
    MASTER      = { minScore = 3531, wingScore = 3572 },
    DIAMOND     = { minScore = 3317, wingScore = 3404 },
    EMERALD     = { minScore = 3165, wingScore = 3232 },
    PLATINUM    = { minScore = 2933, wingScore = 3031 },
    GOLD        = { minScore = 2580, wingScore = 2730 },
    SILVER      = { minScore = 1079, wingScore = 1999 },
    BRONZE      = { minScore =  323, wingScore =  651 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3859,
    CHALLENGER  = { minScore = 3648, wingScore = 3790 },
    GRANDMASTER = { minScore = 3602, wingScore = 3625 },
    MASTER      = { minScore = 3441, wingScore = 3522 },
    DIAMOND     = { minScore = 3318, wingScore = 3379 },
    EMERALD     = { minScore = 3153, wingScore = 3235 },
    PLATINUM    = { minScore = 2880, wingScore = 2994 },
    GOLD        = { minScore = 2580, wingScore = 2704 },
    SILVER      = { minScore = 1079, wingScore = 1999 },
    BRONZE      = { minScore =  323, wingScore =  651 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3859,
    CHALLENGER  = { minScore = 3784, wingScore = 3790 },
    GRANDMASTER = { minScore = 3737, wingScore = 3761 },
    MASTER      = { minScore = 3574, wingScore = 3656 },
    DIAMOND     = { minScore = 3431, wingScore = 3502 },
    EMERALD     = { minScore = 3241, wingScore = 3336 },
    PLATINUM    = { minScore = 2952, wingScore = 3068 },
    GOLD        = { minScore = 2580, wingScore = 2774 },
    SILVER      = { minScore = 1079, wingScore = 1999 },
    BRONZE      = { minScore =  323, wingScore =  651 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3909,
    CHALLENGER  = { minScore = 3772, wingScore = 3815 },
    GRANDMASTER = { minScore = 3685, wingScore = 3721 },
    MASTER      = { minScore = 3565, wingScore = 3617 },
    DIAMOND     = { minScore = 3369, wingScore = 3444 },
    EMERALD     = { minScore = 3218, wingScore = 3284 },
    PLATINUM    = { minScore = 2975, wingScore = 3067 },
    GOLD        = { minScore = 2625, wingScore = 2775 },
    SILVER      = { minScore = 1198, wingScore = 2105 },
    BRONZE      = { minScore =  327, wingScore =  679 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3909,
    CHALLENGER  = { minScore = 3683, wingScore = 3815 },
    GRANDMASTER = { minScore = 3641, wingScore = 3662 },
    MASTER      = { minScore = 3496, wingScore = 3569 },
    DIAMOND     = { minScore = 3372, wingScore = 3434 },
    EMERALD     = { minScore = 3204, wingScore = 3287 },
    PLATINUM    = { minScore = 2932, wingScore = 3045 },
    GOLD        = { minScore = 2626, wingScore = 2759 },
    SILVER      = { minScore = 1200, wingScore = 2106 },
    BRONZE      = { minScore =  327, wingScore =  679 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3909,
    CHALLENGER  = { minScore = 3806, wingScore = 3815 },
    GRANDMASTER = { minScore = 3763, wingScore = 3785 },
    MASTER      = { minScore = 3614, wingScore = 3689 },
    DIAMOND     = { minScore = 3475, wingScore = 3544 },
    EMERALD     = { minScore = 3290, wingScore = 3383 },
    PLATINUM    = { minScore = 3001, wingScore = 3119 },
    GOLD        = { minScore = 2625, wingScore = 2817 },
    SILVER      = { minScore = 1197, wingScore = 2103 },
    BRONZE      = { minScore =  327, wingScore =  678 },
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
