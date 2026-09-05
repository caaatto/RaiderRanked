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
    top100Score = 3704,
    CHALLENGER  = { minScore = 3613, wingScore = 3656 },
    GRANDMASTER = { minScore = 3537, wingScore = 3561 },
    MASTER      = { minScore = 3422, wingScore = 3462 },
    DIAMOND     = { minScore = 3226, wingScore = 3309 },
    EMERALD     = { minScore = 3081, wingScore = 3146 },
    PLATINUM    = { minScore = 2816, wingScore = 2960 },
    GOLD        = { minScore = 2521, wingScore = 2675 },
    SILVER      = { minScore = 1021, wingScore = 1953 },
    BRONZE      = { minScore =  310, wingScore =  593 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3704,
    CHALLENGER  = { minScore = 3547, wingScore = 3656 },
    GRANDMASTER = { minScore = 3506, wingScore = 3526 },
    MASTER      = { minScore = 3360, wingScore = 3433 },
    DIAMOND     = { minScore = 3243, wingScore = 3302 },
    EMERALD     = { minScore = 3088, wingScore = 3166 },
    PLATINUM    = { minScore = 2812, wingScore = 2930 },
    GOLD        = { minScore = 2521, wingScore = 2637 },
    SILVER      = { minScore = 1021, wingScore = 1953 },
    BRONZE      = { minScore =  310, wingScore =  593 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3704,
    CHALLENGER  = { minScore = 3651, wingScore = 3656 },
    GRANDMASTER = { minScore = 3608, wingScore = 3629 },
    MASTER      = { minScore = 3457, wingScore = 3532 },
    DIAMOND     = { minScore = 3326, wingScore = 3391 },
    EMERALD     = { minScore = 3151, wingScore = 3238 },
    PLATINUM    = { minScore = 2859, wingScore = 2982 },
    GOLD        = { minScore = 2521, wingScore = 2687 },
    SILVER      = { minScore = 1021, wingScore = 1953 },
    BRONZE      = { minScore =  310, wingScore =  593 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3663,
    CHALLENGER  = { minScore = 3569, wingScore = 3620 },
    GRANDMASTER = { minScore = 3486, wingScore = 3524 },
    MASTER      = { minScore = 3364, wingScore = 3417 },
    DIAMOND     = { minScore = 3150, wingScore = 3233 },
    EMERALD     = { minScore = 3022, wingScore = 3073 },
    PLATINUM    = { minScore = 2751, wingScore = 2871 },
    GOLD        = { minScore = 2369, wingScore = 2626 },
    SILVER      = { minScore = 912, wingScore = 1710 },
    BRONZE      = { minScore =  310, wingScore =  511 },
    IRON        = { minScore =    1, wingScore =  167 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3663,
    CHALLENGER  = { minScore = 3478, wingScore = 3620 },
    GRANDMASTER = { minScore = 3436, wingScore = 3457 },
    MASTER      = { minScore = 3290, wingScore = 3363 },
    DIAMOND     = { minScore = 3170, wingScore = 3230 },
    EMERALD     = { minScore = 3010, wingScore = 3090 },
    PLATINUM    = { minScore = 2748, wingScore = 2857 },
    GOLD        = { minScore = 2369, wingScore = 2545 },
    SILVER      = { minScore = 912, wingScore = 1710 },
    BRONZE      = { minScore =  310, wingScore =  511 },
    IRON        = { minScore =    1, wingScore =  167 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3663,
    CHALLENGER  = { minScore = 3603, wingScore = 3620 },
    GRANDMASTER = { minScore = 3561, wingScore = 3582 },
    MASTER      = { minScore = 3414, wingScore = 3488 },
    DIAMOND     = { minScore = 3280, wingScore = 3347 },
    EMERALD     = { minScore = 3102, wingScore = 3191 },
    PLATINUM    = { minScore = 2806, wingScore = 2930 },
    GOLD        = { minScore = 2369, wingScore = 2606 },
    SILVER      = { minScore = 912, wingScore = 1710 },
    BRONZE      = { minScore =  310, wingScore =  511 },
    IRON        = { minScore =    1, wingScore =  167 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3704,
    CHALLENGER  = { minScore = 3595, wingScore = 3641 },
    GRANDMASTER = { minScore = 3516, wingScore = 3545 },
    MASTER      = { minScore = 3398, wingScore = 3443 },
    DIAMOND     = { minScore = 3194, wingScore = 3277 },
    EMERALD     = { minScore = 3056, wingScore = 3115 },
    PLATINUM    = { minScore = 2789, wingScore = 2923 },
    GOLD        = { minScore = 2457, wingScore = 2654 },
    SILVER      = { minScore = 975, wingScore = 1851 },
    BRONZE      = { minScore =  310, wingScore =  559 },
    IRON        = { minScore =    1, wingScore =  168 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3704,
    CHALLENGER  = { minScore = 3519, wingScore = 3641 },
    GRANDMASTER = { minScore = 3477, wingScore = 3498 },
    MASTER      = { minScore = 3331, wingScore = 3404 },
    DIAMOND     = { minScore = 3213, wingScore = 3272 },
    EMERALD     = { minScore = 3056, wingScore = 3135 },
    PLATINUM    = { minScore = 2786, wingScore = 2900 },
    GOLD        = { minScore = 2459, wingScore = 2599 },
    SILVER      = { minScore = 976, wingScore = 1853 },
    BRONZE      = { minScore =  310, wingScore =  559 },
    IRON        = { minScore =    1, wingScore =  168 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3704,
    CHALLENGER  = { minScore = 3630, wingScore = 3641 },
    GRANDMASTER = { minScore = 3588, wingScore = 3609 },
    MASTER      = { minScore = 3439, wingScore = 3513 },
    DIAMOND     = { minScore = 3306, wingScore = 3372 },
    EMERALD     = { minScore = 3130, wingScore = 3218 },
    PLATINUM    = { minScore = 2836, wingScore = 2960 },
    GOLD        = { minScore = 2456, wingScore = 2652 },
    SILVER      = { minScore = 974, wingScore = 1849 },
    BRONZE      = { minScore =  310, wingScore =  558 },
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
