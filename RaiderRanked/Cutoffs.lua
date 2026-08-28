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
    top100Score = 3505,
    CHALLENGER  = { minScore = 3413, wingScore = 3451 },
    GRANDMASTER = { minScore = 3334, wingScore = 3367 },
    MASTER      = { minScore = 3218, wingScore = 3267 },
    DIAMOND     = { minScore = 3030, wingScore = 3096 },
    EMERALD     = { minScore = 2899, wingScore = 2974 },
    PLATINUM    = { minScore = 2674, wingScore = 2749 },
    GOLD        = { minScore = 2259, wingScore = 2550 },
    SILVER      = { minScore = 870, wingScore = 1606 },
    BRONZE      = { minScore =  310, wingScore =  496 },
    IRON        = { minScore =    1, wingScore =  168 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3505,
    CHALLENGER  = { minScore = 3358, wingScore = 3451 },
    GRANDMASTER = { minScore = 3315, wingScore = 3337 },
    MASTER      = { minScore = 3166, wingScore = 3241 },
    DIAMOND     = { minScore = 3043, wingScore = 3104 },
    EMERALD     = { minScore = 2878, wingScore = 2960 },
    PLATINUM    = { minScore = 2672, wingScore = 2747 },
    GOLD        = { minScore = 2259, wingScore = 2482 },
    SILVER      = { minScore = 870, wingScore = 1606 },
    BRONZE      = { minScore =  310, wingScore =  496 },
    IRON        = { minScore =    1, wingScore =  168 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3505,
    CHALLENGER  = { minScore = 3440, wingScore = 3451 },
    GRANDMASTER = { minScore = 3400, wingScore = 3420 },
    MASTER      = { minScore = 3259, wingScore = 3329 },
    DIAMOND     = { minScore = 3131, wingScore = 3195 },
    EMERALD     = { minScore = 2961, wingScore = 3046 },
    PLATINUM    = { minScore = 2720, wingScore = 2814 },
    GOLD        = { minScore = 2259, wingScore = 2526 },
    SILVER      = { minScore = 870, wingScore = 1606 },
    BRONZE      = { minScore =  310, wingScore =  496 },
    IRON        = { minScore =    1, wingScore =  168 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3485,
    CHALLENGER  = { minScore = 3404, wingScore = 3444 },
    GRANDMASTER = { minScore = 3311, wingScore = 3347 },
    MASTER      = { minScore = 3183, wingScore = 3234 },
    DIAMOND     = { minScore = 3003, wingScore = 3056 },
    EMERALD     = { minScore = 2840, wingScore = 2919 },
    PLATINUM    = { minScore = 2634, wingScore = 2709 },
    GOLD        = { minScore = 2119, wingScore = 2423 },
    SILVER      = { minScore = 761, wingScore = 1417 },
    BRONZE      = { minScore =  310, wingScore =  465 },
    IRON        = { minScore =    1, wingScore =  166 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3485,
    CHALLENGER  = { minScore = 3319, wingScore = 3444 },
    GRANDMASTER = { minScore = 3272, wingScore = 3295 },
    MASTER      = { minScore = 3108, wingScore = 3190 },
    DIAMOND     = { minScore = 2984, wingScore = 3046 },
    EMERALD     = { minScore = 2820, wingScore = 2902 },
    PLATINUM    = { minScore = 2583, wingScore = 2676 },
    GOLD        = { minScore = 2119, wingScore = 2358 },
    SILVER      = { minScore = 761, wingScore = 1417 },
    BRONZE      = { minScore =  310, wingScore =  465 },
    IRON        = { minScore =    1, wingScore =  166 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3485,
    CHALLENGER  = { minScore = 3430, wingScore = 3444 },
    GRANDMASTER = { minScore = 3384, wingScore = 3407 },
    MASTER      = { minScore = 3222, wingScore = 3303 },
    DIAMOND     = { minScore = 3089, wingScore = 3156 },
    EMERALD     = { minScore = 2912, wingScore = 3001 },
    PLATINUM    = { minScore = 2670, wingScore = 2762 },
    GOLD        = { minScore = 2119, wingScore = 2450 },
    SILVER      = { minScore = 761, wingScore = 1417 },
    BRONZE      = { minScore =  310, wingScore =  465 },
    IRON        = { minScore =    1, wingScore =  166 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3505,
    CHALLENGER  = { minScore = 3409, wingScore = 3448 },
    GRANDMASTER = { minScore = 3324, wingScore = 3359 },
    MASTER      = { minScore = 3203, wingScore = 3253 },
    DIAMOND     = { minScore = 3019, wingScore = 3079 },
    EMERALD     = { minScore = 2874, wingScore = 2951 },
    PLATINUM    = { minScore = 2657, wingScore = 2732 },
    GOLD        = { minScore = 2200, wingScore = 2496 },
    SILVER      = { minScore = 824, wingScore = 1526 },
    BRONZE      = { minScore =  310, wingScore =  468 },
    IRON        = { minScore =    1, wingScore =  167 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3505,
    CHALLENGER  = { minScore = 3342, wingScore = 3448 },
    GRANDMASTER = { minScore = 3297, wingScore = 3320 },
    MASTER      = { minScore = 3142, wingScore = 3220 },
    DIAMOND     = { minScore = 3019, wingScore = 3080 },
    EMERALD     = { minScore = 2854, wingScore = 2936 },
    PLATINUM    = { minScore = 2635, wingScore = 2718 },
    GOLD        = { minScore = 2201, wingScore = 2431 },
    SILVER      = { minScore = 825, wingScore = 1528 },
    BRONZE      = { minScore =  310, wingScore =  469 },
    IRON        = { minScore =    1, wingScore =  167 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3505,
    CHALLENGER  = { minScore = 3436, wingScore = 3448 },
    GRANDMASTER = { minScore = 3393, wingScore = 3414 },
    MASTER      = { minScore = 3243, wingScore = 3318 },
    DIAMOND     = { minScore = 3113, wingScore = 3178 },
    EMERALD     = { minScore = 2940, wingScore = 3027 },
    PLATINUM    = { minScore = 2698, wingScore = 2792 },
    GOLD        = { minScore = 2198, wingScore = 2493 },
    SILVER      = { minScore = 823, wingScore = 1524 },
    BRONZE      = { minScore =  310, wingScore =  467 },
    IRON        = { minScore =    1, wingScore =  167 },
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
