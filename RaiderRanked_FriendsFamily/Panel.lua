-- RaiderRanked Friends & Family: Panel.lua
-- The module's tab in the score history window, its slash command and its one
-- setting.
--
-- The board is laid out as one column per rank, ascending left to right, with
-- everyone standing in the column they belong to. That shape answers the
-- question the list form could not: where the field actually sits. A sorted
-- list says who is ahead; columns say that eleven people are stuck in Gold and
-- two made it to Diamond.
--
-- Only ranks with somebody in them get a column. Ten columns across 680px
-- leaves 68px each, which is not enough for a name, and most guilds do not
-- span the whole ladder anyway.

local ADDON_NAME, FF = ...

local RR = _G.RaiderRanked

local PAD      = 12
local ROW_H    = 15
local HEAD_Y   = 58     -- below the window title and the filter row
local LIST_Y   = HEAD_Y + 20
local MAX_ROWS = 20
local MIN_COL  = 62

-- Guild and friends are told apart by colour rather than by being separate
-- lists, so one look covers both. Self is white because it is the one row
-- being looked for.
local COLOR = {
    guild   = { 0.35, 0.95, 0.50 },
    friends = { 0.45, 0.82, 1.00 },
    self    = { 1.00, 1.00, 1.00 },
}

local pane, filterButtons, caption, headers, cells, divider
local activeFilter = "all"

-- ── Data ───────────────────────────────────────────────────────────────────

--- Everyone the filter allows, tagged with where they came from.
---
--- A character in the guild who is also a friend appears once, as guild: the
--- guild figure is the one that came with a roster behind it.
local function Collect()
    local out, seen = {}, {}

    local function take(entries, origin)
        for _, e in ipairs(entries) do
            if not seen[e.name] then
                seen[e.name] = true
                e.origin = origin
                table.insert(out, e)
            end
        end
    end

    if activeFilter ~= "friends" then
        local guildEntries = FF.GetBoard()
        take(guildEntries, "guild")
    end
    if activeFilter ~= "guild" then
        local friendEntries = FF.GetFriendBoard()
        take(friendEntries, "friends")
    end

    return out
end

--- Groups them into columns, lowest rank first, dropping ranks nobody is in.
---@return table columns  { {rank, members} }
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

-- ── Drawing ────────────────────────────────────────────────────────────────

local function Cell(parent)
    local fs = parent:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    fs:SetJustifyH("LEFT")
    -- Truncated rather than wrapped: a name that runs onto a second line would
    -- push every row below it out of alignment with the next column.
    fs:SetWordWrap(false)
    fs:Hide()
    return fs
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

    filterButtons = {}
    local prev
    for _, def in ipairs({ { id = "all",     label = "All" },
                           { id = "guild",   label = "Guild" },
                           { id = "friends", label = "Friends" } }) do
        local b = CreateFrame("Button", nil, p, "UIPanelButtonTemplate")
        b:SetSize(64, 20)
        b:SetText(def.label)
        if prev then
            b:SetPoint("LEFT", prev, "RIGHT", 4, 0)
        else
            b:SetPoint("TOPLEFT", p, "TOPLEFT", PAD, -26)
        end
        b:SetScript("OnClick", function() SetFilter(def.id) end)
        filterButtons[def.id] = b
        prev = b
    end

    caption = p:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    caption:SetPoint("TOPRIGHT", p, "TOPRIGHT", -PAD, -30)
    caption:SetJustifyH("RIGHT")

    divider = p:CreateTexture(nil, "ARTWORK")
    divider:SetColorTexture(0.25, 0.30, 0.38, 0.9)
    divider:SetHeight(1)
    divider:SetPoint("TOPLEFT", p, "TOPLEFT", PAD, -(HEAD_Y + 14))
    divider:SetPoint("TOPRIGHT", p, "TOPRIGHT", -PAD, -(HEAD_Y + 14))

    headers, cells = {}, {}
    for c = 1, #RR.RANKS do
        headers[c] = Cell(p)
        cells[c] = {}
        for r = 1, MAX_ROWS do
            cells[c][r] = Cell(p)
        end
    end

    SetFilter(activeFilter)
end

function FF.RefreshPane()
    if not pane then return end

    local entries = Collect()
    local columns = Columns(entries)

    local usable = pane:GetWidth() - PAD * 2
    local colW   = #columns > 0 and math.max(MIN_COL, usable / #columns) or usable

    local guildCount, friendCount = 0, 0
    for _, e in ipairs(entries) do
        if e.origin == "guild" then guildCount = guildCount + 1
        else friendCount = friendCount + 1 end
    end
    caption:SetText(string.format(
        "|cff59f280%d guild|r   |cff73d1ff%d friends|r", guildCount, friendCount))

    for c = 1, #headers do
        local col = columns[c]
        local head = headers[c]

        if col then
            local x = PAD + (c - 1) * colW
            head:ClearAllPoints()
            head:SetPoint("TOPLEFT", pane, "TOPLEFT", x, -HEAD_Y)
            head:SetWidth(colW - 6)
            head:SetText(string.format("%s  %d",
                RR.RANK_SHORT[col.rank.id] or col.rank.name,
                #col.members))
            head:SetTextColor(col.rank.color.r, col.rank.color.g, col.rank.color.b)
            head:Show()

            for r = 1, MAX_ROWS do
                local cell = cells[c][r]
                local e    = col.members[r]
                if e then
                    cell:ClearAllPoints()
                    cell:SetPoint("TOPLEFT", pane, "TOPLEFT", x, -(LIST_Y + (r - 1) * ROW_H))
                    cell:SetWidth(colW - 6)

                    -- The score goes with the name rather than in a column of
                    -- its own: inside one rank the spread is small, and a
                    -- second column would cost the width the names need.
                    cell:SetText(string.format("%s  |cff777777%d|r",
                        Ambiguate(e.name, "guild"), e.score))

                    local col3 = e.isSelf and COLOR.self or COLOR[e.origin] or COLOR.guild
                    cell:SetTextColor(col3[1], col3[2], col3[3])
                    cell:Show()
                elseif r == MAX_ROWS and #col.members > MAX_ROWS then
                    cell:ClearAllPoints()
                    cell:SetPoint("TOPLEFT", pane, "TOPLEFT", x, -(LIST_Y + (r - 1) * ROW_H))
                    cell:SetWidth(colW - 6)
                    cell:SetText(string.format("+%d", #col.members - MAX_ROWS + 1))
                    cell:SetTextColor(0.5, 0.5, 0.5)
                    cell:Show()
                else
                    cell:Hide()
                end
            end
        else
            head:Hide()
            for r = 1, MAX_ROWS do cells[c][r]:Hide() end
        end
    end

    if #columns == 0 then
        headers[1]:ClearAllPoints()
        headers[1]:SetPoint("TOPLEFT", pane, "TOPLEFT", PAD, -LIST_Y)
        headers[1]:SetWidth(usable)
        headers[1]:SetText("Nobody to show yet. Guildmates and friends running "
            .. "this module report in on their own; with RaiderIO installed the "
            .. "rest are filled in.")
        headers[1]:SetTextColor(0.6, 0.6, 0.6)
        headers[1]:SetWordWrap(true)
        headers[1]:Show()
    else
        headers[1]:SetWordWrap(false)
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
        refresh = function() FF.RefreshPane() end,
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
