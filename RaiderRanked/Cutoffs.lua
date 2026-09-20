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
    top100Score = 3909,
    CHALLENGER  = { minScore = 3784, wingScore = 3830 },
    GRANDMASTER = { minScore = 3701, wingScore = 3742 },
    MASTER      = { minScore = 3584, wingScore = 3642 },
    DIAMOND     = { minScore = 3402, wingScore = 3469 },
    EMERALD     = { minScore = 3252, wingScore = 3319 },
    PLATINUM    = { minScore = 3004, wingScore = 3090 },
    GOLD        = { minScore = 2656, wingScore = 2803 },
    SILVER      = { minScore = 1281, wingScore = 2176 },
    BRONZE      = { minScore =  330, wingScore =  699 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3909,
    CHALLENGER  = { minScore = 3701, wingScore = 3830 },
    GRANDMASTER = { minScore = 3663, wingScore = 3682 },
    MASTER      = { minScore = 3532, wingScore = 3598 },
    DIAMOND     = { minScore = 3405, wingScore = 3468 },
    EMERALD     = { minScore = 3234, wingScore = 3319 },
    PLATINUM    = { minScore = 2962, wingScore = 3074 },
    GOLD        = { minScore = 2656, wingScore = 2794 },
    SILVER      = { minScore = 1281, wingScore = 2176 },
    BRONZE      = { minScore =  330, wingScore =  699 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3909,
    CHALLENGER  = { minScore = 3819, wingScore = 3830 },
    GRANDMASTER = { minScore = 3779, wingScore = 3799 },
    MASTER      = { minScore = 3638, wingScore = 3709 },
    DIAMOND     = { minScore = 3502, wingScore = 3570 },
    EMERALD     = { minScore = 3322, wingScore = 3412 },
    PLATINUM    = { minScore = 3031, wingScore = 3151 },
    GOLD        = { minScore = 2656, wingScore = 2843 },
    SILVER      = { minScore = 1281, wingScore = 2176 },
    BRONZE      = { minScore =  330, wingScore =  699 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3856,
    CHALLENGER  = { minScore = 3747, wingScore = 3789 },
    GRANDMASTER = { minScore = 3655, wingScore = 3685 },
    MASTER      = { minScore = 3528, wingScore = 3569 },
    DIAMOND     = { minScore = 3314, wingScore = 3400 },
    EMERALD     = { minScore = 3162, wingScore = 3229 },
    PLATINUM    = { minScore = 2929, wingScore = 3030 },
    GOLD        = { minScore = 2578, wingScore = 2728 },
    SILVER      = { minScore = 1078, wingScore = 1995 },
    BRONZE      = { minScore =  323, wingScore =  652 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3856,
    CHALLENGER  = { minScore = 3647, wingScore = 3789 },
    GRANDMASTER = { minScore = 3601, wingScore = 3624 },
    MASTER      = { minScore = 3439, wingScore = 3520 },
    DIAMOND     = { minScore = 3315, wingScore = 3377 },
    EMERALD     = { minScore = 3151, wingScore = 3233 },
    PLATINUM    = { minScore = 2878, wingScore = 2992 },
    GOLD        = { minScore = 2578, wingScore = 2702 },
    SILVER      = { minScore = 1078, wingScore = 1995 },
    BRONZE      = { minScore =  323, wingScore =  652 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3856,
    CHALLENGER  = { minScore = 3782, wingScore = 3789 },
    GRANDMASTER = { minScore = 3736, wingScore = 3759 },
    MASTER      = { minScore = 3571, wingScore = 3653 },
    DIAMOND     = { minScore = 3429, wingScore = 3500 },
    EMERALD     = { minScore = 3239, wingScore = 3334 },
    PLATINUM    = { minScore = 2950, wingScore = 3066 },
    GOLD        = { minScore = 2578, wingScore = 2771 },
    SILVER      = { minScore = 1078, wingScore = 1995 },
    BRONZE      = { minScore =  323, wingScore =  652 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3909,
    CHALLENGER  = { minScore = 3768, wingScore = 3813 },
    GRANDMASTER = { minScore = 3682, wingScore = 3718 },
    MASTER      = { minScore = 3560, wingScore = 3611 },
    DIAMOND     = { minScore = 3365, wingScore = 3440 },
    EMERALD     = { minScore = 3214, wingScore = 3281 },
    PLATINUM    = { minScore = 2972, wingScore = 3065 },
    GOLD        = { minScore = 2623, wingScore = 2771 },
    SILVER      = { minScore = 1196, wingScore = 2100 },
    BRONZE      = { minScore =  327, wingScore =  679 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3909,
    CHALLENGER  = { minScore = 3679, wingScore = 3813 },
    GRANDMASTER = { minScore = 3637, wingScore = 3658 },
    MASTER      = { minScore = 3494, wingScore = 3566 },
    DIAMOND     = { minScore = 3368, wingScore = 3431 },
    EMERALD     = { minScore = 3200, wingScore = 3284 },
    PLATINUM    = { minScore = 2927, wingScore = 3040 },
    GOLD        = { minScore = 2624, wingScore = 2756 },
    SILVER      = { minScore = 1197, wingScore = 2102 },
    BRONZE      = { minScore =  327, wingScore =  680 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3909,
    CHALLENGER  = { minScore = 3803, wingScore = 3812 },
    GRANDMASTER = { minScore = 3760, wingScore = 3782 },
    MASTER      = { minScore = 3609, wingScore = 3685 },
    DIAMOND     = { minScore = 3471, wingScore = 3540 },
    EMERALD     = { minScore = 3286, wingScore = 3378 },
    PLATINUM    = { minScore = 2996, wingScore = 3114 },
    GOLD        = { minScore = 2622, wingScore = 2812 },
    SILVER      = { minScore = 1194, wingScore = 2098 },
    BRONZE      = { minScore =  327, wingScore =  679 },
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
