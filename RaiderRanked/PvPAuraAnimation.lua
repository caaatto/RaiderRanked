-- RaiderRanked: PvPAuraAnimation.lua
-- Two-layer looping electric aura around the player portrait.
--   Back layer:  behind the portrait (FrameLevel - 1) - full brightness
--   Front layer: above the portrait (FrameLevel + 1)  - lower alpha
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
local pvpAuraFPS = FPS  -- per-aura FPS override
local pvpAuraPause = 0  -- seconds to pause between cycles
local pvpAuraRows = ROWS  -- per-aura row count for varied sheet sizes

-- ── Spritesheet driver ─────────────────────────────────────────────────────

local auraStart = 0

local function CalcTexCoord(elapsed)
    local dt   = elapsed - auraStart
    local cycleDuration = pvpAuraMaxFrames / pvpAuraFPS
    local totalCycle = cycleDuration + pvpAuraPause

    if pvpAuraPause > 0 then
        local posInCycle = dt % totalCycle
        if posInCycle >= cycleDuration then
            -- In pause: hold last frame, hide textures
            if pvpAuraBackTex  then pvpAuraBackTex:SetAlpha(0)  end
            if pvpAuraFrontTex then pvpAuraFrontTex:SetAlpha(0) end
            return 0, 0, 0, 0
        else
            -- In animation: restore alpha
            if pvpAuraBackTex  and pvpAuraBackTex:GetAlpha() == 0 then
                pvpAuraBackTex:SetAlpha(pvpAuraBackAlpha or BACK_ALPHA)
            end
            if pvpAuraFrontTex and pvpAuraFrontTex:GetAlpha() == 0 then
                pvpAuraFrontTex:SetAlpha(pvpAuraFrontAlpha or FRONT_ALPHA)
            end
            dt = posInCycle
        end
    end

    local idx  = math.floor(dt * pvpAuraFPS) % pvpAuraMaxFrames
    local col  = idx % COLS
    local row  = math.floor(idx / COLS)
    local rows = pvpAuraRows

    local left   = col / COLS       + TEXEL_INSET
    local right  = (col + 1) / COLS - TEXEL_INSET
    local top    = row / rows       + TEXEL_INSET
    local bottom = (row + 1) / rows - TEXEL_INSET

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

    -- Both layers stay children of PlayerFrame. The unit-frame overlays in
    -- UI.lua had to move off their host to avoid tainting it, but PlayerFrame
    -- only ever reads player data - which the 12.x secret-value protection does
    -- not cover - so the taint costs nothing here, and being a child keeps
    -- position, scale and draw order exactly as they were.

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

    local xOff = rank.auraOffsetX or 0
    local yOff = rank.auraOffsetY or 0
    for _, tex in ipairs({ pvpAuraBackTex, pvpAuraFrontTex }) do
        tex:SetTexture(sheet)
        tex:ClearAllPoints()
        tex:SetPoint("CENTER", portrait, "CENTER", xOff, yOff)
        tex:Show()
    end

    pvpAuraMaxFrames = frames
    pvpAuraFPS = rank.auraFPS or FPS
    pvpAuraPause = rank.auraPause or 0
    pvpAuraRows = rank.auraRows or ROWS
    pvpAuraBackAlpha = pvpAuraBackTex and pvpAuraBackTex:GetAlpha()
    pvpAuraFrontAlpha = pvpAuraFrontTex and pvpAuraFrontTex:GetAlpha()
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
    print("  /rr pvpaura stop  to stop")
end


function RR:StopPvPAuraTest()
    self:StopPvPAura()
    print("|cff00ccffRaiderRanked|r PvP aura stopped.")
end

--- Resize PvP aura: /rr pvpaura <size>
function RR:SetPvPAuraSize(size)
    size = tonumber(size)
    if not size or size < 40 or size > 400 then
        print("|cff00ccffRaiderRanked|r PvP aura size must be 40-400")
        return
    end
    if pvpAuraBackTex  then pvpAuraBackTex:SetSize(size, size)  end
    if pvpAuraFrontTex then pvpAuraFrontTex:SetSize(size, size) end
    print(string.format("|cff00ccffRaiderRanked|r PvP aura size: %d", size))
end

-- ── PvE Top-100 Electricity Aura ──────────────────────────────────────────
-- Plays electricity_12 once every 30 seconds on the player portrait
-- if the player's M+ score qualifies for Top 100.

local PVE_AURA_SHEET    = "Interface\\AddOns\\RaiderRanked\\Media\\Electricity\\electricity_12_sheet.png"
local PVE_AURA_FRAMES   = 48
local PVE_AURA_ROWS     = 6
local PVE_AURA_FPS      = 60    -- 0.8s cycle
local PVE_AURA_INTERVAL = 30    -- seconds between plays
local PVE_AURA_SIZE     = 200
local PVE_AURA_OFFSET_X = 60

local pveAuraFrame
local pveAuraTex
local pveAuraActive = false
local pveAuraStart  = 0
local pveAuraTicker = nil

local function PveCalcTexCoord(elapsed)
    local dt  = elapsed - pveAuraStart
    local idx = math.floor(dt * PVE_AURA_FPS)
    if idx >= PVE_AURA_FRAMES then
        return nil  -- animation finished
    end
    local col = idx % COLS
    local row = math.floor(idx / COLS)

    local texelInset = 0.5 / (COLS * CELL_PX)
    local left   = col / COLS           + texelInset
    local right  = (col + 1) / COLS     - texelInset
    local top    = row / PVE_AURA_ROWS  + texelInset
    local bottom = (row + 1) / PVE_AURA_ROWS - texelInset

    return left, right, top, bottom
end

local function PveOnUpdate()
    if not pveAuraActive or not pveAuraTex then return end
    local coords = { PveCalcTexCoord(GetTime()) }
    if not coords[1] then
        -- Animation finished - hide until next trigger.
        pveAuraActive = false
        pveAuraTex:Hide()
        return
    end
    pveAuraTex:SetTexCoord(coords[1], coords[2], coords[3], coords[4])
end

local function PlayPveAura()
    if not pveAuraTex then return end
    local portrait = GetPlayerPortrait()
    if not portrait then return end

    pveAuraTex:SetTexture(PVE_AURA_SHEET)
    pveAuraTex:ClearAllPoints()
    pveAuraTex:SetPoint("CENTER", portrait, "CENTER", PVE_AURA_OFFSET_X, 0)
    pveAuraTex:SetSize(PVE_AURA_SIZE, PVE_AURA_SIZE)
    pveAuraTex:Show()

    pveAuraActive = true
    pveAuraStart = GetTime()
end

function RR:CreatePveAura()
    if not PlayerFrame then return end

    -- Child of PlayerFrame for the same reason as CreatePvPAura above.
    local f = CreateFrame("Frame", nil, PlayerFrame)
    f:SetAllPoints(PlayerFrame)
    f:SetFrameLevel(PlayerFrame:GetFrameLevel() + 1)
    pveAuraFrame = f

    pveAuraTex = f:CreateTexture(nil, "ARTWORK", nil, 1)
    pveAuraTex:SetSize(PVE_AURA_SIZE, PVE_AURA_SIZE)
    pveAuraTex:SetBlendMode("ADD")
    pveAuraTex:SetAlpha(1)
    pveAuraTex:Hide()

    f:SetScript("OnUpdate", function() PveOnUpdate() end)
end

function RR:StartPveAuraTicker()
    if pveAuraTicker then return end
    pveAuraTicker = C_Timer.NewTicker(PVE_AURA_INTERVAL, function()
        if not RR.playerScore then return end
        if not RR:IsTop100(RR.playerScore) then return end
        PlayPveAura()
    end)
    -- Also play immediately on first check.
    if self.playerScore and self:IsTop100(self.playerScore) then
        PlayPveAura()
    end
end

function RR:PlayPveAura()
    PlayPveAura()
end

function RR:StopPveAura()
    if pveAuraTicker then
        pveAuraTicker:Cancel()
        pveAuraTicker = nil
    end
    pveAuraActive = false
    if pveAuraTex then pveAuraTex:Hide() end
end
