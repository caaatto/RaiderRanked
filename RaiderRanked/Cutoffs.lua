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
    top100Score = 3658,
    CHALLENGER  = { minScore = 3556, wingScore = 3603 },
    GRANDMASTER = { minScore = 3484, wingScore = 3522 },
    MASTER      = { minScore = 3375, wingScore = 3419 },
    DIAMOND     = { minScore = 3181, wingScore = 3257 },
    EMERALD     = { minScore = 3038, wingScore = 3094 },
    PLATINUM    = { minScore = 2768, wingScore = 2895 },
    GOLD        = { minScore = 2460, wingScore = 2651 },
    SILVER      = { minScore = 989, wingScore = 1863 },
    BRONZE      = { minScore =  310, wingScore =  563 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3658,
    CHALLENGER  = { minScore = 3504, wingScore = 3603 },
    GRANDMASTER = { minScore = 3462, wingScore = 3483 },
    MASTER      = { minScore = 3315, wingScore = 3388 },
    DIAMOND     = { minScore = 3199, wingScore = 3257 },
    EMERALD     = { minScore = 3044, wingScore = 3122 },
    PLATINUM    = { minScore = 2777, wingScore = 2891 },
    GOLD        = { minScore = 2460, wingScore = 2595 },
    SILVER      = { minScore = 989, wingScore = 1863 },
    BRONZE      = { minScore =  310, wingScore =  563 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3658,
    CHALLENGER  = { minScore = 3586, wingScore = 3603 },
    GRANDMASTER = { minScore = 3549, wingScore = 3567 },
    MASTER      = { minScore = 3417, wingScore = 3483 },
    DIAMOND     = { minScore = 3286, wingScore = 3351 },
    EMERALD     = { minScore = 3110, wingScore = 3198 },
    PLATINUM    = { minScore = 2819, wingScore = 2941 },
    GOLD        = { minScore = 2460, wingScore = 2641 },
    SILVER      = { minScore = 989, wingScore = 1863 },
    BRONZE      = { minScore =  310, wingScore =  563 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3623,
    CHALLENGER  = { minScore = 3532, wingScore = 3571 },
    GRANDMASTER = { minScore = 3438, wingScore = 3472 },
    MASTER      = { minScore = 3319, wingScore = 3365 },
    DIAMOND     = { minScore = 3105, wingScore = 3192 },
    EMERALD     = { minScore = 2998, wingScore = 3036 },
    PLATINUM    = { minScore = 2715, wingScore = 2823 },
    GOLD        = { minScore = 2316, wingScore = 2597 },
    SILVER      = { minScore = 869, wingScore = 1644 },
    BRONZE      = { minScore =  310, wingScore =  498 },
    IRON        = { minScore =    1, wingScore =  167 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3623,
    CHALLENGER  = { minScore = 3435, wingScore = 3571 },
    GRANDMASTER = { minScore = 3393, wingScore = 3414 },
    MASTER      = { minScore = 3245, wingScore = 3319 },
    DIAMOND     = { minScore = 3120, wingScore = 3182 },
    EMERALD     = { minScore = 2953, wingScore = 3037 },
    PLATINUM    = { minScore = 2712, wingScore = 2807 },
    GOLD        = { minScore = 2316, wingScore = 2512 },
    SILVER      = { minScore = 869, wingScore = 1644 },
    BRONZE      = { minScore =  310, wingScore =  498 },
    IRON        = { minScore =    1, wingScore =  167 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3623,
    CHALLENGER  = { minScore = 3561, wingScore = 3571 },
    GRANDMASTER = { minScore = 3517, wingScore = 3539 },
    MASTER      = { minScore = 3361, wingScore = 3439 },
    DIAMOND     = { minScore = 3233, wingScore = 3297 },
    EMERALD     = { minScore = 3062, wingScore = 3148 },
    PLATINUM    = { minScore = 2774, wingScore = 2896 },
    GOLD        = { minScore = 2316, wingScore = 2565 },
    SILVER      = { minScore = 869, wingScore = 1644 },
    BRONZE      = { minScore =  310, wingScore =  498 },
    IRON        = { minScore =    1, wingScore =  167 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3658,
    CHALLENGER  = { minScore = 3546, wingScore = 3590 },
    GRANDMASTER = { minScore = 3465, wingScore = 3501 },
    MASTER      = { minScore = 3351, wingScore = 3396 },
    DIAMOND     = { minScore = 3149, wingScore = 3230 },
    EMERALD     = { minScore = 3021, wingScore = 3070 },
    PLATINUM    = { minScore = 2746, wingScore = 2865 },
    GOLD        = { minScore = 2399, wingScore = 2628 },
    SILVER      = { minScore = 939, wingScore = 1771 },
    BRONZE      = { minScore =  310, wingScore =  536 },
    IRON        = { minScore =    1, wingScore =  168 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3658,
    CHALLENGER  = { minScore = 3476, wingScore = 3590 },
    GRANDMASTER = { minScore = 3434, wingScore = 3455 },
    MASTER      = { minScore = 3286, wingScore = 3360 },
    DIAMOND     = { minScore = 3167, wingScore = 3226 },
    EMERALD     = { minScore = 3007, wingScore = 3087 },
    PLATINUM    = { minScore = 2750, wingScore = 2857 },
    GOLD        = { minScore = 2401, wingScore = 2561 },
    SILVER      = { minScore = 940, wingScore = 1773 },
    BRONZE      = { minScore =  310, wingScore =  536 },
    IRON        = { minScore =    1, wingScore =  168 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3658,
    CHALLENGER  = { minScore = 3575, wingScore = 3589 },
    GRANDMASTER = { minScore = 3535, wingScore = 3555 },
    MASTER      = { minScore = 3393, wingScore = 3464 },
    DIAMOND     = { minScore = 3263, wingScore = 3328 },
    EMERALD     = { minScore = 3089, wingScore = 3177 },
    PLATINUM    = { minScore = 2800, wingScore = 2922 },
    GOLD        = { minScore = 2398, wingScore = 2608 },
    SILVER      = { minScore = 937, wingScore = 1769 },
    BRONZE      = { minScore =  310, wingScore =  535 },
    IRON        = { minScore =    1, wingScore =  168 },
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
