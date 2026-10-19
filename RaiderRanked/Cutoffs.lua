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
    top100Score = 4127,
    CHALLENGER  = { minScore = 3972, wingScore = 4019 },
    GRANDMASTER = { minScore = 3892, wingScore = 3907 },
    MASTER      = { minScore = 3769, wingScore = 3801 },
    DIAMOND     = { minScore = 3550, wingScore = 3633 },
    EMERALD     = { minScore = 3400, wingScore = 3462 },
    PLATINUM    = { minScore = 3089, wingScore = 3224 },
    GOLD        = { minScore = 2743, wingScore = 2960 },
    SILVER      = { minScore = 1391, wingScore = 2333 },
    BRONZE      = { minScore =  333, wingScore =  759 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4127,
    CHALLENGER  = { minScore = 3888, wingScore = 4019 },
    GRANDMASTER = { minScore = 3840, wingScore = 3864 },
    MASTER      = { minScore = 3674, wingScore = 3757 },
    DIAMOND     = { minScore = 3546, wingScore = 3610 },
    EMERALD     = { minScore = 3375, wingScore = 3460 },
    PLATINUM    = { minScore = 3103, wingScore = 3215 },
    GOLD        = { minScore = 2743, wingScore = 2912 },
    SILVER      = { minScore = 1391, wingScore = 2333 },
    BRONZE      = { minScore =  333, wingScore =  759 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4127,
    CHALLENGER  = { minScore = 4015, wingScore = 4019 },
    GRANDMASTER = { minScore = 3967, wingScore = 3991 },
    MASTER      = { minScore = 3801, wingScore = 3884 },
    DIAMOND     = { minScore = 3660, wingScore = 3731 },
    EMERALD     = { minScore = 3473, wingScore = 3567 },
    PLATINUM    = { minScore = 3152, wingScore = 3288 },
    GOLD        = { minScore = 2743, wingScore = 2949 },
    SILVER      = { minScore = 1391, wingScore = 2333 },
    BRONZE      = { minScore =  333, wingScore =  759 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4036,
    CHALLENGER  = { minScore = 3916, wingScore = 3977 },
    GRANDMASTER = { minScore = 3820, wingScore = 3874 },
    MASTER      = { minScore = 3681, wingScore = 3744 },
    DIAMOND     = { minScore = 3459, wingScore = 3550 },
    EMERALD     = { minScore = 3303, wingScore = 3374 },
    PLATINUM    = { minScore = 3032, wingScore = 3132 },
    GOLD        = { minScore = 2660, wingScore = 2856 },
    SILVER      = { minScore = 1188, wingScore = 2127 },
    BRONZE      = { minScore =  325, wingScore =  664 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4036,
    CHALLENGER  = { minScore = 3789, wingScore = 3977 },
    GRANDMASTER = { minScore = 3746, wingScore = 3767 },
    MASTER      = { minScore = 3598, wingScore = 3672 },
    DIAMOND     = { minScore = 3462, wingScore = 3530 },
    EMERALD     = { minScore = 3280, wingScore = 3371 },
    PLATINUM    = { minScore = 3016, wingScore = 3120 },
    GOLD        = { minScore = 2660, wingScore = 2832 },
    SILVER      = { minScore = 1188, wingScore = 2127 },
    BRONZE      = { minScore =  325, wingScore =  664 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4036,
    CHALLENGER  = { minScore = 3961, wingScore = 3977 },
    GRANDMASTER = { minScore = 3914, wingScore = 3938 },
    MASTER      = { minScore = 3747, wingScore = 3830 },
    DIAMOND     = { minScore = 3593, wingScore = 3670 },
    EMERALD     = { minScore = 3387, wingScore = 3490 },
    PLATINUM    = { minScore = 3097, wingScore = 3209 },
    GOLD        = { minScore = 2660, wingScore = 2897 },
    SILVER      = { minScore = 1188, wingScore = 2127 },
    BRONZE      = { minScore =  325, wingScore =  664 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4127,
    CHALLENGER  = { minScore = 3949, wingScore = 4002 },
    GRANDMASTER = { minScore = 3862, wingScore = 3893 },
    MASTER      = { minScore = 3732, wingScore = 3777 },
    DIAMOND     = { minScore = 3512, wingScore = 3598 },
    EMERALD     = { minScore = 3360, wingScore = 3425 },
    PLATINUM    = { minScore = 3065, wingScore = 3186 },
    GOLD        = { minScore = 2708, wingScore = 2917 },
    SILVER      = { minScore = 1306, wingScore = 2247 },
    BRONZE      = { minScore =  330, wingScore =  719 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4127,
    CHALLENGER  = { minScore = 3848, wingScore = 4002 },
    GRANDMASTER = { minScore = 3802, wingScore = 3824 },
    MASTER      = { minScore = 3643, wingScore = 3722 },
    DIAMOND     = { minScore = 3512, wingScore = 3577 },
    EMERALD     = { minScore = 3336, wingScore = 3424 },
    PLATINUM    = { minScore = 3068, wingScore = 3176 },
    GOLD        = { minScore = 2709, wingScore = 2879 },
    SILVER      = { minScore = 1308, wingScore = 2249 },
    BRONZE      = { minScore =  330, wingScore =  720 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4127,
    CHALLENGER  = { minScore = 3992, wingScore = 4001 },
    GRANDMASTER = { minScore = 3944, wingScore = 3968 },
    MASTER      = { minScore = 3778, wingScore = 3861 },
    DIAMOND     = { minScore = 3632, wingScore = 3705 },
    EMERALD     = { minScore = 3436, wingScore = 3534 },
    PLATINUM    = { minScore = 3129, wingScore = 3254 },
    GOLD        = { minScore = 2708, wingScore = 2927 },
    SILVER      = { minScore = 1305, wingScore = 2245 },
    BRONZE      = { minScore =  330, wingScore =  719 },
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
