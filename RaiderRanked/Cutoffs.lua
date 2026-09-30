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
    top100Score = 3976,
    CHALLENGER  = { minScore = 3860, wingScore = 3899 },
    GRANDMASTER = { minScore = 3775, wingScore = 3799 },
    MASTER      = { minScore = 3657, wingScore = 3698 },
    DIAMOND     = { minScore = 3452, wingScore = 3538 },
    EMERALD     = { minScore = 3313, wingScore = 3378 },
    PLATINUM    = { minScore = 3033, wingScore = 3144 },
    GOLD        = { minScore = 2687, wingScore = 2865 },
    SILVER      = { minScore = 1329, wingScore = 2260 },
    BRONZE      = { minScore =  331, wingScore =  721 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3976,
    CHALLENGER  = { minScore = 3775, wingScore = 3899 },
    GRANDMASTER = { minScore = 3733, wingScore = 3754 },
    MASTER      = { minScore = 3585, wingScore = 3659 },
    DIAMOND     = { minScore = 3460, wingScore = 3523 },
    EMERALD     = { minScore = 3293, wingScore = 3377 },
    PLATINUM    = { minScore = 3033, wingScore = 3139 },
    GOLD        = { minScore = 2687, wingScore = 2854 },
    SILVER      = { minScore = 1329, wingScore = 2260 },
    BRONZE      = { minScore =  331, wingScore =  721 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3976,
    CHALLENGER  = { minScore = 3895, wingScore = 3899 },
    GRANDMASTER = { minScore = 3852, wingScore = 3873 },
    MASTER      = { minScore = 3700, wingScore = 3776 },
    DIAMOND     = { minScore = 3566, wingScore = 3633 },
    EMERALD     = { minScore = 3388, wingScore = 3477 },
    PLATINUM    = { minScore = 3099, wingScore = 3219 },
    GOLD        = { minScore = 2687, wingScore = 2901 },
    SILVER      = { minScore = 1329, wingScore = 2260 },
    BRONZE      = { minScore =  331, wingScore =  721 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3925,
    CHALLENGER  = { minScore = 3811, wingScore = 3875 },
    GRANDMASTER = { minScore = 3716, wingScore = 3765 },
    MASTER      = { minScore = 3583, wingScore = 3645 },
    DIAMOND     = { minScore = 3372, wingScore = 3450 },
    EMERALD     = { minScore = 3219, wingScore = 3291 },
    PLATINUM    = { minScore = 2997, wingScore = 3070 },
    GOLD        = { minScore = 2624, wingScore = 2780 },
    SILVER      = { minScore = 1137, wingScore = 2062 },
    BRONZE      = { minScore =  324, wingScore =  657 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3925,
    CHALLENGER  = { minScore = 3698, wingScore = 3875 },
    GRANDMASTER = { minScore = 3655, wingScore = 3677 },
    MASTER      = { minScore = 3505, wingScore = 3580 },
    DIAMOND     = { minScore = 3375, wingScore = 3440 },
    EMERALD     = { minScore = 3202, wingScore = 3289 },
    PLATINUM    = { minScore = 2935, wingScore = 3044 },
    GOLD        = { minScore = 2624, wingScore = 2762 },
    SILVER      = { minScore = 1137, wingScore = 2062 },
    BRONZE      = { minScore =  324, wingScore =  657 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3925,
    CHALLENGER  = { minScore = 3862, wingScore = 3875 },
    GRANDMASTER = { minScore = 3815, wingScore = 3839 },
    MASTER      = { minScore = 3650, wingScore = 3733 },
    DIAMOND     = { minScore = 3501, wingScore = 3576 },
    EMERALD     = { minScore = 3303, wingScore = 3402 },
    PLATINUM    = { minScore = 3018, wingScore = 3129 },
    GOLD        = { minScore = 2624, wingScore = 2831 },
    SILVER      = { minScore = 1137, wingScore = 2062 },
    BRONZE      = { minScore =  324, wingScore =  657 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3976,
    CHALLENGER  = { minScore = 3840, wingScore = 3889 },
    GRANDMASTER = { minScore = 3750, wingScore = 3785 },
    MASTER      = { minScore = 3626, wingScore = 3676 },
    DIAMOND     = { minScore = 3419, wingScore = 3501 },
    EMERALD     = { minScore = 3274, wingScore = 3342 },
    PLATINUM    = { minScore = 3018, wingScore = 3113 },
    GOLD        = { minScore = 2661, wingScore = 2829 },
    SILVER      = { minScore = 1249, wingScore = 2177 },
    BRONZE      = { minScore =  328, wingScore =  694 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3976,
    CHALLENGER  = { minScore = 3743, wingScore = 3889 },
    GRANDMASTER = { minScore = 3701, wingScore = 3722 },
    MASTER      = { minScore = 3552, wingScore = 3627 },
    DIAMOND     = { minScore = 3425, wingScore = 3489 },
    EMERALD     = { minScore = 3256, wingScore = 3341 },
    PLATINUM    = { minScore = 2993, wingScore = 3100 },
    GOLD        = { minScore = 2661, wingScore = 2816 },
    SILVER      = { minScore = 1250, wingScore = 2179 },
    BRONZE      = { minScore =  328, wingScore =  695 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3976,
    CHALLENGER  = { minScore = 3881, wingScore = 3889 },
    GRANDMASTER = { minScore = 3836, wingScore = 3858 },
    MASTER      = { minScore = 3679, wingScore = 3758 },
    DIAMOND     = { minScore = 3538, wingScore = 3609 },
    EMERALD     = { minScore = 3352, wingScore = 3445 },
    PLATINUM    = { minScore = 3064, wingScore = 3181 },
    GOLD        = { minScore = 2660, wingScore = 2871 },
    SILVER      = { minScore = 1247, wingScore = 2175 },
    BRONZE      = { minScore =  328, wingScore =  694 },
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
