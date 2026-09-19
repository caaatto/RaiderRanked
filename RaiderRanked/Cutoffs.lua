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
    top100Score = 3895,
    CHALLENGER  = { minScore = 3774, wingScore = 3814 },
    GRANDMASTER = { minScore = 3682, wingScore = 3718 },
    MASTER      = { minScore = 3567, wingScore = 3622 },
    DIAMOND     = { minScore = 3384, wingScore = 3453 },
    EMERALD     = { minScore = 3237, wingScore = 3308 },
    PLATINUM    = { minScore = 2994, wingScore = 3078 },
    GOLD        = { minScore = 2651, wingScore = 2790 },
    SILVER      = { minScore = 1271, wingScore = 2163 },
    BRONZE      = { minScore =  330, wingScore =  697 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3895,
    CHALLENGER  = { minScore = 3684, wingScore = 3814 },
    GRANDMASTER = { minScore = 3646, wingScore = 3665 },
    MASTER      = { minScore = 3515, wingScore = 3581 },
    DIAMOND     = { minScore = 3389, wingScore = 3452 },
    EMERALD     = { minScore = 3220, wingScore = 3305 },
    PLATINUM    = { minScore = 2948, wingScore = 3061 },
    GOLD        = { minScore = 2651, wingScore = 2782 },
    SILVER      = { minScore = 1271, wingScore = 2163 },
    BRONZE      = { minScore =  330, wingScore =  697 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3895,
    CHALLENGER  = { minScore = 3802, wingScore = 3814 },
    GRANDMASTER = { minScore = 3761, wingScore = 3782 },
    MASTER      = { minScore = 3619, wingScore = 3690 },
    DIAMOND     = { minScore = 3485, wingScore = 3552 },
    EMERALD     = { minScore = 3307, wingScore = 3396 },
    PLATINUM    = { minScore = 3015, wingScore = 3137 },
    GOLD        = { minScore = 2651, wingScore = 2830 },
    SILVER      = { minScore = 1271, wingScore = 2163 },
    BRONZE      = { minScore =  330, wingScore =  697 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3833,
    CHALLENGER  = { minScore = 3729, wingScore = 3778 },
    GRANDMASTER = { minScore = 3647, wingScore = 3671 },
    MASTER      = { minScore = 3511, wingScore = 3555 },
    DIAMOND     = { minScore = 3303, wingScore = 3383 },
    EMERALD     = { minScore = 3148, wingScore = 3215 },
    PLATINUM    = { minScore = 2910, wingScore = 3022 },
    GOLD        = { minScore = 2566, wingScore = 2718 },
    SILVER      = { minScore = 1066, wingScore = 1976 },
    BRONZE      = { minScore =  323, wingScore =  651 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3833,
    CHALLENGER  = { minScore = 3629, wingScore = 3778 },
    GRANDMASTER = { minScore = 3584, wingScore = 3606 },
    MASTER      = { minScore = 3428, wingScore = 3506 },
    DIAMOND     = { minScore = 3304, wingScore = 3366 },
    EMERALD     = { minScore = 3140, wingScore = 3222 },
    PLATINUM    = { minScore = 2865, wingScore = 2981 },
    GOLD        = { minScore = 2566, wingScore = 2688 },
    SILVER      = { minScore = 1066, wingScore = 1976 },
    BRONZE      = { minScore =  323, wingScore =  651 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3833,
    CHALLENGER  = { minScore = 3773, wingScore = 3778 },
    GRANDMASTER = { minScore = 3725, wingScore = 3749 },
    MASTER      = { minScore = 3557, wingScore = 3641 },
    DIAMOND     = { minScore = 3415, wingScore = 3486 },
    EMERALD     = { minScore = 3224, wingScore = 3319 },
    PLATINUM    = { minScore = 2934, wingScore = 3051 },
    GOLD        = { minScore = 2566, wingScore = 2757 },
    SILVER      = { minScore = 1066, wingScore = 1976 },
    BRONZE      = { minScore =  323, wingScore =  651 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3895,
    CHALLENGER  = { minScore = 3755, wingScore = 3799 },
    GRANDMASTER = { minScore = 3667, wingScore = 3698 },
    MASTER      = { minScore = 3543, wingScore = 3594 },
    DIAMOND     = { minScore = 3350, wingScore = 3424 },
    EMERALD     = { minScore = 3200, wingScore = 3269 },
    PLATINUM    = { minScore = 2959, wingScore = 3054 },
    GOLD        = { minScore = 2615, wingScore = 2760 },
    SILVER      = { minScore = 1185, wingScore = 2084 },
    BRONZE      = { minScore =  327, wingScore =  678 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3895,
    CHALLENGER  = { minScore = 3661, wingScore = 3799 },
    GRANDMASTER = { minScore = 3621, wingScore = 3641 },
    MASTER      = { minScore = 3479, wingScore = 3550 },
    DIAMOND     = { minScore = 3354, wingScore = 3417 },
    EMERALD     = { minScore = 3187, wingScore = 3271 },
    PLATINUM    = { minScore = 2914, wingScore = 3028 },
    GOLD        = { minScore = 2616, wingScore = 2743 },
    SILVER      = { minScore = 1187, wingScore = 2086 },
    BRONZE      = { minScore =  327, wingScore =  678 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3895,
    CHALLENGER  = { minScore = 3790, wingScore = 3799 },
    GRANDMASTER = { minScore = 3746, wingScore = 3768 },
    MASTER      = { minScore = 3592, wingScore = 3669 },
    DIAMOND     = { minScore = 3455, wingScore = 3524 },
    EMERALD     = { minScore = 3271, wingScore = 3363 },
    PLATINUM    = { minScore = 2980, wingScore = 3100 },
    GOLD        = { minScore = 2614, wingScore = 2799 },
    SILVER      = { minScore = 1183, wingScore = 2083 },
    BRONZE      = { minScore =  327, wingScore =  677 },
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
