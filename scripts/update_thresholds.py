#!/usr/bin/env python3
"""
Fetch M+ score distribution from Raider.IO and compute
percentile-based rank thresholds for RaiderRanked.
"""

import json
import os
import sys
import time
from datetime import datetime, timezone
from pathlib import Path

import requests

SEASON = os.getenv("RR_SEASON", "season-tww-2")
REGION = os.getenv("RR_REGION", "world")
OUTPUT_DIR = Path(os.getenv("RR_OUTPUT_DIR", "."))

RIO_BASE = "https://raider.io/api/v1"
REQUEST_DELAY = 0.4

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


class RioClient:
    def __init__(self):
        self.session = requests.Session()
        self.session.headers["User-Agent"] = "RaiderRanked-Updater/1.0"
        self._cache = {}
        self._page_size = None

    def _get_page(self, page):
        if page in self._cache:
            return self._cache[page]
        time.sleep(REQUEST_DELAY)
        resp = self.session.get(
            f"{RIO_BASE}/mythic-plus/rankings/characters",
            params={"season": SEASON, "region": REGION, "page": page},
            timeout=30,
        )
        resp.raise_for_status()
        data = resp.json()
        self._cache[page] = data
        return data

    @staticmethod
    def _unpack(data):
        inner = data.get("rankingData", data)
        total = inner.get("totalCount", inner.get("total", 0))
        entries = inner.get("rankings", inner.get("characters", []))
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


def compute(client):
    total = client.get_total()
    if total == 0:
        print("ERROR: 0 players returned", file=sys.stderr)
        sys.exit(1)

    print(f"Total ranked players: {total:,}")
    thresholds = {}

    for rank_id, top_pct, bot_pct in BRACKETS:
        min_pos = max(0, min(total - 1, int(total * bot_pct) - 1))
        mid_pos = max(0, min(total - 1, int(total * (top_pct + bot_pct) / 2)))

        min_score = max(1, client.score_at(min_pos))
        wing_score = max(min_score, client.score_at(mid_pos))

        thresholds[rank_id] = {"minScore": min_score, "wingScore": wing_score}
        print(f"  {rank_id:15s}  min={min_score:5d}  wing={wing_score:5d}")

    return total, thresholds


def write_json(total, thresholds):
    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)
    out = OUTPUT_DIR / "thresholds.json"

    payload = {
        "season": SEASON,
        "updated": datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ"),
        "totalPlayers": total,
        "thresholds": thresholds,
    }

    tmp = out.with_suffix(".tmp")
    with open(tmp, "w") as f:
        json.dump(payload, f, indent=2)
        f.write("\n")
    tmp.rename(out)
    print(f"Written to {out}")


def main():
    print(f"--- RaiderRanked threshold update ---")
    print(f"{datetime.now(timezone.utc).isoformat()}")
    print(f"Season: {SEASON} | Region: {REGION}\n")

    client = RioClient()
    total, thresholds = compute(client)
    write_json(total, thresholds)
    print("Done.")


if __name__ == "__main__":
    main()
