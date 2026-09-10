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
    top100Score = 3794,
    CHALLENGER  = { minScore = 3671, wingScore = 3717 },
    GRANDMASTER = { minScore = 3598, wingScore = 3638 },
    MASTER      = { minScore = 3489, wingScore = 3537 },
    DIAMOND     = { minScore = 3306, wingScore = 3375 },
    EMERALD     = { minScore = 3155, wingScore = 3221 },
    PLATINUM    = { minScore = 2897, wingScore = 3018 },
    GOLD        = { minScore = 2607, wingScore = 2723 },
    SILVER      = { minScore = 1135, wingScore = 2061 },
    BRONZE      = { minScore =  324, wingScore =  647 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3794,
    CHALLENGER  = { minScore = 3610, wingScore = 3717 },
    GRANDMASTER = { minScore = 3570, wingScore = 3590 },
    MASTER      = { minScore = 3429, wingScore = 3500 },
    DIAMOND     = { minScore = 3306, wingScore = 3368 },
    EMERALD     = { minScore = 3141, wingScore = 3223 },
    PLATINUM    = { minScore = 2867, wingScore = 2982 },
    GOLD        = { minScore = 2607, wingScore = 2708 },
    SILVER      = { minScore = 1135, wingScore = 2061 },
    BRONZE      = { minScore =  324, wingScore =  647 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3794,
    CHALLENGER  = { minScore = 3704, wingScore = 3717 },
    GRANDMASTER = { minScore = 3667, wingScore = 3686 },
    MASTER      = { minScore = 3535, wingScore = 3601 },
    DIAMOND     = { minScore = 3401, wingScore = 3468 },
    EMERALD     = { minScore = 3222, wingScore = 3311 },
    PLATINUM    = { minScore = 2925, wingScore = 3049 },
    GOLD        = { minScore = 2607, wingScore = 2755 },
    SILVER      = { minScore = 1135, wingScore = 2061 },
    BRONZE      = { minScore =  324, wingScore =  647 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3735,
    CHALLENGER  = { minScore = 3650, wingScore = 3682 },
    GRANDMASTER = { minScore = 3556, wingScore = 3590 },
    MASTER      = { minScore = 3433, wingScore = 3482 },
    DIAMOND     = { minScore = 3227, wingScore = 3311 },
    EMERALD     = { minScore = 3080, wingScore = 3142 },
    PLATINUM    = { minScore = 2824, wingScore = 2967 },
    GOLD        = { minScore = 2490, wingScore = 2670 },
    SILVER      = { minScore = 986, wingScore = 1876 },
    BRONZE      = { minScore =  310, wingScore =  556 },
    IRON        = { minScore =    1, wingScore =  168 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3735,
    CHALLENGER  = { minScore = 3547, wingScore = 3682 },
    GRANDMASTER = { minScore = 3505, wingScore = 3526 },
    MASTER      = { minScore = 3357, wingScore = 3431 },
    DIAMOND     = { minScore = 3241, wingScore = 3299 },
    EMERALD     = { minScore = 3087, wingScore = 3164 },
    PLATINUM    = { minScore = 2808, wingScore = 2929 },
    GOLD        = { minScore = 2490, wingScore = 2618 },
    SILVER      = { minScore = 986, wingScore = 1876 },
    BRONZE      = { minScore =  310, wingScore =  556 },
    IRON        = { minScore =    1, wingScore =  168 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3735,
    CHALLENGER  = { minScore = 3672, wingScore = 3682 },
    GRANDMASTER = { minScore = 3630, wingScore = 3651 },
    MASTER      = { minScore = 3482, wingScore = 3556 },
    DIAMOND     = { minScore = 3344, wingScore = 3413 },
    EMERALD     = { minScore = 3159, wingScore = 3251 },
    PLATINUM    = { minScore = 2865, wingScore = 2986 },
    GOLD        = { minScore = 2490, wingScore = 2686 },
    SILVER      = { minScore = 986, wingScore = 1876 },
    BRONZE      = { minScore =  310, wingScore =  556 },
    IRON        = { minScore =    1, wingScore =  168 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3794,
    CHALLENGER  = { minScore = 3662, wingScore = 3702 },
    GRANDMASTER = { minScore = 3580, wingScore = 3618 },
    MASTER      = { minScore = 3465, wingScore = 3514 },
    DIAMOND     = { minScore = 3273, wingScore = 3348 },
    EMERALD     = { minScore = 3123, wingScore = 3188 },
    PLATINUM    = { minScore = 2866, wingScore = 2996 },
    GOLD        = { minScore = 2558, wingScore = 2701 },
    SILVER      = { minScore = 1072, wingScore = 1983 },
    BRONZE      = { minScore =  310, wingScore =  609 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3794,
    CHALLENGER  = { minScore = 3584, wingScore = 3703 },
    GRANDMASTER = { minScore = 3543, wingScore = 3564 },
    MASTER      = { minScore = 3399, wingScore = 3472 },
    DIAMOND     = { minScore = 3279, wingScore = 3340 },
    EMERALD     = { minScore = 3119, wingScore = 3199 },
    PLATINUM    = { minScore = 2843, wingScore = 2960 },
    GOLD        = { minScore = 2559, wingScore = 2671 },
    SILVER      = { minScore = 1074, wingScore = 1985 },
    BRONZE      = { minScore =  310, wingScore =  609 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3794,
    CHALLENGER  = { minScore = 3690, wingScore = 3702 },
    GRANDMASTER = { minScore = 3651, wingScore = 3671 },
    MASTER      = { minScore = 3512, wingScore = 3582 },
    DIAMOND     = { minScore = 3376, wingScore = 3444 },
    EMERALD     = { minScore = 3195, wingScore = 3285 },
    PLATINUM    = { minScore = 2899, wingScore = 3022 },
    GOLD        = { minScore = 2557, wingScore = 2725 },
    SILVER      = { minScore = 1071, wingScore = 1981 },
    BRONZE      = { minScore =  310, wingScore =  608 },
    IRON        = { minScore =    1, wingScore =  169 },
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
