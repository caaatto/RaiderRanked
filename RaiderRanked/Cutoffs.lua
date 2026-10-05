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
    top100Score = 4013,
    CHALLENGER  = { minScore = 3892, wingScore = 3925 },
    GRANDMASTER = { minScore = 3800, wingScore = 3835 },
    MASTER      = { minScore = 3681, wingScore = 3737 },
    DIAMOND     = { minScore = 3486, wingScore = 3561 },
    EMERALD     = { minScore = 3338, wingScore = 3411 },
    PLATINUM    = { minScore = 3052, wingScore = 3177 },
    GOLD        = { minScore = 2707, wingScore = 2899 },
    SILVER      = { minScore = 1352, wingScore = 2295 },
    BRONZE      = { minScore =  332, wingScore =  738 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4013,
    CHALLENGER  = { minScore = 3792, wingScore = 3925 },
    GRANDMASTER = { minScore = 3754, wingScore = 3773 },
    MASTER      = { minScore = 3618, wingScore = 3686 },
    DIAMOND     = { minScore = 3490, wingScore = 3554 },
    EMERALD     = { minScore = 3319, wingScore = 3404 },
    PLATINUM    = { minScore = 3061, wingScore = 3164 },
    GOLD        = { minScore = 2707, wingScore = 2879 },
    SILVER      = { minScore = 1352, wingScore = 2295 },
    BRONZE      = { minScore =  332, wingScore =  738 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4013,
    CHALLENGER  = { minScore = 3915, wingScore = 3925 },
    GRANDMASTER = { minScore = 3874, wingScore = 3894 },
    MASTER      = { minScore = 3734, wingScore = 3804 },
    DIAMOND     = { minScore = 3596, wingScore = 3665 },
    EMERALD     = { minScore = 3412, wingScore = 3504 },
    PLATINUM    = { minScore = 3114, wingScore = 3238 },
    GOLD        = { minScore = 2707, wingScore = 2916 },
    SILVER      = { minScore = 1352, wingScore = 2295 },
    BRONZE      = { minScore =  332, wingScore =  738 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3954,
    CHALLENGER  = { minScore = 3849, wingScore = 3896 },
    GRANDMASTER = { minScore = 3759, wingScore = 3785 },
    MASTER      = { minScore = 3621, wingScore = 3669 },
    DIAMOND     = { minScore = 3407, wingScore = 3484 },
    EMERALD     = { minScore = 3248, wingScore = 3319 },
    PLATINUM    = { minScore = 3010, wingScore = 3091 },
    GOLD        = { minScore = 2639, wingScore = 2807 },
    SILVER      = { minScore = 1160, wingScore = 2089 },
    BRONZE      = { minScore =  324, wingScore =  660 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3954,
    CHALLENGER  = { minScore = 3731, wingScore = 3896 },
    GRANDMASTER = { minScore = 3687, wingScore = 3709 },
    MASTER      = { minScore = 3535, wingScore = 3611 },
    DIAMOND     = { minScore = 3403, wingScore = 3469 },
    EMERALD     = { minScore = 3227, wingScore = 3315 },
    PLATINUM    = { minScore = 2961, wingScore = 3068 },
    GOLD        = { minScore = 2639, wingScore = 2785 },
    SILVER      = { minScore = 1160, wingScore = 2089 },
    BRONZE      = { minScore =  324, wingScore =  660 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3954,
    CHALLENGER  = { minScore = 3892, wingScore = 3896 },
    GRANDMASTER = { minScore = 3843, wingScore = 3868 },
    MASTER      = { minScore = 3670, wingScore = 3756 },
    DIAMOND     = { minScore = 3523, wingScore = 3596 },
    EMERALD     = { minScore = 3327, wingScore = 3425 },
    PLATINUM    = { minScore = 3047, wingScore = 3156 },
    GOLD        = { minScore = 2639, wingScore = 2857 },
    SILVER      = { minScore = 1160, wingScore = 2089 },
    BRONZE      = { minScore =  324, wingScore =  660 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4013,
    CHALLENGER  = { minScore = 3874, wingScore = 3913 },
    GRANDMASTER = { minScore = 3783, wingScore = 3814 },
    MASTER      = { minScore = 3656, wingScore = 3709 },
    DIAMOND     = { minScore = 3453, wingScore = 3529 },
    EMERALD     = { minScore = 3300, wingScore = 3373 },
    PLATINUM    = { minScore = 3034, wingScore = 3141 },
    GOLD        = { minScore = 2679, wingScore = 2861 },
    SILVER      = { minScore = 1272, wingScore = 2209 },
    BRONZE      = { minScore =  329, wingScore =  705 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4013,
    CHALLENGER  = { minScore = 3767, wingScore = 3913 },
    GRANDMASTER = { minScore = 3727, wingScore = 3747 },
    MASTER      = { minScore = 3584, wingScore = 3655 },
    DIAMOND     = { minScore = 3454, wingScore = 3519 },
    EMERALD     = { minScore = 3281, wingScore = 3368 },
    PLATINUM    = { minScore = 3020, wingScore = 3125 },
    GOLD        = { minScore = 2679, wingScore = 2841 },
    SILVER      = { minScore = 1273, wingScore = 2211 },
    BRONZE      = { minScore =  329, wingScore =  706 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4013,
    CHALLENGER  = { minScore = 3905, wingScore = 3913 },
    GRANDMASTER = { minScore = 3861, wingScore = 3883 },
    MASTER      = { minScore = 3707, wingScore = 3784 },
    DIAMOND     = { minScore = 3565, wingScore = 3636 },
    EMERALD     = { minScore = 3376, wingScore = 3470 },
    PLATINUM    = { minScore = 3085, wingScore = 3203 },
    GOLD        = { minScore = 2678, wingScore = 2891 },
    SILVER      = { minScore = 1270, wingScore = 2207 },
    BRONZE      = { minScore =  329, wingScore =  705 },
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
