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
    top100Score = 3609,
    CHALLENGER  = { minScore = 3521, wingScore = 3554 },
    GRANDMASTER = { minScore = 3437, wingScore = 3467 },
    MASTER      = { minScore = 3327, wingScore = 3374 },
    DIAMOND     = { minScore = 3125, wingScore = 3208 },
    EMERALD     = { minScore = 3007, wingScore = 3051 },
    PLATINUM    = { minScore = 2731, wingScore = 2839 },
    GOLD        = { minScore = 2384, wingScore = 2629 },
    SILVER      = { minScore = 966, wingScore = 1769 },
    BRONZE      = { minScore =  310, wingScore =  539 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3609,
    CHALLENGER  = { minScore = 3448, wingScore = 3554 },
    GRANDMASTER = { minScore = 3408, wingScore = 3428 },
    MASTER      = { minScore = 3267, wingScore = 3338 },
    DIAMOND     = { minScore = 3146, wingScore = 3207 },
    EMERALD     = { minScore = 2985, wingScore = 3066 },
    PLATINUM    = { minScore = 2739, wingScore = 2838 },
    GOLD        = { minScore = 2384, wingScore = 2552 },
    SILVER      = { minScore = 966, wingScore = 1769 },
    BRONZE      = { minScore =  310, wingScore =  539 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3609,
    CHALLENGER  = { minScore = 3541, wingScore = 3554 },
    GRANDMASTER = { minScore = 3502, wingScore = 3521 },
    MASTER      = { minScore = 3363, wingScore = 3432 },
    DIAMOND     = { minScore = 3238, wingScore = 3300 },
    EMERALD     = { minScore = 3072, wingScore = 3155 },
    PLATINUM    = { minScore = 2788, wingScore = 2909 },
    GOLD        = { minScore = 2384, wingScore = 2595 },
    SILVER      = { minScore = 966, wingScore = 1769 },
    BRONZE      = { minScore =  310, wingScore =  539 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3562,
    CHALLENGER  = { minScore = 3474, wingScore = 3530 },
    GRANDMASTER = { minScore = 3394, wingScore = 3423 },
    MASTER      = { minScore = 3269, wingScore = 3318 },
    DIAMOND     = { minScore = 3054, wingScore = 3132 },
    EMERALD     = { minScore = 2937, wingScore = 3003 },
    PLATINUM    = { minScore = 2676, wingScore = 2767 },
    GOLD        = { minScore = 2244, wingScore = 2541 },
    SILVER      = { minScore = 835, wingScore = 1564 },
    BRONZE      = { minScore =  310, wingScore =  488 },
    IRON        = { minScore =    1, wingScore =  167 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3562,
    CHALLENGER  = { minScore = 3393, wingScore = 3530 },
    GRANDMASTER = { minScore = 3348, wingScore = 3370 },
    MASTER      = { minScore = 3191, wingScore = 3269 },
    DIAMOND     = { minScore = 3062, wingScore = 3126 },
    EMERALD     = { minScore = 2889, wingScore = 2976 },
    PLATINUM    = { minScore = 2663, wingScore = 2747 },
    GOLD        = { minScore = 2244, wingScore = 2457 },
    SILVER      = { minScore = 835, wingScore = 1564 },
    BRONZE      = { minScore =  310, wingScore =  488 },
    IRON        = { minScore =    1, wingScore =  167 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3562,
    CHALLENGER  = { minScore = 3510, wingScore = 3530 },
    GRANDMASTER = { minScore = 3466, wingScore = 3488 },
    MASTER      = { minScore = 3310, wingScore = 3388 },
    DIAMOND     = { minScore = 3176, wingScore = 3243 },
    EMERALD     = { minScore = 2998, wingScore = 3087 },
    PLATINUM    = { minScore = 2731, wingScore = 2838 },
    GOLD        = { minScore = 2244, wingScore = 2520 },
    SILVER      = { minScore = 835, wingScore = 1564 },
    BRONZE      = { minScore =  310, wingScore =  488 },
    IRON        = { minScore =    1, wingScore =  167 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3609,
    CHALLENGER  = { minScore = 3501, wingScore = 3544 },
    GRANDMASTER = { minScore = 3419, wingScore = 3448 },
    MASTER      = { minScore = 3302, wingScore = 3350 },
    DIAMOND     = { minScore = 3095, wingScore = 3176 },
    EMERALD     = { minScore = 2977, wingScore = 3031 },
    PLATINUM    = { minScore = 2708, wingScore = 2809 },
    GOLD        = { minScore = 2325, wingScore = 2592 },
    SILVER      = { minScore = 911, wingScore = 1682 },
    BRONZE      = { minScore =  310, wingScore =  517 },
    IRON        = { minScore =    1, wingScore =  168 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3609,
    CHALLENGER  = { minScore = 3425, wingScore = 3544 },
    GRANDMASTER = { minScore = 3383, wingScore = 3404 },
    MASTER      = { minScore = 3236, wingScore = 3310 },
    DIAMOND     = { minScore = 3111, wingScore = 3174 },
    EMERALD     = { minScore = 2945, wingScore = 3029 },
    PLATINUM    = { minScore = 2708, wingScore = 2801 },
    GOLD        = { minScore = 2326, wingScore = 2513 },
    SILVER      = { minScore = 912, wingScore = 1685 },
    BRONZE      = { minScore =  310, wingScore =  518 },
    IRON        = { minScore =    1, wingScore =  168 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3609,
    CHALLENGER  = { minScore = 3528, wingScore = 3544 },
    GRANDMASTER = { minScore = 3486, wingScore = 3507 },
    MASTER      = { minScore = 3340, wingScore = 3413 },
    DIAMOND     = { minScore = 3211, wingScore = 3275 },
    EMERALD     = { minScore = 3040, wingScore = 3126 },
    PLATINUM    = { minScore = 2763, wingScore = 2878 },
    GOLD        = { minScore = 2324, wingScore = 2563 },
    SILVER      = { minScore = 910, wingScore = 1681 },
    BRONZE      = { minScore =  310, wingScore =  517 },
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
