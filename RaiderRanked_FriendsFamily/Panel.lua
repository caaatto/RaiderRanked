-- RaiderRanked Friends & Family: Panel.lua
-- The module's tab in the score history window, its slash command and its one
-- setting.
--
-- Two views over the same people, because they answer different questions.
--
--   Division  one rank at a time, bounded above and below by the scores that
--             leave it. About where you are standing and what it would take
--             to get out.
--   Full      every rank at once, one column each. About the shape of the
--             field: eleven stuck in Gold and two who made it to Diamond.
--
-- The source filter above applies to both.

local ADDON_NAME, FF = ...

local RR = _G.RaiderRanked

local PAD      = 14
local ROW_H    = 16
local FILTER_Y = 26
local MODE_Y   = 50
local HEAD_Y   = 80      -- the division bounds
local LIST_Y   = HEAD_Y + 22

local DIV_COLS, DIV_ROWS   = 3, 17   -- names inside one division

-- Division columns are a fixed width and the block is centred in whatever is
-- left, rather than stretched to the edges. Stretching puts the names against
-- the window frame and leaves the gap in the middle, which reads as two tables.
local DIV_COL_W            = 200

-- How much of a column the name gets; the score takes the rest, right-aligned
-- against the rule between them.
local NAME_SHARE           = 0.66
local RULE_GAP             = 8

-- Width of one stacked row in the full view. Narrower than the window on
-- purpose: a name and a four-digit score do not need the whole width, and
-- pulling the two ends that far apart makes them hard to read as one row.
local ROW_W                = 320
local SCROLLBAR_W          = 22

-- Guild and friends are told apart by colour rather than by being separate
-- lists, so one look covers both. Self is white: it is the row being looked
-- for.
local COLOR = {
    guild   = { 0.35, 0.95, 0.50 },
    friends = { 0.45, 0.82, 1.00 },
    self    = { 1.00, 1.00, 1.00 },
}

local pane, filterButtons, modeButtons
local title, leftArrow, rightArrow, upperLine, lowerLine, footer
local cells, rules
local scroll, scrollChild, scrollRows
local activeFilter, activeMode = "all", "division"
local viewIndex                              -- into RR.RANKS, highest first

-- ── Data ───────────────────────────────────────────────────────────────────

local function Collect()
    local out, seen = {}, {}

    local function take(entries, origin)
        for _, e in ipairs(entries) do
            if e.name and not seen[e.name] then
                seen[e.name] = true
                e.origin = origin
                table.insert(out, e)
            end
        end
    end

    if activeFilter ~= "friends" then take(FF.GetBoard(), "guild") end
    if activeFilter ~= "guild"   then take(FF.GetFriendBoard(), "friends") end
    return out
end

--- Ranks worth showing, highest first, without UNRANKED.
local function Divisions()
    local out = {}
    for _, rank in ipairs(RR.RANKS) do
        if rank.id ~= "UNRANKED" then table.insert(out, rank) end
    end
    return out
end

--- Where the player sits, so the division view opens on their own rank rather
--- than at one end of the ladder.
local function OwnIndex(divisions)
    local score = RR.GetScoreForUnit("player")
    local rank  = score and RR.GetRankForScore(score)
    for i, d in ipairs(divisions) do
        if rank and d.id == rank.id then return i end
    end
    return #divisions
end

--- Everyone grouped by rank, lowest first, dropping ranks nobody is in.
local function Columns(entries)
    local byRank = {}
    for _, e in ipairs(entries) do
        local id = e.rank and e.rank.id
        if id then
            byRank[id] = byRank[id] or {}
            table.insert(byRank[id], e)
        end
    end

    -- RR.RANKS runs highest first; the board reads the other way.
    local columns = {}
    for i = #RR.RANKS, 1, -1 do
        local rank = RR.RANKS[i]
        local members = byRank[rank.id]
        if members and rank.id ~= "UNRANKED" then
            table.sort(members, function(a, b) return a.score > b.score end)
            table.insert(columns, { rank = rank, members = members })
        end
    end
    return columns
end

-- ── Shared drawing ─────────────────────────────────────────────────────────

local function Cell(parent, template)
    local fs = parent:CreateFontString(nil, "OVERLAY", template or "GameFontNormalSmall")
    fs:SetJustifyH("LEFT")
    fs:SetWordWrap(false)
    fs:Hide()
    return fs
end

--- A cell is a pair of regions, not one string. Name and score have to line
--- up down the column, and a single font string cannot do that with a
--- proportional font - padding with spaces lands somewhere different on every
--- row.
local function MakeCell(parent)
    return { name = Cell(parent), score = Cell(parent) }
end

--- Places a cell inside a column, with the score right-aligned against the
--- rule so the digits stack instead of drifting with the name length.
local function PlaceIn(parent, cell, x, y, width)
    -- SetWidth throws on a negative number, and one throw inside a draw
    -- loop leaves half the rows placed and the other half wherever they
    -- were - which looks like a layout bug rather than an error.
    width = math.max(width or 0, 40)
    local nameW = math.floor(width * NAME_SHARE)

    cell.name:ClearAllPoints()
    cell.name:SetPoint("TOPLEFT", parent, "TOPLEFT", x, -y)
    cell.name:SetWidth(nameW)

    cell.score:ClearAllPoints()
    cell.score:SetPoint("TOPLEFT", parent, "TOPLEFT", x + nameW + RULE_GAP, -y)
    cell.score:SetWidth(width - nameW - RULE_GAP)
    cell.score:SetJustifyH("RIGHT")
end

local function Place(cell, x, y, width)
    PlaceIn(pane, cell, x, y, width)
end

local function PaintEntry(cell, e)
    cell.name:SetText(Ambiguate(e.name, "guild"))
    local rgb = e.isSelf and COLOR.self or COLOR[e.origin] or COLOR.guild
    cell.name:SetTextColor(rgb[1], rgb[2], rgb[3])
    cell.name:Show()

    cell.score:SetText(tostring(e.score))
    cell.score:SetTextColor(0.62, 0.62, 0.66)
    cell.score:Show()
end

--- One plain line per cell, used where a cell carries a message rather than
--- an entry.
local function PaintNote(cell, x, y, width, text)
    cell.name:ClearAllPoints()
    cell.name:SetPoint("TOPLEFT", pane, "TOPLEFT", x, -y)
    cell.name:SetWidth(width)
    cell.name:SetText(text)
    cell.name:SetTextColor(0.5, 0.5, 0.5)
    cell.name:Show()
    cell.score:Hide()
end

local function HideAll()
    for _, cell in ipairs(cells) do cell.name:Hide(); cell.score:Hide() end
    for _, rule in ipairs(rules) do rule:Hide() end
    upperLine:Hide(); lowerLine:Hide(); footer:Hide()
    title:Hide(); leftArrow:Hide(); rightArrow:Hide()
    if scroll then scroll:Hide() end
end

--- The vertical rule between name and score, drawn per column rather than
--- per row so it reads as one line down the table.
local function Rule(index, x, width, top, height)
    local rule = rules[index]
    if not rule then return end
    rule:ClearAllPoints()
    rule:SetPoint("TOPLEFT", pane, "TOPLEFT",
        x + math.floor(width * NAME_SHARE) + math.floor(RULE_GAP / 2), -top)
    rule:SetSize(1, height)
    rule:Show()
end

-- ── Division view ──────────────────────────────────────────────────────────

local function DrawDivision(entries)
    local divisions = Divisions()
    viewIndex = math.min(#divisions, math.max(1, viewIndex or OwnIndex(divisions)))
    local here  = divisions[viewIndex]
    local above = divisions[viewIndex - 1]

    local members = {}
    for _, e in ipairs(entries) do
        if e.rank and e.rank.id == here.id then table.insert(members, e) end
    end
    table.sort(members, function(a, b) return a.score > b.score end)

    title:SetText(here.name)
    title:SetTextColor(here.color.r, here.color.g, here.color.b)
    title:Show()

    -- Disabled rather than hidden at the ends: a button that vanishes moves
    -- the title, and the ladder having an end is worth showing.
    leftArrow:Show();  leftArrow:SetEnabled(viewIndex < #divisions)
    rightArrow:Show(); rightArrow:SetEnabled(viewIndex > 1)

    -- The two numbers that matter while standing in a division: what leaves it
    -- upwards, and what put you in it.
    if above then
        upperLine:SetText(string.format("|cff%02x%02x%02x%s|r  |cffaaaaaa%d and up|r",
            above.color.r * 255, above.color.g * 255, above.color.b * 255,
            above.name, above.minScore))
    else
        upperLine:SetText("|cffaaaaaaNothing above this|r")
    end
    upperLine:Show()

    -- Only as many columns as there are people to fill them, so a division
    -- with four members is a short centred block rather than three columns
    -- with two of them empty.
    local used  = math.max(1, math.min(DIV_COLS, math.ceil(#members / DIV_ROWS)))
    local left  = math.floor((pane:GetWidth() - used * DIV_COL_W) / 2)
    local slots = DIV_COLS * DIV_ROWS

    for c = 1, used do
        Rule(c, left + (c - 1) * DIV_COL_W, DIV_COL_W, LIST_Y - 2,
            math.min(DIV_ROWS, #members - (c - 1) * DIV_ROWS) * ROW_H)
    end

    for i = 1, slots do
        local cell = cells[i]
        local e    = members[i]
        -- Column-major, so reading down a column follows the ranking instead
        -- of jumping across the panel every name.
        local x = left + math.floor((i - 1) / DIV_ROWS) * DIV_COL_W
        local y = LIST_Y + ((i - 1) % DIV_ROWS) * ROW_H
        if e then
            Place(cell, x, y, DIV_COL_W - 10)
            PaintEntry(cell, e)
        elseif i == slots and #members > slots then
            PaintNote(cell, x, y, DIV_COL_W - 10,
                string.format("+%d more", #members - slots + 1))
        else
            cell.name:Hide(); cell.score:Hide()
        end
    end

    if #members == 0 then
        PaintNote(cells[1], PAD, LIST_Y, pane:GetWidth() - PAD * 2, "Nobody here.")
        cells[1].name:SetJustifyH("CENTER")
    else
        cells[1].name:SetJustifyH("LEFT")
    end

    local y = LIST_Y + DIV_ROWS * ROW_H + 8
    lowerLine:ClearAllPoints()
    lowerLine:SetPoint("TOPLEFT",  pane, "TOPLEFT",   PAD, -y)
    lowerLine:SetPoint("TOPRIGHT", pane, "TOPRIGHT", -PAD, -y)
    lowerLine:SetText(string.format("|cff%02x%02x%02x%s|r  |cffaaaaaastarts at %d|r",
        here.color.r * 255, here.color.g * 255, here.color.b * 255,
        here.name, here.minScore))
    lowerLine:Show()

    footer:ClearAllPoints()
    footer:SetPoint("TOPLEFT",  pane, "TOPLEFT",   PAD, -(y + 18))
    footer:SetPoint("TOPRIGHT", pane, "TOPRIGHT", -PAD, -(y + 18))
    footer:SetText(string.format("|cff888888%d here|r", #members))
    footer:Show()
end

-- ── Full view ──────────────────────────────────────────────────────────────

--- Rows are made as they are needed and kept. A guild can put two hundred
--- names in this list, and creating that many up front would cost every
--- player who never opens the full view.
local function AcquireRow(i)
    local row = scrollRows[i]
    if not row then
        row = {
            name  = Cell(scrollChild),
            score = Cell(scrollChild),
            head  = Cell(scrollChild, "GameFontNormal"),
            rule  = scrollChild:CreateTexture(nil, "ARTWORK"),
        }
        row.rule:SetColorTexture(0.30, 0.34, 0.42, 0.8)
        row.rule:Hide()
        scrollRows[i] = row
    end
    return row
end

local function HideRow(row)
    row.name:Hide(); row.score:Hide(); row.head:Hide(); row.rule:Hide()
end

--- Every rank stacked, best at the top, divided by a rule.
---
--- Vertical rather than side by side: a rank column is only as wide as the
--- window divided by however many ranks are occupied, which is not enough for
--- a name once the ladder spreads out. Stacked, every row has the full width
--- and the list simply gets longer, which is what the scroll bar is for.
local function DrawFull(entries)
    scroll:Show()

    -- The scroll child inherits its width from OnSizeChanged, which only
    -- fires when the size actually changes - and it does not on the first
    -- draw, because the frame already had its size from its anchors. Left at
    -- the placeholder width, every SetWidth below gets a negative number,
    -- which throws and aborts the draw half finished.
    local width = scroll:GetWidth()
    if not width or width < 80 then
        width = pane:GetWidth() - PAD * 2 - SCROLLBAR_W
    end
    scrollChild:SetWidth(width)
    width = width - PAD

    local columns = Columns(entries)
    local y       = 0
    local used    = 0

    if #columns == 0 then
        local row = AcquireRow(1)
        used = 1
        row.head:ClearAllPoints()
        row.head:SetPoint("TOPLEFT", scrollChild, "TOPLEFT", PAD, 0)
        row.head:SetWidth(width)
        row.head:SetText("Nobody to show yet.")
        row.head:SetTextColor(0.5, 0.5, 0.5)
        row.head:Show()
        y = ROW_H
    end

    -- Columns() runs lowest first, which reads right going left to right and
    -- wrong going top to bottom: a ladder is read from the top.
    for i = #columns, 1, -1 do
        local col = columns[i]
        used = used + 1
        local row = AcquireRow(used)

        if used > 1 then y = y + 8 end
        row.rule:ClearAllPoints()
        row.rule:SetPoint("TOPLEFT", scrollChild, "TOPLEFT", PAD, -y)
        row.rule:SetSize(width, 1)
        row.rule:Show()
        y = y + 6

        row.head:ClearAllPoints()
        row.head:SetPoint("TOPLEFT", scrollChild, "TOPLEFT", PAD, -y)
        row.head:SetWidth(width)
        row.head:SetText(string.format("%s  |cff777777%d|r",
            col.rank.name, #col.members))
        row.head:SetTextColor(col.rank.color.r, col.rank.color.g, col.rank.color.b)
        row.head:Show()
        y = y + ROW_H + 4

        for _, e in ipairs(col.members) do
            used = used + 1
            local entryRow = AcquireRow(used)
            PlaceIn(scrollChild, entryRow, PAD + 12, y, ROW_W)
            PaintEntry(entryRow, e)
            y = y + ROW_H
        end
        y = y + 6
    end

    for i = used + 1, #scrollRows do HideRow(scrollRows[i]) end
    scrollChild:SetHeight(math.max(y, 1))

    footer:ClearAllPoints()
    footer:SetPoint("BOTTOMLEFT",  pane, "BOTTOMLEFT",   PAD, 6)
    footer:SetPoint("BOTTOMRIGHT", pane, "BOTTOMRIGHT", -PAD, 6)
    footer:SetText(string.format("|cff888888%d shown across %d divisions|r",
        #entries, #columns))
    footer:Show()
end

-- ── Refresh ────────────────────────────────────────────────────────────────

function FF.RefreshPane()
    if not pane then return end
    HideAll()

    local entries = Collect()
    if activeMode == "full" then
        DrawFull(entries)
    else
        DrawDivision(entries)
    end
end

-- ── Build ──────────────────────────────────────────────────────────────────

local function Row(p, y, width, defs, store, onClick)
    local prev
    for _, def in ipairs(defs) do
        local b = CreateFrame("Button", nil, p, "UIPanelButtonTemplate")
        b:SetSize(width, 20)
        b:SetText(def.label)
        if prev then
            b:SetPoint("LEFT", prev, "RIGHT", 3, 0)
        else
            b:SetPoint("TOPLEFT", p, "TOPLEFT", PAD, -y)
        end
        b:SetScript("OnClick", function() onClick(def.id) end)
        store[def.id] = b
        prev = b
    end
end

local function Select(store, which)
    for id, b in pairs(store) do
        b:SetButtonState(id == which and "PUSHED" or "NORMAL", id == which)
    end
end

local function BuildPane(p)
    pane = p

    filterButtons, modeButtons = {}, {}

    Row(p, FILTER_Y, 58, {
        { id = "all",     label = "All" },
        { id = "guild",   label = "Guild" },
        { id = "friends", label = "Friends" },
    }, filterButtons, function(id)
        activeFilter = id
        Select(filterButtons, id)
        FF.RefreshPane()
    end)

    Row(p, MODE_Y, 74, {
        { id = "division", label = "Division" },
        { id = "full",     label = "Full" },
    }, modeButtons, function(id)
        activeMode = id
        Select(modeButtons, id)
        FF.RefreshPane()
    end)

    -- Arrows flank the division name, so stepping reads as moving along the
    -- ladder rather than as paging through a list.
    local function Step(delta)
        local divisions = Divisions()
        viewIndex = math.min(#divisions,
            math.max(1, (viewIndex or OwnIndex(divisions)) + delta))
        FF.RefreshPane()
    end

    leftArrow = CreateFrame("Button", nil, p, "UIPanelButtonTemplate")
    leftArrow:SetSize(26, 22)
    leftArrow:SetText("<")
    leftArrow:SetPoint("TOP", p, "TOP", -110, -(FILTER_Y - 2))
    -- Down the ladder is a higher index, since RANKS runs highest first.
    leftArrow:SetScript("OnClick", function() Step(1) end)

    rightArrow = CreateFrame("Button", nil, p, "UIPanelButtonTemplate")
    rightArrow:SetSize(26, 22)
    rightArrow:SetText(">")
    rightArrow:SetPoint("TOP", p, "TOP", 110, -(FILTER_Y - 2))
    rightArrow:SetScript("OnClick", function() Step(-1) end)

    title = p:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOP", p, "TOP", 0, -FILTER_Y)

    upperLine = Cell(p)
    upperLine:SetPoint("TOPLEFT",  p, "TOPLEFT",   PAD, -HEAD_Y)
    upperLine:SetPoint("TOPRIGHT", p, "TOPRIGHT", -PAD, -HEAD_Y)
    upperLine:SetJustifyH("CENTER")

    lowerLine = Cell(p); lowerLine:SetJustifyH("CENTER")
    footer    = Cell(p); footer:SetJustifyH("CENTER")

    -- One pool, sized for whichever view needs more. The two never draw at the
    -- same time, so sharing it costs nothing and halves the frames created.
    -- The full view scrolls: a guild can put two hundred names in one list,
    -- and there is no layout that fits that into 440px.
    scroll = CreateFrame("ScrollFrame", nil, p, "UIPanelScrollFrameTemplate")
    scroll:SetPoint("TOPLEFT",     p, "TOPLEFT",      PAD, -(MODE_Y + 26))
    scroll:SetPoint("BOTTOMRIGHT", p, "BOTTOMRIGHT", -(PAD + SCROLLBAR_W), 24)
    scroll:Hide()

    scrollChild = CreateFrame("Frame", nil, scroll)
    scrollChild:SetSize(pane and pane:GetWidth() or 600, 1)
    scroll:SetScrollChild(scrollChild)
    scroll:SetScript("OnSizeChanged", function(self, w)
        scrollChild:SetWidth(w)
    end)
    scrollRows = {}

    rules = {}
    for c = 1, #RR.RANKS do
        rules[c] = p:CreateTexture(nil, "ARTWORK")
        rules[c]:SetColorTexture(0.30, 0.34, 0.42, 0.7)
        rules[c]:Hide()
    end

    cells = {}
    for i = 1, DIV_COLS * DIV_ROWS do
        cells[i] = MakeCell(p)
    end

    viewIndex = OwnIndex(Divisions())
    Select(filterButtons, activeFilter)
    Select(modeButtons, activeMode)
    FF.RefreshPane()
end

-- ── Registration ───────────────────────────────────────────────────────────

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")
frame:SetScript("OnEvent", function()
    -- Before the player can have opened the window, which fixes its tabs.
    RR.RegisterTab({
        id      = "friends",
        label   = "Friends",
        title   = "Friends & Family",
        build   = BuildPane,
        refresh = function()
            -- Reopening lands on the player's own division again rather than
            -- wherever they last browsed to.
            viewIndex = OwnIndex(Divisions())
            FF.RefreshPane()
        end,
    })

    SLASH_RAIDERRANKEDFF1 = "/rrff"
    SlashCmdList["RAIDERRANKEDFF"] = function(msg)
        msg = strtrim(msg or ""):lower()

        if msg == "share" then
            RaiderRankedFriendsDB.share = not FF.Sharing()
            print(string.format("|cff00ccffRaiderRanked|r Score sharing: %s",
                FF.Sharing() and "|cff00ff00ON|r" or "|cffff0000OFF|r"))
            if FF.Sharing() then
                FF.BroadcastScore(true)
                FF.PollFriends()
            end

        elseif msg == "where" then
            FF.PrintPlacements()

        elseif msg == "chat" then
            FF.PrintBoard(20)

        elseif msg == "poll" then
            FF.RequestScores()
            FF.PollFriends()
            print("|cff00ccffRaiderRanked|r Asked the guild and your friends to report in.")

        elseif msg == "dbg" then
            -- What the fill-in actually sees. Guessing at this cost an evening
            -- once already: the field names were wrong and every lookup
            -- returned nothing without saying so.
            print("|cff00ccffRaiderRanked|r Friends & Family debug")
            print("  RaiderIO: " .. tostring(RaiderIO and RaiderIO.GetProfile ~= nil))
            print("  guild members: " .. tostring(GetNumGuildMembers()))
            local shown = 0
            for i = 1, (GetNumGuildMembers() or 0) do
                local name = GetGuildRosterInfo(i)
                local key  = FF.FullName(name)
                if key and shown < 5 then
                    shown = shown + 1
                    local ok, profile = pcall(RaiderIO.GetProfile, key)
                    local mkp = ok and type(profile) == "table"
                        and profile.mythicKeystoneProfile
                    print(string.format("    %-24s profile=%s  mkp=%s  score=%s",
                        key, tostring(ok and profile ~= nil), tostring(mkp ~= nil),
                        tostring(RR.ScoreFromRaiderIOProfile(ok and profile or nil))))
                end
            end

        else
            RR.OpenTab("friends")
        end
    end
end)
