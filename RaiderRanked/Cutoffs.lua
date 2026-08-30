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
    top100Score = 3585,
    CHALLENGER  = { minScore = 3493, wingScore = 3533 },
    GRANDMASTER = { minScore = 3419, wingScore = 3443 },
    MASTER      = { minScore = 3306, wingScore = 3346 },
    DIAMOND     = { minScore = 3099, wingScore = 3186 },
    EMERALD     = { minScore = 2988, wingScore = 3030 },
    PLATINUM    = { minScore = 2714, wingScore = 2814 },
    GOLD        = { minScore = 2343, wingScore = 2612 },
    SILVER      = { minScore = 937, wingScore = 1705 },
    BRONZE      = { minScore =  310, wingScore =  522 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3585,
    CHALLENGER  = { minScore = 3433, wingScore = 3533 },
    GRANDMASTER = { minScore = 3391, wingScore = 3412 },
    MASTER      = { minScore = 3244, wingScore = 3318 },
    DIAMOND     = { minScore = 3122, wingScore = 3183 },
    EMERALD     = { minScore = 2959, wingScore = 3040 },
    PLATINUM    = { minScore = 2723, wingScore = 2816 },
    GOLD        = { minScore = 2343, wingScore = 2536 },
    SILVER      = { minScore = 937, wingScore = 1705 },
    BRONZE      = { minScore =  310, wingScore =  522 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3585,
    CHALLENGER  = { minScore = 3526, wingScore = 3533 },
    GRANDMASTER = { minScore = 3485, wingScore = 3506 },
    MASTER      = { minScore = 3342, wingScore = 3413 },
    DIAMOND     = { minScore = 3218, wingScore = 3280 },
    EMERALD     = { minScore = 3052, wingScore = 3135 },
    PLATINUM    = { minScore = 2775, wingScore = 2892 },
    GOLD        = { minScore = 2343, wingScore = 2577 },
    SILVER      = { minScore = 937, wingScore = 1705 },
    BRONZE      = { minScore =  310, wingScore =  522 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3541,
    CHALLENGER  = { minScore = 3453, wingScore = 3505 },
    GRANDMASTER = { minScore = 3366, wingScore = 3403 },
    MASTER      = { minScore = 3241, wingScore = 3297 },
    DIAMOND     = { minScore = 3034, wingScore = 3106 },
    EMERALD     = { minScore = 2902, wingScore = 2980 },
    PLATINUM    = { minScore = 2663, wingScore = 2749 },
    GOLD        = { minScore = 2200, wingScore = 2506 },
    SILVER      = { minScore = 809, wingScore = 1511 },
    BRONZE      = { minScore =  310, wingScore =  472 },
    IRON        = { minScore =    1, wingScore =  166 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3541,
    CHALLENGER  = { minScore = 3369, wingScore = 3505 },
    GRANDMASTER = { minScore = 3324, wingScore = 3346 },
    MASTER      = { minScore = 3166, wingScore = 3245 },
    DIAMOND     = { minScore = 3038, wingScore = 3102 },
    EMERALD     = { minScore = 2868, wingScore = 2953 },
    PLATINUM    = { minScore = 2639, wingScore = 2725 },
    GOLD        = { minScore = 2200, wingScore = 2425 },
    SILVER      = { minScore = 809, wingScore = 1511 },
    BRONZE      = { minScore =  310, wingScore =  472 },
    IRON        = { minScore =    1, wingScore =  166 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3541,
    CHALLENGER  = { minScore = 3490, wingScore = 3505 },
    GRANDMASTER = { minScore = 3444, wingScore = 3467 },
    MASTER      = { minScore = 3286, wingScore = 3365 },
    DIAMOND     = { minScore = 3152, wingScore = 3219 },
    EMERALD     = { minScore = 2972, wingScore = 3062 },
    PLATINUM    = { minScore = 2714, wingScore = 2815 },
    GOLD        = { minScore = 2200, wingScore = 2501 },
    SILVER      = { minScore = 809, wingScore = 1511 },
    BRONZE      = { minScore =  310, wingScore =  472 },
    IRON        = { minScore =    1, wingScore =  166 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3585,
    CHALLENGER  = { minScore = 3476, wingScore = 3521 },
    GRANDMASTER = { minScore = 3397, wingScore = 3426 },
    MASTER      = { minScore = 3279, wingScore = 3325 },
    DIAMOND     = { minScore = 3072, wingScore = 3152 },
    EMERALD     = { minScore = 2952, wingScore = 3009 },
    PLATINUM    = { minScore = 2692, wingScore = 2787 },
    GOLD        = { minScore = 2283, wingScore = 2567 },
    SILVER      = { minScore = 883, wingScore = 1623 },
    BRONZE      = { minScore =  310, wingScore =  501 },
    IRON        = { minScore =    1, wingScore =  168 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3585,
    CHALLENGER  = { minScore = 3407, wingScore = 3521 },
    GRANDMASTER = { minScore = 3363, wingScore = 3385 },
    MASTER      = { minScore = 3212, wingScore = 3288 },
    DIAMOND     = { minScore = 3087, wingScore = 3150 },
    EMERALD     = { minScore = 2922, wingScore = 3004 },
    PLATINUM    = { minScore = 2688, wingScore = 2779 },
    GOLD        = { minScore = 2284, wingScore = 2490 },
    SILVER      = { minScore = 884, wingScore = 1625 },
    BRONZE      = { minScore =  310, wingScore =  501 },
    IRON        = { minScore =    1, wingScore =  168 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3585,
    CHALLENGER  = { minScore = 3511, wingScore = 3521 },
    GRANDMASTER = { minScore = 3467, wingScore = 3489 },
    MASTER      = { minScore = 3318, wingScore = 3392 },
    DIAMOND     = { minScore = 3190, wingScore = 3254 },
    EMERALD     = { minScore = 3018, wingScore = 3104 },
    PLATINUM    = { minScore = 2749, wingScore = 2859 },
    GOLD        = { minScore = 2282, wingScore = 2544 },
    SILVER      = { minScore = 882, wingScore = 1622 },
    BRONZE      = { minScore =  310, wingScore =  501 },
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
