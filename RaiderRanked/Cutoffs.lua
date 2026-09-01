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
    top100Score = 3629,
    CHALLENGER  = { minScore = 3534, wingScore = 3566 },
    GRANDMASTER = { minScore = 3452, wingScore = 3485 },
    MASTER      = { minScore = 3342, wingScore = 3392 },
    DIAMOND     = { minScore = 3142, wingScore = 3223 },
    EMERALD     = { minScore = 3014, wingScore = 3064 },
    PLATINUM    = { minScore = 2740, wingScore = 2854 },
    GOLD        = { minScore = 2409, wingScore = 2635 },
    SILVER      = { minScore = 977, wingScore = 1803 },
    BRONZE      = { minScore =  310, wingScore =  552 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3629,
    CHALLENGER  = { minScore = 3468, wingScore = 3566 },
    GRANDMASTER = { minScore = 3429, wingScore = 3449 },
    MASTER      = { minScore = 3293, wingScore = 3361 },
    DIAMOND     = { minScore = 3173, wingScore = 3233 },
    EMERALD     = { minScore = 3012, wingScore = 3092 },
    PLATINUM    = { minScore = 2754, wingScore = 2860 },
    GOLD        = { minScore = 2409, wingScore = 2568 },
    SILVER      = { minScore = 977, wingScore = 1803 },
    BRONZE      = { minScore =  310, wingScore =  552 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3629,
    CHALLENGER  = { minScore = 3560, wingScore = 3566 },
    GRANDMASTER = { minScore = 3522, wingScore = 3541 },
    MASTER      = { minScore = 3387, wingScore = 3455 },
    DIAMOND     = { minScore = 3260, wingScore = 3324 },
    EMERALD     = { minScore = 3090, wingScore = 3175 },
    PLATINUM    = { minScore = 2800, wingScore = 2923 },
    GOLD        = { minScore = 2409, wingScore = 2614 },
    SILVER      = { minScore = 977, wingScore = 1803 },
    BRONZE      = { minScore =  310, wingScore =  552 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3575,
    CHALLENGER  = { minScore = 3494, wingScore = 3542 },
    GRANDMASTER = { minScore = 3411, wingScore = 3438 },
    MASTER      = { minScore = 3286, wingScore = 3331 },
    DIAMOND     = { minScore = 3066, wingScore = 3148 },
    EMERALD     = { minScore = 2954, wingScore = 3009 },
    PLATINUM    = { minScore = 2684, wingScore = 2776 },
    GOLD        = { minScore = 2268, wingScore = 2559 },
    SILVER      = { minScore = 847, wingScore = 1594 },
    BRONZE      = { minScore =  310, wingScore =  492 },
    IRON        = { minScore =    1, wingScore =  167 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3575,
    CHALLENGER  = { minScore = 3415, wingScore = 3542 },
    GRANDMASTER = { minScore = 3369, wingScore = 3392 },
    MASTER      = { minScore = 3210, wingScore = 3290 },
    DIAMOND     = { minScore = 3081, wingScore = 3146 },
    EMERALD     = { minScore = 2908, wingScore = 2995 },
    PLATINUM    = { minScore = 2681, wingScore = 2766 },
    GOLD        = { minScore = 2268, wingScore = 2481 },
    SILVER      = { minScore = 847, wingScore = 1594 },
    BRONZE      = { minScore =  310, wingScore =  492 },
    IRON        = { minScore =    1, wingScore =  167 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3575,
    CHALLENGER  = { minScore = 3534, wingScore = 3542 },
    GRANDMASTER = { minScore = 3488, wingScore = 3511 },
    MASTER      = { minScore = 3329, wingScore = 3408 },
    DIAMOND     = { minScore = 3197, wingScore = 3263 },
    EMERALD     = { minScore = 3022, wingScore = 3109 },
    PLATINUM    = { minScore = 2745, wingScore = 2858 },
    GOLD        = { minScore = 2268, wingScore = 2537 },
    SILVER      = { minScore = 847, wingScore = 1594 },
    BRONZE      = { minScore =  310, wingScore =  492 },
    IRON        = { minScore =    1, wingScore =  167 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3629,
    CHALLENGER  = { minScore = 3517, wingScore = 3556 },
    GRANDMASTER = { minScore = 3435, wingScore = 3465 },
    MASTER      = { minScore = 3318, wingScore = 3366 },
    DIAMOND     = { minScore = 3110, wingScore = 3191 },
    EMERALD     = { minScore = 2989, wingScore = 3041 },
    PLATINUM    = { minScore = 2716, wingScore = 2821 },
    GOLD        = { minScore = 2349, wingScore = 2603 },
    SILVER      = { minScore = 922, wingScore = 1715 },
    BRONZE      = { minScore =  310, wingScore =  527 },
    IRON        = { minScore =    1, wingScore =  168 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3629,
    CHALLENGER  = { minScore = 3446, wingScore = 3556 },
    GRANDMASTER = { minScore = 3404, wingScore = 3425 },
    MASTER      = { minScore = 3259, wingScore = 3332 },
    DIAMOND     = { minScore = 3135, wingScore = 3197 },
    EMERALD     = { minScore = 2969, wingScore = 3052 },
    PLATINUM    = { minScore = 2724, wingScore = 2821 },
    GOLD        = { minScore = 2351, wingScore = 2532 },
    SILVER      = { minScore = 923, wingScore = 1717 },
    BRONZE      = { minScore =  310, wingScore =  527 },
    IRON        = { minScore =    1, wingScore =  168 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3629,
    CHALLENGER  = { minScore = 3549, wingScore = 3556 },
    GRANDMASTER = { minScore = 3507, wingScore = 3528 },
    MASTER      = { minScore = 3362, wingScore = 3435 },
    DIAMOND     = { minScore = 3233, wingScore = 3298 },
    EMERALD     = { minScore = 3061, wingScore = 3146 },
    PLATINUM    = { minScore = 2776, wingScore = 2895 },
    GOLD        = { minScore = 2348, wingScore = 2581 },
    SILVER      = { minScore = 921, wingScore = 1713 },
    BRONZE      = { minScore =  310, wingScore =  526 },
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
