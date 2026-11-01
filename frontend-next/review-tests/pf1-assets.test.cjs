// Acceptance test for PF-1 (image assets at display size). Owned by the orchestrator: do not edit.
const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const sharp = require('sharp');

const pub = p => path.join('public', p);
async function meta(p) {
  const m = await sharp(pub(p)).metadata();
  return { w: m.width, h: m.height, kb: fs.statSync(pub(p)).size / 1024, alpha: m.hasAlpha, format: m.format };
}

test('coin icon: 64×64 at most, under 8 KB, still a PNG with transparency', async () => {
  const m = await meta('currency/denarius.png');
  assert.equal(m.format, 'png');
  assert.ok(m.w <= 64 && m.h <= 64 && m.w >= 32, JSON.stringify(m));
  assert.ok(m.kb < 8, `${m.kb.toFixed(1)} KB`);
  assert.ok(m.alpha);
});

for (const p of ['logo/openbible-logo-black.png', 'logo/openbible-logo-white.png']) {
  test(`${p}: longest side 96–192 px, under 24 KB, aspect ratio kept, transparent`, async () => {
    const m = await meta(p);
    assert.equal(m.format, 'png');
    assert.ok(Math.max(m.w, m.h) <= 192 && Math.max(m.w, m.h) >= 96, JSON.stringify(m));
    assert.ok(Math.abs(m.w / m.h - 1050 / 1176) < 0.02, `aspect ${m.w}/${m.h}`);
    assert.ok(m.kb < 24, `${m.kb.toFixed(1)} KB`);
    assert.ok(m.alpha);
  });
}

test('the favicon / apple icon / AI avatar file exists: square, 180–192 px, under 24 KB', async () => {
  const m = await meta('logo/openbible-logo.png');
  assert.equal(m.format, 'png');
  assert.equal(m.w, m.h);
  assert.ok(m.w >= 180 && m.w <= 192, JSON.stringify(m));
  assert.ok(m.kb < 24, `${m.kb.toFixed(1)} KB`);
});

test('no file under public/ is larger than 100 KB', () => {
  const big = [];
  const walk = d => { for (const f of fs.readdirSync(d, { withFileTypes: true })) { const p = path.join(d, f.name); if (f.isDirectory()) walk(p); else if (fs.statSync(p).size > 100 * 1024) big.push(p); } };
  walk('public');
  assert.deepEqual(big, []);
});
