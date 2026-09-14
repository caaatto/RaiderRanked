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
    top100Score = 3852,
    CHALLENGER  = { minScore = 3730, wingScore = 3774 },
    GRANDMASTER = { minScore = 3654, wingScore = 3674 },
    MASTER      = { minScore = 3538, wingScore = 3573 },
    DIAMOND     = { minScore = 3345, wingScore = 3423 },
    EMERALD     = { minScore = 3203, wingScore = 3271 },
    PLATINUM    = { minScore = 2956, wingScore = 3048 },
    GOLD        = { minScore = 2636, wingScore = 2758 },
    SILVER      = { minScore = 1227, wingScore = 2125 },
    BRONZE      = { minScore =  329, wingScore =  675 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3852,
    CHALLENGER  = { minScore = 3658, wingScore = 3774 },
    GRANDMASTER = { minScore = 3617, wingScore = 3637 },
    MASTER      = { minScore = 3472, wingScore = 3545 },
    DIAMOND     = { minScore = 3349, wingScore = 3411 },
    EMERALD     = { minScore = 3184, wingScore = 3266 },
    PLATINUM    = { minScore = 2912, wingScore = 3026 },
    GOLD        = { minScore = 2636, wingScore = 2753 },
    SILVER      = { minScore = 1227, wingScore = 2125 },
    BRONZE      = { minScore =  329, wingScore =  675 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3852,
    CHALLENGER  = { minScore = 3772, wingScore = 3774 },
    GRANDMASTER = { minScore = 3728, wingScore = 3750 },
    MASTER      = { minScore = 3571, wingScore = 3649 },
    DIAMOND     = { minScore = 3443, wingScore = 3507 },
    EMERALD     = { minScore = 3272, wingScore = 3357 },
    PLATINUM    = { minScore = 2978, wingScore = 3103 },
    GOLD        = { minScore = 2636, wingScore = 2798 },
    SILVER      = { minScore = 1227, wingScore = 2125 },
    BRONZE      = { minScore =  329, wingScore =  675 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3787,
    CHALLENGER  = { minScore = 3684, wingScore = 3730 },
    GRANDMASTER = { minScore = 3599, wingScore = 3644 },
    MASTER      = { minScore = 3473, wingScore = 3530 },
    DIAMOND     = { minScore = 3266, wingScore = 3346 },
    EMERALD     = { minScore = 3113, wingScore = 3184 },
    PLATINUM    = { minScore = 2867, wingScore = 3003 },
    GOLD        = { minScore = 2534, wingScore = 2693 },
    SILVER      = { minScore = 1028, wingScore = 1937 },
    BRONZE      = { minScore =  319, wingScore =  624 },
    IRON        = { minScore =    1, wingScore =  168 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3787,
    CHALLENGER  = { minScore = 3588, wingScore = 3730 },
    GRANDMASTER = { minScore = 3547, wingScore = 3567 },
    MASTER      = { minScore = 3404, wingScore = 3475 },
    DIAMOND     = { minScore = 3280, wingScore = 3342 },
    EMERALD     = { minScore = 3114, wingScore = 3197 },
    PLATINUM    = { minScore = 2837, wingScore = 2954 },
    GOLD        = { minScore = 2534, wingScore = 2658 },
    SILVER      = { minScore = 1028, wingScore = 1937 },
    BRONZE      = { minScore =  319, wingScore =  624 },
    IRON        = { minScore =    1, wingScore =  168 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3787,
    CHALLENGER  = { minScore = 3722, wingScore = 3730 },
    GRANDMASTER = { minScore = 3680, wingScore = 3701 },
    MASTER      = { minScore = 3532, wingScore = 3606 },
    DIAMOND     = { minScore = 3388, wingScore = 3460 },
    EMERALD     = { minScore = 3195, wingScore = 3291 },
    PLATINUM    = { minScore = 2900, wingScore = 3019 },
    GOLD        = { minScore = 2534, wingScore = 2725 },
    SILVER      = { minScore = 1028, wingScore = 1937 },
    BRONZE      = { minScore =  319, wingScore =  624 },
    IRON        = { minScore =    1, wingScore =  168 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3852,
    CHALLENGER  = { minScore = 3711, wingScore = 3755 },
    GRANDMASTER = { minScore = 3631, wingScore = 3661 },
    MASTER      = { minScore = 3511, wingScore = 3555 },
    DIAMOND     = { minScore = 3312, wingScore = 3390 },
    EMERALD     = { minScore = 3165, wingScore = 3234 },
    PLATINUM    = { minScore = 2918, wingScore = 3029 },
    GOLD        = { minScore = 2593, wingScore = 2731 },
    SILVER      = { minScore = 1143, wingScore = 2046 },
    BRONZE      = { minScore =  325, wingScore =  653 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3852,
    CHALLENGER  = { minScore = 3629, wingScore = 3756 },
    GRANDMASTER = { minScore = 3588, wingScore = 3608 },
    MASTER      = { minScore = 3444, wingScore = 3516 },
    DIAMOND     = { minScore = 3320, wingScore = 3382 },
    EMERALD     = { minScore = 3155, wingScore = 3237 },
    PLATINUM    = { minScore = 2881, wingScore = 2996 },
    GOLD        = { minScore = 2594, wingScore = 2714 },
    SILVER      = { minScore = 1145, wingScore = 2047 },
    BRONZE      = { minScore =  325, wingScore =  654 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3852,
    CHALLENGER  = { minScore = 3750, wingScore = 3755 },
    GRANDMASTER = { minScore = 3707, wingScore = 3729 },
    MASTER      = { minScore = 3554, wingScore = 3630 },
    DIAMOND     = { minScore = 3419, wingScore = 3487 },
    EMERALD     = { minScore = 3239, wingScore = 3329 },
    PLATINUM    = { minScore = 2944, wingScore = 3067 },
    GOLD        = { minScore = 2592, wingScore = 2767 },
    SILVER      = { minScore = 1141, wingScore = 2044 },
    BRONZE      = { minScore =  325, wingScore =  653 },
    IRON        = { minScore =    1, wingScore =  169 },
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
