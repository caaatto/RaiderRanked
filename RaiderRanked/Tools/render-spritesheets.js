/**
 * render-spritesheets.js
 *
 * Downloads tier-promotion WebM animations from CommunityDragon CDN,
 * extracts frames via FFmpeg, and composites into 2048×2048 spritesheets.
 *
 * Output per rank:
 *   <rank>_from_sheet.png  — outgoing rank animation (old crest leaves)
 *   <rank>_sheet.png       — incoming rank animation (new crest appears)
 *
 * Both sheets use an 8×16 grid @ 512 px/cell → 4096×8192 px.
 * Each frame is masked with a radial vignette (opaque center, soft fade
 * at edges) so lightning/particle effects don't reveal the cell boundary
 * when rendered with additive blending in WoW.
 * Playback at 20 FPS (matching Animation.lua SHEET_FPS).
 *
 * Requirements: Node.js 18+ (FFmpeg bundled via ffmpeg-static)
 *
 * Usage:
 *   cd Tools
 *   npm install
 *   node render-spritesheets.js          # all ranks
 *   node render-spritesheets.js gold     # single rank
 */

'use strict';

const { execFileSync } = require('child_process');
const fs               = require('fs');
const path             = require('path');
const https            = require('https');
const http             = require('http');
const sharp            = require('sharp');
const FFMPEG = require('ffmpeg-static');

// ── CDN ───────────────────────────────────────────────────────────────────────

const CDN = 'https://raw.communitydragon.org/pbe/plugins/rcp-fe-lol-static-assets'
          + '/global/default/videos/ranked';

const RANKS = [
    'iron', 'bronze', 'silver', 'gold', 'platinum',
    'emerald', 'diamond', 'master', 'grandmaster', 'challenger',
];

// ── Spritesheet constants ─────────────────────────────────────────────────────
// Must stay in sync with Animation.lua.

const FRAME_SIZE   = 512;
const COLS         = 8;
const ROWS         = 16;
const MAX_FRAMES   = COLS * ROWS;   // 128
const TARGET_FPS   = 20;            // matches SHEET_FPS in Animation.lua
const SHEET_W      = COLS * FRAME_SIZE;   // 4096
const SHEET_H      = ROWS * FRAME_SIZE;   // 8192

const OUT_DIR = path.join(__dirname, '..', 'Media', 'Spritesheets');
const TMP_DIR = path.join(__dirname, '.tmp');

// ── Download helper ──────────────────────────────────────────────────────────

function download(url, dest) {
    return new Promise((resolve, reject) => {
        const follow = (url) => {
            const lib = url.startsWith('https') ? https : http;
            lib.get(url, res => {
                if (res.statusCode === 301 || res.statusCode === 302) {
                    return follow(res.headers.location);
                }
                if (res.statusCode !== 200) {
                    return reject(new Error(`HTTP ${res.statusCode}`));
                }
                const file = fs.createWriteStream(dest);
                res.pipe(file);
                file.on('finish', () => file.close(resolve));
            }).on('error', reject);
        };
        follow(url);
    });
}

// ── FFmpeg helpers ───────────────────────────────────────────────────────────

/**
 * Get video duration in seconds using ffmpeg stderr output.
 */
function getVideoDuration(filePath) {
    try {
        execFileSync(FFMPEG, ['-i', filePath, '-f', 'null', '-'],
            { stdio: ['pipe', 'pipe', 'pipe'] });
    } catch (e) {
        // ffmpeg writes info to stderr even on "success", and returns non-zero
        // for -f null.  Parse Duration from stderr.
        const stderr = (e.stderr || '').toString();
        const m = stderr.match(/Duration:\s*(\d+):(\d+):(\d+)\.(\d+)/);
        if (m) return parseInt(m[1])*3600 + parseInt(m[2])*60 + parseInt(m[3]) + parseInt(m[4])/100;
    }
    return 0;
}

/**
 * Extract frames from a WebM video.
 *
 * - Always samples at TARGET_FPS (20).
 * - If the video yields more than MAX_FRAMES at that rate, lowers the
 *   extraction FPS so exactly MAX_FRAMES are produced.
 * - Returns an array of absolute paths to the extracted PNGs.
 */
function extractFrames(webmPath, framesDir) {
    fs.mkdirSync(framesDir, { recursive: true });

    const duration    = getVideoDuration(webmPath);
    const nativeCount = duration > 0 ? Math.ceil(duration * TARGET_FPS) : MAX_FRAMES;
    const fps         = nativeCount <= MAX_FRAMES
        ? TARGET_FPS
        : MAX_FRAMES / duration;

    execFileSync(FFMPEG, [
        '-y',
        '-c:v', 'libvpx-vp9',
        '-i', webmPath,
        '-vf', [
            `fps=${fps}`,
            `scale=${FRAME_SIZE}:${FRAME_SIZE}:force_original_aspect_ratio=decrease:flags=lanczos`,
            `pad=${FRAME_SIZE}:${FRAME_SIZE}:-1:-1:color=black@0.0`,
            'format=rgba',
        ].join(','),
        '-frames:v', String(MAX_FRAMES),
        path.join(framesDir, 'frame_%04d.png'),
    ], { stdio: ['pipe', 'pipe', 'pipe'] });

    return fs.readdirSync(framesDir)
        .filter(f => f.startsWith('frame_') && f.endsWith('.png'))
        .sort()
        .map(f => path.join(framesDir, f));
}

// ── Radial vignette mask ────────────────────────────────────────────────────
// Soft circular falloff baked into each frame so lightning/particle effects
// at cell edges don't reveal the rectangular boundary under ADD blending.

let radialMaskBuf;

async function getRadialMask() {
    if (radialMaskBuf) return radialMaskBuf;
    const r = FRAME_SIZE / 2;
    const svg = Buffer.from(
        `<svg xmlns="http://www.w3.org/2000/svg" width="${FRAME_SIZE}" height="${FRAME_SIZE}">` +
        `<defs><radialGradient id="m">` +
        `<stop offset="75%" stop-color="white" stop-opacity="1"/>` +
        `<stop offset="100%" stop-color="white" stop-opacity="0"/>` +
        `</radialGradient></defs>` +
        `<circle cx="${r}" cy="${r}" r="${r}" fill="url(#m)"/>` +
        `</svg>`);
    radialMaskBuf = await sharp(svg).ensureAlpha().png().toBuffer();
    return radialMaskBuf;
}

// ── Composite frames → spritesheet ──────────────────────────────────────────

async function compositeSheet(framePaths) {
    const count = Math.min(framePaths.length, MAX_FRAMES);
    const mask  = await getRadialMask();

    const composites = [];
    for (let i = 0; i < count; i++) {
        // Apply radial mask: dest-in keeps frame pixels but multiplies alpha
        // by the mask's alpha → soft circular fade at edges.
        const masked = await sharp(framePaths[i])
            .composite([{ input: mask, blend: 'dest-in' }])
            .png()
            .toBuffer();
        composites.push({
            input:  masked,
            left:   (i % COLS) * FRAME_SIZE,
            top:    Math.floor(i / COLS) * FRAME_SIZE,
        });
    }

    const buf = await sharp({
        create: {
            width:      SHEET_W,
            height:     SHEET_H,
            channels:   4,
            background: { r: 0, g: 0, b: 0, alpha: 0 },
        },
    })
    .composite(composites)
    .png()
    .toBuffer();

    return { buffer: buf, frameCount: count };
}

// ── Cleanup helper ──────────────────────────────────────────────────────────

function rmdir(dir) {
    if (fs.existsSync(dir)) fs.rmSync(dir, { recursive: true, force: true });
}

// ── Render one rank ──────────────────────────────────────────────────────────

async function renderRank(rank) {
    const results = {};

    for (const type of ['from', 'to']) {
        const webmName  = `tier-promotion-${type}-${rank}.webm`;
        const url       = `${CDN}/${webmName}`;
        const webmPath  = path.join(TMP_DIR, webmName);
        const framesDir = path.join(TMP_DIR, `${rank}_${type}_frames`);

        process.stdout.write(`${type} `);

        try {
            await download(url, webmPath);
            const framePaths            = extractFrames(webmPath, framesDir);
            const { buffer, frameCount } = await compositeSheet(framePaths);
            results[type] = { buffer, frameCount };
            process.stdout.write(`(${frameCount}f) `);
        } catch (e) {
            process.stdout.write(`(FAILED: ${e.message}) `);
            results[type] = null;
        } finally {
            try { fs.unlinkSync(webmPath); } catch (_) {}
            rmdir(framesDir);
        }
    }

    return results;
}

// ── Main ──────────────────────────────────────────────────────────────────────

async function main() {
    // ── Preflight: check bundled FFmpeg ──────────────────────────────────────
    if (!fs.existsSync(FFMPEG)) {
        console.error(`ffmpeg-static binary not found at ${FFMPEG}\nRun: npm install`);
        process.exit(1);
    }

    const arg   = (process.argv[2] || 'all').toLowerCase();
    const ranks = arg === 'all' ? RANKS : RANKS.filter(r => r === arg);
    if (ranks.length === 0) {
        console.error(`Unknown rank: "${arg}"\nAvailable: ${RANKS.join(', ')}`);
        process.exit(1);
    }

    fs.mkdirSync(OUT_DIR, { recursive: true });
    fs.mkdirSync(TMP_DIR, { recursive: true });

    console.log(`Rendering ${ranks.length} rank(s) → ${OUT_DIR}`);
    console.log(`Grid: ${COLS}×${ROWS} @ ${FRAME_SIZE}px = ${SHEET_W}×${SHEET_H}`);
    console.log(`Source: ${CDN}`);
    console.log(`Target FPS: ${TARGET_FPS}  |  Max frames/sheet: ${MAX_FRAMES}\n`);

    const summary = [];
    let ok = 0, fail = 0;

    for (const rank of ranks) {
        process.stdout.write(`  [${rank.padEnd(12)}] `);
        try {
            const results = await renderRank(rank);

            if (results.from) {
                fs.writeFileSync(
                    path.join(OUT_DIR, `${rank}_from_sheet.png`),
                    results.from.buffer);
            }
            if (results.to) {
                fs.writeFileSync(
                    path.join(OUT_DIR, `${rank}_sheet.png`),
                    results.to.buffer);
            }

            const fromInfo = results.from
                ? `from ${String(results.from.frameCount).padStart(2)}f  ${(results.from.buffer.length / 1024).toFixed(0).padStart(5)} KB`
                : 'from N/A';
            const toInfo = results.to
                ? `to ${String(results.to.frameCount).padStart(2)}f  ${(results.to.buffer.length / 1024).toFixed(0).padStart(5)} KB`
                : 'to N/A';

            console.log(`✓  ${fromInfo}  |  ${toInfo}`);
            summary.push({
                rank,
                fromFrames: results.from?.frameCount ?? 0,
                toFrames:   results.to?.frameCount   ?? 0,
            });
            ok++;
        } catch (e) {
            console.log(`✗  FAILED: ${e.message}`);
            fail++;
        }
    }

    // ── Summary ──────────────────────────────────────────────────────────────
    if (summary.length > 0) {
        const maxFrom = Math.max(...summary.map(s => s.fromFrames));
        const maxTo   = Math.max(...summary.map(s => s.toFrames));
        console.log(`\n── Frame count summary ──`);
        for (const s of summary) {
            console.log(`  ${s.rank.padEnd(12)}  from=${String(s.fromFrames).padStart(2)}   to=${String(s.toFrames).padStart(2)}`);
        }
        console.log(`  ${'(max)'.padEnd(12)}  from=${String(maxFrom).padStart(2)}   to=${String(maxTo).padStart(2)}`);
        console.log(`\nUpdate Animation.lua constants:`);
        console.log(`  FROM_FRAMES  = ${maxFrom}`);
        console.log(`  SHEET_FRAMES = ${maxTo}`);
    }

    rmdir(TMP_DIR);
    console.log(`\nDone: ${ok} succeeded, ${fail} failed.`);
    if (fail > 0) process.exit(1);
}

main().catch(e => { console.error(e); process.exit(1); });
