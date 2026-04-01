-- RaiderRanked: UI.lua
-- Rank frame, minimap button, and tooltip hook.

local ADDON_NAME, RR = ...

local FRAME_W, FRAME_H = 220, 90
local ICON_SIZE         = 64
local GROUP_ROW_H       = 32   -- height per group member row
local GROUP_ICON_SIZE   = 28   -- emblem icon in group rows
local GROUP_PAD         = 6    -- vertical padding inside group panel

-- ── Helper ───────────────────────────────────────────────────────────────────

local function ColorHex(r, g, b)
    return string.format("|cff%02x%02x%02x", math.floor(r*255), math.floor(g*255), math.floor(b*255))
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
    f:EnableMouse(true)
    f:RegisterForDrag("LeftButton")
    local didDrag = false
    f:SetScript("OnDragStart", function(self)
        didDrag = true
        self:StartMoving()
    end)
    f:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
        local point, _, _, x, y = self:GetPoint()
        RR.db.framePosition = { point = point, x = x, y = y }
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
    f.nameText = nameText

    local scoreText = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    scoreText:SetPoint("TOPLEFT", icon, "RIGHT", 10, -2)
    scoreText:SetJustifyH("LEFT")
    f.scoreText = scoreText

    -- Left-click toggles group panel; right-click hides frame.
    f:SetScript("OnMouseDown", function() didDrag = false end)
    f:SetScript("OnMouseUp", function(self, button)
        if button == "RightButton" then
            self:Hide()
            RR.db.showFrame = false
        elseif button == "LeftButton" and not didDrag then
            RR:ToggleGroupPanel()
        end
    end)

    f:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_TOP")
        GameTooltip:AddLine("RaiderRanked", 0, 0.8, 1)
        GameTooltip:AddLine("Left-click to show group ranks", 1, 1, 1)
        GameTooltip:AddLine("Left-drag to move", 0.7, 0.7, 0.7)
        GameTooltip:AddLine("Right-click to hide  (/rr to show)", 0.7, 0.7, 0.7)
        GameTooltip:Show()
    end)
    f:SetScript("OnLeave", GameTooltip_Hide)

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

    local rankText = row:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    rankText:SetPoint("LEFT", nameText, "RIGHT", 4, 0)
    rankText:SetWidth(70)
    rankText:SetJustifyH("LEFT")
    rankText:SetWordWrap(false)
    row.rankText = rankText

    local scoreText = row:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    scoreText:SetPoint("RIGHT", row, "RIGHT", 0, 0)
    scoreText:SetJustifyH("RIGHT")
    row.scoreText = scoreText

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
        row.rankText:SetText(self:GetRankDisplayName(m.rank, m.score))
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
    f.nameText = nameText

    local scoreText = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    scoreText:SetPoint("TOPLEFT", icon, "RIGHT", 10, -2)
    scoreText:SetJustifyH("LEFT")
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
            tooltip:AddLine("Right-click for score history", 0.5, 0.5, 0.5)
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

    -- Parent to PlayerFrame so wings move/hide with it automatically.
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

    -- Shift the ZZZ rest indicator: higher and slightly to the right.
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

local function EnsureUnitWingData(unit)
    if unitWingData[unit] then return unitWingData[unit] end
    local getter = UNIT_PARENT_GETTERS[unit]
    local parent = (getter and getter()) or UIParent
    local f = CreateFrame("Frame", nil, parent)
    f:SetAllPoints(parent)
    if parent ~= UIParent then
        f:SetFrameLevel(parent:GetFrameLevel() + 2)
    else
        f:SetFrameStrata("MEDIUM")
        f:SetFrameLevel(3)
    end
    local tex = f:CreateTexture(nil, "ARTWORK", nil, 2)
    tex:SetSize(200, 200)
    tex:Hide()
    unitWingData[unit] = { frame = f, tex = tex }
    return unitWingData[unit]
end

function RR:UpdateUnitWings(unit)
    local d   = EnsureUnitWingData(unit)
    local tex = d.tex

    if not (RR.db and RR.db.showUnitWings ~= false) then
        tex:Hide()
        return
    end

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

    local score = self:GetScoreForUnit(unit)
    local rank  = score and self:GetRankForScore(score)
    if not rank or rank.id == "UNRANKED" then
        tex:Hide()
        return
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
            initializer = Settings.CreateCheckboxInitializer(setting, name, tooltip)
        elseif Settings.CreateSettingInitializerFrame then
            initializer = Settings.CreateSettingInitializerFrame(setting)
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

    -- History graph button (not a persistent toggle — just opens the graph).
    do
        local btn = CreateFrame("Button", nil, nil, "UIPanelButtonTemplate")
        btn:SetSize(1, 1)  -- dummy; the initializer handles layout
        if layout and layout.AddInitializer then
            layout:AddInitializer(CreateFromMixins({
                InitFrame = function(_, frame)
                    local b = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
                    b:SetSize(160, 24)
                    b:SetPoint("LEFT", frame, "LEFT", 10, 0)
                    b:SetText("Open Score History")
                    b:SetScript("OnClick", function() RR:ToggleHistoryGraph(true) end)
                end,
            }))
        end
    end

    AddCheckbox("showMinimap",
        "Show minimap button",
        "Show the RaiderRanked button on the minimap.",
        function() return not self.db.minimap.hide end,
        function(val) self:ToggleMinimapButton(val) end)

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
