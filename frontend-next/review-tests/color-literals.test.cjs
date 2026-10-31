// Colour-literal ratchet (VI-1). Files may not gain colour literals: use a --color-* token
// from src/styles/tokens.css instead. Counts may only go down; lower
// review-tests/color-literals-baseline.json when they do
// (node scripts/color-literals-baseline.mjs).
//
// The counter lives in scripts/color-literals-baseline.mjs (ES module), so it is imported
// dynamically from these async tests.
const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const { pathToFileURL } = require('node:url');

const ROOT = path.resolve(__dirname, '..');
const loadCounter = () => import(pathToFileURL(path.join(ROOT, 'scripts', 'color-literals-baseline.mjs')).href);
const literals = async (source, ext) => (await loadCounter()).findColorLiterals(source, ext).map((h) => h.literal);

test('ratchet: no new colour literals, no increases', async () => {
  const { scanTree } = await loadCounter();
  const baseline = JSON.parse(fs.readFileSync(path.join(__dirname, 'color-literals-baseline.json'), 'utf8'));
  const failures = [];
  const reminders = [];

  for (const [file, hits] of Object.entries(scanTree())) {
    const allowed = baseline[file] ?? 0;
    if (hits.length > allowed) {
      const where = hits.slice(0, 20).map((h) => `    ${file}:${h.line}  ${h.literal}`).join('\n');
      const why = allowed === 0
        ? `has ${hits.length} colour literal(s) and is not in the baseline`
        : `has ${hits.length} colour literals, baseline allows ${allowed}`;
      failures.push(
        `${file} ${why}. Use a --color-* token from src/styles/tokens.css instead.\n${where}` +
        (hits.length > 20 ? `\n    …and ${hits.length - 20} more` : ''),
      );
    } else if (hits.length < allowed) {
      reminders.push(`${file}: ${allowed} -> ${hits.length}`);
    }
  }
  for (const file of Object.keys(baseline)) {
    if (!fs.existsSync(path.join(ROOT, file))) reminders.push(`${file}: file is gone, remove it from the baseline`);
  }

  if (reminders.length) {
    console.log(`Colour literals went down. Lower the baseline (node scripts/color-literals-baseline.mjs):\n  ${reminders.join('\n  ')}`);
  }
  assert.equal(failures.length, 0, '\n' + failures.join('\n\n'));
});

test('tokens.css has no colour literals and is not baselined', async () => {
  const { scanTree } = await loadCounter();
  const baseline = JSON.parse(fs.readFileSync(path.join(__dirname, 'color-literals-baseline.json'), 'utf8'));
  assert.ok(!('src/styles/tokens.css' in baseline));
  assert.deepEqual(scanTree()['src/styles/tokens.css'], []);
});

test('matcher: hex colours in CSS declarations count, selectors and URLs do not', async () => {
  assert.deepEqual(await literals('a { color: #fff; background:#aabbcc; border-color: #AABBCCDD; x: #abcd }', '.css'),
    ['#fff', '#aabbcc', '#AABBCCDD', '#abcd']);
  assert.deepEqual(await literals('#abc { top: 0 }\na:hover #fed, .x > #def { top: 0 }', '.css'), []);
  assert.deepEqual(await literals('a { background: url("x.svg#abc"); b: url(#fff) }', '.css'), []);
  assert.deepEqual(await literals('a { background: url(data:image/svg+xml;utf8,<svg fill="#fff"/>) }', '.css'), []);
  assert.deepEqual(await literals('a { content: "#fff"; width: 10px }', '.css'), []);
  assert.deepEqual(await literals('a { color: #12345 }', '.css'), []); // 5 digits is not a colour
  assert.deepEqual(await literals('a { color: #fff }', '.css'), ['#fff']); // last declaration, no semicolon
});

test('matcher: rgb/hsl with literal numbers count, var-based forms do not', async () => {
  assert.deepEqual(await literals('a { color: rgba(0,0,0,.5); b: hsl(120 50% 50%); c: rgb( 1 2 3) }', '.css'),
    ['rgba(0,0,0,.5)', 'hsl(120 50% 50%)', 'rgb( 1 2 3)']);
  assert.deepEqual(await literals('a { color: rgb(var(--x) / 50%); b: color-mix(in srgb, var(--a) 40%, var(--b)) }', '.css'), []);
  assert.deepEqual(await literals('a { color: color-mix(in srgb, #fff 40%, var(--b)) }', '.css'), ['#fff']);
});

test('matcher: comments are stripped, strings are not mistaken for comments', async () => {
  assert.deepEqual(await literals('/* #fff */ a { /* color: #000; */ color: var(--x) }', '.css'), []);
  assert.deepEqual(await literals("// #fff\nconst a = 'https://x.dev/#abc'; /* '#000' */ const b = '#123456';", '.ts'), ['#123456']);
  assert.deepEqual(await literals("const url = 'https://x.dev'; const c = '#fff'; // '#000'", '.tsx'), ['#fff']);
});

test('matcher: TS/TSX colours in strings and JSX attributes, entities and fragments excluded', async () => {
  assert.deepEqual(await literals('<circle fill="#1a0c08" stroke={`rgba(0,0,0,0.2)`} />', '.tsx'), ['#1a0c08', 'rgba(0,0,0,0.2)']);
  assert.deepEqual(await literals("const s = '&#123;'; const u = 'page.html#abc'; const v = 'var(--x)';", '.ts'), []);
  assert.equal((await literals("const m = { a: '#fff', b: '#000' };\n", '.ts')).length, 2);
});

test('reports the line of each literal', async () => {
  const { findColorLiterals } = await loadCounter();
  const hits = findColorLiterals('a {\n  color: var(--x);\n  /* multi\n line */\n  background: #fff;\n}', '.css');
  assert.deepEqual(hits, [{ line: 5, literal: '#fff' }]);
});
