// Regression test from the W4-6c verifier review (Sol): a daily-goal-only change must reach the context value.
const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const vm = require('node:vm');
const ts = require('typescript');

test('StudyItemsProvider publishes a daily-goal-only change', () => {
  let cursor = 0, memo, deps;
  const states = [], setters = [];
  const react = {
    createContext: () => ({ Provider: 'provider' }),
    useContext: () => null,
    useEffect: () => {},
    useRef: () => ({ current: false }),
    useState(initial) {
      const i = cursor++;
      if (!(i in states))
        states[i] = typeof initial === 'function' ? initial() : initial;
      setters[i] ??= next => {
        states[i] = typeof next === 'function' ? next(states[i]) : next;
      };
      return [states[i], setters[i]];
    },
    useMemo(factory, next) {
      if (!deps || next.length !== deps.length ||
          next.some((v, i) => !Object.is(v, deps[i]))) memo = factory();
      deps = next;
      return memo;
    },
  };
  const mod = { exports: {} };
  const source = fs.readFileSync(
    'src/features/study/StudyItemsContext.tsx', 'utf8');
  vm.runInNewContext(ts.transpileModule(source, {
    compilerOptions: {
      module: ts.ModuleKind.CommonJS, jsx: ts.JsxEmit.ReactJSX,
    },
  }).outputText, {
    module: mod, exports: mod.exports,
    require: id => {
      if (id === 'react') return react;
      if (id === '@/features/progress/progress') return {
        DEFAULT_DAILY_GOAL_MINUTES: 10,
        normalizeReadingProgress: () => ({}),
      };
      if (id === '@/lib/localState') return {};
      return require(id);
    },
  });
  const render = () => {
    cursor = 0;
    return mod.exports.StudyItemsProvider({ children: null }).props.value;
  };
  const before = render();
  before.setDailyGoalMinutes(30);
  const after = render();
  assert.equal(after.dailyGoalMinutes, 30);
  assert.notStrictEqual(after, before);
  assert.strictEqual(after.setDailyGoalMinutes, before.setDailyGoalMinutes);
});
