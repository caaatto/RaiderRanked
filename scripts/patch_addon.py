#!/usr/bin/env python3
"""
Patch RaiderRanked Lua files from thresholds.json.

Targets:
  - RaiderRanked/Cutoffs.lua     (new — 9 region/faction blocks)
  - RaiderRanked/RankSystem.lua  (seed fallback — mirrors primary region/all)
  - RaiderRanked/ScoreHistory.lua (SEASON_START constant)

Preserves comments, whitespace, and line-by-line formatting. Skips
wingScore = nil (UNRANKED). Cutoffs.lua sections are identified by
their RR.CUTOFFS.<region>.<faction> = { header; each block is patched
in isolation until its terminating `}` line.
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

CUTOFFS_HEADER_RE = re.compile(r'^RR\.CUTOFFS\.(\w+)\.(\w+)\s*=\s*\{')


def _patch_rank_block(lines, start_idx, thresholds, top100):
    """Patch minScore/wingScore/top100Score inside a Lua block starting
    at start_idx (the `{` line). Walks forward until a line matching
    `^}` is found, then returns that index. Lines outside [start, end]
    are untouched.
    """
    i = start_idx + 1
    current_rank = None
    while i < len(lines):
        line = lines[i]
        if re.match(r'^\}\s*$', line):
            return i

        if top100 is not None:
            m = re.match(r'(\s*top100Score\s*=\s*)\d+(.*)', line)
            if m:
                lines[i] = f'{m.group(1)}{top100}{m.group(2)}\n'
                i += 1
                continue

        # Compact form: CHALLENGER = { minScore = N, wingScore = M },
        m = re.match(
            r'(\s*)(\w+)(\s*=\s*\{\s*minScore\s*=\s*)\d+(\s*,\s*wingScore\s*=\s*)\d+(\s*\}.*)',
            line,
        )
        if m:
            rank_id = m.group(2)
            vals = thresholds.get(rank_id)
            if vals:
                lines[i] = (
                    f'{m.group(1)}{rank_id}{m.group(3)}{vals["minScore"]}'
                    f'{m.group(4)}{vals["wingScore"]}{m.group(5)}\n'
                )
            i += 1
            continue

        # Fallback: multi-line rank block (RankSystem.lua style).
        m = re.match(r'\s*id\s*=\s*"(\w+)"', line)
        if m:
            current_rank = m.group(1)
        elif current_rank and current_rank in thresholds:
            vals = thresholds[current_rank]
            mm = re.match(r'(\s*minScore\s*=\s*)\d+(.*)', line)
            if mm:
                lines[i] = f'{mm.group(1)}{vals["minScore"]}{mm.group(2)}\n'
            else:
                mm = re.match(r'(\s*wingScore\s*=\s*)\d+(.*)', line)
                if mm:
                    lines[i] = f'{mm.group(1)}{vals["wingScore"]}{mm.group(2)}\n'
            if re.match(r'\s*\},?\s*$', line):
                current_rank = None
        i += 1

    return len(lines) - 1


def patch_cutoffs(lua_path, cutoffs):
    """Walk Cutoffs.lua and patch every RR.CUTOFFS.<region>.<faction>
    block whose (region, faction) is present in cutoffs.
    """
    with open(lua_path) as f:
        lines = f.readlines()

    i = 0
    patched_sections = []
    while i < len(lines):
        m = CUTOFFS_HEADER_RE.match(lines[i])
        if m:
            region, faction = m.group(1), m.group(2)
            region_data = cutoffs.get(region, {}).get(faction)
            if region_data:
                end = _patch_rank_block(
                    lines, i,
                    region_data["thresholds"],
                    region_data.get("top100Score"),
                )
                patched_sections.append(f"{region}.{faction}")
                i = end + 1
                continue
        i += 1

    with open(lua_path, "w") as f:
        f.writelines(lines)
    print(f"Patched {lua_path}: {', '.join(patched_sections) or '(no sections matched)'}")


def patch_rank_system(lua_path, thresholds, top100_score):
    """Legacy multi-line rank block patcher for RankSystem.lua seed values."""
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

    addon_dir = rank_system_path.parent

    # 1. Cutoffs.lua — the multi-region / multi-faction data table.
    cutoffs_path = addon_dir / "Cutoffs.lua"
    if cutoffs_path.exists() and data.get("cutoffs"):
        patch_cutoffs(cutoffs_path, data["cutoffs"])
    else:
        print(f"WARN: {cutoffs_path} or data.cutoffs missing — skipping multi-region patch")

    # 2. RankSystem.lua — keep seed values in sync with primary region/all
    # so first-frame fallback stays reasonably fresh.
    patch_rank_system(
        rank_system_path,
        data["thresholds"],
        data.get("top100Score"),
    )

    # 3. ScoreHistory.lua — SEASON_START constant.
    score_history_path = addon_dir / "ScoreHistory.lua"
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
