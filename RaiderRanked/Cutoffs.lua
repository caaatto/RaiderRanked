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
    top100Score = 4101,
    CHALLENGER  = { minScore = 3947, wingScore = 4010 },
    GRANDMASTER = { minScore = 3878, wingScore = 3896 },
    MASTER      = { minScore = 3748, wingScore = 3786 },
    DIAMOND     = { minScore = 3540, wingScore = 3617 },
    EMERALD     = { minScore = 3386, wingScore = 3450 },
    PLATINUM    = { minScore = 3082, wingScore = 3215 },
    GOLD        = { minScore = 2736, wingScore = 2949 },
    SILVER      = { minScore = 1379, wingScore = 2324 },
    BRONZE      = { minScore =  332, wingScore =  750 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4101,
    CHALLENGER  = { minScore = 3871, wingScore = 4010 },
    GRANDMASTER = { minScore = 3826, wingScore = 3848 },
    MASTER      = { minScore = 3667, wingScore = 3746 },
    DIAMOND     = { minScore = 3538, wingScore = 3603 },
    EMERALD     = { minScore = 3367, wingScore = 3453 },
    PLATINUM    = { minScore = 3099, wingScore = 3208 },
    GOLD        = { minScore = 2736, wingScore = 2909 },
    SILVER      = { minScore = 1379, wingScore = 2324 },
    BRONZE      = { minScore =  332, wingScore =  750 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4101,
    CHALLENGER  = { minScore = 4009, wingScore = 4010 },
    GRANDMASTER = { minScore = 3960, wingScore = 3984 },
    MASTER      = { minScore = 3789, wingScore = 3875 },
    DIAMOND     = { minScore = 3649, wingScore = 3719 },
    EMERALD     = { minScore = 3463, wingScore = 3556 },
    PLATINUM    = { minScore = 3147, wingScore = 3280 },
    GOLD        = { minScore = 2736, wingScore = 2945 },
    SILVER      = { minScore = 1379, wingScore = 2324 },
    BRONZE      = { minScore =  332, wingScore =  750 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4016,
    CHALLENGER  = { minScore = 3901, wingScore = 3947 },
    GRANDMASTER = { minScore = 3802, wingScore = 3847 },
    MASTER      = { minScore = 3669, wingScore = 3726 },
    DIAMOND     = { minScore = 3447, wingScore = 3540 },
    EMERALD     = { minScore = 3294, wingScore = 3362 },
    PLATINUM    = { minScore = 3028, wingScore = 3125 },
    GOLD        = { minScore = 2656, wingScore = 2848 },
    SILVER      = { minScore = 1180, wingScore = 2120 },
    BRONZE      = { minScore =  325, wingScore =  662 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4016,
    CHALLENGER  = { minScore = 3779, wingScore = 3947 },
    GRANDMASTER = { minScore = 3736, wingScore = 3758 },
    MASTER      = { minScore = 3585, wingScore = 3661 },
    DIAMOND     = { minScore = 3451, wingScore = 3518 },
    EMERALD     = { minScore = 3272, wingScore = 3361 },
    PLATINUM    = { minScore = 3009, wingScore = 3113 },
    GOLD        = { minScore = 2656, wingScore = 2826 },
    SILVER      = { minScore = 1180, wingScore = 2120 },
    BRONZE      = { minScore =  325, wingScore =  662 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4016,
    CHALLENGER  = { minScore = 3940, wingScore = 3947 },
    GRANDMASTER = { minScore = 3894, wingScore = 3917 },
    MASTER      = { minScore = 3732, wingScore = 3813 },
    DIAMOND     = { minScore = 3580, wingScore = 3656 },
    EMERALD     = { minScore = 3377, wingScore = 3478 },
    PLATINUM    = { minScore = 3092, wingScore = 3202 },
    GOLD        = { minScore = 2656, wingScore = 2893 },
    SILVER      = { minScore = 1180, wingScore = 2120 },
    BRONZE      = { minScore =  325, wingScore =  662 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4101,
    CHALLENGER  = { minScore = 3928, wingScore = 3984 },
    GRANDMASTER = { minScore = 3846, wingScore = 3876 },
    MASTER      = { minScore = 3715, wingScore = 3761 },
    DIAMOND     = { minScore = 3501, wingScore = 3585 },
    EMERALD     = { minScore = 3348, wingScore = 3413 },
    PLATINUM    = { minScore = 3060, wingScore = 3178 },
    GOLD        = { minScore = 2703, wingScore = 2907 },
    SILVER      = { minScore = 1296, wingScore = 2239 },
    BRONZE      = { minScore =  329, wingScore =  713 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4101,
    CHALLENGER  = { minScore = 3833, wingScore = 3984 },
    GRANDMASTER = { minScore = 3789, wingScore = 3811 },
    MASTER      = { minScore = 3634, wingScore = 3711 },
    DIAMOND     = { minScore = 3503, wingScore = 3568 },
    EMERALD     = { minScore = 3328, wingScore = 3415 },
    PLATINUM    = { minScore = 3062, wingScore = 3169 },
    GOLD        = { minScore = 2703, wingScore = 2875 },
    SILVER      = { minScore = 1298, wingScore = 2241 },
    BRONZE      = { minScore =  329, wingScore =  714 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4101,
    CHALLENGER  = { minScore = 3980, wingScore = 3983 },
    GRANDMASTER = { minScore = 3932, wingScore = 3956 },
    MASTER      = { minScore = 3765, wingScore = 3849 },
    DIAMOND     = { minScore = 3620, wingScore = 3692 },
    EMERALD     = { minScore = 3426, wingScore = 3523 },
    PLATINUM    = { minScore = 3124, wingScore = 3247 },
    GOLD        = { minScore = 2702, wingScore = 2923 },
    SILVER      = { minScore = 1294, wingScore = 2237 },
    BRONZE      = { minScore =  329, wingScore =  713 },
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
