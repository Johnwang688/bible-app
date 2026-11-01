// Regression tests from Sol review round 1 of VI-2a (F2, F3). Owned by the orchestrator: do not edit.
// F2: the device listener exists only for Auto, and its cleanup removes exactly what it added.
// F3: Paper's text colours meet WCAG AA (4.5:1) on its background and panel.
const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const vm = require('node:vm');
const ts = require('typescript');

const mod = { exports: {} };
vm.runInNewContext(ts.transpileModule(fs.readFileSync('src/lib/themes.ts', 'utf8'), {
  compilerOptions: { module: ts.ModuleKind.CommonJS, target: ts.ScriptTarget.ES2020 },
}).outputText, { module: mod, exports: mod.exports, require });
const { subscribeDeviceTheme } = mod.exports;

function fakeMediaQuery() {
  const listeners = new Set();
  return {
    listeners,
    addEventListener: (type, fn) => { assert.equal(type, 'change'); listeners.add(fn); },
    removeEventListener: (type, fn) => { assert.equal(type, 'change'); listeners.delete(fn); },
  };
}

for (const pref of ['light', 'dark', 'paper']) {
  test(`F2: no device listener for an explicit ${pref}`, () => {
    const mq = fakeMediaQuery();
    const cleanup = subscribeDeviceTheme(pref, mq, () => {});
    assert.equal(mq.listeners.size, 0);
    assert.equal(typeof cleanup, 'function');
    cleanup();
  });
}

test('F2: Auto subscribes once, notifies on change, and cleanup removes it (Strict Mode replay)', () => {
  const mq = fakeMediaQuery();
  let calls = 0;
  const first = subscribeDeviceTheme('system', mq, () => { calls++; });
  assert.equal(mq.listeners.size, 1);
  [...mq.listeners][0]({ matches: true });
  assert.equal(calls, 1);
  first();
  assert.equal(mq.listeners.size, 0);
  const second = subscribeDeviceTheme('system', mq, () => {});
  assert.equal(mq.listeners.size, 1);
  second();
  assert.equal(mq.listeners.size, 0);
});

function luminance(hex) {
  const c = hex.slice(1).match(/../g).map(v => parseInt(v, 16) / 255)
    .map(v => (v <= 0.04045 ? v / 12.92 : ((v + 0.055) / 1.055) ** 2.4));
  return c[0] * 0.2126 + c[1] * 0.7152 + c[2] * 0.0722;
}
const ratio = (a, b) => { const x = luminance(a), y = luminance(b); return (Math.max(x, y) + 0.05) / (Math.min(x, y) + 0.05); };

test('F3: Paper text colours meet AA on its background and panel', () => {
  const css = fs.readFileSync('src/app/globals.css', 'utf8');
  const block = css.match(/\[data-theme="paper"\]\s*\{([^}]*)\}/)[1];
  const color = name => block.match(new RegExp(`${name}:\s*(#[0-9a-f]{6})`, 'i'))[1];
  for (const fg of ['--text', '--muted', '--accent', '--vnum', '--rdrlabel']) {
    for (const bg of ['--bg', '--panel']) {
      const r = ratio(color(fg), color(bg));
      assert.ok(r >= 4.5, `Paper ${fg} on ${bg}: ${r.toFixed(2)}:1`);
    }
  }
});
