-- RaiderRanked: UI.lua
-- Rank frame, minimap button, and tooltip hook.

local ADDON_NAME, RR = ...

local FRAME_W, FRAME_H = 260, 90
local ICON_SIZE         = 64
local GROUP_ROW_H       = 32   -- height per group member row
local GROUP_ICON_SIZE   = 28   -- emblem icon in group rows
local GROUP_PAD         = 6    -- vertical padding inside group panel

-- ── Helper ───────────────────────────────────────────────────────────────────

local function ColorHex(r, g, b)
    return string.format("|cff%02x%02x%02x", math.floor(r*255), math.floor(g*255), math.floor(b*255))
end

-- ── Custom tooltip ───────────────────────────────────────────────────────────
-- Lightweight tooltip replacement used by the rank frame so we can position it
-- center-left / center-right of the owner without touching GameTooltip (manual
-- SetPoint on GameTooltip taints it, which propagates into Blizzard secure
-- chat code). This frame is fully insecure and owned by us, so SetPoint is
-- free.

local rrTooltip
local rrTooltipLines = {}
local TIP_PAD_X, TIP_PAD_Y, TIP_LINE_GAP = 10, 8, 4
local TIP_LINE_H = 14  -- fixed per-line height for GameTooltipText (size 12);
                       -- avoids GetStringHeight() returning stale values on
                       -- FontStrings that were recently re-shown.

local function EnsureRRTooltip()
    if rrTooltip then return rrTooltip end
    local t = CreateFrame("Frame", "RaiderRankedTooltip", UIParent, "BackdropTemplate")
    t:SetFrameStrata("TOOLTIP")
    t:SetBackdrop({
        bgFile   = "Interface\\Tooltips\\UI-Tooltip-Background",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = true, tileSize = 16, edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 },
    })
    t:SetBackdropColor(0, 0, 0, 0.92)
    t:Hide()
    rrTooltip = t
    return t
end

--- Shows the custom tooltip centered vertically beside an owner frame.
--- @param owner frame      The frame to anchor to.
--- @param side  string     "right" places tooltip right of owner, "left" = left.
--- @param lines table      Array of { text = "...", r, g, b } entries.
local function ShowRRTooltip(owner, side, lines)
    local t = EnsureRRTooltip()

    -- Create / reuse FontStrings. We NEVER hide FontStrings — unused slots
    -- just get empty text. Hiding + re-showing in the same frame tick
    -- makes GetStringHeight/Width return stale zeros until the next layout
    -- pass, which collapses the tooltip into a bunched-up mess on the
    -- next transition (e.g. lock → frame).
    local slotCount = math.max(#lines, #rrTooltipLines)
    for i = 1, slotCount do
        local fs = rrTooltipLines[i]
        if not fs then
            fs = t:CreateFontString(nil, "OVERLAY", "GameTooltipText")
            rrTooltipLines[i] = fs
        end
        if i <= #lines then
            fs:SetText(lines[i].text)
            fs:SetTextColor(lines[i].r or 1, lines[i].g or 1, lines[i].b or 1)
        else
            fs:SetText("")
        end
    end

    -- Max width from the currently-visible lines. GetStringWidth is stable
    -- for always-shown FontStrings.
    local maxW = 0
    for i = 1, #lines do
        local w = rrTooltipLines[i]:GetStringWidth()
        if w > maxW then maxW = w end
    end

    -- Absolute Y layout with a fixed per-line height. No GetStringHeight
    -- dependency — deterministic across re-layouts.
    local y = TIP_PAD_Y
    for i = 1, #lines do
        local fs = rrTooltipLines[i]
        fs:ClearAllPoints()
        fs:SetHeight(TIP_LINE_H)
        fs:SetPoint("TOPLEFT",  t, "TOPLEFT",  TIP_PAD_X, -y)
        fs:SetPoint("TOPRIGHT", t, "TOPRIGHT", -TIP_PAD_X, -y)
        fs:SetJustifyH("LEFT")
        y = y + TIP_LINE_H
        if i < #lines then y = y + TIP_LINE_GAP end
    end
    -- Park unused slots off to the side so they don't accidentally render
    -- where the last content used to be (they have empty text anyway,
    -- but this keeps anchors clean).
    for i = #lines + 1, slotCount do
        local fs = rrTooltipLines[i]
        fs:ClearAllPoints()
        fs:SetPoint("TOPLEFT", t, "TOPLEFT", 0, 0)
    end
    t:SetSize(maxW + TIP_PAD_X * 2, y + TIP_PAD_Y)

    -- Vertically centered on owner, placed directly beside it.
    t:ClearAllPoints()
    if side == "right" then
        t:SetPoint("LEFT", owner, "RIGHT", 6, 0)
    else
        t:SetPoint("RIGHT", owner, "LEFT", -6, 0)
    end
    t:Show()
end

local function HideRRTooltip()
    if rrTooltip then rrTooltip:Hide() end
end

-- ── Rank Frame ───────────────────────────────────────────────────────────────

local rankFrame

local function CreateRankFrame()
    local f = CreateFrame("Frame", "RaiderRankedFrame", UIParent, "BackdropTemplate")
    f:SetSize(FRAME_W, FRAME_H)
    f:SetFrameStrata("MEDIUM")
    f:SetBackdrop({
        bgFile   = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true, tileSize = 16, edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 },
    })
    f:SetBackdropColor(0, 0, 0, 0.85)

    -- Restore saved position.
    local pos = RR.db.framePosition
    f:SetPoint(pos.point, UIParent, pos.point, pos.x, pos.y)
    f:SetMovable(true)
    f:SetClampedToScreen(true)
    f:EnableMouse(true)
    f:RegisterForDrag("LeftButton")
    local didDrag = false
    f:SetScript("OnDragStart", function(self)
        if RR.db.frameLocked then return end
        didDrag = true
        self:StartMoving()
    end)
    f:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
        local point, _, _, x, y = self:GetPoint()
        RR.db.framePosition = { point = point, x = x, y = y }
    end)

    -- Lock button — shown only on hover, toggles frame drag lock.
    local lockBtn = CreateFrame("Button", nil, f)
    lockBtn:SetSize(30, 30)
    lockBtn:SetPoint("TOPRIGHT", f, "TOPRIGHT", -6, -6)
    lockBtn:SetFrameLevel(f:GetFrameLevel() + 10)
    local lockTex = lockBtn:CreateTexture(nil, "OVERLAY")
    lockTex:SetAllPoints()
    lockBtn.tex = lockTex
    lockBtn:Hide()
    f.lockBtn = lockBtn

    local function UpdateLockIcon()
        if RR.db.frameLocked then
            lockTex:SetTexture("Interface\\Buttons\\LockButton-Locked-Up")
            lockTex:SetVertexColor(1, 0.82, 0)  -- gold when locked
        else
            lockTex:SetTexture("Interface\\Buttons\\LockButton-Unlocked-Up")
            lockTex:SetVertexColor(0.85, 0.85, 0.85)  -- neutral when unlocked
        end
        lockTex:SetTexCoord(0, 1, 0, 1)
    end
    UpdateLockIcon()
    f.UpdateLockIcon = UpdateLockIcon

    lockBtn:SetScript("OnClick", function()
        RR.db.frameLocked = not RR.db.frameLocked
        UpdateLockIcon()
    end)
    -- Custom tooltip sits directly beside the frame, vertically centered.
    -- Side is chosen by which half of the screen the frame is on, and
    -- flipped instantly during drag via an OnUpdate hook. Uses our own
    -- insecure tooltip frame to avoid tainting GameTooltip.
    local currentSide    -- "right" or "left"
    local tooltipLines   -- current line array; nil when hidden
    local function DesiredSide()
        local cx = f:GetCenter()
        local sw = UIParent:GetWidth()
        if cx and cx < sw / 2 then return "right" end
        return "left"
    end
    local function ApplyTooltipSide(side)
        if not tooltipLines then return end
        ShowRRTooltip(f, side, tooltipLines)
        currentSide = side
    end

    -- Single source of truth for what the tooltip should show, based on
    -- the cursor's current mouse region. Guarded by a state token so the
    -- lines are only rebuilt on actual transitions — called every frame
    -- from OnUpdate while the cursor is anywhere over the rank frame.
    --
    -- Why OnUpdate and not just OnEnter/OnLeave: moving from the lock
    -- button back onto the frame body does NOT re-fire f:OnEnter (the
    -- button is a child inside f's bounds, so WoW never considers f
    -- "left"). Also, when f:OnEnter shows the lock button for the first
    -- time, lockBtn:IsMouseOver() is still false in the same frame tick
    -- and lockBtn:OnEnter doesn't fire until the next mouse move — so
    -- a quick hover directly onto the button's area would show the
    -- frame tooltip instead of the lock tooltip.
    local currentState   -- "lock", "frame", or nil
    local function UpdateTooltip()
        local newState
        if lockBtn:IsShown() and lockBtn:IsMouseOver() then
            newState = "lock"
        elseif f:IsMouseOver() then
            newState = "frame"
        else
            newState = nil
        end
        if newState == currentState then return end
        currentState = newState

        if newState == "lock" then
            tooltipLines = {
                { text = RR.db.frameLocked and "Unlock frame" or "Lock frame",
                  r = 1, g = 1, b = 1 },
            }
            ApplyTooltipSide(DesiredSide())
        elseif newState == "frame" then
            local regionLbl  = RR.CUTOFF_REGION_LABELS[RR.db.cutoffRegion]   or RR.db.cutoffRegion
            local factionLbl = RR.CUTOFF_FACTION_LABELS[RR.db.cutoffFaction] or RR.db.cutoffFaction
            tooltipLines = {
                { text = "RaiderRanked", r = 0, g = 0.8, b = 1 },
                { text = "Cutoff: " .. regionLbl .. " / " .. factionLbl,
                  r = 0.85, g = 0.85, b = 0.55 },
                { text = "Left-click to show group ranks", r = 1, g = 1, b = 1 },
                { text = "Shift-left-click for the rank ladder", r = 1, g = 1, b = 1 },
                { text = RR.db.frameLocked and "Frame locked (click lock icon to unlock)"
                    or "Left-drag to move", r = 0.7, g = 0.7, b = 0.7 },
                { text = "Right-click to hide  (/rr to show)", r = 0.7, g = 0.7, b = 0.7 },
            }
            ApplyTooltipSide(DesiredSide())
        else
            tooltipLines = nil
            HideRRTooltip()
        end
    end

    f:HookScript("OnUpdate", function()
        -- Catch the one OnEnter race: f:OnEnter just showed lockBtn and
        -- the cursor was already geometrically over it, so lockBtn:OnEnter
        -- never fires (no mouse movement event). Flip to the lock state
        -- here. All other transitions are handled by OnEnter/OnLeave.
        if currentState == "frame" and lockBtn:IsShown() and lockBtn:IsMouseOver() then
            UpdateTooltip()
        end
        -- Side flipping during drag.
        if not tooltipLines then return end
        local side = DesiredSide()
        if side ~= currentSide then
            ApplyTooltipSide(side)
        end
    end)

    lockBtn:SetScript("OnEnter", function()
        lockBtn:Show()  -- keep visible while cursor is on the button itself
        UpdateTooltip()
    end)
    lockBtn:SetScript("OnLeave", function()
        UpdateTooltip()
        if not f:IsMouseOver() then lockBtn:Hide() end
    end)

    -- Rank icon.
    local icon = f:CreateTexture(nil, "ARTWORK")
    icon:SetSize(ICON_SIZE, ICON_SIZE)
    icon:SetPoint("LEFT", f, "LEFT", 12, 0)
    f.icon = icon

    -- Rank name + score — vertically centered as a block relative to the icon.
    local nameText = f:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    nameText:SetPoint("BOTTOMLEFT", icon, "RIGHT", 10, 2)
    nameText:SetPoint("RIGHT", f, "RIGHT", -10, 0)
    nameText:SetJustifyH("LEFT")
    nameText:SetWordWrap(false)
    f.nameText = nameText

    local scoreText = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    scoreText:SetPoint("TOPLEFT", icon, "RIGHT", 10, -2)
    scoreText:SetPoint("RIGHT", f, "RIGHT", -10, 0)
    scoreText:SetJustifyH("LEFT")
    scoreText:SetWordWrap(false)
    f.scoreText = scoreText

    -- Cutoff indicator — tiny muted text bottom-right, e.g. "EU · Horde".
    -- Reflects which Raider.IO cutoff set drives the current rank brackets.
    local cutoffText = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    cutoffText:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -8, 4)
    cutoffText:SetJustifyH("RIGHT")
    cutoffText:SetTextColor(0.55, 0.55, 0.6)
    f.cutoffText = cutoffText

    -- Left-click toggles group panel; right-click hides frame.
    f:SetScript("OnMouseDown", function() didDrag = false end)
    f:SetScript("OnMouseUp", function(self, button)
        if button == "RightButton" then
            self:Hide()
            RR.db.showFrame = false
        elseif button == "LeftButton" and not didDrag then
            if IsShiftKeyDown() then
                RR:ToggleRankLadder()
            else
                RR:ToggleGroupPanel()
            end
        end
    end)

    f:SetScript("OnEnter", function()
        lockBtn:Show()
        UpdateTooltip()
    end)
    f:SetScript("OnLeave", function(self)
        UpdateTooltip()
        if not self:IsMouseOver() and not lockBtn:IsMouseOver() then
            lockBtn:Hide()
        end
    end)
    -- Right-click hides the frame — make sure the tooltip and lock button
    -- follow. OnLeave does not fire when a frame is hidden while the
    -- cursor is still over it, so we clean up explicitly here.
    f:HookScript("OnHide", function()
        currentState = nil
        tooltipLines = nil
        HideRRTooltip()
        lockBtn:Hide()
    end)

    return f
end

-- ── Group Panel ─────────────────────────────────────────────────────────────
-- Expandable panel below the rank frame showing party/raid member ranks.

local groupPanel
local groupRows = {}  -- reusable row frames

local function CreateGroupRow(parent, index)
    local row = CreateFrame("Frame", nil, parent)
    row:SetHeight(GROUP_ROW_H)
    row:SetPoint("TOPLEFT", parent, "TOPLEFT", 8, -(GROUP_PAD + (index - 1) * GROUP_ROW_H))
    row:SetPoint("RIGHT", parent, "RIGHT", -8, 0)

    local icon = row:CreateTexture(nil, "ARTWORK")
    icon:SetSize(GROUP_ICON_SIZE, GROUP_ICON_SIZE)
    icon:SetPoint("LEFT", row, "LEFT", 0, 0)
    row.icon = icon

    local nameText = row:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    nameText:SetPoint("LEFT", icon, "RIGHT", 6, 0)
    nameText:SetWidth(80)
    nameText:SetJustifyH("LEFT")
    nameText:SetWordWrap(false)
    row.nameText = nameText

    local scoreText = row:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    scoreText:SetPoint("RIGHT", row, "RIGHT", 0, 0)
    scoreText:SetJustifyH("RIGHT")
    scoreText:SetWidth(40)
    row.scoreText = scoreText

    local rankText = row:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    rankText:SetPoint("LEFT", nameText, "RIGHT", 4, 0)
    rankText:SetPoint("RIGHT", scoreText, "LEFT", -6, 0)
    rankText:SetJustifyH("LEFT")
    rankText:SetWordWrap(false)
    row.rankText = rankText

    return row
end

local function CreateGroupPanel()
    local p = CreateFrame("Frame", "RaiderRankedGroupPanel", rankFrame, "BackdropTemplate")
    p:SetPoint("TOPLEFT", rankFrame, "BOTTOMLEFT", 0, 2)
    p:SetWidth(FRAME_W)
    p:SetFrameStrata("MEDIUM")
    p:SetBackdrop({
        bgFile   = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true, tileSize = 16, edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 },
    })
    p:SetBackdropColor(0, 0, 0, 0.85)
    p:EnableMouse(true)  -- prevent click-through

    -- No cutoff indicator here on purpose: the rank frame directly above
    -- already carries it, and a second copy sat inside the member list where
    -- it read as if it belonged to a player row.

    p:Hide()
    return p
end

--- Collects group unit tokens (player + party1–4 or raid1–40).
local function GetGroupUnits()
    local units = {}
    if IsInRaid() then
        for i = 1, GetNumGroupMembers() do
            table.insert(units, "raid" .. i)
        end
    elseif IsInGroup() then
        table.insert(units, "player")
        for i = 1, GetNumGroupMembers() - 1 do
            table.insert(units, "party" .. i)
        end
    else
        table.insert(units, "player")
    end
    return units
end

function RR:RefreshGroupPanel()
    if not groupPanel or not groupPanel:IsShown() then return end

    local units = GetGroupUnits()

    -- Collect and sort by score descending.
    local members = {}
    for _, unit in ipairs(units) do
        if UnitExists(unit) and UnitIsPlayer(unit) then
            local name = UnitName(unit) or UNKNOWN
            local score = self:GetScoreForUnit(unit) or 0
            local rank = self:GetRankForScore(score)
            table.insert(members, { name = name, score = score, rank = rank, unit = unit })
        end
    end
    table.sort(members, function(a, b) return a.score > b.score end)

    -- Ensure enough rows exist.
    for i = #groupRows + 1, #members do
        groupRows[i] = CreateGroupRow(groupPanel, i)
    end

    -- Populate rows.
    for i, m in ipairs(members) do
        local row = groupRows[i]
        local c = m.rank.color

        row.icon:SetTexture(m.rank.icon)
        row.nameText:SetText(m.name)
        row.nameText:SetTextColor(1, 1, 1)
        row.rankText:SetText(self:GetRankDisplayName(m.rank, m.score, true))
        row.rankText:SetTextColor(c.r, c.g, c.b)

        local sc = (RaiderIO and RaiderIO.GetScoreColor)
            and { RaiderIO.GetScoreColor(m.score) } or { c.r, c.g, c.b }
        row.scoreText:SetText(string.format("%.0f", m.score))
        row.scoreText:SetTextColor(sc[1] or c.r, sc[2] or c.g, sc[3] or c.b)

        row:Show()
    end

    -- Hide excess rows.
    for i = #members + 1, #groupRows do
        groupRows[i]:Hide()
    end

    -- Resize panel to fit content.
    local count = math.max(#members, 1)
    groupPanel:SetHeight(GROUP_PAD * 2 + count * GROUP_ROW_H)
end

function RR:ToggleGroupPanel()
    if not groupPanel then
        groupPanel = CreateGroupPanel()
    end
    if groupPanel:IsShown() then
        groupPanel:Hide()
    else
        groupPanel:Show()
        self:RefreshGroupPanel()
    end
end

--- Public: initialise UI elements. Called from Core.OnPlayerLogin.
function RR:InitUI()
    rankFrame = CreateRankFrame()
    if not self.db.showFrame then
        rankFrame:Hide()
    end
    self:UpdateRankFrame()
    if self.db.showPvPFrame then
        pvpRankFrame = CreatePvPRankFrame()
        self:UpdatePvPRankFrame()
    end
    self:HookTooltip()
    self:CreateMinimapButton()
    self:CreatePortraitWings()
    self:CreatePvPAura()
    self:CreatePveAura()
    self:InitUnitWings()
end

--- Returns the average M+ score across the current group (or just the player if solo).
function RR:GetGroupAverageScore()
    local units = GetGroupUnits()
    local total, count = 0, 0
    for _, unit in ipairs(units) do
        if UnitExists(unit) and UnitIsPlayer(unit) then
            local s = self:GetScoreForUnit(unit) or 0
            total = total + s
            count = count + 1
        end
    end
    if count == 0 then return 0 end
    return total / count
end

--- Public: refresh the rank frame with the latest player data.
--- In a group: shows group average score + rank.  Solo: shows own score + rank.
function RR:UpdateRankFrame()
    if not rankFrame then return end

    local inGroup = IsInGroup() or IsInRaid()
    local rank, score, label

    if inGroup then
        score = self:GetGroupAverageScore()
        rank  = self:GetRankForScore(score)
        label = string.format("%.0f Avg M+ Score", score)
    else
        rank  = self.playerRank  or self:GetRankForScore(0)
        score = self.playerScore or 0
        label = string.format("%.0f M+ Score", score)
    end

    local c = rank.color

    rankFrame.icon:SetTexture(rank.icon)

    rankFrame.nameText:SetText(
        ColorHex(c.r, c.g, c.b) .. self:GetRankDisplayName(rank, score) .. "|r")

    local scoreColor = RaiderIO and RaiderIO.GetScoreColor and
        { RaiderIO.GetScoreColor(score) } or { c.r, c.g, c.b }

    rankFrame.scoreText:SetText(
        ColorHex(scoreColor[1] or c.r, scoreColor[2] or c.g, scoreColor[3] or c.b)
        .. label .. "|r")

    if rankFrame.cutoffText then
        local r = RR.CUTOFF_REGION_SHORT[self.db.cutoffRegion]   or self.db.cutoffRegion
        local f = RR.CUTOFF_FACTION_SHORT[self.db.cutoffFaction] or self.db.cutoffFaction
        rankFrame.cutoffText:SetText(r .. " / " .. f)
    end
end

--- Public: show or hide the rank frame.
function RR:ToggleRankFrame(show)
    if not rankFrame then return end
    if show == nil then show = not rankFrame:IsShown() end
    if show then
        rankFrame:Show()
        self.db.showFrame = true
        self:RefreshPlayerRank()
    else
        rankFrame:Hide()
        self.db.showFrame = false
    end
end

-- ── PvP Rank Frame ──────────────────────────────────────────────────────────

local pvpRankFrame

local function CreatePvPRankFrame()
    local f = CreateFrame("Frame", "RaiderRankedPvPFrame", UIParent, "BackdropTemplate")
    f:SetSize(FRAME_W, FRAME_H)
    f:SetFrameStrata("MEDIUM")
    f:SetBackdrop({
        bgFile   = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true, tileSize = 16, edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 },
    })
    f:SetBackdropColor(0, 0, 0, 0.85)

    local pos = RR.db.pvpFramePosition
    f:SetPoint(pos.point, UIParent, pos.point, pos.x, pos.y)
    f:SetMovable(true)
    f:EnableMouse(true)
    f:RegisterForDrag("LeftButton")
    f:SetScript("OnDragStart", function(self) self:StartMoving() end)
    f:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
        local point, _, _, x, y = self:GetPoint()
        RR.db.pvpFramePosition = { point = point, x = x, y = y }
    end)

    local icon = f:CreateTexture(nil, "ARTWORK")
    icon:SetSize(ICON_SIZE, ICON_SIZE)
    icon:SetPoint("LEFT", f, "LEFT", 12, 0)
    f.icon = icon

    local nameText = f:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    nameText:SetPoint("BOTTOMLEFT", icon, "RIGHT", 10, 2)
    nameText:SetPoint("RIGHT", f, "RIGHT", -10, 0)
    nameText:SetJustifyH("LEFT")
    nameText:SetWordWrap(false)
    f.nameText = nameText

    local scoreText = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    scoreText:SetPoint("TOPLEFT", icon, "RIGHT", 10, -2)
    scoreText:SetPoint("RIGHT", f, "RIGHT", -10, 0)
    scoreText:SetJustifyH("LEFT")
    scoreText:SetWordWrap(false)
    f.scoreText = scoreText

    f:SetScript("OnMouseUp", function(self, button)
        if button == "RightButton" then
            self:Hide()
            RR.db.showPvPFrame = false
        end
    end)

    f:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_TOP")
        GameTooltip:AddLine("RaiderRanked — PvP", 1, 0.3, 0.3)
        local brackets = RR:GetPvPBracketsForUnit("player")
        if brackets then
            for _, b in ipairs(RR.PVP_BRACKETS) do
                local cr = brackets[b.name] or 0
                if cr > 0 then
                    GameTooltip:AddDoubleLine(b.name, tostring(cr), 0.7,0.7,0.7, 1,1,1)
                end
            end
            local rbgCR = brackets[RR.PVP_RBG_NAME] or 0
            if rbgCR > 0 then
                GameTooltip:AddDoubleLine(RR.PVP_RBG_NAME, tostring(rbgCR), 0.7,0.7,0.7, 1,1,1)
            end
        end
        GameTooltip:AddLine("Left-drag to move", 0.7, 0.7, 0.7)
        GameTooltip:AddLine("Right-click to hide", 0.7, 0.7, 0.7)
        GameTooltip:Show()
    end)
    f:SetScript("OnLeave", GameTooltip_Hide)

    return f
end

function RR:UpdatePvPRankFrame()
    if not pvpRankFrame then return end

    local rank  = self.playerPvPRank  or self:GetPvPRankForCR(0)
    local score = self.playerPvPScore or 0
    local c = rank.color

    pvpRankFrame.icon:SetTexture(rank.icon)
    pvpRankFrame.nameText:SetText(
        ColorHex(c.r, c.g, c.b) .. rank.name .. "|r")
    pvpRankFrame.scoreText:SetText(
        ColorHex(c.r, c.g, c.b) .. string.format("%.0f PvP Rating", score) .. "|r")
end

function RR:TogglePvPRankFrame(show)
    if not pvpRankFrame then
        pvpRankFrame = CreatePvPRankFrame()
        self:UpdatePvPRankFrame()
    end
    if show == nil then show = not pvpRankFrame:IsShown() end
    if show then
        pvpRankFrame:Show()
        self.db.showPvPFrame = true
        self:RefreshPlayerPvPRank()
    else
        pvpRankFrame:Hide()
        self.db.showPvPFrame = false
    end
end

-- ── Tooltip Hook ─────────────────────────────────────────────────────────────

function RR:HookTooltip()
    -- WoW Midnight removed "OnTooltipSetUnit" HookScript.
    -- TooltipDataProcessor is available since Dragonflight and works in Midnight.
    if TooltipDataProcessor and TooltipDataProcessor.AddTooltipPostCall then
        TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Unit, function(tooltip)
            local ok, _, unit = pcall(tooltip.GetUnit, tooltip)
            if not ok or not unit then return end
            local pOk, isPlayer = pcall(UnitIsPlayer, unit)
            if not pOk or not isPlayer then return end

            -- M+ section.
            if RR.db.showInTooltip then
                local score = RR:GetScoreForUnit(unit)
                if score then
                    local rank = RR:GetRankForScore(score)
                    local c    = rank.color

                    tooltip:AddLine(" ")
                    tooltip:AddDoubleLine(
                        "|cff00ccffRaiderRanked|r",
                        ColorHex(c.r, c.g, c.b) .. RR:GetRankDisplayName(rank, score) .. "|r",
                        1, 1, 1, c.r, c.g, c.b)

                    local scoreColor = RaiderIO and RaiderIO.GetScoreColor and
                        { RaiderIO.GetScoreColor(score) } or { c.r, c.g, c.b }

                    tooltip:AddDoubleLine(
                        "M+ Score",
                        ColorHex(scoreColor[1] or c.r, scoreColor[2] or c.g, scoreColor[3] or c.b)
                            .. string.format("%.0f|r", score),
                        0.7, 0.7, 0.7, 1, 1, 1)
                end
            end

            -- PvP section.
            if RR.db.showPvPInTooltip then
                local pvpCR = RR:GetPvPScoreForUnit(unit)
                if pvpCR then
                    local pvpRank = RR:GetPvPRankForCR(pvpCR)
                    local pc = pvpRank.color

                    tooltip:AddDoubleLine(
                        "|cffff4444PvP Rank|r",
                        ColorHex(pc.r, pc.g, pc.b) .. pvpRank.name .. "|r",
                        1, 1, 1, pc.r, pc.g, pc.b)

                    tooltip:AddDoubleLine(
                        "PvP Rating",
                        ColorHex(pc.r, pc.g, pc.b) .. string.format("%.0f|r", pvpCR),
                        0.7, 0.7, 0.7, 1, 1, 1)
                end
            end

            tooltip:Show()
        end)
    else
        -- Fallback for older API (pre-Dragonflight)
        pcall(function()
            GameTooltip:HookScript("OnTooltipSetUnit", function(tooltip)
                if not RR.db.showInTooltip then return end
                local _, unit = tooltip:GetUnit()
                if not unit or not UnitIsPlayer(unit) then return end
                local score = RR:GetScoreForUnit(unit)
                if not score then return end
                local rank = RR:GetRankForScore(score)
                local c    = rank.color
                tooltip:AddLine(" ")
                tooltip:AddDoubleLine("|cff00ccffRaiderRanked|r",
                    ColorHex(c.r, c.g, c.b) .. RR:GetRankDisplayName(rank, score) .. "|r", 1,1,1, c.r,c.g,c.b)
                tooltip:Show()
            end)
        end)
    end
end

-- ── Minimap Button (LibDBIcon) ──────────────────────────────────────────────

function RR:CreateMinimapButton()
    local ldb  = LibStub("LibDataBroker-1.1", true)
    local icon = LibStub("LibDBIcon-1.0", true)
    if not ldb or not icon then
        print("|cffff0000RaiderRanked|r LibDBIcon or LibDataBroker not found — minimap button disabled.")
        return
    end

    local rank = self.playerRank or self:GetRankForScore(0)

    local dataObj = ldb:NewDataObject("RaiderRanked", {
        type = "launcher",
        icon = rank.icon or "Interface\\Icons\\inv_12_trinket_raid_dreamrift_gazeofthealnseer",
        OnClick = function(_, button)
            if button == "LeftButton" and not IsShiftKeyDown() then
                RR:ToggleRankFrame()
            elseif button == "RightButton" then
                -- Opens on whichever tab was last used; the tab strip inside
                -- reaches the ladder and season views.
                RR:ToggleHistoryGraph()
            end
        end,
        OnTooltipShow = function(tooltip)
            tooltip:AddLine("RaiderRanked", 0, 0.8, 1)
            if RR.playerRank then
                tooltip:AddDoubleLine("Rank", RR:FormatRankName(RR.playerRank, RR.playerScore), 0.7,0.7,0.7, 1,1,1)
                tooltip:AddDoubleLine("M+ Score", string.format("%.0f", RR.playerScore or 0), 0.7,0.7,0.7, 1,1,1)
            end
            tooltip:AddLine("Left-click to toggle frame", 0.5, 0.5, 0.5)
            tooltip:AddLine("Right-click for history, ladder and seasons", 0.5, 0.5, 0.5)
            tooltip:AddLine("Shift-click to move", 0.5, 0.5, 0.5)
        end,
    })

    self.minimapDataObj = dataObj

    icon:Register("RaiderRanked", dataObj, self.db.minimap)

    -- Expose the button frame for tests.
    self.minimapButton = icon:GetMinimapButton("RaiderRanked")

    -- Override drag: only allow moving with Shift held.
    if self.minimapButton then
        local origDragStart = self.minimapButton:GetScript("OnDragStart")
        self.minimapButton:SetScript("OnDragStart", function(btn)
            if IsShiftKeyDown() and origDragStart then
                origDragStart(btn)
            end
        end)
    end

    -- Update the minimap icon texture whenever the rank refreshes.
    local origUpdate = RR.UpdateRankFrame
    RR.UpdateRankFrame = function(self)
        origUpdate(self)
        local r = self.playerRank or self:GetRankForScore(0)
        dataObj.icon = r.icon or "Interface\\Icons\\inv_12_trinket_raid_dreamrift_gazeofthealnseer"
    end
end

function RR:ToggleMinimapButton(show)
    local icon = LibStub("LibDBIcon-1.0", true)
    if not icon then return end
    if show then
        self.db.minimap.hide = false
        icon:Show("RaiderRanked")
    else
        self.db.minimap.hide = true
        icon:Hide("RaiderRanked")
    end
end

-- ── Foreign unit frame overlays ──────────────────────────────────────────────
-- Overlays drawn on target / focus / party frames are parented to UIParent,
-- never to the unit frame itself. Creating an insecure child inside a Blizzard
-- unit frame taints it, and a tainted unit frame gets secret values back from
-- the very unit API it reads itself — surfacing as "attempt to compare a
-- secret number value" out of Blizzard_TextStatusBar on the next update.
--
-- This applies to *foreign* units only. The 12.x secret-value protection does
-- not cover your own character, so PlayerFrame overlays can stay children of
-- PlayerFrame and keep inheriting its position, scale and visibility.
--
-- Anchoring our textures to a Blizzard region is taint-free, so placement
-- still follows the frame. What a UIParent child no longer inherits is the
-- host's visibility and scale — scale matters because texture sizes come from
-- atlas dimensions and unit frames are scalable in Edit Mode. Both are
-- mirrored here; draw order is handled by SetOverlayLevel.

local hostMirrors = {}
local mirrorTicker

local function ApplyMirror(m)
    m.frame:SetShown(m.host:IsVisible())
    if m.raise then
        -- bumpStrata: mirrored overlays are siblings of their host, not
        -- children, so they have no hierarchy advantage to fall back on.
        RR:RaiseOverlayAbove(m.frame, m.host, true)
    end
    -- Match the host's on-screen scale exactly: our own effective scale is
    -- UIParent's times whatever we set, so divide the target out.
    local uiScale = UIParent:GetEffectiveScale()
    if uiScale and uiScale > 0 then
        local want = m.host:GetEffectiveScale() / uiScale
        if want > 0 and math.abs(m.frame:GetScale() - want) > 0.001 then
            m.frame:SetScale(want)
        end
    end
end

-- Deep enough to reach the bottom of a retail unit frame. Levels that matter
-- can sit several containers down (UnitFrame → Container → PortraitContainer →
-- …), and a walk that stops short reports a maximum that is too low.
local MAX_LEVEL_SCAN_DEPTH = 10

--- Highest frame level anywhere inside `frame`, ignoring `skip` and its
--- subtree. Reading a Blizzard frame's hierarchy is taint-free.
local function MaxLevelIn(frame, skip, depth)
    local max = frame:GetFrameLevel()
    if depth <= 0 then return max end
    for _, child in ipairs({ frame:GetChildren() }) do
        if child ~= skip then
            local level = MaxLevelIn(child, skip, depth - 1)
            if level > max then max = level end
        end
    end
    return max
end

local STRATA_ORDER = {
    "BACKGROUND", "LOW", "MEDIUM", "HIGH", "DIALOG",
    "FULLSCREEN", "FULLSCREEN_DIALOG", "TOOLTIP",
}
local STRATA_INDEX = {}
for i, name in ipairs(STRATA_ORDER) do STRATA_INDEX[name] = i end

local function NextStrataUp(strata)
    local i = STRATA_INDEX[strata]
    if not i then return "MEDIUM" end
    return STRATA_ORDER[math.min(i + 1, #STRATA_ORDER)]
end

--- Raises an overlay above everything inside `host`.
---
--- A fixed level offset does not work here: the portrait sits in a nested
--- container whose siblings carry levels of their own, and those differ per
--- unit frame and per UI setup. Measuring the subtree is the only way to pick
--- a level without guessing. `frame` is excluded from the measurement so
--- repeated calls settle instead of ratcheting upwards.
---
--- Worth re-running periodically rather than once: Blizzard's own unit frame
--- update runs off the same events we do, so a single measurement taken at
--- target change can be based on levels raised a moment later.
---
---@param bumpStrata boolean|nil
---   Put the overlay one strata above the host instead of alongside it.
---   Needed for overlays that are not children of their host: measured levels
---   alone did not put them in front in practice (a wing frame measured 1000
---   levels above the portrait's container still rendered behind it), and
---   strata outranks level unconditionally. Frames that ARE children of their
---   host already win by hierarchy and must not be bumped, or they would jump
---   out in front of unrelated UI.
function RR:RaiseOverlayAbove(frame, host, bumpStrata)
    if not frame or not host then return end
    local strata = host:GetFrameStrata()
    frame:SetFrameStrata(bumpStrata and NextStrataUp(strata) or strata)
    frame:SetFrameLevel(MaxLevelIn(host, frame, MAX_LEVEL_SCAN_DEPTH) + 1)
end

--- Makes `frame` track `host`'s visibility and scale. Safe to call repeatedly.
---@param raise boolean|nil  also keep the frame levelled above the host
function RR:MirrorHostFrame(frame, host, raise)
    if not frame or not host then return end
    for _, m in ipairs(hostMirrors) do
        if m.frame == frame then
            m.host  = host
            m.raise = raise
            ApplyMirror(m)
            return
        end
    end

    local mirror = { frame = frame, host = host, raise = raise }
    table.insert(hostMirrors, mirror)
    ApplyMirror(mirror)   -- immediately, so nothing pops on the first tick

    if mirrorTicker then return end
    mirrorTicker = CreateFrame("Frame")
    local since = 0
    mirrorTicker:SetScript("OnUpdate", function(_, elapsed)
        -- A quarter second is well under the threshold where a stale overlay
        -- is noticeable, and cheap enough for a handful of frames.
        since = since + elapsed
        if since < 0.25 then return end
        since = 0
        for _, m in ipairs(hostMirrors) do
            ApplyMirror(m)
        end
    end)
end

-- ── Portrait Wings ────────────────────────────────────────────────────────────
-- Overlays a rank-tinted winged border on the player portrait.
--
-- Approach (same as ElitePlayerFrame_Enhanced):
--   • Anchor a texture to PlayerFrame.PlayerFrameContainer.PlayerPortrait
--   • Apply WoW's built-in "UI-HUD-UnitFrame-Target-PortraitOn-Boss-Gold-Winged" atlas
--   • Tint with SetVertexColor(rank.color) so each rank gets its own colour
--   • Fall back to the custom PNG wings if the atlas is unavailable

local portraitWingsFrame  -- parent Frame (UIParent child)
local portraitWingsTex    -- Texture anchored to the portrait

-- Returns the PlayerPortrait region using the correct TWW frame path.
local function GetPlayerPortrait()
    return PlayerFrame
        and PlayerFrame.PlayerFrameContainer
        and PlayerFrame.PlayerFrameContainer.PlayerPortrait
end

function RR:CreatePortraitWings()
    if not PlayerFrame then return end

    -- Deliberately still a child of PlayerFrame, unlike the unit-frame overlays
    -- above: wings inherit its position, scale and visibility for free, and the
    -- taint that costs us is harmless here. The 12.x secret-value protection
    -- covers other units, not your own — PlayerFrame reads only player data, so
    -- a tainted PlayerFrame never hits the comparison that breaks TargetFrame.
    -- ARTWORK sublevel 2 matches ElitePlayerFrame_Enhanced — sits just above the
    -- portrait texture but below health bar chrome and other UI elements.
    local f = CreateFrame("Frame", nil, PlayerFrame)
    f:SetAllPoints(PlayerFrame)
    f:SetFrameLevel(PlayerFrame:GetFrameLevel() + 2)
    portraitWingsFrame = f     -- assign before any fallible call

    local wing = f:CreateTexture(nil, "ARTWORK", nil, 2)
    -- Size is set from atlas native dimensions in UpdatePortraitWings on first call.
    -- Fallback used until atlas dims are known; user can override with /rr wings <size>.
    wing:SetSize(100, 100)
    portraitWingsTex = wing

    local prev = RR.UpdateRankFrame
    RR.UpdateRankFrame = function(self)
        prev(self)
        self:UpdatePortraitWings()
    end

    self:UpdatePortraitWings()
end

--- Debug: print portrait wing state.
function RR:DebugWings()
    print("|cff00ccffRaiderRanked Wings Debug|r")
    local portrait = GetPlayerPortrait()
    print("  PlayerFrame: "              .. tostring(PlayerFrame))
    print("  PlayerFrameContainer: "     .. tostring(PlayerFrame and PlayerFrame.PlayerFrameContainer))
    print("  PlayerPortrait (correct): " .. tostring(portrait))
    print("  WingFrame: "                .. tostring(portraitWingsFrame))
    if portraitWingsTex then
        local p, _, rp, x, y = portraitWingsTex:GetPoint()
        print(string.format("  Tex anchor: %s on %s  offset %.0f,%.0f",
            tostring(p), tostring(rp), x or 0, y or 0))
        print("  Tex size:    " .. tostring(portraitWingsTex:GetWidth()) .. "x" .. tostring(portraitWingsTex:GetHeight()))
        print("  Tex alpha:   " .. tostring(portraitWingsTex:GetAlpha()))
        print("  Tex shown:   " .. tostring(portraitWingsTex:IsVisible()))
        print("  Tex texture: " .. tostring(portraitWingsTex:GetTexture()))
    else
        print("  portraitWingsTex: nil")
    end
    -- Atlas info dump
    local ai = C_Texture and C_Texture.GetAtlasInfo and C_Texture.GetAtlasInfo(WINGS_ATLAS_PLAIN)
    if ai then
        print("  AtlasInfo keys:")
        for k, v in pairs(ai) do print("    " .. tostring(k) .. " = " .. tostring(v)) end
    else
        print("  AtlasInfo: nil (atlas not found)")
    end
end

local WINGS_ATLAS_PLAIN  = "UI-HUD-UnitFrame-Target-PortraitOn-Boss-Gold"
local WINGS_ATLAS_WINGED = "UI-HUD-UnitFrame-Target-PortraitOn-Boss-Gold-Winged"

-- Returns the correct atlas for a given rank + score.
local function GetWingsAtlas(rank, score)
    if not rank or not rank.wingScore then return WINGS_ATLAS_PLAIN end
    return (score and score >= rank.wingScore) and WINGS_ATLAS_WINGED or WINGS_ATLAS_PLAIN
end

-- Applies rank colour to a wing texture starting from a neutral (white) base.
--
-- SetDesaturation(1) converts the atlas to greyscale, neutralising the gold
-- bake-in so rank colours read true.  SetVertexColor / SetGradient then tints
-- that greyscale with the pure rank colour.
--
-- gradientFlip: pass true for the player portrait whose texture is H-flipped
--   (SetTexCoord(1,0,0,1)), so the visual gradient direction is preserved.
local function ApplyWingsColor(tex, rank, gradientFlip)
    tex:SetDesaturation(1)
    if rank.id == "CHALLENGER" then
        local gold    = CreateColor(1.0, 0.85, 0.1,  1)
        local iceblue = CreateColor(0.5, 0.92, 1.0,  1)
        -- HORIZONTAL gradient goes left→right in texture space.
        -- Flipped texture: swap colours so the visual direction stays gold→iceblue.
        if gradientFlip then
            tex:SetGradient("HORIZONTAL", iceblue, gold)
        else
            tex:SetGradient("HORIZONTAL", gold, iceblue)
        end
    else
        local c = rank.color
        tex:SetVertexColor(c.r, c.g, c.b)
    end
end

function RR:UpdatePortraitWings()
    if not portraitWingsTex then return end
    local rank = self.playerRank or self:GetRankForScore(0)

    if rank.id == "UNRANKED" or not (self.db and self.db.showWings ~= false) then
        portraitWingsTex:Hide()
        return
    end

    local c       = rank.color
    local portrait = GetPlayerPortrait()
    local score  = self.playerScore or 0
    local atlas  = GetWingsAtlas(rank, score)

    -- Re-anchor every update in case PlayerFrame was rebuilt (e.g. after UI reload).
    -- Winged atlas is asymmetric; H-flip shifts visual centre → compensate with -10.
    if portrait then
        portraitWingsTex:ClearAllPoints()
        local xOff = (atlas == WINGS_ATLAS_WINGED) and -10 or 0
        portraitWingsTex:SetPoint("CENTER", portrait, "CENTER", xOff, 0)
        -- Being a child of PlayerFrame is not enough on its own: sibling
        -- containers inside it carry their own levels. Measure, same as for
        -- the unit frames.
        self:RaiseOverlayAbove(portraitWingsFrame, PlayerFrame)
    end
    local ai     = C_Texture and C_Texture.GetAtlasInfo and C_Texture.GetAtlasInfo(atlas)
    if ai then
        if ai.width and ai.height then
            portraitWingsTex:SetSize(ai.width, ai.height)
        end
        portraitWingsTex:SetAtlas(atlas, false)
        portraitWingsTex:SetTexCoord(1, 0, 0, 1)   -- flip horizontally
        ApplyWingsColor(portraitWingsTex, rank, true)   -- true = texture is flipped
        portraitWingsTex:SetAlpha(0.90)
        portraitWingsTex:SetBlendMode("BLEND")
    elseif rank.wings then
        portraitWingsTex:SetTexture(rank.wings)
        portraitWingsTex:SetTexCoord(0, 1, 0, 1)
        portraitWingsTex:SetVertexColor(1, 1, 1)
        portraitWingsTex:SetAlpha(0.90)
        portraitWingsTex:SetBlendMode("ADD")
    else
        portraitWingsTex:Hide()
        return
    end

    portraitWingsTex:Show()

    -- Shift the ZZZ rest indicator: higher and slightly to the right, so it
    -- reads as the dragon sleeping rather than the character. This writes to a
    -- Blizzard-owned region and therefore taints PlayerFrame — acceptable for
    -- the same reason the wings stay parented to it: PlayerFrame only ever
    -- reads player data, which is never secret.
    local ri = PlayerFrame
        and PlayerFrame.PlayerFrameContent
        and PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual
        and PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual.PlayerRestLoop
    if ri and ri.SetPointsOffset then ri:SetPointsOffset(87, 14) end
end

-- ── Unit portrait wings (target / focus / party1–4) ─────────────────────────
-- Same atlas + technique as the player wings, but driven by unit-change events.
-- Wings are silently hidden if the portrait region can't be found (e.g. compact
-- party frames where the portrait path differs per UI setup).

local unitWingData = {}   -- [unitToken] = { frame=Frame, tex=Texture }

-- Returns the portrait Texture region for a given unit token, trying multiple
-- known paths to handle different WoW UI versions / frame setups.
-- Ordered list of portrait-finding strategies per unit type.
-- Each entry is a function that returns the portrait region or nil.
-- First non-nil result wins. Extend this list when new frame paths are discovered.
local PORTRAIT_FINDERS = {
    target = {
        function()
            local c = TargetFrame and TargetFrame.TargetFrameContainer
            return c and c.PortraitContainer and c.PortraitContainer.portrait
        end,
        function()
            local c = TargetFrame and TargetFrame.TargetFrameContainer
            return c and (c.TargetPortrait or c.portrait or c.Portrait)
        end,
        function() return TargetFrame and (TargetFrame.portrait or TargetFrame.Portrait) end,
        function() return _G["TargetPortrait"] end,
    },
    focus = {
        function()
            local c = FocusFrame and FocusFrame.FocusFrameContainer
            return c and c.PortraitContainer and c.PortraitContainer.portrait
        end,
        function()
            local c = FocusFrame and FocusFrame.FocusFrameContainer
            return c and (c.FocusPortrait or c.portrait or c.Portrait)
        end,
        function() return FocusFrame and (FocusFrame.portrait or FocusFrame.Portrait) end,
        function() return _G["FocusPortrait"] end,
    },
}
for i = 1, 4 do
    local idx = i
    PORTRAIT_FINDERS["party" .. i] = {
        -- TWW compact party
        function()
            local mf = CompactPartyFrame and CompactPartyFrame["MemberFrame" .. idx]
            return mf and (mf.portrait or mf.Portrait or mf.portraitTexture)
        end,
        -- Legacy PartyMemberFrame
        function()
            local f = _G["PartyMemberFrame" .. idx]
            return f and (f.portrait or f.Portrait)
        end,
    }
end

local function GetUnitPortraitRegion(unit)
    local finders = PORTRAIT_FINDERS[unit]
    if not finders then return nil end
    for _, fn in ipairs(finders) do
        local ok, result = pcall(fn)
        if ok and result then return result end
    end
    return nil
end

--- Forces wings onto a unit regardless of the usual player / score checks, so
--- placement and draw order can be checked against whatever is targeted.
--- Toggles; prints the same numbers as /rr unitdbg afterwards.
function RR:TestUnitWings(unit)
    unit = unit or "target"
    if self.forceUnitWings == unit then
        self.forceUnitWings = nil
        print("|cff00ccffRaiderRanked|r Forced wings off (" .. unit .. ").")
    else
        local previous = self.forceUnitWings
        self.forceUnitWings = unit
        if previous then self:UpdateUnitWings(previous) end
        print("|cff00ccffRaiderRanked|r Forcing Challenger wings on " ..
            unit .. " — repeat the command to stop.")
    end
    self:UpdateUnitWings(unit)
    self:DebugUnitWings(unit)
end

-- Debug: /rr unitdbg target  (or focus / party1 etc.)
function RR:DebugUnitWings(unit)
    unit = unit or "target"
    print(string.format("|cff00ccffRaiderRanked UnitWings Debug [%s]|r", unit))
    print("  UnitExists:      " .. tostring(UnitExists(unit)))
    print("  UnitIsPlayer:    " .. tostring(UnitIsPlayer(unit)))
    print("  UnitIsConnected: " .. tostring(UnitIsConnected(unit)))
    local score = self:GetScoreForUnit(unit)
    print("  Score:           " .. tostring(score))
    local portrait = GetUnitPortraitRegion(unit)
    print("  Portrait found:  " .. tostring(portrait ~= nil))
    if portrait then
        print("  Portrait type:   " .. tostring(portrait:GetObjectType()))
        print("  Portrait size:   " .. tostring(portrait:GetWidth()) .. "x" .. tostring(portrait:GetHeight()))
    else
        -- Walk the known frame tree to help diagnose the correct path
        print("  -- Frame tree walk:")
        if unit == "target" and TargetFrame then
            print("  TargetFrame: " .. tostring(TargetFrame))
            local c = TargetFrame.TargetFrameContainer
            print("  .TargetFrameContainer: " .. tostring(c))
            if c then
                print("    .portrait:         " .. tostring(c.portrait))
                print("    .Portrait:         " .. tostring(c.Portrait))
                print("    .TargetPortrait:   " .. tostring(c.TargetPortrait))
                print("    .PortraitContainer:" .. tostring(c.PortraitContainer))
            end
            print("  TargetFrame.portrait:  " .. tostring(TargetFrame.portrait))
        end
    end
    local d = unitWingData[unit]
    if d then
        print("  Wing tex shown:  " .. tostring(d.tex:IsVisible()))
        -- Draw order and scale are the two things a UIParent-parented overlay
        -- does not get for free, so print both sides of each comparison.
        local owner = portrait and portrait.GetParent and portrait:GetParent()
        print(string.format("  Wings:           %s lvl %d, scale %.3f",
            d.frame:GetFrameStrata(), d.frame:GetFrameLevel(),
            d.frame:GetEffectiveScale()))
        if owner then
            print(string.format("  Portrait owner:  %s lvl %d, scale %.3f",
                owner:GetFrameStrata(), owner:GetFrameLevel(),
                owner:GetEffectiveScale()))
        end
        if d.host then
            print(string.format("  Host frame:      %s lvl %d, scale %.3f, visible %s",
                d.host:GetFrameStrata(), d.host:GetFrameLevel(),
                d.host:GetEffectiveScale(), tostring(d.host:IsVisible())))
            print(string.format("  Highest in host: lvl %d (wings must beat this)",
                MaxLevelIn(d.host, d.frame, MAX_LEVEL_SCAN_DEPTH)))
        end
    else
        print("  Wing data:       not yet created")
    end
end

-- Parent frames for each unit — wings inherit their strata/level automatically.
local UNIT_PARENT_GETTERS = {
    target = function() return TargetFrame end,
    focus  = function() return FocusFrame end,
}
for i = 1, 4 do
    local idx = i
    UNIT_PARENT_GETTERS["party"..i] = function()
        return (CompactPartyFrame and CompactPartyFrame["MemberFrame"..idx])
            or _G["PartyMemberFrame"..idx]
    end
end

--- Resolves the unit frame a set of wings belongs to. Deferred, because the
--- frame may not exist yet the first time a unit token is seen.
local function ResolveWingHost(unit, d)
    if d.host then return d.host end
    local getter = UNIT_PARENT_GETTERS[unit]
    d.host = getter and getter() or nil
    if d.host then
        -- raise = true: the level is re-measured on every tick, not just when
        -- the unit changes, so Blizzard raising its own levels afterwards
        -- cannot leave the wings buried.
        RR:MirrorHostFrame(d.frame, d.host, true)
    end
    return d.host
end

local function EnsureUnitWingData(unit)
    if unitWingData[unit] then return unitWingData[unit] end
    local f = CreateFrame("Frame", nil, UIParent)
    f:SetAllPoints(UIParent)
    f:SetFrameStrata("MEDIUM")
    f:SetFrameLevel(3)
    local tex = f:CreateTexture(nil, "ARTWORK", nil, 2)
    tex:SetSize(200, 200)
    tex:Hide()
    local d = { frame = f, tex = tex }
    unitWingData[unit] = d
    ResolveWingHost(unit, d)
    return d
end

function RR:UpdateUnitWings(unit)
    -- Checked before anything is built: with the option off the addon has no
    -- business creating frames around the unit frames at all.
    if not (RR.db and RR.db.showUnitWings ~= false) then
        local existing = unitWingData[unit]
        if existing then existing.tex:Hide() end
        return
    end

    local d   = EnsureUnitWingData(unit)
    local tex = d.tex
    ResolveWingHost(unit, d)

    -- /rr wingstest bypasses every eligibility check so draw order can be
    -- verified against any target, not only a ranked player who happens to
    -- be standing nearby.
    local forced = (self.forceUnitWings == unit)

    local score, rank
    if forced then
        if not UnitExists(unit) then
            tex:Hide()
            return
        end
        rank  = self.RANK_BY_ID["CHALLENGER"]
        score = rank.wingScore
    else
        if not UnitExists(unit) or not UnitIsPlayer(unit) or not UnitIsConnected(unit) then
            tex:Hide()
            return
        end

        -- Skip low-level players who can't have M+ scores.
        local level = UnitLevel(unit)
        if level and level > 0 and level < 90 then
            tex:Hide()
            return
        end

        score = self:GetScoreForUnit(unit)
        rank  = score and self:GetRankForScore(score)
        if not rank or rank.id == "UNRANKED" then
            tex:Hide()
            return
        end
    end

    local portrait = GetUnitPortraitRegion(unit)
    if not portrait then
        tex:Hide()
        return
    end

    local atlas  = GetWingsAtlas(rank, score)
    local ai     = C_Texture and C_Texture.GetAtlasInfo and C_Texture.GetAtlasInfo(atlas)
    if ai and ai.width and ai.height then
        tex:SetSize(ai.width, ai.height)
    end

    -- The Winged atlas is asymmetric: wings extend to one side, pulling the texture's
    -- geometric centre away from the ring.  A small outward offset re-centres the ring
    -- over the portrait.  Plain atlas is symmetric → no offset needed.
    local xOffset = (atlas == WINGS_ATLAS_WINGED) and 10 or 0
    tex:ClearAllPoints()
    tex:SetPoint("CENTER", portrait, "CENTER", xOffset, 0)
    -- As a child of the unit frame the hierarchy decided what drew on top; as
    -- a sibling that is gone, so the overlay goes a strata up. /rr unitdbg
    -- prints what it resolved to.
    self:RaiseOverlayAbove(d.frame, d.host or portrait:GetParent(), true)
    tex:SetAtlas(atlas, false)
    tex:SetTexCoord(0, 1, 0, 1)   -- no flip (mirrored vs player portrait)
    ApplyWingsColor(tex, rank, false)   -- false = texture is not flipped
    tex:SetAlpha(0.85)
    tex:SetBlendMode("BLEND")
    tex:Show()
end

function RR:UpdateAllUnitWings()
    self:UpdateUnitWings("target")
    self:UpdateUnitWings("focus")
    for i = 1, 4 do self:UpdateUnitWings("party" .. i) end
end

function RR:InitUnitWings()
    local f = CreateFrame("Frame")
    f:RegisterEvent("PLAYER_TARGET_CHANGED")
    f:RegisterEvent("PLAYER_FOCUS_CHANGED")
    f:RegisterEvent("GROUP_ROSTER_UPDATE")
    f:RegisterEvent("UNIT_NAME_UPDATE")
    f:RegisterEvent("UNIT_PORTRAIT_UPDATE")
    f:SetScript("OnEvent", function(_, event, unit)
        if event == "PLAYER_TARGET_CHANGED" then
            RR:UpdateUnitWings("target")
        elseif event == "PLAYER_FOCUS_CHANGED" then
            RR:UpdateUnitWings("focus")
        elseif event == "GROUP_ROSTER_UPDATE" then
            RR:UpdateAllUnitWings()
            RR:UpdateRankFrame()
            RR:RefreshGroupPanel()
        elseif event == "UNIT_NAME_UPDATE" or event == "UNIT_PORTRAIT_UPDATE" then
            -- unit arg may be a token we track — update just that one
            if unit and unitWingData[unit] then
                RR:UpdateUnitWings(unit)
            elseif unit == "target" or unit == "focus" then
                RR:UpdateUnitWings(unit)
            end
        end
    end)
end

-- ── Settings panel (ESC → Options → Addons → RaiderRanked) ───────────────────
-- Uses the WoW Settings API (Dragonflight+/TWW/Midnight).
-- CreateCheckBox was removed in newer builds; we use the layout initializer instead.

function RR:RegisterSettings()
    if not Settings or not Settings.RegisterVerticalLayoutCategory then return end

    local category, layout = Settings.RegisterVerticalLayoutCategory("RaiderRanked")

    -- Helper: register a boolean proxy setting and add it as a checkbox to the layout.
    local function AddCheckbox(varKey, name, tooltip, getValue, setValue)
        local setting = Settings.RegisterProxySetting(
            category,
            "RAIDERRANKED_" .. varKey:upper(),
            Settings.VarType.Boolean,
            name,
            RR.DB_DEFAULTS[varKey],
            getValue,
            setValue)
        -- CreateCheckBox was removed; use the layout's AddInitializer with a
        -- Settings.CreateCheckboxInitializer (TWW+) or fall back to AddSetting.
        local initializer
        if Settings.CreateCheckboxInitializer then
            local options = Settings.CreateCheckboxOptions and Settings.CreateCheckboxOptions(name, tooltip)
            if options then
                initializer = Settings.CreateCheckboxInitializer(setting, options)
            else
                -- Fallback: try single-arg form (setting carries its own name).
                local ok, result = pcall(Settings.CreateCheckboxInitializer, setting)
                if ok then initializer = result end
            end
        end
        if initializer and layout and layout.AddInitializer then
            layout:AddInitializer(initializer)
        end
        return setting
    end

    AddCheckbox("showFrame",
        "Show rank frame",
        "Show the draggable rank / score HUD frame.",
        function() return self.db.showFrame ~= false end,
        function(val) self.db.showFrame = val; self:ToggleRankFrame(val) end)

    AddCheckbox("showInTooltip",
        "Show rank in tooltips",
        "Add rank and M+ score to unit tooltips.",
        function() return self.db.showInTooltip ~= false end,
        function(val) self.db.showInTooltip = val end)

    AddCheckbox("showPvPFrame",
        "Show PvP rank frame",
        "Show a second HUD frame with your PvP rank and rating.",
        function() return self.db.showPvPFrame end,
        function(val) self:TogglePvPRankFrame(val) end)

    AddCheckbox("showPvPInTooltip",
        "Show PvP rank in tooltips",
        "Add PvP rank and rating to unit tooltips.",
        function() return self.db.showPvPInTooltip end,
        function(val) self.db.showPvPInTooltip = val end)

    AddCheckbox("showPvPAura",
        "Show PvP aura on player portrait",
        "Overlay an animated electric aura on your portrait based on PvP rating.",
        function() return self.db.showPvPAura end,
        function(val) self.db.showPvPAura = val; if val then self:UpdatePvPAura() else self:StopPvPAura() end end)

    AddCheckbox("showWings",
        "Show wings on player portrait",
        "Overlay rank-coloured wings on your own player portrait.",
        function() return self.db.showWings ~= false end,
        function(val) self.db.showWings = val; self:UpdatePortraitWings() end)

    AddCheckbox("showUnitWings",
        "Show wings on other players",
        "Overlay rank wings on target, focus, and party portraits.",
        function() return self.db.showUnitWings ~= false end,
        function(val) self.db.showUnitWings = val; self:UpdateAllUnitWings() end)

    AddCheckbox("animUnlocked",
        "Unlock rank-up pop-up position",
        "Show a drag handle for the rank-up pop-up so you can place it anywhere. "
            .. "Right-click the box to save, Escape to discard. Also available as "
            .. "/rr animpos; /rr animpos reset restores the default.",
        function() return self.db.animUnlocked end,
        function(val) self:ToggleAnimMover(val) end)

    AddCheckbox("historyClassColors",
        "Class colours in score history",
        "Colour each character's line in the score history graph by its class "
            .. "instead of the default palette.",
        function() return self.db.historyClassColors end,
        function(val)
            self.db.historyClassColors = val
            -- Report which characters actually have a known class when turning
            -- it on; otherwise an alt on the fallback palette looks like a bug.
            if val then self:PrintClassColorState() else self:RecordCharClass() end
            self:RefreshHistoryGraph()
        end)

    -- History graph button — removed from settings layout to avoid ShouldShow errors.
    -- Use right-click on minimap button or /rr history instead.

    AddCheckbox("showMinimap",
        "Show minimap button",
        "Show the RaiderRanked button on the minimap.",
        function() return not self.db.minimap.hide end,
        function(val) self:ToggleMinimapButton(val) end)

    -- ── Region × Faction cutoff dropdowns ────────────────────────────────
    -- Selects which Raider.IO cutoff set drives the rank thresholds.
    -- Requires Settings.CreateDropdown (TWW+). Silently skipped on older
    -- builds; users can still switch via /rr cutoff.
    if Settings.CreateDropdown then
        local regionSetting = Settings.RegisterProxySetting(
            category,
            "RAIDERRANKED_CUTOFF_REGION",
            Settings.VarType.String,
            "Cutoff region",
            "eu",
            function() return self.db.cutoffRegion or "eu" end,
            function(val) self:SwitchCutoffSelection(val, nil) end)

        local function RegionOptions()
            local c = Settings.CreateControlTextContainer()
            for _, r in ipairs(RR.CUTOFF_REGIONS) do
                c:Add(r, RR.CUTOFF_REGION_LABELS[r] or r)
            end
            return c:GetData()
        end

        Settings.CreateDropdown(
            category, regionSetting, RegionOptions,
            "Which region's M+ rating population determines your rank brackets. \"All Regions\" merges US and EU populations.")

        local factionSetting = Settings.RegisterProxySetting(
            category,
            "RAIDERRANKED_CUTOFF_FACTION",
            Settings.VarType.String,
            "Cutoff faction",
            "all",
            function() return self.db.cutoffFaction or "all" end,
            function(val) self:SwitchCutoffSelection(nil, val) end)

        local function FactionOptions()
            local c = Settings.CreateControlTextContainer()
            for _, f in ipairs(RR.CUTOFF_FACTIONS) do
                c:Add(f, RR.CUTOFF_FACTION_LABELS[f] or f)
            end
            return c:GetData()
        end

        Settings.CreateDropdown(
            category, factionSetting, FactionOptions,
            "Faction-specific cutoff. The M+ Hero title is awarded per faction, so Horde/Alliance often have different 0.1% cutoffs.")
    end

    Settings.RegisterAddOnCategory(category)
    self.settingsCategory = category
end

--- Resize portrait wings in-game: /rr wings 200
function RR:SetPortraitWingsSize(size)
    size = tonumber(size)
    if not size or size < 20 or size > 600 then
        print("|cff00ccffRaiderRanked|r Wings size must be 20–600")
        return
    end
    if portraitWingsTex then
        portraitWingsTex:SetSize(size, size * 0.56)
        print(string.format("|cff00ccffRaiderRanked|r Portrait wings size: %d", size))
    end
end
