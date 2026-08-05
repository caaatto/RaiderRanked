# RaiderRanked

League of Legends-style ranked system for World of Warcraft, based on Mythic+ scores and PvP ratings.

Players receive a rank with rank-up animations, portrait wings, tooltip integration, and a draggable HUD frame. A score history graph tracks progression across all your characters. An optional PvP module adds ranked PvP support with animated electric auras around the player portrait.

## Installation

Download from [CurseForge](https://www.curseforge.com/wow/addons/raiderranked) or copy the `RaiderRanked/` folder into your `World of Warcraft/_retail_/Interface/AddOns/` directory.

## Commands

| Command | Description |
|---|---|
| `/rr` | Toggle rank frame |
| `/rr hide` | Hide rank frame |
| `/rr tooltip` | Toggle rank in tooltips |
| `/rr ranks` | Show current thresholds |
| `/rr set <RANK> <score>` | Override a threshold |
| `/rr reset` | Restore default thresholds |
| `/rr cutoff` | Show active region / faction |
| `/rr cutoff <region> <faction>` | Switch cutoff set (`eu\|us\|all`, `all\|horde\|alliance`) |
| `/rr history` | Toggle score history graph |
| `/rr history clear` | Clear all history data |
| `/rr classcolors` | Toggle class colours in the history graph |
| `/rr anim [from] to` | Preview rank-up animation |
| `/rr animpos` | Move the rank-up pop-up (right-click saves, Escape discards) |
| `/rr animpos reset` | Restore default pop-up position |
| `/rr wings <size>` | Resize portrait wings (20–600) |
| `/rr pvp` | Toggle PvP rank frame |
| `/rr pvpranks` | Show PvP rank thresholds |
| `/rr pvpaura test <rank>` | Preview a PvP aura (e.g. gladiator) |
| `/rr pvpaura stop` | Stop aura preview |
| `/rr pvpaura <size>` | Resize PvP aura (40–400) |
| `/rr test` | Run in-game test suite |

Diagnostics: `/rr debug` (raw score API output), `/rr groupdbg` (party categories and the resolved broadcast channel), `/rr pvpdebug` (PvP rating per bracket), `/rr wingsdbg` and `/rr unitdbg [unit]` (wing anchor and visibility).

## Settings

Everything below is reachable via ESC → Options → AddOns → RaiderRanked.

| Setting | Default | Description |
|---|---|---|
| Show rank frame | on | The draggable rank / score HUD |
| Show rank in tooltips | on | Rank and M+ score on unit tooltips |
| Show PvP rank frame | off | Second HUD frame with PvP rank and rating |
| Show PvP rank in tooltips | off | PvP rank and rating on unit tooltips |
| Show PvP aura on player portrait | off | Animated aura driven by PvP rating |
| Show wings on player portrait | on | Rank-coloured wings on your own portrait |
| Show wings on other players | on | Wings on target, focus, and party portraits |
| Unlock rank-up pop-up position | off | Drag handle for the rank-up pop-up |
| Class colours in score history | off | Colour history lines by class instead of the default palette |
| Show minimap button | on | RaiderRanked button on the minimap |
| Cutoff region / faction | Europe / All Factions | Which cutoff set drives the thresholds |

The rank frame itself is dragged directly; the small lock button appears on hover.

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

### Region and faction cutoffs

The M+ seasonal title is awarded by Blizzard at the top 0.1% **per faction per region**, so Horde and Alliance have different cutoffs within the same region. Cutoffs are therefore computed for all nine combinations:

| Region | Faction |
|---|---|
| `eu` — Europe | `all` — combined |
| `us` — North America | `horde` |
| `all` — population-weighted merge of US + EU | `alliance` |

The active combination is selected in the Settings panel (ESC → Options → AddOns → RaiderRanked) or via `/rr cutoff <region> <faction>`, and the rank frame shows it as a muted subtitle (for example `EU · Alliance`). Default is `eu / all`.

Switching sets migrates your thresholds: values that still match the previous defaults follow along, values you overrode with `/rr set` stay put.

## Score History

`/rr history` opens a graph of your M+ score over the season, with rank-coloured bands in the background. Data is stored account-wide, so alts appear alongside your main.

- **Ranges** — 3d, 7d, 14d, 30d, or the full season
- **Score** — raw score over time; solo as a filled area chart, multiple characters as one line each
- **Progress** — score gained minus how far the next rank's cutoff moved, so a shifting cutoff cannot masquerade as progress
- **Cutoffs** — the rank thresholds themselves over time
- **Characters** — a dropdown toggles which characters are drawn

Enable *Class colours in score history* (or `/rr classcolors`) to colour each character's line by its class. A character's class is only known once it has been logged into with the addon installed; anything unknown falls back to the default palette.

## Rank-Up Pop-Up

The promotion animation is a two-phase crossfade: the old rank's exit sheet plays on top while the new rank's entrance sheet fades in underneath, followed by a flash, the rank name, and a glow pulse. It is a non-blocking overlay — it captures neither mouse nor keyboard.

To reposition it, use `/rr animpos` or the *Unlock rank-up pop-up position* setting. A box appears where the pop-up will be drawn:

- **Left-drag** to move
- **Right-click** to save and close
- **Escape** to close and discard the change
- `/rr animpos reset` restores the default placement

Preview the result with `/rr anim challenger` (or any rank id).

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

Broadcasts pick their channel from the party category you are actually in: `INSTANCE_CHAT` inside instanced groups (scenarios, delves, LFR, battlegrounds), otherwise `RAID` or `PARTY`. `/rr groupdbg` prints the raw categories and the resolved channel, which is the quickest way to check this in a given zone.

## Threshold Auto-Update

A daily GitHub Actions workflow fetches the M+ score distribution from Raider.IO for each region × faction combo (EU / NA × Horde / Alliance / All, plus a synthetic population-weighted `all` region), computes percentile cutoffs, patches `Cutoffs.lua` (all nine region/faction slots), `RankSystem.lua` (seed thresholds and Top 100 cutoff) and `ScoreHistory.lua` (the `SEASON_START` anchor), and uploads the updated addon to CurseForge.

Both the active expansion and the active season are auto-detected from Raider.IO's `mythic-plus/static-data` endpoint on every run, so neither season rollovers (MN1 -> MN2) nor expansion rollovers (Midnight -> next) require a code change. The next scheduled run picks up the new slug, the patcher rewrites the constants from the new `seasonStart`, and CI ships an updated build. A `scripts/state.json` tracks last-known-good population, expansion, and season for a sanity guard that refuses to overwrite a healthy build with a half-empty Raider.IO snapshot, and as a fallback when static-data is unreachable. The script lives upstream in [caaatto/raiderranked-api](https://github.com/caaatto/raiderranked-api) and is mirrored byte-identical here.

### Versioning

`## Version` in `RaiderRanked.toc` is the single source of truth, and it is what the WoW AddOns list shows.

- **Feature release** — bump the minor by hand and commit: `1.11.4` → `1.12.0`
- **Automated release** — CI increments the last component from wherever that leaves it: `1.12.0` → `1.12.1` → `1.12.2`

Every release commits the bumped TOC, tags it `v<version>`, and uploads to CurseForge as `Raider Ranked <version>`, so the CurseForge file list, the git tags, and the in-game version all name the same build.

Threshold runs that find no changes upload nothing. To ship a build that only changed code, trigger the workflow manually from the Actions tab with **force_release** enabled.

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

### Client compatibility

`## Interface` in `RaiderRanked.toc` lists every client build the addon is flagged compatible with. When a patch lands, append the new number (12.0.7 → `120007`) — a stale list only shows the addon as out of date, it does not break it. The TOC is read at client start, so the flag clears on a full restart rather than a `/reload`.
