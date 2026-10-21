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
    top100Score = 4140,
    CHALLENGER  = { minScore = 3995, wingScore = 4028 },
    GRANDMASTER = { minScore = 3895, wingScore = 3915 },
    MASTER      = { minScore = 3774, wingScore = 3810 },
    DIAMOND     = { minScore = 3555, wingScore = 3644 },
    EMERALD     = { minScore = 3406, wingScore = 3469 },
    PLATINUM    = { minScore = 3093, wingScore = 3229 },
    GOLD        = { minScore = 2747, wingScore = 2966 },
    SILVER      = { minScore = 1397, wingScore = 2339 },
    BRONZE      = { minScore =  333, wingScore =  761 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4140,
    CHALLENGER  = { minScore = 3893, wingScore = 4028 },
    GRANDMASTER = { minScore = 3847, wingScore = 3870 },
    MASTER      = { minScore = 3685, wingScore = 3766 },
    DIAMOND     = { minScore = 3556, wingScore = 3620 },
    EMERALD     = { minScore = 3384, wingScore = 3470 },
    PLATINUM    = { minScore = 3108, wingScore = 3222 },
    GOLD        = { minScore = 2747, wingScore = 2916 },
    SILVER      = { minScore = 1397, wingScore = 2339 },
    BRONZE      = { minScore =  333, wingScore =  761 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4140,
    CHALLENGER  = { minScore = 4027, wingScore = 4028 },
    GRANDMASTER = { minScore = 3980, wingScore = 4004 },
    MASTER      = { minScore = 3818, wingScore = 3899 },
    DIAMOND     = { minScore = 3675, wingScore = 3746 },
    EMERALD     = { minScore = 3484, wingScore = 3579 },
    PLATINUM    = { minScore = 3158, wingScore = 3297 },
    GOLD        = { minScore = 2747, wingScore = 2954 },
    SILVER      = { minScore = 1397, wingScore = 2339 },
    BRONZE      = { minScore =  333, wingScore =  761 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4050,
    CHALLENGER  = { minScore = 3927, wingScore = 3997 },
    GRANDMASTER = { minScore = 3833, wingScore = 3887 },
    MASTER      = { minScore = 3687, wingScore = 3755 },
    DIAMOND     = { minScore = 3466, wingScore = 3556 },
    EMERALD     = { minScore = 3308, wingScore = 3380 },
    PLATINUM    = { minScore = 3035, wingScore = 3136 },
    GOLD        = { minScore = 2663, wingScore = 2862 },
    SILVER      = { minScore = 1192, wingScore = 2133 },
    BRONZE      = { minScore =  325, wingScore =  664 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4050,
    CHALLENGER  = { minScore = 3800, wingScore = 3997 },
    GRANDMASTER = { minScore = 3757, wingScore = 3779 },
    MASTER      = { minScore = 3608, wingScore = 3683 },
    DIAMOND     = { minScore = 3470, wingScore = 3539 },
    EMERALD     = { minScore = 3286, wingScore = 3378 },
    PLATINUM    = { minScore = 3023, wingScore = 3126 },
    GOLD        = { minScore = 2663, wingScore = 2839 },
    SILVER      = { minScore = 1192, wingScore = 2133 },
    BRONZE      = { minScore =  325, wingScore =  664 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4050,
    CHALLENGER  = { minScore = 3992, wingScore = 3997 },
    GRANDMASTER = { minScore = 3941, wingScore = 3967 },
    MASTER      = { minScore = 3761, wingScore = 3851 },
    DIAMOND     = { minScore = 3605, wingScore = 3683 },
    EMERALD     = { minScore = 3396, wingScore = 3500 },
    PLATINUM    = { minScore = 3101, wingScore = 3215 },
    GOLD        = { minScore = 2663, wingScore = 2900 },
    SILVER      = { minScore = 1192, wingScore = 2133 },
    BRONZE      = { minScore =  325, wingScore =  664 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4140,
    CHALLENGER  = { minScore = 3967, wingScore = 4015 },
    GRANDMASTER = { minScore = 3869, wingScore = 3903 },
    MASTER      = { minScore = 3738, wingScore = 3787 },
    DIAMOND     = { minScore = 3518, wingScore = 3607 },
    EMERALD     = { minScore = 3365, wingScore = 3432 },
    PLATINUM    = { minScore = 3069, wingScore = 3190 },
    GOLD        = { minScore = 2712, wingScore = 2923 },
    SILVER      = { minScore = 1312, wingScore = 2253 },
    BRONZE      = { minScore =  330, wingScore =  721 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4140,
    CHALLENGER  = { minScore = 3855, wingScore = 4015 },
    GRANDMASTER = { minScore = 3810, wingScore = 3833 },
    MASTER      = { minScore = 3654, wingScore = 3732 },
    DIAMOND     = { minScore = 3521, wingScore = 3587 },
    EMERALD     = { minScore = 3344, wingScore = 3433 },
    PLATINUM    = { minScore = 3073, wingScore = 3183 },
    GOLD        = { minScore = 2713, wingScore = 2885 },
    SILVER      = { minScore = 1313, wingScore = 2255 },
    BRONZE      = { minScore =  330, wingScore =  721 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4140,
    CHALLENGER  = { minScore = 4012, wingScore = 4015 },
    GRANDMASTER = { minScore = 3963, wingScore = 3988 },
    MASTER      = { minScore = 3794, wingScore = 3879 },
    DIAMOND     = { minScore = 3645, wingScore = 3719 },
    EMERALD     = { minScore = 3447, wingScore = 3545 },
    PLATINUM    = { minScore = 3134, wingScore = 3262 },
    GOLD        = { minScore = 2711, wingScore = 2931 },
    SILVER      = { minScore = 1310, wingScore = 2252 },
    BRONZE      = { minScore =  330, wingScore =  720 },
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
