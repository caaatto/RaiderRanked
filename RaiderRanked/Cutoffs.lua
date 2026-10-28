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
    top100Score = 4222,
    CHALLENGER  = { minScore = 4045, wingScore = 4127 },
    GRANDMASTER = { minScore = 3951, wingScore = 4009 },
    MASTER      = { minScore = 3812, wingScore = 3887 },
    DIAMOND     = { minScore = 3595, wingScore = 3672 },
    EMERALD     = { minScore = 3431, wingScore = 3508 },
    PLATINUM    = { minScore = 3110, wingScore = 3253 },
    GOLD        = { minScore = 2764, wingScore = 2985 },
    SILVER      = { minScore = 1415, wingScore = 2361 },
    BRONZE      = { minScore =  333, wingScore =  770 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4222,
    CHALLENGER  = { minScore = 3934, wingScore = 4127 },
    GRANDMASTER = { minScore = 3889, wingScore = 3912 },
    MASTER      = { minScore = 3732, wingScore = 3811 },
    DIAMOND     = { minScore = 3594, wingScore = 3663 },
    EMERALD     = { minScore = 3411, wingScore = 3502 },
    PLATINUM    = { minScore = 3120, wingScore = 3239 },
    GOLD        = { minScore = 2764, wingScore = 2926 },
    SILVER      = { minScore = 1415, wingScore = 2361 },
    BRONZE      = { minScore =  333, wingScore =  770 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4222,
    CHALLENGER  = { minScore = 4118, wingScore = 4127 },
    GRANDMASTER = { minScore = 4067, wingScore = 4093 },
    MASTER      = { minScore = 3891, wingScore = 3979 },
    DIAMOND     = { minScore = 3734, wingScore = 3813 },
    EMERALD     = { minScore = 3525, wingScore = 3630 },
    PLATINUM    = { minScore = 3178, wingScore = 3323 },
    GOLD        = { minScore = 2764, wingScore = 2969 },
    SILVER      = { minScore = 1415, wingScore = 2361 },
    BRONZE      = { minScore =  333, wingScore =  770 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4136,
    CHALLENGER  = { minScore = 4014, wingScore = 4062 },
    GRANDMASTER = { minScore = 3896, wingScore = 3931 },
    MASTER      = { minScore = 3738, wingScore = 3792 },
    DIAMOND     = { minScore = 3505, wingScore = 3601 },
    EMERALD     = { minScore = 3330, wingScore = 3412 },
    PLATINUM    = { minScore = 3045, wingScore = 3155 },
    GOLD        = { minScore = 2673, wingScore = 2881 },
    SILVER      = { minScore = 1201, wingScore = 2150 },
    BRONZE      = { minScore =  325, wingScore =  665 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4136,
    CHALLENGER  = { minScore = 3873, wingScore = 4062 },
    GRANDMASTER = { minScore = 3824, wingScore = 3848 },
    MASTER      = { minScore = 3651, wingScore = 3738 },
    DIAMOND     = { minScore = 3505, wingScore = 3578 },
    EMERALD     = { minScore = 3310, wingScore = 3407 },
    PLATINUM    = { minScore = 3044, wingScore = 3145 },
    GOLD        = { minScore = 2673, wingScore = 2856 },
    SILVER      = { minScore = 1201, wingScore = 2150 },
    BRONZE      = { minScore =  325, wingScore =  665 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4136,
    CHALLENGER  = { minScore = 4056, wingScore = 4062 },
    GRANDMASTER = { minScore = 3999, wingScore = 4027 },
    MASTER      = { minScore = 3799, wingScore = 3899 },
    DIAMOND     = { minScore = 3638, wingScore = 3718 },
    EMERALD     = { minScore = 3423, wingScore = 3530 },
    PLATINUM    = { minScore = 3115, wingScore = 3235 },
    GOLD        = { minScore = 2673, wingScore = 2909 },
    SILVER      = { minScore = 1201, wingScore = 2150 },
    BRONZE      = { minScore =  325, wingScore =  665 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4222,
    CHALLENGER  = { minScore = 4032, wingScore = 4100 },
    GRANDMASTER = { minScore = 3928, wingScore = 3977 },
    MASTER      = { minScore = 3781, wingScore = 3847 },
    DIAMOND     = { minScore = 3558, wingScore = 3642 },
    EMERALD     = { minScore = 3389, wingScore = 3468 },
    PLATINUM    = { minScore = 3083, wingScore = 3212 },
    GOLD        = { minScore = 2726, wingScore = 2942 },
    SILVER      = { minScore = 1326, wingScore = 2273 },
    BRONZE      = { minScore =  330, wingScore =  726 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4222,
    CHALLENGER  = { minScore = 3909, wingScore = 4101 },
    GRANDMASTER = { minScore = 3863, wingScore = 3886 },
    MASTER      = { minScore = 3699, wingScore = 3781 },
    DIAMOND     = { minScore = 3558, wingScore = 3628 },
    EMERALD     = { minScore = 3370, wingScore = 3463 },
    PLATINUM    = { minScore = 3089, wingScore = 3201 },
    GOLD        = { minScore = 2727, wingScore = 2897 },
    SILVER      = { minScore = 1328, wingScore = 2275 },
    BRONZE      = { minScore =  330, wingScore =  727 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4222,
    CHALLENGER  = { minScore = 4092, wingScore = 4099 },
    GRANDMASTER = { minScore = 4038, wingScore = 4065 },
    MASTER      = { minScore = 3852, wingScore = 3945 },
    DIAMOND     = { minScore = 3693, wingScore = 3773 },
    EMERALD     = { minScore = 3482, wingScore = 3588 },
    PLATINUM    = { minScore = 3151, wingScore = 3286 },
    GOLD        = { minScore = 2725, wingScore = 2944 },
    SILVER      = { minScore = 1324, wingScore = 2271 },
    BRONZE      = { minScore =  330, wingScore =  725 },
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
