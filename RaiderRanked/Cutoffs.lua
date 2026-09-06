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
    top100Score = 3740,
    CHALLENGER  = { minScore = 3643, wingScore = 3677 },
    GRANDMASTER = { minScore = 3554, wingScore = 3584 },
    MASTER      = { minScore = 3441, wingScore = 3490 },
    DIAMOND     = { minScore = 3254, wingScore = 3329 },
    EMERALD     = { minScore = 3105, wingScore = 3176 },
    PLATINUM    = { minScore = 2840, wingScore = 2986 },
    GOLD        = { minScore = 2551, wingScore = 2688 },
    SILVER      = { minScore = 1053, wingScore = 1996 },
    BRONZE      = { minScore =  320, wingScore =  610 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3740,
    CHALLENGER  = { minScore = 3564, wingScore = 3677 },
    GRANDMASTER = { minScore = 3525, wingScore = 3545 },
    MASTER      = { minScore = 3389, wingScore = 3457 },
    DIAMOND     = { minScore = 3267, wingScore = 3328 },
    EMERALD     = { minScore = 3104, wingScore = 3186 },
    PLATINUM    = { minScore = 2828, wingScore = 2945 },
    GOLD        = { minScore = 2551, wingScore = 2659 },
    SILVER      = { minScore = 1053, wingScore = 1996 },
    BRONZE      = { minScore =  320, wingScore =  610 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3740,
    CHALLENGER  = { minScore = 3670, wingScore = 3677 },
    GRANDMASTER = { minScore = 3629, wingScore = 3650 },
    MASTER      = { minScore = 3484, wingScore = 3556 },
    DIAMOND     = { minScore = 3351, wingScore = 3418 },
    EMERALD     = { minScore = 3174, wingScore = 3263 },
    PLATINUM    = { minScore = 2879, wingScore = 3003 },
    GOLD        = { minScore = 2551, wingScore = 2709 },
    SILVER      = { minScore = 1053, wingScore = 1996 },
    BRONZE      = { minScore =  320, wingScore =  610 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3682,
    CHALLENGER  = { minScore = 3591, wingScore = 3639 },
    GRANDMASTER = { minScore = 3510, wingScore = 3541 },
    MASTER      = { minScore = 3383, wingScore = 3432 },
    DIAMOND     = { minScore = 3175, wingScore = 3255 },
    EMERALD     = { minScore = 3037, wingScore = 3091 },
    PLATINUM    = { minScore = 2770, wingScore = 2897 },
    GOLD        = { minScore = 2400, wingScore = 2638 },
    SILVER      = { minScore = 934, wingScore = 1752 },
    BRONZE      = { minScore =  310, wingScore =  521 },
    IRON        = { minScore =    1, wingScore =  167 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3682,
    CHALLENGER  = { minScore = 3505, wingScore = 3639 },
    GRANDMASTER = { minScore = 3461, wingScore = 3483 },
    MASTER      = { minScore = 3309, wingScore = 3385 },
    DIAMOND     = { minScore = 3192, wingScore = 3251 },
    EMERALD     = { minScore = 3037, wingScore = 3115 },
    PLATINUM    = { minScore = 2766, wingScore = 2882 },
    GOLD        = { minScore = 2400, wingScore = 2563 },
    SILVER      = { minScore = 934, wingScore = 1752 },
    BRONZE      = { minScore =  310, wingScore =  521 },
    IRON        = { minScore =    1, wingScore =  167 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3682,
    CHALLENGER  = { minScore = 3626, wingScore = 3639 },
    GRANDMASTER = { minScore = 3582, wingScore = 3604 },
    MASTER      = { minScore = 3430, wingScore = 3506 },
    DIAMOND     = { minScore = 3295, wingScore = 3363 },
    EMERALD     = { minScore = 3116, wingScore = 3205 },
    PLATINUM    = { minScore = 2822, wingScore = 2944 },
    GOLD        = { minScore = 2400, wingScore = 2628 },
    SILVER      = { minScore = 934, wingScore = 1752 },
    BRONZE      = { minScore =  310, wingScore =  521 },
    IRON        = { minScore =    1, wingScore =  167 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3740,
    CHALLENGER  = { minScore = 3621, wingScore = 3661 },
    GRANDMASTER = { minScore = 3536, wingScore = 3566 },
    MASTER      = { minScore = 3417, wingScore = 3466 },
    DIAMOND     = { minScore = 3221, wingScore = 3298 },
    EMERALD     = { minScore = 3076, wingScore = 3140 },
    PLATINUM    = { minScore = 2811, wingScore = 2949 },
    GOLD        = { minScore = 2488, wingScore = 2667 },
    SILVER      = { minScore = 1003, wingScore = 1894 },
    BRONZE      = { minScore =  310, wingScore =  573 },
    IRON        = { minScore =    1, wingScore =  168 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3740,
    CHALLENGER  = { minScore = 3540, wingScore = 3661 },
    GRANDMASTER = { minScore = 3499, wingScore = 3520 },
    MASTER      = { minScore = 3356, wingScore = 3427 },
    DIAMOND     = { minScore = 3236, wingScore = 3296 },
    EMERALD     = { minScore = 3077, wingScore = 3157 },
    PLATINUM    = { minScore = 2803, wingScore = 2919 },
    GOLD        = { minScore = 2489, wingScore = 2620 },
    SILVER      = { minScore = 1004, wingScore = 1896 },
    BRONZE      = { minScore =  310, wingScore =  574 },
    IRON        = { minScore =    1, wingScore =  168 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3740,
    CHALLENGER  = { minScore = 3651, wingScore = 3661 },
    GRANDMASTER = { minScore = 3609, wingScore = 3630 },
    MASTER      = { minScore = 3461, wingScore = 3535 },
    DIAMOND     = { minScore = 3327, wingScore = 3394 },
    EMERALD     = { minScore = 3149, wingScore = 3238 },
    PLATINUM    = { minScore = 2855, wingScore = 2978 },
    GOLD        = { minScore = 2486, wingScore = 2674 },
    SILVER      = { minScore = 1002, wingScore = 1891 },
    BRONZE      = { minScore =  310, wingScore =  572 },
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
