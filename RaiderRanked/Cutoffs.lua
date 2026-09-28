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
    top100Score = 3958,
    CHALLENGER  = { minScore = 3845, wingScore = 3893 },
    GRANDMASTER = { minScore = 3771, wingScore = 3790 },
    MASTER      = { minScore = 3651, wingScore = 3685 },
    DIAMOND     = { minScore = 3443, wingScore = 3532 },
    EMERALD     = { minScore = 3306, wingScore = 3368 },
    PLATINUM    = { minScore = 3028, wingScore = 3136 },
    GOLD        = { minScore = 2681, wingScore = 2855 },
    SILVER      = { minScore = 1323, wingScore = 2246 },
    BRONZE      = { minScore =  331, wingScore =  716 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3958,
    CHALLENGER  = { minScore = 3772, wingScore = 3893 },
    GRANDMASTER = { minScore = 3728, wingScore = 3750 },
    MASTER      = { minScore = 3574, wingScore = 3651 },
    DIAMOND     = { minScore = 3451, wingScore = 3512 },
    EMERALD     = { minScore = 3286, wingScore = 3368 },
    PLATINUM    = { minScore = 3023, wingScore = 3131 },
    GOLD        = { minScore = 2681, wingScore = 2845 },
    SILVER      = { minScore = 1323, wingScore = 2246 },
    BRONZE      = { minScore =  331, wingScore =  716 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3958,
    CHALLENGER  = { minScore = 3891, wingScore = 3893 },
    GRANDMASTER = { minScore = 3846, wingScore = 3869 },
    MASTER      = { minScore = 3686, wingScore = 3766 },
    DIAMOND     = { minScore = 3554, wingScore = 3620 },
    EMERALD     = { minScore = 3377, wingScore = 3465 },
    PLATINUM    = { minScore = 3090, wingScore = 3209 },
    GOLD        = { minScore = 2681, wingScore = 2894 },
    SILVER      = { minScore = 1323, wingScore = 2246 },
    BRONZE      = { minScore =  331, wingScore =  716 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3912,
    CHALLENGER  = { minScore = 3801, wingScore = 3854 },
    GRANDMASTER = { minScore = 3705, wingScore = 3753 },
    MASTER      = { minScore = 3573, wingScore = 3634 },
    DIAMOND     = { minScore = 3362, wingScore = 3441 },
    EMERALD     = { minScore = 3211, wingScore = 3281 },
    PLATINUM    = { minScore = 2988, wingScore = 3063 },
    GOLD        = { minScore = 2617, wingScore = 2771 },
    SILVER      = { minScore = 1127, wingScore = 2048 },
    BRONZE      = { minScore =  323, wingScore =  656 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3912,
    CHALLENGER  = { minScore = 3687, wingScore = 3854 },
    GRANDMASTER = { minScore = 3644, wingScore = 3665 },
    MASTER      = { minScore = 3492, wingScore = 3568 },
    DIAMOND     = { minScore = 3364, wingScore = 3428 },
    EMERALD     = { minScore = 3194, wingScore = 3279 },
    PLATINUM    = { minScore = 2924, wingScore = 3035 },
    GOLD        = { minScore = 2617, wingScore = 2750 },
    SILVER      = { minScore = 1127, wingScore = 2048 },
    BRONZE      = { minScore =  323, wingScore =  656 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3912,
    CHALLENGER  = { minScore = 3845, wingScore = 3854 },
    GRANDMASTER = { minScore = 3799, wingScore = 3822 },
    MASTER      = { minScore = 3638, wingScore = 3718 },
    DIAMOND     = { minScore = 3490, wingScore = 3564 },
    EMERALD     = { minScore = 3293, wingScore = 3392 },
    PLATINUM    = { minScore = 3006, wingScore = 3120 },
    GOLD        = { minScore = 2617, wingScore = 2821 },
    SILVER      = { minScore = 1127, wingScore = 2048 },
    BRONZE      = { minScore =  323, wingScore =  656 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3958,
    CHALLENGER  = { minScore = 3827, wingScore = 3877 },
    GRANDMASTER = { minScore = 3743, wingScore = 3775 },
    MASTER      = { minScore = 3618, wingScore = 3664 },
    DIAMOND     = { minScore = 3409, wingScore = 3494 },
    EMERALD     = { minScore = 3266, wingScore = 3332 },
    PLATINUM    = { minScore = 3011, wingScore = 3105 },
    GOLD        = { minScore = 2654, wingScore = 2820 },
    SILVER      = { minScore = 1241, wingScore = 2163 },
    BRONZE      = { minScore =  328, wingScore =  691 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3958,
    CHALLENGER  = { minScore = 3737, wingScore = 3877 },
    GRANDMASTER = { minScore = 3694, wingScore = 3715 },
    MASTER      = { minScore = 3540, wingScore = 3617 },
    DIAMOND     = { minScore = 3415, wingScore = 3478 },
    EMERALD     = { minScore = 3248, wingScore = 3332 },
    PLATINUM    = { minScore = 2982, wingScore = 3092 },
    GOLD        = { minScore = 2655, wingScore = 2806 },
    SILVER      = { minScore = 1243, wingScore = 2165 },
    BRONZE      = { minScore =  328, wingScore =  691 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3958,
    CHALLENGER  = { minScore = 3871, wingScore = 3876 },
    GRANDMASTER = { minScore = 3826, wingScore = 3849 },
    MASTER      = { minScore = 3665, wingScore = 3745 },
    DIAMOND     = { minScore = 3527, wingScore = 3596 },
    EMERALD     = { minScore = 3341, wingScore = 3434 },
    PLATINUM    = { minScore = 3054, wingScore = 3171 },
    GOLD        = { minScore = 2654, wingScore = 2863 },
    SILVER      = { minScore = 1239, wingScore = 2161 },
    BRONZE      = { minScore =  328, wingScore =  690 },
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
