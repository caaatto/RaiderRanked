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
    top100Score = 3945,
    CHALLENGER  = { minScore = 3820, wingScore = 3880 },
    GRANDMASTER = { minScore = 3752, wingScore = 3776 },
    MASTER      = { minScore = 3629, wingScore = 3669 },
    DIAMOND     = { minScore = 3429, wingScore = 3511 },
    EMERALD     = { minScore = 3290, wingScore = 3351 },
    PLATINUM    = { minScore = 3020, wingScore = 3121 },
    GOLD        = { minScore = 2672, wingScore = 2839 },
    SILVER      = { minScore = 1308, wingScore = 2219 },
    BRONZE      = { minScore =  330, wingScore =  703 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3945,
    CHALLENGER  = { minScore = 3752, wingScore = 3880 },
    GRANDMASTER = { minScore = 3708, wingScore = 3730 },
    MASTER      = { minScore = 3557, wingScore = 3633 },
    DIAMOND     = { minScore = 3434, wingScore = 3495 },
    EMERALD     = { minScore = 3270, wingScore = 3352 },
    PLATINUM    = { minScore = 3004, wingScore = 3114 },
    GOLD        = { minScore = 2672, wingScore = 2828 },
    SILVER      = { minScore = 1308, wingScore = 2219 },
    BRONZE      = { minScore =  330, wingScore =  703 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3945,
    CHALLENGER  = { minScore = 3866, wingScore = 3880 },
    GRANDMASTER = { minScore = 3822, wingScore = 3844 },
    MASTER      = { minScore = 3668, wingScore = 3745 },
    DIAMOND     = { minScore = 3535, wingScore = 3602 },
    EMERALD     = { minScore = 3357, wingScore = 3446 },
    PLATINUM    = { minScore = 3072, wingScore = 3190 },
    GOLD        = { minScore = 2672, wingScore = 2879 },
    SILVER      = { minScore = 1308, wingScore = 2219 },
    BRONZE      = { minScore =  330, wingScore =  703 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3901,
    CHALLENGER  = { minScore = 3786, wingScore = 3833 },
    GRANDMASTER = { minScore = 3687, wingScore = 3728 },
    MASTER      = { minScore = 3556, wingScore = 3612 },
    DIAMOND     = { minScore = 3345, wingScore = 3428 },
    EMERALD     = { minScore = 3196, wingScore = 3264 },
    PLATINUM    = { minScore = 2972, wingScore = 3052 },
    GOLD        = { minScore = 2605, wingScore = 2757 },
    SILVER      = { minScore = 1105, wingScore = 2028 },
    BRONZE      = { minScore =  323, wingScore =  653 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3901,
    CHALLENGER  = { minScore = 3669, wingScore = 3833 },
    GRANDMASTER = { minScore = 3626, wingScore = 3647 },
    MASTER      = { minScore = 3473, wingScore = 3550 },
    DIAMOND     = { minScore = 3347, wingScore = 3410 },
    EMERALD     = { minScore = 3179, wingScore = 3263 },
    PLATINUM    = { minScore = 2909, wingScore = 3021 },
    GOLD        = { minScore = 2605, wingScore = 2734 },
    SILVER      = { minScore = 1105, wingScore = 2028 },
    BRONZE      = { minScore =  323, wingScore =  653 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3901,
    CHALLENGER  = { minScore = 3823, wingScore = 3833 },
    GRANDMASTER = { minScore = 3776, wingScore = 3799 },
    MASTER      = { minScore = 3614, wingScore = 3695 },
    DIAMOND     = { minScore = 3469, wingScore = 3541 },
    EMERALD     = { minScore = 3276, wingScore = 3373 },
    PLATINUM    = { minScore = 2989, wingScore = 3104 },
    GOLD        = { minScore = 2605, wingScore = 2805 },
    SILVER      = { minScore = 1105, wingScore = 2028 },
    BRONZE      = { minScore =  323, wingScore =  653 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3945,
    CHALLENGER  = { minScore = 3806, wingScore = 3860 },
    GRANDMASTER = { minScore = 3725, wingScore = 3756 },
    MASTER      = { minScore = 3598, wingScore = 3645 },
    DIAMOND     = { minScore = 3394, wingScore = 3476 },
    EMERALD     = { minScore = 3251, wingScore = 3315 },
    PLATINUM    = { minScore = 3000, wingScore = 3092 },
    GOLD        = { minScore = 2644, wingScore = 2805 },
    SILVER      = { minScore = 1223, wingScore = 2139 },
    BRONZE      = { minScore =  327, wingScore =  682 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3945,
    CHALLENGER  = { minScore = 3718, wingScore = 3861 },
    GRANDMASTER = { minScore = 3674, wingScore = 3696 },
    MASTER      = { minScore = 3523, wingScore = 3599 },
    DIAMOND     = { minScore = 3398, wingScore = 3460 },
    EMERALD     = { minScore = 3233, wingScore = 3316 },
    PLATINUM    = { minScore = 2965, wingScore = 3076 },
    GOLD        = { minScore = 2645, wingScore = 2790 },
    SILVER      = { minScore = 1225, wingScore = 2141 },
    BRONZE      = { minScore =  327, wingScore =  683 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3945,
    CHALLENGER  = { minScore = 3848, wingScore = 3860 },
    GRANDMASTER = { minScore = 3802, wingScore = 3825 },
    MASTER      = { minScore = 3645, wingScore = 3724 },
    DIAMOND     = { minScore = 3507, wingScore = 3576 },
    EMERALD     = { minScore = 3322, wingScore = 3415 },
    PLATINUM    = { minScore = 3037, wingScore = 3153 },
    GOLD        = { minScore = 2643, wingScore = 2847 },
    SILVER      = { minScore = 1221, wingScore = 2137 },
    BRONZE      = { minScore =  327, wingScore =  682 },
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
