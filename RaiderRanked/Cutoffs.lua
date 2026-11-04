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
    top100Score = 4250,
    CHALLENGER  = { minScore = 4100, wingScore = 4136 },
    GRANDMASTER = { minScore = 4010, wingScore = 4026 },
    MASTER      = { minScore = 3866, wingScore = 3908 },
    DIAMOND     = { minScore = 3622, wingScore = 3707 },
    EMERALD     = { minScore = 3455, wingScore = 3541 },
    PLATINUM    = { minScore = 3122, wingScore = 3271 },
    GOLD        = { minScore = 2774, wingScore = 2998 },
    SILVER      = { minScore = 1413, wingScore = 2368 },
    BRONZE      = { minScore =  333, wingScore =  766 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4250,
    CHALLENGER  = { minScore = 3986, wingScore = 4136 },
    GRANDMASTER = { minScore = 3939, wingScore = 3962 },
    MASTER      = { minScore = 3775, wingScore = 3857 },
    DIAMOND     = { minScore = 3628, wingScore = 3702 },
    EMERALD     = { minScore = 3433, wingScore = 3531 },
    PLATINUM    = { minScore = 3129, wingScore = 3253 },
    GOLD        = { minScore = 2774, wingScore = 2932 },
    SILVER      = { minScore = 1413, wingScore = 2368 },
    BRONZE      = { minScore =  333, wingScore =  766 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4250,
    CHALLENGER  = { minScore = 4136, wingScore = 4136 },
    GRANDMASTER = { minScore = 4086, wingScore = 4111 },
    MASTER      = { minScore = 3913, wingScore = 3999 },
    DIAMOND     = { minScore = 3756, wingScore = 3834 },
    EMERALD     = { minScore = 3546, wingScore = 3651 },
    PLATINUM    = { minScore = 3191, wingScore = 3342 },
    GOLD        = { minScore = 2774, wingScore = 2979 },
    SILVER      = { minScore = 1413, wingScore = 2368 },
    BRONZE      = { minScore =  333, wingScore =  766 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4155,
    CHALLENGER  = { minScore = 4039, wingScore = 4113 },
    GRANDMASTER = { minScore = 3931, wingScore = 3994 },
    MASTER      = { minScore = 3779, wingScore = 3836 },
    DIAMOND     = { minScore = 3541, wingScore = 3629 },
    EMERALD     = { minScore = 3352, wingScore = 3435 },
    PLATINUM    = { minScore = 3053, wingScore = 3169 },
    GOLD        = { minScore = 2679, wingScore = 2894 },
    SILVER      = { minScore = 1199, wingScore = 2153 },
    BRONZE      = { minScore =  325, wingScore =  665 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4155,
    CHALLENGER  = { minScore = 3900, wingScore = 4113 },
    GRANDMASTER = { minScore = 3850, wingScore = 3875 },
    MASTER      = { minScore = 3674, wingScore = 3762 },
    DIAMOND     = { minScore = 3525, wingScore = 3599 },
    EMERALD     = { minScore = 3326, wingScore = 3425 },
    PLATINUM    = { minScore = 3058, wingScore = 3159 },
    GOLD        = { minScore = 2679, wingScore = 2867 },
    SILVER      = { minScore = 1199, wingScore = 2153 },
    BRONZE      = { minScore =  325, wingScore =  665 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4155,
    CHALLENGER  = { minScore = 4104, wingScore = 4113 },
    GRANDMASTER = { minScore = 4046, wingScore = 4075 },
    MASTER      = { minScore = 3844, wingScore = 3945 },
    DIAMOND     = { minScore = 3675, wingScore = 3759 },
    EMERALD     = { minScore = 3449, wingScore = 3562 },
    PLATINUM    = { minScore = 3125, wingScore = 3252 },
    GOLD        = { minScore = 2679, wingScore = 2915 },
    SILVER      = { minScore = 1199, wingScore = 2153 },
    BRONZE      = { minScore =  325, wingScore =  665 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4250,
    CHALLENGER  = { minScore = 4075, wingScore = 4126 },
    GRANDMASTER = { minScore = 3977, wingScore = 4013 },
    MASTER      = { minScore = 3830, wingScore = 3878 },
    DIAMOND     = { minScore = 3588, wingScore = 3675 },
    EMERALD     = { minScore = 3412, wingScore = 3497 },
    PLATINUM    = { minScore = 3093, wingScore = 3229 },
    GOLD        = { minScore = 2734, wingScore = 2955 },
    SILVER      = { minScore = 1324, wingScore = 2279 },
    BRONZE      = { minScore =  330, wingScore =  724 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4250,
    CHALLENGER  = { minScore = 3951, wingScore = 4127 },
    GRANDMASTER = { minScore = 3903, wingScore = 3927 },
    MASTER      = { minScore = 3734, wingScore = 3818 },
    DIAMOND     = { minScore = 3586, wingScore = 3660 },
    EMERALD     = { minScore = 3389, wingScore = 3488 },
    PLATINUM    = { minScore = 3100, wingScore = 3215 },
    GOLD        = { minScore = 2735, wingScore = 2906 },
    SILVER      = { minScore = 1326, wingScore = 2280 },
    BRONZE      = { minScore =  330, wingScore =  725 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4250,
    CHALLENGER  = { minScore = 4122, wingScore = 4126 },
    GRANDMASTER = { minScore = 4069, wingScore = 4096 },
    MASTER      = { minScore = 3884, wingScore = 3976 },
    DIAMOND     = { minScore = 3722, wingScore = 3802 },
    EMERALD     = { minScore = 3505, wingScore = 3613 },
    PLATINUM    = { minScore = 3163, wingScore = 3304 },
    GOLD        = { minScore = 2734, wingScore = 2952 },
    SILVER      = { minScore = 1322, wingScore = 2277 },
    BRONZE      = { minScore =  330, wingScore =  723 },
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
