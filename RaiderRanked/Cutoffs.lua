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
    top100Score = 4153,
    CHALLENGER  = { minScore = 4009, wingScore = 4040 },
    GRANDMASTER = { minScore = 3898, wingScore = 3928 },
    MASTER      = { minScore = 3777, wingScore = 3820 },
    DIAMOND     = { minScore = 3561, wingScore = 3651 },
    EMERALD     = { minScore = 3412, wingScore = 3475 },
    PLATINUM    = { minScore = 3097, wingScore = 3234 },
    GOLD        = { minScore = 2753, wingScore = 2972 },
    SILVER      = { minScore = 1405, wingScore = 2347 },
    BRONZE      = { minScore =  333, wingScore =  764 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4153,
    CHALLENGER  = { minScore = 3895, wingScore = 4040 },
    GRANDMASTER = { minScore = 3850, wingScore = 3873 },
    MASTER      = { minScore = 3690, wingScore = 3770 },
    DIAMOND     = { minScore = 3561, wingScore = 3626 },
    EMERALD     = { minScore = 3389, wingScore = 3475 },
    PLATINUM    = { minScore = 3111, wingScore = 3226 },
    GOLD        = { minScore = 2753, wingScore = 2919 },
    SILVER      = { minScore = 1405, wingScore = 2347 },
    BRONZE      = { minScore =  333, wingScore =  764 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4153,
    CHALLENGER  = { minScore = 4034, wingScore = 4040 },
    GRANDMASTER = { minScore = 3988, wingScore = 4011 },
    MASTER      = { minScore = 3826, wingScore = 3907 },
    DIAMOND     = { minScore = 3683, wingScore = 3754 },
    EMERALD     = { minScore = 3492, wingScore = 3587 },
    PLATINUM    = { minScore = 3163, wingScore = 3303 },
    GOLD        = { minScore = 2753, wingScore = 2959 },
    SILVER      = { minScore = 1405, wingScore = 2347 },
    BRONZE      = { minScore =  333, wingScore =  764 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4080,
    CHALLENGER  = { minScore = 3944, wingScore = 4012 },
    GRANDMASTER = { minScore = 3845, wingScore = 3892 },
    MASTER      = { minScore = 3696, wingScore = 3764 },
    DIAMOND     = { minScore = 3474, wingScore = 3564 },
    EMERALD     = { minScore = 3313, wingScore = 3387 },
    PLATINUM    = { minScore = 3038, wingScore = 3141 },
    GOLD        = { minScore = 2666, wingScore = 2868 },
    SILVER      = { minScore = 1194, wingScore = 2138 },
    BRONZE      = { minScore =  325, wingScore =  664 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4080,
    CHALLENGER  = { minScore = 3811, wingScore = 4012 },
    GRANDMASTER = { minScore = 3767, wingScore = 3789 },
    MASTER      = { minScore = 3613, wingScore = 3690 },
    DIAMOND     = { minScore = 3475, wingScore = 3544 },
    EMERALD     = { minScore = 3292, wingScore = 3384 },
    PLATINUM    = { minScore = 3030, wingScore = 3132 },
    GOLD        = { minScore = 2666, wingScore = 2844 },
    SILVER      = { minScore = 1194, wingScore = 2138 },
    BRONZE      = { minScore =  325, wingScore =  664 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4080,
    CHALLENGER  = { minScore = 4009, wingScore = 4012 },
    GRANDMASTER = { minScore = 3956, wingScore = 3982 },
    MASTER      = { minScore = 3770, wingScore = 3863 },
    DIAMOND     = { minScore = 3613, wingScore = 3692 },
    EMERALD     = { minScore = 3403, wingScore = 3508 },
    PLATINUM    = { minScore = 3105, wingScore = 3221 },
    GOLD        = { minScore = 2666, wingScore = 2903 },
    SILVER      = { minScore = 1194, wingScore = 2138 },
    BRONZE      = { minScore =  325, wingScore =  664 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4153,
    CHALLENGER  = { minScore = 3982, wingScore = 4028 },
    GRANDMASTER = { minScore = 3876, wingScore = 3913 },
    MASTER      = { minScore = 3743, wingScore = 3797 },
    DIAMOND     = { minScore = 3525, wingScore = 3615 },
    EMERALD     = { minScore = 3371, wingScore = 3438 },
    PLATINUM    = { minScore = 3072, wingScore = 3195 },
    GOLD        = { minScore = 2717, wingScore = 2929 },
    SILVER      = { minScore = 1317, wingScore = 2260 },
    BRONZE      = { minScore =  330, wingScore =  722 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4153,
    CHALLENGER  = { minScore = 3861, wingScore = 4029 },
    GRANDMASTER = { minScore = 3816, wingScore = 3839 },
    MASTER      = { minScore = 3659, wingScore = 3737 },
    DIAMOND     = { minScore = 3526, wingScore = 3593 },
    EMERALD     = { minScore = 3349, wingScore = 3438 },
    PLATINUM    = { minScore = 3078, wingScore = 3188 },
    GOLD        = { minScore = 2718, wingScore = 2888 },
    SILVER      = { minScore = 1319, wingScore = 2262 },
    BRONZE      = { minScore =  330, wingScore =  723 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4153,
    CHALLENGER  = { minScore = 4023, wingScore = 4028 },
    GRANDMASTER = { minScore = 3974, wingScore = 3999 },
    MASTER      = { minScore = 3802, wingScore = 3888 },
    DIAMOND     = { minScore = 3653, wingScore = 3728 },
    EMERALD     = { minScore = 3454, wingScore = 3553 },
    PLATINUM    = { minScore = 3138, wingScore = 3268 },
    GOLD        = { minScore = 2716, wingScore = 2935 },
    SILVER      = { minScore = 1315, wingScore = 2258 },
    BRONZE      = { minScore =  330, wingScore =  722 },
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
