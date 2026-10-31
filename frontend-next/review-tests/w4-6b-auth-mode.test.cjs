// Regression test from the verifier review (W4-6b). Owned by the orchestrator: do not edit.
const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const vm = require('node:vm');
const ts = require('typescript');

test('AuthProvider publishes an authMode-only change', () => {
  let cursor = 0, memo, deps;
  const states = [], setters = [];
  const react = {
    createContext: () => ({ Provider: 'provider' }),
    useContext: () => null,
    useEffect: () => {},
    useState(initial) {
      const i = cursor++;
      if (!(i in states)) states[i] = initial;
      setters[i] ??= next => {
        states[i] = typeof next === 'function' ? next(states[i]) : next;
      };
      return [states[i], setters[i]];
    },
    useMemo(factory, next) {
      if (!deps || deps.length !== next.length ||
          next.some((value, i) => !Object.is(value, deps[i]))) {
        memo = factory();
      }
      deps = next;
      return memo;
    },
  };
  const mod = { exports: {} };
  const source = fs.readFileSync(
    'src/features/account/AuthContext.tsx', 'utf8',
  );
  vm.runInNewContext(ts.transpileModule(source, {
    compilerOptions: {
      module: ts.ModuleKind.CommonJS,
      jsx: ts.JsxEmit.ReactJSX,
    },
  }).outputText, {
    module: mod, exports: mod.exports,
    require: id => {
      if (id === 'react') return react;
      if (id === '@/lib/account')
        return { restoreAuthSession: () => null };
      return require(id);
    },
  });
  const render = () => {
    cursor = 0;
    return mod.exports.AuthProvider({ children: null }).props.value;
  };
  const before = render();
  assert.equal(before.authMode, 'signin');
  assert.strictEqual(render(), before);

  before.setAuthMode('signup');
  const after = render();
  assert.equal(after.authMode, 'signup');
  assert.notStrictEqual(after, before);
  assert.strictEqual(after.setAuthMode, before.setAuthMode);
});
