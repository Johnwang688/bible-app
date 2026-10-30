// Regression test from the verifier review (W4-6a). Owned by the orchestrator: do not edit.
const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const vm = require('node:vm');
const ts = require('typescript');

test('provider preserves context identity without a settings change', () => {
  const settings = { readerFont: 'georgia' };
  const setter = () => {};
  const ref = { current: false };
  let cached;

  const react = {
    createContext: () => ({ Provider: 'provider' }),
    useState: () => [settings, setter],
    useRef: () => ref,
    useEffect: () => {},
    useMemo: factory => cached ??= factory(),
    useContext: () => null,
  };

  const source = fs.readFileSync(
    'src/features/settings/ReaderSettingsContext.tsx', 'utf8',
  );
  const mod = { exports: {} };

  vm.runInNewContext(ts.transpileModule(source, {
    compilerOptions: {
      module: ts.ModuleKind.CommonJS,
      jsx: ts.JsxEmit.ReactJSX,
    },
  }).outputText, {
    exports: mod.exports,
    module: mod,
    require: id => {
      if (id === 'react') return react;
      if (id === '@/features/reader/settings')
        return { DEFAULT_READER_SETTINGS: settings };
      if (id === '@/features/progress/progress')
        return { READER_SETTINGS_STORAGE_KEY: 'settings' };
      if (id === '@/lib/localState')
        return { readStoredReaderSettings: () => settings };
      return require(id);
    },
  });

  const Provider = mod.exports.ReaderSettingsProvider;
  const first = Provider({ children: null }).props.value;
  const second = Provider({ children: null }).props.value;

  assert.strictEqual(first.setReaderSettings, setter);
  assert.strictEqual(
    second, first, 'context value changed without a settings change',
  );
});
