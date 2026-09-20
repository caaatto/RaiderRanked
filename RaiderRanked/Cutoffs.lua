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
    top100Score = 3906,
    CHALLENGER  = { minScore = 3780, wingScore = 3827 },
    GRANDMASTER = { minScore = 3694, wingScore = 3733 },
    MASTER      = { minScore = 3578, wingScore = 3637 },
    DIAMOND     = { minScore = 3396, wingScore = 3463 },
    EMERALD     = { minScore = 3246, wingScore = 3315 },
    PLATINUM    = { minScore = 3001, wingScore = 3086 },
    GOLD        = { minScore = 2654, wingScore = 2798 },
    SILVER      = { minScore = 1277, wingScore = 2171 },
    BRONZE      = { minScore =  330, wingScore =  698 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3906,
    CHALLENGER  = { minScore = 3695, wingScore = 3827 },
    GRANDMASTER = { minScore = 3658, wingScore = 3677 },
    MASTER      = { minScore = 3529, wingScore = 3593 },
    DIAMOND     = { minScore = 3401, wingScore = 3465 },
    EMERALD     = { minScore = 3231, wingScore = 3316 },
    PLATINUM    = { minScore = 2958, wingScore = 3071 },
    GOLD        = { minScore = 2654, wingScore = 2791 },
    SILVER      = { minScore = 1277, wingScore = 2171 },
    BRONZE      = { minScore =  330, wingScore =  698 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3906,
    CHALLENGER  = { minScore = 3817, wingScore = 3827 },
    GRANDMASTER = { minScore = 3776, wingScore = 3796 },
    MASTER      = { minScore = 3634, wingScore = 3705 },
    DIAMOND     = { minScore = 3499, wingScore = 3566 },
    EMERALD     = { minScore = 3319, wingScore = 3409 },
    PLATINUM    = { minScore = 3027, wingScore = 3148 },
    GOLD        = { minScore = 2654, wingScore = 2840 },
    SILVER      = { minScore = 1277, wingScore = 2171 },
    BRONZE      = { minScore =  330, wingScore =  698 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3850,
    CHALLENGER  = { minScore = 3742, wingScore = 3784 },
    GRANDMASTER = { minScore = 3653, wingScore = 3680 },
    MASTER      = { minScore = 3522, wingScore = 3564 },
    DIAMOND     = { minScore = 3309, wingScore = 3394 },
    EMERALD     = { minScore = 3157, wingScore = 3224 },
    PLATINUM    = { minScore = 2922, wingScore = 3027 },
    GOLD        = { minScore = 2573, wingScore = 2724 },
    SILVER      = { minScore = 1073, wingScore = 1988 },
    BRONZE      = { minScore =  323, wingScore =  652 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3850,
    CHALLENGER  = { minScore = 3639, wingScore = 3784 },
    GRANDMASTER = { minScore = 3594, wingScore = 3616 },
    MASTER      = { minScore = 3435, wingScore = 3514 },
    DIAMOND     = { minScore = 3311, wingScore = 3373 },
    EMERALD     = { minScore = 3147, wingScore = 3229 },
    PLATINUM    = { minScore = 2873, wingScore = 2988 },
    GOLD        = { minScore = 2573, wingScore = 2696 },
    SILVER      = { minScore = 1073, wingScore = 1988 },
    BRONZE      = { minScore =  323, wingScore =  652 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3850,
    CHALLENGER  = { minScore = 3776, wingScore = 3784 },
    GRANDMASTER = { minScore = 3729, wingScore = 3753 },
    MASTER      = { minScore = 3565, wingScore = 3647 },
    DIAMOND     = { minScore = 3423, wingScore = 3494 },
    EMERALD     = { minScore = 3233, wingScore = 3328 },
    PLATINUM    = { minScore = 2943, wingScore = 3060 },
    GOLD        = { minScore = 2573, wingScore = 2765 },
    SILVER      = { minScore = 1073, wingScore = 1988 },
    BRONZE      = { minScore =  323, wingScore =  652 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3906,
    CHALLENGER  = { minScore = 3764, wingScore = 3809 },
    GRANDMASTER = { minScore = 3677, wingScore = 3711 },
    MASTER      = { minScore = 3554, wingScore = 3606 },
    DIAMOND     = { minScore = 3359, wingScore = 3434 },
    EMERALD     = { minScore = 3209, wingScore = 3277 },
    PLATINUM    = { minScore = 2968, wingScore = 3061 },
    GOLD        = { minScore = 2620, wingScore = 2767 },
    SILVER      = { minScore = 1191, wingScore = 2094 },
    BRONZE      = { minScore =  327, wingScore =  679 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3906,
    CHALLENGER  = { minScore = 3672, wingScore = 3809 },
    GRANDMASTER = { minScore = 3632, wingScore = 3652 },
    MASTER      = { minScore = 3490, wingScore = 3561 },
    DIAMOND     = { minScore = 3364, wingScore = 3427 },
    EMERALD     = { minScore = 3196, wingScore = 3280 },
    PLATINUM    = { minScore = 2923, wingScore = 3037 },
    GOLD        = { minScore = 2621, wingScore = 2752 },
    SILVER      = { minScore = 1193, wingScore = 2096 },
    BRONZE      = { minScore =  327, wingScore =  679 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3906,
    CHALLENGER  = { minScore = 3799, wingScore = 3809 },
    GRANDMASTER = { minScore = 3756, wingScore = 3778 },
    MASTER      = { minScore = 3604, wingScore = 3680 },
    DIAMOND     = { minScore = 3466, wingScore = 3535 },
    EMERALD     = { minScore = 3282, wingScore = 3374 },
    PLATINUM    = { minScore = 2991, wingScore = 3110 },
    GOLD        = { minScore = 2619, wingScore = 2808 },
    SILVER      = { minScore = 1189, wingScore = 2092 },
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
