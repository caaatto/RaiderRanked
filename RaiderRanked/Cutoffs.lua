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
    top100Score = 3979,
    CHALLENGER  = { minScore = 3864, wingScore = 3902 },
    GRANDMASTER = { minScore = 3777, wingScore = 3804 },
    MASTER      = { minScore = 3659, wingScore = 3703 },
    DIAMOND     = { minScore = 3457, wingScore = 3541 },
    EMERALD     = { minScore = 3317, wingScore = 3384 },
    PLATINUM    = { minScore = 3037, wingScore = 3150 },
    GOLD        = { minScore = 2691, wingScore = 2872 },
    SILVER      = { minScore = 1333, wingScore = 2268 },
    BRONZE      = { minScore =  331, wingScore =  724 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3979,
    CHALLENGER  = { minScore = 3777, wingScore = 3902 },
    GRANDMASTER = { minScore = 3735, wingScore = 3756 },
    MASTER      = { minScore = 3591, wingScore = 3663 },
    DIAMOND     = { minScore = 3465, wingScore = 3528 },
    EMERALD     = { minScore = 3298, wingScore = 3382 },
    PLATINUM    = { minScore = 3040, wingScore = 3145 },
    GOLD        = { minScore = 2691, wingScore = 2860 },
    SILVER      = { minScore = 1333, wingScore = 2268 },
    BRONZE      = { minScore =  331, wingScore =  724 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3979,
    CHALLENGER  = { minScore = 3897, wingScore = 3902 },
    GRANDMASTER = { minScore = 3854, wingScore = 3876 },
    MASTER      = { minScore = 3706, wingScore = 3780 },
    DIAMOND     = { minScore = 3572, wingScore = 3639 },
    EMERALD     = { minScore = 3393, wingScore = 3482 },
    PLATINUM    = { minScore = 3103, wingScore = 3223 },
    GOLD        = { minScore = 2691, wingScore = 2905 },
    SILVER      = { minScore = 1333, wingScore = 2268 },
    BRONZE      = { minScore =  331, wingScore =  724 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3931,
    CHALLENGER  = { minScore = 3818, wingScore = 3877 },
    GRANDMASTER = { minScore = 3725, wingScore = 3770 },
    MASTER      = { minScore = 3590, wingScore = 3651 },
    DIAMOND     = { minScore = 3379, wingScore = 3456 },
    EMERALD     = { minScore = 3225, wingScore = 3298 },
    PLATINUM    = { minScore = 3001, wingScore = 3075 },
    GOLD        = { minScore = 2628, wingScore = 2786 },
    SILVER      = { minScore = 1142, wingScore = 2069 },
    BRONZE      = { minScore =  324, wingScore =  658 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3931,
    CHALLENGER  = { minScore = 3705, wingScore = 3877 },
    GRANDMASTER = { minScore = 3662, wingScore = 3684 },
    MASTER      = { minScore = 3511, wingScore = 3587 },
    DIAMOND     = { minScore = 3381, wingScore = 3446 },
    EMERALD     = { minScore = 3208, wingScore = 3295 },
    PLATINUM    = { minScore = 2941, wingScore = 3050 },
    GOLD        = { minScore = 2628, wingScore = 2768 },
    SILVER      = { minScore = 1142, wingScore = 2069 },
    BRONZE      = { minScore =  324, wingScore =  658 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3931,
    CHALLENGER  = { minScore = 3867, wingScore = 3877 },
    GRANDMASTER = { minScore = 3820, wingScore = 3844 },
    MASTER      = { minScore = 3654, wingScore = 3737 },
    DIAMOND     = { minScore = 3506, wingScore = 3580 },
    EMERALD     = { minScore = 3308, wingScore = 3407 },
    PLATINUM    = { minScore = 3025, wingScore = 3136 },
    GOLD        = { minScore = 2628, wingScore = 2838 },
    SILVER      = { minScore = 1142, wingScore = 2069 },
    BRONZE      = { minScore =  324, wingScore =  658 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3979,
    CHALLENGER  = { minScore = 3845, wingScore = 3892 },
    GRANDMASTER = { minScore = 3755, wingScore = 3790 },
    MASTER      = { minScore = 3630, wingScore = 3681 },
    DIAMOND     = { minScore = 3424, wingScore = 3505 },
    EMERALD     = { minScore = 3279, wingScore = 3348 },
    PLATINUM    = { minScore = 3022, wingScore = 3119 },
    GOLD        = { minScore = 2665, wingScore = 2836 },
    SILVER      = { minScore = 1253, wingScore = 2185 },
    BRONZE      = { minScore =  328, wingScore =  696 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3979,
    CHALLENGER  = { minScore = 3748, wingScore = 3892 },
    GRANDMASTER = { minScore = 3705, wingScore = 3727 },
    MASTER      = { minScore = 3558, wingScore = 3632 },
    DIAMOND     = { minScore = 3431, wingScore = 3494 },
    EMERALD     = { minScore = 3261, wingScore = 3346 },
    PLATINUM    = { minScore = 2999, wingScore = 3106 },
    GOLD        = { minScore = 2665, wingScore = 2822 },
    SILVER      = { minScore = 1255, wingScore = 2187 },
    BRONZE      = { minScore =  328, wingScore =  697 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3979,
    CHALLENGER  = { minScore = 3884, wingScore = 3891 },
    GRANDMASTER = { minScore = 3839, wingScore = 3862 },
    MASTER      = { minScore = 3684, wingScore = 3762 },
    DIAMOND     = { minScore = 3544, wingScore = 3614 },
    EMERALD     = { minScore = 3357, wingScore = 3450 },
    PLATINUM    = { minScore = 3070, wingScore = 3186 },
    GOLD        = { minScore = 2664, wingScore = 2876 },
    SILVER      = { minScore = 1251, wingScore = 2183 },
    BRONZE      = { minScore =  328, wingScore =  696 },
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
