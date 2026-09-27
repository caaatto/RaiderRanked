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
    top100Score = 3954,
    CHALLENGER  = { minScore = 3834, wingScore = 3891 },
    GRANDMASTER = { minScore = 3764, wingScore = 3783 },
    MASTER      = { minScore = 3642, wingScore = 3677 },
    DIAMOND     = { minScore = 3437, wingScore = 3523 },
    EMERALD     = { minScore = 3300, wingScore = 3360 },
    PLATINUM    = { minScore = 3024, wingScore = 3129 },
    GOLD        = { minScore = 2677, wingScore = 2848 },
    SILVER      = { minScore = 1317, wingScore = 2233 },
    BRONZE      = { minScore =  331, wingScore =  711 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3954,
    CHALLENGER  = { minScore = 3769, wingScore = 3891 },
    GRANDMASTER = { minScore = 3724, wingScore = 3747 },
    MASTER      = { minScore = 3567, wingScore = 3645 },
    DIAMOND     = { minScore = 3443, wingScore = 3505 },
    EMERALD     = { minScore = 3279, wingScore = 3361 },
    PLATINUM    = { minScore = 3015, wingScore = 3124 },
    GOLD        = { minScore = 2677, wingScore = 2838 },
    SILVER      = { minScore = 1317, wingScore = 2233 },
    BRONZE      = { minScore =  331, wingScore =  711 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3954,
    CHALLENGER  = { minScore = 3888, wingScore = 3891 },
    GRANDMASTER = { minScore = 3841, wingScore = 3865 },
    MASTER      = { minScore = 3678, wingScore = 3760 },
    DIAMOND     = { minScore = 3545, wingScore = 3612 },
    EMERALD     = { minScore = 3369, wingScore = 3457 },
    PLATINUM    = { minScore = 3083, wingScore = 3201 },
    GOLD        = { minScore = 2677, wingScore = 2887 },
    SILVER      = { minScore = 1317, wingScore = 2233 },
    BRONZE      = { minScore =  331, wingScore =  711 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3909,
    CHALLENGER  = { minScore = 3793, wingScore = 3845 },
    GRANDMASTER = { minScore = 3697, wingScore = 3742 },
    MASTER      = { minScore = 3565, wingScore = 3624 },
    DIAMOND     = { minScore = 3354, wingScore = 3435 },
    EMERALD     = { minScore = 3204, wingScore = 3272 },
    PLATINUM    = { minScore = 2980, wingScore = 3058 },
    GOLD        = { minScore = 2611, wingScore = 2764 },
    SILVER      = { minScore = 1115, wingScore = 2038 },
    BRONZE      = { minScore =  323, wingScore =  654 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3909,
    CHALLENGER  = { minScore = 3678, wingScore = 3845 },
    GRANDMASTER = { minScore = 3635, wingScore = 3656 },
    MASTER      = { minScore = 3484, wingScore = 3559 },
    DIAMOND     = { minScore = 3357, wingScore = 3420 },
    EMERALD     = { minScore = 3187, wingScore = 3272 },
    PLATINUM    = { minScore = 2918, wingScore = 3029 },
    GOLD        = { minScore = 2611, wingScore = 2743 },
    SILVER      = { minScore = 1115, wingScore = 2038 },
    BRONZE      = { minScore =  323, wingScore =  654 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3909,
    CHALLENGER  = { minScore = 3837, wingScore = 3845 },
    GRANDMASTER = { minScore = 3790, wingScore = 3813 },
    MASTER      = { minScore = 3627, wingScore = 3709 },
    DIAMOND     = { minScore = 3481, wingScore = 3554 },
    EMERALD     = { minScore = 3286, wingScore = 3384 },
    PLATINUM    = { minScore = 2999, wingScore = 3113 },
    GOLD        = { minScore = 2611, wingScore = 2814 },
    SILVER      = { minScore = 1115, wingScore = 2038 },
    BRONZE      = { minScore =  323, wingScore =  654 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3954,
    CHALLENGER  = { minScore = 3817, wingScore = 3872 },
    GRANDMASTER = { minScore = 3736, wingScore = 3766 },
    MASTER      = { minScore = 3610, wingScore = 3655 },
    DIAMOND     = { minScore = 3402, wingScore = 3486 },
    EMERALD     = { minScore = 3260, wingScore = 3323 },
    PLATINUM    = { minScore = 3006, wingScore = 3099 },
    GOLD        = { minScore = 2649, wingScore = 2813 },
    SILVER      = { minScore = 1232, wingScore = 2151 },
    BRONZE      = { minScore =  328, wingScore =  687 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3954,
    CHALLENGER  = { minScore = 3732, wingScore = 3872 },
    GRANDMASTER = { minScore = 3688, wingScore = 3710 },
    MASTER      = { minScore = 3533, wingScore = 3610 },
    DIAMOND     = { minScore = 3408, wingScore = 3470 },
    EMERALD     = { minScore = 3241, wingScore = 3325 },
    PLATINUM    = { minScore = 2975, wingScore = 3085 },
    GOLD        = { minScore = 2650, wingScore = 2799 },
    SILVER      = { minScore = 1234, wingScore = 2153 },
    BRONZE      = { minScore =  328, wingScore =  688 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3954,
    CHALLENGER  = { minScore = 3866, wingScore = 3871 },
    GRANDMASTER = { minScore = 3819, wingScore = 3843 },
    MASTER      = { minScore = 3656, wingScore = 3738 },
    DIAMOND     = { minScore = 3518, wingScore = 3587 },
    EMERALD     = { minScore = 3334, wingScore = 3426 },
    PLATINUM    = { minScore = 3047, wingScore = 3163 },
    GOLD        = { minScore = 2649, wingScore = 2856 },
    SILVER      = { minScore = 1231, wingScore = 2150 },
    BRONZE      = { minScore =  328, wingScore =  687 },
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
