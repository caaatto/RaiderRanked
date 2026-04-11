#!/usr/bin/env python3
"""
Fetch M+ score distribution from Raider.IO and compute
percentile-based rank thresholds for RaiderRanked.

Runs daily on the catto.at server via systemd timer (writing to the
public api dir) and in the caaatto/RaiderRanked GitHub Actions workflow
(feeding the addon's CurseForge release pipeline). Both deployments
share this exact file.

Auto-detects the current expansion and main season from Raider.IO's
static-data endpoint, falls back to the last known good values from
state.json if the static-data call fails. Writes thresholds.json
(consumed by the website and patched into the addon) and state.json
(internal bookkeeping used by the population sanity guard).
"""

import json
import os
import sys
import time
from datetime import datetime, timezone
from pathlib import Path

import requests

# RR_SEASON acts as a manual override for emergencies. When set, the
# auto-detection is bypassed and the given slug is used directly. The
# script still tries to look up metadata for that slug from static-data
# so seasonName/seasonStart can be populated.
SEASON_OVERRIDE = os.getenv("RR_SEASON")
# RR_EXPANSION_ID pins to a specific Raider.IO expansion (10 = TWW,
# 11 = Midnight, ...). When unset the script probes upward from
# EXPANSION_BASELINE and picks the highest expansion with a started
# main season for the configured region, so cross-expansion rollovers
# do not require a code change.
EXPANSION_OVERRIDE = int(os.getenv("RR_EXPANSION_ID")) if os.getenv("RR_EXPANSION_ID") else None
EXPANSION_BASELINE = 11  # 11 = Midnight; lowest expansion auto-detect considers
EXPANSION_PROBE_RANGE = 5  # probe IDs [BASELINE, BASELINE + RANGE)
REGION = os.getenv("RR_REGION", "eu")
OUTPUT_DIR = Path(os.getenv("RR_OUTPUT_DIR", "/var/www/catto.at/api/raiderranked"))
# state.json defaults to next to thresholds.json. Override is useful in CI
# contexts where the output dir is ephemeral (e.g. GitHub Actions ./build)
# but the state needs to persist via a committed file at a stable path.
STATE_PATH = Path(os.getenv("RR_STATE_PATH")) if os.getenv("RR_STATE_PATH") else None

RIO_BASE = "https://raider.io/api"
REQUEST_DELAY = 0.4  # be nice to rio

# Refuse to write if the population on the same season slug drops by
# more than this fraction between runs. Catches both API hiccups and
# the period right before/after a season-end where the snapshot can
# briefly become incoherent.
MAX_POPULATION_DROP = 0.5

# (rank_id, top_percentile, bottom_percentile)
# top is exclusive, bottom inclusive. sorted top to bottom.
BRACKETS = [
    ("CHALLENGER",  0.000, 0.001),
    ("GRANDMASTER", 0.001, 0.003),
    ("MASTER",      0.003, 0.010),
    ("DIAMOND",     0.010, 0.040),
    ("EMERALD",     0.040, 0.080),
    ("PLATINUM",    0.080, 0.200),
    ("GOLD",        0.200, 0.400),
    ("SILVER",      0.400, 0.700),
    ("BRONZE",      0.700, 0.900),
    ("IRON",        0.900, 1.000),
]

TOP_100_POSITION = 99  # 0-indexed: position 99 = 100th player


# --- Season resolution ----------------------------------------------------

def fetch_seasons(session, expansion_id):
    """Return the seasons list from Raider.IO static data for the given expansion."""
    time.sleep(REQUEST_DELAY)
    resp = session.get(
        f"{RIO_BASE}/v1/mythic-plus/static-data",
        params={"expansion_id": expansion_id},
        timeout=30,
    )
    resp.raise_for_status()
    return resp.json().get("seasons", [])


def detect_active_expansion(session, region, now_iso):
    """Probe expansion IDs from EXPANSION_BASELINE upward, return
    (expansion_id, seasons) for the expansion whose latest started
    main_season is most recent in the region.

    When the next expansion launches with its first main season, that
    season's start timestamp will be more recent than any of the
    previous expansion's, so this naturally promotes to the new
    expansion ID without a code change. Until that first season
    actually starts, the previous expansion still wins.

    Stops probing after two consecutive misses (HTTP error or no
    started main_seasons) so a brand-new expansion ID does not cause
    runaway requests. Returns None if every probe came up empty;
    callers should fall back to state.json or hard-error.
    """
    candidates = []  # (latest_start, expansion_id, seasons)
    consecutive_misses = 0
    for eid in range(EXPANSION_BASELINE, EXPANSION_BASELINE + EXPANSION_PROBE_RANGE):
        try:
            seasons = fetch_seasons(session, eid)
        except Exception as e:
            print(f"WARN: probe expansion_id={eid} failed: {e}", file=sys.stderr)
            consecutive_misses += 1
            if consecutive_misses >= 2:
                break
            continue

        started = [
            s for s in seasons
            if s.get("is_main_season")
            and s.get("starts", {}).get(region, "") <= now_iso
        ]
        if started:
            latest_start = max(s["starts"][region] for s in started)
            candidates.append((latest_start, eid, seasons))
            consecutive_misses = 0
        else:
            consecutive_misses += 1
            if consecutive_misses >= 2:
                break

    if not candidates:
        return None

    candidates.sort(reverse=True)
    _, eid, seasons = candidates[0]
    return eid, seasons


def resolve_active_season(seasons, now_iso, region, slug_override=None):
    """Pick the season we should compute thresholds for.

    Override path: return the season matching slug_override (any kind),
    so emergency overrides still get full metadata.

    Auto-detect path: among main_seasons that have already started in the
    given region, prefer the one whose [starts, ends) window contains
    `now_iso`. If multiple match (e.g. a "post" season overlapping the
    next pre-patch), prefer the one with the latest start. If none is
    currently live, fall back to the latest started season. Raider.IO
    keeps old snapshots queryable, so the previous season is still the
    correct anchor during the gap before the next one launches.
    """
    if slug_override:
        for s in seasons:
            if s.get("slug") == slug_override:
                return s
        return None

    main = [s for s in seasons if s.get("is_main_season")]
    started = [s for s in main if s.get("starts", {}).get(region, "") <= now_iso]
    if not started:
        return None

    live = [s for s in started if now_iso < s.get("ends", {}).get(region, "")]
    pool = live or started
    return max(pool, key=lambda s: s["starts"][region])


# --- State persistence ----------------------------------------------------

def state_path():
    return STATE_PATH if STATE_PATH else OUTPUT_DIR / "state.json"


def read_state():
    try:
        with open(state_path()) as f:
            return json.load(f)
    except (FileNotFoundError, json.JSONDecodeError):
        return {}


def write_state(state):
    path = state_path()
    path.parent.mkdir(parents=True, exist_ok=True)
    tmp = path.with_suffix(".tmp")
    with open(tmp, "w") as f:
        json.dump(state, f, indent=2)
        f.write("\n")
    tmp.rename(path)


# --- Raider.IO client -----------------------------------------------------

class RioClient:
    """Thin wrapper around the Raider.IO rankings API with page caching."""

    def __init__(self, session, season, region):
        self.session = session
        self.season = season
        self.region = region
        self._cache = {}
        self._page_size = None

    def _get_page(self, page):
        if page in self._cache:
            return self._cache[page]

        time.sleep(REQUEST_DELAY)
        resp = self.session.get(
            f"{RIO_BASE}/mythic-plus/rankings/characters",
            params={
                "season": self.season,
                "region": self.region,
                "class": "all",
                "role": "all",
                "page": page,
            },
            timeout=30,
        )
        resp.raise_for_status()
        data = resp.json()
        self._cache[page] = data
        return data

    @staticmethod
    def _unpack(data):
        """Handle the Raider.IO rankings response format."""
        inner = data.get("rankings", data)
        ui = inner.get("ui", {})
        page_size = ui.get("pageSize", 100)
        last_page = ui.get("lastPage", 0)
        total = (last_page + 1) * page_size
        entries = inner.get("rankedCharacters", inner.get("rankings", []))
        return total, entries

    @staticmethod
    def _extract_score(entry):
        """Pull the M+ score out of a ranking entry."""
        for key in ("score", "mythicPlusScore", "mythic_plus_score"):
            val = entry.get(key)
            if isinstance(val, (int, float)):
                return int(val)
        # try nested under character
        char = entry.get("character", {})
        for key in ("score", "mythicPlusScore"):
            val = char.get(key)
            if isinstance(val, (int, float)):
                return int(val)
        return 0

    def get_total(self):
        data = self._get_page(0)
        total, entries = self._unpack(data)
        self._page_size = len(entries) if entries else 20
        return total

    def score_at(self, position):
        """Return the M+ score at the given 0-indexed ranking position."""
        ps = self._page_size or 20
        page = position // ps
        offset = position % ps

        data = self._get_page(page)
        _, entries = self._unpack(data)

        if offset >= len(entries):
            return 0
        return self._extract_score(entries[offset])


# --- Threshold computation ------------------------------------------------

def compute(client):
    total = client.get_total()
    if total == 0:
        print("ERROR: 0 players returned, aborting", file=sys.stderr)
        sys.exit(1)

    print(f"Total ranked players: {total:,}")

    # Top 100 threshold: score of the 100th ranked player
    top100_score = max(1, client.score_at(TOP_100_POSITION))
    print(f"  Top 100 score (pos {TOP_100_POSITION + 1}): {top100_score}")

    thresholds = {}
    for rank_id, top_pct, bot_pct in BRACKETS:
        # position of the lowest-scoring player in this bracket
        min_pos = max(0, min(total - 1, int(total * bot_pct) - 1))
        # midpoint position for wingScore
        mid_pos = max(0, min(total - 1, int(total * (top_pct + bot_pct) / 2)))

        min_score = max(1, client.score_at(min_pos))
        wing_score = max(min_score, client.score_at(mid_pos))

        thresholds[rank_id] = {"minScore": min_score, "wingScore": wing_score}
        print(f"  {rank_id:15s}  min={min_score:5d}  wing={wing_score:5d}")

    return total, top100_score, thresholds


# --- Output ---------------------------------------------------------------

def write_json(season_meta, expansion_id, total, top100_score, thresholds):
    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)
    out = OUTPUT_DIR / "thresholds.json"

    payload = {
        "season": season_meta["slug"],
        "seasonName": season_meta.get("name", season_meta["slug"]),
        "seasonStart": season_meta.get("starts", {}).get(REGION),
        "expansionId": expansion_id,
        "region": REGION,
        "updated": datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ"),
        "totalPlayers": total,
        "top100Score": top100_score,
        "thresholds": thresholds,
    }

    tmp = out.with_suffix(".tmp")
    with open(tmp, "w") as f:
        json.dump(payload, f, indent=2)
        f.write("\n")
    tmp.rename(out)  # atomic on same fs

    print(f"Written to {out}")


# --- Main -----------------------------------------------------------------

def resolve_with_fallback(session, state, now_iso):
    """Resolve (season_meta, expansion_id) with graceful degradation
    when the static-data endpoint is unreachable.

    Two paths:
      - EXPANSION_OVERRIDE set: single fetch against the pinned expansion.
      - Otherwise: probe expansions starting at EXPANSION_BASELINE and
        let detect_active_expansion pick the highest one with a started
        main season for the region.

    Falls back to SEASON_OVERRIDE or state.json on hard failure.
    Returns (season_meta_dict, resolved_expansion_id).
    """
    seasons = None
    expansion_id = None

    if EXPANSION_OVERRIDE is not None:
        try:
            seasons = fetch_seasons(session, EXPANSION_OVERRIDE)
            expansion_id = EXPANSION_OVERRIDE
        except Exception as e:
            print(f"WARN: static-data fetch failed: {e}", file=sys.stderr)
    else:
        try:
            detected = detect_active_expansion(session, REGION, now_iso)
        except Exception as e:
            print(f"WARN: expansion auto-detect failed: {e}", file=sys.stderr)
            detected = None
        if detected is not None:
            expansion_id, seasons = detected

    if seasons is not None:
        meta = resolve_active_season(seasons, now_iso, REGION, SEASON_OVERRIDE)
        if meta:
            return meta, expansion_id
        print(
            f"WARN: no season resolved (override={SEASON_OVERRIDE!r}, "
            f"region={REGION}, expansion={expansion_id})",
            file=sys.stderr,
        )

    # All fallbacks below pull the expansion ID from state.json so the
    # written output stays internally consistent: the season slug we
    # fall back to was originally computed against state's expansion,
    # not whatever the user just tried to override to.
    fallback_expansion = state.get("expansionId", EXPANSION_BASELINE)

    if SEASON_OVERRIDE:
        print(f"Falling back to override slug: {SEASON_OVERRIDE}", file=sys.stderr)
        return {"slug": SEASON_OVERRIDE, "name": SEASON_OVERRIDE}, fallback_expansion

    if state.get("activeSeason"):
        slug = state["activeSeason"]
        print(f"Falling back to last known good season: {slug}", file=sys.stderr)
        meta = {
            "slug": slug,
            "name": state.get("seasonName", slug),
            "starts": {REGION: state.get("seasonStart")} if state.get("seasonStart") else {},
        }
        return meta, fallback_expansion

    print("ERROR: no season resolvable and no fallback available", file=sys.stderr)
    sys.exit(1)


def main():
    print(f"--- RaiderRanked threshold update ---")
    print(f"{datetime.now(timezone.utc).isoformat()}")
    print(
        f"Region: {REGION} | "
        f"Expansion override: {EXPANSION_OVERRIDE if EXPANSION_OVERRIDE is not None else '(auto)'} | "
        f"Season override: {SEASON_OVERRIDE or '(none)'}\n"
    )

    session = requests.Session()
    session.headers["User-Agent"] = "RaiderRanked-Updater/1.0"

    state = read_state()
    now_iso = datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")

    season_meta, expansion_id = resolve_with_fallback(session, state, now_iso)
    active_season = season_meta["slug"]

    last_expansion = state.get("expansionId")
    if last_expansion and last_expansion != expansion_id:
        print(f"*** Expansion promoted: {last_expansion} -> {expansion_id} ***")
    promoted = state.get("activeSeason") and state["activeSeason"] != active_season
    if promoted:
        print(f"*** Season promoted: {state['activeSeason']} -> {active_season} ***")
    print(f"Active expansion: {expansion_id}")
    print(f"Active season: {active_season} ({season_meta.get('name', '?')})")
    print(f"Region start: {season_meta.get('starts', {}).get(REGION, '?')}\n")

    client = RioClient(session, active_season, REGION)
    total, top100_score, thresholds = compute(client)

    # Sanity check: catastrophic population drop on the same season slug
    # is almost always either an API blip or the season ending. Refuse to
    # overwrite a healthy file with a half-empty snapshot.
    last_total = state.get("totalPlayers", 0)
    last_season = state.get("activeSeason")
    if (
        active_season == last_season
        and last_total > 0
        and total < last_total * (1 - MAX_POPULATION_DROP)
    ):
        print(
            f"ERROR: totalPlayers dropped {last_total:,} -> {total:,} "
            f"(>{int(MAX_POPULATION_DROP * 100)}% on same season). "
            f"Refusing to overwrite.",
            file=sys.stderr,
        )
        sys.exit(2)

    write_json(season_meta, expansion_id, total, top100_score, thresholds)
    write_state({
        "activeSeason": active_season,
        "seasonName": season_meta.get("name"),
        "seasonStart": season_meta.get("starts", {}).get(REGION),
        "expansionId": expansion_id,
        "totalPlayers": total,
        "lastUpdated": now_iso,
    })
    print("Done.")


if __name__ == "__main__":
    main()
