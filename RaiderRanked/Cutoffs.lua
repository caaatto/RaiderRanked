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
    top100Score = 3370,
    CHALLENGER  = { minScore = 3285, wingScore = 3324 },
    GRANDMASTER = { minScore = 3205, wingScore = 3237 },
    MASTER      = { minScore = 3085, wingScore = 3131 },
    DIAMOND     = { minScore = 2926, wingScore = 3001 },
    EMERALD     = { minScore = 2766, wingScore = 2826 },
    PLATINUM    = { minScore = 2618, wingScore = 2677 },
    GOLD        = { minScore = 2094, wingScore = 2385 },
    SILVER      = { minScore = 834, wingScore = 1456 },
    BRONZE      = { minScore =  310, wingScore =  500 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3370,
    CHALLENGER  = { minScore = 3226, wingScore = 3324 },
    GRANDMASTER = { minScore = 3185, wingScore = 3206 },
    MASTER      = { minScore = 3042, wingScore = 3114 },
    DIAMOND     = { minScore = 2928, wingScore = 2985 },
    EMERALD     = { minScore = 2776, wingScore = 2852 },
    PLATINUM    = { minScore = 2557, wingScore = 2643 },
    GOLD        = { minScore = 2094, wingScore = 2340 },
    SILVER      = { minScore = 834, wingScore = 1456 },
    BRONZE      = { minScore =  310, wingScore =  500 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3370,
    CHALLENGER  = { minScore = 3314, wingScore = 3324 },
    GRANDMASTER = { minScore = 3271, wingScore = 3293 },
    MASTER      = { minScore = 3121, wingScore = 3196 },
    DIAMOND     = { minScore = 2998, wingScore = 3060 },
    EMERALD     = { minScore = 2834, wingScore = 2916 },
    PLATINUM    = { minScore = 2627, wingScore = 2702 },
    GOLD        = { minScore = 2094, wingScore = 2420 },
    SILVER      = { minScore = 834, wingScore = 1456 },
    BRONZE      = { minScore =  310, wingScore =  500 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3329,
    CHALLENGER  = { minScore = 3253, wingScore = 3303 },
    GRANDMASTER = { minScore = 3161, wingScore = 3199 },
    MASTER      = { minScore = 3042, wingScore = 3084 },
    DIAMOND     = { minScore = 2837, wingScore = 2945 },
    EMERALD     = { minScore = 2711, wingScore = 2758 },
    PLATINUM    = { minScore = 2501, wingScore = 2623 },
    GOLD        = { minScore = 1884, wingScore = 2216 },
    SILVER      = { minScore = 687, wingScore = 1251 },
    BRONZE      = { minScore =  310, wingScore =  465 },
    IRON        = { minScore =    1, wingScore =  166 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3329,
    CHALLENGER  = { minScore = 3179, wingScore = 3303 },
    GRANDMASTER = { minScore = 3140, wingScore = 3159 },
    MASTER      = { minScore = 3002, wingScore = 3071 },
    DIAMOND     = { minScore = 2882, wingScore = 2942 },
    EMERALD     = { minScore = 2723, wingScore = 2803 },
    PLATINUM    = { minScore = 2404, wingScore = 2548 },
    GOLD        = { minScore = 1884, wingScore = 2120 },
    SILVER      = { minScore = 687, wingScore = 1251 },
    BRONZE      = { minScore =  310, wingScore =  465 },
    IRON        = { minScore =    1, wingScore =  166 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3329,
    CHALLENGER  = { minScore = 3286, wingScore = 3303 },
    GRANDMASTER = { minScore = 3239, wingScore = 3263 },
    MASTER      = { minScore = 3077, wingScore = 3158 },
    DIAMOND     = { minScore = 2953, wingScore = 3015 },
    EMERALD     = { minScore = 2787, wingScore = 2870 },
    PLATINUM    = { minScore = 2509, wingScore = 2627 },
    GOLD        = { minScore = 1884, wingScore = 2258 },
    SILVER      = { minScore = 687, wingScore = 1251 },
    BRONZE      = { minScore =  310, wingScore =  465 },
    IRON        = { minScore =    1, wingScore =  166 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3370,
    CHALLENGER  = { minScore = 3271, wingScore = 3315 },
    GRANDMASTER = { minScore = 3186, wingScore = 3221 },
    MASTER      = { minScore = 3067, wingScore = 3111 },
    DIAMOND     = { minScore = 2888, wingScore = 2977 },
    EMERALD     = { minScore = 2742, wingScore = 2797 },
    PLATINUM    = { minScore = 2568, wingScore = 2654 },
    GOLD        = { minScore = 2004, wingScore = 2313 },
    SILVER      = { minScore = 771, wingScore = 1368 },
    BRONZE      = { minScore =  310, wingScore =  465 },
    IRON        = { minScore =    1, wingScore =  168 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3370,
    CHALLENGER  = { minScore = 3206, wingScore = 3315 },
    GRANDMASTER = { minScore = 3166, wingScore = 3186 },
    MASTER      = { minScore = 3025, wingScore = 3096 },
    DIAMOND     = { minScore = 2909, wingScore = 2967 },
    EMERALD     = { minScore = 2754, wingScore = 2831 },
    PLATINUM    = { minScore = 2493, wingScore = 2603 },
    GOLD        = { minScore = 2006, wingScore = 2248 },
    SILVER      = { minScore = 772, wingScore = 1370 },
    BRONZE      = { minScore =  310, wingScore =  465 },
    IRON        = { minScore =    1, wingScore =  168 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3370,
    CHALLENGER  = { minScore = 3302, wingScore = 3315 },
    GRANDMASTER = { minScore = 3257, wingScore = 3280 },
    MASTER      = { minScore = 3102, wingScore = 3179 },
    DIAMOND     = { minScore = 2978, wingScore = 3040 },
    EMERALD     = { minScore = 2813, wingScore = 2896 },
    PLATINUM    = { minScore = 2575, wingScore = 2669 },
    GOLD        = { minScore = 2002, wingScore = 2349 },
    SILVER      = { minScore = 770, wingScore = 1366 },
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
