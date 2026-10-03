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
    top100Score = 3999,
    CHALLENGER  = { minScore = 3886, wingScore = 3915 },
    GRANDMASTER = { minScore = 3788, wingScore = 3819 },
    MASTER      = { minScore = 3669, wingScore = 3718 },
    DIAMOND     = { minScore = 3470, wingScore = 3550 },
    EMERALD     = { minScore = 3327, wingScore = 3398 },
    PLATINUM    = { minScore = 3044, wingScore = 3162 },
    GOLD        = { minScore = 2699, wingScore = 2885 },
    SILVER      = { minScore = 1340, wingScore = 2282 },
    BRONZE      = { minScore =  332, wingScore =  732 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3999,
    CHALLENGER  = { minScore = 3786, wingScore = 3915 },
    GRANDMASTER = { minScore = 3746, wingScore = 3766 },
    MASTER      = { minScore = 3605, wingScore = 3676 },
    DIAMOND     = { minScore = 3478, wingScore = 3542 },
    EMERALD     = { minScore = 3309, wingScore = 3393 },
    PLATINUM    = { minScore = 3051, wingScore = 3155 },
    GOLD        = { minScore = 2699, wingScore = 2870 },
    SILVER      = { minScore = 1340, wingScore = 2282 },
    BRONZE      = { minScore =  332, wingScore =  732 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3999,
    CHALLENGER  = { minScore = 3907, wingScore = 3915 },
    GRANDMASTER = { minScore = 3865, wingScore = 3886 },
    MASTER      = { minScore = 3720, wingScore = 3792 },
    DIAMOND     = { minScore = 3584, wingScore = 3652 },
    EMERALD     = { minScore = 3402, wingScore = 3493 },
    PLATINUM    = { minScore = 3109, wingScore = 3231 },
    GOLD        = { minScore = 2699, wingScore = 2911 },
    SILVER      = { minScore = 1340, wingScore = 2282 },
    BRONZE      = { minScore =  332, wingScore =  732 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3943,
    CHALLENGER  = { minScore = 3833, wingScore = 3892 },
    GRANDMASTER = { minScore = 3741, wingScore = 3775 },
    MASTER      = { minScore = 3604, wingScore = 3658 },
    DIAMOND     = { minScore = 3393, wingScore = 3468 },
    EMERALD     = { minScore = 3235, wingScore = 3308 },
    PLATINUM    = { minScore = 3006, wingScore = 3082 },
    GOLD        = { minScore = 2633, wingScore = 2796 },
    SILVER      = { minScore = 1150, wingScore = 2078 },
    BRONZE      = { minScore =  324, wingScore =  659 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3943,
    CHALLENGER  = { minScore = 3716, wingScore = 3892 },
    GRANDMASTER = { minScore = 3673, wingScore = 3694 },
    MASTER      = { minScore = 3523, wingScore = 3598 },
    DIAMOND     = { minScore = 3392, wingScore = 3457 },
    EMERALD     = { minScore = 3218, wingScore = 3305 },
    PLATINUM    = { minScore = 2951, wingScore = 3058 },
    GOLD        = { minScore = 2633, wingScore = 2777 },
    SILVER      = { minScore = 1150, wingScore = 2078 },
    BRONZE      = { minScore =  324, wingScore =  659 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3943,
    CHALLENGER  = { minScore = 3883, wingScore = 3892 },
    GRANDMASTER = { minScore = 3834, wingScore = 3858 },
    MASTER      = { minScore = 3660, wingScore = 3747 },
    DIAMOND     = { minScore = 3513, wingScore = 3586 },
    EMERALD     = { minScore = 3316, wingScore = 3414 },
    PLATINUM    = { minScore = 3036, wingScore = 3145 },
    GOLD        = { minScore = 2633, wingScore = 2847 },
    SILVER      = { minScore = 1150, wingScore = 2078 },
    BRONZE      = { minScore =  324, wingScore =  659 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3999,
    CHALLENGER  = { minScore = 3864, wingScore = 3905 },
    GRANDMASTER = { minScore = 3768, wingScore = 3801 },
    MASTER      = { minScore = 3642, wingScore = 3693 },
    DIAMOND     = { minScore = 3438, wingScore = 3516 },
    EMERALD     = { minScore = 3289, wingScore = 3360 },
    PLATINUM    = { minScore = 3028, wingScore = 3129 },
    GOLD        = { minScore = 2671, wingScore = 2848 },
    SILVER      = { minScore = 1261, wingScore = 2197 },
    BRONZE      = { minScore =  329, wingScore =  701 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3999,
    CHALLENGER  = { minScore = 3757, wingScore = 3906 },
    GRANDMASTER = { minScore = 3716, wingScore = 3737 },
    MASTER      = { minScore = 3571, wingScore = 3644 },
    DIAMOND     = { minScore = 3443, wingScore = 3507 },
    EMERALD     = { minScore = 3272, wingScore = 3357 },
    PLATINUM    = { minScore = 3010, wingScore = 3115 },
    GOLD        = { minScore = 2672, wingScore = 2832 },
    SILVER      = { minScore = 1262, wingScore = 2199 },
    BRONZE      = { minScore =  329, wingScore =  702 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3999,
    CHALLENGER  = { minScore = 3897, wingScore = 3905 },
    GRANDMASTER = { minScore = 3852, wingScore = 3874 },
    MASTER      = { minScore = 3694, wingScore = 3773 },
    DIAMOND     = { minScore = 3554, wingScore = 3624 },
    EMERALD     = { minScore = 3365, wingScore = 3459 },
    PLATINUM    = { minScore = 3078, wingScore = 3194 },
    GOLD        = { minScore = 2671, wingScore = 2884 },
    SILVER      = { minScore = 1259, wingScore = 2195 },
    BRONZE      = { minScore =  329, wingScore =  701 },
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
