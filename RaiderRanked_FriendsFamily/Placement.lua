-- RaiderRanked Friends & Family: Placement.lua
-- Issue #17 asks for realm rank, region rank and world rank. Only part of that
-- can be answered honestly, and the part that cannot is worth stating rather
-- than approximating.
--
--   Percentile      yes. The shipped cutoffs are computed from the score
--                   distribution, so where a score sits in the field follows
--                   directly from them.
--   Region rank     not as a number. An ordinal needs the size of the field,
--                   and the population count lives in the threshold job's
--                   state file, not in the addon. Shipping it is a change to
--                   the patcher, which lives upstream in raiderranked-api.
--   Realm rank      no. Nothing per realm is collected at any point.
--   World rank      no. The job covers US and EU; "all" is those two merged,
--                   not the world. KR, TW and CN are absent entirely.
--
-- What is left is still the useful half of the question: the same score
-- measured against every ladder that does exist, so "where do I stand" is
-- answered per region and faction instead of as one number that would have to
-- be invented.

local ADDON_NAME, FF = ...

local RR = _G.RaiderRanked

--- The player's score against all nine region and faction ladders.
---
--- Sorted by percentile, best first, so the ladder a character looks best on
--- is the one at the top. That ordering is the point: the difference between
--- EU Alliance and EU Horde at the same score is often a whole rank, and it is
--- invisible until the two are put next to each other.
---@return table rows, number|nil score
function FF.GetPlacements()
    local rows  = {}
    local score = RR.GetScoreForUnit("player")
    if not score or score <= 0 then return rows, nil end

    local activeRegion, activeFaction = RR.GetCutoffSelection()

    for _, region in ipairs(RR.REGIONS) do
        for _, faction in ipairs(RR.FACTIONS) do
            local thresholds = RR.GetCutoffThresholds(region, faction)
            local pct        = thresholds and RR.ScorePercentile(score, thresholds)
            if pct then
                table.insert(rows, {
                    region     = region,
                    faction    = faction,
                    label      = string.format("%s / %s",
                        RR.REGION_LABELS[region] or region,
                        RR.FACTION_LABELS[faction] or faction),
                    percentile = pct,
                    rank       = RR.GetRankForScore(score),
                    isActive   = region == activeRegion and faction == activeFaction,
                })
            end
        end
    end

    table.sort(rows, function(a, b) return a.percentile < b.percentile end)
    return rows, score
end

--- Prints the placements to chat.
function FF.PrintPlacements()
    local rows, score = FF.GetPlacements()
    if not score then
        print("|cff00ccffRaiderRanked|r No score this season yet.")
        return
    end

    print(string.format("|cff00ccffRaiderRanked|r Score %d, measured against every ladder:", score))
    for _, row in ipairs(rows) do
        print(string.format("  %s%-22s top %.2f%%|r",
            row.isActive and "|cffffffff" or "|cff888888",
            row.label, row.percentile))
    end
    print("  |cff888888A placement as a number would need the size of the field, "
        .. "which the addon is not shipped with.|r")
end
