// Regression test from the HG-3a verifier review, round 3 (Sol). Owned by the orchestrator: do not edit.
const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const vm = require('node:vm');
const ts = require('typescript');

test('reader area reserves the taskbar and top bar', () => {
  const source = fs.readFileSync(
    'src/features/reader/popupPlacement.ts', 'utf8'
  );
  const mod = { exports: {} };

  vm.runInNewContext(
    ts.transpileModule(source, {
      compilerOptions: { module: ts.ModuleKind.CommonJS },
    }).outputText,
    {
      module: mod,
      exports: mod.exports,
      window: { innerWidth: 1400, innerHeight: 900 },
      document: {
        querySelector(selector) {
          if (selector === '.topbar')
            return { offsetTop: 0, offsetHeight: 56 };
          if (selector === '.taskbar')
            return { offsetTop: 814, offsetHeight: 86 };
          return null;
        },
      },
    }
  );

  const area = mod.exports.measureReaderArea(null);
  assert.equal(area.top, 64);
  assert.equal(area.bottom, 806);
});
