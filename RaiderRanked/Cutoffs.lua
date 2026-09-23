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
    top100Score = 3916,
    CHALLENGER  = { minScore = 3799, wingScore = 3846 },
    GRANDMASTER = { minScore = 3720, wingScore = 3760 },
    MASTER      = { minScore = 3601, wingScore = 3654 },
    DIAMOND     = { minScore = 3415, wingScore = 3485 },
    EMERALD     = { minScore = 3266, wingScore = 3330 },
    PLATINUM    = { minScore = 3009, wingScore = 3100 },
    GOLD        = { minScore = 2661, wingScore = 2815 },
    SILVER      = { minScore = 1288, wingScore = 2188 },
    BRONZE      = { minScore =  330, wingScore =  694 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3916,
    CHALLENGER  = { minScore = 3725, wingScore = 3846 },
    GRANDMASTER = { minScore = 3684, wingScore = 3705 },
    MASTER      = { minScore = 3542, wingScore = 3613 },
    DIAMOND     = { minScore = 3416, wingScore = 3479 },
    EMERALD     = { minScore = 3249, wingScore = 3333 },
    PLATINUM    = { minScore = 2980, wingScore = 3091 },
    GOLD        = { minScore = 2661, wingScore = 2807 },
    SILVER      = { minScore = 1288, wingScore = 2188 },
    BRONZE      = { minScore =  330, wingScore =  694 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3916,
    CHALLENGER  = { minScore = 3836, wingScore = 3846 },
    GRANDMASTER = { minScore = 3795, wingScore = 3816 },
    MASTER      = { minScore = 3655, wingScore = 3725 },
    DIAMOND     = { minScore = 3519, wingScore = 3587 },
    EMERALD     = { minScore = 3337, wingScore = 3428 },
    PLATINUM    = { minScore = 3049, wingScore = 3167 },
    GOLD        = { minScore = 2661, wingScore = 2858 },
    SILVER      = { minScore = 1288, wingScore = 2188 },
    BRONZE      = { minScore =  330, wingScore =  694 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3871,
    CHALLENGER  = { minScore = 3769, wingScore = 3805 },
    GRANDMASTER = { minScore = 3666, wingScore = 3699 },
    MASTER      = { minScore = 3538, wingScore = 3584 },
    DIAMOND     = { minScore = 3325, wingScore = 3413 },
    EMERALD     = { minScore = 3176, wingScore = 3241 },
    PLATINUM    = { minScore = 2947, wingScore = 3038 },
    GOLD        = { minScore = 2589, wingScore = 2739 },
    SILVER      = { minScore = 1085, wingScore = 2006 },
    BRONZE      = { minScore =  322, wingScore =  648 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3871,
    CHALLENGER  = { minScore = 3655, wingScore = 3805 },
    GRANDMASTER = { minScore = 3610, wingScore = 3633 },
    MASTER      = { minScore = 3452, wingScore = 3531 },
    DIAMOND     = { minScore = 3328, wingScore = 3390 },
    EMERALD     = { minScore = 3162, wingScore = 3245 },
    PLATINUM    = { minScore = 2891, wingScore = 3004 },
    GOLD        = { minScore = 2589, wingScore = 2715 },
    SILVER      = { minScore = 1085, wingScore = 2006 },
    BRONZE      = { minScore =  322, wingScore =  648 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3871,
    CHALLENGER  = { minScore = 3801, wingScore = 3805 },
    GRANDMASTER = { minScore = 3754, wingScore = 3777 },
    MASTER      = { minScore = 3588, wingScore = 3671 },
    DIAMOND     = { minScore = 3444, wingScore = 3516 },
    EMERALD     = { minScore = 3253, wingScore = 3349 },
    PLATINUM    = { minScore = 2965, wingScore = 3081 },
    GOLD        = { minScore = 2589, wingScore = 2785 },
    SILVER      = { minScore = 1085, wingScore = 2006 },
    BRONZE      = { minScore =  322, wingScore =  648 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3916,
    CHALLENGER  = { minScore = 3786, wingScore = 3829 },
    GRANDMASTER = { minScore = 3697, wingScore = 3734 },
    MASTER      = { minScore = 3575, wingScore = 3625 },
    DIAMOND     = { minScore = 3377, wingScore = 3455 },
    EMERALD     = { minScore = 3228, wingScore = 3293 },
    PLATINUM    = { minScore = 2983, wingScore = 3074 },
    GOLD        = { minScore = 2631, wingScore = 2783 },
    SILVER      = { minScore = 1203, wingScore = 2112 },
    BRONZE      = { minScore =  327, wingScore =  675 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3916,
    CHALLENGER  = { minScore = 3696, wingScore = 3829 },
    GRANDMASTER = { minScore = 3654, wingScore = 3675 },
    MASTER      = { minScore = 3505, wingScore = 3579 },
    DIAMOND     = { minScore = 3380, wingScore = 3442 },
    EMERALD     = { minScore = 3213, wingScore = 3297 },
    PLATINUM    = { minScore = 2943, wingScore = 3055 },
    GOLD        = { minScore = 2631, wingScore = 2769 },
    SILVER      = { minScore = 1205, wingScore = 2113 },
    BRONZE      = { minScore =  327, wingScore =  675 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3916,
    CHALLENGER  = { minScore = 3821, wingScore = 3828 },
    GRANDMASTER = { minScore = 3777, wingScore = 3799 },
    MASTER      = { minScore = 3626, wingScore = 3702 },
    DIAMOND     = { minScore = 3487, wingScore = 3557 },
    EMERALD     = { minScore = 3301, wingScore = 3394 },
    PLATINUM    = { minScore = 3013, wingScore = 3130 },
    GOLD        = { minScore = 2630, wingScore = 2827 },
    SILVER      = { minScore = 1201, wingScore = 2110 },
    BRONZE      = { minScore =  327, wingScore =  674 },
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
