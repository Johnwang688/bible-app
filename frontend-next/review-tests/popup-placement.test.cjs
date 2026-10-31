// Unit tests for the verse card placement rule (HG-3a fix 2): src/features/reader/popupPlacement.ts.
const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const vm = require('node:vm');
const ts = require('typescript');

const source = fs.readFileSync('src/features/reader/popupPlacement.ts', 'utf8');
const { outputText } = ts.transpileModule(source, {
  compilerOptions: { module: ts.ModuleKind.CommonJS, target: ts.ScriptTarget.ES2020 },
});
const mod = { exports: {} };
vm.runInNewContext(outputText, { module: mod, exports: mod.exports, require });
const { placeVersePopup, VERSE_GAP, DOCK_MIN_HEIGHT } = mod.exports;

const rect = (left, top, width, height) => ({ left, top, right: left + width, bottom: top + height });
const POPUP = { width: 268, height: 210 };
// A 1400×900 window with a 532 px right pane, top bar 56, taskbar 86, margins applied.
const AREA = { left: 8, top: 64, right: 860, bottom: 806 };

function boxOf(p, size) {
  const width = p.width ?? size.width;
  const height = p.maxHeight ?? size.height;
  return { left: p.left, top: p.top, right: p.left + width, bottom: p.top + height };
}
const overlaps = (a, b) => a.left < b.right && b.left < a.right && a.top < b.bottom && b.top < a.bottom;
const within = (r, area) => r.left >= area.left && r.right <= area.right && r.top >= area.top && r.bottom <= area.bottom;

function check(verse, size, area) {
  const p = JSON.parse(JSON.stringify(placeVersePopup(verse, size, area))); // plain object from this realm
  const b = boxOf(p, size);
  assert.ok(within(b, area), `outside the area: ${JSON.stringify({ p, b, area })}`);
  return { p, b };
}

test('1. below the verse, aligned to its left edge', () => {
  const verse = rect(100, 200, 600, 60);
  const { p } = check(verse, POPUP, AREA);
  assert.deepEqual(p, { top: 260 + VERSE_GAP, left: 100, docked: false });
});

test('1. below the verse, shifted left to fit the area', () => {
  const verse = rect(700, 200, 150, 40);
  const { p, b } = check(verse, POPUP, AREA);
  assert.equal(p.docked, false);
  assert.equal(p.top, 240 + VERSE_GAP);
  assert.equal(b.right, AREA.right);
  assert.ok(!overlaps(b, verse));
});

test('2. above the verse when there is no room below', () => {
  const verse = rect(100, 600, 600, 60);
  const { p, b } = check(verse, POPUP, AREA);
  assert.deepEqual(p, { top: 600 - VERSE_GAP - POPUP.height, left: 100, docked: false });
  assert.equal(b.bottom, verse.top - VERSE_GAP);
});

test('3. to the right of the verse when neither below nor above fits', () => {
  const verse = rect(100, 150, 400, 500);
  const { p } = check(verse, POPUP, AREA);
  assert.deepEqual(p, { top: 150, left: 500 + VERSE_GAP, docked: false });
});

test('3. beside the verse, the top is clamped into the area', () => {
  const verse = rect(100, 20, 300, 850);
  const { p, b } = check(verse, POPUP, AREA);
  assert.equal(p.left, 400 + VERSE_GAP);
  assert.equal(p.top, AREA.top);
  assert.ok(!overlaps(b, verse));
});

test('4. to the left of the verse when the right side has no room', () => {
  const verse = rect(400, 150, 440, 500);
  const { p } = check(verse, POPUP, AREA);
  assert.deepEqual(p, { top: 150, left: 400 - VERSE_GAP - POPUP.width, docked: false });
});

test('the default 1400×900 layout never covers the verse', () => {
  for (let top = 64; top < 800; top += 37) {
    for (const [left, width] of [[40, 780], [300, 500], [600, 250]]) {
      const verse = rect(left, top, width, 84);
      const { p, b } = check(verse, POPUP, AREA);
      assert.equal(p.docked, false, `docked at ${top}`);
      assert.ok(!overlaps(b, verse), `covers the verse at ${top}`);
    }
  }
});

test('docked at the bottom when no candidate fits (narrow reader)', () => {
  const area = { left: 8, top: 64, right: 216, bottom: 806 }; // 208 px wide
  const verse = rect(20, 150, 190, 120);
  const { p, b } = check(verse, POPUP, area);
  assert.equal(p.docked, true);
  assert.equal(p.width, 208);
  assert.equal(p.left, 8);
  assert.equal(b.bottom, area.bottom);
  assert.ok(!overlaps(b, verse));
});

test('docked at the top when the bottom would cover the verse', () => {
  const area = { left: 584, top: 64, right: 792, bottom: 806 };
  const verse = rect(590, 640, 190, 120);
  const { p, b } = check(verse, POPUP, area);
  assert.equal(p.docked, true);
  assert.equal(p.top, area.top);
  assert.ok(!overlaps(b, verse));
});

test('docked on a short viewport: capped at the area height, below the top bar', () => {
  const area = { left: 8, top: 64, right: 1392, bottom: 211 }; // 1400×280
  const verse = rect(300, 120, 800, 60);
  const { p, b } = check(verse, POPUP, area);
  assert.ok(p.docked === true || !overlaps(b, verse));
  assert.ok(b.top >= area.top);
  assert.ok(b.bottom - b.top <= area.bottom - area.top);
});

test('docked: a card taller than the area scrolls inside it', () => {
  const area = { left: 8, top: 64, right: 400, bottom: 300 };
  const tall = { width: 268, height: 500 };
  const verse = rect(20, 0, 370, 40); // scrolled mostly above the area
  const { p, b } = check(verse, tall, area);
  assert.equal(p.docked, true);
  assert.equal(p.maxHeight, 236);
  assert.equal(p.width, 268);
  assert.ok(!overlaps(b, verse));
});

test('docked: shrinks into the gap beside a verse that both ends would cover', () => {
  const area = { left: 8, top: 64, right: 216, bottom: 806 };
  const verse = rect(20, 300, 190, 200); // gaps: 236 above, 298 below; card 600 tall
  const { p, b } = check(verse, { width: 268, height: 600 }, area);
  assert.equal(p.docked, true);
  assert.equal(b.bottom, area.bottom);
  assert.equal(p.maxHeight, area.bottom - (verse.bottom + VERSE_GAP));
  assert.ok(p.maxHeight >= DOCK_MIN_HEIGHT);
  assert.ok(!overlaps(b, verse));
});

test('never outside the area and never over the verse, across a sweep of layouts', () => {
  const areas = [
    AREA,
    { left: 8, top: 64, right: 216, bottom: 806 },
    { left: 584, top: 64, right: 792, bottom: 806 },
    { left: 282, top: 64, right: 712, bottom: 806 },
    { left: 8, top: 64, right: 1392, bottom: 211 },
  ];
  const sizes = [POPUP, { width: 268, height: 330 }, { width: 268, height: 900 }];
  let floated = 0;
  let docked = 0;
  for (const area of areas) {
    for (const size of sizes) {
      for (let top = -200; top < 1000; top += 43) {
        for (const [dx, w, h] of [[0, 1, 24], [10, 0.9, 80], [40, 0.5, 140], [0, 1, 400]]) {
          const width = Math.max(10, (area.right - area.left - dx) * w);
          const verse = rect(area.left + dx, top, width, h);
          const { p, b } = check(verse, size, area);
          if (p.docked) docked += 1;
          else floated += 1;
          if (!p.docked) {
            assert.ok(!overlaps(b, verse), `floating card covers the verse: ${JSON.stringify({ p, verse, area })}`);
            continue;
          }
          // Docked over the verse only when it leaves no usable gap above or below.
          if (overlaps(b, verse)) {
            const below = area.bottom - (verse.bottom + VERSE_GAP);
            const above = verse.top - VERSE_GAP - area.top;
            const want = Math.min(size.height, area.bottom - area.top, DOCK_MIN_HEIGHT);
            assert.ok(Math.max(below, above) < want, `avoidable overlap: ${JSON.stringify({ p, verse, area })}`);
          }
        }
      }
    }
  }
  assert.ok(floated > 0 && docked > 0);
});
