-- RaiderRanked: Panels.lua
-- Two of the three views inside the Score History window (ScoreHistory.lua
-- owns the window, its tab strip and the graph itself):
--   • Rank Ladder  — every rank with its cutoff and percentile band, the
--     current rank highlighted, and the gap to the next one.
--   • Seasons      — per-character results for the running season and every
--     archived one (data comes from ScoreHistory.lua).
--
-- Both are built into a pane frame handed in by the window. The pane spans the
-- full window, so the content is boxed into a fixed-width column centred in it
-- rather than stretched across a graph-sized frame.

local ADDON_NAME, RR = ...

local COLUMN_W       = 380  -- content width inside the (much wider) pane
local ROW_H          = 24
local ICON_SIZE      = 18
local CONTENT_TOP    = 40   -- below the window's tab strip
local LADDER_TOP     = 34   -- first ladder row, below the column's subtitle
local SEASON_HEAD_H  = 22   -- season caption row

-- ── Shared chrome ───────────────────────────────────────────────────────────

--- Centred fixed-width column inside a full-width pane.
local function CreateColumn(pane)
    local col = CreateFrame("Frame", nil, pane)
    col:SetWidth(COLUMN_W)
    col:SetPoint("TOP", pane, "TOP", 0, -CONTENT_TOP)
    col:SetPoint("BOTTOM", pane, "BOTTOM", 0, 12)
    return col
end

--- "EU · All Factions" for the active cutoff set.
local function CutoffLabel()
    local region  = RR.CUTOFF_REGION_LABELS[RR.db.cutoffRegion]   or RR.db.cutoffRegion
    local faction = RR.CUTOFF_FACTION_LABELS[RR.db.cutoffFaction] or RR.db.cutoffFaction
    return region .. " / " .. faction
end

-- ── Rank Ladder ─────────────────────────────────────────────────────────────

local ladderPane   -- the tab pane
local ladderCol    -- centred content column inside it
local ladderRows = {}

--- "Top 0.1%" for the first band, "1 – 4%" for the rest.
local function PercentileLabel(rankId)
    local band = RR.RANK_PERCENTILES and RR.RANK_PERCENTILES[rankId]
    if not band then return "" end
    local function Trim(v)
        -- 0.1 keeps its decimal, 20.0 does not.
        return (v % 1 == 0) and string.format("%d", v) or string.format("%.1f", v)
    end
    if band[1] == 0 then
        return "Top " .. Trim(band[2]) .. "%"
    end
    return Trim(band[1]) .. " \226\128\147 " .. Trim(band[2]) .. "%"
end

local function CreateLadderRow(parent, index)
    local row = CreateFrame("Frame", nil, parent)
    row:SetHeight(ROW_H)
    row:SetPoint("TOPLEFT", parent, "TOPLEFT", 10, -(LADDER_TOP + (index - 1) * ROW_H))
    row:SetPoint("RIGHT", parent, "RIGHT", -10, 0)

    -- Highlight behind the player's own rank.
    local hl = row:CreateTexture(nil, "BACKGROUND")
    hl:SetAllPoints()
    hl:Hide()
    row.hl = hl

    local icon = row:CreateTexture(nil, "ARTWORK")
    icon:SetSize(ICON_SIZE, ICON_SIZE)
    icon:SetPoint("LEFT", row, "LEFT", 4, 0)
    row.icon = icon

    local nameText = row:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    nameText:SetPoint("LEFT", icon, "RIGHT", 8, 0)
    nameText:SetWidth(104)
    nameText:SetJustifyH("LEFT")
    nameText:SetWordWrap(false)
    row.nameText = nameText

    local scoreText = row:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    scoreText:SetPoint("RIGHT", row, "RIGHT", -4, 0)
    scoreText:SetWidth(58)
    scoreText:SetJustifyH("RIGHT")
    row.scoreText = scoreText

    local pctText = row:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    pctText:SetPoint("RIGHT", scoreText, "LEFT", -10, 0)
    pctText:SetWidth(78)
    pctText:SetJustifyH("RIGHT")
    pctText:SetTextColor(0.55, 0.55, 0.62)
    row.pctText = pctText

    return row
end

--- Builds the ladder view into a tab pane. Called once by ScoreHistory.lua.
function RR:BuildLadderPane(pane)
    if ladderPane then return ladderPane end
    ladderPane = pane
    ladderCol  = CreateColumn(pane)

    local subtitle = ladderCol:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    subtitle:SetPoint("TOPLEFT", ladderCol, "TOPLEFT", 14, -8)
    subtitle:SetTextColor(0.55, 0.55, 0.62)
    ladderCol.subtitle = subtitle

    local divider = ladderCol:CreateTexture(nil, "ARTWORK")
    divider:SetPoint("BOTTOMLEFT", ladderCol, "BOTTOMLEFT", 10, 42)
    divider:SetPoint("BOTTOMRIGHT", ladderCol, "BOTTOMRIGHT", -10, 42)
    divider:SetHeight(1)
    divider:SetColorTexture(0.18, 0.22, 0.28, 1)

    local youText = ladderCol:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    youText:SetPoint("BOTTOMLEFT", ladderCol, "BOTTOMLEFT", 14, 22)
    youText:SetJustifyH("LEFT")
    ladderCol.youText = youText

    local gapText = ladderCol:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    gapText:SetPoint("BOTTOMLEFT", ladderCol, "BOTTOMLEFT", 14, 8)
    gapText:SetJustifyH("LEFT")
    gapText:SetTextColor(0.55, 0.55, 0.62)
    ladderCol.gapText = gapText

    -- Own FontString on the opposite side rather than a separator character:
    -- the gap and the Top 100 cutoff are two unrelated facts.
    local topText = ladderCol:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    topText:SetPoint("BOTTOMRIGHT", ladderCol, "BOTTOMRIGHT", -14, 8)
    topText:SetJustifyH("RIGHT")
    topText:SetTextColor(0.55, 0.55, 0.62)
    ladderCol.topText = topText

    return ladderPane
end

--- Repaints the ladder from the active thresholds and the player's score.
function RR:RefreshRankLadder()
    if not ladderPane or not ladderPane:IsShown() then return end

    local score   = self.playerScore
    local ownRank = score and self:GetRankForScore(score) or nil

    ladderCol.subtitle:SetText("Cutoffs: " .. CutoffLabel())

    local index = 0
    for _, rank in ipairs(self.RANKS) do
        if rank.id ~= "UNRANKED" then
            index = index + 1
            local row = ladderRows[index]
            if not row then
                row = CreateLadderRow(ladderCol, index)
                ladderRows[index] = row
            end

            local c = rank.color
            row.icon:SetTexture(rank.icon)
            row.nameText:SetText(rank.name)
            row.nameText:SetTextColor(c.r, c.g, c.b)
            row.pctText:SetText(PercentileLabel(rank.id))
            row.scoreText:SetText(string.format("%d+", rank.minScore))

            local isOwn = ownRank and ownRank.id == rank.id
            if isOwn then
                row.hl:SetColorTexture(c.r, c.g, c.b, 0.16)
                row.hl:Show()
                row.scoreText:SetTextColor(1, 1, 1)
            else
                row.hl:Hide()
                row.scoreText:SetTextColor(0.75, 0.75, 0.80)
            end

            row:Show()
        end
    end
    for i = index + 1, #ladderRows do
        ladderRows[i]:Hide()
    end

    ladderCol.topText:SetText(string.format("Top 100 cutoff: %d", self.TOP_100_SCORE or 0))

    if not score or not ownRank then
        ladderCol.youText:SetText("|cff999999No M+ score yet this season|r")
        ladderCol.gapText:SetText("")
        return
    end

    ladderCol.youText:SetText(string.format("You: |cffffffff%.0f|r  (%s)",
        score, self:FormatRankName(ownRank, score)))

    local nextRank = self:GetNextRank(ownRank)
    if nextRank then
        ladderCol.gapText:SetText(string.format("%d to %s",
            math.max(0, nextRank.minScore - score), nextRank.name))
    else
        ladderCol.gapText:SetText("Highest rank reached")
    end
end

--- Opens the window on the ladder tab, or closes it if that tab is already up.
function RR:ToggleRankLadder(show)
    if show == false then
        self:ToggleHistoryGraph(false)
        return
    end
    if show == nil and ladderPane and ladderPane:IsShown()
       and self.historyFrame and self.historyFrame:IsShown() then
        self:ToggleHistoryGraph(false)
        return
    end
    self:ToggleHistoryGraph(true, "ladder")
end

-- ── Past Seasons ────────────────────────────────────────────────────────────

local seasonsPane
local seasonsCol
local seasonRows = {}   -- reused for both caption and character rows

local function CreateSeasonRow(parent)
    local row = CreateFrame("Frame", nil, parent)
    row:SetHeight(ROW_H)
    row:SetPoint("LEFT", parent, "LEFT", 0, 0)
    row:SetPoint("RIGHT", parent, "RIGHT", 0, 0)

    local icon = row:CreateTexture(nil, "ARTWORK")
    icon:SetSize(ICON_SIZE, ICON_SIZE)
    icon:SetPoint("LEFT", row, "LEFT", 4, 0)
    row.icon = icon

    local nameText = row:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    nameText:SetJustifyH("LEFT")
    nameText:SetWordWrap(false)
    row.nameText = nameText

    local scoreText = row:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    scoreText:SetPoint("RIGHT", row, "RIGHT", -4, 0)
    scoreText:SetWidth(52)
    scoreText:SetJustifyH("RIGHT")
    row.scoreText = scoreText

    local rankText = row:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    rankText:SetPoint("RIGHT", scoreText, "LEFT", -8, 0)
    rankText:SetWidth(96)
    rankText:SetJustifyH("RIGHT")
    row.rankText = rankText

    return row
end

--- A season caption ("Season 1 · current") reuses the same row object with the
--- icon hidden and the name stretched across the full width.
local function SetCaptionRow(row, text)
    row.icon:Hide()
    row.scoreText:SetText("")
    row.rankText:SetText("")
    row:SetHeight(SEASON_HEAD_H)
    row.nameText:ClearAllPoints()
    row.nameText:SetWidth(0)  -- drop the char-row width; the anchors size it
    row.nameText:SetPoint("LEFT", row, "LEFT", 4, 0)
    row.nameText:SetPoint("RIGHT", row, "RIGHT", -4, 0)
    row.nameText:SetText(text)
    row.nameText:SetTextColor(0.55, 0.55, 0.62)
end

local function SetCharRow(row, entry)
    row.icon:Show()
    row:SetHeight(ROW_H)
    row.nameText:ClearAllPoints()
    row.nameText:SetPoint("LEFT", row.icon, "RIGHT", 8, 0)
    row.nameText:SetWidth(110)
    row.nameText:SetText(entry.name)
    row.nameText:SetTextColor(1, 1, 1)

    local rank = RR.RANK_BY_ID[entry.peakRank] or RR:GetRankForScore(entry.peak)
    local c = rank.color
    row.icon:SetTexture(rank.icon)
    row.rankText:SetText(rank.name)
    row.rankText:SetTextColor(c.r, c.g, c.b)
    row.scoreText:SetText(string.format("%.0f", entry.peak))
    row.scoreText:SetTextColor(0.85, 0.85, 0.90)
end

--- Builds the seasons view into a tab pane. Called once by ScoreHistory.lua.
function RR:BuildSeasonsPane(pane)
    if seasonsPane then return seasonsPane end
    seasonsPane = pane
    seasonsCol  = CreateColumn(pane)

    local subtitle = seasonsCol:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    subtitle:SetPoint("TOPLEFT", seasonsCol, "TOPLEFT", 14, -8)
    subtitle:SetTextColor(0.55, 0.55, 0.62)
    subtitle:SetText("Best score reached per character")

    -- The scroll frame fills the rest of the column, so the list gets whatever
    -- height the window has rather than a hard-coded viewport.
    local scroll = CreateFrame("ScrollFrame", "RaiderRankedSeasonsScroll", seasonsCol,
        "UIPanelScrollFrameTemplate")
    scroll:SetPoint("TOPLEFT", seasonsCol, "TOPLEFT", 10, -28)
    scroll:SetPoint("BOTTOMRIGHT", seasonsCol, "BOTTOMRIGHT", -30, 4)

    local child = CreateFrame("Frame", nil, scroll)
    child:SetSize(COLUMN_W - 42, 10)
    scroll:SetScrollChild(child)

    seasonsCol.scroll      = scroll
    seasonsCol.scrollChild = child

    local emptyText = seasonsCol:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    emptyText:SetPoint("CENTER", seasonsCol, "CENTER", 0, 0)
    emptyText:SetTextColor(0.6, 0.6, 0.6)
    emptyText:Hide()
    seasonsCol.emptyText = emptyText

    return seasonsPane
end

function RR:RefreshSeasonsPanel()
    if not seasonsPane or not seasonsPane:IsShown() then return end

    local child = seasonsCol.scrollChild
    local used, offset = 0, 0

    local function NextRow()
        used = used + 1
        local row = seasonRows[used]
        if not row then
            row = CreateSeasonRow(child)
            seasonRows[used] = row
        end
        row:ClearAllPoints()
        row:SetPoint("TOPLEFT", child, "TOPLEFT", 0, -offset)
        row:SetPoint("TOPRIGHT", child, "TOPRIGHT", 0, -offset)
        row:Show()
        return row
    end

    local anyRows = false
    for _, season in ipairs(self:GetSeasonArchive()) do
        if #season.rows > 0 then
            anyRows = true

            local caption
            if season.current then
                caption = string.format("%s (current, since %s)",
                    season.name, date("%d %b %Y", season.start))
            else
                caption = string.format("%s (%s to %s)",
                    season.name,
                    date("%d %b %Y", season.start),
                    date("%d %b %Y", season.ended or season.start))
            end

            local row = NextRow()
            SetCaptionRow(row, caption)
            offset = offset + SEASON_HEAD_H

            for _, entry in ipairs(season.rows) do
                local charRow = NextRow()
                SetCharRow(charRow, entry)
                offset = offset + ROW_H
            end
            offset = offset + 6  -- breathing room between seasons
        end
    end

    for i = used + 1, #seasonRows do
        seasonRows[i]:Hide()
    end

    child:SetHeight(math.max(offset, seasonsCol.scroll:GetHeight()))

    if anyRows then
        seasonsCol.emptyText:Hide()
    else
        seasonsCol.emptyText:SetText("No season data recorded yet.")
        seasonsCol.emptyText:Show()
    end
end

--- Opens the window on the seasons tab, or closes it if that tab is already up.
function RR:ToggleSeasonsPanel(show)
    if show == false then
        self:ToggleHistoryGraph(false)
        return
    end
    if show == nil and seasonsPane and seasonsPane:IsShown()
       and self.historyFrame and self.historyFrame:IsShown() then
        self:ToggleHistoryGraph(false)
        return
    end
    self:ToggleHistoryGraph(true, "seasons")
end
