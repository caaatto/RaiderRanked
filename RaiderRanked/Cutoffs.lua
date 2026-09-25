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
    top100Score = 3935,
    CHALLENGER  = { minScore = 3813, wingScore = 3866 },
    GRANDMASTER = { minScore = 3740, wingScore = 3772 },
    MASTER      = { minScore = 3619, wingScore = 3661 },
    DIAMOND     = { minScore = 3423, wingScore = 3501 },
    EMERALD     = { minScore = 3281, wingScore = 3343 },
    PLATINUM    = { minScore = 3016, wingScore = 3113 },
    GOLD        = { minScore = 2668, wingScore = 2830 },
    SILVER      = { minScore = 1301, wingScore = 2207 },
    BRONZE      = { minScore =  330, wingScore =  699 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3935,
    CHALLENGER  = { minScore = 3739, wingScore = 3866 },
    GRANDMASTER = { minScore = 3697, wingScore = 3718 },
    MASTER      = { minScore = 3550, wingScore = 3624 },
    DIAMOND     = { minScore = 3427, wingScore = 3489 },
    EMERALD     = { minScore = 3262, wingScore = 3344 },
    PLATINUM    = { minScore = 2995, wingScore = 3106 },
    GOLD        = { minScore = 2668, wingScore = 2820 },
    SILVER      = { minScore = 1301, wingScore = 2207 },
    BRONZE      = { minScore =  330, wingScore =  699 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3935,
    CHALLENGER  = { minScore = 3853, wingScore = 3866 },
    GRANDMASTER = { minScore = 3810, wingScore = 3831 },
    MASTER      = { minScore = 3660, wingScore = 3735 },
    DIAMOND     = { minScore = 3527, wingScore = 3594 },
    EMERALD     = { minScore = 3348, wingScore = 3438 },
    PLATINUM    = { minScore = 3063, wingScore = 3181 },
    GOLD        = { minScore = 2668, wingScore = 2871 },
    SILVER      = { minScore = 1301, wingScore = 2207 },
    BRONZE      = { minScore =  330, wingScore =  699 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3894,
    CHALLENGER  = { minScore = 3778, wingScore = 3822 },
    GRANDMASTER = { minScore = 3679, wingScore = 3718 },
    MASTER      = { minScore = 3550, wingScore = 3603 },
    DIAMOND     = { minScore = 3339, wingScore = 3423 },
    EMERALD     = { minScore = 3190, wingScore = 3256 },
    PLATINUM    = { minScore = 2964, wingScore = 3048 },
    GOLD        = { minScore = 2600, wingScore = 2752 },
    SILVER      = { minScore = 1098, wingScore = 2021 },
    BRONZE      = { minScore =  323, wingScore =  651 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3894,
    CHALLENGER  = { minScore = 3666, wingScore = 3822 },
    GRANDMASTER = { minScore = 3622, wingScore = 3644 },
    MASTER      = { minScore = 3467, wingScore = 3544 },
    DIAMOND     = { minScore = 3342, wingScore = 3404 },
    EMERALD     = { minScore = 3175, wingScore = 3258 },
    PLATINUM    = { minScore = 2905, wingScore = 3017 },
    GOLD        = { minScore = 2600, wingScore = 2729 },
    SILVER      = { minScore = 1098, wingScore = 2021 },
    BRONZE      = { minScore =  323, wingScore =  651 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3894,
    CHALLENGER  = { minScore = 3817, wingScore = 3822 },
    GRANDMASTER = { minScore = 3771, wingScore = 3794 },
    MASTER      = { minScore = 3608, wingScore = 3689 },
    DIAMOND     = { minScore = 3463, wingScore = 3536 },
    EMERALD     = { minScore = 3271, wingScore = 3367 },
    PLATINUM    = { minScore = 2983, wingScore = 3098 },
    GOLD        = { minScore = 2600, wingScore = 2800 },
    SILVER      = { minScore = 1098, wingScore = 2021 },
    BRONZE      = { minScore =  323, wingScore =  651 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3935,
    CHALLENGER  = { minScore = 3798, wingScore = 3848 },
    GRANDMASTER = { minScore = 3714, wingScore = 3749 },
    MASTER      = { minScore = 3590, wingScore = 3637 },
    DIAMOND     = { minScore = 3388, wingScore = 3468 },
    EMERALD     = { minScore = 3243, wingScore = 3307 },
    PLATINUM    = { minScore = 2994, wingScore = 3086 },
    GOLD        = { minScore = 2640, wingScore = 2797 },
    SILVER      = { minScore = 1216, wingScore = 2129 },
    BRONZE      = { minScore =  327, wingScore =  679 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3935,
    CHALLENGER  = { minScore = 3709, wingScore = 3848 },
    GRANDMASTER = { minScore = 3666, wingScore = 3688 },
    MASTER      = { minScore = 3516, wingScore = 3591 },
    DIAMOND     = { minScore = 3392, wingScore = 3454 },
    EMERALD     = { minScore = 3226, wingScore = 3309 },
    PLATINUM    = { minScore = 2958, wingScore = 3069 },
    GOLD        = { minScore = 2640, wingScore = 2783 },
    SILVER      = { minScore = 1218, wingScore = 2131 },
    BRONZE      = { minScore =  327, wingScore =  679 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3935,
    CHALLENGER  = { minScore = 3838, wingScore = 3847 },
    GRANDMASTER = { minScore = 3793, wingScore = 3815 },
    MASTER      = { minScore = 3638, wingScore = 3715 },
    DIAMOND     = { minScore = 3500, wingScore = 3569 },
    EMERALD     = { minScore = 3315, wingScore = 3408 },
    PLATINUM    = { minScore = 3029, wingScore = 3145 },
    GOLD        = { minScore = 2639, wingScore = 2841 },
    SILVER      = { minScore = 1214, wingScore = 2127 },
    BRONZE      = { minScore =  327, wingScore =  678 },
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
