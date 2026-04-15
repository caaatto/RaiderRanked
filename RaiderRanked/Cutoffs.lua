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
    top100Score = 3771,
    CHALLENGER  = { minScore = 3628, wingScore = 3664 },
    GRANDMASTER = { minScore = 3537, wingScore = 3562 },
    MASTER      = { minScore = 3415, wingScore = 3454 },
    DIAMOND     = { minScore = 3209, wingScore = 3295 },
    EMERALD     = { minScore = 3065, wingScore = 3125 },
    PLATINUM    = { minScore = 2796, wingScore = 2956 },
    GOLD        = { minScore = 2552, wingScore = 2668 },
    SILVER      = { minScore = 1315, wingScore = 2093 },
    BRONZE      = { minScore =  360, wingScore =  807 },
    IRON        = { minScore =    1, wingScore =  195 },
}

RR.CUTOFFS.eu.horde = {
    top100Score = 3771,
    CHALLENGER  = { minScore = 3628, wingScore = 3664 },
    GRANDMASTER = { minScore = 3537, wingScore = 3562 },
    MASTER      = { minScore = 3415, wingScore = 3454 },
    DIAMOND     = { minScore = 3209, wingScore = 3295 },
    EMERALD     = { minScore = 3065, wingScore = 3125 },
    PLATINUM    = { minScore = 2796, wingScore = 2956 },
    GOLD        = { minScore = 2552, wingScore = 2668 },
    SILVER      = { minScore = 1315, wingScore = 2093 },
    BRONZE      = { minScore =  360, wingScore =  807 },
    IRON        = { minScore =    1, wingScore =  195 },
}

RR.CUTOFFS.eu.alliance = {
    top100Score = 3771,
    CHALLENGER  = { minScore = 3628, wingScore = 3664 },
    GRANDMASTER = { minScore = 3537, wingScore = 3562 },
    MASTER      = { minScore = 3415, wingScore = 3454 },
    DIAMOND     = { minScore = 3209, wingScore = 3295 },
    EMERALD     = { minScore = 3065, wingScore = 3125 },
    PLATINUM    = { minScore = 2796, wingScore = 2956 },
    GOLD        = { minScore = 2552, wingScore = 2668 },
    SILVER      = { minScore = 1315, wingScore = 2093 },
    BRONZE      = { minScore =  360, wingScore =  807 },
    IRON        = { minScore =    1, wingScore =  195 },
}

RR.CUTOFFS.us.all = {
    top100Score = 3771,
    CHALLENGER  = { minScore = 3628, wingScore = 3664 },
    GRANDMASTER = { minScore = 3537, wingScore = 3562 },
    MASTER      = { minScore = 3415, wingScore = 3454 },
    DIAMOND     = { minScore = 3209, wingScore = 3295 },
    EMERALD     = { minScore = 3065, wingScore = 3125 },
    PLATINUM    = { minScore = 2796, wingScore = 2956 },
    GOLD        = { minScore = 2552, wingScore = 2668 },
    SILVER      = { minScore = 1315, wingScore = 2093 },
    BRONZE      = { minScore =  360, wingScore =  807 },
    IRON        = { minScore =    1, wingScore =  195 },
}

RR.CUTOFFS.us.horde = {
    top100Score = 3771,
    CHALLENGER  = { minScore = 3628, wingScore = 3664 },
    GRANDMASTER = { minScore = 3537, wingScore = 3562 },
    MASTER      = { minScore = 3415, wingScore = 3454 },
    DIAMOND     = { minScore = 3209, wingScore = 3295 },
    EMERALD     = { minScore = 3065, wingScore = 3125 },
    PLATINUM    = { minScore = 2796, wingScore = 2956 },
    GOLD        = { minScore = 2552, wingScore = 2668 },
    SILVER      = { minScore = 1315, wingScore = 2093 },
    BRONZE      = { minScore =  360, wingScore =  807 },
    IRON        = { minScore =    1, wingScore =  195 },
}

RR.CUTOFFS.us.alliance = {
    top100Score = 3771,
    CHALLENGER  = { minScore = 3628, wingScore = 3664 },
    GRANDMASTER = { minScore = 3537, wingScore = 3562 },
    MASTER      = { minScore = 3415, wingScore = 3454 },
    DIAMOND     = { minScore = 3209, wingScore = 3295 },
    EMERALD     = { minScore = 3065, wingScore = 3125 },
    PLATINUM    = { minScore = 2796, wingScore = 2956 },
    GOLD        = { minScore = 2552, wingScore = 2668 },
    SILVER      = { minScore = 1315, wingScore = 2093 },
    BRONZE      = { minScore =  360, wingScore =  807 },
    IRON        = { minScore =    1, wingScore =  195 },
}

RR.CUTOFFS.all.all = {
    top100Score = 3771,
    CHALLENGER  = { minScore = 3628, wingScore = 3664 },
    GRANDMASTER = { minScore = 3537, wingScore = 3562 },
    MASTER      = { minScore = 3415, wingScore = 3454 },
    DIAMOND     = { minScore = 3209, wingScore = 3295 },
    EMERALD     = { minScore = 3065, wingScore = 3125 },
    PLATINUM    = { minScore = 2796, wingScore = 2956 },
    GOLD        = { minScore = 2552, wingScore = 2668 },
    SILVER      = { minScore = 1315, wingScore = 2093 },
    BRONZE      = { minScore =  360, wingScore =  807 },
    IRON        = { minScore =    1, wingScore =  195 },
}

RR.CUTOFFS.all.horde = {
    top100Score = 3771,
    CHALLENGER  = { minScore = 3628, wingScore = 3664 },
    GRANDMASTER = { minScore = 3537, wingScore = 3562 },
    MASTER      = { minScore = 3415, wingScore = 3454 },
    DIAMOND     = { minScore = 3209, wingScore = 3295 },
    EMERALD     = { minScore = 3065, wingScore = 3125 },
    PLATINUM    = { minScore = 2796, wingScore = 2956 },
    GOLD        = { minScore = 2552, wingScore = 2668 },
    SILVER      = { minScore = 1315, wingScore = 2093 },
    BRONZE      = { minScore =  360, wingScore =  807 },
    IRON        = { minScore =    1, wingScore =  195 },
}

RR.CUTOFFS.all.alliance = {
    top100Score = 3771,
    CHALLENGER  = { minScore = 3628, wingScore = 3664 },
    GRANDMASTER = { minScore = 3537, wingScore = 3562 },
    MASTER      = { minScore = 3415, wingScore = 3454 },
    DIAMOND     = { minScore = 3209, wingScore = 3295 },
    EMERALD     = { minScore = 3065, wingScore = 3125 },
    PLATINUM    = { minScore = 2796, wingScore = 2956 },
    GOLD        = { minScore = 2552, wingScore = 2668 },
    SILVER      = { minScore = 1315, wingScore = 2093 },
    BRONZE      = { minScore =  360, wingScore =  807 },
    IRON        = { minScore =    1, wingScore =  195 },
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

--- Returns the cutoff table for the given region/faction, falling back
--- to eu/all if the selection is unknown (e.g. invalid SavedVariables).
function RR:GetCutoffSet(region, faction)
    local byRegion = self.CUTOFFS[region] or self.CUTOFFS.eu
    return byRegion[faction] or byRegion.all or self.CUTOFFS.eu.all
end
