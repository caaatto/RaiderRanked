-- RaiderRanked Friends & Family: Panel.lua
-- The module's tab in the score history window, its slash command and its one
-- setting.
--
-- One division at a time, the way a ranked ladder reads: the rank you are in,
-- bounded above and below by the scores that leave it. Arrows step through the
-- other divisions. Showing every rank at once fits more on screen but answers
-- a different question - this view is about the division you are actually in
-- and what it would take to leave it.

local ADDON_NAME, FF = ...

local RR = _G.RaiderRanked

local PAD       = 14
local ROW_H     = 16
local SUB_COLS  = 3      -- names are short; three across use the width
local SUB_ROWS  = 13
local TITLE_Y   = 30
local UPPER_Y   = 58     -- the cutoff out of this division
local LIST_Y    = UPPER_Y + 22

-- Guild and friends are told apart by colour rather than by being separate
-- lists, so one look covers both. Self is white: it is the row being looked
-- for.
local COLOR = {
    guild   = { 0.35, 0.95, 0.50 },
    friends = { 0.45, 0.82, 1.00 },
    self    = { 1.00, 1.00, 1.00 },
}

local pane, filterButtons, title, leftArrow, rightArrow
local upperLine, lowerLine, footer, cells
local activeFilter = "all"
local viewIndex                     -- into RR.RANKS, highest first

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

--- Ranks worth stepping through, highest first, without UNRANKED.
local function Divisions()
    local out = {}
    for _, rank in ipairs(RR.RANKS) do
        if rank.id ~= "UNRANKED" then table.insert(out, rank) end
    end
    return out
end

--- Where the player sits, so the view opens on their own division rather than
--- at one end of the ladder.
local function OwnIndex(divisions)
    local score = RR.GetScoreForUnit("player")
    local rank  = score and RR.GetRankForScore(score)
    for i, d in ipairs(divisions) do
        if rank and d.id == rank.id then return i end
    end
    return #divisions  -- the bottom, which is where an unranked character is
end

-- ── Drawing ────────────────────────────────────────────────────────────────

local function Cell(parent, template)
    local fs = parent:CreateFontString(nil, "OVERLAY", template or "GameFontNormalSmall")
    fs:SetJustifyH("LEFT")
    fs:SetWordWrap(false)
    fs:Hide()
    return fs
end

local function Step(delta)
    local divisions = Divisions()
    viewIndex = math.min(#divisions, math.max(1, (viewIndex or OwnIndex(divisions)) + delta))
    FF.RefreshPane()
end

local function SetFilter(which)
    activeFilter = which
    for id, b in pairs(filterButtons) do
        b:SetButtonState(id == which and "PUSHED" or "NORMAL", id == which)
    end
    FF.RefreshPane()
end

local function BuildPane(p)
    pane = p

    -- Arrows flank the division name, so stepping reads as moving along the
    -- ladder rather than as paging through a list.
    leftArrow = CreateFrame("Button", nil, p, "UIPanelButtonTemplate")
    leftArrow:SetSize(26, 22)
    leftArrow:SetText("<")
    leftArrow:SetPoint("TOP", p, "TOP", -110, -(TITLE_Y - 4))
    -- Down the ladder is a higher index, since RANKS runs highest first.
    leftArrow:SetScript("OnClick", function() Step(1) end)

    rightArrow = CreateFrame("Button", nil, p, "UIPanelButtonTemplate")
    rightArrow:SetSize(26, 22)
    rightArrow:SetText(">")
    rightArrow:SetPoint("TOP", p, "TOP", 110, -(TITLE_Y - 4))
    rightArrow:SetScript("OnClick", function() Step(-1) end)

    title = p:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOP", p, "TOP", 0, -TITLE_Y)

    filterButtons = {}
    local prev
    for _, def in ipairs({ { id = "all",     label = "All" },
                           { id = "guild",   label = "Guild" },
                           { id = "friends", label = "Friends" } }) do
        local b = CreateFrame("Button", nil, p, "UIPanelButtonTemplate")
        b:SetSize(58, 20)
        b:SetText(def.label)
        if prev then
            b:SetPoint("LEFT", prev, "RIGHT", 3, 0)
        else
            b:SetPoint("TOPLEFT", p, "TOPLEFT", PAD, -(TITLE_Y - 2))
        end
        b:SetScript("OnClick", function() SetFilter(def.id) end)
        filterButtons[def.id] = b
        prev = b
    end

    upperLine = Cell(p, "GameFontNormalSmall")
    upperLine:SetPoint("TOPLEFT", p, "TOPLEFT", PAD, -UPPER_Y)
    upperLine:SetPoint("TOPRIGHT", p, "TOPRIGHT", -PAD, -UPPER_Y)
    upperLine:SetJustifyH("CENTER")

    lowerLine = Cell(p, "GameFontNormalSmall")
    lowerLine:SetJustifyH("CENTER")

    footer = Cell(p, "GameFontNormalSmall")
    footer:SetJustifyH("CENTER")

    cells = {}
    for i = 1, SUB_COLS * SUB_ROWS do
        cells[i] = Cell(p)
    end

    viewIndex = OwnIndex(Divisions())
    SetFilter(activeFilter)
end

--- The boundary lines. Above is what it takes to leave this division upwards,
--- below is the score that put you in it - the two numbers that actually
--- matter while standing in it.
local function SetBounds(divisions, index, members)
    local here  = divisions[index]
    local above = divisions[index - 1]

    if above then
        upperLine:SetText(string.format("|cff%02x%02x%02x%s|r  |cffaaaaaa%d and up|r",
            above.color.r * 255, above.color.g * 255, above.color.b * 255,
            above.name, above.minScore))
    else
        upperLine:SetText("|cffaaaaaaNothing above this|r")
    end
    upperLine:Show()

    local y = LIST_Y + SUB_ROWS * ROW_H + 10
    lowerLine:ClearAllPoints()
    lowerLine:SetPoint("TOPLEFT", pane, "TOPLEFT", PAD, -y)
    lowerLine:SetPoint("TOPRIGHT", pane, "TOPRIGHT", -PAD, -y)
    lowerLine:SetText(string.format("|cff%02x%02x%02x%s|r  |cffaaaaaastarts at %d|r",
        here.color.r * 255, here.color.g * 255, here.color.b * 255,
        here.name, here.minScore))
    lowerLine:Show()

    footer:ClearAllPoints()
    footer:SetPoint("TOPLEFT", pane, "TOPLEFT", PAD, -(y + 20))
    footer:SetPoint("TOPRIGHT", pane, "TOPRIGHT", -PAD, -(y + 20))
    footer:SetText(string.format("|cff888888%d here|r", #members))
    footer:Show()
end

function FF.RefreshPane()
    if not pane then return end

    local divisions = Divisions()
    viewIndex = viewIndex or OwnIndex(divisions)
    local here = divisions[viewIndex]

    local members = {}
    for _, e in ipairs(Collect()) do
        if e.rank and e.rank.id == here.id then table.insert(members, e) end
    end
    table.sort(members, function(a, b) return a.score > b.score end)

    title:SetText(here.name)
    title:SetTextColor(here.color.r, here.color.g, here.color.b)

    -- Disabled rather than hidden at the ends: a button that vanishes moves
    -- the title, and the ladder having an end is worth showing.
    leftArrow:SetEnabled(viewIndex < #divisions)
    rightArrow:SetEnabled(viewIndex > 1)

    SetBounds(divisions, viewIndex, members)

    local colW = (pane:GetWidth() - PAD * 2) / SUB_COLS
    for i, fs in ipairs(cells) do
        local e = members[i]
        if e then
            -- Column-major, so reading down a column follows the ranking
            -- instead of jumping across the panel every name.
            local c = math.floor((i - 1) / SUB_ROWS)
            local r = (i - 1) % SUB_ROWS
            fs:ClearAllPoints()
            fs:SetPoint("TOPLEFT", pane, "TOPLEFT",
                PAD + c * colW, -(LIST_Y + r * ROW_H))
            fs:SetWidth(colW - 8)
            fs:SetText(string.format("%s  |cff777777%d|r",
                Ambiguate(e.name, "guild"), e.score))

            local rgb = e.isSelf and COLOR.self or COLOR[e.origin] or COLOR.guild
            fs:SetTextColor(rgb[1], rgb[2], rgb[3])
            fs:Show()
        elseif i == #cells and #members > #cells then
            fs:ClearAllPoints()
            fs:SetPoint("TOPLEFT", pane, "TOPLEFT",
                PAD + (SUB_COLS - 1) * colW, -(LIST_Y + (SUB_ROWS - 1) * ROW_H))
            fs:SetWidth(colW - 8)
            fs:SetText(string.format("+%d more", #members - #cells + 1))
            fs:SetTextColor(0.5, 0.5, 0.5)
            fs:Show()
        else
            fs:Hide()
        end
    end

    if #members == 0 then
        cells[1]:ClearAllPoints()
        cells[1]:SetPoint("TOPLEFT", pane, "TOPLEFT", PAD, -LIST_Y)
        cells[1]:SetWidth(pane:GetWidth() - PAD * 2)
        cells[1]:SetText("Nobody here.")
        cells[1]:SetTextColor(0.5, 0.5, 0.5)
        cells[1]:Show()
    end
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
