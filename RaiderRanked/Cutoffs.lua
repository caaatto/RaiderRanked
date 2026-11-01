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
    top100Score = 4248,
    CHALLENGER  = { minScore = 4076, wingScore = 4133 },
    GRANDMASTER = { minScore = 3992, wingScore = 4017 },
    MASTER      = { minScore = 3844, wingScore = 3898 },
    DIAMOND     = { minScore = 3611, wingScore = 3692 },
    EMERALD     = { minScore = 3445, wingScore = 3530 },
    PLATINUM    = { minScore = 3117, wingScore = 3264 },
    GOLD        = { minScore = 2771, wingScore = 2993 },
    SILVER      = { minScore = 1416, wingScore = 2367 },
    BRONZE      = { minScore =  333, wingScore =  769 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4248,
    CHALLENGER  = { minScore = 3968, wingScore = 4133 },
    GRANDMASTER = { minScore = 3922, wingScore = 3945 },
    MASTER      = { minScore = 3762, wingScore = 3842 },
    DIAMOND     = { minScore = 3618, wingScore = 3690 },
    EMERALD     = { minScore = 3426, wingScore = 3522 },
    PLATINUM    = { minScore = 3126, wingScore = 3248 },
    GOLD        = { minScore = 2771, wingScore = 2930 },
    SILVER      = { minScore = 1416, wingScore = 2367 },
    BRONZE      = { minScore =  333, wingScore =  769 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4248,
    CHALLENGER  = { minScore = 4132, wingScore = 4133 },
    GRANDMASTER = { minScore = 4081, wingScore = 4107 },
    MASTER      = { minScore = 3902, wingScore = 3992 },
    DIAMOND     = { minScore = 3746, wingScore = 3824 },
    EMERALD     = { minScore = 3538, wingScore = 3642 },
    PLATINUM    = { minScore = 3186, wingScore = 3334 },
    GOLD        = { minScore = 2771, wingScore = 2976 },
    SILVER      = { minScore = 1416, wingScore = 2367 },
    BRONZE      = { minScore =  333, wingScore =  769 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4145,
    CHALLENGER  = { minScore = 4026, wingScore = 4093 },
    GRANDMASTER = { minScore = 3913, wingScore = 3969 },
    MASTER      = { minScore = 3770, wingScore = 3817 },
    DIAMOND     = { minScore = 3529, wingScore = 3615 },
    EMERALD     = { minScore = 3343, wingScore = 3425 },
    PLATINUM    = { minScore = 3050, wingScore = 3164 },
    GOLD        = { minScore = 2677, wingScore = 2890 },
    SILVER      = { minScore = 1200, wingScore = 2152 },
    BRONZE      = { minScore =  325, wingScore =  665 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4145,
    CHALLENGER  = { minScore = 3894, wingScore = 4093 },
    GRANDMASTER = { minScore = 3843, wingScore = 3868 },
    MASTER      = { minScore = 3665, wingScore = 3754 },
    DIAMOND     = { minScore = 3517, wingScore = 3591 },
    EMERALD     = { minScore = 3320, wingScore = 3418 },
    PLATINUM    = { minScore = 3053, wingScore = 3154 },
    GOLD        = { minScore = 2677, wingScore = 2863 },
    SILVER      = { minScore = 1200, wingScore = 2152 },
    BRONZE      = { minScore =  325, wingScore =  665 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4145,
    CHALLENGER  = { minScore = 4086, wingScore = 4093 },
    GRANDMASTER = { minScore = 4027, wingScore = 4056 },
    MASTER      = { minScore = 3824, wingScore = 3926 },
    DIAMOND     = { minScore = 3659, wingScore = 3741 },
    EMERALD     = { minScore = 3438, wingScore = 3548 },
    PLATINUM    = { minScore = 3121, wingScore = 3245 },
    GOLD        = { minScore = 2677, wingScore = 2913 },
    SILVER      = { minScore = 1200, wingScore = 2152 },
    BRONZE      = { minScore =  325, wingScore =  665 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4248,
    CHALLENGER  = { minScore = 4055, wingScore = 4116 },
    GRANDMASTER = { minScore = 3959, wingScore = 3997 },
    MASTER      = { minScore = 3813, wingScore = 3864 },
    DIAMOND     = { minScore = 3577, wingScore = 3660 },
    EMERALD     = { minScore = 3403, wingScore = 3486 },
    PLATINUM    = { minScore = 3089, wingScore = 3222 },
    GOLD        = { minScore = 2732, wingScore = 2950 },
    SILVER      = { minScore = 1326, wingScore = 2278 },
    BRONZE      = { minScore =  330, wingScore =  726 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4248,
    CHALLENGER  = { minScore = 3938, wingScore = 4117 },
    GRANDMASTER = { minScore = 3890, wingScore = 3914 },
    MASTER      = { minScore = 3722, wingScore = 3806 },
    DIAMOND     = { minScore = 3577, wingScore = 3650 },
    EMERALD     = { minScore = 3383, wingScore = 3480 },
    PLATINUM    = { minScore = 3096, wingScore = 3210 },
    GOLD        = { minScore = 2733, wingScore = 2903 },
    SILVER      = { minScore = 1328, wingScore = 2279 },
    BRONZE      = { minScore =  330, wingScore =  727 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4248,
    CHALLENGER  = { minScore = 4112, wingScore = 4116 },
    GRANDMASTER = { minScore = 4058, wingScore = 4085 },
    MASTER      = { minScore = 3869, wingScore = 3964 },
    DIAMOND     = { minScore = 3709, wingScore = 3789 },
    EMERALD     = { minScore = 3496, wingScore = 3602 },
    PLATINUM    = { minScore = 3158, wingScore = 3296 },
    GOLD        = { minScore = 2731, wingScore = 2949 },
    SILVER      = { minScore = 1324, wingScore = 2276 },
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
