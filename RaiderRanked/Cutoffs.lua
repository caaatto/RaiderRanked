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
    top100Score = 4253,
    CHALLENGER  = { minScore = 4128, wingScore = 4147 },
    GRANDMASTER = { minScore = 4015, wingScore = 4042 },
    MASTER      = { minScore = 3892, wingScore = 3925 },
    DIAMOND     = { minScore = 3640, wingScore = 3728 },
    EMERALD     = { minScore = 3470, wingScore = 3555 },
    PLATINUM    = { minScore = 3129, wingScore = 3283 },
    GOLD        = { minScore = 2781, wingScore = 3002 },
    SILVER      = { minScore = 1423, wingScore = 2376 },
    BRONZE      = { minScore =  334, wingScore =  775 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4253,
    CHALLENGER  = { minScore = 4010, wingScore = 4147 },
    GRANDMASTER = { minScore = 3960, wingScore = 3985 },
    MASTER      = { minScore = 3786, wingScore = 3873 },
    DIAMOND     = { minScore = 3640, wingScore = 3713 },
    EMERALD     = { minScore = 3444, wingScore = 3542 },
    PLATINUM    = { minScore = 3135, wingScore = 3262 },
    GOLD        = { minScore = 2781, wingScore = 2936 },
    SILVER      = { minScore = 1423, wingScore = 2376 },
    BRONZE      = { minScore =  334, wingScore =  775 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4253,
    CHALLENGER  = { minScore = 4145, wingScore = 4147 },
    GRANDMASTER = { minScore = 4098, wingScore = 4121 },
    MASTER      = { minScore = 3934, wingScore = 4016 },
    DIAMOND     = { minScore = 3774, wingScore = 3854 },
    EMERALD     = { minScore = 3562, wingScore = 3668 },
    PLATINUM    = { minScore = 3200, wingScore = 3353 },
    GOLD        = { minScore = 2781, wingScore = 2986 },
    SILVER      = { minScore = 1423, wingScore = 2376 },
    BRONZE      = { minScore =  334, wingScore =  775 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4190,
    CHALLENGER  = { minScore = 4065, wingScore = 4130 },
    GRANDMASTER = { minScore = 3955, wingScore = 4011 },
    MASTER      = { minScore = 3795, wingScore = 3864 },
    DIAMOND     = { minScore = 3559, wingScore = 3648 },
    EMERALD     = { minScore = 3365, wingScore = 3448 },
    PLATINUM    = { minScore = 3058, wingScore = 3177 },
    GOLD        = { minScore = 2683, wingScore = 2903 },
    SILVER      = { minScore = 1205, wingScore = 2159 },
    BRONZE      = { minScore =  326, wingScore =  667 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4190,
    CHALLENGER  = { minScore = 3920, wingScore = 4130 },
    GRANDMASTER = { minScore = 3869, wingScore = 3895 },
    MASTER      = { minScore = 3692, wingScore = 3780 },
    DIAMOND     = { minScore = 3540, wingScore = 3616 },
    EMERALD     = { minScore = 3338, wingScore = 3439 },
    PLATINUM    = { minScore = 3067, wingScore = 3168 },
    GOLD        = { minScore = 2683, wingScore = 2874 },
    SILVER      = { minScore = 1205, wingScore = 2159 },
    BRONZE      = { minScore =  326, wingScore =  667 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4190,
    CHALLENGER  = { minScore = 4129, wingScore = 4130 },
    GRANDMASTER = { minScore = 4072, wingScore = 4101 },
    MASTER      = { minScore = 3874, wingScore = 3973 },
    DIAMOND     = { minScore = 3699, wingScore = 3786 },
    EMERALD     = { minScore = 3465, wingScore = 3582 },
    PLATINUM    = { minScore = 3131, wingScore = 3262 },
    GOLD        = { minScore = 2683, wingScore = 2919 },
    SILVER      = { minScore = 1205, wingScore = 2159 },
    BRONZE      = { minScore =  326, wingScore =  667 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4253,
    CHALLENGER  = { minScore = 4102, wingScore = 4140 },
    GRANDMASTER = { minScore = 3990, wingScore = 4029 },
    MASTER      = { minScore = 3852, wingScore = 3900 },
    DIAMOND     = { minScore = 3606, wingScore = 3695 },
    EMERALD     = { minScore = 3426, wingScore = 3511 },
    PLATINUM    = { minScore = 3100, wingScore = 3239 },
    GOLD        = { minScore = 2740, wingScore = 2961 },
    SILVER      = { minScore = 1332, wingScore = 2286 },
    BRONZE      = { minScore =  331, wingScore =  730 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4253,
    CHALLENGER  = { minScore = 3973, wingScore = 4140 },
    GRANDMASTER = { minScore = 3923, wingScore = 3948 },
    MASTER      = { minScore = 3748, wingScore = 3835 },
    DIAMOND     = { minScore = 3599, wingScore = 3674 },
    EMERALD     = { minScore = 3401, wingScore = 3500 },
    PLATINUM    = { minScore = 3107, wingScore = 3224 },
    GOLD        = { minScore = 2741, wingScore = 2911 },
    SILVER      = { minScore = 1334, wingScore = 2288 },
    BRONZE      = { minScore =  331, wingScore =  731 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4253,
    CHALLENGER  = { minScore = 4138, wingScore = 4140 },
    GRANDMASTER = { minScore = 4087, wingScore = 4113 },
    MASTER      = { minScore = 3909, wingScore = 3998 },
    DIAMOND     = { minScore = 3742, wingScore = 3825 },
    EMERALD     = { minScore = 3521, wingScore = 3632 },
    PLATINUM    = { minScore = 3171, wingScore = 3314 },
    GOLD        = { minScore = 2739, wingScore = 2958 },
    SILVER      = { minScore = 1331, wingScore = 2284 },
    BRONZE      = { minScore =  331, wingScore =  729 },
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
