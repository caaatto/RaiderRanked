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
    top100Score = 4009,
    CHALLENGER  = { minScore = 3891, wingScore = 3920 },
    GRANDMASTER = { minScore = 3793, wingScore = 3829 },
    MASTER      = { minScore = 3674, wingScore = 3728 },
    DIAMOND     = { minScore = 3479, wingScore = 3556 },
    EMERALD     = { minScore = 3333, wingScore = 3406 },
    PLATINUM    = { minScore = 3048, wingScore = 3171 },
    GOLD        = { minScore = 2703, wingScore = 2893 },
    SILVER      = { minScore = 1346, wingScore = 2289 },
    BRONZE      = { minScore =  332, wingScore =  735 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4009,
    CHALLENGER  = { minScore = 3787, wingScore = 3920 },
    GRANDMASTER = { minScore = 3748, wingScore = 3768 },
    MASTER      = { minScore = 3609, wingScore = 3678 },
    DIAMOND     = { minScore = 3481, wingScore = 3545 },
    EMERALD     = { minScore = 3311, wingScore = 3396 },
    PLATINUM    = { minScore = 3054, wingScore = 3157 },
    GOLD        = { minScore = 2703, wingScore = 2873 },
    SILVER      = { minScore = 1346, wingScore = 2289 },
    BRONZE      = { minScore =  332, wingScore =  735 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4009,
    CHALLENGER  = { minScore = 3909, wingScore = 3920 },
    GRANDMASTER = { minScore = 3868, wingScore = 3888 },
    MASTER      = { minScore = 3724, wingScore = 3796 },
    DIAMOND     = { minScore = 3587, wingScore = 3655 },
    EMERALD     = { minScore = 3405, wingScore = 3496 },
    PLATINUM    = { minScore = 3110, wingScore = 3233 },
    GOLD        = { minScore = 2703, wingScore = 2912 },
    SILVER      = { minScore = 1346, wingScore = 2289 },
    BRONZE      = { minScore =  332, wingScore =  735 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3950,
    CHALLENGER  = { minScore = 3843, wingScore = 3893 },
    GRANDMASTER = { minScore = 3752, wingScore = 3781 },
    MASTER      = { minScore = 3613, wingScore = 3663 },
    DIAMOND     = { minScore = 3402, wingScore = 3477 },
    EMERALD     = { minScore = 3242, wingScore = 3313 },
    PLATINUM    = { minScore = 3008, wingScore = 3087 },
    GOLD        = { minScore = 2636, wingScore = 2802 },
    SILVER      = { minScore = 1155, wingScore = 2084 },
    BRONZE      = { minScore =  324, wingScore =  660 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3950,
    CHALLENGER  = { minScore = 3723, wingScore = 3893 },
    GRANDMASTER = { minScore = 3680, wingScore = 3702 },
    MASTER      = { minScore = 3528, wingScore = 3604 },
    DIAMOND     = { minScore = 3397, wingScore = 3462 },
    EMERALD     = { minScore = 3221, wingScore = 3309 },
    PLATINUM    = { minScore = 2954, wingScore = 3062 },
    GOLD        = { minScore = 2636, wingScore = 2780 },
    SILVER      = { minScore = 1155, wingScore = 2084 },
    BRONZE      = { minScore =  324, wingScore =  660 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3950,
    CHALLENGER  = { minScore = 3890, wingScore = 3893 },
    GRANDMASTER = { minScore = 3840, wingScore = 3865 },
    MASTER      = { minScore = 3664, wingScore = 3752 },
    DIAMOND     = { minScore = 3517, wingScore = 3591 },
    EMERALD     = { minScore = 3321, wingScore = 3419 },
    PLATINUM    = { minScore = 3041, wingScore = 3150 },
    GOLD        = { minScore = 2636, wingScore = 2851 },
    SILVER      = { minScore = 1155, wingScore = 2084 },
    BRONZE      = { minScore =  324, wingScore =  660 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4009,
    CHALLENGER  = { minScore = 3871, wingScore = 3909 },
    GRANDMASTER = { minScore = 3776, wingScore = 3809 },
    MASTER      = { minScore = 3649, wingScore = 3701 },
    DIAMOND     = { minScore = 3447, wingScore = 3523 },
    EMERALD     = { minScore = 3295, wingScore = 3367 },
    PLATINUM    = { minScore = 3031, wingScore = 3136 },
    GOLD        = { minScore = 2675, wingScore = 2855 },
    SILVER      = { minScore = 1266, wingScore = 2203 },
    BRONZE      = { minScore =  329, wingScore =  704 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4009,
    CHALLENGER  = { minScore = 3761, wingScore = 3909 },
    GRANDMASTER = { minScore = 3720, wingScore = 3741 },
    MASTER      = { minScore = 3576, wingScore = 3648 },
    DIAMOND     = { minScore = 3447, wingScore = 3511 },
    EMERALD     = { minScore = 3274, wingScore = 3360 },
    PLATINUM    = { minScore = 3013, wingScore = 3118 },
    GOLD        = { minScore = 2676, wingScore = 2835 },
    SILVER      = { minScore = 1268, wingScore = 2205 },
    BRONZE      = { minScore =  329, wingScore =  704 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4009,
    CHALLENGER  = { minScore = 3901, wingScore = 3908 },
    GRANDMASTER = { minScore = 3856, wingScore = 3878 },
    MASTER      = { minScore = 3698, wingScore = 3777 },
    DIAMOND     = { minScore = 3557, wingScore = 3628 },
    EMERALD     = { minScore = 3369, wingScore = 3463 },
    PLATINUM    = { minScore = 3081, wingScore = 3198 },
    GOLD        = { minScore = 2674, wingScore = 2886 },
    SILVER      = { minScore = 1264, wingScore = 2201 },
    BRONZE      = { minScore =  329, wingScore =  703 },
    IRON        = { minScore =    1, wingScore =  170 },
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
