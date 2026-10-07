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
    top100Score = 4025,
    CHALLENGER  = { minScore = 3894, wingScore = 3934 },
    GRANDMASTER = { minScore = 3807, wingScore = 3847 },
    MASTER      = { minScore = 3688, wingScore = 3748 },
    DIAMOND     = { minScore = 3494, wingScore = 3568 },
    EMERALD     = { minScore = 3344, wingScore = 3417 },
    PLATINUM    = { minScore = 3056, wingScore = 3183 },
    GOLD        = { minScore = 2712, wingScore = 2907 },
    SILVER      = { minScore = 1359, wingScore = 2302 },
    BRONZE      = { minScore =  332, wingScore =  741 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4025,
    CHALLENGER  = { minScore = 3805, wingScore = 3934 },
    GRANDMASTER = { minScore = 3766, wingScore = 3786 },
    MASTER      = { minScore = 3631, wingScore = 3699 },
    DIAMOND     = { minScore = 3502, wingScore = 3567 },
    EMERALD     = { minScore = 3330, wingScore = 3416 },
    PLATINUM    = { minScore = 3072, wingScore = 3175 },
    GOLD        = { minScore = 2712, wingScore = 2888 },
    SILVER      = { minScore = 1359, wingScore = 2302 },
    BRONZE      = { minScore =  332, wingScore =  741 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4025,
    CHALLENGER  = { minScore = 3928, wingScore = 3934 },
    GRANDMASTER = { minScore = 3889, wingScore = 3908 },
    MASTER      = { minScore = 3752, wingScore = 3820 },
    DIAMOND     = { minScore = 3611, wingScore = 3681 },
    EMERALD     = { minScore = 3423, wingScore = 3517 },
    PLATINUM    = { minScore = 3121, wingScore = 3246 },
    GOLD        = { minScore = 2712, wingScore = 2922 },
    SILVER      = { minScore = 1359, wingScore = 2302 },
    BRONZE      = { minScore =  332, wingScore =  741 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3963,
    CHALLENGER  = { minScore = 3861, wingScore = 3899 },
    GRANDMASTER = { minScore = 3767, wingScore = 3790 },
    MASTER      = { minScore = 3629, wingScore = 3674 },
    DIAMOND     = { minScore = 3414, wingScore = 3492 },
    EMERALD     = { minScore = 3255, wingScore = 3324 },
    PLATINUM    = { minScore = 3013, wingScore = 3096 },
    GOLD        = { minScore = 2643, wingScore = 2815 },
    SILVER      = { minScore = 1165, wingScore = 2097 },
    BRONZE      = { minScore =  324, wingScore =  661 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3963,
    CHALLENGER  = { minScore = 3744, wingScore = 3899 },
    GRANDMASTER = { minScore = 3699, wingScore = 3721 },
    MASTER      = { minScore = 3541, wingScore = 3620 },
    DIAMOND     = { minScore = 3410, wingScore = 3476 },
    EMERALD     = { minScore = 3235, wingScore = 3323 },
    PLATINUM    = { minScore = 2972, wingScore = 3077 },
    GOLD        = { minScore = 2643, wingScore = 2796 },
    SILVER      = { minScore = 1165, wingScore = 2097 },
    BRONZE      = { minScore =  324, wingScore =  661 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3963,
    CHALLENGER  = { minScore = 3896, wingScore = 3899 },
    GRANDMASTER = { minScore = 3848, wingScore = 3872 },
    MASTER      = { minScore = 3680, wingScore = 3764 },
    DIAMOND     = { minScore = 3532, wingScore = 3606 },
    EMERALD     = { minScore = 3336, wingScore = 3434 },
    PLATINUM    = { minScore = 3058, wingScore = 3166 },
    GOLD        = { minScore = 2643, wingScore = 2866 },
    SILVER      = { minScore = 1165, wingScore = 2097 },
    BRONZE      = { minScore =  324, wingScore =  661 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4025,
    CHALLENGER  = { minScore = 3880, wingScore = 3919 },
    GRANDMASTER = { minScore = 3790, wingScore = 3823 },
    MASTER      = { minScore = 3663, wingScore = 3717 },
    DIAMOND     = { minScore = 3461, wingScore = 3536 },
    EMERALD     = { minScore = 3307, wingScore = 3378 },
    PLATINUM    = { minScore = 3038, wingScore = 3147 },
    GOLD        = { minScore = 2683, wingScore = 2869 },
    SILVER      = { minScore = 1278, wingScore = 2216 },
    BRONZE      = { minScore =  329, wingScore =  708 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4025,
    CHALLENGER  = { minScore = 3780, wingScore = 3920 },
    GRANDMASTER = { minScore = 3739, wingScore = 3759 },
    MASTER      = { minScore = 3594, wingScore = 3667 },
    DIAMOND     = { minScore = 3464, wingScore = 3530 },
    EMERALD     = { minScore = 3291, wingScore = 3378 },
    PLATINUM    = { minScore = 3031, wingScore = 3135 },
    GOLD        = { minScore = 2684, wingScore = 2850 },
    SILVER      = { minScore = 1280, wingScore = 2218 },
    BRONZE      = { minScore =  329, wingScore =  708 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4025,
    CHALLENGER  = { minScore = 3914, wingScore = 3919 },
    GRANDMASTER = { minScore = 3872, wingScore = 3893 },
    MASTER      = { minScore = 3721, wingScore = 3796 },
    DIAMOND     = { minScore = 3577, wingScore = 3649 },
    EMERALD     = { minScore = 3386, wingScore = 3482 },
    PLATINUM    = { minScore = 3094, wingScore = 3212 },
    GOLD        = { minScore = 2683, wingScore = 2898 },
    SILVER      = { minScore = 1276, wingScore = 2215 },
    BRONZE      = { minScore =  329, wingScore =  707 },
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
