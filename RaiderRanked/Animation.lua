-- RaiderRanked: Animation.lua
-- Rank-up promotion animation with two-phase crossfade.
--
-- Two-phase system (from WebM tier-promotion videos):
--   fromRank.from  - old rank exit animation (47 frames at 20 fps = 2.35 s)
--   toRank.sheet   - new rank entrance animation (128 frames at 20 fps = 6.4 s)
--
-- Sequence (with fromRank):
--   0.0s  backdrop dims in (subtle overlay, non-blocking)
--   0.3s  glow ring scales in (old rank colour)
--   0.5s  "from" plays on sheetTex2 (ON TOP, sublevel 2)
--         "to" starts simultaneously on sheetTex (underneath, sublevel 1) at alpha 0
--   transitionT  flash fires; "from" fades out, "to" fades in, glow recolours
--   text + glow pulse follow
--   auto-dismiss after generous hold on last frame
--
-- Without fromRank (first rank ever): shorter sequence, to only.
-- Non-blocking overlay: no mouse/keyboard capture, runs to completion.

local ADDON_NAME, RR = ...

-- ── Spritesheet constants ─────────────────────────────────────────────────────
-- Must match Tools/render-spritesheets.js output exactly.
local SHEET_COLS    = 8
local SHEET_ROWS    = 16
local SHEET_FRAMES  = 128  -- "to" sheet: max across all ranks
local FROM_FRAMES   = 47   -- "from" sheet: 47 frames all ranks
local SHEET_FPS     = 20   -- playback speed for all sheets
local SHEET_CELL_PX = 512  -- pixels per cell; 4096×8192 sheet
local CROSSFADE_DUR = 0.6  -- seconds for the from→to crossfade
local EMBLEM_HOLD   = 3.0  -- seconds the static emblem persists after spritesheet ends

-- ── Per-rank sound files ─────────────────────────────────────────────────────
local SOUND_DIR = "Interface\\AddOns\\RaiderRanked\\Media\\Sounds\\"

-- ── Timer + AnimationGroup helpers ───────────────────────────────────────────

local timers     = {}
local animGroups = {}
local animGen    = 0

local function CancelTimers()
    animGen = animGen + 1
    for _, t in ipairs(timers)     do pcall(t.Cancel, t) end
    wipe(timers)
    for _, g in ipairs(animGroups) do pcall(g.Stop, g) end
    wipe(animGroups)
end

local function After(delay, fn)
    local gen = animGen
    table.insert(timers, C_Timer.NewTimer(delay, function()
        if animGen == gen then fn() end
    end))
end

-- ── Spritesheet TexCoord driver (multi-slot) ─────────────────────────────────
-- Drives TexCoord ONLY - alpha is managed separately via alphaTargets.
-- Textures driven here must have ZERO AnimationGroups.

local sheetAnims = {}   -- tex → { start, lastIdx, max }

local TEXEL_INSET = 0.5 / (SHEET_COLS * SHEET_CELL_PX)

local function StartSheetAnim(tex, maxFrames)
    sheetAnims[tex] = {
        start   = GetTime(),
        lastIdx = -1,
        max     = (maxFrames or SHEET_FRAMES) - 1,
    }
    local fw = 1 / SHEET_COLS
    local fh = 1 / SHEET_ROWS
    tex:SetTexCoord(TEXEL_INSET, fw - TEXEL_INSET, TEXEL_INSET, fh - TEXEL_INSET)
end

local function StopSheetAnim(tex)
    if tex then sheetAnims[tex] = nil
    else wipe(sheetAnims) end
end

-- ── Alpha interpolation ──────────────────────────────────────────────────────

local alphaTargets = {}

local function SetAlphaTarget(tex, targetAlpha, duration)
    local current = tex:GetAlpha()
    if not duration or duration <= 0 then
        tex:SetAlpha(targetAlpha)
        alphaTargets[tex] = nil
        return
    end
    alphaTargets[tex] = {
        from     = current,
        to       = targetAlpha,
        start    = GetTime(),
        duration = duration,
    }
end

local function StopAllAlphaTargets()
    wipe(alphaTargets)
end

-- ── AnimationGroup helpers ────────────────────────────────────────────────────

local function Fade(region, fromA, toA, dur, cb)
    local g   = region:CreateAnimationGroup()
    local gen = animGen
    table.insert(animGroups, g)
    local anim = g:CreateAnimation("Alpha")
    anim:SetFromAlpha(fromA)
    anim:SetToAlpha(toA)
    anim:SetDuration(dur)
    anim:SetSmoothing(toA > fromA and "OUT" or "IN")
    g:SetScript("OnFinished", function()
        if animGen ~= gen then return end
        region:SetAlpha(toA)
        if cb then cb() end
    end)
    g:Play()
end

local function ScaleTo(region, sx, sy, ex, ey, dur, smoothing, cb)
    local g   = region:CreateAnimationGroup()
    local gen = animGen
    table.insert(animGroups, g)
    local s = g:CreateAnimation("Scale")
    s:SetOrigin("CENTER", 0, 0)
    if s.SetFromScale then
        s:SetFromScale(sx, sy)
        s:SetToScale(ex, ey)
    else
        s:SetScaleFrom(sx, sy)
        s:SetScaleTo(ex, ey)
    end
    s:SetDuration(dur)
    s:SetSmoothing(smoothing or "OUT")
    if cb then
        g:SetScript("OnFinished", function()
            if animGen ~= gen then return end
            cb()
        end)
    end
    g:Play()
end

-- ── Frame (built once) ────────────────────────────────────────────────────────

local animFrame

local function Build()
    if animFrame then return end

    local f = CreateFrame("Frame", "RaiderRankedAnimFrame", UIParent)
    f:SetAllPoints()
    f:SetFrameStrata("HIGH")
    f:EnableMouse(false)
    f:EnableKeyboard(false)
    f:Hide()

    local bg = f:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints()
    bg:SetColorTexture(0, 0, 0, 0)
    f.bg = bg

    -- All animation content hangs off a movable anchor so the pop-up can be
    -- placed anywhere (see RR:ApplyAnimPosition / RR:ToggleAnimMover).  The
    -- outer frame stays full-screen because bg and flash cover the whole UI.
    local anchor = CreateFrame("Frame", "RaiderRankedAnimAnchor", f)
    anchor:SetSize(600, 600)
    f.anchor = anchor

    local glow = f:CreateTexture(nil, "ARTWORK", nil, 0)
    glow:SetSize(650, 650)
    glow:SetPoint("CENTER", anchor, "CENTER", 0, 0)
    glow:SetTexture("Interface\\Common\\Common-WhiteCircle")
    glow:SetBlendMode("ADD")
    glow:SetAlpha(0)
    f.glow = glow

    -- "To" animation (new rank) - sublevel 1 (underneath).
    -- ZERO AnimationGroups. TexCoord + alpha driven by OnUpdate.
    local sheetTex = f:CreateTexture(nil, "OVERLAY", nil, 1)
    sheetTex:SetSize(600, 600)
    sheetTex:SetPoint("CENTER", anchor, "CENTER", 0, 0)
    sheetTex:SetBlendMode("ADD")
    sheetTex:SetAlpha(0)
    f.sheetTex = sheetTex

    -- "From" animation (old rank) - sublevel 2 (ON TOP of sheetTex).
    -- Same constraints: ZERO AnimationGroups.
    local sheetTex2 = f:CreateTexture(nil, "OVERLAY", nil, 2)
    sheetTex2:SetSize(600, 600)
    sheetTex2:SetPoint("CENTER", anchor, "CENTER", 0, 0)
    sheetTex2:SetBlendMode("ADD")
    sheetTex2:SetAlpha(0)
    f.sheetTex2 = sheetTex2

    -- Static emblem (still-frame that persists after spritesheet fades out).
    -- BLEND mode with transparent background. Sublevel 2 so it renders above
    -- the fading "to" spritesheet. 600×338 preserves the 16:9 source ratio.
    local emblemTex = f:CreateTexture(nil, "OVERLAY", nil, 2)
    emblemTex:SetSize(600, 338)
    emblemTex:SetPoint("CENTER", anchor, "CENTER", 0, 0)
    emblemTex:SetBlendMode("BLEND")
    emblemTex:SetAlpha(0)
    f.emblemTex = emblemTex

    local flash = f:CreateTexture(nil, "OVERLAY", nil, 3)
    flash:SetAllPoints()
    flash:SetColorTexture(1, 1, 1, 0)
    f.flash = flash

    -- Text anchored relative to CENTER of the crest.
    -- The emblem content sits within ~60% of the 600px texture (radial vignette),
    -- so -130 keeps labels tight below the visible emblem.
    local label = f:CreateFontString(nil, "OVERLAY")
    label:SetFont("Fonts\\FRIZQT__.TTF", 50, "OUTLINE")
    label:SetPoint("TOP", sheetTex, "CENTER", 0, -130)
    label:SetAlpha(0)
    f.label = label

    local subLabel = f:CreateFontString(nil, "OVERLAY")
    subLabel:SetFont("Fonts\\FRIZQT__.TTF", 24, "OUTLINE")
    subLabel:SetPoint("TOP", label, "BOTTOM", 0, -6)
    subLabel:SetAlpha(0)
    f.subLabel = subLabel

    local scoreLabel = f:CreateFontString(nil, "OVERLAY")
    scoreLabel:SetFont("Fonts\\FRIZQT__.TTF", 17, "OUTLINE")
    scoreLabel:SetPoint("TOP", subLabel, "BOTTOM", 0, -4)
    scoreLabel:SetTextColor(1, 1, 1, 0.8)
    scoreLabel:SetAlpha(0)
    f.scoreLabel = scoreLabel

    -- ── OnUpdate: TexCoord driver + alpha interpolation ──────────────────────
    local fw = 1 / SHEET_COLS
    local fh = 1 / SHEET_ROWS
    f:SetScript("OnUpdate", function()
        local now = GetTime()

        for tex, anim in pairs(sheetAnims) do
            local idx = math.min(
                math.floor((now - anim.start) * SHEET_FPS),
                anim.max)
            if idx ~= anim.lastIdx then
                anim.lastIdx = idx
                local col = idx % SHEET_COLS
                local row = math.floor(idx / SHEET_COLS)
                tex:SetTexCoord(
                    col * fw       + TEXEL_INSET, (col + 1) * fw - TEXEL_INSET,
                    row * fh       + TEXEL_INSET, (row + 1) * fh - TEXEL_INSET)
            end
        end

        local alphaRemove
        for tex, at in pairs(alphaTargets) do
            local t = (now - at.start) / at.duration
            if t >= 1 then
                tex:SetAlpha(at.to)
                if not alphaRemove then alphaRemove = {} end
                alphaRemove[tex] = at.to
            else
                tex:SetAlpha(at.from + (at.to - at.from) * t)
            end
        end
        if alphaRemove then
            for tex, toAlpha in pairs(alphaRemove) do
                alphaTargets[tex] = nil
                if toAlpha == 0 then sheetAnims[tex] = nil end
            end
        end
    end)

    animFrame = f
    RR:ApplyAnimPosition()
end

-- ── Pop-up position ──────────────────────────────────────────────────────────
-- The rank-up pop-up used to sit at a hard-coded CENTER + 90px offset.  It is
-- now user-placeable; the default below reproduces the old placement exactly.

local animMover
local moverOrigPos   -- position snapshot taken on show, restored when cancelled

--- Current pop-up anchor, falling back to the default before the DB exists.
local function AnimPos()
    local p = RR.db and RR.db.animPosition
    if type(p) ~= "table" or not p.point then
        return RR.DB_DEFAULTS.animPosition
    end
    return p
end

--- Re-anchors the animation content (and the mover, if shown) from the DB.
function RR:ApplyAnimPosition()
    local p = AnimPos()
    local function Anchor(region)
        if not region then return end
        region:ClearAllPoints()
        region:SetPoint(p.point, UIParent, p.point, p.x, p.y)
    end
    Anchor(animFrame and animFrame.anchor)
    Anchor(animMover)
end

--- Restores the default placement.
function RR:ResetAnimPosition()
    self.db.animPosition = CopyTable(self.DB_DEFAULTS.animPosition)
    self:ApplyAnimPosition()
    print("|cff00ccffRaiderRanked|r Rank-up pop-up position reset.")
end

local function BuildMover()
    if animMover then return animMover end

    -- Roughly the footprint of the visible content: the 600×338 emblem plus the
    -- three labels that hang below it.  What you drag is what you get.
    local m = CreateFrame("Frame", "RaiderRankedAnimMover", UIParent, "BackdropTemplate")
    m:SetSize(600, 420)
    m:SetFrameStrata("DIALOG")
    m:SetBackdrop({
        bgFile   = "Interface\\Buttons\\WHITE8X8",
        edgeFile = "Interface\\Buttons\\WHITE8X8",
        tile = false, edgeSize = 1,
    })
    m:SetBackdropColor(0, 0.8, 1, 0.12)
    m:SetBackdropBorderColor(0, 0.8, 1, 0.8)
    m:SetMovable(true)
    m:EnableMouse(true)
    m:SetClampedToScreen(true)
    m:RegisterForDrag("LeftButton")
    m:SetScript("OnDragStart", m.StartMoving)
    m:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
        -- Always store a CENTER offset: StartMoving may leave the frame anchored
        -- by a different point, and the mover and the animation anchor have
        -- different sizes - only a shared CENTER keeps them aligned.
        local ux, uy = UIParent:GetCenter()
        local mx, my = self:GetCenter()
        RR.db.animPosition = { point = "CENTER", x = mx - ux, y = my - uy }
        RR:ApplyAnimPosition()
    end)

    -- Right-click anywhere on the box locks in the current position.
    m:SetScript("OnMouseUp", function(self, button)
        if button == "RightButton" then RR:LockAnimMover() end
    end)

    -- Escape routes through UISpecialFrames, which just calls Hide().  OnHide
    -- therefore treats "hidden without a commit flag" as a cancel and rolls the
    -- position back to the snapshot taken when the box was opened.
    m:SetScript("OnHide", function(self)
        if not self.commit and moverOrigPos then
            RR.db.animPosition = moverOrigPos
            RR:ApplyAnimPosition()
            print("|cff00ccffRaiderRanked|r Pop-up position discarded.")
        end
        self.commit  = nil
        moverOrigPos = nil
        RR.db.animUnlocked = false
    end)
    tinsert(UISpecialFrames, "RaiderRankedAnimMover")

    local label = m:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    label:SetPoint("CENTER", m, "CENTER", 0, 20)
    label:SetText("|cff00ccffRaiderRanked|r rank-up pop-up")

    local hint = m:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    hint:SetPoint("TOP", label, "BOTTOM", 0, -8)
    hint:SetJustifyH("CENTER")
    hint:SetText("Left-drag to move\n"
        .. "|cff00ff00Right-click|r to save  ·  |cffff6666Escape|r to discard\n"
        .. "|cffaaaaaa/rr animpos reset|r restores the default")

    m:Hide()
    animMover = m
    return m
end

--- Hides the mover, keeping wherever the box was dragged to.
function RR:LockAnimMover()
    if not animMover or not animMover:IsShown() then return end
    animMover.commit = true
    animMover:Hide()
    print("|cff00ccffRaiderRanked|r Pop-up position saved.")
end

--- Hides the mover and restores the position it had when it was opened.
function RR:CancelAnimMover()
    if not animMover or not animMover:IsShown() then return end
    animMover.commit = false
    animMover:Hide()
end

--- Shows/hides the drag handle for the pop-up.  Pass nil to toggle.
function RR:ToggleAnimMover(show)
    local m = BuildMover()
    if show == nil then show = not m:IsShown() end

    if show then
        if m:IsShown() then return end
        -- Snapshot for the Escape rollback.
        moverOrigPos = CopyTable(AnimPos())
        self:ApplyAnimPosition()
        m:Show()
        self.db.animUnlocked = true
        print("|cff00ccffRaiderRanked|r Pop-up unlocked. Drag the box, "
            .. "|cff00ff00right-click|r to save, |cffff6666Escape|r to discard. "
            .. "Preview with |cffffff00/rr anim challenger|r.")
    else
        -- Explicit lock (slash command or settings checkbox) keeps the position.
        self:LockAnimMover()
    end
end

-- ── Internal: glow pulse loop ─────────────────────────────────────────────────

local function StartGlowPulse(f)
    local function Pulse()
        if not animFrame or not animFrame:IsShown() then return end
        ScaleTo(f.glow, 1.0, 1.0, 1.08, 1.08, 0.8, "IN_OUT", function()
            ScaleTo(f.glow, 1.08, 1.08, 1.0, 1.0, 0.8, "IN_OUT", function()
                After(0.3, Pulse)
            end)
        end)
    end
    Pulse()
end

-- ── Public: play ──────────────────────────────────────────────────────────────

function RR:PlayRankUpAnimation(fromRank, toRank, newScore)
    Build()
    local f  = animFrame
    local cf = fromRank and fromRank.color or toRank.color
    local ct = toRank.color

    CancelTimers()
    StopAllAlphaTargets()
    f.sheetTex:SetAlpha(0)
    f.sheetTex2:SetAlpha(0)
    f.emblemTex:SetAlpha(0)
    StopSheetAnim()

    local hasFrom = fromRank and fromRank.from

    -- Challenger/Grandmaster get a longer emblem hold - they're the pinnacle ranks.
    local holdTime = EMBLEM_HOLD
    if toRank.id == "CHALLENGER" then holdTime = 6.0
    elseif toRank.id == "GRANDMASTER" then holdTime = 5.0 end

    f.glow:SetVertexColor(cf.r, cf.g, cf.b, 1)

    f.label:SetText("RANK UP!")
    f.label:SetTextColor(ct.r, ct.g, ct.b)
    f.subLabel:SetText(RR:GetRankDisplayName(toRank, newScore))
    f.subLabel:SetTextColor(ct.r, ct.g, ct.b)
    f.scoreLabel:SetText(string.format("%.0f M+ Rating", newScore or 0))

    -- Pre-load emblem texture for the still-frame phase.
    if toRank.emblem then
        f.emblemTex:SetTexture(toRank.emblem)
    end

    f.bg:SetColorTexture(0, 0, 0, 0)
    f.glow:SetAlpha(0)
    f.sheetTex:SetAlpha(0)
    f.sheetTex2:SetAlpha(0)
    f.emblemTex:SetAlpha(0)
    f.flash:SetColorTexture(1, 1, 1, 0)
    f.label:SetAlpha(0)
    f.subLabel:SetAlpha(0)
    f.scoreLabel:SetAlpha(0)

    f:Show()

    -- Per-rank sound (e.g. to_diamond.ogg). Falls back to achievement chime.
    local soundFile = SOUND_DIR .. "to_" .. toRank.id:lower() .. ".ogg"
    local ok = pcall(PlaySoundFile, soundFile, "Master")
    if not ok then
        pcall(PlaySound, SOUNDKIT and SOUNDKIT.ACHIEVEMENT_EARNED or 888)
    end

    -- 0.0 s  moderate backdrop - dark enough for ADD-blend spritesheets to
    -- read clearly, light enough to not feel like a full-screen takeover.
    Fade(f.bg, 0, 0.45, 0.5, function()
        f.bg:SetColorTexture(0, 0, 0, 0.45)
    end)

    -- 0.3 s  glow ring scales in.
    After(0.3, function()
        Fade(f.glow, 0, 0.75, 0.5)
        ScaleTo(f.glow, 0.5, 0.5, 1.0, 1.0, 0.6, "OUT")
    end)

    -- Per-rank frame count (some videos are shorter than SHEET_FRAMES).
    local toFrames = toRank.toFrames or SHEET_FRAMES

    if hasFrom then
        -- ── Two-phase: from (on top) + to (underneath) ──────────────────────
        --
        -- sheetTex  (sublevel 1): "to" animation - starts at transition, revealed by flash
        -- sheetTex2 (sublevel 2): "from" animation - plays on top, fades out at flash
        --
        -- The "from" animation plays ON TOP.  At the transition flash, "from"
        -- fades out and "to" begins from frame 0 - so the new-rank crest
        -- appears from the very start of its video, not mid-animation.

        local fromDur     = FROM_FRAMES / SHEET_FPS              -- 2.35 s
        local transitionT = 0.5 + fromDur - 0.2                  -- flash 0.2 s before from ends

        -- 0.5 s  "from" starts; pre-load "to" texture (but don't animate yet).
        After(0.5, function()
            -- Pre-load "to" texture so it's ready for transition.
            f.sheetTex:SetTexture(toRank.sheet or toRank.emblem)
            f.sheetTex:SetAlpha(0)

            -- "From" starts on top, fully visible.
            f.sheetTex2:SetTexture(fromRank.from)
            StartSheetAnim(f.sheetTex2, FROM_FRAMES)
            f.sheetTex2:SetAlpha(1)
        end)

        -- Transition: flash → from fades out → to starts from frame 0.
        After(transitionT, function()
            -- Flash covers the transition.
            f.flash:SetColorTexture(1, 0.65, 0.1, 0)
            Fade(f.flash, 0, 0.8, 0.2)

            -- "From" fades out on top.
            SetAlphaTarget(f.sheetTex2, 0, CROSSFADE_DUR)

            -- "To" starts from frame 0 NOW and fades in (use per-rank frame count).
            if toRank.sheet then StartSheetAnim(f.sheetTex, toFrames) end
            SetAlphaTarget(f.sheetTex, 1, CROSSFADE_DUR)

            -- Recolour glow to new rank.
            f.glow:SetVertexColor(ct.r, ct.g, ct.b, 1)
            ScaleTo(f.glow, 1.0, 1.0, 1.3, 1.3, 0.15, "OUT", function()
                ScaleTo(f.glow, 1.3, 1.3, 1.0, 1.0, 0.4, "OUT")
            end)

            -- Flash fades out.
            After(0.2, function()
                Fade(f.flash, 0.8, 0, 0.4)
            end)
        end)

        After(transitionT + 1.8, function()
            Fade(f.label,      0, 1,   0.3)
            Fade(f.subLabel,   0, 1,   0.3)
            Fade(f.scoreLabel, 0, 1,   0.3)
        end)
        After(transitionT + 2.3, function() StartGlowPulse(f) end)

        -- "to" starts at transitionT, runs for toDur.
        local toDur     = toFrames / SHEET_FPS
        local toEndT    = transitionT + toDur

        -- Cross-fade to static emblem as spritesheet nears its end.
        After(toEndT - 1.0, function()
            if toRank.emblem then
                SetAlphaTarget(f.emblemTex, 1, 1.0)
            end
        end)

        -- Auto-dismiss: hold the emblem still-frame for 3 s after spritesheet ends.
        After(toEndT + holdTime, function() RR:DismissAnimation() end)

    else
        -- ── No fromRank: first rank ever - "to" plays directly ───────────────

        f.sheetTex:SetTexture(toRank.sheet or toRank.emblem)

        After(0.5, function()
            if toRank.sheet then StartSheetAnim(f.sheetTex, toFrames) end
            f.sheetTex:SetAlpha(1)
        end)

        After(1.0, function()
            Fade(f.label,      0, 1,   0.3)
            Fade(f.subLabel,   0, 1,   0.3)
            Fade(f.scoreLabel, 0, 1,   0.3)
        end)

        After(1.5, function() StartGlowPulse(f) end)

        local toDur  = toFrames / SHEET_FPS
        local toEndT = 0.5 + toDur

        -- Cross-fade to static emblem as spritesheet nears its end.
        After(toEndT - 1.0, function()
            if toRank.emblem then
                SetAlphaTarget(f.emblemTex, 1, 1.0)
            end
        end)

        -- Auto-dismiss: hold the emblem still-frame for 3 s after spritesheet ends.
        After(toEndT + holdTime, function() RR:DismissAnimation() end)
    end
end

-- ── Public: dismiss ───────────────────────────────────────────────────────────

function RR:DismissAnimation()
    if not animFrame or not animFrame:IsShown() then return end
    CancelTimers()

    local f       = animFrame
    local regions = { f.sheetTex, f.sheetTex2, f.emblemTex, f.glow, f.label, f.subLabel, f.scoreLabel, f.flash }

    local g = f:CreateAnimationGroup()
    local a = g:CreateAnimation("Alpha")
    a:SetFromAlpha(1); a:SetToAlpha(0); a:SetDuration(0.4); a:SetSmoothing("IN")
    g:SetScript("OnFinished", function()
        f:Hide()
        f:SetAlpha(1)
        f.bg:SetColorTexture(0, 0, 0, 0)
        for _, r in ipairs(regions) do r:SetAlpha(0) end
        StopAllAlphaTargets()
        StopSheetAnim()
    end)
    g:Play()
end

-- ── Public: test helper ───────────────────────────────────────────────────────

function RR:TestAnimation(fromId, toId)
    local from = fromId and self.RANK_BY_ID[fromId:upper()]
    local to   = toId   and self.RANK_BY_ID[toId:upper()]
    if not to then
        print("|cff00ccffRaiderRanked|r Unknown rank: " .. tostring(toId))
        print("Ranks: IRON BRONZE SILVER GOLD PLATINUM EMERALD DIAMOND MASTER GRANDMASTER CHALLENGER")
        return
    end
    self:PlayRankUpAnimation(from, to, to.minScore + 50)
end
