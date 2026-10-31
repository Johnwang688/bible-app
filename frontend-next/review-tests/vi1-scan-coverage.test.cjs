// Regression test from the VI-1 verifier review (Sol). Owned by the orchestrator: do not edit.
const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const { pathToFileURL } = require('node:url');

test('scanTree visits every CSS, TS and TSX source file', async () => {
  const root = path.resolve(__dirname, '..');
  const { scanTree } = await import(pathToFileURL(
    path.join(root, 'scripts/color-literals-baseline.mjs')
  ).href);

  function walk(dir) {
    return fs.readdirSync(dir, { withFileTypes: true }).flatMap(entry => {
      const file = path.join(dir, entry.name);
      if (entry.isDirectory()) return walk(file);
      return /\.(css|tsx?)$/.test(file)
        ? [path.relative(root, file).split(path.sep).join('/')]
        : [];
    });
  }

  assert.deepEqual(
    Object.keys(scanTree()).sort(),
    walk(path.join(root, 'src')).sort(),
  );
});
