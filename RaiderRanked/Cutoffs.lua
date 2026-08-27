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
    top100Score = 3457,
    CHALLENGER  = { minScore = 3370, wingScore = 3415 },
    GRANDMASTER = { minScore = 3299, wingScore = 3324 },
    MASTER      = { minScore = 3177, wingScore = 3220 },
    DIAMOND     = { minScore = 3004, wingScore = 3057 },
    EMERALD     = { minScore = 2847, wingScore = 2929 },
    PLATINUM    = { minScore = 2653, wingScore = 2719 },
    GOLD        = { minScore = 2204, wingScore = 2501 },
    SILVER      = { minScore = 843, wingScore = 1547 },
    BRONZE      = { minScore =  310, wingScore =  481 },
    IRON        = { minScore =    1, wingScore =  168 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3457,
    CHALLENGER  = { minScore = 3317, wingScore = 3415 },
    GRANDMASTER = { minScore = 3273, wingScore = 3295 },
    MASTER      = { minScore = 3120, wingScore = 3196 },
    DIAMOND     = { minScore = 2999, wingScore = 3059 },
    EMERALD     = { minScore = 2838, wingScore = 2918 },
    PLATINUM    = { minScore = 2639, wingScore = 2710 },
    GOLD        = { minScore = 2204, wingScore = 2442 },
    SILVER      = { minScore = 843, wingScore = 1547 },
    BRONZE      = { minScore =  310, wingScore =  481 },
    IRON        = { minScore =    1, wingScore =  168 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3457,
    CHALLENGER  = { minScore = 3403, wingScore = 3415 },
    GRANDMASTER = { minScore = 3361, wingScore = 3382 },
    MASTER      = { minScore = 3213, wingScore = 3287 },
    DIAMOND     = { minScore = 3085, wingScore = 3149 },
    EMERALD     = { minScore = 2913, wingScore = 2999 },
    PLATINUM    = { minScore = 2691, wingScore = 2773 },
    GOLD        = { minScore = 2204, wingScore = 2495 },
    SILVER      = { minScore = 843, wingScore = 1547 },
    BRONZE      = { minScore =  310, wingScore =  481 },
    IRON        = { minScore =    1, wingScore =  168 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3445,
    CHALLENGER  = { minScore = 3357, wingScore = 3406 },
    GRANDMASTER = { minScore = 3268, wingScore = 3305 },
    MASTER      = { minScore = 3140, wingScore = 3192 },
    DIAMOND     = { minScore = 2968, wingScore = 3026 },
    EMERALD     = { minScore = 2799, wingScore = 2869 },
    PLATINUM    = { minScore = 2611, wingScore = 2683 },
    GOLD        = { minScore = 2064, wingScore = 2365 },
    SILVER      = { minScore = 730, wingScore = 1363 },
    BRONZE      = { minScore =  310, wingScore =  465 },
    IRON        = { minScore =    1, wingScore =  166 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3445,
    CHALLENGER  = { minScore = 3286, wingScore = 3406 },
    GRANDMASTER = { minScore = 3239, wingScore = 3263 },
    MASTER      = { minScore = 3074, wingScore = 3156 },
    DIAMOND     = { minScore = 2953, wingScore = 3013 },
    EMERALD     = { minScore = 2792, wingScore = 2872 },
    PLATINUM    = { minScore = 2540, wingScore = 2643 },
    GOLD        = { minScore = 2064, wingScore = 2309 },
    SILVER      = { minScore = 730, wingScore = 1363 },
    BRONZE      = { minScore =  310, wingScore =  465 },
    IRON        = { minScore =    1, wingScore =  166 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3445,
    CHALLENGER  = { minScore = 3392, wingScore = 3406 },
    GRANDMASTER = { minScore = 3346, wingScore = 3369 },
    MASTER      = { minScore = 3183, wingScore = 3264 },
    DIAMOND     = { minScore = 3051, wingScore = 3117 },
    EMERALD     = { minScore = 2875, wingScore = 2963 },
    PLATINUM    = { minScore = 2634, wingScore = 2726 },
    GOLD        = { minScore = 2064, wingScore = 2408 },
    SILVER      = { minScore = 730, wingScore = 1363 },
    BRONZE      = { minScore =  310, wingScore =  465 },
    IRON        = { minScore =    1, wingScore =  166 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3457,
    CHALLENGER  = { minScore = 3364, wingScore = 3411 },
    GRANDMASTER = { minScore = 3286, wingScore = 3316 },
    MASTER      = { minScore = 3161, wingScore = 3208 },
    DIAMOND     = { minScore = 2989, wingScore = 3044 },
    EMERALD     = { minScore = 2827, wingScore = 2904 },
    PLATINUM    = { minScore = 2635, wingScore = 2704 },
    GOLD        = { minScore = 2145, wingScore = 2443 },
    SILVER      = { minScore = 795, wingScore = 1469 },
    BRONZE      = { minScore =  310, wingScore =  465 },
    IRON        = { minScore =    1, wingScore =  167 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3457,
    CHALLENGER  = { minScore = 3304, wingScore = 3411 },
    GRANDMASTER = { minScore = 3259, wingScore = 3282 },
    MASTER      = { minScore = 3101, wingScore = 3179 },
    DIAMOND     = { minScore = 2980, wingScore = 3040 },
    EMERALD     = { minScore = 2819, wingScore = 2899 },
    PLATINUM    = { minScore = 2598, wingScore = 2682 },
    GOLD        = { minScore = 2146, wingScore = 2387 },
    SILVER      = { minScore = 796, wingScore = 1471 },
    BRONZE      = { minScore =  310, wingScore =  465 },
    IRON        = { minScore =    1, wingScore =  167 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3457,
    CHALLENGER  = { minScore = 3398, wingScore = 3411 },
    GRANDMASTER = { minScore = 3355, wingScore = 3376 },
    MASTER      = { minScore = 3200, wingScore = 3277 },
    DIAMOND     = { minScore = 3070, wingScore = 3135 },
    EMERALD     = { minScore = 2897, wingScore = 2983 },
    PLATINUM    = { minScore = 2666, wingScore = 2753 },
    GOLD        = { minScore = 2143, wingScore = 2457 },
    SILVER      = { minScore = 794, wingScore = 1467 },
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
