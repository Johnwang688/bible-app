// Regression test from Sol review round 1 of PF-1. Owned by the orchestrator: do not edit.
const test = require('node:test');
const assert = require('node:assert/strict');
const sharp = require('sharp');

test('favicon/avatar preserves transparency and visible artwork', async () => {
  const file = 'public/logo/openbible-logo.png';

  assert.ok(
    (await sharp(file).metadata()).hasAlpha,
    'alpha channel must be retained'
  );

  const alpha = await sharp(file)
    .ensureAlpha()
    .extractChannel('alpha')
    .raw()
    .toBuffer();

  assert.ok(alpha.includes(0), 'transparent background must remain');
  assert.ok(alpha.some(a => a > 0), 'logo must remain visible');
});
