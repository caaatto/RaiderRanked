-- RaiderRanked: Cutoffs.lua
-- Per-region / per-faction M+ rating cutoffs.
--
-- Auto-patched by scripts/patch_addon.py from thresholds.json. Each
-- RR.CUTOFFS.<region>.<faction> block is a discrete patch target — do
-- not reformat the minScore/wingScore lines or the patcher will miss
-- them.
--
-- Regions: us | eu | all   (all = population-weighted merge of us+eu)
-- Factions: alliance | horde | all
--
-- Until the first multi-variant patch run lands, all 9 slots carry the
-- same snapshot (last single-region EU+all-factions compute). The
-- addon reads the active slot at login via RR:ApplyCutoffSelection().

local ADDON_NAME, RR = ...

RR.CUTOFFS = { us = {}, eu = {}, all = {} }

RR.CUTOFFS.eu.all = {
    top100Score = 4134,
    CHALLENGER  = { minScore = 3964, wingScore = 4015 },
    GRANDMASTER = { minScore = 3882, wingScore = 3906 },
    MASTER      = { minScore = 3757, wingScore = 3794 },
    DIAMOND     = { minScore = 3535, wingScore = 3613 },
    EMERALD     = { minScore = 3402, wingScore = 3444 },
    PLATINUM    = { minScore = 3094, wingScore = 3226 },
    GOLD        = { minScore = 2752, wingScore = 2960 },
    SILVER      = { minScore = 1690, wingScore = 2456 },
    BRONZE      = { minScore =  428, wingScore =  1003 },
    IRON        = { minScore =    1, wingScore =  233 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 4134,
    CHALLENGER  = { minScore = 3899, wingScore = 4015 },
    GRANDMASTER = { minScore = 3852, wingScore = 3875 },
    MASTER      = { minScore = 3687, wingScore = 3769 },
    DIAMOND     = { minScore = 3558, wingScore = 3622 },
    EMERALD     = { minScore = 3387, wingScore = 3473 },
    PLATINUM    = { minScore = 3111, wingScore = 3225 },
    GOLD        = { minScore = 2752, wingScore = 2922 },
    SILVER      = { minScore = 1690, wingScore = 2456 },
    BRONZE      = { minScore =  428, wingScore =  1003 },
    IRON        = { minScore =    1, wingScore =  233 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 4134,
    CHALLENGER  = { minScore = 4010, wingScore = 4015 },
    GRANDMASTER = { minScore = 3961, wingScore = 3985 },
    MASTER      = { minScore = 3791, wingScore = 3876 },
    DIAMOND     = { minScore = 3654, wingScore = 3722 },
    EMERALD     = { minScore = 3471, wingScore = 3562 },
    PLATINUM    = { minScore = 3155, wingScore = 3289 },
    GOLD        = { minScore = 2752, wingScore = 2954 },
    SILVER      = { minScore = 1690, wingScore = 2456 },
    BRONZE      = { minScore =  428, wingScore =  1003 },
    IRON        = { minScore =    1, wingScore =  233 },
}

RR.CUTOFFS.us.all = {
    top100Score = 4047,
    CHALLENGER  = { minScore = 3916, wingScore = 3971 },
    GRANDMASTER = { minScore = 3822, wingScore = 3872 },
    MASTER      = { minScore = 3680, wingScore = 3743 },
    DIAMOND     = { minScore = 3445, wingScore = 3538 },
    EMERALD     = { minScore = 3310, wingScore = 3390 },
    PLATINUM    = { minScore = 3035, wingScore = 3134 },
    GOLD        = { minScore = 2673, wingScore = 2851 },
    SILVER      = { minScore = 1399, wingScore = 2250 },
    BRONZE      = { minScore =  342, wingScore =  819 },
    IRON        = { minScore =    1, wingScore =  172 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 4047,
    CHALLENGER  = { minScore = 3840, wingScore = 3971 },
    GRANDMASTER = { minScore = 3788, wingScore = 3814 },
    MASTER      = { minScore = 3604, wingScore = 3696 },
    DIAMOND     = { minScore = 3469, wingScore = 3536 },
    EMERALD     = { minScore = 3289, wingScore = 3379 },
    PLATINUM    = { minScore = 3022, wingScore = 3128 },
    GOLD        = { minScore = 2673, wingScore = 2841 },
    SILVER      = { minScore = 1399, wingScore = 2250 },
    BRONZE      = { minScore =  342, wingScore =  819 },
    IRON        = { minScore =    1, wingScore =  172 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 4047,
    CHALLENGER  = { minScore = 3958, wingScore = 3971 },
    GRANDMASTER = { minScore = 3910, wingScore = 3934 },
    MASTER      = { minScore = 3741, wingScore = 3825 },
    DIAMOND     = { minScore = 3590, wingScore = 3666 },
    EMERALD     = { minScore = 3389, wingScore = 3490 },
    PLATINUM    = { minScore = 3099, wingScore = 3213 },
    GOLD        = { minScore = 2673, wingScore = 2901 },
    SILVER      = { minScore = 1399, wingScore = 2250 },
    BRONZE      = { minScore =  342, wingScore =  819 },
    IRON        = { minScore =    1, wingScore =  172 },
}

RR.CUTOFFS.all.all = {
    top100Score = 4134,
    CHALLENGER  = { minScore = 3944, wingScore = 3997 },
    GRANDMASTER = { minScore = 3857, wingScore = 3892 },
    MASTER      = { minScore = 3725, wingScore = 3773 },
    DIAMOND     = { minScore = 3498, wingScore = 3582 },
    EMERALD     = { minScore = 3364, wingScore = 3422 },
    PLATINUM    = { minScore = 3069, wingScore = 3188 },
    GOLD        = { minScore = 2719, wingScore = 2915 },
    SILVER      = { minScore = 1569, wingScore = 2370 },
    BRONZE      = { minScore =  392, wingScore =  926 },
    IRON        = { minScore =    1, wingScore =  208 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 4134,
    CHALLENGER  = { minScore = 3875, wingScore = 3997 },
    GRANDMASTER = { minScore = 3826, wingScore = 3850 },
    MASTER      = { minScore = 3653, wingScore = 3739 },
    DIAMOND     = { minScore = 3522, wingScore = 3587 },
    EMERALD     = { minScore = 3347, wingScore = 3435 },
    PLATINUM    = { minScore = 3075, wingScore = 3186 },
    GOLD        = { minScore = 2720, wingScore = 2889 },
    SILVER      = { minScore = 1572, wingScore = 2373 },
    BRONZE      = { minScore =  393, wingScore =  928 },
    IRON        = { minScore =    1, wingScore =  208 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 4134,
    CHALLENGER  = { minScore = 3988, wingScore = 3996 },
    GRANDMASTER = { minScore = 3939, wingScore = 3963 },
    MASTER      = { minScore = 3770, wingScore = 3854 },
    DIAMOND     = { minScore = 3627, wingScore = 3698 },
    EMERALD     = { minScore = 3436, wingScore = 3531 },
    PLATINUM    = { minScore = 3131, wingScore = 3256 },
    GOLD        = { minScore = 2718, wingScore = 2931 },
    SILVER      = { minScore = 1565, wingScore = 2368 },
    BRONZE      = { minScore =  391, wingScore =  924 },
    IRON        = { minScore =    1, wingScore =  207 },
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
