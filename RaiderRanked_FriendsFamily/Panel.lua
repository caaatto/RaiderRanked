-- RaiderRanked Friends & Family: Panel.lua
-- The module's tab in the score history window, plus its slash command and
-- its one setting.

local ADDON_NAME, FF = ...

local RR = _G.RaiderRanked

local ROW_H       = 16
local MAX_ROWS    = 18
local PAD_LEFT    = 16
local PAD_TOP     = 34

local pane, header, placeLines, rows

-- ── Drawing ────────────────────────────────────────────────────────────────

local function Line(parent, index, x, y, template)
    local fs = parent:CreateFontString(nil, "OVERLAY", template or "GameFontNormalSmall")
    fs:SetPoint("TOPLEFT", parent, "TOPLEFT", x, y)
    fs:SetJustifyH("LEFT")
    return fs
end

--- Builds the pane once. Rows are created up front and reused, the way the
--- other panels in this window do it, so refreshing never allocates frames.
local function BuildPane(p)
    pane = p

    header = Line(p, 0, PAD_LEFT, -12, "GameFontNormal")
    header:SetText("")

    -- Placement block: the same score against every ladder that exists.
    placeLines = {}
    for i = 1, #RR.REGIONS * #RR.FACTIONS do
        placeLines[i] = Line(p, i, PAD_LEFT, -(PAD_TOP + (i - 1) * ROW_H))
        placeLines[i]:Hide()
    end

    rows = {}
    for i = 1, MAX_ROWS do
        rows[i] = Line(p, i, PAD_LEFT, 0)
        rows[i]:Hide()
    end
end

--- Where the guild list starts, below however many placement lines were drawn.
local function GuildTop(placementCount)
    return PAD_TOP + (placementCount + 1) * ROW_H + 8
end

local function RefreshPane()
    if not pane then return end

    -- Placements first: they are about the player, and the guild list below is
    -- about everyone else.
    local places, score = FF.GetPlacements()
    local shown = 0
    for i, fs in ipairs(placeLines) do
        local row = places[i]
        if row then
            shown = i
            fs:SetText(string.format("%s%-24s top %.2f%%|r",
                row.isActive and "|cffffffff" or "|cff777777",
                row.label, row.percentile))
            fs:Show()
        else
            fs:Hide()
        end
    end

    if score then
        header:SetText(string.format("|cff00ccffScore %d|r  |cff888888measured against every ladder|r", score))
    else
        header:SetText("|cff888888No score this season yet.|r")
    end

    -- Guild board.
    local entries, coverage = FF.GetBoard()
    local top = GuildTop(shown)

    local caption = rows[1]
    caption:ClearAllPoints()
    caption:SetPoint("TOPLEFT", pane, "TOPLEFT", PAD_LEFT, -top)
    if IsInGuild() then
        caption:SetText(string.format("|cff00ccff%s|r  |cff888888%d of %d members with a score|r",
            GetGuildInfo("player") or "Guild", coverage.scored, coverage.total))
    else
        caption:SetText("|cff888888Not in a guild.|r")
    end
    caption:Show()

    for i = 2, MAX_ROWS do
        local fs = rows[i]
        local e  = entries[i - 1]
        if e then
            fs:ClearAllPoints()
            fs:SetPoint("TOPLEFT", pane, "TOPLEFT", PAD_LEFT, -(top + (i - 1) * ROW_H))

            -- A cached figure is not a current one, and the date is the only
            -- thing that keeps the two apart on a board that mixes them.
            local note = ""
            if e.source == "cached" and e.ts then
                note = string.format("  |cff666666%dd ago|r",
                    math.floor((time() - e.ts) / 86400))
            elseif e.source == "raiderio" then
                note = "  |cff666666RaiderIO|r"
            end

            fs:SetText(string.format("%s%2d. %-20s %s %d%s|r",
                e.isSelf and "|cffffffff" or "|cffbbbbbb",
                i - 1, Ambiguate(e.name, "guild"),
                RR.GetRankDisplayName(e.rank, e.score, true), e.score, note))
            fs:Show()
        else
            fs:Hide()
        end
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
        refresh = RefreshPane,
    })

    SLASH_RAIDERRANKEDFF1 = "/rrff"
    SlashCmdList["RAIDERRANKEDFF"] = function(msg)
        msg = strtrim(msg or ""):lower()

        if msg == "share" then
            RaiderRankedFriendsDB.share = not FF.Sharing()
            print(string.format("|cff00ccffRaiderRanked|r Guild sharing: %s",
                FF.Sharing() and "|cff00ff00ON|r" or "|cffff0000OFF|r"))
            if FF.Sharing() then FF.BroadcastScore(true) end

        elseif msg == "where" then
            FF.PrintPlacements()

        elseif msg == "chat" then
            FF.PrintBoard(20)

        else
            RR.OpenTab("friends")
        end
    end
end)
