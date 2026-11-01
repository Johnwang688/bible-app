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
