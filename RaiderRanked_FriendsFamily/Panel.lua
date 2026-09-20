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
local HEAD_Y   = 80      -- division bounds, or the column headers
local LIST_Y   = HEAD_Y + 22

local DIV_COLS, DIV_ROWS   = 3, 17   -- names inside one division
local FULL_ROWS            = 17      -- rows per rank column in the full view
local MIN_COL              = 62

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
local headers, cells, divider
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

local function Place(fs, x, y, width)
    fs:ClearAllPoints()
    fs:SetPoint("TOPLEFT", pane, "TOPLEFT", x, -y)
    fs:SetWidth(width)
end

local function PaintEntry(fs, e)
    fs:SetText(string.format("%s  |cff777777%d|r", Ambiguate(e.name, "guild"), e.score))
    local rgb = e.isSelf and COLOR.self or COLOR[e.origin] or COLOR.guild
    fs:SetTextColor(rgb[1], rgb[2], rgb[3])
    fs:Show()
end

local function HideAll()
    for _, fs in ipairs(cells) do fs:Hide() end
    for _, fs in ipairs(headers) do fs:Hide() end
    upperLine:Hide(); lowerLine:Hide(); footer:Hide()
    title:Hide(); leftArrow:Hide(); rightArrow:Hide()
    divider:Hide()
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

    local colW = (pane:GetWidth() - PAD * 2) / DIV_COLS
    local slots = DIV_COLS * DIV_ROWS
    for i = 1, slots do
        local fs = cells[i]
        local e  = members[i]
        -- Column-major, so reading down a column follows the ranking instead
        -- of jumping across the panel every name.
        local x = PAD + math.floor((i - 1) / DIV_ROWS) * colW
        local y = LIST_Y + ((i - 1) % DIV_ROWS) * ROW_H
        if e then
            Place(fs, x, y, colW - 8)
            PaintEntry(fs, e)
        elseif i == slots and #members > slots then
            Place(fs, x, y, colW - 8)
            fs:SetText(string.format("+%d more", #members - slots + 1))
            fs:SetTextColor(0.5, 0.5, 0.5)
            fs:Show()
        else
            fs:Hide()
        end
    end

    if #members == 0 then
        Place(cells[1], PAD, LIST_Y, pane:GetWidth() - PAD * 2)
        cells[1]:SetText("Nobody here.")
        cells[1]:SetTextColor(0.5, 0.5, 0.5)
        cells[1]:Show()
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

local function DrawFull(entries)
    local columns = Columns(entries)
    local usable  = pane:GetWidth() - PAD * 2
    local colW    = #columns > 0 and math.max(MIN_COL, usable / #columns) or usable

    divider:Show()

    if #columns == 0 then
        Place(cells[1], PAD, LIST_Y, usable)
        cells[1]:SetText("Nobody to show yet.")
        cells[1]:SetTextColor(0.5, 0.5, 0.5)
        cells[1]:Show()
        return
    end

    for c = 1, #headers do
        local col  = columns[c]
        local head = headers[c]
        if not col then
            head:Hide()
        else
            local x = PAD + (c - 1) * colW
            Place(head, x, HEAD_Y, colW - 6)
            head:SetText(string.format("%s  %d",
                RR.RANK_SHORT[col.rank.id] or col.rank.name, #col.members))
            head:SetTextColor(col.rank.color.r, col.rank.color.g, col.rank.color.b)
            head:Show()

            for r = 1, FULL_ROWS do
                local fs = cells[(c - 1) * FULL_ROWS + r]
                local e  = col.members[r]
                if e then
                    Place(fs, x, LIST_Y + (r - 1) * ROW_H, colW - 6)
                    PaintEntry(fs, e)
                elseif r == FULL_ROWS and #col.members > FULL_ROWS then
                    Place(fs, x, LIST_Y + (r - 1) * ROW_H, colW - 6)
                    fs:SetText(string.format("+%d", #col.members - FULL_ROWS + 1))
                    fs:SetTextColor(0.5, 0.5, 0.5)
                    fs:Show()
                else
                    fs:Hide()
                end
            end
        end
    end

    footer:ClearAllPoints()
    footer:SetPoint("TOPLEFT",  pane, "TOPLEFT",   PAD, -(LIST_Y + FULL_ROWS * ROW_H + 8))
    footer:SetPoint("TOPRIGHT", pane, "TOPRIGHT", -PAD, -(LIST_Y + FULL_ROWS * ROW_H + 8))
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

    divider = p:CreateTexture(nil, "ARTWORK")
    divider:SetColorTexture(0.25, 0.30, 0.38, 0.9)
    divider:SetHeight(1)
    divider:SetPoint("TOPLEFT",  p, "TOPLEFT",   PAD, -(HEAD_Y + 14))
    divider:SetPoint("TOPRIGHT", p, "TOPRIGHT", -PAD, -(HEAD_Y + 14))
    divider:Hide()

    -- One pool, sized for whichever view needs more. The two never draw at the
    -- same time, so sharing it costs nothing and halves the frames created.
    headers = {}
    for c = 1, #RR.RANKS do headers[c] = Cell(p) end

    cells = {}
    for i = 1, math.max(DIV_COLS * DIV_ROWS, #RR.RANKS * FULL_ROWS) do
        cells[i] = Cell(p)
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
