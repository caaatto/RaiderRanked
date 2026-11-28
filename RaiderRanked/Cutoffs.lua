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
    top100Score = 4256,
    CHALLENGER  = { minScore = 4131, wingScore = 4152 },
    GRANDMASTER = { minScore = 4019, wingScore = 4057 },
    MASTER      = { minScore = 3895, wingScore = 3939 },
    DIAMOND     = { minScore = 3648, wingScore = 3739 },
    EMERALD     = { minScore = 3479, wingScore = 3562 },
    PLATINUM    = { minScore = 3134, wingScore = 3289 },
    GOLD        = { minScore = 2785, wingScore = 3004 },
    SILVER      = { minScore = 1424, wingScore = 2379 },
    BRONZE      = { minScore =  333, wingScore =  773 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4256,
    CHALLENGER  = { minScore = 4013, wingScore = 4152 },
    GRANDMASTER = { minScore = 3965, wingScore = 3989 },
    MASTER      = { minScore = 3794, wingScore = 3879 },
    DIAMOND     = { minScore = 3647, wingScore = 3720 },
    EMERALD     = { minScore = 3451, wingScore = 3549 },
    PLATINUM    = { minScore = 3138, wingScore = 3267 },
    GOLD        = { minScore = 2785, wingScore = 2939 },
    SILVER      = { minScore = 1424, wingScore = 2379 },
    BRONZE      = { minScore =  333, wingScore =  773 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4256,
    CHALLENGER  = { minScore = 4152, wingScore = 4152 },
    GRANDMASTER = { minScore = 4106, wingScore = 4129 },
    MASTER      = { minScore = 3947, wingScore = 4027 },
    DIAMOND     = { minScore = 3785, wingScore = 3866 },
    EMERALD     = { minScore = 3570, wingScore = 3678 },
    PLATINUM    = { minScore = 3204, wingScore = 3359 },
    GOLD        = { minScore = 2785, wingScore = 2990 },
    SILVER      = { minScore = 1424, wingScore = 2379 },
    BRONZE      = { minScore =  333, wingScore =  773 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4222,
    CHALLENGER  = { minScore = 4093, wingScore = 4135 },
    GRANDMASTER = { minScore = 3973, wingScore = 4014 },
    MASTER      = { minScore = 3806, wingScore = 3882 },
    DIAMOND     = { minScore = 3570, wingScore = 3656 },
    EMERALD     = { minScore = 3373, wingScore = 3457 },
    PLATINUM    = { minScore = 3060, wingScore = 3182 },
    GOLD        = { minScore = 2685, wingScore = 2908 },
    SILVER      = { minScore = 1204, wingScore = 2161 },
    BRONZE      = { minScore =  325, wingScore =  666 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4222,
    CHALLENGER  = { minScore = 3934, wingScore = 4135 },
    GRANDMASTER = { minScore = 3883, wingScore = 3909 },
    MASTER      = { minScore = 3703, wingScore = 3793 },
    DIAMOND     = { minScore = 3549, wingScore = 3626 },
    EMERALD     = { minScore = 3344, wingScore = 3447 },
    PLATINUM    = { minScore = 3072, wingScore = 3174 },
    GOLD        = { minScore = 2685, wingScore = 2878 },
    SILVER      = { minScore = 1204, wingScore = 2161 },
    BRONZE      = { minScore =  325, wingScore =  666 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4222,
    CHALLENGER  = { minScore = 4134, wingScore = 4135 },
    GRANDMASTER = { minScore = 4080, wingScore = 4107 },
    MASTER      = { minScore = 3890, wingScore = 3985 },
    DIAMOND     = { minScore = 3712, wingScore = 3801 },
    EMERALD     = { minScore = 3475, wingScore = 3593 },
    PLATINUM    = { minScore = 3135, wingScore = 3268 },
    GOLD        = { minScore = 2685, wingScore = 2922 },
    SILVER      = { minScore = 1204, wingScore = 2161 },
    BRONZE      = { minScore =  325, wingScore =  666 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4256,
    CHALLENGER  = { minScore = 4115, wingScore = 4145 },
    GRANDMASTER = { minScore = 4000, wingScore = 4039 },
    MASTER      = { minScore = 3858, wingScore = 3915 },
    DIAMOND     = { minScore = 3616, wingScore = 3705 },
    EMERALD     = { minScore = 3435, wingScore = 3518 },
    PLATINUM    = { minScore = 3103, wingScore = 3245 },
    GOLD        = { minScore = 2743, wingScore = 2964 },
    SILVER      = { minScore = 1333, wingScore = 2288 },
    BRONZE      = { minScore =  330, wingScore =  729 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4256,
    CHALLENGER  = { minScore = 3981, wingScore = 4145 },
    GRANDMASTER = { minScore = 3932, wingScore = 3956 },
    MASTER      = { minScore = 3757, wingScore = 3844 },
    DIAMOND     = { minScore = 3607, wingScore = 3682 },
    EMERALD     = { minScore = 3407, wingScore = 3508 },
    PLATINUM    = { minScore = 3111, wingScore = 3229 },
    GOLD        = { minScore = 2744, wingScore = 2914 },
    SILVER      = { minScore = 1334, wingScore = 2290 },
    BRONZE      = { minScore =  330, wingScore =  729 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4256,
    CHALLENGER  = { minScore = 4144, wingScore = 4145 },
    GRANDMASTER = { minScore = 4095, wingScore = 4120 },
    MASTER      = { minScore = 3923, wingScore = 4009 },
    DIAMOND     = { minScore = 3754, wingScore = 3838 },
    EMERALD     = { minScore = 3530, wingScore = 3642 },
    PLATINUM    = { minScore = 3175, wingScore = 3320 },
    GOLD        = { minScore = 2743, wingScore = 2961 },
    SILVER      = { minScore = 1331, wingScore = 2287 },
    BRONZE      = { minScore =  330, wingScore =  728 },
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
