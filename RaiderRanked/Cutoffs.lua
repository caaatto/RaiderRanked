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
    top100Score = 4350,
    CHALLENGER  = { minScore = 4236, wingScore = 4255 },
    GRANDMASTER = { minScore = 4066, wingScore = 4119 },
    MASTER      = { minScore = 4008, wingScore = 4021 },
    DIAMOND     = { minScore = 3656, wingScore = 3774 },
    EMERALD     = { minScore = 3466, wingScore = 3547 },
    PLATINUM    = { minScore = 3166, wingScore = 3338 },
    GOLD        = { minScore = 2822, wingScore = 3018 },
    SILVER      = { minScore = 1719, wingScore = 2519 },
    BRONZE      = { minScore =  413, wingScore =  1006 },
    IRON        = { minScore =    1, wingScore =  230 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4350,
    CHALLENGER  = { minScore = 4087, wingScore = 4255 },
    GRANDMASTER = { minScore = 4044, wingScore = 4066 },
    MASTER      = { minScore = 3894, wingScore = 3969 },
    DIAMOND     = { minScore = 3733, wingScore = 3814 },
    EMERALD     = { minScore = 3517, wingScore = 3625 },
    PLATINUM    = { minScore = 3171, wingScore = 3314 },
    GOLD        = { minScore = 2822, wingScore = 2967 },
    SILVER      = { minScore = 1719, wingScore = 2519 },
    BRONZE      = { minScore =  413, wingScore =  1006 },
    IRON        = { minScore =    1, wingScore =  230 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4350,
    CHALLENGER  = { minScore = 4254, wingScore = 4255 },
    GRANDMASTER = { minScore = 4202, wingScore = 4228 },
    MASTER      = { minScore = 4019, wingScore = 4110 },
    DIAMOND     = { minScore = 3830, wingScore = 3925 },
    EMERALD     = { minScore = 3578, wingScore = 3704 },
    PLATINUM    = { minScore = 3214, wingScore = 3357 },
    GOLD        = { minScore = 2822, wingScore = 3014 },
    SILVER      = { minScore = 1719, wingScore = 2519 },
    BRONZE      = { minScore =  413, wingScore =  1006 },
    IRON        = { minScore =    1, wingScore =  230 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4313,
    CHALLENGER  = { minScore = 4210, wingScore = 4228 },
    GRANDMASTER = { minScore = 4030, wingScore = 4076 },
    MASTER      = { minScore = 3960, wingScore = 3984 },
    DIAMOND     = { minScore = 3563, wingScore = 3692 },
    EMERALD     = { minScore = 3420, wingScore = 3461 },
    PLATINUM    = { minScore = 3086, wingScore = 3234 },
    GOLD        = { minScore = 2725, wingScore = 2963 },
    SILVER      = { minScore = 1422, wingScore = 2304 },
    BRONZE      = { minScore =  340, wingScore =  822 },
    IRON        = { minScore =    1, wingScore =  174 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4313,
    CHALLENGER  = { minScore = 4032, wingScore = 4228 },
    GRANDMASTER = { minScore = 3983, wingScore = 4007 },
    MASTER      = { minScore = 3810, wingScore = 3896 },
    DIAMOND     = { minScore = 3649, wingScore = 3730 },
    EMERALD     = { minScore = 3434, wingScore = 3541 },
    PLATINUM    = { minScore = 3118, wingScore = 3243 },
    GOLD        = { minScore = 2725, wingScore = 2909 },
    SILVER      = { minScore = 1422, wingScore = 2304 },
    BRONZE      = { minScore =  340, wingScore =  822 },
    IRON        = { minScore =    1, wingScore =  174 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4313,
    CHALLENGER  = { minScore = 4226, wingScore = 4228 },
    GRANDMASTER = { minScore = 4172, wingScore = 4199 },
    MASTER      = { minScore = 3984, wingScore = 4078 },
    DIAMOND     = { minScore = 3794, wingScore = 3889 },
    EMERALD     = { minScore = 3540, wingScore = 3667 },
    PLATINUM    = { minScore = 3165, wingScore = 3314 },
    GOLD        = { minScore = 2725, wingScore = 2946 },
    SILVER      = { minScore = 1422, wingScore = 2304 },
    BRONZE      = { minScore =  340, wingScore =  822 },
    IRON        = { minScore =    1, wingScore =  174 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4350,
    CHALLENGER  = { minScore = 4225, wingScore = 4244 },
    GRANDMASTER = { minScore = 4051, wingScore = 4101 },
    MASTER      = { minScore = 3988, wingScore = 4005 },
    DIAMOND     = { minScore = 3617, wingScore = 3740 },
    EMERALD     = { minScore = 3447, wingScore = 3511 },
    PLATINUM    = { minScore = 3132, wingScore = 3294 },
    GOLD        = { minScore = 2781, wingScore = 2995 },
    SILVER      = { minScore = 1594, wingScore = 2429 },
    BRONZE      = { minScore =  382, wingScore =  929 },
    IRON        = { minScore =    1, wingScore =  206 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4350,
    CHALLENGER  = { minScore = 4064, wingScore = 4244 },
    GRANDMASTER = { minScore = 4019, wingScore = 4042 },
    MASTER      = { minScore = 3860, wingScore = 3939 },
    DIAMOND     = { minScore = 3699, wingScore = 3780 },
    EMERALD     = { minScore = 3483, wingScore = 3591 },
    PLATINUM    = { minScore = 3149, wingScore = 3285 },
    GOLD        = { minScore = 2782, wingScore = 2943 },
    SILVER      = { minScore = 1597, wingScore = 2431 },
    BRONZE      = { minScore =  383, wingScore =  931 },
    IRON        = { minScore =    1, wingScore =  207 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4350,
    CHALLENGER  = { minScore = 4242, wingScore = 4243 },
    GRANDMASTER = { minScore = 4189, wingScore = 4215 },
    MASTER      = { minScore = 4004, wingScore = 4096 },
    DIAMOND     = { minScore = 3814, wingScore = 3909 },
    EMERALD     = { minScore = 3562, wingScore = 3688 },
    PLATINUM    = { minScore = 3193, wingScore = 3338 },
    GOLD        = { minScore = 2780, wingScore = 2985 },
    SILVER      = { minScore = 1591, wingScore = 2426 },
    BRONZE      = { minScore =  382, wingScore =  927 },
    IRON        = { minScore =    1, wingScore =  206 },
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
            GRANDMASTER  = { minScore =  4045, wingScore =  4066 },
            MASTER       = { minScore =  3895, wingScore =  3970 },
            DIAMOND      = { minScore =  3733, wingScore =  3814 },
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
            EMERALD      = { minScore =  3578, wingScore =  3704 },
            PLATINUM     = { minScore =  3214, wingScore =  3357 },
            GOLD         = { minScore =  2822, wingScore =  3013 },
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
            SILVER       = { minScore =  1421, wingScore =  2304 },
            BRONZE       = { minScore =   340, wingScore =   822 },
            IRON         = { minScore =     1, wingScore =   175 },
        },
        horde = {
            CHALLENGER   = { minScore =  4032, wingScore =  4228 },
            GRANDMASTER  = { minScore =  3983, wingScore =  4008 },
            MASTER       = { minScore =  3811, wingScore =  3897 },
            DIAMOND      = { minScore =  3649, wingScore =  3730 },
            EMERALD      = { minScore =  3434, wingScore =  3542 },
            PLATINUM     = { minScore =  3118, wingScore =  3243 },
            GOLD         = { minScore =  2725, wingScore =  2909 },
            SILVER       = { minScore =  1421, wingScore =  2304 },
            BRONZE       = { minScore =   340, wingScore =   822 },
            IRON         = { minScore =     1, wingScore =   175 },
        },
        alliance = {
            CHALLENGER   = { minScore =  4225, wingScore =  4228 },
            GRANDMASTER  = { minScore =  4172, wingScore =  4198 },
            MASTER       = { minScore =  3984, wingScore =  4078 },
            DIAMOND      = { minScore =  3794, wingScore =  3889 },
            EMERALD      = { minScore =  3540, wingScore =  3667 },
            PLATINUM     = { minScore =  3165, wingScore =  3314 },
            GOLD         = { minScore =  2725, wingScore =  2946 },
            SILVER       = { minScore =  1421, wingScore =  2304 },
            BRONZE       = { minScore =   340, wingScore =   822 },
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
            SILVER       = { minScore =  1593, wingScore =  2429 },
            BRONZE       = { minScore =   382, wingScore =   929 },
            IRON         = { minScore =     1, wingScore =   207 },
        },
        horde = {
            CHALLENGER   = { minScore =  4064, wingScore =  4244 },
            GRANDMASTER  = { minScore =  4020, wingScore =  4042 },
            MASTER       = { minScore =  3861, wingScore =  3940 },
            DIAMOND      = { minScore =  3699, wingScore =  3780 },
            EMERALD      = { minScore =  3483, wingScore =  3591 },
            PLATINUM     = { minScore =  3149, wingScore =  3285 },
            GOLD         = { minScore =  2782, wingScore =  2943 },
            SILVER       = { minScore =  1596, wingScore =  2431 },
            BRONZE       = { minScore =   383, wingScore =   931 },
            IRON         = { minScore =     1, wingScore =   207 },
        },
        alliance = {
            CHALLENGER   = { minScore =  4241, wingScore =  4243 },
            GRANDMASTER  = { minScore =  4189, wingScore =  4215 },
            MASTER       = { minScore =  4004, wingScore =  4096 },
            DIAMOND      = { minScore =  3814, wingScore =  3909 },
            EMERALD      = { minScore =  3562, wingScore =  3688 },
            PLATINUM     = { minScore =  3193, wingScore =  3338 },
            GOLD         = { minScore =  2780, wingScore =  2984 },
            SILVER       = { minScore =  1590, wingScore =  2426 },
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
