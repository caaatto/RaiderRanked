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
    top100Score = 4039,
    CHALLENGER  = { minScore = 3906, wingScore = 3953 },
    GRANDMASTER = { minScore = 3826, wingScore = 3871 },
    MASTER      = { minScore = 3704, wingScore = 3766 },
    DIAMOND     = { minScore = 3510, wingScore = 3582 },
    EMERALD     = { minScore = 3357, wingScore = 3427 },
    PLATINUM    = { minScore = 3066, wingScore = 3195 },
    GOLD        = { minScore = 2720, wingScore = 2922 },
    SILVER      = { minScore = 1365, wingScore = 2311 },
    BRONZE      = { minScore =  332, wingScore =  744 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4039,
    CHALLENGER  = { minScore = 3820, wingScore = 3953 },
    GRANDMASTER = { minScore = 3782, wingScore = 3801 },
    MASTER      = { minScore = 3647, wingScore = 3714 },
    DIAMOND     = { minScore = 3516, wingScore = 3582 },
    EMERALD     = { minScore = 3343, wingScore = 3430 },
    PLATINUM    = { minScore = 3083, wingScore = 3187 },
    GOLD        = { minScore = 2720, wingScore = 2898 },
    SILVER      = { minScore = 1365, wingScore = 2311 },
    BRONZE      = { minScore =  332, wingScore =  744 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4039,
    CHALLENGER  = { minScore = 3949, wingScore = 3953 },
    GRANDMASTER = { minScore = 3909, wingScore = 3929 },
    MASTER      = { minScore = 3770, wingScore = 3839 },
    DIAMOND     = { minScore = 3627, wingScore = 3699 },
    EMERALD     = { minScore = 3437, wingScore = 3532 },
    PLATINUM    = { minScore = 3129, wingScore = 3257 },
    GOLD        = { minScore = 2720, wingScore = 2930 },
    SILVER      = { minScore = 1365, wingScore = 2311 },
    BRONZE      = { minScore =  332, wingScore =  744 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3981,
    CHALLENGER  = { minScore = 3877, wingScore = 3911 },
    GRANDMASTER = { minScore = 3775, wingScore = 3805 },
    MASTER      = { minScore = 3647, wingScore = 3687 },
    DIAMOND     = { minScore = 3423, wingScore = 3509 },
    EMERALD     = { minScore = 3268, wingScore = 3336 },
    PLATINUM    = { minScore = 3018, wingScore = 3107 },
    GOLD        = { minScore = 2648, wingScore = 2826 },
    SILVER      = { minScore = 1171, wingScore = 2106 },
    BRONZE      = { minScore =  324, wingScore =  661 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3981,
    CHALLENGER  = { minScore = 3760, wingScore = 3911 },
    GRANDMASTER = { minScore = 3714, wingScore = 3737 },
    MASTER      = { minScore = 3552, wingScore = 3633 },
    DIAMOND     = { minScore = 3422, wingScore = 3487 },
    EMERALD     = { minScore = 3248, wingScore = 3335 },
    PLATINUM    = { minScore = 2985, wingScore = 3090 },
    GOLD        = { minScore = 2648, wingScore = 2806 },
    SILVER      = { minScore = 1171, wingScore = 2106 },
    BRONZE      = { minScore =  324, wingScore =  661 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3981,
    CHALLENGER  = { minScore = 3906, wingScore = 3911 },
    GRANDMASTER = { minScore = 3859, wingScore = 3883 },
    MASTER      = { minScore = 3692, wingScore = 3775 },
    DIAMOND     = { minScore = 3545, wingScore = 3618 },
    EMERALD     = { minScore = 3349, wingScore = 3447 },
    PLATINUM    = { minScore = 3070, wingScore = 3178 },
    GOLD        = { minScore = 2648, wingScore = 2876 },
    SILVER      = { minScore = 1171, wingScore = 2106 },
    BRONZE      = { minScore =  324, wingScore =  661 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4039,
    CHALLENGER  = { minScore = 3894, wingScore = 3935 },
    GRANDMASTER = { minScore = 3805, wingScore = 3843 },
    MASTER      = { minScore = 3680, wingScore = 3733 },
    DIAMOND     = { minScore = 3474, wingScore = 3552 },
    EMERALD     = { minScore = 3320, wingScore = 3389 },
    PLATINUM    = { minScore = 3046, wingScore = 3158 },
    GOLD        = { minScore = 2690, wingScore = 2882 },
    SILVER      = { minScore = 1284, wingScore = 2225 },
    BRONZE      = { minScore =  329, wingScore =  709 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4039,
    CHALLENGER  = { minScore = 3795, wingScore = 3936 },
    GRANDMASTER = { minScore = 3754, wingScore = 3775 },
    MASTER      = { minScore = 3608, wingScore = 3681 },
    DIAMOND     = { minScore = 3478, wingScore = 3543 },
    EMERALD     = { minScore = 3304, wingScore = 3391 },
    PLATINUM    = { minScore = 3043, wingScore = 3147 },
    GOLD        = { minScore = 2691, wingScore = 2860 },
    SILVER      = { minScore = 1286, wingScore = 2227 },
    BRONZE      = { minScore =  329, wingScore =  710 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4039,
    CHALLENGER  = { minScore = 3931, wingScore = 3935 },
    GRANDMASTER = { minScore = 3888, wingScore = 3909 },
    MASTER      = { minScore = 3737, wingScore = 3812 },
    DIAMOND     = { minScore = 3592, wingScore = 3665 },
    EMERALD     = { minScore = 3400, wingScore = 3496 },
    PLATINUM    = { minScore = 3104, wingScore = 3223 },
    GOLD        = { minScore = 2689, wingScore = 2907 },
    SILVER      = { minScore = 1282, wingScore = 2224 },
    BRONZE      = { minScore =  329, wingScore =  709 },
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
