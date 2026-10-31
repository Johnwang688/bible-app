// Regression tests from Sol review round 1 of SM-1. Owned by the orchestrator: do not edit.
const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const vm = require('node:vm');
const ts = require('typescript');

const app = ts.createSourceFile(
  'BibleApp.tsx',
  fs.readFileSync('src/components/BibleApp.tsx', 'utf8'),
  ts.ScriptTarget.Latest, true, ts.ScriptKind.TSX,
);

function binding(name, env) {
  let expression;
  function visit(node) {
    if (ts.isVariableDeclaration(node) &&
        node.name.getText(app) === name) {
      expression = node.initializer.getText(app);
    }
    ts.forEachChild(node, visit);
  }
  visit(app);
  assert.ok(expression, name);
  return vm.runInNewContext(ts.transpileModule(
    `const value = ${expression}; value;`,
    { compilerOptions: {
      target: ts.ScriptTarget.ES2020,
      module: ts.ModuleKind.CommonJS,
    } },
  ).outputText, { useCallback: fn => fn, ...env });
}

function picker() {
  const mod = { exports: {} };
  vm.runInNewContext(ts.transpileModule(
    fs.readFileSync('src/features/progress/surprise.ts', 'utf8'),
    { compilerOptions: {
      target: ts.ScriptTarget.ES2020,
      module: ts.ModuleKind.CommonJS,
    } },
  ).outputText, { module: mod, exports: mod.exports, require });
  return mod.exports.pickSurpriseChapter;
}

const noop = () => {};
const ref = current => ({ current });

test('F1: clicking before the catalog loads must not throw', () => {
  const click = binding('handleSurpriseMe', {
    books: [], chaptersRead: new Set(), currentBook: null,
    chapter: 1, translation: 'WEB', booksByNumber: new Map(),
    pickSurpriseChapter: picker(),
    navigateToPassage: noop, openReaderFromHome: noop,
  });
  assert.doesNotThrow(click);
});

test('F2: a late initial response must not replace the Surprise chapter', async () => {
  const genesis = {
    name: 'Genesis', book_number: 1, total_chapters: 50,
  };
  const john = {
    name: 'John', book_number: 43, total_chapters: 21,
  };
  const requests = [];
  let displayed;

  const load = binding('loadChapter', {
    pendingAiNavRef: ref(null), setAiNavHighlight: noop,
    // Latest-request counter the fix adds to loadChapter (named by the orchestrator's fix card).
    chapterLoadSeqRef: ref(0),
    readerSettingsRef: ref({
      pageFlipEnabled: false, specialEffects: false,
    }),
    setChapterError: noop, setChapterLoading: noop,
    setChapterData: data => { displayed = data; },
    setAnimClass: noop, exitAnimDoneRef: ref(false),
    pendingFlipDataRef: ref(null), biblePaneRef: ref(null),
    sidePanelModeRef: ref('none'),
    commentarySourceRef: ref('summary'),
    loadCommentaryData: noop,
    fetch: url => new Promise(resolve =>
      requests.push({ url, resolve })),
  });

  const oldRequest = load(genesis, 1, 'WEB');
  let selectedRequest;
  const click = binding('handleSurpriseMe', {
    books: [genesis, john], chaptersRead: new Set(),
    currentBook: genesis, chapter: 1, translation: 'WEB',
    booksByNumber: new Map([[1, genesis], [43, john]]),
    pickSurpriseChapter: () => ({ book_number: 43, chapter: 3 }),
    navigateToPassage: (name, chapter, translation) => {
      assert.equal(name, 'John');
      selectedRequest = load(john, chapter, translation);
      return true;
    },
    openReaderFromHome: noop,
  });

  click();
  assert.match(requests[1].url, /John\/3\?translation=WEB$/);

  const chosen = {
    book: 'John', chapter: 3, translation: 'WEB', verses: [],
  };
  requests[1].resolve({ ok: true, json: async () => chosen });
  await selectedRequest;
  assert.equal(displayed, chosen);

  requests[0].resolve({
    ok: true,
    json: async () => ({
      book: 'Genesis', chapter: 1, translation: 'WEB', verses: [],
    }),
  });
  await oldRequest;
  assert.equal(displayed, chosen,
    'the picked chapter must remain displayed');
});
