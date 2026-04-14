-- RaiderRanked: ScoreHistory.lua
-- Tracks M+ score over time and renders a multi-character area graph
-- with rank-coloured bands.

local ADDON_NAME, RR = ...

local MAX_ENTRIES      = 500
local GRAPH_W          = 680
local GRAPH_H          = 440
local PLOT_PAD_LEFT    = 70
local PLOT_PAD_BOTTOM  = 32
local PLOT_PAD_TOP     = 14
local PLOT_PAD_RIGHT   = 50
local MAX_VISIBLE_PTS  = 100
local LINE_THICKNESS   = 2
local DOT_SIZE         = 6

-- Abbreviated rank names for the Y-axis labels (shared with RankSystem).
local RANK_SHORT = RR.RANK_SHORT

-- Distinct colours for alt characters (current char always uses rank colour).
local ALT_COLORS = {
    { r = 0.40, g = 0.75, b = 1.00 },  -- light blue
    { r = 1.00, g = 0.55, b = 0.20 },  -- orange
    { r = 0.65, g = 1.00, b = 0.45 },  -- lime
    { r = 1.00, g = 0.40, b = 0.70 },  -- pink
    { r = 0.70, g = 0.50, b = 1.00 },  -- purple
    { r = 1.00, g = 1.00, b = 0.35 },  -- yellow
    { r = 0.40, g = 1.00, b = 0.85 },  -- teal
    { r = 1.00, g = 0.35, b = 0.35 },  -- red
}

-- MN Season 1 start: 25 March 2026, 04:00 UTC (EU reset).
local SEASON_START = time({ year = 2026, month = 3, day = 25, hour = 4, min = 0, sec = 0 })

-- ── Helpers ─────────────────────────────────────────────────────────────────

local function CharKey()
    local name  = UnitName("player")
    local realm = GetNormalizedRealmName() or ""
    if not name then return nil end
    return name .. "-" .. realm
end

local function ShortCharName(key)
    -- "Name-Realm" → "Name"
    return key and key:match("^([^%-]+)") or key
end

-- ── Initialisation ──────────────────────────────────────────────────────────

function RR:InitScoreHistory()
    -- Account-wide history lives in RaiderRankedDB.charHistory[key].
    if not self.db.charHistory then
        self.db.charHistory = {}
    end

    -- Migrate old per-character data if present.
    if RaiderRankedCharDB and RaiderRankedCharDB.scoreHistory
       and #RaiderRankedCharDB.scoreHistory > 0 then
        local key = CharKey()
        if key and not self.db.charHistory[key] then
            self.db.charHistory[key] = RaiderRankedCharDB.scoreHistory
        end
        RaiderRankedCharDB.scoreHistory = nil
    end

    -- Clean up empty or malformed entries (e.g. "Name-" without realm).
    for k, history in pairs(self.db.charHistory) do
        if not history or #history == 0 or k:match("%-$") then
            self.db.charHistory[k] = nil
        end
    end

    -- Ensure current char has an entry.
    local key = CharKey()
    if key and not self.db.charHistory[key] then
        self.db.charHistory[key] = {}
    end

    -- Visible chars: default to only current char.
    if not self.db.historyVisible then
        self.db.historyVisible = {}
    end
    if key then
        if self.db.historyVisible[key] == nil then
            self.db.historyVisible[key] = true
        end
    end
end

-- ── Snapshot Recording ──────────────────────────────────────────────────────

local function ThresholdsEqual(a, b)
    if not a or not b then return false end
    for id, val in pairs(a) do
        if b[id] ~= val then return false end
    end
    for id, val in pairs(b) do
        if a[id] ~= val then return false end
    end
    return true
end

local function CopyThresholds()
    if not RR.db or not RR.db.thresholds then return nil end
    local t = {}
    for id, val in pairs(RR.db.thresholds) do
        t[id] = val
    end
    return t
end

local function EnsureSeasonStart(history)
    if #history == 0 then
        table.insert(history, { SEASON_START, 0 })
    elseif history[1][1] > SEASON_START then
        table.insert(history, 1, { SEASON_START, 0 })
    end
end

function RR:RecordScoreSnapshot()
    local key = CharKey()
    if not key or not self.db or not self.db.charHistory then return end
    local score = self.playerScore
    if not score then return end

    local history = self.db.charHistory[key]
    if not history then
        history = {}
        self.db.charHistory[key] = history
    end
    EnsureSeasonStart(history)

    local now = time()
    local currentThresholds = CopyThresholds()

    -- Find the last stored thresholds (walk backward for delta compression).
    local lastThresholds
    for i = #history, 1, -1 do
        if history[i][3] then
            lastThresholds = history[i][3]
            break
        end
    end
    local thresholdsChanged = not ThresholdsEqual(currentThresholds, lastThresholds)

    -- Only record when score or thresholds actually changed.
    local last = history[#history]
    if last and last[2] == score and not thresholdsChanged then
        return
    end

    local entry = { now, score }
    if thresholdsChanged or #history == 0 then
        entry[3] = currentThresholds
    end
    table.insert(history, entry)

    -- Trim to max.
    while #history > MAX_ENTRIES do
        table.remove(history, 1)
    end

    -- Refresh graph if visible.
    if self.historyFrame and self.historyFrame:IsShown() then
        self:RefreshHistoryGraph()
    end
end

-- ── Downsampling (Largest Triangle Three Bucket) ────────────────────────────

local function LTTB(data, threshold)
    local n = #data
    if n <= threshold then return data end

    local sampled = { data[1] }
    local bucketSize = (n - 2) / (threshold - 2)
    local a = 1

    for i = 1, threshold - 2 do
        local bucketStart = math.floor((i - 1) * bucketSize) + 2
        local bucketEnd   = math.floor(i * bucketSize) + 1
        if bucketEnd > n - 1 then bucketEnd = n - 1 end

        local nextStart = math.floor(i * bucketSize) + 2
        local nextEnd   = math.floor((i + 1) * bucketSize) + 1
        if nextEnd > n then nextEnd = n end

        local avgX, avgY = 0, 0
        local nextCount = nextEnd - nextStart + 1
        for j = nextStart, nextEnd do
            avgX = avgX + data[j][1]
            avgY = avgY + data[j][2]
        end
        avgX = avgX / nextCount
        avgY = avgY / nextCount

        local maxArea = -1
        local maxIdx  = bucketStart
        local ax, ay  = data[a][1], data[a][2]
        for j = bucketStart, bucketEnd do
            local area = math.abs((ax - avgX) * (data[j][2] - ay)
                                - (ax - data[j][1]) * (avgY - ay))
            if area > maxArea then
                maxArea = area
                maxIdx  = j
            end
        end
        table.insert(sampled, data[maxIdx])
        a = maxIdx
    end

    table.insert(sampled, data[n])
    return sampled
end

-- ── Graph Frame ─────────────────────────────────────────────────────────────

local historyFrame
local plotArea
local charToggleArea  -- frame holding character toggle buttons

-- Object pools
local bandPool   = {}
local fillPool   = {}
local linePool   = {}
local dotPool    = {}
local dotFrames  = {}
local labelPool  = {}
local gridPool   = {}
local togglePool = {}

local function AcquireTexture(pool, parent, layer, sublevel)
    for _, tex in ipairs(pool) do
        if not tex._inUse then
            tex._inUse = true
            tex:SetParent(parent)
            tex:Show()
            return tex
        end
    end
    local tex = parent:CreateTexture(nil, layer or "ARTWORK", nil, sublevel or 0)
    tex._inUse = true
    table.insert(pool, tex)
    return tex
end

local function AcquireFrame(pool, parent)
    for _, f in ipairs(pool) do
        if not f._inUse then
            f._inUse = true
            f:SetParent(parent)
            f:Show()
            return f
        end
    end
    local f = CreateFrame("Frame", nil, parent)
    f._inUse = true
    f:EnableMouse(true)
    table.insert(pool, f)
    return f
end

local function AcquireLabel(pool, parent)
    for _, fs in ipairs(pool) do
        if not fs._inUse then
            fs._inUse = true
            fs:Show()
            return fs
        end
    end
    local fs = parent:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    fs._inUse = true
    table.insert(pool, fs)
    return fs
end

local function ReleasePool(pool)
    for _, obj in ipairs(pool) do
        obj._inUse = false
        obj:Hide()
    end
end

local function ReleaseAll()
    ReleasePool(bandPool)
    ReleasePool(fillPool)
    ReleasePool(linePool)
    ReleasePool(dotPool)
    ReleasePool(dotFrames)
    ReleasePool(labelPool)
    ReleasePool(gridPool)
end

-- ── Character Dropdown ──────────────────────────────────────────────────────

local dropdownMenu

local function BuildCharDropdown()
    if not charToggleArea or not RR.db or not RR.db.charHistory then return end

    local currentKey = CharKey()
    local visible = RR.db.historyVisible or {}

    -- Count how many are visible for the button label.
    local visCount = 0
    for key, on in pairs(visible) do
        if on and RR.db.charHistory[key] then visCount = visCount + 1 end
    end

    -- Create or update the dropdown button.
    if not charToggleArea.btn then
        local btn = CreateFrame("Button", nil, charToggleArea, "UIPanelButtonTemplate")
        btn:SetHeight(20)
        btn:SetPoint("LEFT", charToggleArea, "LEFT", 0, 0)
        charToggleArea.btn = btn
    end
    local btn = charToggleArea.btn
    if visCount <= 1 then
        btn:SetText("Characters")
    else
        btn:SetText("Characters (" .. visCount .. ")")
    end
    btn:SetWidth(math.max(90, btn:GetFontString():GetStringWidth() + 24))

    btn:SetScript("OnClick", function(self)
        -- Build a simple dropdown menu frame.
        if not dropdownMenu then
            dropdownMenu = CreateFrame("Frame", "RRHistoryCharMenu", UIParent, "BackdropTemplate")
            dropdownMenu:SetFrameStrata("DIALOG")
            dropdownMenu:SetBackdrop({
                bgFile   = "Interface\\DialogFrame\\UI-DialogBox-Background",
                edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
                tile = true, tileSize = 16, edgeSize = 16,
                insets = { left = 4, right = 4, top = 4, bottom = 4 },
            })
            dropdownMenu:SetBackdropColor(0, 0, 0, 1)
            dropdownMenu:EnableMouse(true)
            dropdownMenu:Hide()
            -- Close when clicking elsewhere.
            dropdownMenu:SetScript("OnShow", function()
                dropdownMenu:SetPropagateKeyboardInput(true)
            end)
        end

        if dropdownMenu:IsShown() then
            dropdownMenu:Hide()
            return
        end

        -- Clear old children.
        if dropdownMenu.rows then
            for _, row in ipairs(dropdownMenu.rows) do row:Hide() end
        end
        dropdownMenu.rows = {}

        local keys = {}
        for k, history in pairs(RR.db.charHistory) do
            if history and #history > 0 then
                table.insert(keys, k)
            end
        end
        table.sort(keys, function(a, b)
            if a == currentKey then return true end
            if b == currentKey then return false end
            return a < b
        end)

        local altIdx = 0
        local rowH = 22
        for i, key in ipairs(keys) do
            local row = CreateFrame("Button", nil, dropdownMenu)
            row:SetSize(150, rowH)
            row:SetPoint("TOPLEFT", dropdownMenu, "TOPLEFT", 8, -(8 + (i-1) * rowH))

            local isOn = visible[key]
            local isActive = (key == currentKey)

            -- Checkbox indicator.
            local check = row:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
            check:SetPoint("LEFT", row, "LEFT", 0, 0)
            check:SetText(isOn and "|cff00ff00[x]|r" or "|cff666666[ ]|r")

            -- Char name.
            local label = row:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
            label:SetPoint("LEFT", check, "RIGHT", 4, 0)
            local shortName = ShortCharName(key)

            local c
            if isActive then
                c = { r = 0.2, g = 1.0, b = 0.4 }
            else
                c = ALT_COLORS[(altIdx % #ALT_COLORS) + 1]
                altIdx = altIdx + 1
            end

            if isOn then
                label:SetText(string.format("|cff%02x%02x%02x%s|r",
                    math.floor(c.r*255), math.floor(c.g*255), math.floor(c.b*255),
                    shortName))
            else
                label:SetText("|cff666666" .. shortName .. "|r")
            end

            row:SetScript("OnClick", function()
                RR.db.historyVisible[key] = not RR.db.historyVisible[key]
                dropdownMenu:Hide()
                BuildCharDropdown()
                RR:RefreshHistoryGraph()
            end)

            row:SetScript("OnEnter", function(self)
                self:SetAlpha(0.7)
            end)
            row:SetScript("OnLeave", function(self)
                self:SetAlpha(1)
            end)

            table.insert(dropdownMenu.rows, row)
        end

        local menuH = 16 + #keys * rowH
        dropdownMenu:SetSize(166, menuH)
        dropdownMenu:ClearAllPoints()
        dropdownMenu:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 0, -2)
        dropdownMenu:Show()
    end)
end

-- ── Graph Creation ──────────────────────────────────────────────────────────

local function CreateHistoryFrame()
    local f = CreateFrame("Frame", "RaiderRankedHistoryFrame", UIParent, "BackdropTemplate")
    f:SetSize(GRAPH_W, GRAPH_H)
    f:SetFrameStrata("HIGH")
    f:SetBackdrop({
        bgFile   = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true, tileSize = 16, edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 },
    })
    f:SetBackdropColor(0, 0, 0, 0.92)

    local pos = RR.db.historyPosition or { point = "CENTER", x = 0, y = 0 }
    f:SetPoint(pos.point, UIParent, pos.point, pos.x, pos.y)
    f:SetMovable(true)
    f:EnableMouse(true)
    f:RegisterForDrag("LeftButton")
    f:SetScript("OnDragStart", f.StartMoving)
    f:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
        local point, _, _, x, y = self:GetPoint()
        RR.db.historyPosition = { point = point, x = x, y = y }
    end)

    -- Title
    local title = f:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOP", f, "TOP", 0, -10)
    title:SetText("|cff00ccffScore History|r")

    -- Close button
    local close = CreateFrame("Button", nil, f, "UIPanelCloseButton")
    close:SetPoint("TOPRIGHT", f, "TOPRIGHT", -2, -2)

    -- Time range buttons
    local ranges = {
        { label = "3d",     days = 3 },
        { label = "7d",     days = 7 },
        { label = "14d",    days = 14 },
        { label = "30d",    days = 30 },
        { label = "Season", days = 0 },
    }
    f.activeRange = 0

    local prevBtn
    for _, r in ipairs(ranges) do
        local btn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
        btn:SetSize(44, 20)
        btn:SetText(r.label)
        if prevBtn then
            btn:SetPoint("LEFT", prevBtn, "RIGHT", 4, 0)
        else
            btn:SetPoint("TOPLEFT", f, "TOPLEFT", 12, -28)
        end
        btn:SetScript("OnClick", function()
            f.activeRange = r.days
            RR:RefreshHistoryGraph()
        end)
        prevBtn = btn
    end

    -- Character toggle area (to the right of range buttons).
    charToggleArea = CreateFrame("Frame", nil, f)
    charToggleArea:SetHeight(20)
    charToggleArea:SetPoint("LEFT", prevBtn, "RIGHT", 12, 0)
    charToggleArea:SetPoint("RIGHT", f, "RIGHT", -30, 0)

    -- Plot area
    plotArea = CreateFrame("Frame", nil, f)
    plotArea:SetPoint("TOPLEFT", f, "TOPLEFT", PLOT_PAD_LEFT, -(PLOT_PAD_TOP + 52))
    plotArea:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -PLOT_PAD_RIGHT, PLOT_PAD_BOTTOM)


    f:Hide()
    return f
end

-- ── Graph Rendering ─────────────────────────────────────────────────────────

local function GetThresholdsAtIndex(history, idx)
    for i = idx, 1, -1 do
        if history[i][3] then
            return history[i][3]
        end
    end
    return RR.db and RR.db.thresholds or {}
end

-- Solo mode: filled area chart in the current rank's colour.
local function DrawSoloChart(visData, MapX, MapY, rankColor)
    local c = rankColor
    for i = 1, #visData do
        local d = visData[i]
        local x = MapX(d[1])
        local y = MapY(d[2])

        -- Filled area columns between this point and the next.
        if i < #visData then
            local nd = visData[i + 1]
            local nx = MapX(nd[1])
            local ny = MapY(nd[2])
            local segW = nx - x
            local cols = math.max(1, math.floor(segW / 2))
            if cols > 50 then cols = 50 end

            for col = 0, cols - 1 do
                local t0 = col / cols
                local t1 = (col + 1) / cols
                local lx = x + segW * t0
                local colH = y + (ny - y) * ((t0 + t1) / 2)
                local colW = segW / cols
                if colW < 0.5 then colW = 0.5 end

                local fill = AcquireTexture(fillPool, plotArea, "ARTWORK", 0)
                fill:ClearAllPoints()
                fill:SetPoint("BOTTOMLEFT", plotArea, "BOTTOMLEFT", lx, 0)
                fill:SetSize(colW + 0.5, math.max(1, colH))
                fill:SetColorTexture(c.r, c.g, c.b, 1)
                fill:SetGradient("VERTICAL",
                    CreateColor(c.r * 0.08, c.g * 0.08, c.b * 0.08, 1),
                    CreateColor(c.r * 0.55, c.g * 0.55, c.b * 0.55, 1))

                local edge = AcquireTexture(linePool, plotArea, "ARTWORK", 1)
                edge:ClearAllPoints()
                edge:SetPoint("BOTTOMLEFT", plotArea, "BOTTOMLEFT", lx, colH - 1)
                edge:SetSize(colW + 0.5, LINE_THICKNESS)
                edge:SetColorTexture(c.r, c.g, c.b, 0.9)
            end
        end

        -- Dot + tooltip.
        local dot = AcquireTexture(dotPool, plotArea, "ARTWORK", 2)
        dot:ClearAllPoints()
        dot:SetSize(DOT_SIZE, DOT_SIZE)
        dot:SetPoint("CENTER", plotArea, "BOTTOMLEFT", x, y)
        dot:SetColorTexture(c.r, c.g, c.b, 1)

        local hitFrame = AcquireFrame(dotFrames, plotArea)
        hitFrame:SetSize(DOT_SIZE + 8, DOT_SIZE + 8)
        hitFrame:ClearAllPoints()
        hitFrame:SetPoint("CENTER", plotArea, "BOTTOMLEFT", x, y)
        hitFrame:SetFrameLevel(plotArea:GetFrameLevel() + 5)

        local score     = d[2]
        local timestamp = d[1]
        local prevScore = (i > 1) and visData[i - 1][2] or nil

        hitFrame:SetScript("OnEnter", function(self)
            GameTooltip:SetOwner(self, "ANCHOR_TOP")
            GameTooltip:AddLine(date("%d.%m.%Y  %H:%M", timestamp), 0.8, 0.8, 0.8)
            GameTooltip:AddDoubleLine("Score", string.format("%.0f", score),
                0.7, 0.7, 0.7, c.r, c.g, c.b)
            local rank = RR:GetRankForScore(score)
            GameTooltip:AddDoubleLine("Rank", RR:FormatRankName(rank, score),
                0.7, 0.7, 0.7, 1, 1, 1)
            if prevScore then
                local delta = score - prevScore
                local sign  = delta >= 0 and "+" or ""
                local dr, dg, db = 0.5, 1, 0.5
                if delta < 0 then dr, dg, db = 1, 0.4, 0.4 end
                GameTooltip:AddDoubleLine("Change", sign .. string.format("%.0f", delta),
                    0.7, 0.7, 0.7, dr, dg, db)
            end
            GameTooltip:Show()
        end)
        hitFrame:SetScript("OnLeave", function() GameTooltip:Hide() end)
    end
end

-- Comparison mode: line only (no fill), each char has a distinct colour.
local function DrawLineChart(visData, MapX, MapY, color, charName)
    local c = color
    for i = 1, #visData do
        local d = visData[i]
        local x = MapX(d[1])
        local y = MapY(d[2])

        -- Line segment to next point.
        if i < #visData then
            local nd = visData[i + 1]
            local nx = MapX(nd[1])
            local ny = MapY(nd[2])
            local segW = nx - x
            local cols = math.max(1, math.floor(segW / 2))
            if cols > 50 then cols = 50 end

            for col = 0, cols - 1 do
                local t0 = col / cols
                local t1 = (col + 1) / cols
                local lx = x + segW * t0
                local colH = y + (ny - y) * ((t0 + t1) / 2)
                local colW = segW / cols
                if colW < 0.5 then colW = 0.5 end

                local edge = AcquireTexture(linePool, plotArea, "ARTWORK", 1)
                edge:ClearAllPoints()
                edge:SetPoint("BOTTOMLEFT", plotArea, "BOTTOMLEFT", lx, colH - 1)
                edge:SetSize(colW + 0.5, LINE_THICKNESS + 1)
                edge:SetColorTexture(c.r, c.g, c.b, 0.9)
            end
        end

        -- Dot + tooltip.
        local dot = AcquireTexture(dotPool, plotArea, "ARTWORK", 2)
        dot:ClearAllPoints()
        dot:SetSize(DOT_SIZE, DOT_SIZE)
        dot:SetPoint("CENTER", plotArea, "BOTTOMLEFT", x, y)
        dot:SetColorTexture(c.r, c.g, c.b, 1)

        local hitFrame = AcquireFrame(dotFrames, plotArea)
        hitFrame:SetSize(DOT_SIZE + 8, DOT_SIZE + 8)
        hitFrame:ClearAllPoints()
        hitFrame:SetPoint("CENTER", plotArea, "BOTTOMLEFT", x, y)
        hitFrame:SetFrameLevel(plotArea:GetFrameLevel() + 5)

        local score     = d[2]
        local timestamp = d[1]
        local prevScore = (i > 1) and visData[i - 1][2] or nil
        local cName     = charName or ""

        hitFrame:SetScript("OnEnter", function(self)
            GameTooltip:SetOwner(self, "ANCHOR_TOP")
            if cName ~= "" then
                GameTooltip:AddLine(string.format("|cff%02x%02x%02x%s|r",
                    math.floor(c.r*255), math.floor(c.g*255), math.floor(c.b*255), cName))
            end
            GameTooltip:AddLine(date("%d.%m.%Y  %H:%M", timestamp), 0.8, 0.8, 0.8)
            GameTooltip:AddDoubleLine("Score", string.format("%.0f", score),
                0.7, 0.7, 0.7, c.r, c.g, c.b)
            local rank = RR:GetRankForScore(score)
            GameTooltip:AddDoubleLine("Rank", RR:FormatRankName(rank, score),
                0.7, 0.7, 0.7, 1, 1, 1)
            if prevScore then
                local delta = score - prevScore
                local sign  = delta >= 0 and "+" or ""
                local dr, dg, db = 0.5, 1, 0.5
                if delta < 0 then dr, dg, db = 1, 0.4, 0.4 end
                GameTooltip:AddDoubleLine("Change", sign .. string.format("%.0f", delta),
                    0.7, 0.7, 0.7, dr, dg, db)
            end
            GameTooltip:Show()
        end)
        hitFrame:SetScript("OnLeave", function() GameTooltip:Hide() end)
    end
end

function RR:RefreshHistoryGraph()
    if not self.historyFrame or not plotArea then return end
    if self.historyFrame.emptyText then self.historyFrame.emptyText:Hide() end

    ReleaseAll()
    BuildCharDropdown()

    local visible = self.db.historyVisible or {}
    local currentKey = CharKey()

    -- Collect all visible characters' data.
    local allCharData = {}  -- { { key=, data=, isCurrentChar= }, ... }
    for key, history in pairs(self.db.charHistory or {}) do
        if visible[key] and history and #history > 0 then
            EnsureSeasonStart(history)
            table.insert(allCharData, {
                key = key,
                history = history,
                isCurrent = (key == currentKey),
            })
        end
    end

    if #allCharData == 0 then
        if not self.historyFrame.emptyText then
            self.historyFrame.emptyText = self.historyFrame:CreateFontString(
                nil, "OVERLAY", "GameFontNormal")
            self.historyFrame.emptyText:SetPoint("CENTER", self.historyFrame, "CENTER", 0, 0)
        end
        self.historyFrame.emptyText:SetText("|cff888888No data yet. Play some keys!|r")
        self.historyFrame.emptyText:Show()
        return
    end

    -- Filter by time range and collect all data for Y/X bounds.
    local rangeDays = self.historyFrame.activeRange or 0
    local cutoff = rangeDays > 0 and (time() - rangeDays * 86400) or 0

    local globalMinScore, globalMaxScore = math.huge, -math.huge
    local globalMinTime, globalMaxTime   = math.huge, -math.huge

    local charDataSets = {}
    for _, cd in ipairs(allCharData) do
        local filtered = {}
        local lastBefore  -- last entry before cutoff (context point)
        for _, entry in ipairs(cd.history) do
            if entry[1] >= cutoff then
                table.insert(filtered, {
                    entry[1], entry[2], nil, ShortCharName(cd.key)
                })
            elseif cutoff > 0 then
                lastBefore = entry
            end
        end
        -- Prepend the last point before cutoff so the line starts from context.
        if lastBefore and #filtered > 0 then
            table.insert(filtered, 1, {
                cutoff, lastBefore[2], nil, ShortCharName(cd.key)
            })
        end
        for _, d in ipairs(filtered) do
            if d[2] < globalMinScore then globalMinScore = d[2] end
            if d[2] > globalMaxScore then globalMaxScore = d[2] end
            if d[1] < globalMinTime  then globalMinTime  = d[1] end
            if d[1] > globalMaxTime  then globalMaxTime  = d[1] end
        end
        if #filtered > 0 then
            table.insert(charDataSets, {
                key = cd.key,
                data = filtered,
                isCurrent = cd.isCurrent,
            })
        end
    end

    if #charDataSets == 0 then
        if not self.historyFrame.emptyText then
            self.historyFrame.emptyText = self.historyFrame:CreateFontString(
                nil, "OVERLAY", "GameFontNormal")
            self.historyFrame.emptyText:SetPoint("CENTER", self.historyFrame, "CENTER", 0, 0)
        end
        self.historyFrame.emptyText:SetText("|cff888888No data in this range.|r")
        self.historyFrame.emptyText:Show()
        return
    end

    -- Get current thresholds for rank bands.
    local currentThresholds = self.db.thresholds or {}

    -- Include visible rank boundaries in Y range.
    for _, rank in ipairs(self.RANKS) do
        local t = currentThresholds[rank.id] or rank.minScore
        if t > 0 and t >= globalMinScore - 200 and t <= globalMaxScore + 200 then
            if t < globalMinScore then globalMinScore = t end
            if t > globalMaxScore then globalMaxScore = t end
        end
    end

    local yPad = math.max(50, (globalMaxScore - globalMinScore) * 0.08)
    globalMinScore = math.max(0, globalMinScore - yPad)
    globalMaxScore = globalMaxScore + yPad

    local plotW = plotArea:GetWidth()
    local plotH = plotArea:GetHeight()
    if plotW < 10 or plotH < 10 then return end

    if globalMaxTime == globalMinTime then globalMaxTime = globalMinTime + 1 end

    local function MapX(t)
        return ((t - globalMinTime) / (globalMaxTime - globalMinTime)) * plotW
    end
    local function MapY(s)
        return ((s - globalMinScore) / (globalMaxScore - globalMinScore)) * plotH
    end

    -- ── Rank bands ──────────────────────────────────────────────────────────
    local sortedRanks = {}
    for _, rank in ipairs(self.RANKS) do
        if rank.id ~= "UNRANKED" then
            table.insert(sortedRanks, rank)
        end
    end
    table.sort(sortedRanks, function(a, b) return a.minScore < b.minScore end)

    for i, rank in ipairs(sortedRanks) do
        local lo = currentThresholds[rank.id] or rank.minScore
        local hi
        if i < #sortedRanks then
            hi = (currentThresholds[sortedRanks[i+1].id] or sortedRanks[i+1].minScore)
        else
            hi = globalMaxScore
        end

        local yBottom = MapY(math.max(lo, globalMinScore))
        local yTop    = MapY(math.min(hi, globalMaxScore))
        if yTop > yBottom then
            local band = AcquireTexture(bandPool, plotArea, "BACKGROUND", 0)
            band:ClearAllPoints()
            band:SetPoint("BOTTOMLEFT", plotArea, "BOTTOMLEFT", 0, yBottom)
            band:SetPoint("TOPRIGHT", plotArea, "BOTTOMRIGHT", 0, yTop)
            local c = rank.color
            band:SetColorTexture(c.r, c.g, c.b, 0.20)

            local midY = yBottom + (yTop - yBottom) / 2
            local lbl = AcquireLabel(labelPool, self.historyFrame)
            lbl:ClearAllPoints()
            lbl:SetPoint("RIGHT", plotArea, "BOTTOMLEFT", -4, midY)
            local shortName = RANK_SHORT[rank.id] or rank.name
            lbl:SetText(string.format("|cff%02x%02x%02x%s %d|r",
                math.floor(c.r*255), math.floor(c.g*255), math.floor(c.b*255),
                shortName, lo))
            lbl:SetJustifyH("RIGHT")

            -- (threshold lines removed — only bands + left labels)
        end
    end

    -- ── X-axis labels ───────────────────────────────────────────────────────
    local timeSpan = globalMaxTime - globalMinTime
    if timeSpan < 1 then timeSpan = 1 end
    local numLabels = math.max(2, math.min(5, 2 + math.floor(timeSpan / 86400)))
    for i = 0, numLabels - 1 do
        local t = globalMinTime + (timeSpan * i) / (numLabels - 1)
        local x = MapX(t)
        local lbl = AcquireLabel(labelPool, self.historyFrame)
        lbl:ClearAllPoints()
        lbl:SetPoint("TOP", plotArea, "BOTTOMLEFT", x, -2)
        lbl:SetText("|cff999999" .. date("%d.%m", t) .. "|r")
        lbl:SetJustifyH("CENTER")

        local vGrid = AcquireTexture(gridPool, plotArea, "BACKGROUND", 1)
        vGrid:ClearAllPoints()
        vGrid:SetPoint("BOTTOMLEFT", plotArea, "BOTTOMLEFT", x, 0)
        vGrid:SetSize(1, plotH)
        vGrid:SetColorTexture(1, 1, 1, 0.08)
    end

    -- ── Draw each character ─────────────────────────────────────────────────
    local isCompare = #charDataSets > 1

    -- In compare mode, sort so alts draw first (behind), current last.
    table.sort(charDataSets, function(a, b)
        if a.isCurrent ~= b.isCurrent then return not a.isCurrent end
        return a.key < b.key
    end)

    local altIdx = 0
    for _, cds in ipairs(charDataSets) do
        local visData = LTTB(cds.data, MAX_VISIBLE_PTS)

        if not isCompare then
            -- Solo: filled area chart in current rank colour.
            local lastScore = cds.data[#cds.data][2]
            local rank = self:GetRankForScore(lastScore)
            DrawSoloChart(visData, MapX, MapY, rank.color)
        else
            -- Compare: line only, distinct colour per char.
            local color
            if cds.isCurrent then
                local lastScore = cds.data[#cds.data][2]
                local rank = self:GetRankForScore(lastScore)
                color = rank.color
            else
                color = ALT_COLORS[(altIdx % #ALT_COLORS) + 1]
                altIdx = altIdx + 1
            end
            DrawLineChart(visData, MapX, MapY, color, ShortCharName(cds.key))
        end
    end

    -- ── Current score indicator ─────────────────────────────────────────────
    for _, cds in ipairs(charDataSets) do
        if cds.isCurrent and #cds.data > 0 then
            local lastEntry = cds.data[#cds.data]
            local cy = MapY(lastEntry[2])
            local lbl = AcquireLabel(labelPool, self.historyFrame)
            lbl:ClearAllPoints()
            lbl:SetPoint("LEFT", plotArea, "BOTTOMRIGHT", 4, cy)
            local rank = self:GetRankForScore(lastEntry[2])
            local c = rank.color
            lbl:SetText(string.format("|cff%02x%02x%02x%.0f|r",
                math.floor(c.r*255), math.floor(c.g*255), math.floor(c.b*255),
                lastEntry[2]))
        end
    end
end

-- ── Toggle ──────────────────────────────────────────────────────────────────

function RR:ToggleHistoryGraph(show)
    if not self.historyFrame then
        self.historyFrame = CreateHistoryFrame()
        historyFrame = self.historyFrame
    end
    if show == nil then
        show = not self.historyFrame:IsShown()
    end
    if show then
        self.historyFrame:Show()
        C_Timer.After(0, function() RR:RefreshHistoryGraph() end)
    else
        self.historyFrame:Hide()
    end
end
