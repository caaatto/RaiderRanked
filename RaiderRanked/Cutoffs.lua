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
    top100Score = 3914,
    CHALLENGER  = { minScore = 3790, wingScore = 3840 },
    GRANDMASTER = { minScore = 3714, wingScore = 3756 },
    MASTER      = { minScore = 3596, wingScore = 3652 },
    DIAMOND     = { minScore = 3411, wingScore = 3479 },
    EMERALD     = { minScore = 3262, wingScore = 3327 },
    PLATINUM    = { minScore = 3008, wingScore = 3097 },
    GOLD        = { minScore = 2660, wingScore = 2812 },
    SILVER      = { minScore = 1287, wingScore = 2185 },
    BRONZE      = { minScore =  330, wingScore =  698 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3914,
    CHALLENGER  = { minScore = 3716, wingScore = 3840 },
    GRANDMASTER = { minScore = 3677, wingScore = 3697 },
    MASTER      = { minScore = 3539, wingScore = 3608 },
    DIAMOND     = { minScore = 3414, wingScore = 3476 },
    EMERALD     = { minScore = 3246, wingScore = 3330 },
    PLATINUM    = { minScore = 2975, wingScore = 3087 },
    GOLD        = { minScore = 2660, wingScore = 2804 },
    SILVER      = { minScore = 1287, wingScore = 2185 },
    BRONZE      = { minScore =  330, wingScore =  698 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3914,
    CHALLENGER  = { minScore = 3832, wingScore = 3840 },
    GRANDMASTER = { minScore = 3793, wingScore = 3812 },
    MASTER      = { minScore = 3653, wingScore = 3723 },
    DIAMOND     = { minScore = 3516, wingScore = 3585 },
    EMERALD     = { minScore = 3334, wingScore = 3425 },
    PLATINUM    = { minScore = 3045, wingScore = 3164 },
    GOLD        = { minScore = 2660, wingScore = 2855 },
    SILVER      = { minScore = 1287, wingScore = 2185 },
    BRONZE      = { minScore =  330, wingScore =  698 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3864,
    CHALLENGER  = { minScore = 3761, wingScore = 3798 },
    GRANDMASTER = { minScore = 3661, wingScore = 3695 },
    MASTER      = { minScore = 3535, wingScore = 3580 },
    DIAMOND     = { minScore = 3321, wingScore = 3409 },
    EMERALD     = { minScore = 3170, wingScore = 3236 },
    PLATINUM    = { minScore = 2940, wingScore = 3034 },
    GOLD        = { minScore = 2584, wingScore = 2734 },
    SILVER      = { minScore = 1081, wingScore = 2001 },
    BRONZE      = { minScore =  322, wingScore =  649 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3864,
    CHALLENGER  = { minScore = 3654, wingScore = 3798 },
    GRANDMASTER = { minScore = 3608, wingScore = 3631 },
    MASTER      = { minScore = 3449, wingScore = 3528 },
    DIAMOND     = { minScore = 3324, wingScore = 3386 },
    EMERALD     = { minScore = 3158, wingScore = 3241 },
    PLATINUM    = { minScore = 2886, wingScore = 2999 },
    GOLD        = { minScore = 2584, wingScore = 2711 },
    SILVER      = { minScore = 1081, wingScore = 2001 },
    BRONZE      = { minScore =  322, wingScore =  649 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3864,
    CHALLENGER  = { minScore = 3793, wingScore = 3798 },
    GRANDMASTER = { minScore = 3746, wingScore = 3770 },
    MASTER      = { minScore = 3582, wingScore = 3664 },
    DIAMOND     = { minScore = 3439, wingScore = 3510 },
    EMERALD     = { minScore = 3248, wingScore = 3344 },
    PLATINUM    = { minScore = 2960, wingScore = 3076 },
    GOLD        = { minScore = 2584, wingScore = 2781 },
    SILVER      = { minScore = 1081, wingScore = 2001 },
    BRONZE      = { minScore =  322, wingScore =  649 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3914,
    CHALLENGER  = { minScore = 3778, wingScore = 3822 },
    GRANDMASTER = { minScore = 3692, wingScore = 3730 },
    MASTER      = { minScore = 3570, wingScore = 3622 },
    DIAMOND     = { minScore = 3373, wingScore = 3450 },
    EMERALD     = { minScore = 3223, wingScore = 3289 },
    PLATINUM    = { minScore = 2979, wingScore = 3071 },
    GOLD        = { minScore = 2628, wingScore = 2779 },
    SILVER      = { minScore = 1200, wingScore = 2108 },
    BRONZE      = { minScore =  327, wingScore =  677 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3914,
    CHALLENGER  = { minScore = 3691, wingScore = 3823 },
    GRANDMASTER = { minScore = 3649, wingScore = 3670 },
    MASTER      = { minScore = 3502, wingScore = 3575 },
    DIAMOND     = { minScore = 3377, wingScore = 3439 },
    EMERALD     = { minScore = 3210, wingScore = 3293 },
    PLATINUM    = { minScore = 2938, wingScore = 3051 },
    GOLD        = { minScore = 2629, wingScore = 2766 },
    SILVER      = { minScore = 1202, wingScore = 2109 },
    BRONZE      = { minScore =  327, wingScore =  678 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3914,
    CHALLENGER  = { minScore = 3815, wingScore = 3822 },
    GRANDMASTER = { minScore = 3773, wingScore = 3794 },
    MASTER      = { minScore = 3623, wingScore = 3698 },
    DIAMOND     = { minScore = 3483, wingScore = 3553 },
    EMERALD     = { minScore = 3297, wingScore = 3390 },
    PLATINUM    = { minScore = 3009, wingScore = 3126 },
    GOLD        = { minScore = 2627, wingScore = 2823 },
    SILVER      = { minScore = 1199, wingScore = 2106 },
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
