// Regression tests from Sol review round 2 of HG-3b (account restore from recent passages). Owned by the orchestrator: do not edit.
const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const vm = require('node:vm');
const ts = require('typescript');

let source = fs.readFileSync('src/components/BibleApp.tsx', 'utf8');
if (process.env.HG3B_MUTANT === 'translation') {
  source = source.replace('recentPassage.translation,', "'BSB',");
}
const ast = ts.createSourceFile(
  'BibleApp.tsx', source, ts.ScriptTarget.Latest, true, ts.ScriptKind.TSX,
);

function callback(name, env) {
  let expression;
  function visit(n) {
    if (ts.isVariableDeclaration(n) && n.name.getText(ast) === name) {
      expression = n.initializer.arguments[0].getText(ast);
    }
    ts.forEachChild(n, visit);
  }
  visit(ast);
  assert.ok(expression, name);
  return vm.runInNewContext(ts.transpileModule(`(${expression})`, {
    compilerOptions: { target: ts.ScriptTarget.ES2020 },
  }).outputText, env);
}

const mod = { exports: {} };
vm.runInNewContext(ts.transpileModule(
  fs.readFileSync('src/features/reader/translations.ts', 'utf8'),
  { compilerOptions: { module: ts.ModuleKind.CommonJS } },
).outputText, { module: mod, exports: mod.exports, require });

const books = [
  { name: 'Genesis', book_number: 1, total_chapters: 50 },
  {
    name: 'John', book_number: 43, total_chapters: 21,
    name_zh: '\u7d04\u7ff0\u798f\u97f3',
    name_zh_simplified: '\u7ea6\u7ff0\u798f\u97f3',
  },
];
const recent = (book, translation) =>
  ({ book, chapter: 3, translation, saved_at: 1000 });

function harness(local = null) {
  const position = {
    ...(local ?? { book: 'Genesis', chapter: 1, translation: 'BSB' }),
  };
  const noop = () => {};
  const env = {
    books,
    booksByName: new Map(books.map(b => [b.name.toLowerCase(), b])),
    booksByNumber: new Map(books.map(b => [b.book_number, b])),
    hydratingAccountRef: { current: false },
    syncReadyRef: { current: false },
    currentBookRef: { current: books.find(b => b.name === position.book) },
    chapterRef: { current: position.chapter },
    translationRef: { current: position.translation },
    readStoredLastPosition: () => local,
    // Set once by the init effect: whether this device had a saved position when the app started.
    startedWithSavedPositionRef: { current: local !== null },
    readStoredRecentPassages: () =>
      local ? [{ ...local, savedAt: 2000 }] : [],
    highlightedVerses: [], bookmarkedVerses: [], verseNotes: {},
    recentPassages: local ? [{ ...local, savedAt: 2000 }] : [],
    verseStorageKey: (...parts) => parts.join('::').toLowerCase(),
    setHighlightedVerses: noop, setBookmarkedVerses: noop,
    setVerseNotes: noop, setRecentPassages: noop,
    setReaderSettings: noop, setAccountProfile: noop,
    setCurrentBook: b => position.book = b.name,
    setChapter: c => position.chapter = c,
    setTranslation: t => position.translation = t,
    loadChapter: noop,
    normalizeTranslationChoice: mod.exports.normalizeTranslationChoice,
    queueMicrotask: fn => fn(),
  };
  return {
    env, position,
    apply: callback('applyRemoteAccountState', env),
  };
}

test('F1: older remote history preserves a newer local position', async () => {
  const local = { book: 'John', chapter: 3, translation: 'ASV' };
  const h = harness(local);
  Object.assign(h.env, {
    getProfile: async () => ({}),
    getStudyItems: async () => [{
      book_number: 43, chapter: 3, verse_start: 16, kind: 'bookmark',
    }],
    getReadingProgress: async () => [],
    getUserSettings: async () => ({
      recent_passages: [recent('Genesis', 'WEB')],
    }),
    applyRemoteAccountState: h.apply,
  });

  await callback('syncAccountState', h.env)({});
  assert.deepEqual(h.position, local);
});

for (const book of [books[1].name_zh, books[1].name_zh_simplified]) {
  test(`F2: restores catalog alias ${book}`, () => {
    const h = harness();
    h.apply([], [], { recent_passages: [recent(book, 'CUV')] });
    assert.deepEqual(h.position, {
      book: 'John', chapter: 3, translation: 'CUV',
    });
  });
}

test('control: mixed-case English resolves; KJV falls back to BSB', () => {
  const h = harness();
  h.apply([], [], { recent_passages: [recent('jOhN', 'ASV')] });
  assert.equal(h.position.translation, 'ASV');
  h.apply([], [], { recent_passages: [recent('John', 'KJV')] });
  assert.equal(h.position.translation, 'BSB');
});
