// Regression test from the verifier re-check (persistence round 2). Owned by the orchestrator: do not edit.
const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const vm = require('node:vm');
const ts = require('typescript');

test('stored string arrays discard non-string entries', () => {
  const mod = { exports: {} };
  const { outputText } = ts.transpileModule(
    fs.readFileSync('src/lib/json.ts', 'utf8'),
    { compilerOptions: { module: ts.ModuleKind.CommonJS } },
  );
  vm.runInNewContext(outputText, {
    module: mod, exports: mod.exports, require,
  });

  assert.deepEqual(
    Array.from(mod.exports.asStringArray([
      null, 42, {}, false, [], 'john::3::16',
    ])),
    ['john::3::16'],
  );
});
