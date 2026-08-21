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
    top100Score = 3078,
    CHALLENGER  = { minScore = 3029, wingScore = 3061 },
    GRANDMASTER = { minScore = 2972, wingScore = 3000 },
    MASTER      = { minScore = 2840, wingScore = 2899 },
    DIAMOND     = { minScore = 2698, wingScore = 2738 },
    EMERALD     = { minScore = 2645, wingScore = 2668 },
    PLATINUM    = { minScore = 2328, wingScore = 2535 },
    GOLD        = { minScore = 1609, wingScore = 2017 },
    SILVER      = { minScore = 660, wingScore = 1071 },
    BRONZE      = { minScore =  310, wingScore =  465 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3078,
    CHALLENGER  = { minScore = 3002, wingScore = 3061 },
    GRANDMASTER = { minScore = 2954, wingScore = 2978 },
    MASTER      = { minScore = 2784, wingScore = 2869 },
    DIAMOND     = { minScore = 2717, wingScore = 2751 },
    EMERALD     = { minScore = 2628, wingScore = 2673 },
    PLATINUM    = { minScore = 2264, wingScore = 2456 },
    GOLD        = { minScore = 1609, wingScore = 1908 },
    SILVER      = { minScore = 660, wingScore = 1071 },
    BRONZE      = { minScore =  310, wingScore =  465 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3078,
    CHALLENGER  = { minScore = 3029, wingScore = 3061 },
    GRANDMASTER = { minScore = 2993, wingScore = 3011 },
    MASTER      = { minScore = 2865, wingScore = 2929 },
    DIAMOND     = { minScore = 2789, wingScore = 2827 },
    EMERALD     = { minScore = 2688, wingScore = 2738 },
    PLATINUM    = { minScore = 2368, wingScore = 2530 },
    GOLD        = { minScore = 1609, wingScore = 2039 },
    SILVER      = { minScore = 660, wingScore = 1071 },
    BRONZE      = { minScore =  310, wingScore =  465 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3079,
    CHALLENGER  = { minScore = 3038, wingScore = 3078 },
    GRANDMASTER = { minScore = 2976, wingScore = 3003 },
    MASTER      = { minScore = 2832, wingScore = 2888 },
    DIAMOND     = { minScore = 2686, wingScore = 2730 },
    EMERALD     = { minScore = 2608, wingScore = 2648 },
    PLATINUM    = { minScore = 2193, wingScore = 2389 },
    GOLD        = { minScore = 1402, wingScore = 1810 },
    SILVER      = { minScore = 620, wingScore = 937 },
    BRONZE      = { minScore =  310, wingScore =  465 },
    IRON        = { minScore =    1, wingScore =  167 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3079,
    CHALLENGER  = { minScore = 2992, wingScore = 3078 },
    GRANDMASTER = { minScore = 2941, wingScore = 2966 },
    MASTER      = { minScore = 2762, wingScore = 2852 },
    DIAMOND     = { minScore = 2655, wingScore = 2709 },
    EMERALD     = { minScore = 2511, wingScore = 2583 },
    PLATINUM    = { minScore = 2077, wingScore = 2294 },
    GOLD        = { minScore = 1402, wingScore = 1701 },
    SILVER      = { minScore = 620, wingScore = 937 },
    BRONZE      = { minScore =  310, wingScore =  465 },
    IRON        = { minScore =    1, wingScore =  167 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3079,
    CHALLENGER  = { minScore = 3056, wingScore = 3078 },
    GRANDMASTER = { minScore = 3014, wingScore = 3035 },
    MASTER      = { minScore = 2865, wingScore = 2939 },
    DIAMOND     = { minScore = 2778, wingScore = 2822 },
    EMERALD     = { minScore = 2661, wingScore = 2719 },
    PLATINUM    = { minScore = 2264, wingScore = 2467 },
    GOLD        = { minScore = 1402, wingScore = 1888 },
    SILVER      = { minScore = 620, wingScore = 937 },
    BRONZE      = { minScore =  310, wingScore =  465 },
    IRON        = { minScore =    1, wingScore =  167 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3079,
    CHALLENGER  = { minScore = 3033, wingScore = 3068 },
    GRANDMASTER = { minScore = 2974, wingScore = 3001 },
    MASTER      = { minScore = 2837, wingScore = 2894 },
    DIAMOND     = { minScore = 2693, wingScore = 2735 },
    EMERALD     = { minScore = 2629, wingScore = 2659 },
    PLATINUM    = { minScore = 2270, wingScore = 2472 },
    GOLD        = { minScore = 1519, wingScore = 1927 },
    SILVER      = { minScore = 621, wingScore = 1013 },
    BRONZE      = { minScore =  310, wingScore =  465 },
    IRON        = { minScore =    1, wingScore =  168 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3079,
    CHALLENGER  = { minScore = 2998, wingScore = 3068 },
    GRANDMASTER = { minScore = 2948, wingScore = 2973 },
    MASTER      = { minScore = 2775, wingScore = 2862 },
    DIAMOND     = { minScore = 2691, wingScore = 2733 },
    EMERALD     = { minScore = 2578, wingScore = 2635 },
    PLATINUM    = { minScore = 2184, wingScore = 2387 },
    GOLD        = { minScore = 1521, wingScore = 1820 },
    SILVER      = { minScore = 621, wingScore = 1014 },
    BRONZE      = { minScore =  310, wingScore =  465 },
    IRON        = { minScore =    1, wingScore =  168 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3079,
    CHALLENGER  = { minScore = 3041, wingScore = 3069 },
    GRANDMASTER = { minScore = 3002, wingScore = 3022 },
    MASTER      = { minScore = 2865, wingScore = 2933 },
    DIAMOND     = { minScore = 2784, wingScore = 2825 },
    EMERALD     = { minScore = 2676, wingScore = 2730 },
    PLATINUM    = { minScore = 2322, wingScore = 2502 },
    GOLD        = { minScore = 1517, wingScore = 1972 },
    SILVER      = { minScore = 620, wingScore = 1011 },
    BRONZE      = { minScore =  310, wingScore =  465 },
    IRON        = { minScore =    1, wingScore =  168 },
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
