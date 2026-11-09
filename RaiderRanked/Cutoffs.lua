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
    top100Score = 4251,
    CHALLENGER  = { minScore = 4117, wingScore = 4140 },
    GRANDMASTER = { minScore = 4013, wingScore = 4033 },
    MASTER      = { minScore = 3882, wingScore = 3916 },
    DIAMOND     = { minScore = 3631, wingScore = 3718 },
    EMERALD     = { minScore = 3463, wingScore = 3548 },
    PLATINUM    = { minScore = 3125, wingScore = 3277 },
    GOLD        = { minScore = 2778, wingScore = 3000 },
    SILVER      = { minScore = 1418, wingScore = 2372 },
    BRONZE      = { minScore =  333, wingScore =  772 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4251,
    CHALLENGER  = { minScore = 4008, wingScore = 4140 },
    GRANDMASTER = { minScore = 3957, wingScore = 3982 },
    MASTER      = { minScore = 3780, wingScore = 3869 },
    DIAMOND     = { minScore = 3634, wingScore = 3707 },
    EMERALD     = { minScore = 3439, wingScore = 3536 },
    PLATINUM    = { minScore = 3132, wingScore = 3257 },
    GOLD        = { minScore = 2778, wingScore = 2934 },
    SILVER      = { minScore = 1418, wingScore = 2372 },
    BRONZE      = { minScore =  333, wingScore =  772 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4251,
    CHALLENGER  = { minScore = 4139, wingScore = 4140 },
    GRANDMASTER = { minScore = 4091, wingScore = 4115 },
    MASTER      = { minScore = 3924, wingScore = 4007 },
    DIAMOND     = { minScore = 3766, wingScore = 3845 },
    EMERALD     = { minScore = 3555, wingScore = 3660 },
    PLATINUM    = { minScore = 3196, wingScore = 3348 },
    GOLD        = { minScore = 2778, wingScore = 2983 },
    SILVER      = { minScore = 1418, wingScore = 2372 },
    BRONZE      = { minScore =  333, wingScore =  772 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4167,
    CHALLENGER  = { minScore = 4055, wingScore = 4126 },
    GRANDMASTER = { minScore = 3942, wingScore = 4007 },
    MASTER      = { minScore = 3787, wingScore = 3849 },
    DIAMOND     = { minScore = 3550, wingScore = 3639 },
    EMERALD     = { minScore = 3359, wingScore = 3441 },
    PLATINUM    = { minScore = 3055, wingScore = 3173 },
    GOLD        = { minScore = 2680, wingScore = 2898 },
    SILVER      = { minScore = 1201, wingScore = 2155 },
    BRONZE      = { minScore =  325, wingScore =  666 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4167,
    CHALLENGER  = { minScore = 3908, wingScore = 4126 },
    GRANDMASTER = { minScore = 3859, wingScore = 3884 },
    MASTER      = { minScore = 3685, wingScore = 3772 },
    DIAMOND     = { minScore = 3534, wingScore = 3609 },
    EMERALD     = { minScore = 3332, wingScore = 3433 },
    PLATINUM    = { minScore = 3062, wingScore = 3164 },
    GOLD        = { minScore = 2680, wingScore = 2870 },
    SILVER      = { minScore = 1201, wingScore = 2155 },
    BRONZE      = { minScore =  325, wingScore =  666 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4167,
    CHALLENGER  = { minScore = 4117, wingScore = 4126 },
    GRANDMASTER = { minScore = 4059, wingScore = 4088 },
    MASTER      = { minScore = 3857, wingScore = 3958 },
    DIAMOND     = { minScore = 3686, wingScore = 3772 },
    EMERALD     = { minScore = 3457, wingScore = 3571 },
    PLATINUM    = { minScore = 3128, wingScore = 3257 },
    GOLD        = { minScore = 2680, wingScore = 2917 },
    SILVER      = { minScore = 1201, wingScore = 2155 },
    BRONZE      = { minScore =  325, wingScore =  666 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4251,
    CHALLENGER  = { minScore = 4091, wingScore = 4134 },
    GRANDMASTER = { minScore = 3983, wingScore = 4022 },
    MASTER      = { minScore = 3843, wingScore = 3888 },
    DIAMOND     = { minScore = 3597, wingScore = 3685 },
    EMERALD     = { minScore = 3420, wingScore = 3504 },
    PLATINUM    = { minScore = 3096, wingScore = 3234 },
    GOLD        = { minScore = 2737, wingScore = 2958 },
    SILVER      = { minScore = 1328, wingScore = 2282 },
    BRONZE      = { minScore =  330, wingScore =  728 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4251,
    CHALLENGER  = { minScore = 3967, wingScore = 4134 },
    GRANDMASTER = { minScore = 3917, wingScore = 3942 },
    MASTER      = { minScore = 3741, wingScore = 3829 },
    DIAMOND     = { minScore = 3593, wingScore = 3667 },
    EMERALD     = { minScore = 3395, wingScore = 3494 },
    PLATINUM    = { minScore = 3103, wingScore = 3219 },
    GOLD        = { minScore = 2738, wingScore = 2908 },
    SILVER      = { minScore = 1330, wingScore = 2284 },
    BRONZE      = { minScore =  330, wingScore =  729 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4251,
    CHALLENGER  = { minScore = 4130, wingScore = 4134 },
    GRANDMASTER = { minScore = 4077, wingScore = 4104 },
    MASTER      = { minScore = 3896, wingScore = 3986 },
    DIAMOND     = { minScore = 3732, wingScore = 3814 },
    EMERALD     = { minScore = 3513, wingScore = 3622 },
    PLATINUM    = { minScore = 3167, wingScore = 3309 },
    GOLD        = { minScore = 2736, wingScore = 2955 },
    SILVER      = { minScore = 1326, wingScore = 2280 },
    BRONZE      = { minScore =  330, wingScore =  727 },
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
