// Regression tests from Sol review round 1 of SM-1. Owned by the orchestrator: do not edit.
const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const vm = require('node:vm');
const ts = require('typescript');

let source = fs.readFileSync(
  'src/features/progress/surprise.ts', 'utf8');

if (process.env.SM1_MUTANT === 'sort') {
  source = source.replace(
    'for (const book of books)',
    'for (const book of [...books].sort((a, b) => a.book_number - b.book_number))',
  );
}

const mod = { exports: {} };
vm.runInNewContext(ts.transpileModule(source, {
  compilerOptions: {
    module: ts.ModuleKind.CommonJS,
    target: ts.ScriptTarget.ES2020,
  },
}).outputText, { module: mod, exports: mod.exports, require });

test('F3: both branches preserve supplied catalog order', () => {
  const books = [
    { book_number: 43, total_chapters: 1 },
    { book_number: 1, total_chapters: 1 },
  ];
  for (const draws of [[0.1, 0, 0], [0.95, 0]]) {
    const picked = mod.exports.pickSurpriseChapter(
      books, new Set(), null, () => {
        assert.ok(draws.length > 0);
        return draws.shift();
      },
    );
    assert.deepEqual(
      { ...picked }, { book_number: 43, chapter: 1 });
    assert.equal(draws.length, 0);
  }
});
