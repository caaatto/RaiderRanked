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
    top100Score = 3400,
    CHALLENGER  = { minScore = 3315, wingScore = 3355 },
    GRANDMASTER = { minScore = 3232, wingScore = 3268 },
    MASTER      = { minScore = 3114, wingScore = 3165 },
    DIAMOND     = { minScore = 2958, wingScore = 3014 },
    EMERALD     = { minScore = 2787, wingScore = 2856 },
    PLATINUM    = { minScore = 2628, wingScore = 2687 },
    GOLD        = { minScore = 2130, wingScore = 2422 },
    SILVER      = { minScore = 844, wingScore = 1491 },
    BRONZE      = { minScore =  310, wingScore =  498 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3400,
    CHALLENGER  = { minScore = 3258, wingScore = 3355 },
    GRANDMASTER = { minScore = 3216, wingScore = 3237 },
    MASTER      = { minScore = 3068, wingScore = 3142 },
    DIAMOND     = { minScore = 2950, wingScore = 3009 },
    EMERALD     = { minScore = 2793, wingScore = 2872 },
    PLATINUM    = { minScore = 2586, wingScore = 2663 },
    GOLD        = { minScore = 2130, wingScore = 2378 },
    SILVER      = { minScore = 844, wingScore = 1491 },
    BRONZE      = { minScore =  310, wingScore =  498 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3400,
    CHALLENGER  = { minScore = 3343, wingScore = 3355 },
    GRANDMASTER = { minScore = 3302, wingScore = 3322 },
    MASTER      = { minScore = 3157, wingScore = 3229 },
    DIAMOND     = { minScore = 3029, wingScore = 3093 },
    EMERALD     = { minScore = 2857, wingScore = 2943 },
    PLATINUM    = { minScore = 2648, wingScore = 2722 },
    GOLD        = { minScore = 2130, wingScore = 2446 },
    SILVER      = { minScore = 844, wingScore = 1491 },
    BRONZE      = { minScore =  310, wingScore =  498 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3358,
    CHALLENGER  = { minScore = 3288, wingScore = 3328 },
    GRANDMASTER = { minScore = 3195, wingScore = 3228 },
    MASTER      = { minScore = 3064, wingScore = 3111 },
    DIAMOND     = { minScore = 2869, wingScore = 2972 },
    EMERALD     = { minScore = 2726, wingScore = 2779 },
    PLATINUM    = { minScore = 2533, wingScore = 2636 },
    GOLD        = { minScore = 1949, wingScore = 2258 },
    SILVER      = { minScore = 698, wingScore = 1291 },
    BRONZE      = { minScore =  310, wingScore =  465 },
    IRON        = { minScore =    1, wingScore =  166 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3358,
    CHALLENGER  = { minScore = 3206, wingScore = 3328 },
    GRANDMASTER = { minScore = 3164, wingScore = 3185 },
    MASTER      = { minScore = 3015, wingScore = 3090 },
    DIAMOND     = { minScore = 2896, wingScore = 2956 },
    EMERALD     = { minScore = 2737, wingScore = 2817 },
    PLATINUM    = { minScore = 2442, wingScore = 2571 },
    GOLD        = { minScore = 1949, wingScore = 2180 },
    SILVER      = { minScore = 698, wingScore = 1291 },
    BRONZE      = { minScore =  310, wingScore =  465 },
    IRON        = { minScore =    1, wingScore =  166 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3358,
    CHALLENGER  = { minScore = 3319, wingScore = 3328 },
    GRANDMASTER = { minScore = 3271, wingScore = 3295 },
    MASTER      = { minScore = 3104, wingScore = 3187 },
    DIAMOND     = { minScore = 2976, wingScore = 3040 },
    EMERALD     = { minScore = 2805, wingScore = 2890 },
    PLATINUM    = { minScore = 2543, wingScore = 2649 },
    GOLD        = { minScore = 1949, wingScore = 2306 },
    SILVER      = { minScore = 698, wingScore = 1291 },
    BRONZE      = { minScore =  310, wingScore =  465 },
    IRON        = { minScore =    1, wingScore =  166 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3400,
    CHALLENGER  = { minScore = 3303, wingScore = 3343 },
    GRANDMASTER = { minScore = 3216, wingScore = 3251 },
    MASTER      = { minScore = 3093, wingScore = 3142 },
    DIAMOND     = { minScore = 2920, wingScore = 2996 },
    EMERALD     = { minScore = 2761, wingScore = 2823 },
    PLATINUM    = { minScore = 2587, wingScore = 2665 },
    GOLD        = { minScore = 2052, wingScore = 2352 },
    SILVER      = { minScore = 781, wingScore = 1405 },
    BRONZE      = { minScore =  310, wingScore =  465 },
    IRON        = { minScore =    1, wingScore =  168 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3400,
    CHALLENGER  = { minScore = 3236, wingScore = 3344 },
    GRANDMASTER = { minScore = 3194, wingScore = 3215 },
    MASTER      = { minScore = 3046, wingScore = 3120 },
    DIAMOND     = { minScore = 2927, wingScore = 2987 },
    EMERALD     = { minScore = 2770, wingScore = 2849 },
    PLATINUM    = { minScore = 2526, wingScore = 2625 },
    GOLD        = { minScore = 2054, wingScore = 2295 },
    SILVER      = { minScore = 783, wingScore = 1407 },
    BRONZE      = { minScore =  310, wingScore =  465 },
    IRON        = { minScore =    1, wingScore =  168 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3400,
    CHALLENGER  = { minScore = 3333, wingScore = 3343 },
    GRANDMASTER = { minScore = 3288, wingScore = 3310 },
    MASTER      = { minScore = 3134, wingScore = 3211 },
    DIAMOND     = { minScore = 3006, wingScore = 3070 },
    EMERALD     = { minScore = 2834, wingScore = 2920 },
    PLATINUM    = { minScore = 2602, wingScore = 2690 },
    GOLD        = { minScore = 2051, wingScore = 2385 },
    SILVER      = { minScore = 780, wingScore = 1404 },
    BRONZE      = { minScore =  310, wingScore =  465 },
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
