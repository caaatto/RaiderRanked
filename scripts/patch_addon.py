#!/usr/bin/env python3
"""
Patch RaiderRanked Lua files from thresholds.json.

Targets:
  - RaiderRanked/Cutoffs.lua     (new - 9 region/faction blocks)
  - RaiderRanked/RankSystem.lua  (seed fallback - mirrors primary region/all)
  - RaiderRanked/ScoreHistory.lua (SEASON_START / SEASON_NAME constants)

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


# --- Season-start floor ---------------------------------------------------
#
# Percentile cutoffs are meaningless in the first days of a season: the field
# is tiny and made of the keenest players, so the computed numbers are both
# very low and very volatile. Worse, they climb fast afterwards, so a player
# who grinds can lose rank while gaining score.
#
# These values are a floor, not a starting point. A computed cutoff is used
# only once it rises above the floor, so the ladder never sags and each rank
# converts to a true percentile on its own, without a switchover cliff.
#
# Derived from Midnight Season 1 dungeon scoring: 155 for a timed +2, +15 per
# keystone level, +15 again at the affix breakpoints 5, 7, 10 and 12, over a
# pool of 8 dungeons. The upper half is "every dungeon at level N", the lower
# half is "this many dungeons cleared at all", which is how the first evening
# actually goes.
#
#   Challenger   2560   all 8 at +10        Platinum   1480   all 8 at +4
#   Grandmaster  2320   all 8 at +9         Gold       1240   all 8 at +2
#   Master       2200   all 8 at +8         Silver      620   about 4 at +2
#   Diamond      2080   all 8 at +7         Bronze      310   about 2 at +2
#   Emerald      1840   all 8 at +6         Iron          1   the first key
#
# wingScore is the midpoint to the next rank up, matching how the addon marks
# the upper half of a bracket with "+".
SEASON_FLOOR = {
    "CHALLENGER":  {"minScore": 2560, "wingScore": 2560},
    "GRANDMASTER": {"minScore": 2320, "wingScore": 2440},
    "MASTER":      {"minScore": 2200, "wingScore": 2260},
    "DIAMOND":     {"minScore": 2080, "wingScore": 2140},
    "EMERALD":     {"minScore": 1840, "wingScore": 1960},
    "PLATINUM":    {"minScore": 1480, "wingScore": 1660},
    "GOLD":        {"minScore": 1240, "wingScore": 1360},
    "SILVER":      {"minScore":  620, "wingScore":  930},
    "BRONZE":      {"minScore":  310, "wingScore":  465},
    "IRON":        {"minScore":    1, "wingScore":  155},
}

# One key level above Challenger, so the Top 100 aura stays a step beyond the
# top rank rather than arriving with it.
TOP100_FLOOR = 2680


def apply_floor(thresholds):
    """Raise each threshold to the season-start floor where it sits below it.

    Every floored rank is emitted, including ones the payload did not contain:
    a season Raider.IO has declared but holds no data for yields nothing at
    all, and that is exactly the day the floor has to be written. During a
    running season the computed values are far above the floor, so max() keeps
    them and this is inert.
    """
    thresholds = thresholds or {}
    out = dict(thresholds)
    for rank_id, floor in SEASON_FLOOR.items():
        vals = thresholds.get(rank_id) or {}
        out[rank_id] = {
            "minScore":  max(vals.get("minScore", 0),  floor["minScore"]),
            "wingScore": max(vals.get("wingScore", 0), floor["wingScore"]),
        }
    return out


# Rank order can never invert, because max() is monotone and both the computed
# values and the floor are ordered the same way. That only holds while the
# floor table itself stays ordered, so it is checked rather than assumed: a
# later edit that put one rank out of sequence would otherwise produce a ladder
# where a lower rank demands more score than the one above it.
_FLOOR_ORDER = ["IRON", "BRONZE", "SILVER", "GOLD", "PLATINUM",
                "EMERALD", "DIAMOND", "MASTER", "GRANDMASTER", "CHALLENGER"]
for _lower, _higher in zip(_FLOOR_ORDER, _FLOOR_ORDER[1:]):
    if SEASON_FLOOR[_lower]["minScore"] >= SEASON_FLOOR[_higher]["minScore"]:
        raise SystemExit(
            f"SEASON_FLOOR out of order: {_lower} "
            f"({SEASON_FLOOR[_lower]['minScore']}) must sit below {_higher} "
            f"({SEASON_FLOOR[_higher]['minScore']})"
        )
if TOP100_FLOOR <= SEASON_FLOOR["CHALLENGER"]["minScore"]:
    raise SystemExit("TOP100_FLOOR must sit above the Challenger floor")


def apply_top100_floor(value):
    """Same idea for the Top 100 cutoff, which drives the special aura."""
    try:
        return max(int(value or 0), TOP100_FLOOR)
    except (TypeError, ValueError):
        return TOP100_FLOOR


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

        # Only a positive value may be written. A season that Raider.IO has
        # switched to before it holds any ranking data yields top100Score = 0,
        # and RR:IsTop100 compares with >=, so a zero would hand the Top 100
        # aura to every player including those with no score at all.
        if top100:
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


PREV_BLOCK_RE = re.compile(r'^RR\.PREV_CUTOFFS = \{.*?^\}\n', re.S | re.M)
PREV_NAME_RE = re.compile(r'^RR\.PREV_SEASON_NAME = ".*?"\n', re.M)
SEASON_NAME_RE = re.compile(r'^\s*local\s+SEASON_NAME\s*=\s*"(.*?)"', re.M)


def read_current_season_name(score_history_path):
    """The season the addon currently believes it is in, read before the
    patcher overwrites it. A mismatch against the incoming name is what tells
    us a rollover is happening.
    """
    try:
        with open(score_history_path, encoding="utf-8") as f:
            m = SEASON_NAME_RE.search(f.read())
    except OSError:
        return None
    return m.group(1) if m else None


def rotate_previous_cutoffs(cutoffs_path, closing_season_name):
    """Copy the cutoffs that are about to be replaced into RR.PREV_CUTOFFS.

    Called only when the season changes, which is the one moment those values
    still exist. Afterwards they are gone, and a player who installs during the
    new season would have no way to rank a result from the old one.
    """
    with open(cutoffs_path, encoding="utf-8") as f:
        text = f.read()

    sets = {}
    for m in re.finditer(r'RR\.CUTOFFS\.(\w+)\.(\w+) = \{(.*?)\n\}', text, re.S):
        region, faction, body = m.groups()
        sets[(region, faction)] = re.findall(
            r'(\w+)\s*=\s*\{ minScore =\s*(\d+),\s*wingScore =\s*(\d+) \}', body)

    if not sets:
        print("WARN: no cutoff blocks found, leaving PREV_CUTOFFS alone", file=sys.stderr)
        return

    lines = ["RR.PREV_CUTOFFS = {"]
    for region in ("eu", "us", "all"):
        lines.append(f"    {region} = {{")
        for faction in ("all", "horde", "alliance"):
            ranks = sets.get((region, faction))
            if not ranks:
                print(f"WARN: {region}.{faction} missing, PREV_CUTOFFS not rotated",
                      file=sys.stderr)
                return
            lines.append(f"        {faction} = {{")
            for rank_id, min_score, wing_score in ranks:
                lines.append(
                    f"            {rank_id:<12} = "
                    f"{{ minScore = {min_score:>5}, wingScore = {wing_score:>5} }},")
            lines.append("        },")
        lines.append("    },")
    lines.append("}")
    block = "\n".join(lines) + "\n"

    if not PREV_BLOCK_RE.search(text):
        print("WARN: RR.PREV_CUTOFFS block not found, skipping rotation", file=sys.stderr)
        return

    text = PREV_BLOCK_RE.sub(lambda _: block, text, count=1)
    safe_name = (closing_season_name or "Season").replace("\\", "\\\\").replace('"', '\\"')
    text = PREV_NAME_RE.sub(f'RR.PREV_SEASON_NAME = "{safe_name}"\n', text, count=1)

    with open(cutoffs_path, "w", encoding="utf-8") as f:
        f.write(text)
    print(f"Rotated PREV_CUTOFFS to the closing values of {closing_season_name!r}")


def patch_cutoffs(lua_path, cutoffs):
    """Walk Cutoffs.lua and patch every RR.CUTOFFS.<region>.<faction>
    block whose (region, faction) is present in cutoffs.
    """
    with open(lua_path, encoding="utf-8") as f:
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
                    apply_floor(region_data["thresholds"]),
                    apply_top100_floor(region_data.get("top100Score")),
                )
                patched_sections.append(f"{region}.{faction}")
                i = end + 1
                continue
        i += 1

    with open(lua_path, "w", encoding="utf-8") as f:
        f.writelines(lines)
    print(f"Patched {lua_path}: {', '.join(patched_sections) or '(no sections matched)'}")


def patch_rank_system(lua_path, thresholds, top100_score):
    """Legacy multi-line rank block patcher for RankSystem.lua seed values."""
    with open(lua_path, encoding="utf-8") as f:
        lines = f.readlines()

    current_rank = None
    for i, line in enumerate(lines):
        # Positive only, for the same reason as in _patch_rank_block.
        if top100_score:
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

    with open(lua_path, "w", encoding="utf-8") as f:
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
    # Display label for the season archive. Escaped defensively - the name
    # comes straight from Raider.IO and lands inside a Lua string literal.
    lua_name = season_name.replace("\\", "\\\\").replace('"', '\\"')
    new_name = f'local SEASON_NAME = "{lua_name}"\n'

    with open(lua_path, encoding="utf-8") as f:
        lines = f.readlines()

    patched = False
    for i, line in enumerate(lines):
        if re.match(r'\s*local\s+SEASON_START\s*=\s*time\s*\(', line):
            lines[i] = new_const
            if i > 0 and re.match(r'\s*--\s*\S+.*Season.*start', lines[i - 1]):
                lines[i - 1] = new_comment
            patched = True
            break

    # Separate pass: SEASON_NAME sits a few comment lines below SEASON_START,
    # and a missing one must not invalidate the SEASON_START patch.
    for i, line in enumerate(lines):
        if re.match(r'\s*local\s+SEASON_NAME\s*=\s*"', line):
            lines[i] = new_name
            break
    else:
        print(f"WARN: SEASON_NAME line not found in {lua_path}", file=sys.stderr)

    if not patched:
        print(f"WARN: SEASON_START line not found in {lua_path}", file=sys.stderr)
        return

    with open(lua_path, "w", encoding="utf-8") as f:
        f.writelines(lines)
    print(f"Patched {lua_path}")


def main():
    if len(sys.argv) != 3:
        print(f"Usage: {sys.argv[0]} <RankSystem.lua> <thresholds.json>")
        sys.exit(1)

    rank_system_path = Path(sys.argv[1])
    thresholds_path = Path(sys.argv[2])

    with open(thresholds_path, encoding="utf-8") as f:
        data = json.load(f)

    addon_dir = rank_system_path.parent

    score_history_path = addon_dir / "ScoreHistory.lua"
    cutoffs_path = addon_dir / "Cutoffs.lua"

    # 0. Season rollover. Detected by comparing the name the addon currently
    #    carries against the incoming one, and handled before anything is
    #    overwritten: the cutoffs about to be replaced are the closing values
    #    of the season that just ended, and this is the only moment they exist.
    incoming_season = data.get("seasonName") or data.get("season")
    current_season = read_current_season_name(score_history_path)
    if incoming_season and current_season and incoming_season != current_season:
        print(f"Season rollover: {current_season!r} -> {incoming_season!r}")
        if cutoffs_path.exists():
            rotate_previous_cutoffs(cutoffs_path, current_season)

    # 1. Cutoffs.lua - the multi-region / multi-faction data table.
    if cutoffs_path.exists() and data.get("cutoffs"):
        patch_cutoffs(cutoffs_path, data["cutoffs"])
    else:
        print(f"WARN: {cutoffs_path} or data.cutoffs missing - skipping multi-region patch")

    # 2. RankSystem.lua - keep seed values in sync with primary region/all
    # so first-frame fallback stays reasonably fresh.
    patch_rank_system(
        rank_system_path,
        apply_floor(data["thresholds"]),
        apply_top100_floor(data.get("top100Score")),
    )

    # 3. ScoreHistory.lua - SEASON_START constant.
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
