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
    top100Score = 4233,
    CHALLENGER  = { minScore = 4055, wingScore = 4129 },
    GRANDMASTER = { minScore = 3957, wingScore = 4012 },
    MASTER      = { minScore = 3818, wingScore = 3891 },
    DIAMOND     = { minScore = 3600, wingScore = 3675 },
    EMERALD     = { minScore = 3434, wingScore = 3511 },
    PLATINUM    = { minScore = 3111, wingScore = 3255 },
    GOLD        = { minScore = 2766, wingScore = 2987 },
    SILVER      = { minScore = 1416, wingScore = 2364 },
    BRONZE      = { minScore =  333, wingScore =  770 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4233,
    CHALLENGER  = { minScore = 3939, wingScore = 4129 },
    GRANDMASTER = { minScore = 3894, wingScore = 3917 },
    MASTER      = { minScore = 3737, wingScore = 3816 },
    DIAMOND     = { minScore = 3599, wingScore = 3668 },
    EMERALD     = { minScore = 3413, wingScore = 3506 },
    PLATINUM    = { minScore = 3121, wingScore = 3241 },
    GOLD        = { minScore = 2766, wingScore = 2927 },
    SILVER      = { minScore = 1416, wingScore = 2364 },
    BRONZE      = { minScore =  333, wingScore =  770 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4233,
    CHALLENGER  = { minScore = 4126, wingScore = 4129 },
    GRANDMASTER = { minScore = 4074, wingScore = 4100 },
    MASTER      = { minScore = 3893, wingScore = 3984 },
    DIAMOND     = { minScore = 3736, wingScore = 3815 },
    EMERALD     = { minScore = 3527, wingScore = 3632 },
    PLATINUM    = { minScore = 3179, wingScore = 3325 },
    GOLD        = { minScore = 2766, wingScore = 2971 },
    SILVER      = { minScore = 1416, wingScore = 2364 },
    BRONZE      = { minScore =  333, wingScore =  770 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4137,
    CHALLENGER  = { minScore = 4016, wingScore = 4071 },
    GRANDMASTER = { minScore = 3899, wingScore = 3940 },
    MASTER      = { minScore = 3746, wingScore = 3798 },
    DIAMOND     = { minScore = 3510, wingScore = 3604 },
    EMERALD     = { minScore = 3333, wingScore = 3415 },
    PLATINUM    = { minScore = 3047, wingScore = 3157 },
    GOLD        = { minScore = 2674, wingScore = 2884 },
    SILVER      = { minScore = 1201, wingScore = 2151 },
    BRONZE      = { minScore =  325, wingScore =  665 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4137,
    CHALLENGER  = { minScore = 3880, wingScore = 4071 },
    GRANDMASTER = { minScore = 3830, wingScore = 3855 },
    MASTER      = { minScore = 3654, wingScore = 3742 },
    DIAMOND     = { minScore = 3507, wingScore = 3580 },
    EMERALD     = { minScore = 3312, wingScore = 3409 },
    PLATINUM    = { minScore = 3046, wingScore = 3147 },
    GOLD        = { minScore = 2674, wingScore = 2858 },
    SILVER      = { minScore = 1201, wingScore = 2151 },
    BRONZE      = { minScore =  325, wingScore =  665 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4137,
    CHALLENGER  = { minScore = 4063, wingScore = 4071 },
    GRANDMASTER = { minScore = 4006, wingScore = 4035 },
    MASTER      = { minScore = 3804, wingScore = 3905 },
    DIAMOND     = { minScore = 3642, wingScore = 3723 },
    EMERALD     = { minScore = 3426, wingScore = 3534 },
    PLATINUM    = { minScore = 3116, wingScore = 3237 },
    GOLD        = { minScore = 2674, wingScore = 2910 },
    SILVER      = { minScore = 1201, wingScore = 2151 },
    BRONZE      = { minScore =  325, wingScore =  665 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4233,
    CHALLENGER  = { minScore = 4039, wingScore = 4105 },
    GRANDMASTER = { minScore = 3933, wingScore = 3982 },
    MASTER      = { minScore = 3788, wingScore = 3852 },
    DIAMOND     = { minScore = 3563, wingScore = 3645 },
    EMERALD     = { minScore = 3392, wingScore = 3471 },
    PLATINUM    = { minScore = 3084, wingScore = 3214 },
    GOLD        = { minScore = 2728, wingScore = 2944 },
    SILVER      = { minScore = 1327, wingScore = 2275 },
    BRONZE      = { minScore =  330, wingScore =  726 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4233,
    CHALLENGER  = { minScore = 3915, wingScore = 4105 },
    GRANDMASTER = { minScore = 3868, wingScore = 3892 },
    MASTER      = { minScore = 3703, wingScore = 3786 },
    DIAMOND     = { minScore = 3562, wingScore = 3632 },
    EMERALD     = { minScore = 3372, wingScore = 3466 },
    PLATINUM    = { minScore = 3090, wingScore = 3203 },
    GOLD        = { minScore = 2729, wingScore = 2899 },
    SILVER      = { minScore = 1328, wingScore = 2277 },
    BRONZE      = { minScore =  330, wingScore =  727 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4233,
    CHALLENGER  = { minScore = 4099, wingScore = 4104 },
    GRANDMASTER = { minScore = 4045, wingScore = 4072 },
    MASTER      = { minScore = 3855, wingScore = 3950 },
    DIAMOND     = { minScore = 3696, wingScore = 3776 },
    EMERALD     = { minScore = 3484, wingScore = 3590 },
    PLATINUM    = { minScore = 3152, wingScore = 3288 },
    GOLD        = { minScore = 2727, wingScore = 2945 },
    SILVER      = { minScore = 1325, wingScore = 2274 },
    BRONZE      = { minScore =  330, wingScore =  725 },
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
