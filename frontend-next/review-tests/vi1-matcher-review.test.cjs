// Regression test from the VI-1 verifier review (Sol). Owned by the orchestrator: do not edit.
const test = require('node:test');
const assert = require('node:assert/strict');
const path = require('node:path');
const { pathToFileURL } = require('node:url');

const load = () => import(pathToFileURL(path.resolve(
  __dirname, '../scripts/color-literals-baseline.mjs'
)).href);

for (const literal of [
  'hsl(-30 50% 50%)',
  'hsl(+30 50% 50%)',
  'RGB(1 2 3 / 50%)',
]) {
  test(`counts ${literal}`, async () => {
    const { findColorLiterals } = await load();
    assert.equal(
      findColorLiterals(`a { color: ${literal}; }`, '.css').length,
      1,
    );
  });
}
