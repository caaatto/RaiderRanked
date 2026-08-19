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
local PLOT_PAD_RIGHT   = 90
local MAX_VISIBLE_PTS  = 100
local LINE_THICKNESS   = 2
local DOT_SIZE         = 6

-- Points kept per character when a season is archived. Enough to preserve the
-- shape of the curve, far below MAX_ENTRIES so old seasons cannot grow the
-- saved variables without bound.
local ARCHIVE_POINTS   = 120

-- Forward declaration: the season archive downsamples through LTTB, and it is
-- defined further down with the rest of the graph maths.
local LTTB

-- Tabs hang off the left edge like flags rather than sitting inside the
-- window. Nothing in the window has to move for them, so the graph keeps its
-- full size and the header row stays as it was.
local TAB_W, TAB_H  = 92, 26
local TAB_GAP       = 4
local TAB_TOP       = 14   -- first tab, below the window's accent strip
local TABS = {
    { id = "history", label = "History", title = "Score History" },
    { id = "ladder",  label = "Ladder",  title = "Rank Ladder"   },
    { id = "seasons", label = "Seasons", title = "Seasons"       },
}

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

-- MN Season 2 start: 19 August 2026, 04:00 UTC (EU reset).
local SEASON_START = time({ year = 2026, month = 8, day = 19, hour = 4, min = 0, sec = 0 })
-- Label for the season above. Patched alongside SEASON_START by
-- scripts/patch_addon.py; only ever used for display, so a stale value
-- costs a wrong caption and nothing else.
local SEASON_NAME = "MN Season 2"

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

-- ── Class colours ───────────────────────────────────────────────────────────
-- Opt-in (db.historyClassColors): colour each character's line by its class
-- instead of the ALT_COLORS palette.  A class is only known for characters that
-- have been logged into since the addon started recording it, so anything
-- unknown falls back to the palette - the graph never loses a line over it.

--- Stores the current character's class token so alts can be coloured later.
--- Cheap and idempotent, so it is called from several points: UnitClass()
--- returns nothing during ADDON_LOADED, and a single call from there would
--- silently never record anything.
local function RecordClass()
    if not RR.db then return end
    local key = CharKey()
    if not key then return end
    local _, classFile = UnitClass("player")
    if not classFile or classFile == "" then return end
    RR.db.charClass = RR.db.charClass or {}
    RR.db.charClass[key] = classFile
end

--- Public wrapper so Core can record the class once the player exists.
function RR:RecordCharClass()
    RecordClass()
end

--- Class colour for a stored character key, or nil if unknown.
---@return table|nil color  { r = number, g = number, b = number }
local function ClassColor(key)
    local classFile = RR.db and RR.db.charClass and RR.db.charClass[key]
    if not classFile then return nil end
    -- CUSTOM_CLASS_COLORS is set by ClassColors-style addons; respect it.
    local palette = CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS
    local c = palette and palette[classFile]
    if not c then return nil end
    return { r = c.r, g = c.g, b = c.b }
end

--- Resolves a character's line/label colour.
---@param key string        "Name-Realm"
---@param altIdx number     palette index used when no class colour applies
---@param rankColor table|nil colour for the current char when class colours are off
local function CharLineColor(key, altIdx, rankColor)
    if RR.db and RR.db.historyClassColors then
        local c = ClassColor(key)
        if c then return c end
    end
    if rankColor then return rankColor end
    return ALT_COLORS[(altIdx % #ALT_COLORS) + 1]
end

--- Prints the option state plus which characters have a known class, so a
--- character still on the fallback palette is obvious instead of puzzling.
function RR:PrintClassColorState()
    RecordClass()

    local known, unknown = {}, {}
    for key in pairs(self.db.charHistory or {}) do
        local classFile = self.db.charClass and self.db.charClass[key]
        if classFile then
            table.insert(known, ShortCharName(key) .. " |cff888888(" .. classFile:lower() .. ")|r")
        else
            table.insert(unknown, ShortCharName(key))
        end
    end
    table.sort(known)
    table.sort(unknown)

    print(string.format("|cff00ccffRaiderRanked|r History class colours: %s",
        self.db.historyClassColors and "|cff00ff00ON|r" or "|cffff0000OFF|r"))
    print("  known:   " .. (#known > 0 and table.concat(known, ", ") or "none"))
    print("  unknown: " .. (#unknown > 0
        and (table.concat(unknown, ", ") .. " |cff888888(log in once on each)|r")
        or "none"))
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

    -- File away a finished season before anything reads the history - this
    -- also prunes the points it archived, so the cleanup below can drop any
    -- character that had nothing but last season's data.
    self:ArchiveSeasonIfRolled()
    self:RepairArchivedCutoffs(self.db)

    -- One-off repair for saves written before zero scores were skipped: drop
    -- any 0 recorded *after* a real score. Those are season-end readings, and
    -- left in place they draw a cliff to the floor. The leading anchor entry
    -- is deliberately kept - that one is the season's starting point.
    for _, history in pairs(self.db.charHistory) do
        local firstScored
        for i = 1, #history do
            local value = history[i][2]
            if value and value > 0 then
                firstScored = i
                break
            end
        end
        if firstScored then
            for i = #history, firstScored + 1, -1 do
                local value = history[i][2]
                if not value or value <= 0 then
                    table.remove(history, i)
                end
            end
        end
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

    -- Remember this character's class for the class-colour option.
    RecordClass()

    -- Drop class entries for characters whose history is gone.
    if self.db.charClass then
        for k in pairs(self.db.charClass) do
            if not self.db.charHistory[k] then
                self.db.charClass[k] = nil
            end
        end
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

    -- Runs well after login, so this is the reliable point to learn the class.
    RecordClass()
    local score = self.playerScore
    if not score then return end

    -- A score of 0 means "no runs recorded", not "scored zero". At a season
    -- end every player reads 0, and recording that would draw a cliff to the
    -- floor across the whole roster and drag the season's closing figures down
    -- with it. The {SEASON_START, 0} anchor already gives a new season its
    -- starting point, so nothing is lost by skipping these.
    if score <= 0 then return end

    -- The season peak is tracked separately from the history points so it
    -- survives MAX_ENTRIES trimming - on a long season the entry that held
    -- the peak can be evicted long before the season is archived.
    self.db.charPeak = self.db.charPeak or {}
    if (self.db.charPeak[key] or 0) < score then
        self.db.charPeak[key] = score
    end

    self:RecordBestRank(key, score)

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

-- ── Season archive ──────────────────────────────────────────────────────────
-- When the daily patcher moves SEASON_START forward, the finished season is
-- condensed into db.seasonArchive before its history points are dropped:
-- one record per season, one row per character (peak and final score plus the
-- rank each of those was worth under that season's cutoffs).
--
-- db.seasonStart / db.seasonName mirror the constants as of the last login and
-- are what tells us a rollover happened at all.

--- Highest rank whose threshold the score clears, under a given threshold set.
--- Falls back to the live RR.RANKS values where the set has no entry, so an
--- old record without stored thresholds still resolves to something sane.
local function RankIdFor(score, thresholds)
    local bestId, bestMin
    for _, rank in ipairs(RR.RANKS) do
        if rank.id ~= "UNRANKED" then
            local minScore = (thresholds and thresholds[rank.id]) or rank.minScore
            if score >= minScore and (not bestMin or minScore > bestMin) then
                bestId, bestMin = rank.id, minScore
            end
        end
    end
    return bestId or "UNRANKED"
end

--- Approximate percentile for a score, under a given threshold set.
---
--- Each rank owns a fixed percentile band (RR.RANK_PERCENTILES), and the score
--- range of that band is the distance to the next rank's threshold. Where the
--- score sits inside its range maps linearly onto where it sits inside the
--- band. That is an approximation - the real distribution is not linear within
--- a bracket - but it is derived from the same cutoffs the ranks are, so it can
--- never disagree with the rank shown beside it.
---@return number|nil percentile, table|nil rank
local function ScorePercentile(score, thresholds)
    if not score or score <= 0 then return nil end

    local rank, rankMin
    for _, r in ipairs(RR.RANKS) do
        if r.id ~= "UNRANKED" then
            local minScore = (thresholds and thresholds[r.id]) or r.minScore
            if score >= minScore and (not rankMin or minScore > rankMin) then
                rank, rankMin = r, minScore
            end
        end
    end
    if not rank then return nil end

    local band = RR.RANK_PERCENTILES and RR.RANK_PERCENTILES[rank.id]
    if not band then return nil, rank end

    -- Fraction of the way from this rank's threshold to the next rank's.
    local nextRank = RR:GetNextRank(rank)
    local upper = nextRank
        and ((thresholds and thresholds[nextRank.id]) or nextRank.minScore)
    local frac = 0
    if upper and upper > rankMin then
        frac = math.min(1, (score - rankMin) / (upper - rankMin))
    end

    -- band[1] is the top edge (the smaller percentage), band[2] the bottom.
    return band[2] - frac * (band[2] - band[1]), rank
end

RR.ScorePercentile = function(_, score, thresholds)
    return ScorePercentile(score, thresholds)
end

--- Walks one character's history over [fromTs, toTs) and reports the peak, the
--- last recorded score, when that was, and the newest threshold set seen up to
--- toTs (which is what the closing rank should be judged against).
--- Also reports the thresholds that were in effect *at the peak*, which is not
--- the same set as at the season's end. Cutoffs climb all season as the field
--- gains score, so judging an April peak by August's cutoffs makes it look
--- worse than it was. The peak is only meaningful against the ladder it was
--- standing on.
-- Switching region or faction rewrites the active thresholds, so a burst of
-- points can share one score while carrying wildly different cutoffs. Those are
-- previews, not ladder movement, and the best of them would be the most
-- flattering rather than the most accurate. Real threshold updates land once a
-- day; anything repeating within this window is a burst, and only its last
-- point counts.
local SWITCH_BURST_SECONDS = 300

local function ScanSeason(history, fromTs, toTs)
    local peak, peakAt, final, finalTs, thresholds, peakThresholds
    local bestPct, bestPctAt, bestPctScore, bestPctThresholds

    for i, e in ipairs(history) do
        local ts, score = e[1], e[2]
        if ts < toTs then
            -- Thresholds are stored sparsely, only when they changed, so this
            -- carries the newest set seen so far as the walk moves forward.
            if e[3] then thresholds = e[3] end

            if ts >= fromTs and score and score > 0 then
                if not peak or score > peak then
                    peak = score
                    peakAt = ts
                    peakThresholds = thresholds
                end
                final, finalTs = score, ts

                -- Best rank ever held, which is not the same moment as the
                -- best score: cutoffs climb all season, so an earlier and
                -- lower score can outrank a later and higher one.
                local nextEntry = history[i + 1]
                local inBurst = nextEntry
                    and nextEntry[2] == score
                    and (nextEntry[1] - ts) < SWITCH_BURST_SECONDS
                if not inBurst then
                    local pct = ScorePercentile(score, thresholds)
                    if pct and (not bestPct or pct < bestPct) then
                        bestPct, bestPctAt, bestPctScore = pct, ts, score
                        bestPctThresholds = thresholds
                    end
                end
            end
        end
    end

    return peak, final, finalTs, thresholds, peakThresholds,
        bestPct, bestPctAt, bestPctScore, bestPctThresholds, peakAt
end

--- Builds the per-character rows for a season window.
--- When the season actually ended for this character.
---
--- SEASON_START is the moment Raider.IO puts the new season at, and Blizzard
--- does not always agree with it. In Midnight the in-game squish landed days
--- before Raider.IO moved its boundary, so scores had already reset while the
--- addon still believed the old season was running, and the new season's first
--- runs were recorded under the old one.
---
--- Splitting on SEASON_START alone would then file those runs as the old
--- season's closing result, burying a real 3400 under a first-day 165, and
--- start the new season with nothing. Both halves wrong from one bad boundary.
---
--- Within a season a score only ever rises, since it is the sum of the best
--- run per dungeon. A fall between two adjacent points is therefore a season
--- boundary and cannot be anything else. Where one is found before the
--- nominal start, it is the truer split; otherwise the nominal one stands.
--- A drop this steep is a reset and not a correction.
---
--- Any fall at all would be tempting to treat as the boundary, since a score
--- is the sum of the best run per dungeon and cannot decrease on its own. But
--- the score is read from the game API with Raider.IO as a fallback, and a
--- stale fallback stepping in for one reading can report slightly less than
--- the last one. A reset restarts from a single dungeon's worth of points, so
--- requiring the score to at least halve separates the two without needing to
--- know anything about either season's scale.
RR.SEASON_RESET_RATIO = 0.5

function RR:IsSeasonBreak(previous, current)
    if type(previous) ~= "number" or type(current) ~= "number" then return false end
    if previous <= 0 then return false end
    return current < previous * self.SEASON_RESET_RATIO
end

-- How far from the nominal start a reset is still taken to be that season's.
--
-- Season boundaries differ by region and the addon can only carry one date.
-- In Midnight, North America reset thirteen hours before Europe and Korea
-- nineteen hours after it, so on either side of the embedded date there are
-- players whose season had already turned over and players whose had not.
-- A drop is therefore accepted as the boundary wherever it falls near the
-- nominal one, before it or after it.
--
-- The window is what keeps that honest. Outside it the nominal date stands,
-- so a player returning from a month away does not have their first evening
-- back read as a season boundary.
local SEASON_BOUNDARY_WINDOW = 3 * 24 * 60 * 60

local function SeasonBoundary(history, seasonStart)
    if type(history) ~= "table" then return seasonStart end
    local earliest = seasonStart - SEASON_BOUNDARY_WINDOW
    local latest   = seasonStart + SEASON_BOUNDARY_WINDOW
    for i = #history, 2, -1 do
        local previous, current = history[i - 1], history[i]
        if RR:IsSeasonBreak(previous[2], current[2])
           and current[1] >= earliest and current[1] <= latest then
            return current[1]
        end
    end
    return seasonStart
end

local function CollectSeasonChars(fromTs, toTs)
    local chars = {}
    -- Callable before the database is bound (a panel built early, a test
    -- harness); an empty result is the honest answer, not an error.
    if not RR.db then return chars end
    for key, history in pairs(RR.db.charHistory or {}) do
        local peak, final, finalTs, thresholds, peakThresholds,
              bestPct, bestPctAt, bestPctScore, bestPctThresholds, peakAt =
            ScanSeason(history, fromTs, SeasonBoundary(history, toTs))

        -- The tracked peak survives history trimming, so it can be higher than
        -- anything still in the points. When it is, the moment it happened is
        -- no longer known, and the oldest thresholds on record are the closest
        -- honest guess - they are the ones nearest that lost point in time.
        local tracked = RR.db.charPeak and RR.db.charPeak[key]
        if tracked and (not peak or tracked > peak) then
            peak = tracked
            peakThresholds = peakThresholds or thresholds
        end

        if peak and peak > 0 then
            -- Rank and percentile are both judged against the peak-time
            -- thresholds so they can never contradict each other. The closing
            -- rank keeps the season's final cutoffs, which is when it was final.
            chars[key] = {
                peak      = peak,
                peakAt    = peakAt,
                final     = final or peak,
                ended     = finalTs,
                peakRank  = RankIdFor(peak, peakThresholds or thresholds),
                finalRank = RankIdFor(final or peak, thresholds),
                -- Stored now, not derived later: an archived season's cutoffs
                -- are gone, and today's would misjudge an old peak.
                peakPct   = ScorePercentile(peak, peakThresholds or thresholds),
                -- The best rank actually held, with the score and date it was
                -- held at. Usually a different day than the best score.
                bestPct      = bestPct,
                bestPctAt    = bestPctAt,
                bestPctScore = bestPctScore,
                bestPctRank  = bestPctScore
                    and RankIdFor(bestPctScore, bestPctThresholds) or nil,
            }

            -- Live measurements beat anything reconstructed from the points:
            -- each was taken at the moment it happened, on the ladder it
            -- belongs to. Carried through whole, so every ladder keeps its own
            -- best rather than being collapsed to the player's current one.
            local tracked = RR.db.charBest and RR.db.charBest[key]
            if tracked and tracked.ladders then
                chars[key].bestLadders = tracked.ladders
            end
            local own = RR.GetOwnBest and RR:GetOwnBest(key)
            if own and own.pct and (not chars[key].bestPct or own.pct < chars[key].bestPct) then
                chars[key].bestPct      = own.pct
                chars[key].bestPctAt    = own.ts
                chars[key].bestPctScore = own.score
                chars[key].bestPctRank  = own.rank
                chars[key].bestPctPlus  = own.plus
            end
        end
    end
    return chars
end

--- Oldest recorded point across all characters, or nil if there are none.
local function EarliestPoint(db)
    local earliest
    for _, history in pairs(db.charHistory or {}) do
        local first = history[1]
        if first and (not earliest or first[1] < earliest) then
            earliest = first[1]
        end
    end
    return earliest
end

--- The closing ladders for a named season, if the shipped previous-season set
--- is the one that belongs to it. Matched by name so a client updating several
--- seasons late cannot staple the wrong ladders onto an old record.
local function ClosingCutoffsFor(name)
    if not name or not RR.PREV_SEASON_NAME then return nil end
    if RR:SeasonDisplayName(name) ~= RR:SeasonDisplayName(RR.PREV_SEASON_NAME) then
        return nil
    end
    return RR:AllPrevCutoffThresholds(), RR:AllPrevCutoffThresholds(true)
end

--- Puts the closing ladders back on a record that froze the wrong ones.
---
--- A season archived before this was understood kept whatever the live cutoffs
--- were at that moment, which is the new season's ladder. Rewritten in place
--- and only where the shipped set names the same season, so it is both safe to
--- repeat and unable to touch a record it does not belong to.
function RR:RepairArchivedCutoffs(db)
    for _, record in ipairs((db and db.seasonArchive) or {}) do
        local mins, wings = ClosingCutoffsFor(record.name)
        if mins then
            record.endCutoffs = mins
            record.endWings   = wings
        end
    end
end

--- Files the previous season away and clears its data, if SEASON_START moved.
--- Called from InitScoreHistory, i.e. once per login before anything reads the
--- history.
function RR:ArchiveSeasonIfRolled()
    local db = self.db
    if not db then return end

    local function adopt()
        db.seasonStart = SEASON_START
        db.seasonName  = SEASON_NAME
    end

    local prevStart = db.seasonStart
    if prevStart == nil then
        -- No stored season yet: either this is the first login since the
        -- archive existed (points start at SEASON_START, nothing to file), or
        -- the addon was updated after a rollover and is holding data from a
        -- season it never got to name.
        prevStart = EarliestPoint(db)
        if not prevStart or prevStart >= SEASON_START then
            adopt()
            return
        end
        db.seasonName = db.seasonName or "Earlier season"
    elseif prevStart >= SEASON_START then
        -- Clock or patcher went backwards; adopt without inventing a record.
        adopt()
        return
    end

    local closingCutoffs, closingWings = ClosingCutoffsFor(db.seasonName)

    -- The record is created unconditionally: even a season nobody scored in
    -- still owns whatever points exist, and they have to go somewhere before
    -- the history is cleared below.
    local record = {
        name       = db.seasonName or "Season",
        start      = prevStart,
        ended      = SEASON_START,
        chars      = CollectSeasonChars(prevStart, SEASON_START),
        charPoints = {},
        -- The ladders as they stood when the season closed. Ninety numbers,
        -- written once, and the only way a finished season stays comparable:
        -- the live cutoffs now describe the new season, where everyone is at
        -- zero again.
        -- Taken from the shipped previous-season set where it names the season
        -- being filed, since the live cutoffs have already moved on by now.
        -- The live ones remain the fallback for a client that never received
        -- the rotated data.
        endCutoffs = closingCutoffs or RR:AllCutoffThresholds(),
        -- Separately, so a closing rank can still be shown with its "+" suffix
        -- rather than looking like a coarser kind of value than the live one.
        endWings   = closingWings or RR:AllCutoffThresholds(true),
    }

    -- Points move into the record rather than being deleted, so a past season
    -- can still be drawn. Downsampled on the way in: full resolution only
    -- matters for the season being played, and this keeps the saved variables
    -- bounded however many seasons pile up.
    for key, history in pairs(db.charHistory or {}) do
        -- Per character, because the reset reaches each one at the moment it
        -- is next played, not all at once.
        local boundary = SeasonBoundary(history, SEASON_START)
        local moved = {}
        for i = 1, #history do
            if history[i][1] < boundary then
                table.insert(moved, history[i])
            end
        end
        for i = #history, 1, -1 do
            if history[i][1] < boundary then
                table.remove(history, i)
            end
        end
        if #moved > 0 then
            record.charPoints[key] = LTTB(moved, ARCHIVE_POINTS)
        end
    end

    if next(record.chars) or next(record.charPoints) then
        db.seasonArchive = db.seasonArchive or {}
        table.insert(db.seasonArchive, record)
        print(string.format("|cff00ccffRaiderRanked|r %s archived. See /rr seasons",
            record.name))
    end

    db.charPeak = {}
    db.charBest = {}
    adopt()
end

--- Raider.IO ships season names like "MN Season 1 • Full", where the suffix is
--- the phase rather than the season. For display the phase is noise, and the
--- bullet is a character this UI deliberately avoids, so everything from it
--- onwards is dropped. Applied at display time, not at storage time, so
--- seasons archived under the raw name clean up too.
function RR:SeasonDisplayName(name)
    if type(name) ~= "string" or name == "" then return "Season" end
    local trimmed = name:match("^(.-)%s*\226\128\162")   -- U+2022 bullet
        or name:match("^(.-)%s*\194\183")                -- U+00B7 middle dot
        or name
    trimmed = trimmed:gsub("%s+$", "")
    if trimmed == "" then return name end
    return trimmed
end

--- Flat id -> minScore table for a region/faction, in the shape the percentile
--- and rank helpers expect. These are today's cutoffs: the addon only ever
--- ships the current set, so this cannot reconstruct a past season's ladder.
--- Returns nil unless every ranked tier is present. Callers use this to judge
--- a score against a ladder the player is not on, and a partial table would
--- silently fall through to the live values, showing their own ladder under
--- another ladder's name. Better to report that it cannot be answered.
function RR:CutoffThresholds(region, faction)
    local set = self.GetCutoffSet and self:GetCutoffSet(region, faction)
    if not set then return nil end

    local out = {}
    for _, rank in ipairs(self.RANKS) do
        if rank.id ~= "UNRANKED" then
            local entry = set[rank.id]
            if not entry or not entry.minScore then return nil end
            out[rank.id] = entry.minScore
        end
    end
    return out
end

--- Remembers, per region/faction, the best rank a character has ever held on
--- that ladder and when. Each ladder keeps its own best moment rather than
--- sharing one: the percentile curves differ, so the day a player stood
--- highest against EU Alliance is not necessarily the day they stood highest
--- against US Horde.
---
--- Nine small entries per character, overwritten rather than appended, so the
--- cost is fixed no matter how long the season runs - and it removes any need
--- to ship a growing archive of historical cutoffs to reconstruct this later.
function RR:RecordBestRank(key, score)
    self.db.charBest = self.db.charBest or {}
    local best = self.db.charBest[key]
    if not best then
        best = { ladders = {} }
        self.db.charBest[key] = best
    end
    best.ladders = best.ladders or {}

    local now = time()
    for _, region in ipairs(self.CUTOFF_REGIONS) do
        local thresholdsByFaction = best.ladders[region] or {}
        best.ladders[region] = thresholdsByFaction

        for _, faction in ipairs(self.CUTOFF_FACTIONS) do
            local thresholds = self:CutoffThresholds(region, faction)
            if thresholds then
                local pct, rank = self:ScorePercentile(score, thresholds)
                local stored = thresholdsByFaction[faction]
                -- Lower percentile is better. Ties keep the earlier moment:
                -- reaching a rank first is the achievement, holding it is not.
                if pct and (not stored or pct < stored.pct) then
                    -- The "+" half of the bracket is only knowable while the
                    -- wing thresholds are live, so it is settled here rather
                    -- than reconstructed later.
                    local wings = self:CutoffWingScores(region, faction)
                    local wing = rank and wings and wings[rank.id]
                    thresholdsByFaction[faction] = {
                        pct   = pct,
                        ts    = now,
                        score = score,
                        rank  = rank and rank.id or nil,
                        plus  = (rank and rank.id ~= "CHALLENGER" and wing
                                 and score >= wing) or false,
                    }
                end
            end
        end
    end
end

--- The shipped previous-season ladder, as flat id -> score tables. Used when
--- the player has no archive of their own, which is every fresh install and
--- everyone who was not running the addon through the last rollover.
---@return table|nil minScores, table|nil wingScores
function RR:PrevCutoffThresholds(region, faction)
    local byRegion = self.PREV_CUTOFFS and self.PREV_CUTOFFS[region]
    local set = byRegion and byRegion[faction]
    if not set then return nil end

    local mins, wings = {}, {}
    for _, rank in ipairs(self.RANKS) do
        if rank.id ~= "UNRANKED" then
            local entry = set[rank.id]
            if not entry or not entry.minScore then return nil end
            mins[rank.id]  = entry.minScore
            wings[rank.id] = entry.wingScore
        end
    end
    return mins, wings
end

--- Flat id -> wingScore table, the midpoint that marks the upper half of a
--- bracket with "+". Kept apart from the minScore table so the percentile and
--- rank helpers keep taking a plain id -> number map.
function RR:CutoffWingScores(region, faction)
    local set = self.GetCutoffSet and self:GetCutoffSet(region, faction)
    if not set then return nil end

    local out = {}
    for _, rank in ipairs(self.RANKS) do
        if rank.id ~= "UNRANKED" then
            local entry = set[rank.id]
            if entry and entry.wingScore then
                out[rank.id] = entry.wingScore
            end
        end
    end
    return out
end

--- All nine ladders as flat id -> minScore tables. Snapshotted when a season
--- is archived, because after the rollover the live cutoffs belong to the new
--- season and comparing a finished season's score against them is meaningless.
---@param wings boolean|nil  return wingScores instead of minScores
function RR:AllCutoffThresholds(wings)
    local out = {}
    for _, region in ipairs(self.CUTOFF_REGIONS) do
        out[region] = {}
        for _, faction in ipairs(self.CUTOFF_FACTIONS) do
            out[region][faction] = wings
                and self:CutoffWingScores(region, faction)
                or  self:CutoffThresholds(region, faction)
        end
    end
    return out
end

--- The nine ladders of the season that has just ended, from the shipped set.
---
--- Needed because AllCutoffThresholds reads the live ones, and by the time a
--- season is archived those already describe the new season: the patcher moves
--- the cutoffs and the season name in the same commit, and the addon only gets
--- to notice at the next login. Freezing the live set would record the new
--- season's ladder as the old season's closing one, which reads a Platinum
--- finish as Challenger, since a fresh season's cutoffs sit far lower.
---@return table|nil
function RR:AllPrevCutoffThresholds(wings)
    if not self.PREV_CUTOFFS then return nil end
    local out = {}
    for _, region in ipairs(self.CUTOFF_REGIONS) do
        out[region] = {}
        for _, faction in ipairs(self.CUTOFF_FACTIONS) do
            local mins, wingScores = self:PrevCutoffThresholds(region, faction)
            if not mins then return nil end
            out[region][faction] = wings and wingScores or mins
        end
    end
    return out
end

--- The character's best on whichever ladder they have configured.
function RR:GetOwnBest(key)
    local best = self.db.charBest and self.db.charBest[key]
    local byRegion = best and best.ladders and best.ladders[self.db.cutoffRegion]
    return byRegion and byRegion[self.db.cutoffFaction] or nil
end

--- The running season's name, as the patcher last wrote it.
function RR:CurrentSeasonName()
    return self:SeasonDisplayName(SEASON_NAME)
end

-- ── Season selection for the graph ──────────────────────────────────────────
-- The graph draws either the running season (db.charHistory) or an archived
-- one (record.charPoints). Both use the same { {ts, score, thresholds?}, ... }
-- shape per character, so every drawing path works unchanged - only the table
-- it reads from differs.

--- Index into db.seasonArchive currently being viewed, or nil for the running
--- season. Not persisted: reopening the window should show the live season.
local viewSeasonIndex

--- The per-character point tables the graph should draw right now.
function RR:GetHistorySet()
    if viewSeasonIndex then
        local record = self.db.seasonArchive and self.db.seasonArchive[viewSeasonIndex]
        if record then return record.charPoints or {} end
        viewSeasonIndex = nil   -- archive shrank underneath us
    end
    return self.db.charHistory or {}
end

--- Menu-friendly form of the selection: 0 for the running season, otherwise
--- the archive index. Kept separate from GetViewedSeason so the menu never has
--- to deal with nil as a data value.
function RR:GetViewedSeasonValue()
    return viewSeasonIndex or 0
end

--- nil while the running season is shown, otherwise the archived record.
function RR:GetViewedSeason()
    if not viewSeasonIndex then return nil end
    return self.db.seasonArchive and self.db.seasonArchive[viewSeasonIndex]
end

--- @param index number|nil  archive index, or nil for the running season
function RR:SetViewedSeason(index)
    viewSeasonIndex = index
    self:RefreshHistoryGraph()
end

--- The running season as an archive-shaped record, so the panel can show it
--- alongside the finished ones instead of staying empty until the first roll.
function RR:GetCurrentSeasonRecord()
    return {
        name    = SEASON_NAME,
        start   = SEASON_START,
        current = true,
        chars   = CollectSeasonChars(SEASON_START, time() + 1),
    }
end

--- All seasons, newest first, current one at the top. Character rows are
--- flattened into a sorted array so the panel can render them directly.
---@return table[] seasons
function RR:GetSeasonArchive()
    local seasons = {}

    -- Builds a display-only copy. The archived records live in SavedVariables,
    -- so the flattened row list must never be written back onto them.
    local function push(record)
        local rows = {}
        for key, data in pairs(record.chars or {}) do
            table.insert(rows, {
                key       = key,
                name      = ShortCharName(key),
                peak      = data.peak,
                final     = data.final,
                peakRank  = data.peakRank,
                finalRank = data.finalRank,
                peakPct   = data.peakPct,
                peakAt    = data.peakAt,
                ended     = data.ended,
                bestPct      = data.bestPct,
                bestPctAt    = data.bestPctAt,
                bestPctScore = data.bestPctScore,
                bestPctRank  = data.bestPctRank,
                bestPctPlus  = data.bestPctPlus,
                bestLadders  = data.bestLadders,
                bestLadderOwn = data.bestLadderOwn,
            })
        end
        -- Sorted by the closing score, which is what the collapsed row shows.
        -- Sorting by peak would put a character that faded late above one that
        -- finished higher, and the list would look wrong without explaining why.
        table.sort(rows, function(a, b)
            local av, bv = a.final or a.peak, b.final or b.peak
            if av == bv then return a.name < b.name end
            return av > bv
        end)
        -- The closing rank's "+" comes from the wing thresholds of the season
        -- it belongs to: the frozen set for an archived season, the live one
        -- for the season still running.
        local wings
        if record.current then
            wings = RR:CutoffWingScores(RR.db.cutoffRegion, RR.db.cutoffFaction)
        elseif record.endWings then
            local byRegion = record.endWings[RR.db.cutoffRegion]
            wings = byRegion and byRegion[RR.db.cutoffFaction]
        end
        for _, row in ipairs(rows) do
            local wing = wings and row.finalRank and wings[row.finalRank]
            row.finalPlus = (row.finalRank ~= "CHALLENGER" and wing
                             and (row.final or row.peak) >= wing) or false
        end

        table.insert(seasons, {
            name       = record.name,
            start      = record.start,
            ended      = record.ended,
            current    = record.current,
            endCutoffs = record.endCutoffs,
            rows       = rows,
        })
    end

    push(self:GetCurrentSeasonRecord())

    local archived = {}
    for _, record in ipairs(self.db.seasonArchive or {}) do
        table.insert(archived, record)
    end
    table.sort(archived, function(a, b) return (a.start or 0) > (b.start or 0) end)
    for _, record in ipairs(archived) do
        push(record)
    end

    return seasons
end

-- ── Downsampling (Largest Triangle Three Bucket) ────────────────────────────

function LTTB(data, threshold)
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
local bandPool    = {}
local fillPool    = {}
local linePool    = {}
local smoothPool  = {}  -- CreateLine-based smooth line segments
local glowPool    = {}  -- CreateLine-based glow (thicker, translucent)
local dotPool     = {}
local dotFrames   = {}
local labelPool   = {}
local gridPool    = {}
local togglePool  = {}

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

local function AcquireLine(pool, parent, layer, sublevel, thickness)
    for _, ln in ipairs(pool) do
        if not ln._inUse then
            ln._inUse = true
            ln:SetParent(parent)
            ln:SetThickness(thickness or 2)
            ln:Show()
            return ln
        end
    end
    local ln = parent:CreateLine(nil, layer or "ARTWORK", nil, sublevel or 0)
    ln._inUse = true
    ln:SetThickness(thickness or 2)
    table.insert(pool, ln)
    return ln
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
    ReleasePool(smoothPool)
    ReleasePool(glowPool)
    ReleasePool(dotPool)
    ReleasePool(dotFrames)
    ReleasePool(labelPool)
    ReleasePool(gridPool)
end

-- ── Character Dropdown ──────────────────────────────────────────────────────

local dropdownMenu

-- ── Season dropdown ─────────────────────────────────────────────────────────
-- Lists the running season plus every archived one, newest first. Entries map
-- back to the real db.seasonArchive index, which is in insertion order.

local seasonMenu

-- 0 rather than nil marks the running season, so it can travel as menu entry
-- data - the menu API treats nil data as "no data" and drops the argument.
local SEASON_CURRENT = 0

--- Running season first, then the archive newest-first. Every entry is named
--- after its season - nothing says "current", because the running season moves
--- on by itself when the patcher advances SEASON_NAME, and a generic label
--- would then be the only thing not following along.
local function SeasonEntries()
    local entries = { { value = SEASON_CURRENT, label = RR:CurrentSeasonName() } }
    local archive = RR.db.seasonArchive or {}
    for i = #archive, 1, -1 do
        entries[#entries + 1] = { value = i, label = RR:SeasonDisplayName(archive[i].name) }
    end
    return entries
end

local function SeasonLabel()
    local viewed = RR:GetViewedSeason()
    if viewed then return RR:SeasonDisplayName(viewed.name) end
    return RR:CurrentSeasonName()
end

--- The modern Menu system arrived in 11.0. Feature-detect rather than assume:
--- on a client without it we keep the hand-rolled menu below.
local function HasNativeDropdown()
    return C_XMLUtil and C_XMLUtil.GetTemplateInfo
        and C_XMLUtil.GetTemplateInfo("WowStyle1DropdownTemplate") ~= nil
end

--- Label for the button: which season the graph is currently drawing.
local function UpdateSeasonButton()
    local f = RR.historyFrame
    local btn = f and f.seasonBtn
    if not btn then return end

    -- Shown even with nothing archived yet: it is how you learn the feature
    -- exists, and it names the season you are looking at either way.
    btn:Show()

    -- The native dropdown rebuilds its entries every time it opens, so only
    -- the closed-state label needs refreshing here.
    if btn.SetDefaultText then
        btn:SetDefaultText(SeasonLabel())
    else
        btn:SetText(SeasonLabel())
    end
end

local function ToggleSeasonMenu(owner)
    if seasonMenu and seasonMenu:IsShown() then
        seasonMenu:Hide()
        return
    end

    if not seasonMenu then
        seasonMenu = CreateFrame("Frame", "RRHistorySeasonMenu", UIParent, "BackdropTemplate")
        seasonMenu:SetFrameStrata("DIALOG")
        seasonMenu:SetBackdrop({
            bgFile   = "Interface\\Buttons\\WHITE8X8",
            edgeFile = "Interface\\Buttons\\WHITE8X8",
            tile = false, edgeSize = 1,
            insets = { left = 1, right = 1, top = 1, bottom = 1 },
        })
        seasonMenu:SetBackdropColor(0, 0, 0, 1)
        seasonMenu:SetBackdropBorderColor(0.18, 0.22, 0.28, 1)
        seasonMenu.rows = {}
    end

    for _, row in ipairs(seasonMenu.rows) do row:Hide() end
    wipe(seasonMenu.rows)

    -- Same entry list as the native menu, so the two paths can never disagree
    -- about naming or ordering.
    local entries = SeasonEntries()
    local archive = RR.db.seasonArchive or {}

    local rowH, viewed = 18, RR:GetViewedSeason()
    for i, entry in ipairs(entries) do
        local row = CreateFrame("Button", nil, seasonMenu)
        row:SetHeight(rowH)
        row:SetPoint("TOPLEFT", seasonMenu, "TOPLEFT", 8, -(6 + (i - 1) * rowH))
        row:SetPoint("RIGHT", seasonMenu, "RIGHT", -8, 0)

        local label = row:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        label:SetPoint("LEFT", row, "LEFT", 0, 0)
        local isActive = (entry.value == SEASON_CURRENT and not viewed)
            or (entry.value ~= SEASON_CURRENT and viewed == archive[entry.value])
        label:SetText(isActive and ("|cff00ff00" .. entry.label .. "|r") or entry.label)

        row:SetScript("OnClick", function()
            seasonMenu:Hide()
            RR:SetViewedSeason(entry.value ~= SEASON_CURRENT and entry.value or nil)
        end)
        row:SetScript("OnEnter", function(self) self:SetAlpha(0.7) end)
        row:SetScript("OnLeave", function(self) self:SetAlpha(1) end)

        table.insert(seasonMenu.rows, row)
    end

    seasonMenu:SetSize(170, 12 + #entries * rowH)
    seasonMenu:ClearAllPoints()
    seasonMenu:SetPoint("TOPRIGHT", owner, "BOTTOMRIGHT", 0, -2)
    seasonMenu:Show()
end

local function BuildCharDropdown()
    if not charToggleArea or not RR.db or not RR.db.charHistory then return end

    -- Mirrors whichever season the graph is showing, so an archived season
    -- lists the characters that played it rather than today's roster.
    local set = RR:GetHistorySet()

    local currentKey = CharKey()
    local visible = RR.db.historyVisible or {}

    -- Count how many are visible for the button label.
    local visCount = 0
    for key, on in pairs(visible) do
        if on and set[key] then visCount = visCount + 1 end
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
        for k, history in pairs(set) do
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
                c = CharLineColor(key, 0, { r = 0.2, g = 1.0, b = 0.4 })
            else
                c = CharLineColor(key, altIdx, nil)
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

--- Side tabs in the window's own flat style - the Blizzard tab template
--- carries gold chrome that would clash here. They are anchored to the outside
--- of the left edge and overlap the border by a pixel so they read as attached.
local function BuildTabStrip(f)
    f.tabs = {}
    for i, t in ipairs(TABS) do
        local b = CreateFrame("Button", nil, f, "BackdropTemplate")
        b:SetSize(TAB_W, TAB_H)
        b:SetPoint("TOPRIGHT", f, "TOPLEFT", 1, -(TAB_TOP + (i - 1) * (TAB_H + TAB_GAP)))
        b:SetBackdrop({
            bgFile   = "Interface\\Buttons\\WHITE8X8",
            edgeFile = "Interface\\Buttons\\WHITE8X8",
            tile = false, edgeSize = 1,
            insets = { left = 1, right = 1, top = 1, bottom = 1 },
        })
        b:SetBackdropBorderColor(0.18, 0.22, 0.28, 1)

        -- Accent on the inner edge, so the active tab reads as continuous
        -- with the window it belongs to.
        local accent = b:CreateTexture(nil, "OVERLAY")
        accent:SetPoint("TOPRIGHT", b, "TOPRIGHT", -1, -1)
        accent:SetPoint("BOTTOMRIGHT", b, "BOTTOMRIGHT", -1, 1)
        accent:SetWidth(2)
        accent:SetColorTexture(0, 0.80, 1.00, 0.85)
        accent:Hide()
        b.accent = accent

        local fs = b:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        fs:SetPoint("CENTER", b, "CENTER", -1, 0)
        fs:SetText(t.label)
        b.fs = fs

        b.tabId = t.id
        b:SetScript("OnClick", function() RR:SetHistoryTab(t.id) end)
        b:SetScript("OnEnter", function(self)
            if RR.historyFrame and RR.historyFrame.activeTab ~= t.id then
                self:SetBackdropColor(0.10, 0.12, 0.16, 0.97)
            end
        end)
        b:SetScript("OnLeave", function(self)
            if RR.historyFrame and RR.historyFrame.activeTab ~= t.id then
                self:SetBackdropColor(0.04, 0.05, 0.07, 0.97)
            end
        end)

        table.insert(f.tabs, b)
    end
end

local function CreateHistoryFrame()
    local f = CreateFrame("Frame", "RaiderRankedHistoryFrame", UIParent, "BackdropTemplate")
    f:SetSize(GRAPH_W, GRAPH_H)
    f:SetFrameStrata("HIGH")
    f:SetBackdrop({
        bgFile   = "Interface\\Buttons\\WHITE8X8",
        edgeFile = "Interface\\Buttons\\WHITE8X8",
        tile = false, edgeSize = 1,
        insets = { left = 1, right = 1, top = 1, bottom = 1 },
    })
    f:SetBackdropColor(0.04, 0.05, 0.07, 0.97)
    f:SetBackdropBorderColor(0.18, 0.22, 0.28, 1)

    -- Top accent strip
    local accent = f:CreateTexture(nil, "ARTWORK")
    accent:SetPoint("TOPLEFT", f, "TOPLEFT", 1, -1)
    accent:SetPoint("TOPRIGHT", f, "TOPRIGHT", -1, -1)
    accent:SetHeight(2)
    accent:SetColorTexture(0, 0.80, 1.00, 0.55)

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

    -- Title - shared chrome, retitled by SetHistoryTab to name the active view.
    local title = f:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", f, "TOPLEFT", 14, -10)
    f.title = title

    -- Close button
    local close = CreateFrame("Button", nil, f, "UIPanelCloseButton")
    close:SetPoint("TOPRIGHT", f, "TOPRIGHT", -2, -2)

    BuildTabStrip(f)

    -- One pane per tab, all covering the frame; only one is shown at a time.
    -- The history widgets below are parented to their pane rather than to the
    -- frame, so switching tabs is a single Show/Hide instead of a list of
    -- widgets to remember.
    f.panes = {}
    for _, t in ipairs(TABS) do
        local pane = CreateFrame("Frame", nil, f)
        pane:SetAllPoints(f)
        pane:Hide()
        f.panes[t.id] = pane
    end
    local historyPane = f.panes.history

    -- Delta header: "Score · Δ(range) · NextRank threshold Δ"
    local deltaHeader = historyPane:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    deltaHeader:SetPoint("TOP", historyPane, "TOP", 0, -12)
    deltaHeader:SetJustifyH("CENTER")
    f.deltaHeader = deltaHeader

    -- Time range buttons
    -- Widths are per entry: "Season" does not fit the 44px the day buttons use.
    local ranges = {
        { label = "3d",     days = 3,  width = 40 },
        { label = "7d",     days = 7,  width = 40 },
        { label = "14d",    days = 14, width = 40 },
        { label = "30d",    days = 30, width = 40 },
        { label = "Season", days = 0,  width = 62 },
    }
    f.activeRange = 0

    local prevBtn
    for _, r in ipairs(ranges) do
        local btn = CreateFrame("Button", nil, historyPane, "UIPanelButtonTemplate")
        btn:SetSize(r.width or 44, 20)
        btn:SetText(r.label)
        if prevBtn then
            btn:SetPoint("LEFT", prevBtn, "RIGHT", 4, 0)
        else
            btn:SetPoint("TOPLEFT", historyPane, "TOPLEFT", 12, -28)
        end
        btn:SetScript("OnClick", function()
            f.activeRange = r.days
            RR:RefreshHistoryGraph()
        end)
        prevBtn = btn
    end

    -- Season selector, right-aligned on the mode-button row. Blizzard's own
    -- dropdown where the client has it: it handles placement, Escape and
    -- click-away, which the fallback below does not.
    local seasonBtn
    if HasNativeDropdown() then
        seasonBtn = CreateFrame("DropdownButton", nil, historyPane, "WowStyle1DropdownTemplate")
        seasonBtn:SetWidth(160)
        seasonBtn:SetDefaultText(RR:CurrentSeasonName())
        seasonBtn:SetupMenu(function(_, rootDescription)
            for _, entry in ipairs(SeasonEntries()) do
                rootDescription:CreateRadio(
                    entry.label,
                    function(value) return RR:GetViewedSeasonValue() == value end,
                    function(value)
                        RR:SetViewedSeason(value ~= SEASON_CURRENT and value or nil)
                    end,
                    entry.value)
            end
        end)
    else
        seasonBtn = CreateFrame("Button", nil, historyPane, "UIPanelButtonTemplate")
        seasonBtn:SetSize(160, 20)
        -- Labelled up front so it never flashes blank before the first refresh.
        seasonBtn:SetText(RR:CurrentSeasonName())
        seasonBtn:SetScript("OnClick", function(self) ToggleSeasonMenu(self) end)
    end
    seasonBtn:SetPoint("TOPRIGHT", historyPane, "TOPRIGHT", -30, -52)
    f.seasonBtn = seasonBtn

    -- Character toggle area (to the right of range buttons).
    charToggleArea = CreateFrame("Frame", nil, historyPane)
    charToggleArea:SetHeight(20)
    charToggleArea:SetPoint("LEFT", prevBtn, "RIGHT", 12, 0)
    charToggleArea:SetPoint("RIGHT", historyPane, "RIGHT", -30, 0)

    -- Mode switcher (left gutter, vertical).
    f.mode = (RR.db and RR.db.historyMode) or "score"
    f.modeButtons = {}
    local modes = {
        { id = "score",    label = "Score"    },
        { id = "progress", label = "Progress" },
        { id = "cutoffs",  label = "Cutoffs"  },
    }
    for i, m in ipairs(modes) do
        local b = CreateFrame("Button", nil, historyPane)
        b:SetSize(64, 20)
        b:SetPoint("TOPLEFT", historyPane, "TOPLEFT", 12 + (i - 1) * 68, -52)

        local bg = b:CreateTexture(nil, "BACKGROUND")
        bg:SetAllPoints(b)
        b.bg = bg

        local fs = b:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        fs:SetPoint("CENTER", b, "CENTER", 0, 0)
        fs:SetText(m.label)
        b.fs = fs

        b:SetScript("OnClick", function()
            f.mode = m.id
            if RR.db then RR.db.historyMode = m.id end
            RR:UpdateHistoryModeButtons()
            RR:RefreshHistoryGraph()
        end)
        b:SetScript("OnEnter", function(self)
            if f.mode ~= m.id then self.bg:SetColorTexture(1, 1, 1, 0.08) end
        end)
        b:SetScript("OnLeave", function(self)
            if f.mode ~= m.id then self.bg:SetColorTexture(1, 1, 1, 0.03) end
        end)
        b.modeId = m.id
        table.insert(f.modeButtons, b)
    end

    -- Plot area
    plotArea = CreateFrame("Frame", nil, historyPane)
    plotArea:SetPoint("TOPLEFT", historyPane, "TOPLEFT", PLOT_PAD_LEFT, -(PLOT_PAD_TOP + 76))
    plotArea:SetPoint("BOTTOMRIGHT", historyPane, "BOTTOMRIGHT", -PLOT_PAD_RIGHT, PLOT_PAD_BOTTOM)

    -- The other two views live in Panels.lua and fill their pane below the
    -- tab strip. Built here so all three exist from the first Show.
    RR:BuildLadderPane(f.panes.ladder)
    RR:BuildSeasonsPane(f.panes.seasons)

    tinsert(UISpecialFrames, "RaiderRankedHistoryFrame")  -- Escape closes it
    f:Hide()
    return f
end

--- Switches the visible tab and refreshes whatever it shows.
function RR:SetHistoryTab(id)
    local f = self.historyFrame
    if not f or not f.panes or not f.panes[id] then return end

    for tabId, pane in pairs(f.panes) do
        pane:SetShown(tabId == id)
    end
    f.activeTab = id
    if self.db then self.db.historyTab = id end

    for _, tab in ipairs(f.tabs) do
        local on = (tab.tabId == id)
        tab.fs:SetTextColor(on and 1 or 0.55, on and 1 or 0.55, on and 1 or 0.60)
        tab:SetBackdropColor(on and 0.10 or 0.04, on and 0.12 or 0.05,
                             on and 0.16 or 0.07, 0.97)
        tab.accent:SetShown(on)
    end

    for _, t in ipairs(TABS) do
        if t.id == id and f.title then
            f.title:SetText("|cff00ccff" .. t.title .. "|r")
        end
    end

    if id == "history" then
        self:RefreshHistoryGraph()
    elseif id == "ladder" then
        self:RefreshRankLadder()
    elseif id == "seasons" then
        self:RefreshSeasonsPanel()
    end
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

        -- Gradient area fill (fine column resolution for smoothness).
        if i < #visData then
            local nd = visData[i + 1]
            local nx = MapX(nd[1])
            local ny = MapY(nd[2])
            local segW = nx - x
            local cols = math.max(1, math.floor(segW))
            if cols > 400 then cols = 400 end

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
                    CreateColor(c.r * 0.05, c.g * 0.05, c.b * 0.05, 0.05),
                    CreateColor(c.r * 0.65, c.g * 0.65, c.b * 0.70, 0.55))
            end

            -- Smooth top edge with glow (CreateLine).
            local glow = AcquireLine(glowPool, plotArea, "ARTWORK", 2, 6)
            glow:SetStartPoint("BOTTOMLEFT", x, y)
            glow:SetEndPoint("BOTTOMLEFT", nx, ny)
            glow:SetColorTexture(c.r, c.g, c.b, 0.22)

            local line = AcquireLine(smoothPool, plotArea, "ARTWORK", 3, 2.5)
            line:SetStartPoint("BOTTOMLEFT", x, y)
            line:SetEndPoint("BOTTOMLEFT", nx, ny)
            line:SetColorTexture(c.r, c.g, c.b, 1)
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

        -- Smooth line segment to next point.
        if i < #visData then
            local nd = visData[i + 1]
            local nx = MapX(nd[1])
            local ny = MapY(nd[2])

            local glow = AcquireLine(glowPool, plotArea, "ARTWORK", 2, 5)
            glow:SetStartPoint("BOTTOMLEFT", x, y)
            glow:SetEndPoint("BOTTOMLEFT", nx, ny)
            glow:SetColorTexture(c.r, c.g, c.b, 0.20)

            local line = AcquireLine(smoothPool, plotArea, "ARTWORK", 3, 2.25)
            line:SetStartPoint("BOTTOMLEFT", x, y)
            line:SetEndPoint("BOTTOMLEFT", nx, ny)
            line:SetColorTexture(c.r, c.g, c.b, 1)
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

-- Populates the delta header with "Score · Δscore (range) · NextRank threshold Δ".
-- Reveals "pure" progress vs. moving goalposts: if your score rose 100 but the
-- next threshold moved 80, you only gained 20 of actual ground.
local function UpdateDeltaHeader(self)
    local header = self.historyFrame and self.historyFrame.deltaHeader
    if not header then return end

    local key = CharKey()
    local set = self:GetHistorySet()
    local history = key and set[key]
    if not history or #history < 2 then
        header:SetText("")
        return
    end

    local rangeDays = self.historyFrame.activeRange or 0
    local cutoff = rangeDays > 0 and (time() - rangeDays * 86400) or SEASON_START

    local currentScore = history[#history][2]
    local currentRank  = self:GetRankForScore(currentScore)
    local nextRank     = self:GetNextRank(currentRank)

    -- First entry at or after cutoff. If nothing in range (player idle), use
    -- the latest entry - delta vs. self = 0, which matches reality.
    local pastIdx = #history
    for i = 1, #history do
        if history[i][1] >= cutoff then
            pastIdx = i
            break
        end
    end
    local pastScore = history[pastIdx][2]
    local pastThresholds = GetThresholdsAtIndex(history, pastIdx)

    local scoreDelta = currentScore - pastScore
    local rangeLabel = rangeDays > 0 and (rangeDays .. "d") or "Season"

    local function sign(n) return (n >= 0 and "+" or "") .. n end

    local parts = {
        string.format("|cffffffff%d|r", currentScore),
        string.format("|cff%s%s|r (%s)",
            scoreDelta >= 0 and "66ff66" or "ff6666",
            sign(scoreDelta), rangeLabel),
    }

    if nextRank then
        local needed = nextRank.minScore - currentScore
        local short = RR.RANK_SHORT[nextRank.id] or nextRank.name
        if needed > 0 then
            table.insert(parts, string.format("|cffaaaaaanext|r |cff%02x%02x%02x%s|r %d",
                math.floor(nextRank.color.r*255),
                math.floor(nextRank.color.g*255),
                math.floor(nextRank.color.b*255),
                short, needed))
        end
        if pastThresholds[nextRank.id] then
            local tDelta = nextRank.minScore - pastThresholds[nextRank.id]
            if tDelta ~= 0 then
                table.insert(parts, string.format("|cff888888cutoff %s|r", sign(tDelta)))
            end
        end
    end

    header:SetText(table.concat(parts, "  ·  "))
end

function RR:UpdateHistoryModeButtons()
    local f = self.historyFrame
    if not f or not f.modeButtons then return end
    for _, b in ipairs(f.modeButtons) do
        if b.modeId == f.mode then
            b.bg:SetColorTexture(0, 0.80, 1.00, 0.28)
            b.fs:SetTextColor(1, 1, 1)
        else
            b.bg:SetColorTexture(1, 1, 1, 0.03)
            b.fs:SetTextColor(0.65, 0.65, 0.70)
        end
    end
end

function RR:RefreshHistoryGraph()
    if not self.historyFrame or not plotArea then return end
    -- Score changes trigger a refresh whenever the window is open, which now
    -- includes the window being open on a different tab.
    if self.historyFrame.activeTab and self.historyFrame.activeTab ~= "history" then
        return
    end
    if self.historyFrame.emptyText then self.historyFrame.emptyText:Hide() end
    UpdateSeasonButton()
    self:UpdateHistoryModeButtons()
    UpdateDeltaHeader(self)

    ReleaseAll()
    BuildCharDropdown()

    local visible = self.db.historyVisible or {}
    local currentKey = CharKey()

    -- Collect all visible characters' data.
    local allCharData = {}  -- { { key=, data=, isCurrentChar= }, ... }
    for key, history in pairs(self:GetHistorySet()) do
        if visible[key] and history and #history > 0 then
            EnsureSeasonStart(history)
            table.insert(allCharData, {
                key = key,
                history = history,
                isCurrent = (key == currentKey),
            })
        end
    end

    if #allCharData == 0 and self.historyFrame.mode ~= "cutoffs" then
        if not self.historyFrame.emptyText then
            self.historyFrame.emptyText = self.historyFrame.panes.history:CreateFontString(
                nil, "OVERLAY", "GameFontNormal")
            self.historyFrame.emptyText:SetPoint("CENTER", self.historyFrame.panes.history, "CENTER", 0, 0)
        end
        self.historyFrame.emptyText:SetText("|cff888888No data yet. Play some keys!|r")
        self.historyFrame.emptyText:Show()
        return
    end

    -- Filter by time range and collect all data for Y/X bounds.
    local rangeDays = self.historyFrame.activeRange or 0
    local cutoff = rangeDays > 0 and (time() - rangeDays * 86400) or SEASON_START

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

    local isCutoffsMode  = self.historyFrame.mode == "cutoffs"
    local isProgressMode = self.historyFrame.mode == "progress"

    if #charDataSets == 0 and not isCutoffsMode then
        if not self.historyFrame.emptyText then
            self.historyFrame.emptyText = self.historyFrame.panes.history:CreateFontString(
                nil, "OVERLAY", "GameFontNormal")
            self.historyFrame.emptyText:SetPoint("CENTER", self.historyFrame.panes.history, "CENTER", 0, 0)
        end
        self.historyFrame.emptyText:SetText("|cff888888No data in this range.|r")
        self.historyFrame.emptyText:Show()
        return
    end

    -- Get current thresholds for rank bands.
    local currentThresholds = self.db.thresholds or {}

    if isProgressMode then
        -- "Real progression": each point is (score gained) − (next-rank cutoff
        -- movement) since range start. Zero = treading water.
        local key = CharKey()
        local set = self:GetHistorySet()
        local history = key and set[key]

        local entries = {}
        if history then
            for i, e in ipairs(history) do
                if e[1] >= cutoff then
                    table.insert(entries, { e[1], e[2], GetThresholdsAtIndex(history, i) })
                end
            end
            for i = #history, 1, -1 do
                if history[i][1] < cutoff then
                    table.insert(entries, 1, {
                        cutoff, history[i][2], GetThresholdsAtIndex(history, i)
                    })
                    break
                end
            end
        end

        local refRank
        if #entries >= 1 then
            local last = entries[#entries]
            local curRank = self:GetRankForScore(last[2])
            refRank = self:GetNextRank(curRank) or curRank
        end

        charDataSets = {}
        if #entries >= 2 and refRank then
            local score0  = entries[1][2]
            local cutoff0 = (entries[1][3] and entries[1][3][refRank.id]) or refRank.minScore
            local series = {}
            for _, e in ipairs(entries) do
                local c = (e[3] and e[3][refRank.id]) or refRank.minScore
                local progress = (e[2] - score0) - (c - cutoff0)
                table.insert(series, { e[1], progress, nil, key })
            end
            table.insert(charDataSets, {
                key = key, data = series, isCurrent = true,
                color = refRank.color, refRank = refRank,
            })
        end

        if #charDataSets == 0 then
            if not self.historyFrame.emptyText then
                self.historyFrame.emptyText = self.historyFrame.panes.history:CreateFontString(
                    nil, "OVERLAY", "GameFontNormal")
                self.historyFrame.emptyText:SetPoint("CENTER", self.historyFrame.panes.history, "CENTER", 0, 0)
            end
            self.historyFrame.emptyText:SetText("|cff888888Not enough data in this range.|r")
            self.historyFrame.emptyText:Show()
            return
        end

        globalMinScore, globalMaxScore = math.huge, -math.huge
        globalMinTime,  globalMaxTime  = math.huge, -math.huge
        for _, d in ipairs(charDataSets[1].data) do
            if d[2] < globalMinScore then globalMinScore = d[2] end
            if d[2] > globalMaxScore then globalMaxScore = d[2] end
            if d[1] < globalMinTime  then globalMinTime  = d[1] end
            if d[1] > globalMaxTime  then globalMaxTime  = d[1] end
        end
        local maxAbs = math.max(math.abs(globalMinScore), math.abs(globalMaxScore), 10)
        globalMinScore, globalMaxScore = -maxAbs * 1.15, maxAbs * 1.15
    elseif isCutoffsMode then
        -- Build one series per rank from the threshold snapshots embedded in
        -- the current char's history entries. entry[3] is set only when
        -- thresholds actually changed (see RecordScoreSnapshot), so we get one
        -- point per genuine cutoff movement.
        local key = CharKey()
        local set = self:GetHistorySet()
        local history = key and set[key]

        local events = {}
        if history then
            for _, entry in ipairs(history) do
                if entry[3] then
                    table.insert(events, { entry[1], entry[3] })
                end
            end
        end

        -- Range filter + context point before cutoff.
        local ev_cutoff = rangeDays > 0 and (time() - rangeDays * 86400) or SEASON_START
        local filtered = {}
        local lastBefore
        for _, ev in ipairs(events) do
            if ev[1] >= ev_cutoff then
                table.insert(filtered, ev)
            else
                lastBefore = ev
            end
        end
        if lastBefore then
            table.insert(filtered, 1, { ev_cutoff, lastBefore[2] })
        end

        charDataSets = {}
        if #filtered >= 2 then
            for _, rank in ipairs(self.RANKS) do
                if rank.minScore > 0 and rank.id ~= "UNRANKED" then
                    local series = {}
                    for _, ev in ipairs(filtered) do
                        local v = ev[2][rank.id]
                        if v then
                            table.insert(series, { ev[1], v, nil, rank.id })
                        end
                    end
                    -- Extend to "now" so the latest value reaches the right edge.
                    if #series >= 1 then
                        local last = series[#series]
                        if last[1] < time() then
                            table.insert(series, { time(), last[2], nil, rank.id })
                        end
                    end
                    if #series >= 2 then
                        table.insert(charDataSets, {
                            key = rank.id,
                            data = series,
                            color = rank.color,
                            isCurrent = false,
                            rankRef = rank,
                        })
                    end
                end
            end
        end

        if #charDataSets == 0 then
            if not self.historyFrame.emptyText then
                self.historyFrame.emptyText = self.historyFrame.panes.history:CreateFontString(
                    nil, "OVERLAY", "GameFontNormal")
                self.historyFrame.emptyText:SetPoint("CENTER", self.historyFrame.panes.history, "CENTER", 0, 0)
            end
            self.historyFrame.emptyText:SetText("|cff888888No cutoff changes recorded in this range.|r")
            self.historyFrame.emptyText:Show()
            return
        end

        -- Recompute bounds from cutoff data.
        globalMinScore, globalMaxScore = math.huge, -math.huge
        globalMinTime,  globalMaxTime  = math.huge, -math.huge
        for _, cds in ipairs(charDataSets) do
            for _, d in ipairs(cds.data) do
                if d[2] < globalMinScore then globalMinScore = d[2] end
                if d[2] > globalMaxScore then globalMaxScore = d[2] end
                if d[1] < globalMinTime  then globalMinTime  = d[1] end
                if d[1] > globalMaxTime  then globalMaxTime  = d[1] end
            end
        end
        local yPad = math.max(15, (globalMaxScore - globalMinScore) * 0.15)
        globalMinScore = globalMinScore - yPad
        globalMaxScore = globalMaxScore + yPad
    else
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
    end

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

    local sortedRanks = {}
    for _, rank in ipairs(self.RANKS) do
        if rank.id ~= "UNRANKED" then
            table.insert(sortedRanks, rank)
        end
    end
    table.sort(sortedRanks, function(a, b) return a.minScore < b.minScore end)

    -- Zero baseline for progress mode.
    if isProgressMode then
        local yZero = MapY(0)
        local zero = AcquireTexture(gridPool, plotArea, "BACKGROUND", 2)
        zero:ClearAllPoints()
        zero:SetPoint("BOTTOMLEFT", plotArea, "BOTTOMLEFT", 0, yZero)
        zero:SetSize(plotW, 1)
        zero:SetColorTexture(1, 1, 1, 0.35)
        local zeroLbl = AcquireLabel(labelPool, self.historyFrame.panes.history)
        zeroLbl:ClearAllPoints()
        zeroLbl:SetPoint("LEFT", plotArea, "BOTTOMRIGHT", 4, yZero)
        zeroLbl:SetText("|cffaaaaaa±0|r")
        zeroLbl:SetJustifyH("LEFT")
    end

    for i, rank in ipairs(sortedRanks) do
        if isCutoffsMode or isProgressMode then break end
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
            local c = rank.color

            -- Colored band (subtle, so modern line stays readable).
            local band = AcquireTexture(bandPool, plotArea, "BACKGROUND", 0)
            band:ClearAllPoints()
            band:SetPoint("BOTTOMLEFT", plotArea, "BOTTOMLEFT", 0, yBottom)
            band:SetPoint("TOPRIGHT", plotArea, "BOTTOMRIGHT", 0, yTop)
            band:SetColorTexture(c.r, c.g, c.b, 0.10)

            -- Crisp threshold line at the band's lower edge.
            if lo >= globalMinScore then
                local grid = AcquireTexture(gridPool, plotArea, "BACKGROUND", 2)
                grid:ClearAllPoints()
                grid:SetPoint("BOTTOMLEFT", plotArea, "BOTTOMLEFT", 0, yBottom)
                grid:SetSize(plotW, 1)
                grid:SetColorTexture(c.r, c.g, c.b, 0.35)
            end

            -- Left-side rank label at the threshold (current-score label lives
            -- on the right, so separating them avoids overlap when the player
            -- sits near a cutoff).
            if lo >= globalMinScore and lo <= globalMaxScore then
                local lbl = AcquireLabel(labelPool, self.historyFrame.panes.history)
                lbl:ClearAllPoints()
                lbl:SetPoint("RIGHT", plotArea, "BOTTOMLEFT", -4, yBottom)
                local shortName = RANK_SHORT[rank.id] or rank.name
                lbl:SetText(string.format("|cff%02x%02x%02x%s %d|r",
                    math.floor(c.r*255), math.floor(c.g*255), math.floor(c.b*255),
                    shortName, lo))
                lbl:SetJustifyH("RIGHT")
            end
        end
    end

    -- ── X-axis labels ───────────────────────────────────────────────────────
    local timeSpan = globalMaxTime - globalMinTime
    if timeSpan < 1 then timeSpan = 1 end
    local numLabels = math.max(2, math.min(5, 2 + math.floor(timeSpan / 86400)))
    for i = 0, numLabels - 1 do
        local t = globalMinTime + (timeSpan * i) / (numLabels - 1)
        local x = MapX(t)
        local lbl = AcquireLabel(labelPool, self.historyFrame.panes.history)
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

        if isCutoffsMode then
            -- Each dataset is a rank's cutoff series, coloured by that rank.
            DrawLineChart(visData, MapX, MapY, cds.color,
                RANK_SHORT[cds.key] or cds.key)
        elseif isProgressMode then
            DrawLineChart(visData, MapX, MapY, cds.color, nil)
        elseif not isCompare then
            -- Solo: filled area chart in current rank colour (or class colour).
            local lastScore = cds.data[#cds.data][2]
            local rank = self:GetRankForScore(lastScore)
            DrawSoloChart(visData, MapX, MapY,
                CharLineColor(cds.key, 0, rank.color))
        else
            -- Compare: line only, distinct colour per char.
            local color
            if cds.isCurrent then
                local lastScore = cds.data[#cds.data][2]
                local rank = self:GetRankForScore(lastScore)
                color = CharLineColor(cds.key, 0, rank.color)
            else
                color = CharLineColor(cds.key, altIdx, nil)
                altIdx = altIdx + 1
            end
            DrawLineChart(visData, MapX, MapY, color, ShortCharName(cds.key))
        end
    end

    -- Right-side legend for cutoffs mode: show the latest cutoff value per rank.
    if isCutoffsMode then
        for _, cds in ipairs(charDataSets) do
            local last = cds.data[#cds.data]
            local yy = MapY(last[2])
            local c = cds.color
            local lbl = AcquireLabel(labelPool, self.historyFrame.panes.history)
            lbl:ClearAllPoints()
            lbl:SetPoint("LEFT", plotArea, "BOTTOMRIGHT", 4, yy)
            local short = RANK_SHORT[cds.key] or cds.key
            lbl:SetText(string.format("|cff%02x%02x%02x%s|r |cff777777%d|r",
                math.floor(c.r*255), math.floor(c.g*255), math.floor(c.b*255),
                short, last[2]))
            lbl:SetJustifyH("LEFT")
        end
    end

    -- Progress mode: legend with latest real delta.
    if isProgressMode then
        local cds = charDataSets[1]
        local last = cds.data[#cds.data]
        local yy = MapY(last[2])
        local c = cds.color
        local val = math.floor(last[2] + 0.5)
        local col = val >= 0 and "66cc66" or "cc6666"
        local lbl = AcquireLabel(labelPool, self.historyFrame.panes.history)
        lbl:ClearAllPoints()
        lbl:SetPoint("LEFT", plotArea, "BOTTOMRIGHT", 4, yy)
        lbl:SetText(string.format("|cff%02x%02x%02x%s|r |cff%s%+d|r",
            math.floor(c.r*255), math.floor(c.g*255), math.floor(c.b*255),
            RANK_SHORT[cds.refRank.id] or cds.refRank.name, col, val))
        lbl:SetJustifyH("LEFT")
    end

    -- ── Current score indicator (score mode only) ──────────────────────────
    if not isCutoffsMode and not isProgressMode then
        for _, cds in ipairs(charDataSets) do
            if cds.isCurrent and #cds.data > 0 then
                local lastEntry = cds.data[#cds.data]
                local cy = MapY(lastEntry[2])
                local lbl = AcquireLabel(labelPool, self.historyFrame.panes.history)
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
end

-- ── Toggle ──────────────────────────────────────────────────────────────────

--- Opens the window on a given tab, or toggles it when `tab` is nil.
--- Passing a tab always opens rather than toggles, so /rr ladder while the
--- graph tab is up switches instead of closing the window.
function RR:ToggleHistoryGraph(show, tab)
    if not self.historyFrame then
        self.historyFrame = CreateHistoryFrame()
        historyFrame = self.historyFrame
        self:SetHistoryTab((self.db and self.db.historyTab) or "history")
    end

    if tab and tab ~= self.historyFrame.activeTab then
        self:SetHistoryTab(tab)
        show = true
    elseif show == nil then
        show = not self.historyFrame:IsShown()
    end

    if show then
        self.historyFrame:Show()
        C_Timer.After(0, function()
            RR:SetHistoryTab(RR.historyFrame.activeTab or "history")
        end)
    else
        self.historyFrame:Hide()
    end
end
