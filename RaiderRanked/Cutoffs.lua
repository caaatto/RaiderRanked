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
    top100Score = 3818,
    CHALLENGER  = { minScore = 3699, wingScore = 3756 },
    GRANDMASTER = { minScore = 3629, wingScore = 3656 },
    MASTER      = { minScore = 3518, wingScore = 3553 },
    DIAMOND     = { minScore = 3323, wingScore = 3404 },
    EMERALD     = { minScore = 3182, wingScore = 3245 },
    PLATINUM    = { minScore = 2929, wingScore = 3034 },
    GOLD        = { minScore = 2624, wingScore = 2742 },
    SILVER      = { minScore = 1177, wingScore = 2093 },
    BRONZE      = { minScore =  326, wingScore =  659 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3818,
    CHALLENGER  = { minScore = 3629, wingScore = 3756 },
    GRANDMASTER = { minScore = 3586, wingScore = 3608 },
    MASTER      = { minScore = 3439, wingScore = 3513 },
    DIAMOND     = { minScore = 3317, wingScore = 3378 },
    EMERALD     = { minScore = 3154, wingScore = 3236 },
    PLATINUM    = { minScore = 2883, wingScore = 2997 },
    GOLD        = { minScore = 2624, wingScore = 2726 },
    SILVER      = { minScore = 1177, wingScore = 2093 },
    BRONZE      = { minScore =  326, wingScore =  659 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3818,
    CHALLENGER  = { minScore = 3727, wingScore = 3756 },
    GRANDMASTER = { minScore = 3686, wingScore = 3706 },
    MASTER      = { minScore = 3542, wingScore = 3614 },
    DIAMOND     = { minScore = 3411, wingScore = 3477 },
    EMERALD     = { minScore = 3236, wingScore = 3324 },
    PLATINUM    = { minScore = 2944, wingScore = 3067 },
    GOLD        = { minScore = 2624, wingScore = 2772 },
    SILVER      = { minScore = 1177, wingScore = 2093 },
    BRONZE      = { minScore =  326, wingScore =  659 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3773,
    CHALLENGER  = { minScore = 3666, wingScore = 3707 },
    GRANDMASTER = { minScore = 3577, wingScore = 3617 },
    MASTER      = { minScore = 3451, wingScore = 3507 },
    DIAMOND     = { minScore = 3246, wingScore = 3328 },
    EMERALD     = { minScore = 3098, wingScore = 3164 },
    PLATINUM    = { minScore = 2848, wingScore = 2989 },
    GOLD        = { minScore = 2516, wingScore = 2683 },
    SILVER      = { minScore = 1005, wingScore = 1913 },
    BRONZE      = { minScore =  310, wingScore =  581 },
    IRON        = { minScore =    1, wingScore =  168 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3773,
    CHALLENGER  = { minScore = 3562, wingScore = 3707 },
    GRANDMASTER = { minScore = 3521, wingScore = 3542 },
    MASTER      = { minScore = 3375, wingScore = 3448 },
    DIAMOND     = { minScore = 3256, wingScore = 3316 },
    EMERALD     = { minScore = 3098, wingScore = 3177 },
    PLATINUM    = { minScore = 2821, wingScore = 2939 },
    GOLD        = { minScore = 2516, wingScore = 2636 },
    SILVER      = { minScore = 1005, wingScore = 1913 },
    BRONZE      = { minScore =  310, wingScore =  581 },
    IRON        = { minScore =    1, wingScore =  168 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3773,
    CHALLENGER  = { minScore = 3691, wingScore = 3707 },
    GRANDMASTER = { minScore = 3649, wingScore = 3670 },
    MASTER      = { minScore = 3502, wingScore = 3576 },
    DIAMOND     = { minScore = 3362, wingScore = 3432 },
    EMERALD     = { minScore = 3175, wingScore = 3268 },
    PLATINUM    = { minScore = 2881, wingScore = 3001 },
    GOLD        = { minScore = 2516, wingScore = 2704 },
    SILVER      = { minScore = 1005, wingScore = 1913 },
    BRONZE      = { minScore =  310, wingScore =  581 },
    IRON        = { minScore =    1, wingScore =  168 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3818,
    CHALLENGER  = { minScore = 3685, wingScore = 3735 },
    GRANDMASTER = { minScore = 3607, wingScore = 3640 },
    MASTER      = { minScore = 3490, wingScore = 3534 },
    DIAMOND     = { minScore = 3290, wingScore = 3372 },
    EMERALD     = { minScore = 3147, wingScore = 3211 },
    PLATINUM    = { minScore = 2895, wingScore = 3015 },
    GOLD        = { minScore = 2578, wingScore = 2717 },
    SILVER      = { minScore = 1104, wingScore = 2017 },
    BRONZE      = { minScore =  315, wingScore =  626 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3818,
    CHALLENGER  = { minScore = 3601, wingScore = 3736 },
    GRANDMASTER = { minScore = 3559, wingScore = 3581 },
    MASTER      = { minScore = 3413, wingScore = 3486 },
    DIAMOND     = { minScore = 3292, wingScore = 3352 },
    EMERALD     = { minScore = 3131, wingScore = 3212 },
    PLATINUM    = { minScore = 2857, wingScore = 2973 },
    GOLD        = { minScore = 2579, wingScore = 2689 },
    SILVER      = { minScore = 1106, wingScore = 2019 },
    BRONZE      = { minScore =  315, wingScore =  627 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3818,
    CHALLENGER  = { minScore = 3711, wingScore = 3735 },
    GRANDMASTER = { minScore = 3670, wingScore = 3690 },
    MASTER      = { minScore = 3525, wingScore = 3598 },
    DIAMOND     = { minScore = 3390, wingScore = 3458 },
    EMERALD     = { minScore = 3210, wingScore = 3300 },
    PLATINUM    = { minScore = 2917, wingScore = 3038 },
    GOLD        = { minScore = 2577, wingScore = 2743 },
    SILVER      = { minScore = 1103, wingScore = 2015 },
    BRONZE      = { minScore =  314, wingScore =  625 },
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
