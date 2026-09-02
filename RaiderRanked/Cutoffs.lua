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
    top100Score = 3647,
    CHALLENGER  = { minScore = 3543, wingScore = 3578 },
    GRANDMASTER = { minScore = 3465, wingScore = 3501 },
    MASTER      = { minScore = 3354, wingScore = 3406 },
    DIAMOND     = { minScore = 3154, wingScore = 3234 },
    EMERALD     = { minScore = 3018, wingScore = 3072 },
    PLATINUM    = { minScore = 2742, wingScore = 2859 },
    GOLD        = { minScore = 2424, wingScore = 2638 },
    SILVER      = { minScore = 978, wingScore = 1817 },
    BRONZE      = { minScore =  310, wingScore =  552 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3647,
    CHALLENGER  = { minScore = 3480, wingScore = 3578 },
    GRANDMASTER = { minScore = 3440, wingScore = 3460 },
    MASTER      = { minScore = 3302, wingScore = 3371 },
    DIAMOND     = { minScore = 3182, wingScore = 3242 },
    EMERALD     = { minScore = 3021, wingScore = 3101 },
    PLATINUM    = { minScore = 2759, wingScore = 2868 },
    GOLD        = { minScore = 2424, wingScore = 2574 },
    SILVER      = { minScore = 978, wingScore = 1817 },
    BRONZE      = { minScore =  310, wingScore =  552 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3647,
    CHALLENGER  = { minScore = 3569, wingScore = 3578 },
    GRANDMASTER = { minScore = 3532, wingScore = 3551 },
    MASTER      = { minScore = 3402, wingScore = 3467 },
    DIAMOND     = { minScore = 3271, wingScore = 3336 },
    EMERALD     = { minScore = 3096, wingScore = 3183 },
    PLATINUM    = { minScore = 2803, wingScore = 2926 },
    GOLD        = { minScore = 2424, wingScore = 2620 },
    SILVER      = { minScore = 978, wingScore = 1817 },
    BRONZE      = { minScore =  310, wingScore =  552 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3601,
    CHALLENGER  = { minScore = 3510, wingScore = 3550 },
    GRANDMASTER = { minScore = 3421, wingScore = 3449 },
    MASTER      = { minScore = 3301, wingScore = 3344 },
    DIAMOND     = { minScore = 3079, wingScore = 3165 },
    EMERALD     = { minScore = 2969, wingScore = 3017 },
    PLATINUM    = { minScore = 2694, wingScore = 2793 },
    GOLD        = { minScore = 2288, wingScore = 2575 },
    SILVER      = { minScore = 853, wingScore = 1613 },
    BRONZE      = { minScore =  310, wingScore =  493 },
    IRON        = { minScore =    1, wingScore =  167 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3601,
    CHALLENGER  = { minScore = 3422, wingScore = 3550 },
    GRANDMASTER = { minScore = 3377, wingScore = 3400 },
    MASTER      = { minScore = 3219, wingScore = 3298 },
    DIAMOND     = { minScore = 3092, wingScore = 3155 },
    EMERALD     = { minScore = 2921, wingScore = 3006 },
    PLATINUM    = { minScore = 2690, wingScore = 2778 },
    GOLD        = { minScore = 2288, wingScore = 2491 },
    SILVER      = { minScore = 853, wingScore = 1613 },
    BRONZE      = { minScore =  310, wingScore =  493 },
    IRON        = { minScore =    1, wingScore =  167 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3601,
    CHALLENGER  = { minScore = 3542, wingScore = 3550 },
    GRANDMASTER = { minScore = 3498, wingScore = 3520 },
    MASTER      = { minScore = 3341, wingScore = 3419 },
    DIAMOND     = { minScore = 3210, wingScore = 3275 },
    EMERALD     = { minScore = 3035, wingScore = 3122 },
    PLATINUM    = { minScore = 2753, wingScore = 2870 },
    GOLD        = { minScore = 2288, wingScore = 2545 },
    SILVER      = { minScore = 853, wingScore = 1613 },
    BRONZE      = { minScore =  310, wingScore =  493 },
    IRON        = { minScore =    1, wingScore =  167 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3647,
    CHALLENGER  = { minScore = 3529, wingScore = 3566 },
    GRANDMASTER = { minScore = 3446, wingScore = 3479 },
    MASTER      = { minScore = 3332, wingScore = 3380 },
    DIAMOND     = { minScore = 3122, wingScore = 3205 },
    EMERALD     = { minScore = 2997, wingScore = 3049 },
    PLATINUM    = { minScore = 2722, wingScore = 2831 },
    GOLD        = { minScore = 2367, wingScore = 2611 },
    SILVER      = { minScore = 925, wingScore = 1731 },
    BRONZE      = { minScore =  310, wingScore =  527 },
    IRON        = { minScore =    1, wingScore =  168 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3647,
    CHALLENGER  = { minScore = 3456, wingScore = 3566 },
    GRANDMASTER = { minScore = 3414, wingScore = 3435 },
    MASTER      = { minScore = 3268, wingScore = 3341 },
    DIAMOND     = { minScore = 3145, wingScore = 3206 },
    EMERALD     = { minScore = 2980, wingScore = 3062 },
    PLATINUM    = { minScore = 2731, wingScore = 2831 },
    GOLD        = { minScore = 2368, wingScore = 2540 },
    SILVER      = { minScore = 927, wingScore = 1733 },
    BRONZE      = { minScore =  310, wingScore =  528 },
    IRON        = { minScore =    1, wingScore =  168 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3647,
    CHALLENGER  = { minScore = 3557, wingScore = 3566 },
    GRANDMASTER = { minScore = 3517, wingScore = 3538 },
    MASTER      = { minScore = 3376, wingScore = 3446 },
    DIAMOND     = { minScore = 3245, wingScore = 3310 },
    EMERALD     = { minScore = 3070, wingScore = 3157 },
    PLATINUM    = { minScore = 2781, wingScore = 2902 },
    GOLD        = { minScore = 2365, wingScore = 2588 },
    SILVER      = { minScore = 924, wingScore = 1729 },
    BRONZE      = { minScore =  310, wingScore =  527 },
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
