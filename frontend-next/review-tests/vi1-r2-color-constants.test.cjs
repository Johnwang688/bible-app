// Regression test from the VI-1 verifier review, round 2 (Sol). Owned by the orchestrator: do not edit.
// The fragment-attribute exclusion was dropped (orchestrator decision): every hex in code counts, so none can hide.
const test = require('node:test');
const assert = require('node:assert/strict');

test('counts color constants outside JSX attributes', async () => {
  const { findColorLiterals } = await import('../scripts/color-literals-baseline.mjs');
  const source = 'const to = "#fff"; export const style = { color: to };';
  assert.deepEqual(findColorLiterals(source, '.tsx').map(hit => hit.literal), ['#fff']);
});

test('a hex in a fragment attribute counts too (no exclusion)', async () => {
  const { findColorLiterals } = await import('../scripts/color-literals-baseline.mjs');
  for (const attr of ['href', 'to', 'src', 'id', 'xlinkHref', 'action']) {
    assert.equal(findColorLiterals(`<Box ${attr}="#abc" />`, '.tsx').length, 1, attr);
  }
});
