// Regression test from the W4-6d verifier review (Sol): each position value alone must reach the context value.
const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const vm = require('node:vm');
const ts = require('typescript');

for (const [key, next] of Object.entries({
  books: [{ book_number: 43, name: 'John', testament: 'NT', total_chapters: 21 }],
  translations: [{ id: 'CUV', name: 'Chinese Union Version', language: 'zh' }],
  currentBook: { book_number: 43, name: 'John', testament: 'NT', total_chapters: 21 },
  chapter: 3,
  translation: 'CUV',
})) {
  test('ReaderPositionProvider publishes a ' + key + '-only change', () => {
    let cursor = 0, memo, deps;
    const states = [], setters = [];
    const react = {
      createContext: () => ({ Provider: 'provider' }),
      useContext: () => null,
      useState(initial) {
        const i = cursor++;
        if (!(i in states)) states[i] = initial;
        setters[i] ??= value => {
          states[i] = typeof value === 'function' ? value(states[i]) : value;
        };
        return [states[i], setters[i]];
      },
      useMemo(factory, nextDeps) {
        if (!deps || deps.length !== nextDeps.length ||
            nextDeps.some((value, i) => !Object.is(value, deps[i]))) {
          memo = factory();
        }
        deps = nextDeps;
        return memo;
      },
    };

    const source = fs.readFileSync(
      'src/features/reader/ReaderPositionContext.tsx', 'utf8');


    const mod = { exports: {} };
    vm.runInNewContext(ts.transpileModule(source, {
      compilerOptions: {
        module: ts.ModuleKind.CommonJS,
        jsx: ts.JsxEmit.ReactJSX,
      },
    }).outputText, {
      module: mod,
      exports: mod.exports,
      require: id => id === 'react' ? react : require(id),
    });

    const render = () => {
      cursor = 0;
      return mod.exports.ReaderPositionProvider({ children: null }).props.value;
    };

    const before = render();
    assert.strictEqual(render(), before);
    const setter = 'set' + key[0].toUpperCase() + key.slice(1);
    before[setter](() => next);
    const after = render();

    assert.strictEqual(after[key], next);
    assert.notStrictEqual(after, before);
    assert.strictEqual(after[setter], before[setter]);
  });
}
