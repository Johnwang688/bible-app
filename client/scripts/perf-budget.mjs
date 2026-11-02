#!/usr/bin/env node
// The R-7 performance budget, measured on the web export (run `npx expo export -p web --output-dir dist` first).
//   node scripts/perf-budget.mjs [--port 8105] [--gpu] [--runs 3]
// Prints one JSON object: bundle sizes, start-up on an emulated mid-range phone (Pixel 7 viewport, 4x CPU
// throttle, fast 4G), and the aurora's frame rate and main-thread cost per frame for each style.
// The local server sends files uncompressed, so the fast-4G start-up is a worst case; noNetworkLimit isolates
// the CPU cost.
// --gpu asks Chromium for the real GPU (ANGLE/D3D11) instead of SwiftShader; the GPU in use is reported.
import { chromium, devices } from '@playwright/test';
import { spawn } from 'node:child_process';
import { readdirSync, readFileSync, statSync } from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import { gzipSync } from 'node:zlib';

const client = process.env.CLIENT_DIR ?? path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
const args = process.argv.slice(2);
const opt = (name, fallback) => {
  const i = args.indexOf(name);
  return i >= 0 ? args[i + 1] : fallback;
};
const PORT = Number(opt('--port', process.env.E2E_PORT ?? 8105));
const RUNS = Number(opt('--runs', 3));
const GPU = args.includes('--gpu');
const BASE = `http://127.0.0.1:${PORT}`;
const KEY = (k) => `bible-app${String.fromCharCode(92)}${k}`;

function bundle() {
  const dir = path.join(client, 'dist', '_expo', 'static', 'js', 'web');
  const files = readdirSync(dir).filter((f) => f.endsWith('.js'));
  let raw = 0;
  let gz = 0;
  for (const f of files) {
    const buf = readFileSync(path.join(dir, f));
    raw += statSync(path.join(dir, f)).size;
    gz += gzipSync(buf).length;
  }
  return { files: files.length, rawKB: Math.round(raw / 1024), gzipKB: Math.round(gz / 1024) };
}

/** The font files the export ships (only the active look's are fetched at start; see startup().fontsAtStart). */
function fonts() {
  const out = { files: 0, KB: 0 };
  const walk = (dir) => {
    for (const e of readdirSync(dir, { withFileTypes: true })) {
      const full = path.join(dir, e.name);
      if (e.isDirectory()) walk(full);
      else if (/\.(ttf|otf|woff2?)$/.test(e.name)) {
        out.files++;
        out.KB += Math.round(statSync(full).size / 1024);
      }
    }
  };
  walk(path.join(client, 'dist', 'assets'));
  return out;
}

async function serve() {
  const child = spawn(process.execPath, [path.join(client, 'scripts', 'serve-dist.mjs')], {
    env: { ...process.env, PORT: String(PORT) },
    stdio: ['ignore', 'pipe', 'inherit'],
  });
  await new Promise((resolve, reject) => {
    child.stdout.on('data', (d) => String(d).includes('serving') && resolve());
    child.on('exit', (code) => reject(new Error(`server exited ${code}`)));
  });
  return child;
}

const median = (xs) => [...xs].sort((a, b) => a - b)[Math.floor(xs.length / 2)];

async function phonePage(browser, init, network = true) {
  const context = await browser.newContext({ ...devices['Pixel 7'], locale: 'en-US', colorScheme: 'light' });
  await context.addInitScript(([k, v]) => localStorage.setItem(k, v), [
    KEY('onboarding'),
    JSON.stringify({ v: 1, data: { done: true, ageRange: null } }),
  ]);
  for (const [k, v] of init) await context.addInitScript(([key, value]) => localStorage.setItem(key, value), [KEY(k), v]);
  const page = await context.newPage();
  const cdp = await context.newCDPSession(page);
  await cdp.send('Emulation.setCPUThrottlingRate', { rate: 4 });
  await cdp.send('Network.enable');
  if (network) await cdp.send('Network.emulateNetworkConditions', {
    offline: false,
    latency: 150,
    downloadThroughput: (1.6 * 1024 * 1024) / 8,
    uploadThroughput: (750 * 1024) / 8,
  });
  return { context, page, cdp };
}

/** Cold start: navigation to Home visible, the browser's paint timings, and the font files fetched at start. */
async function startup(browser, network, preset = 'matcha-latte') {
  const runs = [];
  let fontsAtStart = null;
  for (let i = 0; i < RUNS; i++) {
    const { context, page } = await phonePage(browser, [['appearance', JSON.stringify({ v: 1, data: { preset, mode: 'system' } })]], network);
    const fontReqs = [];
    page.on('requestfinished', (r) => {
      if (/\.(ttf|otf|woff2?)(\?|$)/.test(r.url())) fontReqs.push(r);
    });
    const t0 = Date.now();
    await page.goto(BASE + '/');
    await page.getByTestId('screen-home').waitFor({ state: 'visible', timeout: 60_000 });
    const homeMs = Date.now() - t0;
    if (i === 0) {
      // Let the start-up font requests finish (they no longer hold Home back), then count them.
      await page.waitForTimeout(network ? 15_000 : 2_000);
      let bytes = 0;
      for (const r of fontReqs) bytes += (await r.sizes()).responseBodySize;
      fontsAtStart = { files: fontReqs.length, KB: Math.round(bytes / 1024), names: fontReqs.map((r) => decodeURIComponent(r.url().split('/').pop()).replace(/\.[0-9a-f]{32}\./, '.')) };
    }
    const paint = await page.evaluate(() => {
      const fcp = performance.getEntriesByName('first-contentful-paint')[0];
      const nav = performance.getEntriesByType('navigation')[0];
      return { fcp: fcp ? Math.round(fcp.startTime) : null, domContentLoaded: nav ? Math.round(nav.domContentLoadedEventEnd) : null };
    });
    runs.push({ homeMs, ...paint });
    await context.close();
  }
  return {
    preset,
    fontsAtStart,
    homeVisibleMs: median(runs.map((r) => r.homeMs)),
    fcpMs: median(runs.map((r) => r.fcp)),
    domContentLoadedMs: median(runs.map((r) => r.domContentLoaded)),
  };
}

/** Frame rate and main-thread cost over 5 s on Home, for one look and aurora style. */
async function motion(browser, label, init, throttle) {
  const { context, page, cdp } = await phonePage(browser, init);
  if (!throttle) await cdp.send('Emulation.setCPUThrottlingRate', { rate: 1 });
  await page.goto(BASE + '/');
  await page.getByTestId('screen-home').waitFor({ state: 'visible', timeout: 60_000 });
  await page.waitForTimeout(1500);
  const gpu = await page.evaluate(() => {
    const gl = document.createElement('canvas').getContext('webgl2');
    const ext = gl && gl.getExtension('WEBGL_debug_renderer_info');
    return ext ? gl.getParameter(ext.UNMASKED_RENDERER_WEBGL) : gl ? 'webgl2 (renderer hidden)' : 'no webgl2';
  });
  const auroraFrames = async () => {
    const c = page.getByTestId('screen-home').getByTestId('aurora-canvas');
    return (await c.count()) ? Number((await c.getAttribute('data-aurora-frames')) ?? 0) : 0;
  };
  await cdp.send('Performance.enable');
  const before = await cdp.send('Performance.getMetrics');
  const framesBefore = await auroraFrames();
  const sample = await page.evaluate(
    () =>
      new Promise((resolve) => {
        const gaps = [];
        let last = performance.now();
        let longTasks = 0;
        const obs = new PerformanceObserver((l) => (longTasks += l.getEntries().length));
        try {
          obs.observe({ type: 'longtask', buffered: false });
        } catch {
          /* not supported */
        }
        const end = last + 5000;
        const tick = (t) => {
          gaps.push(t - last);
          last = t;
          if (t < end) requestAnimationFrame(tick);
          else {
            obs.disconnect();
            resolve({ gaps, longTasks });
          }
        };
        requestAnimationFrame(tick);
      }),
  );
  const after = await cdp.send('Performance.getMetrics');
  // The canvas writes its count at most every 250 ms, so this is good to about ±0.5 fps over 5 s.
  const drawn = (await auroraFrames()) - framesBefore;
  const metric = (m, n) => m.metrics.find((x) => x.name === n)?.value ?? 0;
  const frames = sample.gaps.length;
  const seconds = sample.gaps.reduce((a, b) => a + b, 0) / 1000;
  const sorted = [...sample.gaps].sort((a, b) => a - b);
  const canvas = page.getByTestId('screen-home').getByTestId('aurora-canvas');
  const state = (await canvas.count()) ? await canvas.getAttribute('data-aurora-state') : 'none';
  const style = (await canvas.count()) ? await canvas.getAttribute('data-aurora-style') : 'none';
  const result = {
    label,
    cpuThrottle: throttle ? 4 : 1,
    gpu,
    aurora: { state, style },
    fps: Math.round((frames / seconds) * 10) / 10,
    p95FrameMs: Math.round(sorted[Math.floor(sorted.length * 0.95)] * 10) / 10,
    longTasks: sample.longTasks,
    // The aurora's own frames (it may draw less often than the display: 30 fps on a software renderer).
    auroraFps: Math.round((drawn / seconds) * 10) / 10,
    taskMsPerAuroraFrame: drawn ? Math.round((((metric(after, 'TaskDuration') - metric(before, 'TaskDuration')) * 1000) / drawn) * 100) / 100 : null,
    taskMsPerSecond: Math.round(((metric(after, 'TaskDuration') - metric(before, 'TaskDuration')) * 1000) / seconds),
    scriptMsPerFrame: Math.round(((metric(after, 'ScriptDuration') - metric(before, 'ScriptDuration')) * 1000 / frames) * 100) / 100,
    taskMsPerFrame: Math.round(((metric(after, 'TaskDuration') - metric(before, 'TaskDuration')) * 1000 / frames) * 100) / 100,
    heapMB: Math.round(metric(after, 'JSHeapUsedSize') / 1024 / 1024),
  };
  await context.close();
  return result;
}

const server = await serve();
const browser = await chromium.launch({
  args: GPU ? ['--use-angle=d3d11', '--enable-gpu', '--ignore-gpu-blocklist', '--enable-unsafe-swiftshader'] : [],
});
try {
  const looks = [
    ['pastel (no aurora)', [['appearance', JSON.stringify({ v: 1, data: { preset: 'matcha-latte', mode: 'system' } })]]],
    ['Silver, fluid', [['aurora.style', JSON.stringify({ v: 1, data: 'fluid' })]]],
    ['Silver, flow', [['aurora.style', JSON.stringify({ v: 1, data: 'flow' })]]],
  ];
  const out = { date: new Date().toISOString(), bundle: bundle(), startup: { fast4g: await startup(browser, true), fast4gGlass: await startup(browser, true, 'silver'), noNetworkLimit: await startup(browser, false) }, fonts: fonts(), motion: [] };
  for (const throttle of [false, true]) for (const [label, init] of looks) out.motion.push(await motion(browser, label, init, throttle));
  console.log(JSON.stringify(out, null, 2));
} finally {
  await browser.close();
  server.kill();
}
