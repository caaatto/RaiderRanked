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
    top100Score = 4045,
    CHALLENGER  = { minScore = 3909, wingScore = 3963 },
    GRANDMASTER = { minScore = 3834, wingScore = 3878 },
    MASTER      = { minScore = 3712, wingScore = 3771 },
    DIAMOND     = { minScore = 3518, wingScore = 3589 },
    EMERALD     = { minScore = 3363, wingScore = 3431 },
    PLATINUM    = { minScore = 3069, wingScore = 3200 },
    GOLD        = { minScore = 2723, wingScore = 2928 },
    SILVER      = { minScore = 1368, wingScore = 2313 },
    BRONZE      = { minScore =  332, wingScore =  746 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4045,
    CHALLENGER  = { minScore = 3829, wingScore = 3963 },
    GRANDMASTER = { minScore = 3790, wingScore = 3809 },
    MASTER      = { minScore = 3652, wingScore = 3721 },
    DIAMOND     = { minScore = 3521, wingScore = 3586 },
    EMERALD     = { minScore = 3347, wingScore = 3434 },
    PLATINUM    = { minScore = 3087, wingScore = 3191 },
    GOLD        = { minScore = 2723, wingScore = 2901 },
    SILVER      = { minScore = 1368, wingScore = 2313 },
    BRONZE      = { minScore =  332, wingScore =  746 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4045,
    CHALLENGER  = { minScore = 3952, wingScore = 3963 },
    GRANDMASTER = { minScore = 3912, wingScore = 3932 },
    MASTER      = { minScore = 3773, wingScore = 3843 },
    DIAMOND     = { minScore = 3630, wingScore = 3701 },
    EMERALD     = { minScore = 3441, wingScore = 3535 },
    PLATINUM    = { minScore = 3132, wingScore = 3260 },
    GOLD        = { minScore = 2723, wingScore = 2932 },
    SILVER      = { minScore = 1368, wingScore = 2313 },
    BRONZE      = { minScore =  332, wingScore =  746 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3994,
    CHALLENGER  = { minScore = 3887, wingScore = 3913 },
    GRANDMASTER = { minScore = 3777, wingScore = 3812 },
    MASTER      = { minScore = 3652, wingScore = 3692 },
    DIAMOND     = { minScore = 3427, wingScore = 3515 },
    EMERALD     = { minScore = 3273, wingScore = 3340 },
    PLATINUM    = { minScore = 3020, wingScore = 3110 },
    GOLD        = { minScore = 2649, wingScore = 2830 },
    SILVER      = { minScore = 1172, wingScore = 2108 },
    BRONZE      = { minScore =  325, wingScore =  661 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3994,
    CHALLENGER  = { minScore = 3767, wingScore = 3913 },
    GRANDMASTER = { minScore = 3720, wingScore = 3743 },
    MASTER      = { minScore = 3556, wingScore = 3638 },
    DIAMOND     = { minScore = 3425, wingScore = 3490 },
    EMERALD     = { minScore = 3251, wingScore = 3338 },
    PLATINUM    = { minScore = 2988, wingScore = 3094 },
    GOLD        = { minScore = 2649, wingScore = 2809 },
    SILVER      = { minScore = 1172, wingScore = 2108 },
    BRONZE      = { minScore =  325, wingScore =  661 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3994,
    CHALLENGER  = { minScore = 3908, wingScore = 3913 },
    GRANDMASTER = { minScore = 3861, wingScore = 3884 },
    MASTER      = { minScore = 3697, wingScore = 3779 },
    DIAMOND     = { minScore = 3549, wingScore = 3623 },
    EMERALD     = { minScore = 3353, wingScore = 3451 },
    PLATINUM    = { minScore = 3073, wingScore = 3182 },
    GOLD        = { minScore = 2649, wingScore = 2879 },
    SILVER      = { minScore = 1172, wingScore = 2108 },
    BRONZE      = { minScore =  325, wingScore =  661 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4045,
    CHALLENGER  = { minScore = 3900, wingScore = 3942 },
    GRANDMASTER = { minScore = 3810, wingScore = 3850 },
    MASTER      = { minScore = 3687, wingScore = 3738 },
    DIAMOND     = { minScore = 3480, wingScore = 3558 },
    EMERALD     = { minScore = 3325, wingScore = 3393 },
    PLATINUM    = { minScore = 3049, wingScore = 3162 },
    GOLD        = { minScore = 2692, wingScore = 2887 },
    SILVER      = { minScore = 1286, wingScore = 2227 },
    BRONZE      = { minScore =  329, wingScore =  711 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4045,
    CHALLENGER  = { minScore = 3804, wingScore = 3943 },
    GRANDMASTER = { minScore = 3761, wingScore = 3782 },
    MASTER      = { minScore = 3613, wingScore = 3687 },
    DIAMOND     = { minScore = 3482, wingScore = 3547 },
    EMERALD     = { minScore = 3308, wingScore = 3395 },
    PLATINUM    = { minScore = 3047, wingScore = 3151 },
    GOLD        = { minScore = 2693, wingScore = 2863 },
    SILVER      = { minScore = 1288, wingScore = 2229 },
    BRONZE      = { minScore =  329, wingScore =  711 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4045,
    CHALLENGER  = { minScore = 3933, wingScore = 3942 },
    GRANDMASTER = { minScore = 3890, wingScore = 3912 },
    MASTER      = { minScore = 3741, wingScore = 3816 },
    DIAMOND     = { minScore = 3596, wingScore = 3668 },
    EMERALD     = { minScore = 3404, wingScore = 3499 },
    PLATINUM    = { minScore = 3107, wingScore = 3227 },
    GOLD        = { minScore = 2691, wingScore = 2909 },
    SILVER      = { minScore = 1285, wingScore = 2226 },
    BRONZE      = { minScore =  329, wingScore =  710 },
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
