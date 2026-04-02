#!/usr/bin/env python3
"""
Patch RankSystem.lua minScore and wingScore values from thresholds.json.
Preserves comments and formatting. Skips wingScore = nil (UNRANKED).
"""

import json
import re
import sys


def patch(lua_path, thresholds_path):
    with open(thresholds_path) as f:
        data = json.load(f)
    thresholds = data["thresholds"]
    top100_score = data.get("top100Score")

    with open(lua_path) as f:
        lines = f.readlines()

    current_rank = None
    for i, line in enumerate(lines):
        # Patch TOP_100_SCORE
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


if __name__ == "__main__":
    if len(sys.argv) != 3:
        print(f"Usage: {sys.argv[0]} <RankSystem.lua> <thresholds.json>")
        sys.exit(1)
    patch(sys.argv[1], sys.argv[2])
    print(f"Patched {sys.argv[1]}")
