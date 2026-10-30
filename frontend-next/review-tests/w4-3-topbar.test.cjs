// Regression test from the verifier review (W4-3). Owned by the orchestrator: do not edit.
const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const vm = require('node:vm');
const ts = require('typescript');

test('TopBar forwards focus and pointer interactions', () => {
  const source = fs.readFileSync(
    'src/features/reader/TopBar.tsx', 'utf8',
  );
  const { outputText } = ts.transpileModule(source, {
    compilerOptions: {
      module: ts.ModuleKind.CommonJS,
      target: ts.ScriptTarget.ES2020,
      jsx: ts.JsxEmit.ReactJSX,
    },
  });
  const mod = { exports: {} };
  vm.runInNewContext(outputText, {
    module: mod, exports: mod.exports, require,
  });

  let calls = 0;
  const nav = mod.exports.default({
    bumpChromeScrollInteraction: () => { calls += 1; },
  });

  assert.equal(typeof nav.props.onFocusCapture, 'function');
  assert.equal(typeof nav.props.onPointerDown, 'function');
  nav.props.onFocusCapture({});
  nav.props.onPointerDown({});
  assert.equal(calls, 2);
});
