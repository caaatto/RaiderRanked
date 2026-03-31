-- RaiderRanked: PvPAuraAnimation.lua
-- Two-layer looping electric aura around the player portrait.
--   Back layer:  behind the portrait (FrameLevel - 1) — full brightness
--   Front layer: above the portrait (FrameLevel + 1)  — lower alpha
-- The portrait naturally occludes the center, so the aura appears to
-- wrap around the portrait ring.
-- Uses ADD blend mode so the black spritesheet background is transparent.

local ADDON_NAME, RR = ...

local COLS     = RR.PVP_AURA_COLS       -- 8
local ROWS     = RR.PVP_AURA_ROWS       -- 16
local FPS      = RR.PVP_AURA_FPS        -- 30
local CELL_PX  = RR.PVP_AURA_CELL_PX    -- 512

local TEXEL_INSET = 0.5 / (COLS * CELL_PX)

local BACK_ALPHA  = 0.9   -- behind portrait: bright, mostly visible at edges
local FRONT_ALPHA = 0.35  -- above portrait: subtle glow on top of the face

local pvpAuraBackFrame    -- Frame behind portrait
local pvpAuraFrontFrame   -- Frame above portrait
local pvpAuraBackTex      -- back texture
local pvpAuraFrontTex     -- front texture
local pvpAuraActive  = false
local pvpAuraMaxFrames = 0

-- ── Spritesheet driver ─────────────────────────────────────────────────────

local auraStart = 0

local function CalcTexCoord(elapsed)
    local dt   = elapsed - auraStart
    local idx  = math.floor(dt * FPS) % pvpAuraMaxFrames
    local col  = idx % COLS
    local row  = math.floor(idx / COLS)

    local left   = col / COLS       + TEXEL_INSET
    local right  = (col + 1) / COLS - TEXEL_INSET
    local top    = row / ROWS       + TEXEL_INSET
    local bottom = (row + 1) / ROWS - TEXEL_INSET

    return left, right, top, bottom
end

local function OnUpdate()
    if not pvpAuraActive or pvpAuraMaxFrames == 0 then return end
    local l, r, t, b = CalcTexCoord(GetTime())
    if pvpAuraBackTex  then pvpAuraBackTex:SetTexCoord(l, r, t, b)  end
    if pvpAuraFrontTex then pvpAuraFrontTex:SetTexCoord(l, r, t, b) end
end

-- ── Helpers ────────────────────────────────────────────────────────────────

local function GetPlayerPortrait()
    return PlayerFrame
        and PlayerFrame.PlayerFrameContainer
        and PlayerFrame.PlayerFrameContainer.PlayerPortrait
end

local function SetupTex(tex, alpha)
    tex:SetSize(120, 120)
    tex:SetBlendMode("ADD")
    tex:SetAlpha(alpha)
    tex:Hide()
end

-- ── Public API ─────────────────────────────────────────────────────────────

function RR:CreatePvPAura()
    if not PlayerFrame then return end

    -- Back layer: behind portrait.
    local bf = CreateFrame("Frame", nil, PlayerFrame)
    bf:SetAllPoints(PlayerFrame)
    bf:SetFrameLevel(math.max(PlayerFrame:GetFrameLevel() - 1, 0))
    pvpAuraBackFrame = bf

    pvpAuraBackTex = bf:CreateTexture(nil, "ARTWORK", nil, -1)
    SetupTex(pvpAuraBackTex, BACK_ALPHA)

    -- Front layer: above portrait.
    local ff = CreateFrame("Frame", nil, PlayerFrame)
    ff:SetAllPoints(PlayerFrame)
    ff:SetFrameLevel(PlayerFrame:GetFrameLevel() + 1)
    pvpAuraFrontFrame = ff

    pvpAuraFrontTex = ff:CreateTexture(nil, "ARTWORK", nil, 1)
    SetupTex(pvpAuraFrontTex, FRONT_ALPHA)

    -- Single OnUpdate drives both textures in sync.
    bf:SetScript("OnUpdate", function() OnUpdate() end)
end

local function ApplyAura(rank, portrait)
    local sheet = rank.auraSheet
    local frames = rank.auraFrames or RR.PVP_AURA_FRAMES

    for _, tex in ipairs({ pvpAuraBackTex, pvpAuraFrontTex }) do
        tex:SetTexture(sheet)
        tex:ClearAllPoints()
        tex:SetPoint("CENTER", portrait, "CENTER", 0, 0)
        tex:Show()
    end

    pvpAuraMaxFrames = frames
    pvpAuraActive = true
    auraStart = GetTime()
end

function RR:UpdatePvPAura()
    if not pvpAuraBackTex then return end

    local rank = self.playerPvPRank
    if not rank or rank.id == "PVP_UNRANKED" or not rank.auraSheet then
        self:StopPvPAura()
        return
    end

    if not (self.db and self.db.showPvPAura ~= false) then
        self:StopPvPAura()
        return
    end

    local portrait = GetPlayerPortrait()
    if not portrait then
        self:StopPvPAura()
        return
    end

    ApplyAura(rank, portrait)
end

function RR:StopPvPAura()
    pvpAuraActive = false
    if pvpAuraBackTex  then pvpAuraBackTex:Hide()  end
    if pvpAuraFrontTex then pvpAuraFrontTex:Hide() end
end

--- Test: /rr pvpaura test <rank>
function RR:TestPvPAura(rankName)
    if not pvpAuraBackTex then
        print("|cff00ccffRaiderRanked|r PvP aura not initialised (need PlayerFrame).")
        return
    end

    local portrait = GetPlayerPortrait()
    if not portrait then
        print("|cff00ccffRaiderRanked|r PlayerPortrait not found.")
        return
    end

    local rank
    for _, r in ipairs(self.PVP_RANKS) do
        if r.name:lower() == rankName:lower() or r.id:lower() == rankName:lower() then
            rank = r
            break
        end
    end

    if not rank then
        print("|cff00ccffRaiderRanked|r Unknown PvP rank: " .. rankName)
        local names = {}
        for _, r in ipairs(RR.PVP_RANKS) do names[#names+1] = r.name end
        print("  Available: " .. table.concat(names, ", "))
        return
    end

    if not rank.auraSheet then
        print("|cff00ccffRaiderRanked|r " .. rank.name .. " has no aura sheet.")
        return
    end

    ApplyAura(rank, portrait)

    print(string.format("|cff00ccffRaiderRanked|r Testing PvP aura: %s (%d frames, looping)",
        self:FormatPvPRankName(rank), pvpAuraMaxFrames))
    print(string.format("  Back alpha: %.0f%%  |  Front alpha: %.0f%%", BACK_ALPHA * 100, FRONT_ALPHA * 100))
    print("  /rr pvpaura stop — to stop")
end

function RR:StopPvPAuraTest()
    self:StopPvPAura()
    print("|cff00ccffRaiderRanked|r PvP aura stopped.")
end

--- Resize PvP aura: /rr pvpaura <size>
function RR:SetPvPAuraSize(size)
    size = tonumber(size)
    if not size or size < 40 or size > 400 then
        print("|cff00ccffRaiderRanked|r PvP aura size must be 40–400")
        return
    end
    if pvpAuraBackTex  then pvpAuraBackTex:SetSize(size, size)  end
    if pvpAuraFrontTex then pvpAuraFrontTex:SetSize(size, size) end
    print(string.format("|cff00ccffRaiderRanked|r PvP aura size: %d", size))
end
