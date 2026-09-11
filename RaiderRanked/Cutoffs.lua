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
    top100Score = 3801,
    CHALLENGER  = { minScore = 3683, wingScore = 3732 },
    GRANDMASTER = { minScore = 3611, wingScore = 3649 },
    MASTER      = { minScore = 3503, wingScore = 3542 },
    DIAMOND     = { minScore = 3314, wingScore = 3389 },
    EMERALD     = { minScore = 3168, wingScore = 3232 },
    PLATINUM    = { minScore = 2913, wingScore = 3025 },
    GOLD        = { minScore = 2617, wingScore = 2733 },
    SILVER      = { minScore = 1156, wingScore = 2078 },
    BRONZE      = { minScore =  325, wingScore =  654 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3801,
    CHALLENGER  = { minScore = 3614, wingScore = 3732 },
    GRANDMASTER = { minScore = 3574, wingScore = 3594 },
    MASTER      = { minScore = 3432, wingScore = 3503 },
    DIAMOND     = { minScore = 3309, wingScore = 3370 },
    EMERALD     = { minScore = 3145, wingScore = 3227 },
    PLATINUM    = { minScore = 2872, wingScore = 2987 },
    GOLD        = { minScore = 2617, wingScore = 2714 },
    SILVER      = { minScore = 1156, wingScore = 2078 },
    BRONZE      = { minScore =  325, wingScore =  654 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3801,
    CHALLENGER  = { minScore = 3711, wingScore = 3732 },
    GRANDMASTER = { minScore = 3673, wingScore = 3692 },
    MASTER      = { minScore = 3537, wingScore = 3605 },
    DIAMOND     = { minScore = 3404, wingScore = 3470 },
    EMERALD     = { minScore = 3226, wingScore = 3315 },
    PLATINUM    = { minScore = 2931, wingScore = 3054 },
    GOLD        = { minScore = 2617, wingScore = 2760 },
    SILVER      = { minScore = 1156, wingScore = 2078 },
    BRONZE      = { minScore =  325, wingScore =  654 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3763,
    CHALLENGER  = { minScore = 3655, wingScore = 3696 },
    GRANDMASTER = { minScore = 3565, wingScore = 3602 },
    MASTER      = { minScore = 3441, wingScore = 3495 },
    DIAMOND     = { minScore = 3237, wingScore = 3319 },
    EMERALD     = { minScore = 3089, wingScore = 3154 },
    PLATINUM    = { minScore = 2837, wingScore = 2979 },
    GOLD        = { minScore = 2504, wingScore = 2677 },
    SILVER      = { minScore = 995, wingScore = 1895 },
    BRONZE      = { minScore =  310, wingScore =  567 },
    IRON        = { minScore =    1, wingScore =  168 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3763,
    CHALLENGER  = { minScore = 3553, wingScore = 3696 },
    GRANDMASTER = { minScore = 3511, wingScore = 3532 },
    MASTER      = { minScore = 3364, wingScore = 3438 },
    DIAMOND     = { minScore = 3247, wingScore = 3306 },
    EMERALD     = { minScore = 3091, wingScore = 3169 },
    PLATINUM    = { minScore = 2814, wingScore = 2934 },
    GOLD        = { minScore = 2504, wingScore = 2627 },
    SILVER      = { minScore = 995, wingScore = 1895 },
    BRONZE      = { minScore =  310, wingScore =  567 },
    IRON        = { minScore =    1, wingScore =  168 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3763,
    CHALLENGER  = { minScore = 3680, wingScore = 3696 },
    GRANDMASTER = { minScore = 3638, wingScore = 3659 },
    MASTER      = { minScore = 3491, wingScore = 3564 },
    DIAMOND     = { minScore = 3352, wingScore = 3421 },
    EMERALD     = { minScore = 3166, wingScore = 3259 },
    PLATINUM    = { minScore = 2873, wingScore = 2993 },
    GOLD        = { minScore = 2504, wingScore = 2695 },
    SILVER      = { minScore = 995, wingScore = 1895 },
    BRONZE      = { minScore =  310, wingScore =  567 },
    IRON        = { minScore =    1, wingScore =  168 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3801,
    CHALLENGER  = { minScore = 3671, wingScore = 3717 },
    GRANDMASTER = { minScore = 3592, wingScore = 3629 },
    MASTER      = { minScore = 3477, wingScore = 3522 },
    DIAMOND     = { minScore = 3281, wingScore = 3359 },
    EMERALD     = { minScore = 3135, wingScore = 3199 },
    PLATINUM    = { minScore = 2881, wingScore = 3006 },
    GOLD        = { minScore = 2569, wingScore = 2709 },
    SILVER      = { minScore = 1088, wingScore = 2001 },
    BRONZE      = { minScore =  312, wingScore =  617 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3801,
    CHALLENGER  = { minScore = 3589, wingScore = 3717 },
    GRANDMASTER = { minScore = 3548, wingScore = 3568 },
    MASTER      = { minScore = 3404, wingScore = 3476 },
    DIAMOND     = { minScore = 3283, wingScore = 3344 },
    EMERALD     = { minScore = 3123, wingScore = 3203 },
    PLATINUM    = { minScore = 2848, wingScore = 2965 },
    GOLD        = { minScore = 2570, wingScore = 2678 },
    SILVER      = { minScore = 1089, wingScore = 2002 },
    BRONZE      = { minScore =  313, wingScore =  618 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3801,
    CHALLENGER  = { minScore = 3698, wingScore = 3716 },
    GRANDMASTER = { minScore = 3658, wingScore = 3678 },
    MASTER      = { minScore = 3517, wingScore = 3587 },
    DIAMOND     = { minScore = 3382, wingScore = 3449 },
    EMERALD     = { minScore = 3200, wingScore = 3291 },
    PLATINUM    = { minScore = 2906, wingScore = 3028 },
    GOLD        = { minScore = 2568, wingScore = 2732 },
    SILVER      = { minScore = 1086, wingScore = 1999 },
    BRONZE      = { minScore =  312, wingScore =  616 },
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
