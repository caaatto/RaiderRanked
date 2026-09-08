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
    top100Score = 3773,
    CHALLENGER  = { minScore = 3660, wingScore = 3699 },
    GRANDMASTER = { minScore = 3580, wingScore = 3618 },
    MASTER      = { minScore = 3470, wingScore = 3524 },
    DIAMOND     = { minScore = 3289, wingScore = 3357 },
    EMERALD     = { minScore = 3134, wingScore = 3205 },
    PLATINUM    = { minScore = 2870, wingScore = 3007 },
    GOLD        = { minScore = 2586, wingScore = 2706 },
    SILVER      = { minScore = 1103, wingScore = 2032 },
    BRONZE      = { minScore =  322, wingScore =  632 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3773,
    CHALLENGER  = { minScore = 3591, wingScore = 3699 },
    GRANDMASTER = { minScore = 3552, wingScore = 3571 },
    MASTER      = { minScore = 3419, wingScore = 3486 },
    DIAMOND     = { minScore = 3293, wingScore = 3356 },
    EMERALD     = { minScore = 3126, wingScore = 3210 },
    PLATINUM    = { minScore = 2848, wingScore = 2965 },
    GOLD        = { minScore = 2586, wingScore = 2685 },
    SILVER      = { minScore = 1103, wingScore = 2032 },
    BRONZE      = { minScore =  322, wingScore =  632 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3773,
    CHALLENGER  = { minScore = 3694, wingScore = 3699 },
    GRANDMASTER = { minScore = 3655, wingScore = 3675 },
    MASTER      = { minScore = 3518, wingScore = 3587 },
    DIAMOND     = { minScore = 3383, wingScore = 3451 },
    EMERALD     = { minScore = 3203, wingScore = 3293 },
    PLATINUM    = { minScore = 2903, wingScore = 3029 },
    GOLD        = { minScore = 2586, wingScore = 2734 },
    SILVER      = { minScore = 1103, wingScore = 2032 },
    BRONZE      = { minScore =  322, wingScore =  632 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3710,
    CHALLENGER  = { minScore = 3628, wingScore = 3667 },
    GRANDMASTER = { minScore = 3541, wingScore = 3571 },
    MASTER      = { minScore = 3419, wingScore = 3464 },
    DIAMOND     = { minScore = 3207, wingScore = 3295 },
    EMERALD     = { minScore = 3060, wingScore = 3119 },
    PLATINUM    = { minScore = 2797, wingScore = 2935 },
    GOLD        = { minScore = 2452, wingScore = 2654 },
    SILVER      = { minScore = 969, wingScore = 1830 },
    BRONZE      = { minScore =  310, wingScore =  536 },
    IRON        = { minScore =    1, wingScore =  167 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3710,
    CHALLENGER  = { minScore = 3537, wingScore = 3667 },
    GRANDMASTER = { minScore = 3493, wingScore = 3515 },
    MASTER      = { minScore = 3337, wingScore = 3415 },
    DIAMOND     = { minScore = 3222, wingScore = 3280 },
    EMERALD     = { minScore = 3069, wingScore = 3146 },
    PLATINUM    = { minScore = 2789, wingScore = 2911 },
    GOLD        = { minScore = 2452, wingScore = 2590 },
    SILVER      = { minScore = 969, wingScore = 1830 },
    BRONZE      = { minScore =  310, wingScore =  536 },
    IRON        = { minScore =    1, wingScore =  167 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3710,
    CHALLENGER  = { minScore = 3657, wingScore = 3667 },
    GRANDMASTER = { minScore = 3614, wingScore = 3636 },
    MASTER      = { minScore = 3462, wingScore = 3538 },
    DIAMOND     = { minScore = 3323, wingScore = 3392 },
    EMERALD     = { minScore = 3138, wingScore = 3230 },
    PLATINUM    = { minScore = 2842, wingScore = 2964 },
    GOLD        = { minScore = 2452, wingScore = 2658 },
    SILVER      = { minScore = 969, wingScore = 1830 },
    BRONZE      = { minScore =  310, wingScore =  536 },
    IRON        = { minScore =    1, wingScore =  167 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3773,
    CHALLENGER  = { minScore = 3646, wingScore = 3685 },
    GRANDMASTER = { minScore = 3564, wingScore = 3598 },
    MASTER      = { minScore = 3448, wingScore = 3499 },
    DIAMOND     = { minScore = 3254, wingScore = 3331 },
    EMERALD     = { minScore = 3103, wingScore = 3169 },
    PLATINUM    = { minScore = 2839, wingScore = 2977 },
    GOLD        = { minScore = 2529, wingScore = 2684 },
    SILVER      = { minScore = 1046, wingScore = 1947 },
    BRONZE      = { minScore =  310, wingScore =  591 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3773,
    CHALLENGER  = { minScore = 3569, wingScore = 3686 },
    GRANDMASTER = { minScore = 3528, wingScore = 3548 },
    MASTER      = { minScore = 3385, wingScore = 3457 },
    DIAMOND     = { minScore = 3264, wingScore = 3325 },
    EMERALD     = { minScore = 3102, wingScore = 3184 },
    PLATINUM    = { minScore = 2824, wingScore = 2943 },
    GOLD        = { minScore = 2531, wingScore = 2646 },
    SILVER      = { minScore = 1048, wingScore = 1949 },
    BRONZE      = { minScore =  310, wingScore =  592 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3773,
    CHALLENGER  = { minScore = 3678, wingScore = 3685 },
    GRANDMASTER = { minScore = 3637, wingScore = 3658 },
    MASTER      = { minScore = 3494, wingScore = 3566 },
    DIAMOND     = { minScore = 3357, wingScore = 3426 },
    EMERALD     = { minScore = 3175, wingScore = 3266 },
    PLATINUM    = { minScore = 2877, wingScore = 3001 },
    GOLD        = { minScore = 2528, wingScore = 2701 },
    SILVER      = { minScore = 1045, wingScore = 1945 },
    BRONZE      = { minScore =  310, wingScore =  591 },
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
