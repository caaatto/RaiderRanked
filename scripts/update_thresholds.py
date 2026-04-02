#!/usr/bin/env python3
"""
Fetch M+ score distribution from Raider.IO season-cutoffs API,
interpolate percentile-based rank thresholds, and write thresholds.json.
"""

import json
import math
import os
from datetime import datetime, timezone
from pathlib import Path

import time

import requests

SEASON = os.getenv("RR_SEASON", "season-mn-1")
REGION = os.getenv("RR_REGION", "eu")
OUTPUT_DIR = Path(os.getenv("RR_OUTPUT_DIR", "."))

RIO_BASE = "https://raider.io/api"
RIO_V1 = "https://raider.io/api/v1"
TOP_100_POSITION = 99  # 0-indexed: position 99 = 100th player
REQUEST_DELAY = 0.4

# Bracket definitions: (rank_id, top_pct_start, top_pct_end)
# e.g. Challenger = top 0% to 0.1% of all players
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


def fetch_cutoffs():
    """Fetch season-cutoffs from Raider.IO. Returns (total_players, data_points).

    data_points is a sorted list of (top_fraction, score) tuples,
    built from percentile cutoffs + keystone achievement cutoffs.
    """
    resp = requests.get(
        f"{RIO_V1}/mythic-plus/season-cutoffs",
        params={"season": SEASON, "region": REGION},
        headers={"User-Agent": "RaiderRanked-Updater/1.0"},
        timeout=30,
    )
    resp.raise_for_status()
    cutoffs = resp.json()["cutoffs"]

    # Extract percentile cutoffs (p999 = quantile 0.999 = top 0.1%)
    points = []
    total = 0
    for key in ("p999", "p990", "p900", "p750", "p600"):
        entry = cutoffs[key]["all"]
        total = entry["totalPopulationCount"]
        top_frac = 1.0 - entry["quantile"]
        score = entry["quantileMinValue"]
        points.append((top_frac, score))

    # Keystone achievement cutoffs give us data in the lower half
    for key in ("keystoneLegend", "keystoneHero", "keystoneMaster",
                "keystoneConqueror", "keystoneExplorer"):
        if key not in cutoffs:
            continue
        entry = cutoffs[key]
        # These have a flat structure (not nested under "all")
        if "all" in entry:
            entry = entry["all"]
        if "quantilePopulationFraction" not in entry:
            continue
        top_frac = entry["quantilePopulationFraction"]
        score = entry["quantileMinValue"]
        points.append((top_frac, score))

    # Sort by top_fraction ascending (highest ranked first)
    points.sort(key=lambda p: p[0])

    # Deduplicate near-overlapping points (e.g. p600 and keystoneHero)
    filtered = [points[0]]
    for frac, score in points[1:]:
        if abs(frac - filtered[-1][0]) > 0.005:
            filtered.append((frac, score))

    return total, filtered


def fetch_top100_score():
    """Fetch the score of the 100th ranked player from the rankings API."""
    page = TOP_100_POSITION // 100  # default pageSize is 100
    offset = TOP_100_POSITION % 100

    resp = requests.get(
        f"{RIO_BASE}/mythic-plus/rankings/characters",
        params={
            "season": SEASON,
            "region": REGION,
            "class": "all",
            "role": "all",
            "page": page,
        },
        headers={"User-Agent": "RaiderRanked-Updater/1.0"},
        timeout=30,
    )
    resp.raise_for_status()
    data = resp.json()

    rankings = data.get("rankings", {})
    entries = rankings.get("rankedCharacters", [])

    if offset < len(entries):
        score = entries[offset].get("score", 0)
        if isinstance(score, (int, float)):
            return max(1, int(score))
    return 0


def interpolate(top_frac, points):
    """Piecewise linear interpolation in log10(top_fraction) space.

    For fractions beyond the last data point (bottom of distribution),
    scores decay linearly to 0 at top_frac=1.0 — this matches observed
    M+ score distributions much better than log extrapolation.
    """
    last_frac, last_score = points[-1]

    # Beyond last data point: linear decay to 0 at 100%
    if top_frac >= last_frac:
        remaining = 1.0 - last_frac
        if remaining <= 0:
            return last_score
        return last_score * (1.0 - top_frac) / remaining

    log_points = [(math.log10(f), s) for f, s in points]
    x = math.log10(max(top_frac, 1e-6))

    # Clamp above highest known point
    if x <= log_points[0][0]:
        return log_points[0][1]

    # Interpolate between surrounding points
    for i in range(len(log_points) - 1):
        x0, y0 = log_points[i]
        x1, y1 = log_points[i + 1]
        if x0 <= x <= x1:
            t = (x - x0) / (x1 - x0)
            return y0 + t * (y1 - y0)

    return log_points[-1][1]


def compute(total, points):
    """Compute rank thresholds from distribution data points."""
    print(f"Total ranked players: {total:,}")
    print(f"Data points: {len(points)}")
    for frac, score in points:
        pos = int(total * frac)
        print(f"  top {frac*100:6.2f}%  pos ~{pos:>8,}  score {score:>7.1f}")
    print()

    thresholds = {}
    for rank_id, top_start, top_end in BRACKETS:
        if rank_id == "IRON":
            thresholds[rank_id] = {"minScore": 1, "wingScore": max(1, int(interpolate(0.95, points)))}
            print(f"  {rank_id:15s}  min={1:5d}  wing={thresholds[rank_id]['wingScore']:5d}")
            continue

        min_score = max(1, int(interpolate(top_end, points)))

        # wingScore = score at midpoint of bracket
        mid_frac = (top_start + top_end) / 2
        wing_score = max(min_score, int(interpolate(mid_frac, points)))

        # Challenger is always winged
        if rank_id == "CHALLENGER":
            wing_score = min_score

        thresholds[rank_id] = {"minScore": min_score, "wingScore": wing_score}
        print(f"  {rank_id:15s}  min={min_score:5d}  wing={wing_score:5d}")

    return thresholds


def write_json(total, top100_score, thresholds):
    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)
    out = OUTPUT_DIR / "thresholds.json"

    payload = {
        "season": SEASON,
        "updated": datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ"),
        "totalPlayers": total,
        "top100Score": top100_score,
        "thresholds": thresholds,
    }

    tmp = out.with_suffix(".tmp")
    with open(tmp, "w") as f:
        json.dump(payload, f, indent=2)
        f.write("\n")
    tmp.rename(out)
    print(f"\nWritten to {out}")


def main():
    print(f"--- RaiderRanked threshold update ---")
    print(f"{datetime.now(timezone.utc).isoformat()}")
    print(f"Season: {SEASON} | Region: {REGION}\n")

    total, points = fetch_cutoffs()
    thresholds = compute(total, points)

    time.sleep(REQUEST_DELAY)
    top100_score = fetch_top100_score()
    print(f"\n  Top 100 score (pos {TOP_100_POSITION + 1}): {top100_score}")

    write_json(total, top100_score, thresholds)
    print("Done.")


if __name__ == "__main__":
    main()
