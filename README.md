# RaiderRanked

League of Legends-style ranked system for World of Warcraft, based on Mythic+ scores and PvP ratings.

Players receive a rank with rank-up animations, portrait wings, tooltip integration, and a draggable HUD frame. A score history graph tracks progression across all your characters. An optional PvP module adds ranked PvP support with animated electric auras around the player portrait.

## Installation

Download from [CurseForge](https://www.curseforge.com/wow/addons/raiderranked) or copy the `RaiderRanked/` folder into your `World of Warcraft/_retail_/Interface/AddOns/` directory.

## Commands

| Command | Description |
|---|---|
| `/rr` | Toggle rank frame |
| `/rr tooltip` | Toggle rank in tooltips |
| `/rr ranks` | Show current thresholds |
| `/rr ladder` | Open on the Rank Ladder tab |
| `/rr seasons` | Open on the Seasons tab |
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
| `/rr wings <size>` | Resize portrait wings (20-600) |
| `/rr pvp` | Toggle PvP rank frame |
| `/rr pvpranks` | Show PvP rank thresholds |
| `/rr pvpaura test <rank\|pve>` | Preview a PvP aura, or the PvE Top 100 aura |
| `/rr pvpaura stop` | Stop aura preview |
| `/rr pvpaura <size>` | Resize PvP aura (40-400) |
| `/rr test` | Run in-game test suite |

Diagnostics are listed separately under `/rr dev`, so the main help stays about the addon rather than about debugging it: `/rr debug` (raw score API output), `/rr groupdbg` (party categories and the resolved broadcast channel), `/rr pvpdebug` (PvP rating per bracket), `/rr wings debug [unit]` (wing anchor, draw order and scale) and `/rr wings test [unit]` (force wings onto a unit to check placement).

## Settings

Everything below is reachable via ESC → Options → AddOns → RaiderRanked.

| Setting | Default | Description |
|---|---|---|
| Show rank frame | on | The draggable rank / score HUD |
| Show rank in tooltips | on | Rank and M+ score on unit tooltips |
| Show last season's rank in tooltips | on | Adds what the player finished last season on |
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

### Season start

Percentile cutoffs mean nothing in the first days of a season. The field is
tiny and made of the keenest players, so the computed numbers come out very low
and move fast, and a player who grinds can lose rank while gaining score.

The ladder therefore has a floor for the opening days, derived from dungeon
scoring rather than from a distribution:

| Rank | Score | Equivalent |
|---|---|---|
| Challenger | 2560 | every dungeon at +10 |
| Grandmaster | 2320 | every dungeon at +9 |
| Master | 2200 | every dungeon at +8 |
| Diamond | 2080 | every dungeon at +7 |
| Emerald | 1840 | every dungeon at +6 |
| Platinum | 1480 | every dungeon at +4 |
| Gold | 1240 | every dungeon at +2 |
| Silver | 620 | about four dungeons |
| Bronze | 310 | about two dungeons |
| Iron | 1 | the first key |

The upper half is "every dungeon at level N", the lower half is "this many
dungeons cleared at all", which is how the first evening of a season actually
goes.

These are a floor, not a starting point. A computed cutoff is used as soon as
it rises above the floor, so the ladder never sags and each rank converts to a
true percentile on its own. There is no switchover: by the time a rank leaves
the floor, the real distribution has already caught up with it.

### Rank Ladder

The **Rank Ladder** tab shows the whole ladder at once instead of only the next step up: every rank with its emblem, its percentile band, and the score it starts at, with your current rank highlighted and the gap to the next one at the bottom together with the Top 100 cutoff. The thresholds shown are the ones actually in effect, so it follows your region / faction selection and any `/rr set` override.

Reachable via `/rr ladder`, the tab strip, or **Shift-left-click** on the rank frame.

### Region and faction cutoffs

The M+ seasonal title is awarded by Blizzard at the top 0.1% **per faction per region**, so Horde and Alliance have different cutoffs within the same region. Cutoffs are therefore computed for all nine combinations:

| Region | Faction |
|---|---|
| `eu` - Europe | `all` - combined |
| `us` - North America | `horde` |
| `all` - population-weighted merge of US + EU | `alliance` |

The active combination is selected in the Settings panel (ESC → Options → AddOns → RaiderRanked) or via `/rr cutoff <region> <faction>`, and the rank frame shows it as a muted subtitle (for example `EU / Alliance`). Default is `eu / all`.

Switching sets migrates your thresholds: values that still match the previous defaults follow along, values you overrode with `/rr set` stay put.

## Score History

`/rr history` (or right-click on the minimap button) opens a window with three tabs - **Score History**, **Rank Ladder** and **Seasons**. It reopens on whichever tab you used last, and Escape closes it.

The Score History tab graphs your M+ score over the season, with rank-coloured bands in the background. Data is stored account-wide, so alts appear alongside your main.

- **Ranges** - 3d, 7d, 14d, 30d, or the full season
- **Score** - raw score over time; solo as a filled area chart, multiple characters as one line each
- **Progress** - score gained minus how far the next rank's cutoff moved, so a shifting cutoff cannot masquerade as progress
- **Cutoffs** - the rank thresholds themselves over time
- **Characters** - a dropdown toggles which characters are drawn
- **Season** - a dropdown on the right picks which season to draw; it appears
  once a season has been archived

A score of 0 means "no runs this season", not a result, so it is never plotted
as one. Without that, every character would drop to the floor the moment a
season ends. Each season's curve still starts at zero from its own start date.

Enable *Class colours in score history* (or `/rr classcolors`) to colour each character's line by its class. A character's class is only known once it has been logged into with the addon installed; anything unknown falls back to the default palette.

## Season Archive

The **Seasons** tab lists where each of your characters finished, per season, newest first. The running season is the first block and updates live; the finished ones below it are frozen records.

Each row is the closing result: the score you ended on and the rank it was worth against the cutoffs in force at that point. Clicking a character unfolds the peak, which is usually a different day and often a different rank:

```
best score 3420 on 29 Apr 2026
best rank Master, top 0.98% on 15 Apr 2026
```

Those two lines differ because cutoffs climb all season. A score set in April can outrank a higher score set in August, so the best score and the best rank are tracked separately, each against the cutoffs that were live at the time.

Two dropdowns at the top pick a region and faction to measure against. They start on your own setting. Where a result was recorded on that ladder, its real figure is shown; otherwise the line says what the score would be worth there, either today or at that season's close.

The percentile is interpolated: each rank owns a fixed percentile band, and where the score sat between that rank's cutoff and the next one maps onto where it sat inside the band. It is an approximation, but it comes from the same cutoffs the rank does, so the two can never contradict each other. Challenger always reads as the top 0.1%, since nothing finer can be resolved inside the top band.

When the daily threshold job moves the season forward, the addon notices at the next login and condenses the finished season into that archive - best score, closing score, and the rank each of those was worth **under that season's own cutoffs**, so a record does not silently change meaning when next season's thresholds land.

The season's graph points move into the archive at the same time, downsampled to keep the saved variables bounded. They are not discarded: the Season dropdown in the Score History tab draws any archived season exactly as it drew the live one.

The best score is tracked continuously rather than read back out of the graph data, so it survives the 500-point-per-character history cap even on a long season. Characters you never logged into with the addon installed have nothing to archive and simply do not appear.

## Last Season on Tooltips

The first weeks of a season are the ones where a rank says the least: everyone
sits at zero or close to it. Unit tooltips therefore carry a second line while
that lasts, showing what the player finished the previous season on.

```
RaiderRanked: Grandmaster
Last season: Master (3180)
```

Three sources feed it, in that order:

1. **Your own archive** for your own characters, which is exact.
2. **RaiderIO**, if the player has it installed and has seen that character.
   This is what makes the line work for strangers.
3. **The group channel**, as a fallback among people running RaiderRanked, over
   the same addon-message mechanism the live rank already uses.

The score is turned into a rank with the previous season's own cutoffs, not the
current ones, so the line means what it meant back then.

The RaiderIO lookup adapts on its own to when RaiderIO rolls over, which lags
the in-game reset by days. Until it does, its "current" score still holds last
season's figure and the addon reads it from there; once it switches, the same
value arrives in its previous-season field and is read from there instead. No
update is needed on either day.

Which of the two it is gets decided on your own character, where both numbers
are known: if what RaiderIO reports as your current score is the score you
closed last season on, their snapshot has not moved yet; if it is what you are
scoring right now, it has. That stays true no matter what you score in the new
season, so the line survives the opening day rather than disappearing with your
first timed key.

Someone who did not play last season at all has neither number to compare, and
would otherwise have to guess on everyone else's behalf. For them the shipped
data answers it: the season the addon calls current and the season whose closing
cutoffs it carries are written by the same daily job, so while those two names
agree, that job has not seen the rollover and neither has RaiderIO. `/rr dev`
shows both names next to the verdict.

The addon's own copy of the closing cutoffs is rotated by the threshold job at
the moment the season turns over, which is the only point at which those values
still exist.

Only max-level characters can be meaningfully unranked, so lower-level units
get no rank line at all rather than a misleading one.

## Rank-Up Pop-Up

The promotion animation is a two-phase crossfade: the old rank's exit sheet plays on top while the new rank's entrance sheet fades in underneath, followed by a flash, the rank name, and a glow pulse. It is a non-blocking overlay - it captures neither mouse nor keyboard.

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

A daily GitHub Actions workflow fetches the M+ score distribution from Raider.IO for each region × faction combo (EU / NA × Horde / Alliance / All, plus a synthetic population-weighted `all` region), computes percentile cutoffs, patches `Cutoffs.lua` (all nine region/faction slots), `RankSystem.lua` (seed thresholds and Top 100 cutoff) and `ScoreHistory.lua` (the `SEASON_START` anchor and the `SEASON_NAME` label the archive files a finished season under), and uploads the updated addon to CurseForge.

Both the active expansion and the active season are auto-detected from Raider.IO's `mythic-plus/static-data` endpoint on every run, so neither season rollovers (MN1 -> MN2) nor expansion rollovers (Midnight -> next) require a code change. The next scheduled run picks up the new slug, the patcher rewrites the constants from the new `seasonStart`, and CI ships an updated build. A `scripts/state.json` tracks last-known-good population, expansion, and season for a sanity guard that refuses to overwrite a healthy build with a half-empty Raider.IO snapshot, and as a fallback when static-data is unreachable. The script lives upstream in [caaatto/raiderranked-api](https://github.com/caaatto/raiderranked-api) and is mirrored byte-identical here.

### Versioning

`## Version` in `RaiderRanked.toc` is the single source of truth, and it is what the WoW AddOns list shows.

- **Feature release** - bump the minor by hand and commit: `1.11.4` → `1.12.0`
- **Automated release** - CI increments the last component from wherever that leaves it: `1.12.0` → `1.12.1` → `1.12.2`

Every release commits the bumped TOC, tags it `v<version>`, and uploads to CurseForge as `Raider Ranked <version>`, so the CurseForge file list, the git tags, and the in-game version all name the same build.

Threshold runs that find no changes upload nothing. To ship a build that only changed code, trigger the workflow manually from the Actions tab with **force_release** enabled.

### Setup (for maintainers)

1. Get a [CurseForge API token](https://legacy.curseforge.com/account/api-tokens)
2. Set these in the repo settings:
   - **Secret** `CF_API_TOKEN` - your CurseForge API token
   - **Variable** `CF_PROJECT_ID` - your CurseForge project ID
   - **Variable** `CF_GAME_VERSIONS` - comma-separated game version IDs (e.g. `11567,11565`)
3. The workflow runs daily at 00:00 UTC, or trigger manually from the Actions tab

Game version IDs can be found via:
```bash
curl -H "X-Api-Token: YOUR_TOKEN" https://wow.curseforge.com/api/game/versions
```

### Client compatibility

`## Interface` in `RaiderRanked.toc` lists the client builds the addon is flagged compatible with, currently `120100` for 12.1.0 only. When a patch lands, replace the number (12.1.0 → `120100`) - a stale list only shows the addon as out of date, it does not break it. The TOC is read at client start, so the flag clears on a full restart rather than a `/reload`.

The `CF_GAME_VERSIONS` repository variable is the same statement for CurseForge and has to move with it, since that is what the upload lists the file under. It holds CurseForge's own numeric ids rather than build numbers; the call above maps one to the other (12.1.0 is `16519`).
