#!/usr/bin/env python3
"""
Patch RankSystem.lua minScore/wingScore/TOP_100_SCORE values and
ScoreHistory.lua SEASON_START constant from thresholds.json.

Preserves comments and formatting. Skips wingScore = nil (UNRANKED).
ScoreHistory.lua is located as a sibling of RankSystem.lua.
"""

import json
import re
import sys
from datetime import datetime
from pathlib import Path


MONTH_NAMES = [
    "January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December",
]


def patch_rank_system(lua_path, thresholds, top100_score):
    """Update minScore/wingScore for each rank and TOP_100_SCORE."""
    with open(lua_path) as f:
        lines = f.readlines()

    current_rank = None
    for i, line in enumerate(lines):
        if top100_score is not None:
            m = re.match(r'(RR\.TOP_100_SCORE\s*=\s*)\d+(.*)', line)
            if m:
                lines[i] = f'{m.group(1)}{top100_score}{m.group(2)}\n'

        m = re.match(r'\s*id\s*=\s*"(\w+)"', line)
        if m:
            current_rank = m.group(1)
            continue

        if current_rank and current_rank in thresholds:
            vals = thresholds[current_rank]

            m = re.match(r'(\s*minScore\s*=\s*)\d+(.*)', line)
            if m:
                lines[i] = f'{m.group(1)}{vals["minScore"]}{m.group(2)}\n'

            m = re.match(r'(\s*wingScore\s*=\s*)\d+(.*)', line)
            if m:
                lines[i] = f'{m.group(1)}{vals["wingScore"]}{m.group(2)}\n'

        if re.match(r'\s*\},?\s*$', line):
            current_rank = None

    with open(lua_path, "w") as f:
        f.writelines(lines)
    print(f"Patched {lua_path}")


def patch_score_history(lua_path, season_meta):
    """Update SEASON_START constant (and the comment line above it) from
    the season metadata in thresholds.json. No-op if seasonStart is
    missing, so the old hard-coded value stays rather than risking a bad
    anchor.
    """
    starts_iso = season_meta.get("seasonStart")
    if not starts_iso:
        print(f"WARN: thresholds.json has no seasonStart, skipping {lua_path}")
        return

    try:
        dt = datetime.strptime(starts_iso, "%Y-%m-%dT%H:%M:%SZ")
    except ValueError as e:
        print(f"WARN: cannot parse seasonStart {starts_iso!r}: {e}", file=sys.stderr)
        return

    season_name = season_meta.get("seasonName") or season_meta.get("season", "Season")
    region = (season_meta.get("region") or "eu").upper()

    new_comment = (
        f"-- {season_name} start: {dt.day} {MONTH_NAMES[dt.month - 1]} {dt.year}, "
        f"{dt.hour:02d}:{dt.minute:02d} UTC ({region} reset).\n"
    )
    new_const = (
        f"local SEASON_START = time({{ year = {dt.year}, month = {dt.month}, "
        f"day = {dt.day}, hour = {dt.hour}, min = {dt.minute}, sec = 0 }})\n"
    )

    with open(lua_path) as f:
        lines = f.readlines()

    patched = False
    for i, line in enumerate(lines):
        if re.match(r'\s*local\s+SEASON_START\s*=\s*time\s*\(', line):
            lines[i] = new_const
            # Replace the season-start comment if it sits directly above.
            if i > 0 and re.match(r'\s*--\s*\S+.*Season.*start', lines[i - 1]):
                lines[i - 1] = new_comment
            patched = True
            break

    if not patched:
        print(f"WARN: SEASON_START line not found in {lua_path}", file=sys.stderr)
        return

    with open(lua_path, "w") as f:
        f.writelines(lines)
    print(f"Patched {lua_path}")


def main():
    if len(sys.argv) != 3:
        print(f"Usage: {sys.argv[0]} <RankSystem.lua> <thresholds.json>")
        sys.exit(1)

    rank_system_path = Path(sys.argv[1])
    thresholds_path = Path(sys.argv[2])

    with open(thresholds_path) as f:
        data = json.load(f)

    patch_rank_system(
        rank_system_path,
        data["thresholds"],
        data.get("top100Score"),
    )

    score_history_path = rank_system_path.parent / "ScoreHistory.lua"
    if score_history_path.exists():
        season_meta = {
            "season": data.get("season"),
            "seasonName": data.get("seasonName"),
            "seasonStart": data.get("seasonStart"),
            "region": data.get("region"),
        }
        patch_score_history(score_history_path, season_meta)
    else:
        print(f"WARN: {score_history_path} not found, skipping season-start patch")


if __name__ == "__main__":
    main()
