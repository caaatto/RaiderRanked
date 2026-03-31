# RaiderRanked

League of Legends-style ranked system for World of Warcraft, based on Mythic+ scores and PvP ratings.

Players receive a rank with rank-up animations, portrait wings, tooltip integration, and a draggable HUD frame. An optional PvP module adds ranked PvP support with animated electric auras around the player portrait.

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
| `/rr wings <size>` | Resize portrait wings (20–600) |
| `/rr pvp` | Toggle PvP rank frame |
| `/rr pvpranks` | Show PvP rank thresholds |
| `/rr pvpaura test <rank>` | Preview a PvP aura (e.g. gladiator) |
| `/rr pvpaura stop` | Stop aura preview |
| `/rr pvpaura <size>` | Resize PvP aura (40–400) |
| `/rr pvpdebug` | Dump PvP ratings per bracket |
| `/rr test` | Run in-game test suite |

## M+ Rank Brackets

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

## PvP Rank Brackets

Based on the highest current rating across all rated PvP brackets (2v2, 3v3, Solo Shuffle, Blitz BG, RBG). All PvP features are opt-in via the Settings panel.

| Rank | Rating |
|---|---|
| Gladiator | 2400+ |
| Elite | 2100+ |
| Duelist | 1800+ |
| Rival | 1600+ |
| Challenger | 1400+ |
| Combatant | 1000+ |

PvP ratings for other players are acquired via addon messaging (instant, players with the addon share ratings automatically) with inspect as fallback.

## Threshold Auto-Update

A daily GitHub Actions workflow fetches the M+ score distribution from Raider.IO, computes percentile cutoffs, patches `RankSystem.lua`, and uploads the updated addon to CurseForge.

### Setup (for maintainers)

1. Get a [CurseForge API token](https://legacy.curseforge.com/account/api-tokens)
2. Set these in the repo settings:
   - **Secret** `CF_API_TOKEN` — your CurseForge API token
   - **Variable** `CF_PROJECT_ID` — your CurseForge project ID
   - **Variable** `CF_GAME_VERSIONS` — comma-separated game version IDs (e.g. `11567,11565`)
3. The workflow runs daily at 00:00 UTC, or trigger manually from the Actions tab

Game version IDs can be found via:
```bash
curl -H "X-Api-Token: YOUR_TOKEN" https://wow.curseforge.com/api/game/versions
```
