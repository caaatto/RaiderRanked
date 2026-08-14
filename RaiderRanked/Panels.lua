-- RaiderRanked: Panels.lua
-- Two of the three views inside the Score History window (ScoreHistory.lua
-- owns the window, its tab strip and the graph itself):
--   • Rank Ladder  - every rank with its cutoff and percentile band, the
--     current rank highlighted, and the gap to the next one.
--   • Seasons      - per-character results for the running season and every
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
local DETAIL_LINE_H  = 13   -- one line inside an expanded detail row
local DETAIL_PAD     = 8    -- padding around those lines

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

--- "Top 0.1%" for the first band, "1-4%" for the rest.
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

-- Which ladder the figures are measured against. Starts on the player's own
-- selection and is not persisted: it is a comparison tool, not a setting.
local viewRegion, viewFaction

local function ViewRegion()  return viewRegion  or RR.db.cutoffRegion  end
local function ViewFaction() return viewFaction or RR.db.cutoffFaction end

--- True while the comparison matches the player's configured ladder, which is
--- the only case where the numbers are the ones the addon actually showed.
local function ViewIsOwnLadder()
    return ViewRegion() == RR.db.cutoffRegion and ViewFaction() == RR.db.cutoffFaction
end

--- One picker, for either axis. Uses Blizzard's dropdown where the client has
--- it and falls back to a plain button cycling the options otherwise, which is
--- the same feature check the season picker makes.
local function BuildLadderPicker(parent, axis, xOffset)
    local isRegion = (axis == "region")
    local values = isRegion and RR.CUTOFF_REGIONS or RR.CUTOFF_FACTIONS
    local labels = isRegion and RR.CUTOFF_REGION_LABELS or RR.CUTOFF_FACTION_LABELS

    local function Current() return isRegion and ViewRegion() or ViewFaction() end
    local function Apply(value)
        if isRegion then viewRegion = value else viewFaction = value end
        RR:RefreshSeasonsPanel()
    end

    local btn
    if C_XMLUtil and C_XMLUtil.GetTemplateInfo
       and C_XMLUtil.GetTemplateInfo("WowStyle1DropdownTemplate") then
        btn = CreateFrame("DropdownButton", nil, parent, "WowStyle1DropdownTemplate")
        btn:SetWidth(118)
        btn:SetupMenu(function(_, rootDescription)
            for _, value in ipairs(values) do
                rootDescription:CreateRadio(labels[value] or value,
                    function(v) return Current() == v end,
                    function(v) Apply(v) end,
                    value)
            end
        end)
    else
        btn = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
        btn:SetSize(118, 20)
        btn:SetScript("OnClick", function()
            -- No menu available: step through the options in order.
            local current, nextValue = Current(), values[1]
            for i, value in ipairs(values) do
                if value == current then nextValue = values[(i % #values) + 1] end
            end
            Apply(nextValue)
        end)
    end
    btn:SetPoint("TOPLEFT", parent, "TOPLEFT", xOffset, -24)

    btn.UpdateLabel = function(self)
        local text = labels[Current()] or Current()
        if self.SetDefaultText then self:SetDefaultText(text) else self:SetText(text) end
    end
    btn:UpdateLabel()
    return btn
end

--- "EU / Horde" for whichever ladder is being compared against.
local function CompareLabel()
    local r = RR.CUTOFF_REGION_LABELS[ViewRegion()]   or ViewRegion()
    local f = RR.CUTOFF_FACTION_LABELS[ViewFaction()] or ViewFaction()
    return r .. " / " .. f
end

-- Which character row is expanded, as "<seasonIndex>|<charKey>". Only one at a
-- time - the detail is a footnote, not a second list.
local expandedRow

local function CreateSeasonRow(parent)
    local row = CreateFrame("Button", nil, parent)
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

--- Rows are pooled and reused, so anything that made one interactive has to be
--- cleared before it is handed out as a non-interactive row.
local function ClearRowInteraction(row)
    row:SetScript("OnClick", nil)
    row:SetScript("OnEnter", nil)
    row:SetScript("OnLeave", nil)
    row:SetAlpha(1)
end

--- A season caption reuses the same row object with the icon hidden and the
--- name stretched across the full width.
local function SetCaptionRow(row, text)
    ClearRowInteraction(row)
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

--- Detail line shown under an expanded character: the peak as a percentile,
--- which is the figure the rank itself is derived from.
local function SetDetailRow(row, entry, season)
    ClearRowInteraction(row)
    row.icon:Hide()
    row.scoreText:SetText("")
    row.rankText:SetText("")
    row.nameText:ClearAllPoints()
    row.nameText:SetWidth(0)
    row.nameText:SetPoint("TOPLEFT", row, "TOPLEFT", 30, -2)
    row.nameText:SetPoint("RIGHT", row, "RIGHT", -4, 0)
    -- Two lines, so wrapping has to be back on: char rows switch it off to
    -- keep long names on one line.
    row.nameText:SetWordWrap(true)
    row.nameText:SetJustifyV("TOP")

    -- Two different facts, and they are rarely the same day: the highest score
    -- reached, and the highest the player ever stood on the ladder. Cutoffs
    -- climb all season, so an earlier lower score often outranks a later
    -- higher one.
    local function Pct(value)
        return value < 1 and string.format("%.1f", value) or string.format("%.0f", value)
    end

    -- Rank names carry their own colour so the tier is readable at a glance
    -- against the muted grey the rest of the line uses. No score is passed, so
    -- no "+" suffix: this is about which tier, not where inside it.
    local function RankText(rank)
        if not rank then return "|cff888888unranked|r" end
        return RR:FormatRankName(rank)
    end

    -- The detail runs to two or three lines depending on what is known, so the
    -- row sizes itself and reports back how much space the layout must leave.
    local function Finish(target, lines)
        local height = DETAIL_PAD + #lines * DETAIL_LINE_H
        target:SetHeight(height)
        target.nameText:SetText(table.concat(lines, "\n"))
        target.nameText:SetTextColor(0.55, 0.55, 0.62)
        return height
    end

    local lines = {}

    -- The score is a plain fact; what rank it was worth is not, because that
    -- depends on when and against which ladder. Naming a rank here without a
    -- date invites exactly the wrong reading, so the date goes here and the
    -- ranks go on the lines below, each with its own reference point.
    lines[#lines + 1] = string.format("best score |cffffffff%.0f|r%s",
        entry.peak,
        entry.peakAt and (" on " .. date("%d %b %Y", entry.peakAt)) or "")

    -- This ladder's own best moment, if it was recorded while it happened.
    local stored = entry.bestLadders
        and entry.bestLadders[ViewRegion()]
        and entry.bestLadders[ViewRegion()][ViewFaction()]

    if stored and stored.pct then
        local rank = stored.rank and RR.RANK_BY_ID[stored.rank]
        lines[#lines + 1] = string.format("best rank on %s: %s%s, top %s%%%s",
            CompareLabel(), RankText(rank), stored.plus and " +" or "", Pct(stored.pct),
            stored.ts and (" on " .. date("%d %b %Y", stored.ts)) or "")
        return Finish(row, lines)
    end

    -- Nothing recorded for the selected ladder. The best rank on the player's
    -- own ladder is still known and still theirs, so it stays on screen rather
    -- than vanishing the moment the comparison is switched.
    if entry.bestPct and entry.bestPctAt then
        local bestRank = RR.RANK_BY_ID[entry.bestPctRank]
        lines[#lines + 1] = string.format("best rank %s%s, top %s%% on %s",
            RankText(bestRank), entry.bestPctPlus and " +" or "",
            Pct(entry.bestPct), date("%d %b %Y", entry.bestPctAt))
    elseif entry.peakPct then
        lines[#lines + 1] = string.format("roughly top %s%% at that time", Pct(entry.peakPct))
    end

    if ViewIsOwnLadder() then
        return Finish(row, lines)
    end

    -- Comparison only, against the closest honest reference for that ladder.
    -- A finished season uses the cutoffs frozen when it closed: the live ones
    -- now describe the new season, where the whole field is back at zero.
    local frozen = season and season.endCutoffs
        and season.endCutoffs[ViewRegion()]
        and season.endCutoffs[ViewRegion()][ViewFaction()]
    local th = frozen or RR:CutoffThresholds(ViewRegion(), ViewFaction())

    if not th then
        -- Never guess here: without that ladder's cutoffs any figure would
        -- silently be the player's own ladder wearing another name.
        lines[#lines + 1] = string.format("no cutoffs available for %s", CompareLabel())
    else
        -- ScorePercentile returns the percentile first, then the rank table.
        local pct, rank = RR:ScorePercentile(entry.peak, th)
        local when = frozen and "at that season's end" or "today"
        if pct then
            lines[#lines + 1] = string.format("on %s %s it would be %s, top %s%%",
                CompareLabel(), when, RankText(rank), Pct(pct))
        else
            lines[#lines + 1] = string.format("unranked on %s %s", CompareLabel(), when)
        end
    end

    return Finish(row, lines)
end

local function SetCharRow(row, entry, rowId)
    row.icon:Show()
    row:SetHeight(ROW_H)
    row.nameText:ClearAllPoints()
    row.nameText:SetPoint("LEFT", row.icon, "RIGHT", 8, 0)
    row.nameText:SetWidth(110)
    row.nameText:SetWordWrap(false)
    row.nameText:SetText(entry.name)
    row.nameText:SetTextColor(1, 1, 1)

    -- Clicking a character folds its detail line in and out.
    row:SetScript("OnClick", function()
        expandedRow = (expandedRow ~= rowId) and rowId or nil
        RR:RefreshSeasonsPanel()
    end)
    row:SetScript("OnEnter", function(self) self:SetAlpha(0.75) end)
    row:SetScript("OnLeave", function(self) self:SetAlpha(1) end)

    -- The row is where the season ended: the closing score and the rank it was
    -- worth against the cutoffs in force at that point. The peak, which is a
    -- different score on a different day, lives in the expanded detail.
    local closing = entry.final or entry.peak
    local rank = RR.RANK_BY_ID[entry.finalRank] or RR:GetRankForScore(closing)
    local c = rank.color
    row.icon:SetTexture(rank.icon)
    row.rankText:SetText(rank.name .. (entry.finalPlus and " +" or ""))
    row.rankText:SetTextColor(c.r, c.g, c.b)
    row.scoreText:SetText(string.format("%.0f", closing))
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
    seasonsCol.subtitle = subtitle

    -- Region and faction pickers, so a result can be held against a different
    -- ladder than the one it was earned on.
    seasonsCol.regionBtn  = BuildLadderPicker(seasonsCol, "region",  14)
    seasonsCol.factionBtn = BuildLadderPicker(seasonsCol, "faction", 140)

    -- The scroll frame fills the rest of the column, so the list gets whatever
    -- height the window has rather than a hard-coded viewport.
    local scroll = CreateFrame("ScrollFrame", "RaiderRankedSeasonsScroll", seasonsCol,
        "UIPanelScrollFrameTemplate")
    -- Below the subtitle and the two ladder pickers.
    scroll:SetPoint("TOPLEFT", seasonsCol, "TOPLEFT", 10, -52)
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

    seasonsCol.regionBtn:UpdateLabel()
    seasonsCol.factionBtn:UpdateLabel()
    -- Says plainly which question the numbers below are answering.
    if ViewIsOwnLadder() then
        seasonsCol.subtitle:SetText("Where each character finished the season")
    else
        seasonsCol.subtitle:SetText("Compared against today's " .. CompareLabel() .. " cutoffs")
    end

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
    for seasonIndex, season in ipairs(self:GetSeasonArchive()) do
        if #season.rows > 0 then
            anyRows = true

            local caption
            if season.current then
                caption = string.format("%s (current, since %s)",
                    RR:SeasonDisplayName(season.name), date("%d %b %Y", season.start))
            else
                caption = string.format("%s (%s to %s)",
                    RR:SeasonDisplayName(season.name),
                    date("%d %b %Y", season.start),
                    date("%d %b %Y", season.ended or season.start))
            end

            local row = NextRow()
            SetCaptionRow(row, caption)
            offset = offset + SEASON_HEAD_H

            for _, entry in ipairs(season.rows) do
                local rowId = seasonIndex .. "|" .. entry.key
                local charRow = NextRow()
                SetCharRow(charRow, entry, rowId)
                offset = offset + ROW_H

                if expandedRow == rowId then
                    local detail = NextRow()
                    -- Height comes back from the row: the detail is two or
                    -- three lines depending on what is known about that ladder.
                    offset = offset + SetDetailRow(detail, entry, season)
                end
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
