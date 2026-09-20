-- RaiderRanked: API.lua
-- The surface other addons are allowed to use.
--
-- RR itself stays private. Publishing the whole table would make every
-- internal a promise that cannot be changed without breaking somebody, so
-- this file names the handful of things a companion addon actually needs and
-- nothing else. Anything missing here is missing on purpose; add it
-- deliberately rather than reaching around this file.
--
-- Loaded last, so everything it forwards to already exists.

local ADDON_NAME, RR = ...

--- @class RaiderRankedAPI
local API = {}

-- Bumped when something here changes shape. A companion addon can refuse to
-- run against a surface it does not understand instead of erroring later.
API.VERSION = 1

-- ── Scores and ranks ───────────────────────────────────────────────────────

--- The M+ rating for a unit, from the Blizzard API with RaiderIO as fallback.
---@param unit string
---@return number|nil
function API.GetScoreForUnit(unit)
    return RR:GetScoreForUnit(unit)
end

--- The rank a score is worth under the currently selected cutoffs.
---@param score number|nil
---@return table rank
function API.GetRankForScore(score)
    return RR:GetRankForScore(score)
end

--- Rank name for display, coloured, optionally abbreviated.
---@param rank table
---@param score number|nil
---@param short boolean|nil
---@return string
function API.GetRankDisplayName(rank, score, short)
    return RR:GetRankDisplayName(rank, score, short)
end

--- Reads a current-season score out of a RaiderIO profile, across the field
--- names their versions have used.
---@param profile table|nil
---@return number|nil
function API.ScoreFromRaiderIOProfile(profile)
    return RR:ScoreFromRaiderIOProfile(profile)
end

--- Where a score sits in the field, as a percentage from the top.
---@param score number
---@param thresholds table|nil  defaults to the active cutoffs
---@return number|nil percentile
function API.ScorePercentile(score, thresholds)
    return RR:ScorePercentile(score, thresholds or RR:CutoffThresholds())
end

--- The active cutoff selection, so a companion can label what it is measuring
--- against rather than assuming EU.
---@return string region, string faction
function API.GetCutoffSelection()
    return RR.db.cutoffRegion, RR.db.cutoffFaction
end

--- The cutoffs of any region and faction, not only the selected one, so a
--- companion can show the same score measured against every ladder.
---@param region string|nil   nil means the active selection
---@param faction string|nil
---@return table|nil thresholds  rank id -> minimum score
function API.GetCutoffThresholds(region, faction)
    return RR:CutoffThresholds(region, faction)
end

--- Valid region and faction ids, with the labels the settings panel uses.
API.REGIONS         = RR.CUTOFF_REGIONS
API.FACTIONS        = RR.CUTOFF_FACTIONS
API.REGION_LABELS   = RR.CUTOFF_REGION_LABELS
API.FACTION_LABELS  = RR.CUTOFF_FACTION_LABELS

--- The ranks themselves, highest first, for anything that draws a ladder.
API.RANKS = RR.RANKS

--- Lowest level that can carry a score. Below it, absence is not a gap.
API.MIN_SCORED_LEVEL = RR.MIN_SCORED_LEVEL

-- ── The score history window ───────────────────────────────────────────────

--- Adds a tab to the score history window.
---
--- Must be called before the player first opens the window; see RegisterTab
--- in ScoreHistory.lua for why.
---@param def table  { id, label, title?, build?, refresh? }
---@return boolean accepted
function API.RegisterTab(def)
    return RR:RegisterTab(def)
end

--- Opens the window on a given tab.
---@param tabId string
function API.OpenTab(tabId)
    RR:ToggleHistoryGraph(true, tabId)
end

-- Published only once everything above resolves, so a companion addon that
-- checks for the global never finds a half-built one.
_G.RaiderRanked = API
