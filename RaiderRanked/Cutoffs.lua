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
    top100Score = 3789,
    CHALLENGER  = { minScore = 3668, wingScore = 3714 },
    GRANDMASTER = { minScore = 3591, wingScore = 3629 },
    MASTER      = { minScore = 3480, wingScore = 3534 },
    DIAMOND     = { minScore = 3298, wingScore = 3366 },
    EMERALD     = { minScore = 3142, wingScore = 3211 },
    PLATINUM    = { minScore = 2876, wingScore = 3009 },
    GOLD        = { minScore = 2593, wingScore = 2709 },
    SILVER      = { minScore = 1110, wingScore = 2040 },
    BRONZE      = { minScore =  323, wingScore =  633 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3789,
    CHALLENGER  = { minScore = 3606, wingScore = 3714 },
    GRANDMASTER = { minScore = 3566, wingScore = 3586 },
    MASTER      = { minScore = 3425, wingScore = 3496 },
    DIAMOND     = { minScore = 3300, wingScore = 3363 },
    EMERALD     = { minScore = 3133, wingScore = 3217 },
    PLATINUM    = { minScore = 2855, wingScore = 2972 },
    GOLD        = { minScore = 2593, wingScore = 2695 },
    SILVER      = { minScore = 1110, wingScore = 2040 },
    BRONZE      = { minScore =  323, wingScore =  633 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3789,
    CHALLENGER  = { minScore = 3703, wingScore = 3714 },
    GRANDMASTER = { minScore = 3665, wingScore = 3684 },
    MASTER      = { minScore = 3533, wingScore = 3599 },
    DIAMOND     = { minScore = 3397, wingScore = 3465 },
    EMERALD     = { minScore = 3214, wingScore = 3306 },
    PLATINUM    = { minScore = 2912, wingScore = 3039 },
    GOLD        = { minScore = 2593, wingScore = 2743 },
    SILVER      = { minScore = 1110, wingScore = 2040 },
    BRONZE      = { minScore =  323, wingScore =  633 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3721,
    CHALLENGER  = { minScore = 3637, wingScore = 3673 },
    GRANDMASTER = { minScore = 3548, wingScore = 3580 },
    MASTER      = { minScore = 3425, wingScore = 3471 },
    DIAMOND     = { minScore = 3216, wingScore = 3303 },
    EMERALD     = { minScore = 3069, wingScore = 3130 },
    PLATINUM    = { minScore = 2809, wingScore = 2950 },
    GOLD        = { minScore = 2470, wingScore = 2661 },
    SILVER      = { minScore = 977, wingScore = 1850 },
    BRONZE      = { minScore =  310, wingScore =  541 },
    IRON        = { minScore =    1, wingScore =  167 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3721,
    CHALLENGER  = { minScore = 3542, wingScore = 3673 },
    GRANDMASTER = { minScore = 3499, wingScore = 3520 },
    MASTER      = { minScore = 3348, wingScore = 3423 },
    DIAMOND     = { minScore = 3233, wingScore = 3291 },
    EMERALD     = { minScore = 3080, wingScore = 3156 },
    PLATINUM    = { minScore = 2799, wingScore = 2921 },
    GOLD        = { minScore = 2470, wingScore = 2604 },
    SILVER      = { minScore = 977, wingScore = 1850 },
    BRONZE      = { minScore =  310, wingScore =  541 },
    IRON        = { minScore =    1, wingScore =  167 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3721,
    CHALLENGER  = { minScore = 3665, wingScore = 3673 },
    GRANDMASTER = { minScore = 3623, wingScore = 3644 },
    MASTER      = { minScore = 3473, wingScore = 3548 },
    DIAMOND     = { minScore = 3334, wingScore = 3403 },
    EMERALD     = { minScore = 3148, wingScore = 3241 },
    PLATINUM    = { minScore = 2853, wingScore = 2974 },
    GOLD        = { minScore = 2470, wingScore = 2672 },
    SILVER      = { minScore = 977, wingScore = 1850 },
    BRONZE      = { minScore =  310, wingScore =  541 },
    IRON        = { minScore =    1, wingScore =  167 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3789,
    CHALLENGER  = { minScore = 3655, wingScore = 3697 },
    GRANDMASTER = { minScore = 3573, wingScore = 3608 },
    MASTER      = { minScore = 3457, wingScore = 3507 },
    DIAMOND     = { minScore = 3263, wingScore = 3339 },
    EMERALD     = { minScore = 3111, wingScore = 3177 },
    PLATINUM    = { minScore = 2848, wingScore = 2984 },
    GOLD        = { minScore = 2541, wingScore = 2689 },
    SILVER      = { minScore = 1054, wingScore = 1960 },
    BRONZE      = { minScore =  310, wingScore =  594 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3789,
    CHALLENGER  = { minScore = 3580, wingScore = 3697 },
    GRANDMASTER = { minScore = 3538, wingScore = 3559 },
    MASTER      = { minScore = 3393, wingScore = 3466 },
    DIAMOND     = { minScore = 3272, wingScore = 3333 },
    EMERALD     = { minScore = 3111, wingScore = 3192 },
    PLATINUM    = { minScore = 2832, wingScore = 2951 },
    GOLD        = { minScore = 2542, wingScore = 2657 },
    SILVER      = { minScore = 1055, wingScore = 1962 },
    BRONZE      = { minScore =  310, wingScore =  595 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3789,
    CHALLENGER  = { minScore = 3687, wingScore = 3696 },
    GRANDMASTER = { minScore = 3647, wingScore = 3667 },
    MASTER      = { minScore = 3507, wingScore = 3577 },
    DIAMOND     = { minScore = 3370, wingScore = 3438 },
    EMERALD     = { minScore = 3186, wingScore = 3278 },
    PLATINUM    = { minScore = 2887, wingScore = 3011 },
    GOLD        = { minScore = 2540, wingScore = 2712 },
    SILVER      = { minScore = 1053, wingScore = 1958 },
    BRONZE      = { minScore =  310, wingScore =  593 },
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
