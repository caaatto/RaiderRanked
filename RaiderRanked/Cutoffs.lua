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
    top100Score = 4054,
    CHALLENGER  = { minScore = 3914, wingScore = 3969 },
    GRANDMASTER = { minScore = 3841, wingScore = 3887 },
    MASTER      = { minScore = 3717, wingScore = 3773 },
    DIAMOND     = { minScore = 3524, wingScore = 3595 },
    EMERALD     = { minScore = 3368, wingScore = 3434 },
    PLATINUM    = { minScore = 3072, wingScore = 3203 },
    GOLD        = { minScore = 2726, wingScore = 2933 },
    SILVER      = { minScore = 1369, wingScore = 2314 },
    BRONZE      = { minScore =  332, wingScore =  746 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4054,
    CHALLENGER  = { minScore = 3835, wingScore = 3969 },
    GRANDMASTER = { minScore = 3795, wingScore = 3815 },
    MASTER      = { minScore = 3655, wingScore = 3725 },
    DIAMOND     = { minScore = 3525, wingScore = 3590 },
    EMERALD     = { minScore = 3352, wingScore = 3439 },
    PLATINUM    = { minScore = 3090, wingScore = 3195 },
    GOLD        = { minScore = 2726, wingScore = 2903 },
    SILVER      = { minScore = 1369, wingScore = 2314 },
    BRONZE      = { minScore =  332, wingScore =  746 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4054,
    CHALLENGER  = { minScore = 3961, wingScore = 3969 },
    GRANDMASTER = { minScore = 3920, wingScore = 3941 },
    MASTER      = { minScore = 3775, wingScore = 3847 },
    DIAMOND     = { minScore = 3634, wingScore = 3704 },
    EMERALD     = { minScore = 3445, wingScore = 3540 },
    PLATINUM    = { minScore = 3135, wingScore = 3265 },
    GOLD        = { minScore = 2726, wingScore = 2935 },
    SILVER      = { minScore = 1369, wingScore = 2314 },
    BRONZE      = { minScore =  332, wingScore =  746 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3998,
    CHALLENGER  = { minScore = 3889, wingScore = 3920 },
    GRANDMASTER = { minScore = 3780, wingScore = 3818 },
    MASTER      = { minScore = 3655, wingScore = 3697 },
    DIAMOND     = { minScore = 3431, wingScore = 3521 },
    EMERALD     = { minScore = 3277, wingScore = 3345 },
    PLATINUM    = { minScore = 3022, wingScore = 3113 },
    GOLD        = { minScore = 2651, wingScore = 2834 },
    SILVER      = { minScore = 1175, wingScore = 2110 },
    BRONZE      = { minScore =  325, wingScore =  662 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3998,
    CHALLENGER  = { minScore = 3771, wingScore = 3920 },
    GRANDMASTER = { minScore = 3724, wingScore = 3748 },
    MASTER      = { minScore = 3562, wingScore = 3643 },
    DIAMOND     = { minScore = 3431, wingScore = 3497 },
    EMERALD     = { minScore = 3256, wingScore = 3344 },
    PLATINUM    = { minScore = 2994, wingScore = 3099 },
    GOLD        = { minScore = 2651, wingScore = 2814 },
    SILVER      = { minScore = 1175, wingScore = 2110 },
    BRONZE      = { minScore =  325, wingScore =  662 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3998,
    CHALLENGER  = { minScore = 3912, wingScore = 3920 },
    GRANDMASTER = { minScore = 3866, wingScore = 3889 },
    MASTER      = { minScore = 3703, wingScore = 3784 },
    DIAMOND     = { minScore = 3555, wingScore = 3629 },
    EMERALD     = { minScore = 3358, wingScore = 3457 },
    PLATINUM    = { minScore = 3079, wingScore = 3187 },
    GOLD        = { minScore = 2651, wingScore = 2883 },
    SILVER      = { minScore = 1175, wingScore = 2110 },
    BRONZE      = { minScore =  325, wingScore =  662 },
    IRON        = { minScore =    1, wingScore =  169 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4054,
    CHALLENGER  = { minScore = 3904, wingScore = 3949 },
    GRANDMASTER = { minScore = 3816, wingScore = 3858 },
    MASTER      = { minScore = 3691, wingScore = 3741 },
    DIAMOND     = { minScore = 3485, wingScore = 3564 },
    EMERALD     = { minScore = 3330, wingScore = 3397 },
    PLATINUM    = { minScore = 3051, wingScore = 3165 },
    GOLD        = { minScore = 2695, wingScore = 2892 },
    SILVER      = { minScore = 1288, wingScore = 2229 },
    BRONZE      = { minScore =  329, wingScore =  711 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4054,
    CHALLENGER  = { minScore = 3809, wingScore = 3949 },
    GRANDMASTER = { minScore = 3766, wingScore = 3788 },
    MASTER      = { minScore = 3617, wingScore = 3692 },
    DIAMOND     = { minScore = 3487, wingScore = 3552 },
    EMERALD     = { minScore = 3313, wingScore = 3400 },
    PLATINUM    = { minScore = 3051, wingScore = 3156 },
    GOLD        = { minScore = 2695, wingScore = 2867 },
    SILVER      = { minScore = 1290, wingScore = 2231 },
    BRONZE      = { minScore =  329, wingScore =  712 },
    IRON        = { minScore =    1, wingScore =  170 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4054,
    CHALLENGER  = { minScore = 3940, wingScore = 3948 },
    GRANDMASTER = { minScore = 3897, wingScore = 3919 },
    MASTER      = { minScore = 3744, wingScore = 3820 },
    DIAMOND     = { minScore = 3600, wingScore = 3672 },
    EMERALD     = { minScore = 3408, wingScore = 3505 },
    PLATINUM    = { minScore = 3111, wingScore = 3232 },
    GOLD        = { minScore = 2694, wingScore = 2913 },
    SILVER      = { minScore = 1286, wingScore = 2227 },
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
