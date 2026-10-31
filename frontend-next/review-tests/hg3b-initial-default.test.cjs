// Regression test from Sol review round 1 of HG-3b (F2): the context's initial translation must equal DEFAULT_TRANSLATION.
const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const vm = require('node:vm');
const ts = require('typescript');

function load(file, react) {
  const mod = { exports: {} };
  const source = fs.readFileSync(file, 'utf8');
  const js = ts.transpileModule(source, {
    compilerOptions: {
      module: ts.ModuleKind.CommonJS,
      jsx: ts.JsxEmit.ReactJSX,
    },
  }).outputText;

  vm.runInNewContext(js, {
    module: mod,
    exports: mod.exports,
    require: id => id === 'react' ? react : require(id),
  });
  return mod.exports;
}

test('initial context translation equals DEFAULT_TRANSLATION', () => {
  const { DEFAULT_TRANSLATION } =
    load('src/features/reader/translations.ts');
  const react = {
    createContext: () => ({ Provider: 'provider' }),
    useState: initial => [initial, () => {}],
    useMemo: fn => fn(),
  };
  const { ReaderPositionProvider } =
    load('src/features/reader/ReaderPositionContext.tsx', react);

  assert.equal(
    ReaderPositionProvider({ children: null }).props.value.translation,
    DEFAULT_TRANSLATION,
  );
});
