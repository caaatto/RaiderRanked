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
    top100Score = 4254,
    CHALLENGER  = { minScore = 4129, wingScore = 4148 },
    GRANDMASTER = { minScore = 4015, wingScore = 4044 },
    MASTER      = { minScore = 3892, wingScore = 3927 },
    DIAMOND     = { minScore = 3642, wingScore = 3730 },
    EMERALD     = { minScore = 3472, wingScore = 3556 },
    PLATINUM    = { minScore = 3130, wingScore = 3284 },
    GOLD        = { minScore = 2782, wingScore = 3003 },
    SILVER      = { minScore = 1423, wingScore = 2377 },
    BRONZE      = { minScore =  334, wingScore =  775 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4254,
    CHALLENGER  = { minScore = 4011, wingScore = 4148 },
    GRANDMASTER = { minScore = 3961, wingScore = 3986 },
    MASTER      = { minScore = 3788, wingScore = 3874 },
    DIAMOND     = { minScore = 3641, wingScore = 3714 },
    EMERALD     = { minScore = 3445, wingScore = 3543 },
    PLATINUM    = { minScore = 3135, wingScore = 3263 },
    GOLD        = { minScore = 2782, wingScore = 2937 },
    SILVER      = { minScore = 1423, wingScore = 2377 },
    BRONZE      = { minScore =  334, wingScore =  775 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4254,
    CHALLENGER  = { minScore = 4146, wingScore = 4148 },
    GRANDMASTER = { minScore = 4099, wingScore = 4122 },
    MASTER      = { minScore = 3936, wingScore = 4018 },
    DIAMOND     = { minScore = 3777, wingScore = 3856 },
    EMERALD     = { minScore = 3563, wingScore = 3670 },
    PLATINUM    = { minScore = 3201, wingScore = 3354 },
    GOLD        = { minScore = 2782, wingScore = 2987 },
    SILVER      = { minScore = 1423, wingScore = 2377 },
    BRONZE      = { minScore =  334, wingScore =  775 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4196,
    CHALLENGER  = { minScore = 4071, wingScore = 4131 },
    GRANDMASTER = { minScore = 3961, wingScore = 4011 },
    MASTER      = { minScore = 3797, wingScore = 3867 },
    DIAMOND     = { minScore = 3561, wingScore = 3650 },
    EMERALD     = { minScore = 3367, wingScore = 3450 },
    PLATINUM    = { minScore = 3058, wingScore = 3178 },
    GOLD        = { minScore = 2684, wingScore = 2904 },
    SILVER      = { minScore = 1206, wingScore = 2160 },
    BRONZE      = { minScore =  326, wingScore =  667 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4196,
    CHALLENGER  = { minScore = 3922, wingScore = 4131 },
    GRANDMASTER = { minScore = 3872, wingScore = 3897 },
    MASTER      = { minScore = 3694, wingScore = 3783 },
    DIAMOND     = { minScore = 3542, wingScore = 3618 },
    EMERALD     = { minScore = 3339, wingScore = 3440 },
    PLATINUM    = { minScore = 3068, wingScore = 3170 },
    GOLD        = { minScore = 2684, wingScore = 2875 },
    SILVER      = { minScore = 1206, wingScore = 2160 },
    BRONZE      = { minScore =  326, wingScore =  667 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4196,
    CHALLENGER  = { minScore = 4130, wingScore = 4131 },
    GRANDMASTER = { minScore = 4074, wingScore = 4102 },
    MASTER      = { minScore = 3877, wingScore = 3976 },
    DIAMOND     = { minScore = 3701, wingScore = 3789 },
    EMERALD     = { minScore = 3467, wingScore = 3584 },
    PLATINUM    = { minScore = 3132, wingScore = 3263 },
    GOLD        = { minScore = 2684, wingScore = 2920 },
    SILVER      = { minScore = 1206, wingScore = 2160 },
    BRONZE      = { minScore =  326, wingScore =  667 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4254,
    CHALLENGER  = { minScore = 4105, wingScore = 4141 },
    GRANDMASTER = { minScore = 3993, wingScore = 4030 },
    MASTER      = { minScore = 3853, wingScore = 3902 },
    DIAMOND     = { minScore = 3608, wingScore = 3697 },
    EMERALD     = { minScore = 3428, wingScore = 3512 },
    PLATINUM    = { minScore = 3100, wingScore = 3240 },
    GOLD        = { minScore = 2741, wingScore = 2962 },
    SILVER      = { minScore = 1333, wingScore = 2287 },
    BRONZE      = { minScore =  331, wingScore =  730 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4254,
    CHALLENGER  = { minScore = 3975, wingScore = 4141 },
    GRANDMASTER = { minScore = 3925, wingScore = 3950 },
    MASTER      = { minScore = 3750, wingScore = 3837 },
    DIAMOND     = { minScore = 3601, wingScore = 3675 },
    EMERALD     = { minScore = 3402, wingScore = 3501 },
    PLATINUM    = { minScore = 3108, wingScore = 3225 },
    GOLD        = { minScore = 2742, wingScore = 2912 },
    SILVER      = { minScore = 1335, wingScore = 2289 },
    BRONZE      = { minScore =  331, wingScore =  731 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4254,
    CHALLENGER  = { minScore = 4139, wingScore = 4141 },
    GRANDMASTER = { minScore = 4088, wingScore = 4114 },
    MASTER      = { minScore = 3911, wingScore = 4000 },
    DIAMOND     = { minScore = 3745, wingScore = 3828 },
    EMERALD     = { minScore = 3522, wingScore = 3634 },
    PLATINUM    = { minScore = 3172, wingScore = 3315 },
    GOLD        = { minScore = 2740, wingScore = 2959 },
    SILVER      = { minScore = 1331, wingScore = 2285 },
    BRONZE      = { minScore =  331, wingScore =  729 },
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
