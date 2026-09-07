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
    top100Score = 3758,
    CHALLENGER  = { minScore = 3655, wingScore = 3689 },
    GRANDMASTER = { minScore = 3568, wingScore = 3602 },
    MASTER      = { minScore = 3457, wingScore = 3510 },
    DIAMOND     = { minScore = 3275, wingScore = 3345 },
    EMERALD     = { minScore = 3123, wingScore = 3195 },
    PLATINUM    = { minScore = 2859, wingScore = 3002 },
    GOLD        = { minScore = 2572, wingScore = 2699 },
    SILVER      = { minScore = 1082, wingScore = 2018 },
    BRONZE      = { minScore =  322, wingScore =  625 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3758,
    CHALLENGER  = { minScore = 3579, wingScore = 3689 },
    GRANDMASTER = { minScore = 3542, wingScore = 3560 },
    MASTER      = { minScore = 3412, wingScore = 3477 },
    DIAMOND     = { minScore = 3287, wingScore = 3349 },
    EMERALD     = { minScore = 3120, wingScore = 3203 },
    PLATINUM    = { minScore = 2842, wingScore = 2959 },
    GOLD        = { minScore = 2572, wingScore = 2678 },
    SILVER      = { minScore = 1082, wingScore = 2018 },
    BRONZE      = { minScore =  322, wingScore =  625 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3758,
    CHALLENGER  = { minScore = 3683, wingScore = 3689 },
    GRANDMASTER = { minScore = 3643, wingScore = 3663 },
    MASTER      = { minScore = 3506, wingScore = 3574 },
    DIAMOND     = { minScore = 3372, wingScore = 3439 },
    EMERALD     = { minScore = 3194, wingScore = 3283 },
    PLATINUM    = { minScore = 2896, wingScore = 3021 },
    GOLD        = { minScore = 2572, wingScore = 2727 },
    SILVER      = { minScore = 1082, wingScore = 2018 },
    BRONZE      = { minScore =  322, wingScore =  625 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3693,
    CHALLENGER  = { minScore = 3611, wingScore = 3654 },
    GRANDMASTER = { minScore = 3531, wingScore = 3558 },
    MASTER      = { minScore = 3406, wingScore = 3450 },
    DIAMOND     = { minScore = 3193, wingScore = 3276 },
    EMERALD     = { minScore = 3049, wingScore = 3107 },
    PLATINUM    = { minScore = 2784, wingScore = 2917 },
    GOLD        = { minScore = 2427, wingScore = 2647 },
    SILVER      = { minScore = 954, wingScore = 1792 },
    BRONZE      = { minScore =  310, wingScore =  529 },
    IRON        = { minScore =    1, wingScore =  167 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3693,
    CHALLENGER  = { minScore = 3523, wingScore = 3654 },
    GRANDMASTER = { minScore = 3479, wingScore = 3501 },
    MASTER      = { minScore = 3326, wingScore = 3403 },
    DIAMOND     = { minScore = 3211, wingScore = 3268 },
    EMERALD     = { minScore = 3057, wingScore = 3134 },
    PLATINUM    = { minScore = 2779, wingScore = 2900 },
    GOLD        = { minScore = 2427, wingScore = 2578 },
    SILVER      = { minScore = 954, wingScore = 1792 },
    BRONZE      = { minScore =  310, wingScore =  529 },
    IRON        = { minScore =    1, wingScore =  167 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3693,
    CHALLENGER  = { minScore = 3648, wingScore = 3654 },
    GRANDMASTER = { minScore = 3604, wingScore = 3626 },
    MASTER      = { minScore = 3449, wingScore = 3526 },
    DIAMOND     = { minScore = 3312, wingScore = 3380 },
    EMERALD     = { minScore = 3129, wingScore = 3220 },
    PLATINUM    = { minScore = 2834, wingScore = 2956 },
    GOLD        = { minScore = 2427, wingScore = 2646 },
    SILVER      = { minScore = 954, wingScore = 1792 },
    BRONZE      = { minScore =  310, wingScore =  529 },
    IRON        = { minScore =    1, wingScore =  167 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3758,
    CHALLENGER  = { minScore = 3637, wingScore = 3674 },
    GRANDMASTER = { minScore = 3552, wingScore = 3584 },
    MASTER      = { minScore = 3436, wingScore = 3485 },
    DIAMOND     = { minScore = 3241, wingScore = 3316 },
    EMERALD     = { minScore = 3092, wingScore = 3158 },
    PLATINUM    = { minScore = 2827, wingScore = 2966 },
    GOLD        = { minScore = 2511, wingScore = 2677 },
    SILVER      = { minScore = 1028, wingScore = 1923 },
    BRONZE      = { minScore =  310, wingScore =  585 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3758,
    CHALLENGER  = { minScore = 3556, wingScore = 3675 },
    GRANDMASTER = { minScore = 3516, wingScore = 3536 },
    MASTER      = { minScore = 3377, wingScore = 3447 },
    DIAMOND     = { minScore = 3256, wingScore = 3316 },
    EMERALD     = { minScore = 3094, wingScore = 3175 },
    PLATINUM    = { minScore = 2816, wingScore = 2935 },
    GOLD        = { minScore = 2513, wingScore = 2637 },
    SILVER      = { minScore = 1029, wingScore = 1925 },
    BRONZE      = { minScore =  310, wingScore =  586 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3758,
    CHALLENGER  = { minScore = 3668, wingScore = 3674 },
    GRANDMASTER = { minScore = 3626, wingScore = 3647 },
    MASTER      = { minScore = 3482, wingScore = 3553 },
    DIAMOND     = { minScore = 3346, wingScore = 3414 },
    EMERALD     = { minScore = 3166, wingScore = 3256 },
    PLATINUM    = { minScore = 2869, wingScore = 2993 },
    GOLD        = { minScore = 2510, wingScore = 2692 },
    SILVER      = { minScore = 1027, wingScore = 1921 },
    BRONZE      = { minScore =  310, wingScore =  584 },
    IRON        = { minScore =    1, wingScore =  169 },
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
