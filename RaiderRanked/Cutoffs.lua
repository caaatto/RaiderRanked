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
    top100Score = 3869,
    CHALLENGER  = { minScore = 3748, wingScore = 3787 },
    GRANDMASTER = { minScore = 3660, wingScore = 3687 },
    MASTER      = { minScore = 3546, wingScore = 3587 },
    DIAMOND     = { minScore = 3355, wingScore = 3431 },
    EMERALD     = { minScore = 3210, wingScore = 3282 },
    PLATINUM    = { minScore = 2964, wingScore = 3053 },
    GOLD        = { minScore = 2638, wingScore = 2762 },
    SILVER      = { minScore = 1245, wingScore = 2129 },
    BRONZE      = { minScore =  331, wingScore =  692 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3869,
    CHALLENGER  = { minScore = 3663, wingScore = 3787 },
    GRANDMASTER = { minScore = 3624, wingScore = 3643 },
    MASTER      = { minScore = 3487, wingScore = 3555 },
    DIAMOND     = { minScore = 3361, wingScore = 3424 },
    EMERALD     = { minScore = 3193, wingScore = 3277 },
    PLATINUM    = { minScore = 2919, wingScore = 3033 },
    GOLD        = { minScore = 2638, wingScore = 2758 },
    SILVER      = { minScore = 1245, wingScore = 2129 },
    BRONZE      = { minScore =  331, wingScore =  692 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3869,
    CHALLENGER  = { minScore = 3779, wingScore = 3787 },
    GRANDMASTER = { minScore = 3736, wingScore = 3758 },
    MASTER      = { minScore = 3586, wingScore = 3661 },
    DIAMOND     = { minScore = 3455, wingScore = 3521 },
    EMERALD     = { minScore = 3281, wingScore = 3368 },
    PLATINUM    = { minScore = 2985, wingScore = 3110 },
    GOLD        = { minScore = 2638, wingScore = 2804 },
    SILVER      = { minScore = 1245, wingScore = 2129 },
    BRONZE      = { minScore =  331, wingScore =  692 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3798,
    CHALLENGER  = { minScore = 3695, wingScore = 3748 },
    GRANDMASTER = { minScore = 3613, wingScore = 3653 },
    MASTER      = { minScore = 3485, wingScore = 3536 },
    DIAMOND     = { minScore = 3276, wingScore = 3356 },
    EMERALD     = { minScore = 3121, wingScore = 3192 },
    PLATINUM    = { minScore = 2877, wingScore = 3008 },
    GOLD        = { minScore = 2543, wingScore = 2699 },
    SILVER      = { minScore = 1047, wingScore = 1942 },
    BRONZE      = { minScore =  324, wingScore =  651 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3798,
    CHALLENGER  = { minScore = 3599, wingScore = 3748 },
    GRANDMASTER = { minScore = 3557, wingScore = 3578 },
    MASTER      = { minScore = 3414, wingScore = 3486 },
    DIAMOND     = { minScore = 3288, wingScore = 3351 },
    EMERALD     = { minScore = 3121, wingScore = 3204 },
    PLATINUM    = { minScore = 2843, wingScore = 2959 },
    GOLD        = { minScore = 2543, wingScore = 2664 },
    SILVER      = { minScore = 1047, wingScore = 1942 },
    BRONZE      = { minScore =  324, wingScore =  651 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3798,
    CHALLENGER  = { minScore = 3740, wingScore = 3748 },
    GRANDMASTER = { minScore = 3695, wingScore = 3717 },
    MASTER      = { minScore = 3538, wingScore = 3616 },
    DIAMOND     = { minScore = 3394, wingScore = 3466 },
    EMERALD     = { minScore = 3201, wingScore = 3297 },
    PLATINUM    = { minScore = 2907, wingScore = 3025 },
    GOLD        = { minScore = 2543, wingScore = 2731 },
    SILVER      = { minScore = 1047, wingScore = 1942 },
    BRONZE      = { minScore =  324, wingScore =  651 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3869,
    CHALLENGER  = { minScore = 3726, wingScore = 3771 },
    GRANDMASTER = { minScore = 3640, wingScore = 3673 },
    MASTER      = { minScore = 3520, wingScore = 3565 },
    DIAMOND     = { minScore = 3322, wingScore = 3399 },
    EMERALD     = { minScore = 3172, wingScore = 3244 },
    PLATINUM    = { minScore = 2927, wingScore = 3034 },
    GOLD        = { minScore = 2598, wingScore = 2735 },
    SILVER      = { minScore = 1162, wingScore = 2050 },
    BRONZE      = { minScore =  328, wingScore =  675 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3869,
    CHALLENGER  = { minScore = 3637, wingScore = 3771 },
    GRANDMASTER = { minScore = 3596, wingScore = 3616 },
    MASTER      = { minScore = 3457, wingScore = 3527 },
    DIAMOND     = { minScore = 3331, wingScore = 3394 },
    EMERALD     = { minScore = 3163, wingScore = 3247 },
    PLATINUM    = { minScore = 2888, wingScore = 3003 },
    GOLD        = { minScore = 2599, wingScore = 2719 },
    SILVER      = { minScore = 1163, wingScore = 2052 },
    BRONZE      = { minScore =  328, wingScore =  675 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3869,
    CHALLENGER  = { minScore = 3762, wingScore = 3770 },
    GRANDMASTER = { minScore = 3718, wingScore = 3740 },
    MASTER      = { minScore = 3565, wingScore = 3642 },
    DIAMOND     = { minScore = 3429, wingScore = 3497 },
    EMERALD     = { minScore = 3247, wingScore = 3337 },
    PLATINUM    = { minScore = 2951, wingScore = 3073 },
    GOLD        = { minScore = 2597, wingScore = 2773 },
    SILVER      = { minScore = 1160, wingScore = 2048 },
    BRONZE      = { minScore =  328, wingScore =  674 },
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
