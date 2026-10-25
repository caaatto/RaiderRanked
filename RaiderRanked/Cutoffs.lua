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
    top100Score = 4182,
    CHALLENGER  = { minScore = 4020, wingScore = 4076 },
    GRANDMASTER = { minScore = 3915, wingScore = 3958 },
    MASTER      = { minScore = 3790, wingScore = 3849 },
    DIAMOND     = { minScore = 3575, wingScore = 3660 },
    EMERALD     = { minScore = 3421, wingScore = 3490 },
    PLATINUM    = { minScore = 3103, wingScore = 3243 },
    GOLD        = { minScore = 2759, wingScore = 2979 },
    SILVER      = { minScore = 1411, wingScore = 2354 },
    BRONZE      = { minScore =  333, wingScore =  769 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4182,
    CHALLENGER  = { minScore = 3909, wingScore = 4076 },
    GRANDMASTER = { minScore = 3864, wingScore = 3886 },
    MASTER      = { minScore = 3707, wingScore = 3785 },
    DIAMOND     = { minScore = 3575, wingScore = 3641 },
    EMERALD     = { minScore = 3398, wingScore = 3486 },
    PLATINUM    = { minScore = 3115, wingScore = 3232 },
    GOLD        = { minScore = 2759, wingScore = 2922 },
    SILVER      = { minScore = 1411, wingScore = 2354 },
    BRONZE      = { minScore =  333, wingScore =  769 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4182,
    CHALLENGER  = { minScore = 4071, wingScore = 4076 },
    GRANDMASTER = { minScore = 4023, wingScore = 4047 },
    MASTER      = { minScore = 3856, wingScore = 3940 },
    DIAMOND     = { minScore = 3707, wingScore = 3781 },
    EMERALD     = { minScore = 3508, wingScore = 3607 },
    PLATINUM    = { minScore = 3170, wingScore = 3313 },
    GOLD        = { minScore = 2759, wingScore = 2964 },
    SILVER      = { minScore = 1411, wingScore = 2354 },
    BRONZE      = { minScore =  333, wingScore =  769 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4113,
    CHALLENGER  = { minScore = 3985, wingScore = 4029 },
    GRANDMASTER = { minScore = 3873, wingScore = 3907 },
    MASTER      = { minScore = 3714, wingScore = 3776 },
    DIAMOND     = { minScore = 3487, wingScore = 3580 },
    EMERALD     = { minScore = 3320, wingScore = 3399 },
    PLATINUM    = { minScore = 3042, wingScore = 3147 },
    GOLD        = { minScore = 2669, wingScore = 2874 },
    SILVER      = { minScore = 1198, wingScore = 2143 },
    BRONZE      = { minScore =  325, wingScore =  665 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4113,
    CHALLENGER  = { minScore = 3836, wingScore = 4029 },
    GRANDMASTER = { minScore = 3790, wingScore = 3813 },
    MASTER      = { minScore = 3629, wingScore = 3710 },
    DIAMOND     = { minScore = 3488, wingScore = 3559 },
    EMERALD     = { minScore = 3299, wingScore = 3394 },
    PLATINUM    = { minScore = 3036, wingScore = 3137 },
    GOLD        = { minScore = 2669, wingScore = 2850 },
    SILVER      = { minScore = 1198, wingScore = 2143 },
    BRONZE      = { minScore =  325, wingScore =  665 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4113,
    CHALLENGER  = { minScore = 4022, wingScore = 4029 },
    GRANDMASTER = { minScore = 3968, wingScore = 3995 },
    MASTER      = { minScore = 3779, wingScore = 3874 },
    DIAMOND     = { minScore = 3622, wingScore = 3700 },
    EMERALD     = { minScore = 3411, wingScore = 3516 },
    PLATINUM    = { minScore = 3110, wingScore = 3227 },
    GOLD        = { minScore = 2669, wingScore = 2906 },
    SILVER      = { minScore = 1198, wingScore = 2143 },
    BRONZE      = { minScore =  325, wingScore =  665 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4182,
    CHALLENGER  = { minScore = 4005, wingScore = 4056 },
    GRANDMASTER = { minScore = 3898, wingScore = 3937 },
    MASTER      = { minScore = 3758, wingScore = 3819 },
    DIAMOND     = { minScore = 3538, wingScore = 3627 },
    EMERALD     = { minScore = 3379, wingScore = 3452 },
    PLATINUM    = { minScore = 3078, wingScore = 3203 },
    GOLD        = { minScore = 2722, wingScore = 2935 },
    SILVER      = { minScore = 1322, wingScore = 2266 },
    BRONZE      = { minScore =  330, wingScore =  726 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4182,
    CHALLENGER  = { minScore = 3879, wingScore = 4057 },
    GRANDMASTER = { minScore = 3834, wingScore = 3856 },
    MASTER      = { minScore = 3675, wingScore = 3754 },
    DIAMOND     = { minScore = 3540, wingScore = 3608 },
    EMERALD     = { minScore = 3358, wingScore = 3448 },
    PLATINUM    = { minScore = 3083, wingScore = 3193 },
    GOLD        = { minScore = 2722, wingScore = 2893 },
    SILVER      = { minScore = 1324, wingScore = 2268 },
    BRONZE      = { minScore =  330, wingScore =  727 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4182,
    CHALLENGER  = { minScore = 4050, wingScore = 4056 },
    GRANDMASTER = { minScore = 4000, wingScore = 4025 },
    MASTER      = { minScore = 3823, wingScore = 3912 },
    DIAMOND     = { minScore = 3671, wingScore = 3747 },
    EMERALD     = { minScore = 3467, wingScore = 3568 },
    PLATINUM    = { minScore = 3145, wingScore = 3277 },
    GOLD        = { minScore = 2721, wingScore = 2939 },
    SILVER      = { minScore = 1321, wingScore = 2264 },
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
