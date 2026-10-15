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
    top100Score = 4070,
    CHALLENGER  = { minScore = 3923, wingScore = 3984 },
    GRANDMASTER = { minScore = 3854, wingScore = 3891 },
    MASTER      = { minScore = 3730, wingScore = 3777 },
    DIAMOND     = { minScore = 3533, wingScore = 3605 },
    EMERALD     = { minScore = 3376, wingScore = 3440 },
    PLATINUM    = { minScore = 3077, wingScore = 3208 },
    GOLD        = { minScore = 2731, wingScore = 2941 },
    SILVER      = { minScore = 1372, wingScore = 2318 },
    BRONZE      = { minScore =  332, wingScore =  747 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4070,
    CHALLENGER  = { minScore = 3848, wingScore = 3984 },
    GRANDMASTER = { minScore = 3806, wingScore = 3827 },
    MASTER      = { minScore = 3659, wingScore = 3732 },
    DIAMOND     = { minScore = 3530, wingScore = 3594 },
    EMERALD     = { minScore = 3358, wingScore = 3444 },
    PLATINUM    = { minScore = 3094, wingScore = 3201 },
    GOLD        = { minScore = 2731, wingScore = 2906 },
    SILVER      = { minScore = 1372, wingScore = 2318 },
    BRONZE      = { minScore =  332, wingScore =  747 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4070,
    CHALLENGER  = { minScore = 3976, wingScore = 3984 },
    GRANDMASTER = { minScore = 3932, wingScore = 3954 },
    MASTER      = { minScore = 3779, wingScore = 3855 },
    DIAMOND     = { minScore = 3639, wingScore = 3709 },
    EMERALD     = { minScore = 3452, wingScore = 3545 },
    PLATINUM    = { minScore = 3140, wingScore = 3271 },
    GOLD        = { minScore = 2731, wingScore = 2939 },
    SILVER      = { minScore = 1372, wingScore = 2318 },
    BRONZE      = { minScore =  332, wingScore =  747 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4004,
    CHALLENGER  = { minScore = 3892, wingScore = 3930 },
    GRANDMASTER = { minScore = 3789, wingScore = 3830 },
    MASTER      = { minScore = 3660, wingScore = 3709 },
    DIAMOND     = { minScore = 3438, wingScore = 3532 },
    EMERALD     = { minScore = 3285, wingScore = 3353 },
    PLATINUM    = { minScore = 3025, wingScore = 3119 },
    GOLD        = { minScore = 2653, wingScore = 2842 },
    SILVER      = { minScore = 1175, wingScore = 2115 },
    BRONZE      = { minScore =  324, wingScore =  661 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4004,
    CHALLENGER  = { minScore = 3774, wingScore = 3930 },
    GRANDMASTER = { minScore = 3729, wingScore = 3751 },
    MASTER      = { minScore = 3571, wingScore = 3650 },
    DIAMOND     = { minScore = 3440, wingScore = 3505 },
    EMERALD     = { minScore = 3264, wingScore = 3352 },
    PLATINUM    = { minScore = 3002, wingScore = 3106 },
    GOLD        = { minScore = 2653, wingScore = 2820 },
    SILVER      = { minScore = 1175, wingScore = 2115 },
    BRONZE      = { minScore =  324, wingScore =  661 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4004,
    CHALLENGER  = { minScore = 3924, wingScore = 3930 },
    GRANDMASTER = { minScore = 3878, wingScore = 3901 },
    MASTER      = { minScore = 3715, wingScore = 3796 },
    DIAMOND     = { minScore = 3565, wingScore = 3640 },
    EMERALD     = { minScore = 3366, wingScore = 3466 },
    PLATINUM    = { minScore = 3086, wingScore = 3194 },
    GOLD        = { minScore = 2653, wingScore = 2889 },
    SILVER      = { minScore = 1175, wingScore = 2115 },
    BRONZE      = { minScore =  324, wingScore =  661 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4070,
    CHALLENGER  = { minScore = 3910, wingScore = 3962 },
    GRANDMASTER = { minScore = 3827, wingScore = 3866 },
    MASTER      = { minScore = 3701, wingScore = 3749 },
    DIAMOND     = { minScore = 3493, wingScore = 3575 },
    EMERALD     = { minScore = 3338, wingScore = 3404 },
    PLATINUM    = { minScore = 3055, wingScore = 3171 },
    GOLD        = { minScore = 2698, wingScore = 2900 },
    SILVER      = { minScore = 1290, wingScore = 2233 },
    BRONZE      = { minScore =  329, wingScore =  711 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4070,
    CHALLENGER  = { minScore = 3818, wingScore = 3962 },
    GRANDMASTER = { minScore = 3775, wingScore = 3796 },
    MASTER      = { minScore = 3623, wingScore = 3699 },
    DIAMOND     = { minScore = 3493, wingScore = 3558 },
    EMERALD     = { minScore = 3320, wingScore = 3406 },
    PLATINUM    = { minScore = 3056, wingScore = 3162 },
    GOLD        = { minScore = 2699, wingScore = 2871 },
    SILVER      = { minScore = 1292, wingScore = 2235 },
    BRONZE      = { minScore =  329, wingScore =  712 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4070,
    CHALLENGER  = { minScore = 3954, wingScore = 3961 },
    GRANDMASTER = { minScore = 3909, wingScore = 3931 },
    MASTER      = { minScore = 3752, wingScore = 3830 },
    DIAMOND     = { minScore = 3608, wingScore = 3680 },
    EMERALD     = { minScore = 3415, wingScore = 3511 },
    PLATINUM    = { minScore = 3117, wingScore = 3238 },
    GOLD        = { minScore = 2698, wingScore = 2918 },
    SILVER      = { minScore = 1288, wingScore = 2232 },
    BRONZE      = { minScore =  329, wingScore =  710 },
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
