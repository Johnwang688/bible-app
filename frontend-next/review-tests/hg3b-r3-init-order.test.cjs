// Regression test from Sol review round 3 of HG-3b: the init effect records whether the device started with a saved position. Owned by the orchestrator: do not edit.
const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const vm = require('node:vm');
const ts = require('typescript');

let source = fs.readFileSync('src/components/BibleApp.tsx', 'utf8');
if (process.env.HG3B_MUTANT === 'init') {
  const changed = source.replace(
    'startedWithSavedPositionRef.current = storedLastPosition !== null;', '',
  );
  assert.notEqual(changed, source);
  source = changed;
}
const ast = ts.createSourceFile(
  'BibleApp.tsx', source, ts.ScriptTarget.Latest, true, ts.ScriptKind.TSX,
);
let expression;
function visit(n) {
  if (ts.isCallExpression(n) && n.expression.getText(ast) === 'useEffect') {
    const effect = n.arguments[0];
    if (effect.getText(ast).includes(
      'const storedLastPosition = readStoredLastPosition();',
    )) expression = effect.getText(ast);
  }
  ts.forEachChild(n, visit);
}
visit(ast);
assert.ok(expression);

for (const saved of [
  null,
  { book: 'John', chapter: 3, translation: 'ASV' },
]) {
  test(`startup snapshot before fetch and Strict Mode replay: ${!!saved}`, () => {
    const ref = { current: false };
    const fetchFlags = [];
    const noop = () => {};
    const env = {
      startedWithSavedPositionRef: ref,
      initStartedRef: { current: false },
      readStoredLastPosition: () => saved,
      readStoredReaderSettings: () => ({
        specialEffects: false, defaultPanel: 'none',
      }),
      normalizeThemeId: () => 'default',
      localStorage: { getItem: () => null, setItem: noop },
      setCurrentTheme: noop,
      setShowOnboarding: noop,
      ONBOARDING_STORAGE_KEY: 'bible-app-onboarding-complete',
      document: {
        documentElement: { removeAttribute: noop, setAttribute: noop },
      },
      stopDynamicTheme: noop,
      fetch: () => {
        fetchFlags.push(ref.current);
        return new Promise(() => {}); // Metadata stays pending.
      },
    };
    const effect = vm.runInNewContext(ts.transpileModule(
      `(${expression})`,
      { compilerOptions: { target: ts.ScriptTarget.ES2020 } },
    ).outputText, env);

    const cleanup = effect();
    assert.equal(ref.current, saved !== null);
    assert.deepEqual(fetchFlags, Array(3).fill(saved !== null));

    cleanup();
    effect();
    assert.equal(ref.current, saved !== null);
    assert.equal(fetchFlags.length, 3); // initStartedRef prevents duplication.
  });
}
