# RaiderRanked

League of Legends-style ranked system for World of Warcraft, based on Mythic+ scores.

Players receive a rank (Iron through Challenger) with rank-up animations, portrait wings, tooltip integration, and a draggable HUD frame.

## Installation

Download from [CurseForge](https://www.curseforge.com/wow/addons/raiderranked) or copy the `RaiderRanked/` folder into your `World of Warcraft/_retail_/Interface/AddOns/` directory.

## Commands

| Command | Description |
|---|---|
| `/rr` | Toggle rank frame |
| `/rr tooltip` | Toggle rank in tooltips |
| `/rr ranks` | Show current thresholds |
| `/rr set <RANK> <score>` | Override a threshold |
| `/rr reset` | Restore default thresholds |
| `/rr anim [from] to` | Preview rank-up animation |
| `/rr wings <size>` | Resize portrait wings |

## Rank Brackets

Thresholds are based on the current season's score distribution and updated daily via GitHub Actions.

| Rank | Percentile |
|---|---|
| Challenger | Top 0.1% |
| Grandmaster | 99.7 - 99.9% |
| Master | 99 - 99.7% |
| Diamond | 96 - 99% |
| Emerald | 92 - 96% |
| Platinum | 80 - 92% |
| Gold | 60 - 80% |
| Silver | 30 - 60% |
| Bronze | 10 - 30% |
| Iron | 0 - 10% |

## Threshold Auto-Update

A daily GitHub Actions workflow fetches the M+ score distribution from Raider.IO, computes percentile cutoffs, patches `RankSystem.lua`, and uploads the updated addon to CurseForge.

### Setup (for maintainers)

1. Get a [CurseForge API token](https://authors.curseforge.com/account/api-tokens)
2. Set these in the repo settings:
   - **Secret** `CF_API_TOKEN` — your CurseForge API token
   - **Variable** `CF_PROJECT_ID` — your CurseForge project ID
   - **Variable** `CF_GAME_VERSIONS` — comma-separated game version IDs (e.g. `11567,11565`)
3. The workflow runs daily at 00:00 UTC, or trigger manually from the Actions tab

Game version IDs can be found via:
```bash
curl -H "X-Api-Token: YOUR_TOKEN" https://wow.curseforge.com/api/game/versions
```
