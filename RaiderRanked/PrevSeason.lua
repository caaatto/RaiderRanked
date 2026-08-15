-- RaiderRanked: PrevSeason.lua
-- Last season's rank for other players.
--
-- Three sources, in order of how first-hand they are:
--
--   1. Own characters      the season archive, which also knows the rank and
--                          percentile as they stood at the time
--   2. RaiderIO            its bundled database carries previousScore for any
--                          character it knows, which is most of them
--   3. Group broadcast     RaiderRanked users in the group send their own
--                          archived figure, so a group still works when nobody
--                          has RaiderIO installed
--
-- A score alone is not a rank, and last season's score has to be judged by
-- last season's cutoffs. Those are frozen into the archive when a season rolls
-- over (record.endCutoffs); judging by today's would understate every result,
-- since cutoffs only ever climb.

local ADDON_NAME, RR = ...

local ADDON_PREFIX       = "RRPrev"
local CACHE_TTL          = 900   -- 15 minutes; last season's score never moves
local BROADCAST_INTERVAL = 90    -- seconds between periodic broadcasts

-- prevCache[playerName-realmName] = { score = number, timestamp = number }
RR.prevCache = {}

-- ── Keys ────────────────────────────────────────────────────────────────────

local function CacheKey(unit)
    local name, realm = UnitName(unit)
    if not name then return nil end
    if not realm or realm == "" then realm = GetNormalizedRealmName() or "" end
    return name .. "-" .. realm
end

local function CacheKeyFromName(fullName)
    if not fullName then return nil end
    local name, realm = fullName:match("^([^-]+)-(.+)$")
    if name then return name .. "-" .. realm end
    return fullName .. "-" .. (GetNormalizedRealmName() or "")
end

-- ── Cutoffs of the season that ended ────────────────────────────────────────

--- The nine ladders as they stood when the last season closed, for the
--- region/faction the player has configured. Returns nil before the first
--- rollover this addon has lived through, in which case a foreign score can be
--- shown but not ranked.
---@return table|nil thresholds, string|nil seasonName, table|nil wingScores
function RR:GetPreviousSeasonCutoffs()
    -- /rr prevdbg sim puts a stand-in here. Deliberately on RR and not on
    -- RR.db, so it cannot be saved and disappears on reload.
    if self.debugPrev then
        return self.debugPrev.thresholds, self.debugPrev.name, self.debugPrev.wings
    end

    --- The shipped ladder, used when this client has no archive of its own.
    local function shipped()
        local mins, wings = self:PrevCutoffThresholds(
            self.db.cutoffRegion, self.db.cutoffFaction)
        if not mins then return nil end
        local name = self.PREV_SEASON_NAME
        return mins, name and self:SeasonDisplayName(name) or nil, wings
    end

    local archive = self.db and self.db.seasonArchive
    if not archive or #archive == 0 then return shipped() end

    -- Newest archived season, which is the one "previous score" refers to.
    local newest
    for _, record in ipairs(archive) do
        if not newest or (record.start or 0) > (newest.start or 0) then
            newest = record
        end
    end
    if not newest or not newest.endCutoffs then return shipped() end

    local byRegion = newest.endCutoffs[self.db.cutoffRegion]
    local thresholds = byRegion and byRegion[self.db.cutoffFaction]
    if not thresholds then return shipped() end

    -- Absent on records archived before wing scores were kept; the rank then
    -- simply shows without its "+".
    local byRegionWings = newest.endWings and newest.endWings[self.db.cutoffRegion]
    local wings = byRegionWings and byRegionWings[self.db.cutoffFaction]

    return thresholds, newest.name, wings
end

-- ── Own figure ──────────────────────────────────────────────────────────────

--- Closing score for a season that has ended in game but has not been archived
--- yet, because Raider.IO has not switched over and so the daily job has not
--- moved SEASON_START.
---
--- Found by looking for the drop. Within a season a score only ever rises,
--- since it is the sum of the best run per dungeon, so a fall between two
--- adjacent points cannot be anything but a season boundary. The value just
--- before the most recent fall is what the character closed on. Scores of 0
--- are never recorded, so the dead weeks between seasons leave no points
--- behind and do not confuse the search.
---
--- This has to keep working after the new season has been scored in, which is
--- why it is not conditioned on the live score being 0. On the opening day the
--- first timed key would otherwise take the answer away.
local function ClosingScoreFromHistory()
    local key = CacheKey("player")
    local history = key and RR.db and RR.db.charHistory and RR.db.charHistory[key]
    if not history or #history == 0 then return nil end

    for i = #history, 2, -1 do
        local prev, current = history[i - 1][2], history[i][2]
        if prev and current and prev > 0 and current < prev then
            return prev
        end
    end

    -- No fall anywhere. Either this is still the first season on record, or the
    -- new one has not been scored in yet, which reads as a live score of 0 with
    -- history sitting behind it.
    if (RR.playerScore or 0) > 0 then return nil end
    for i = #history, 1, -1 do
        local score = history[i][2]
        if score and score > 0 then return score end
    end
    return nil
end

--- This character's closing score from the newest archived season.
function RR:GetOwnPreviousSeasonScore()
    if self.debugPrev then return self.debugPrev.score end

    local archive = self.db and self.db.seasonArchive
    if not archive or #archive == 0 then return ClosingScoreFromHistory() end

    local key = CacheKey("player")
    if not key then return nil end

    local newest
    for _, record in ipairs(archive) do
        if not newest or (record.start or 0) > (newest.start or 0) then
            newest = record
        end
    end
    local entry = newest and newest.chars and newest.chars[key]
    if not entry then return ClosingScoreFromHistory() end
    return entry.final or entry.peak
end

-- ── RaiderIO ────────────────────────────────────────────────────────────────

--- The Mythic+ part of a RaiderIO profile, or nil. Wrapped because the addon
--- is optional, its data modules can be switched off individually, and a
--- lookup for an unknown character returns nothing at all.
function RR:GetRaiderIOKeystoneProfile(unit)
    if not (RaiderIO and RaiderIO.GetProfile) then return nil end
    local ok, profile = pcall(RaiderIO.GetProfile, unit)
    if not ok or type(profile) ~= "table" then return nil end
    return profile.mythicKeystoneProfile
end

--- True while RaiderIO's bundled database still predates the season reset, in
--- which case what it calls the current score is last season's result and what
--- it calls previous is the season before that.
---
--- Their database rolls over on their schedule, days after the in-game reset,
--- and reading the wrong field across that gap does not produce a missing line
--- but a wrong one: the season before last is a real score and would be shown
--- under this season's label.
---
--- Two answers are looked for, strongest first, because the one that is exact
--- is not the one that is always available.
---
--- Answered once for all units rather than per player, so the tooltip cannot
--- say one thing about one character and something else about the next.
function RR:RaiderIOPredatesReset()
    -- Without their database there is nothing to disambiguate.
    if not (RaiderIO and RaiderIO.GetProfile) then return false end

    local mplus = self:GetRaiderIOKeystoneProfile("player")
    local current = mplus and mplus.currentScore
    if type(current) ~= "number" then current = nil end

    -- Our own character, where both numbers are known: if what they report as
    -- our current score is the score we recorded ourselves at the close of last
    -- season, their snapshot is still the old one. That holds no matter what we
    -- score in the new season, and stops holding the moment they publish a
    -- database that has moved on, which is exactly when it should.
    --
    -- Both figures come from the same source and are whole points, so they
    -- agree exactly once their snapshot has caught up with the season's close,
    -- which it has long since done by the time the next one opens. Direct
    -- evidence about their data, so it decides on its own where it applies.
    local closing = self:GetOwnPreviousSeasonScore()
    if current and current > 0 and closing and closing > 0 then
        return math.abs(current - closing) < 1
    end

    -- The same comparison against this season settles it the other way, and
    -- needs no history at all: if their current score for us is what we are
    -- scoring right now, their snapshot has plainly moved on. Worth checking
    -- before the shipped names below, which infer rather than observe and
    -- would be a step behind if their database ever rolls over first.
    local live = self.playerScore or 0
    if current and current > 0 and live > 0 and math.abs(current - live) < 1 then
        return false
    end

    -- Nothing of our own to compare against: a character that did not play last
    -- season, or one they have never seen. The shipped data answers it anyway.
    --
    -- The season the addon calls current and the season whose closing cutoffs
    -- it carries as previous are written by the same daily job. While the job
    -- has not seen the rollover, it has written the same name into both, and
    -- the job turns over when Raider.IO's own season does. So as long as those
    -- two names agree, their database cannot have moved on either.
    --
    -- This holds for every install, including one that has never recorded a
    -- season of its own, which is exactly the case that has nothing else to go
    -- on.
    local previous = self.PREV_SEASON_NAME
    if previous and self.CurrentSeasonName
       and self:CurrentSeasonName() == self:SeasonDisplayName(previous) then
        return true
    end

    -- Last resort: a live score of 0 against a non-zero score of theirs still
    -- means their snapshot predates the reset.
    return current ~= nil and current > 0 and (self.playerScore or 0) <= 0
end

-- ── Lookup ──────────────────────────────────────────────────────────────────

local function CacheFresh(key)
    local entry = RR.prevCache[key]
    if not entry then return false end
    if (GetTime() - entry.timestamp) < CACHE_TTL then return true end
    -- Dropped rather than merely ignored: a stale entry has no further use and
    -- keeping it is what turns this table into a record of everyone ever seen.
    RR.prevCache[key] = nil
    return false
end

--- Clears everything past its lifetime.
---
--- The read path alone cannot keep this bounded: entries arrive for every
--- group member who runs the addon, and most of them are never asked about
--- again, so nothing would ever revisit them. Over an evening of pugging that
--- is thousands of names held for a value that stopped being usable after
--- fifteen minutes. Swept from the broadcast ticker, which is already running.
local function PruneCache()
    local now = GetTime()
    for key, entry in pairs(RR.prevCache) do
        if not entry or (now - (entry.timestamp or 0)) >= CACHE_TTL then
            RR.prevCache[key] = nil
        end
    end
end

--- Last season's score for a unit, and where it came from.
---@return number|nil score, string|nil source  "archive" | "raiderio" | "group"
function RR:GetPreviousSeasonScore(unit)
    if not UnitExists(unit) or not UnitIsPlayer(unit) then return nil end

    if UnitIsUnit(unit, "player") then
        local own = self:GetOwnPreviousSeasonScore()
        if own then return own, "archive" end
    end

    -- RaiderIO knows almost every character, so it is tried before the group
    -- broadcast, which only ever covers people standing next to you.
    local mplus = self:GetRaiderIOKeystoneProfile(unit)
    if mplus then
        local score
        if self:RaiderIOPredatesReset() then
            -- Their "current" is the season that just ended.
            score = mplus.currentScore
        else
            -- On an alt the character's own previous score is empty and only
            -- the main's is filled in, which is what RaiderIO falls back to.
            score = mplus.previousScore
            if type(score) ~= "number" or score <= 0 then
                score = mplus.mainPreviousScore
            end
        end
        if type(score) == "number" and score > 0 then
            return score, "raiderio"
        end
    end

    local key = CacheKey(unit)
    if key and CacheFresh(key) then
        return RR.prevCache[key].score, "group"
    end
    return nil
end

--- Last season's rank for a unit, judged by the cutoffs in force when that
--- season closed.
---@return table|nil rank, number|nil score, string|nil seasonName, boolean plus
function RR:GetPreviousSeasonRank(unit)
    local score = self:GetPreviousSeasonScore(unit)
    if not score or score <= 0 then return nil end

    local thresholds, seasonName, wings = self:GetPreviousSeasonCutoffs()
    if not thresholds then return nil, score, nil, false end

    -- Highest rank whose closing threshold the score cleared.
    local best, bestMin
    for _, rank in ipairs(self.RANKS) do
        if rank.id ~= "UNRANKED" then
            local minScore = thresholds[rank.id]
            if minScore and score >= minScore
               and (not bestMin or minScore > bestMin) then
                best, bestMin = rank, minScore
            end
        end
    end
    -- Upper half of the bracket, same rule the live rank uses. Challenger has
    -- no upper half, it is the top.
    local plus = false
    if best and best.id ~= "CHALLENGER" and wings and wings[best.id] then
        plus = score >= wings[best.id]
    end

    return best, score, seasonName, plus
end

-- ── Group broadcast ─────────────────────────────────────────────────────────

function RR:BroadcastPreviousSeason()
    local channel = self.GetGroupChannel and self:GetGroupChannel()
    if not channel then return end

    local score = self:GetOwnPreviousSeasonScore()
    if not score or score <= 0 then return end

    C_ChatInfo.SendAddonMessage(ADDON_PREFIX, tostring(math.floor(score)), channel)
end

-- ── Diagnostics ─────────────────────────────────────────────────────────────

--- Reports what each source returns, and can stand in a finished season so the
--- tooltip line can be checked before one has actually rolled over.
function RR:DebugPreviousSeason(arg)
    local function line(label, value)
        print(string.format("  %-22s %s", label, tostring(value)))
    end

    if arg == "sim" then
        if self.debugPrev then
            self.debugPrev = nil
            print("|cff00ccffRaiderRanked|r Simulated previous season cleared.")
        else
            -- Today's cutoffs stand in for a season that closed, and the
            -- character's own peak stands in for its closing score. Nothing is
            -- written to the database.
            local thresholds = self:CutoffThresholds(self.db.cutoffRegion, self.db.cutoffFaction)
            local key = (UnitName("player") or "?") .. "-" .. (GetNormalizedRealmName() or "")
            local score = (self.db.charPeak and self.db.charPeak[key])
                or self.playerScore or 0
            if score <= 0 then score = thresholds and thresholds.DIAMOND or 3000 end

            self.debugPrev = {
                thresholds = thresholds,
                wings      = self:CutoffWingScores(self.db.cutoffRegion, self.db.cutoffFaction),
                score      = score,
                name       = "Simulated",
            }
            print(string.format(
                "|cff00ccffRaiderRanked|r Simulating a finished season at score %d. "
                .. "Repeat to stop; a reload also clears it.", score))
        end
    end

    print("|cff00ccffRaiderRanked|r Previous season:")
    line("simulation active", self.debugPrev ~= nil)

    local thresholds, name = self:GetPreviousSeasonCutoffs()
    line("closing cutoffs", thresholds and ("yes (" .. tostring(name) .. ")") or "none yet")
    if thresholds then
        line("  Challenger at", thresholds.CHALLENGER)
        line("  Diamond at", thresholds.DIAMOND)
    end
    line("own closing score", self:GetOwnPreviousSeasonScore() or "none")
    line("RaiderIO present", (RaiderIO and RaiderIO.GetProfile) and "yes" or "no")
    line("RaiderIO predates reset", self:RaiderIOPredatesReset())
    -- Equal names mean the daily job has not seen the rollover yet, which is
    -- what decides the question for anyone without a season of their own.
    line("season names", string.format("%s / %s",
        self:CurrentSeasonName(),
        self.PREV_SEASON_NAME and self:SeasonDisplayName(self.PREV_SEASON_NAME) or "none"))

    for _, unit in ipairs({ "player", "target", "mouseover" }) do
        if UnitExists(unit) and UnitIsPlayer(unit) then
            local score, source = self:GetPreviousSeasonScore(unit)
            local rank, _, _, plus = self:GetPreviousSeasonRank(unit)
            line(unit, string.format("%s from %s -> %s",
                tostring(score), tostring(source),
                rank and (rank.name .. (plus and " +" or "")) or "no rank"))

            -- Raw RaiderIO fields, so a missing line can be traced to their
            -- data rather than guessed at from the outside.
            local mplus = self:GetRaiderIOKeystoneProfile(unit)
            if mplus then
                line("  rio current", mplus.currentScore)
                line("  rio previous", mplus.previousScore)
                line("  rio prev season", mplus.previousScoreSeason)
                line("  rio main previous", mplus.mainPreviousScore)
            else
                line("  rio profile", "none for this character")
            end
        end
    end
end

-- ── Events ──────────────────────────────────────────────────────────────────

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("GROUP_ROSTER_UPDATE")
frame:RegisterEvent("CHAT_MSG_ADDON")

local broadcastTicker

frame:SetScript("OnEvent", function(_, event, ...)
    if event == "PLAYER_LOGIN" then
        C_ChatInfo.RegisterAddonMessagePrefix(ADDON_PREFIX)
        if not broadcastTicker then
            broadcastTicker = C_Timer.NewTicker(BROADCAST_INTERVAL, function()
                RR:BroadcastPreviousSeason()
                PruneCache()
            end)
        end

    elseif event == "GROUP_ROSTER_UPDATE" then
        -- Slight delay: the roster is not settled the instant the event fires,
        -- and a send into a half-formed group is wasted.
        C_Timer.After(2, function() RR:BroadcastPreviousSeason() end)

    elseif event == "CHAT_MSG_ADDON" then
        local prefix, payload, _, sender = ...
        if prefix ~= ADDON_PREFIX then return end

        local score = tonumber(payload)
        if not score or score <= 0 then return end

        local key = CacheKeyFromName(sender)
        if not key then return end
        RR.prevCache[key] = { score = score, timestamp = GetTime() }
    end
end)
