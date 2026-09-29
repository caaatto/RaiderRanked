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
    top100Score = 3965,
    CHALLENGER  = { minScore = 3851, wingScore = 3895 },
    GRANDMASTER = { minScore = 3773, wingScore = 3792 },
    MASTER      = { minScore = 3654, wingScore = 3691 },
    DIAMOND     = { minScore = 3448, wingScore = 3536 },
    EMERALD     = { minScore = 3310, wingScore = 3374 },
    PLATINUM    = { minScore = 3031, wingScore = 3141 },
    GOLD        = { minScore = 2684, wingScore = 2861 },
    SILVER      = { minScore = 1327, wingScore = 2254 },
    BRONZE      = { minScore =  331, wingScore =  720 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3965,
    CHALLENGER  = { minScore = 3774, wingScore = 3895 },
    GRANDMASTER = { minScore = 3731, wingScore = 3753 },
    MASTER      = { minScore = 3581, wingScore = 3656 },
    DIAMOND     = { minScore = 3456, wingScore = 3519 },
    EMERALD     = { minScore = 3290, wingScore = 3373 },
    PLATINUM    = { minScore = 3029, wingScore = 3136 },
    GOLD        = { minScore = 2684, wingScore = 2850 },
    SILVER      = { minScore = 1327, wingScore = 2254 },
    BRONZE      = { minScore =  331, wingScore =  720 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3965,
    CHALLENGER  = { minScore = 3893, wingScore = 3895 },
    GRANDMASTER = { minScore = 3849, wingScore = 3871 },
    MASTER      = { minScore = 3693, wingScore = 3771 },
    DIAMOND     = { minScore = 3560, wingScore = 3626 },
    EMERALD     = { minScore = 3384, wingScore = 3472 },
    PLATINUM    = { minScore = 3096, wingScore = 3216 },
    GOLD        = { minScore = 2684, wingScore = 2898 },
    SILVER      = { minScore = 1327, wingScore = 2254 },
    BRONZE      = { minScore =  331, wingScore =  720 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3921,
    CHALLENGER  = { minScore = 3805, wingScore = 3866 },
    GRANDMASTER = { minScore = 3713, wingScore = 3760 },
    MASTER      = { minScore = 3580, wingScore = 3641 },
    DIAMOND     = { minScore = 3367, wingScore = 3446 },
    EMERALD     = { minScore = 3215, wingScore = 3286 },
    PLATINUM    = { minScore = 2992, wingScore = 3066 },
    GOLD        = { minScore = 2621, wingScore = 2776 },
    SILVER      = { minScore = 1133, wingScore = 2056 },
    BRONZE      = { minScore =  324, wingScore =  657 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3921,
    CHALLENGER  = { minScore = 3694, wingScore = 3866 },
    GRANDMASTER = { minScore = 3651, wingScore = 3672 },
    MASTER      = { minScore = 3499, wingScore = 3575 },
    DIAMOND     = { minScore = 3370, wingScore = 3435 },
    EMERALD     = { minScore = 3198, wingScore = 3284 },
    PLATINUM    = { minScore = 2930, wingScore = 3039 },
    GOLD        = { minScore = 2621, wingScore = 2756 },
    SILVER      = { minScore = 1133, wingScore = 2056 },
    BRONZE      = { minScore =  324, wingScore =  657 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3921,
    CHALLENGER  = { minScore = 3853, wingScore = 3866 },
    GRANDMASTER = { minScore = 3807, wingScore = 3830 },
    MASTER      = { minScore = 3645, wingScore = 3726 },
    DIAMOND     = { minScore = 3496, wingScore = 3571 },
    EMERALD     = { minScore = 3299, wingScore = 3398 },
    PLATINUM    = { minScore = 3013, wingScore = 3125 },
    GOLD        = { minScore = 2621, wingScore = 2827 },
    SILVER      = { minScore = 1133, wingScore = 2056 },
    BRONZE      = { minScore =  324, wingScore =  657 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3965,
    CHALLENGER  = { minScore = 3832, wingScore = 3883 },
    GRANDMASTER = { minScore = 3748, wingScore = 3779 },
    MASTER      = { minScore = 3623, wingScore = 3670 },
    DIAMOND     = { minScore = 3414, wingScore = 3498 },
    EMERALD     = { minScore = 3270, wingScore = 3337 },
    PLATINUM    = { minScore = 3015, wingScore = 3110 },
    GOLD        = { minScore = 2658, wingScore = 2825 },
    SILVER      = { minScore = 1246, wingScore = 2171 },
    BRONZE      = { minScore =  328, wingScore =  694 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3965,
    CHALLENGER  = { minScore = 3741, wingScore = 3883 },
    GRANDMASTER = { minScore = 3698, wingScore = 3720 },
    MASTER      = { minScore = 3547, wingScore = 3623 },
    DIAMOND     = { minScore = 3421, wingScore = 3485 },
    EMERALD     = { minScore = 3252, wingScore = 3337 },
    PLATINUM    = { minScore = 2988, wingScore = 3096 },
    GOLD        = { minScore = 2658, wingScore = 2811 },
    SILVER      = { minScore = 1248, wingScore = 2173 },
    BRONZE      = { minScore =  328, wingScore =  694 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3965,
    CHALLENGER  = { minScore = 3876, wingScore = 3883 },
    GRANDMASTER = { minScore = 3831, wingScore = 3853 },
    MASTER      = { minScore = 3672, wingScore = 3752 },
    DIAMOND     = { minScore = 3533, wingScore = 3602 },
    EMERALD     = { minScore = 3348, wingScore = 3440 },
    PLATINUM    = { minScore = 3061, wingScore = 3177 },
    GOLD        = { minScore = 2657, wingScore = 2868 },
    SILVER      = { minScore = 1244, wingScore = 2169 },
    BRONZE      = { minScore =  328, wingScore =  693 },
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
