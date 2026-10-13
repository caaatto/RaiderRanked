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
    top100Score = 4057,
    CHALLENGER  = { minScore = 3918, wingScore = 3971 },
    GRANDMASTER = { minScore = 3846, wingScore = 3889 },
    MASTER      = { minScore = 3721, wingScore = 3774 },
    DIAMOND     = { minScore = 3528, wingScore = 3599 },
    EMERALD     = { minScore = 3371, wingScore = 3437 },
    PLATINUM    = { minScore = 3074, wingScore = 3205 },
    GOLD        = { minScore = 2727, wingScore = 2936 },
    SILVER      = { minScore = 1369, wingScore = 2315 },
    BRONZE      = { minScore =  332, wingScore =  747 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4057,
    CHALLENGER  = { minScore = 3839, wingScore = 3971 },
    GRANDMASTER = { minScore = 3798, wingScore = 3819 },
    MASTER      = { minScore = 3656, wingScore = 3727 },
    DIAMOND     = { minScore = 3527, wingScore = 3591 },
    EMERALD     = { minScore = 3354, wingScore = 3440 },
    PLATINUM    = { minScore = 3092, wingScore = 3197 },
    GOLD        = { minScore = 2727, wingScore = 2904 },
    SILVER      = { minScore = 1369, wingScore = 2315 },
    BRONZE      = { minScore =  332, wingScore =  747 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4057,
    CHALLENGER  = { minScore = 3964, wingScore = 3971 },
    GRANDMASTER = { minScore = 3923, wingScore = 3944 },
    MASTER      = { minScore = 3776, wingScore = 3849 },
    DIAMOND     = { minScore = 3635, wingScore = 3706 },
    EMERALD     = { minScore = 3448, wingScore = 3542 },
    PLATINUM    = { minScore = 3137, wingScore = 3267 },
    GOLD        = { minScore = 2727, wingScore = 2937 },
    SILVER      = { minScore = 1369, wingScore = 2315 },
    BRONZE      = { minScore =  332, wingScore =  747 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4000,
    CHALLENGER  = { minScore = 3891, wingScore = 3924 },
    GRANDMASTER = { minScore = 3784, wingScore = 3821 },
    MASTER      = { minScore = 3657, wingScore = 3701 },
    DIAMOND     = { minScore = 3434, wingScore = 3526 },
    EMERALD     = { minScore = 3281, wingScore = 3348 },
    PLATINUM    = { minScore = 3023, wingScore = 3115 },
    GOLD        = { minScore = 2652, wingScore = 2838 },
    SILVER      = { minScore = 1174, wingScore = 2111 },
    BRONZE      = { minScore =  324, wingScore =  661 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4000,
    CHALLENGER  = { minScore = 3772, wingScore = 3924 },
    GRANDMASTER = { minScore = 3726, wingScore = 3749 },
    MASTER      = { minScore = 3565, wingScore = 3646 },
    DIAMOND     = { minScore = 3434, wingScore = 3499 },
    EMERALD     = { minScore = 3259, wingScore = 3346 },
    PLATINUM    = { minScore = 2997, wingScore = 3101 },
    GOLD        = { minScore = 2652, wingScore = 2816 },
    SILVER      = { minScore = 1174, wingScore = 2111 },
    BRONZE      = { minScore =  324, wingScore =  661 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4000,
    CHALLENGER  = { minScore = 3914, wingScore = 3924 },
    GRANDMASTER = { minScore = 3868, wingScore = 3891 },
    MASTER      = { minScore = 3707, wingScore = 3787 },
    DIAMOND     = { minScore = 3559, wingScore = 3633 },
    EMERALD     = { minScore = 3361, wingScore = 3460 },
    PLATINUM    = { minScore = 3081, wingScore = 3190 },
    GOLD        = { minScore = 2652, wingScore = 2885 },
    SILVER      = { minScore = 1174, wingScore = 2111 },
    BRONZE      = { minScore =  324, wingScore =  661 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4057,
    CHALLENGER  = { minScore = 3907, wingScore = 3951 },
    GRANDMASTER = { minScore = 3820, wingScore = 3861 },
    MASTER      = { minScore = 3694, wingScore = 3744 },
    DIAMOND     = { minScore = 3489, wingScore = 3569 },
    EMERALD     = { minScore = 3333, wingScore = 3400 },
    PLATINUM    = { minScore = 3053, wingScore = 3167 },
    GOLD        = { minScore = 2696, wingScore = 2895 },
    SILVER      = { minScore = 1288, wingScore = 2230 },
    BRONZE      = { minScore =  329, wingScore =  711 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4057,
    CHALLENGER  = { minScore = 3812, wingScore = 3952 },
    GRANDMASTER = { minScore = 3769, wingScore = 3790 },
    MASTER      = { minScore = 3619, wingScore = 3694 },
    DIAMOND     = { minScore = 3489, wingScore = 3553 },
    EMERALD     = { minScore = 3315, wingScore = 3402 },
    PLATINUM    = { minScore = 3053, wingScore = 3158 },
    GOLD        = { minScore = 2696, wingScore = 2868 },
    SILVER      = { minScore = 1289, wingScore = 2232 },
    BRONZE      = { minScore =  329, wingScore =  712 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4057,
    CHALLENGER  = { minScore = 3943, wingScore = 3951 },
    GRANDMASTER = { minScore = 3900, wingScore = 3921 },
    MASTER      = { minScore = 3747, wingScore = 3823 },
    DIAMOND     = { minScore = 3603, wingScore = 3675 },
    EMERALD     = { minScore = 3411, wingScore = 3507 },
    PLATINUM    = { minScore = 3113, wingScore = 3234 },
    GOLD        = { minScore = 2695, wingScore = 2915 },
    SILVER      = { minScore = 1286, wingScore = 2228 },
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
