#!/usr/bin/env python3
"""
Fetch M+ score distributions from Raider.IO for every
(region × faction) combination and compute percentile-based rank
thresholds per combo.

Regions fetched: us, eu.
Factions fetched per region: all, horde, alliance.
The synthetic "all" region is derived from us+eu via a population-
weighted average at each percentile (not a true merged ranking, but
monotonic and within a few points of an exact merge sort — cheap
enough to run daily).

Output thresholds.json schema (additive migration):

    {
      # nested per-region / per-faction cutoffs (new)
      "cutoffs": {
        "us":  { "all": {...}, "horde": {...}, "alliance": {...} },
        "eu":  { ... },
        "all": { ... }
      },

      # flat legacy fields — mirror of cutoffs.eu.all so pre-migration
      # consumers keep working.
      "region": "eu",
      "totalPlayers": <int>,
      "top100Score": <int>,
      "thresholds": { RANK: {"minScore": int, "wingScore": int}, ... },

      # season metadata (unchanged)
      "season": "season-mn-1",
      "seasonName": "Season 1",
      "seasonStart": "2026-...Z",
      "expansionId": 11,
      "updated": "..."
    }

Runs daily on catto.at (systemd timer, writes /var/www/catto.at/api/
raiderranked/thresholds.json) and in caaatto/RaiderRanked GitHub
Actions (feeds CurseForge release pipeline). Both deployments share
this exact file.
"""

import json
import os
import sys
import time
from datetime import datetime, timezone
from pathlib import Path

import requests

SEASON_OVERRIDE = os.getenv("RR_SEASON")
EXPANSION_OVERRIDE = int(os.getenv("RR_EXPANSION_ID")) if os.getenv("RR_EXPANSION_ID") else None
EXPANSION_BASELINE = 11
EXPANSION_PROBE_RANGE = 5
# Region whose season slug / seasonStart is treated as authoritative for
# metadata (seasonStart varies by region, but only one gets embedded).
PRIMARY_REGION = os.getenv("RR_PRIMARY_REGION", "eu")
OUTPUT_DIR = Path(os.getenv("RR_OUTPUT_DIR", "/var/www/catto.at/api/raiderranked"))
STATE_PATH = Path(os.getenv("RR_STATE_PATH")) if os.getenv("RR_STATE_PATH") else None

RIO_BASE = "https://raider.io/api"
REQUEST_DELAY = 0.4

MAX_POPULATION_DROP = 0.5

REGIONS = ["us", "eu"]
# None = no faction filter (all). "horde" / "alliance" map to the
# rankings API's faction query param.
FACTIONS = [None, "horde", "alliance"]
FACTION_KEY = {None: "all", "horde": "horde", "alliance": "alliance"}

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

TOP_100_POSITION = 99


# --- Season resolution (unchanged from single-region version) -------------

def fetch_seasons(session, expansion_id):
    time.sleep(REQUEST_DELAY)
    resp = session.get(
        f"{RIO_BASE}/v1/mythic-plus/static-data",
        params={"expansion_id": expansion_id},
        timeout=30,
    )
    resp.raise_for_status()
    return resp.json().get("seasons", [])


def detect_active_expansion(session, region, now_iso):
    candidates = []
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


# --- Raider.IO client (now faction-aware) ---------------------------------

class RioClient:
    def __init__(self, session, season, region, faction=None):
        self.session = session
        self.season = season
        self.region = region
        self.faction = faction  # None | "horde" | "alliance"
        self._cache = {}
        self._page_size = None

    def _get_page(self, page):
        if page in self._cache:
            return self._cache[page]
        time.sleep(REQUEST_DELAY)
        params = {
            "season": self.season,
            "region": self.region,
            "class": "all",
            "role": "all",
            "page": page,
        }
        if self.faction:
            params["faction"] = self.faction
        resp = self.session.get(
            f"{RIO_BASE}/mythic-plus/rankings/characters",
            params=params,
            timeout=30,
        )
        resp.raise_for_status()
        data = resp.json()
        self._cache[page] = data
        return data

    @staticmethod
    def _unpack(data):
        inner = data.get("rankings", data)
        ui = inner.get("ui", {})
        page_size = ui.get("pageSize", 100)
        last_page = ui.get("lastPage", 0)
        total = (last_page + 1) * page_size
        entries = inner.get("rankedCharacters", inner.get("rankings", []))
        return total, entries

    @staticmethod
    def _extract_score(entry):
        for key in ("score", "mythicPlusScore", "mythic_plus_score"):
            val = entry.get(key)
            if isinstance(val, (int, float)):
                return int(val)
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
        ps = self._page_size or 20
        page = position // ps
        offset = position % ps
        data = self._get_page(page)
        _, entries = self._unpack(data)
        if offset >= len(entries):
            return 0
        return self._extract_score(entries[offset])


# --- Threshold computation ------------------------------------------------

def compute_for_client(client, label):
    total = client.get_total()
    print(f"  [{label}] total: {total:,}")
    if total == 0:
        return {"_total": 0, "_top100": 0}

    result = {
        "_total": total,
        "_top100": max(1, client.score_at(TOP_100_POSITION)),
    }
    for rank_id, top_pct, bot_pct in BRACKETS:
        min_pos = max(0, min(total - 1, int(total * bot_pct) - 1))
        mid_pos = max(0, min(total - 1, int(total * (top_pct + bot_pct) / 2)))
        min_score = max(1, client.score_at(min_pos))
        wing_score = max(min_score, client.score_at(mid_pos))
        result[rank_id] = {"minScore": min_score, "wingScore": wing_score}
    return result


def merge_all_regions(per_region):
    """Approximate the 'all regions' cutoff at each percentile using a
    population-weighted average of the per-region values. Exact merge
    would require a combined sort across all pages — this is within a
    few rating points and costs zero extra API calls.

    per_region: { "us": {faction_key: bracket_dict}, "eu": {...} }
    Returns: { faction_key: bracket_dict }
    """
    out = {}
    for fkey in ("all", "horde", "alliance"):
        regions = [per_region[r][fkey] for r in REGIONS if per_region[r].get(fkey)]
        if not regions:
            continue
        totals = [r["_total"] for r in regions]
        pop = sum(totals)
        if pop == 0:
            continue

        merged = {
            "_total": pop,
            "_top100": max(r["_top100"] for r in regions),
        }
        for rank_id, _, _ in BRACKETS:
            vals = [r[rank_id] for r in regions if rank_id in r]
            if len(vals) != len(regions):
                continue
            min_score = round(sum(v["minScore"] * t for v, t in zip(vals, totals)) / pop)
            wing_score = round(sum(v["wingScore"] * t for v, t in zip(vals, totals)) / pop)
            merged[rank_id] = {
                "minScore": max(1, min_score),
                "wingScore": max(min_score, wing_score),
            }
        out[fkey] = merged
    return out


def strip_meta(bracket_dict):
    """Drop _total / _top100 keys before emitting the per-rank thresholds block."""
    return {k: v for k, v in bracket_dict.items() if not k.startswith("_")}


# --- Output ---------------------------------------------------------------

def write_json(season_meta, expansion_id, cutoffs, primary_region):
    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)
    out = OUTPUT_DIR / "thresholds.json"

    primary_all = cutoffs[primary_region]["all"]

    payload = {
        "season": season_meta["slug"],
        "seasonName": season_meta.get("name", season_meta["slug"]),
        "seasonStart": season_meta.get("starts", {}).get(primary_region),
        "expansionId": expansion_id,
        "updated": datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ"),
        "cutoffs": {
            region: {
                fkey: {
                    "totalPlayers": data["_total"],
                    "top100Score": data["_top100"],
                    "thresholds": strip_meta(data),
                }
                for fkey, data in region_data.items()
            }
            for region, region_data in cutoffs.items()
        },
        # Legacy flat keys (mirror of primary region's "all" faction).
        "region": primary_region,
        "totalPlayers": primary_all["_total"],
        "top100Score": primary_all["_top100"],
        "thresholds": strip_meta(primary_all),
    }

    tmp = out.with_suffix(".tmp")
    with open(tmp, "w") as f:
        json.dump(payload, f, indent=2)
        f.write("\n")
    tmp.rename(out)
    print(f"Written to {out}")


# --- Main -----------------------------------------------------------------

def resolve_with_fallback(session, state, now_iso):
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
            detected = detect_active_expansion(session, PRIMARY_REGION, now_iso)
        except Exception as e:
            print(f"WARN: expansion auto-detect failed: {e}", file=sys.stderr)
            detected = None
        if detected is not None:
            expansion_id, seasons = detected

    if seasons is not None:
        meta = resolve_active_season(seasons, now_iso, PRIMARY_REGION, SEASON_OVERRIDE)
        if meta:
            return meta, expansion_id
        print(
            f"WARN: no season resolved (override={SEASON_OVERRIDE!r}, "
            f"region={PRIMARY_REGION}, expansion={expansion_id})",
            file=sys.stderr,
        )

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
            "starts": {PRIMARY_REGION: state.get("seasonStart")} if state.get("seasonStart") else {},
        }
        return meta, fallback_expansion
    print("ERROR: no season resolvable and no fallback available", file=sys.stderr)
    sys.exit(1)


def main():
    print("--- RaiderRanked threshold update (multi-region / multi-faction) ---")
    print(f"{datetime.now(timezone.utc).isoformat()}")
    print(
        f"Primary region: {PRIMARY_REGION} | "
        f"Expansion override: {EXPANSION_OVERRIDE if EXPANSION_OVERRIDE is not None else '(auto)'} | "
        f"Season override: {SEASON_OVERRIDE or '(none)'}\n"
    )

    session = requests.Session()
    session.headers["User-Agent"] = "RaiderRanked-Updater/2.0"

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
    print(f"Active season: {active_season} ({season_meta.get('name', '?')})\n")

    # Fetch all 6 concrete combos (2 regions × 3 factions).
    cutoffs = {r: {} for r in REGIONS}
    for region in REGIONS:
        for faction in FACTIONS:
            fkey = FACTION_KEY[faction]
            label = f"{region}/{fkey}"
            client = RioClient(session, active_season, region, faction)
            cutoffs[region][fkey] = compute_for_client(client, label)

    # Derive the synthetic "all" region via population-weighted merge.
    cutoffs["all"] = merge_all_regions(cutoffs)

    # Sanity guard against half-empty snapshots: compare the flagship
    # bucket (primary region / all factions) against last run on same season.
    primary_total = cutoffs[PRIMARY_REGION]["all"]["_total"]
    last_total = state.get("totalPlayers", 0)
    last_season = state.get("activeSeason")
    if (
        active_season == last_season
        and last_total > 0
        and primary_total < last_total * (1 - MAX_POPULATION_DROP)
    ):
        print(
            f"ERROR: totalPlayers ({PRIMARY_REGION}/all) dropped "
            f"{last_total:,} -> {primary_total:,} (>{int(MAX_POPULATION_DROP * 100)}% on same season). "
            f"Refusing to overwrite.",
            file=sys.stderr,
        )
        sys.exit(2)

    write_json(season_meta, expansion_id, cutoffs, PRIMARY_REGION)
    write_state({
        "activeSeason": active_season,
        "seasonName": season_meta.get("name"),
        "seasonStart": season_meta.get("starts", {}).get(PRIMARY_REGION),
        "expansionId": expansion_id,
        "totalPlayers": primary_total,
        "lastUpdated": now_iso,
    })
    print("Done.")


if __name__ == "__main__":
    main()
