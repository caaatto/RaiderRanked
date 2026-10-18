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
    top100Score = 4113,
    CHALLENGER  = { minScore = 3962, wingScore = 4015 },
    GRANDMASTER = { minScore = 3889, wingScore = 3903 },
    MASTER      = { minScore = 3760, wingScore = 3792 },
    DIAMOND     = { minScore = 3545, wingScore = 3627 },
    EMERALD     = { minScore = 3393, wingScore = 3456 },
    PLATINUM    = { minScore = 3086, wingScore = 3220 },
    GOLD        = { minScore = 2740, wingScore = 2955 },
    SILVER      = { minScore = 1385, wingScore = 2329 },
    BRONZE      = { minScore =  332, wingScore =  755 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4113,
    CHALLENGER  = { minScore = 3874, wingScore = 4015 },
    GRANDMASTER = { minScore = 3828, wingScore = 3851 },
    MASTER      = { minScore = 3668, wingScore = 3748 },
    DIAMOND     = { minScore = 3539, wingScore = 3604 },
    EMERALD     = { minScore = 3368, wingScore = 3454 },
    PLATINUM    = { minScore = 3099, wingScore = 3209 },
    GOLD        = { minScore = 2740, wingScore = 2910 },
    SILVER      = { minScore = 1385, wingScore = 2329 },
    BRONZE      = { minScore =  332, wingScore =  755 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4113,
    CHALLENGER  = { minScore = 4010, wingScore = 4015 },
    GRANDMASTER = { minScore = 3961, wingScore = 3986 },
    MASTER      = { minScore = 3790, wingScore = 3876 },
    DIAMOND     = { minScore = 3650, wingScore = 3720 },
    EMERALD     = { minScore = 3464, wingScore = 3557 },
    PLATINUM    = { minScore = 3147, wingScore = 3281 },
    GOLD        = { minScore = 2740, wingScore = 2945 },
    SILVER      = { minScore = 1385, wingScore = 2329 },
    BRONZE      = { minScore =  332, wingScore =  755 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4028,
    CHALLENGER  = { minScore = 3907, wingScore = 3961 },
    GRANDMASTER = { minScore = 3811, wingScore = 3862 },
    MASTER      = { minScore = 3674, wingScore = 3734 },
    DIAMOND     = { minScore = 3453, wingScore = 3545 },
    EMERALD     = { minScore = 3299, wingScore = 3368 },
    PLATINUM    = { minScore = 3030, wingScore = 3128 },
    GOLD        = { minScore = 2658, wingScore = 2852 },
    SILVER      = { minScore = 1183, wingScore = 2123 },
    BRONZE      = { minScore =  325, wingScore =  663 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4028,
    CHALLENGER  = { minScore = 3784, wingScore = 3961 },
    GRANDMASTER = { minScore = 3741, wingScore = 3763 },
    MASTER      = { minScore = 3590, wingScore = 3666 },
    DIAMOND     = { minScore = 3455, wingScore = 3523 },
    EMERALD     = { minScore = 3275, wingScore = 3365 },
    PLATINUM    = { minScore = 3011, wingScore = 3115 },
    GOLD        = { minScore = 2658, wingScore = 2828 },
    SILVER      = { minScore = 1183, wingScore = 2123 },
    BRONZE      = { minScore =  325, wingScore =  663 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4028,
    CHALLENGER  = { minScore = 3949, wingScore = 3961 },
    GRANDMASTER = { minScore = 3902, wingScore = 3926 },
    MASTER      = { minScore = 3739, wingScore = 3821 },
    DIAMOND     = { minScore = 3585, wingScore = 3662 },
    EMERALD     = { minScore = 3381, wingScore = 3483 },
    PLATINUM    = { minScore = 3094, wingScore = 3205 },
    GOLD        = { minScore = 2658, wingScore = 2895 },
    SILVER      = { minScore = 1183, wingScore = 2123 },
    BRONZE      = { minScore =  325, wingScore =  663 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4113,
    CHALLENGER  = { minScore = 3939, wingScore = 3993 },
    GRANDMASTER = { minScore = 3857, wingScore = 3886 },
    MASTER      = { minScore = 3724, wingScore = 3768 },
    DIAMOND     = { minScore = 3507, wingScore = 3593 },
    EMERALD     = { minScore = 3354, wingScore = 3419 },
    PLATINUM    = { minScore = 3063, wingScore = 3182 },
    GOLD        = { minScore = 2706, wingScore = 2912 },
    SILVER      = { minScore = 1301, wingScore = 2243 },
    BRONZE      = { minScore =  329, wingScore =  717 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4113,
    CHALLENGER  = { minScore = 3837, wingScore = 3993 },
    GRANDMASTER = { minScore = 3793, wingScore = 3815 },
    MASTER      = { minScore = 3636, wingScore = 3715 },
    DIAMOND     = { minScore = 3505, wingScore = 3571 },
    EMERALD     = { minScore = 3330, wingScore = 3418 },
    PLATINUM    = { minScore = 3063, wingScore = 3171 },
    GOLD        = { minScore = 2707, wingScore = 2877 },
    SILVER      = { minScore = 1303, wingScore = 2245 },
    BRONZE      = { minScore =  329, wingScore =  717 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4113,
    CHALLENGER  = { minScore = 3984, wingScore = 3992 },
    GRANDMASTER = { minScore = 3936, wingScore = 3960 },
    MASTER      = { minScore = 3768, wingScore = 3853 },
    DIAMOND     = { minScore = 3622, wingScore = 3695 },
    EMERALD     = { minScore = 3429, wingScore = 3526 },
    PLATINUM    = { minScore = 3124, wingScore = 3249 },
    GOLD        = { minScore = 2705, wingScore = 2924 },
    SILVER      = { minScore = 1299, wingScore = 2241 },
    BRONZE      = { minScore =  329, wingScore =  716 },
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
