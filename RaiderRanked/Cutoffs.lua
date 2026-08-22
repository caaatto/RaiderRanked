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
    top100Score = 3233,
    CHALLENGER  = { minScore = 3154, wingScore = 3208 },
    GRANDMASTER = { minScore = 3073, wingScore = 3102 },
    MASTER      = { minScore = 2983, wingScore = 3013 },
    DIAMOND     = { minScore = 2774, wingScore = 2851 },
    EMERALD     = { minScore = 2688, wingScore = 2720 },
    PLATINUM    = { minScore = 2485, wingScore = 2620 },
    GOLD        = { minScore = 1819, wingScore = 2186 },
    SILVER      = { minScore = 696, wingScore = 1221 },
    BRONZE      = { minScore =  310, wingScore =  465 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3233,
    CHALLENGER  = { minScore = 3095, wingScore = 3208 },
    GRANDMASTER = { minScore = 3058, wingScore = 3076 },
    MASTER      = { minScore = 2930, wingScore = 2994 },
    DIAMOND     = { minScore = 2833, wingScore = 2882 },
    EMERALD     = { minScore = 2705, wingScore = 2769 },
    PLATINUM    = { minScore = 2389, wingScore = 2540 },
    GOLD        = { minScore = 1819, wingScore = 2082 },
    SILVER      = { minScore = 696, wingScore = 1221 },
    BRONZE      = { minScore =  310, wingScore =  465 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3233,
    CHALLENGER  = { minScore = 3177, wingScore = 3208 },
    GRANDMASTER = { minScore = 3139, wingScore = 3158 },
    MASTER      = { minScore = 3003, wingScore = 3071 },
    DIAMOND     = { minScore = 2896, wingScore = 2949 },
    EMERALD     = { minScore = 2752, wingScore = 2824 },
    PLATINUM    = { minScore = 2472, wingScore = 2597 },
    GOLD        = { minScore = 1819, wingScore = 2201 },
    SILVER      = { minScore = 696, wingScore = 1221 },
    BRONZE      = { minScore =  310, wingScore =  465 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3183,
    CHALLENGER  = { minScore = 3125, wingScore = 3172 },
    GRANDMASTER = { minScore = 3048, wingScore = 3078 },
    MASTER      = { minScore = 2950, wingScore = 2995 },
    DIAMOND     = { minScore = 2732, wingScore = 2797 },
    EMERALD     = { minScore = 2652, wingScore = 2685 },
    PLATINUM    = { minScore = 2315, wingScore = 2519 },
    GOLD        = { minScore = 1583, wingScore = 2012 },
    SILVER      = { minScore = 620, wingScore = 1033 },
    BRONZE      = { minScore =  310, wingScore =  465 },
    IRON        = { minScore =    1, wingScore =  167 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3183,
    CHALLENGER  = { minScore = 3062, wingScore = 3172 },
    GRANDMASTER = { minScore = 3016, wingScore = 3039 },
    MASTER      = { minScore = 2853, wingScore = 2934 },
    DIAMOND     = { minScore = 2753, wingScore = 2803 },
    EMERALD     = { minScore = 2620, wingScore = 2687 },
    PLATINUM    = { minScore = 2233, wingScore = 2426 },
    GOLD        = { minScore = 1583, wingScore = 1877 },
    SILVER      = { minScore = 620, wingScore = 1033 },
    BRONZE      = { minScore =  310, wingScore =  465 },
    IRON        = { minScore =    1, wingScore =  167 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3183,
    CHALLENGER  = { minScore = 3142, wingScore = 3172 },
    GRANDMASTER = { minScore = 3105, wingScore = 3124 },
    MASTER      = { minScore = 2977, wingScore = 3041 },
    DIAMOND     = { minScore = 2867, wingScore = 2922 },
    EMERALD     = { minScore = 2721, wingScore = 2794 },
    PLATINUM    = { minScore = 2370, wingScore = 2537 },
    GOLD        = { minScore = 1583, wingScore = 2037 },
    SILVER      = { minScore = 620, wingScore = 1033 },
    BRONZE      = { minScore =  310, wingScore =  465 },
    IRON        = { minScore =    1, wingScore =  167 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3233,
    CHALLENGER  = { minScore = 3142, wingScore = 3193 },
    GRANDMASTER = { minScore = 3062, wingScore = 3092 },
    MASTER      = { minScore = 2969, wingScore = 3005 },
    DIAMOND     = { minScore = 2756, wingScore = 2828 },
    EMERALD     = { minScore = 2673, wingScore = 2705 },
    PLATINUM    = { minScore = 2412, wingScore = 2577 },
    GOLD        = { minScore = 1718, wingScore = 2111 },
    SILVER      = { minScore = 663, wingScore = 1140 },
    BRONZE      = { minScore =  310, wingScore =  465 },
    IRON        = { minScore =    1, wingScore =  168 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3233,
    CHALLENGER  = { minScore = 3081, wingScore = 3193 },
    GRANDMASTER = { minScore = 3040, wingScore = 3060 },
    MASTER      = { minScore = 2898, wingScore = 2969 },
    DIAMOND     = { minScore = 2799, wingScore = 2849 },
    EMERALD     = { minScore = 2669, wingScore = 2735 },
    PLATINUM    = { minScore = 2323, wingScore = 2492 },
    GOLD        = { minScore = 1720, wingScore = 1996 },
    SILVER      = { minScore = 664, wingScore = 1142 },
    BRONZE      = { minScore =  310, wingScore =  465 },
    IRON        = { minScore =    1, wingScore =  168 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3233,
    CHALLENGER  = { minScore = 3162, wingScore = 3192 },
    GRANDMASTER = { minScore = 3124, wingScore = 3143 },
    MASTER      = { minScore = 2992, wingScore = 3058 },
    DIAMOND     = { minScore = 2883, wingScore = 2937 },
    EMERALD     = { minScore = 2738, wingScore = 2811 },
    PLATINUM    = { minScore = 2427, wingScore = 2571 },
    GOLD        = { minScore = 1715, wingScore = 2129 },
    SILVER      = { minScore = 663, wingScore = 1139 },
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
