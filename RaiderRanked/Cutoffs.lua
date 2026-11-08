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
    CHALLENGER  = { minScore = 4115, wingScore = 4140 },
    GRANDMASTER = { minScore = 4012, wingScore = 4031 },
    MASTER      = { minScore = 3879, wingScore = 3914 },
    DIAMOND     = { minScore = 3629, wingScore = 3716 },
    EMERALD     = { minScore = 3461, wingScore = 3547 },
    PLATINUM    = { minScore = 3125, wingScore = 3276 },
    GOLD        = { minScore = 2777, wingScore = 3000 },
    SILVER      = { minScore = 1417, wingScore = 2371 },
    BRONZE      = { minScore =  333, wingScore =  771 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4251,
    CHALLENGER  = { minScore = 4003, wingScore = 4140 },
    GRANDMASTER = { minScore = 3954, wingScore = 3979 },
    MASTER      = { minScore = 3779, wingScore = 3866 },
    DIAMOND     = { minScore = 3633, wingScore = 3706 },
    EMERALD     = { minScore = 3438, wingScore = 3535 },
    PLATINUM    = { minScore = 3131, wingScore = 3256 },
    GOLD        = { minScore = 2777, wingScore = 2934 },
    SILVER      = { minScore = 1417, wingScore = 2371 },
    BRONZE      = { minScore =  333, wingScore =  771 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4251,
    CHALLENGER  = { minScore = 4138, wingScore = 4140 },
    GRANDMASTER = { minScore = 4090, wingScore = 4114 },
    MASTER      = { minScore = 3922, wingScore = 4006 },
    DIAMOND     = { minScore = 3764, wingScore = 3843 },
    EMERALD     = { minScore = 3553, wingScore = 3659 },
    PLATINUM    = { minScore = 3195, wingScore = 3347 },
    GOLD        = { minScore = 2777, wingScore = 2982 },
    SILVER      = { minScore = 1417, wingScore = 2371 },
    BRONZE      = { minScore =  333, wingScore =  771 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4164,
    CHALLENGER  = { minScore = 4050, wingScore = 4122 },
    GRANDMASTER = { minScore = 3940, wingScore = 4006 },
    MASTER      = { minScore = 3785, wingScore = 3848 },
    DIAMOND     = { minScore = 3548, wingScore = 3637 },
    EMERALD     = { minScore = 3357, wingScore = 3440 },
    PLATINUM    = { minScore = 3055, wingScore = 3172 },
    GOLD        = { minScore = 2680, wingScore = 2898 },
    SILVER      = { minScore = 1200, wingScore = 2155 },
    BRONZE      = { minScore =  325, wingScore =  666 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4164,
    CHALLENGER  = { minScore = 3907, wingScore = 4122 },
    GRANDMASTER = { minScore = 3857, wingScore = 3882 },
    MASTER      = { minScore = 3682, wingScore = 3770 },
    DIAMOND     = { minScore = 3532, wingScore = 3607 },
    EMERALD     = { minScore = 3331, wingScore = 3431 },
    PLATINUM    = { minScore = 3061, wingScore = 3163 },
    GOLD        = { minScore = 2680, wingScore = 2870 },
    SILVER      = { minScore = 1200, wingScore = 2155 },
    BRONZE      = { minScore =  325, wingScore =  666 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4164,
    CHALLENGER  = { minScore = 4116, wingScore = 4122 },
    GRANDMASTER = { minScore = 4058, wingScore = 4087 },
    MASTER      = { minScore = 3855, wingScore = 3956 },
    DIAMOND     = { minScore = 3684, wingScore = 3769 },
    EMERALD     = { minScore = 3456, wingScore = 3570 },
    PLATINUM    = { minScore = 3128, wingScore = 3256 },
    GOLD        = { minScore = 2680, wingScore = 2917 },
    SILVER      = { minScore = 1200, wingScore = 2155 },
    BRONZE      = { minScore =  325, wingScore =  666 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4251,
    CHALLENGER  = { minScore = 4088, wingScore = 4133 },
    GRANDMASTER = { minScore = 3982, wingScore = 4021 },
    MASTER      = { minScore = 3840, wingScore = 3887 },
    DIAMOND     = { minScore = 3595, wingScore = 3683 },
    EMERALD     = { minScore = 3418, wingScore = 3503 },
    PLATINUM    = { minScore = 3096, wingScore = 3233 },
    GOLD        = { minScore = 2737, wingScore = 2958 },
    SILVER      = { minScore = 1327, wingScore = 2281 },
    BRONZE      = { minScore =  330, wingScore =  727 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4251,
    CHALLENGER  = { minScore = 3964, wingScore = 4133 },
    GRANDMASTER = { minScore = 3914, wingScore = 3939 },
    MASTER      = { minScore = 3739, wingScore = 3827 },
    DIAMOND     = { minScore = 3592, wingScore = 3666 },
    EMERALD     = { minScore = 3394, wingScore = 3493 },
    PLATINUM    = { minScore = 3102, wingScore = 3218 },
    GOLD        = { minScore = 2737, wingScore = 2908 },
    SILVER      = { minScore = 1329, wingScore = 2283 },
    BRONZE      = { minScore =  330, wingScore =  728 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4251,
    CHALLENGER  = { minScore = 4129, wingScore = 4132 },
    GRANDMASTER = { minScore = 4076, wingScore = 4103 },
    MASTER      = { minScore = 3894, wingScore = 3985 },
    DIAMOND     = { minScore = 3730, wingScore = 3812 },
    EMERALD     = { minScore = 3512, wingScore = 3621 },
    PLATINUM    = { minScore = 3167, wingScore = 3308 },
    GOLD        = { minScore = 2736, wingScore = 2954 },
    SILVER      = { minScore = 1325, wingScore = 2279 },
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
