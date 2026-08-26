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
    top100Score = 3431,
    CHALLENGER  = { minScore = 3339, wingScore = 3382 },
    GRANDMASTER = { minScore = 3262, wingScore = 3299 },
    MASTER      = { minScore = 3137, wingScore = 3189 },
    DIAMOND     = { minScore = 2972, wingScore = 3026 },
    EMERALD     = { minScore = 2800, wingScore = 2876 },
    PLATINUM    = { minScore = 2633, wingScore = 2692 },
    GOLD        = { minScore = 2150, wingScore = 2445 },
    SILVER      = { minScore = 834, wingScore = 1501 },
    BRONZE      = { minScore =  310, wingScore =  481 },
    IRON        = { minScore =    1, wingScore =  168 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3431,
    CHALLENGER  = { minScore = 3288, wingScore = 3382 },
    GRANDMASTER = { minScore = 3243, wingScore = 3265 },
    MASTER      = { minScore = 3085, wingScore = 3164 },
    DIAMOND     = { minScore = 2964, wingScore = 3025 },
    EMERALD     = { minScore = 2803, wingScore = 2884 },
    PLATINUM    = { minScore = 2599, wingScore = 2673 },
    GOLD        = { minScore = 2150, wingScore = 2396 },
    SILVER      = { minScore = 834, wingScore = 1501 },
    BRONZE      = { minScore =  310, wingScore =  481 },
    IRON        = { minScore =    1, wingScore =  168 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3431,
    CHALLENGER  = { minScore = 3370, wingScore = 3382 },
    GRANDMASTER = { minScore = 3328, wingScore = 3349 },
    MASTER      = { minScore = 3181, wingScore = 3255 },
    DIAMOND     = { minScore = 3049, wingScore = 3115 },
    EMERALD     = { minScore = 2871, wingScore = 2960 },
    PLATINUM    = { minScore = 2658, wingScore = 2733 },
    GOLD        = { minScore = 2150, wingScore = 2458 },
    SILVER      = { minScore = 834, wingScore = 1501 },
    BRONZE      = { minScore =  310, wingScore =  481 },
    IRON        = { minScore =    1, wingScore =  168 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3391,
    CHALLENGER  = { minScore = 3307, wingScore = 3351 },
    GRANDMASTER = { minScore = 3214, wingScore = 3252 },
    MASTER      = { minScore = 3086, wingScore = 3135 },
    DIAMOND     = { minScore = 2898, wingScore = 2996 },
    EMERALD     = { minScore = 2744, wingScore = 2801 },
    PLATINUM    = { minScore = 2559, wingScore = 2647 },
    GOLD        = { minScore = 1991, wingScore = 2291 },
    SILVER      = { minScore = 697, wingScore = 1310 },
    BRONZE      = { minScore =  310, wingScore =  465 },
    IRON        = { minScore =    1, wingScore =  166 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3391,
    CHALLENGER  = { minScore = 3226, wingScore = 3351 },
    GRANDMASTER = { minScore = 3182, wingScore = 3204 },
    MASTER      = { minScore = 3028, wingScore = 3105 },
    DIAMOND     = { minScore = 2908, wingScore = 2968 },
    EMERALD     = { minScore = 2748, wingScore = 2828 },
    PLATINUM    = { minScore = 2468, wingScore = 2588 },
    GOLD        = { minScore = 1991, wingScore = 2218 },
    SILVER      = { minScore = 697, wingScore = 1310 },
    BRONZE      = { minScore =  310, wingScore =  465 },
    IRON        = { minScore =    1, wingScore =  166 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3391,
    CHALLENGER  = { minScore = 3337, wingScore = 3351 },
    GRANDMASTER = { minScore = 3290, wingScore = 3313 },
    MASTER      = { minScore = 3125, wingScore = 3208 },
    DIAMOND     = { minScore = 2995, wingScore = 3060 },
    EMERALD     = { minScore = 2821, wingScore = 2908 },
    PLATINUM    = { minScore = 2568, wingScore = 2667 },
    GOLD        = { minScore = 1991, wingScore = 2334 },
    SILVER      = { minScore = 697, wingScore = 1310 },
    BRONZE      = { minScore =  310, wingScore =  465 },
    IRON        = { minScore =    1, wingScore =  166 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3431,
    CHALLENGER  = { minScore = 3325, wingScore = 3369 },
    GRANDMASTER = { minScore = 3242, wingScore = 3279 },
    MASTER      = { minScore = 3115, wingScore = 3166 },
    DIAMOND     = { minScore = 2941, wingScore = 3013 },
    EMERALD     = { minScore = 2776, wingScore = 2844 },
    PLATINUM    = { minScore = 2602, wingScore = 2673 },
    GOLD        = { minScore = 2082, wingScore = 2380 },
    SILVER      = { minScore = 776, wingScore = 1420 },
    BRONZE      = { minScore =  310, wingScore =  465 },
    IRON        = { minScore =    1, wingScore =  167 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3431,
    CHALLENGER  = { minScore = 3262, wingScore = 3369 },
    GRANDMASTER = { minScore = 3218, wingScore = 3240 },
    MASTER      = { minScore = 3061, wingScore = 3139 },
    DIAMOND     = { minScore = 2941, wingScore = 3001 },
    EMERALD     = { minScore = 2780, wingScore = 2861 },
    PLATINUM    = { minScore = 2544, wingScore = 2638 },
    GOLD        = { minScore = 2084, wingScore = 2322 },
    SILVER      = { minScore = 777, wingScore = 1421 },
    BRONZE      = { minScore =  310, wingScore =  465 },
    IRON        = { minScore =    1, wingScore =  167 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3431,
    CHALLENGER  = { minScore = 3356, wingScore = 3369 },
    GRANDMASTER = { minScore = 3311, wingScore = 3333 },
    MASTER      = { minScore = 3157, wingScore = 3235 },
    DIAMOND     = { minScore = 3026, wingScore = 3091 },
    EMERALD     = { minScore = 2849, wingScore = 2937 },
    PLATINUM    = { minScore = 2619, wingScore = 2704 },
    GOLD        = { minScore = 2081, wingScore = 2404 },
    SILVER      = { minScore = 774, wingScore = 1418 },
    BRONZE      = { minScore =  310, wingScore =  465 },
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
