// Regression test from the VI-1 verifier review (Sol). Owned by the orchestrator: do not edit.
const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const { pathToFileURL } = require('node:url');

test('adding a baseline entry cannot bless a new file', async () => {
  const root = path.resolve(__dirname, '..');
  const counter = await import(pathToFileURL(
    path.join(root, 'scripts/color-literals-baseline.mjs')
  ).href);

  const fake = 'src/components/RatchetBypass.tsx';
  const fakeHits = counter.findColorLiterals(
    "export const style = {color: '#123456'};", '.tsx',
  );

  const mockFs = Object.create(fs);
  mockFs.readFileSync = (file, ...args) => {
    const content = fs.readFileSync(file, ...args);
    return String(file).endsWith('color-literals-baseline.json')
      ? JSON.stringify({ ...JSON.parse(content), [fake]: 1 })
      : content;
  };
  mockFs.existsSync = file =>
    String(file).replaceAll('\\', '/').endsWith(fake)
    || fs.existsSync(file);

  const jobs = [];
  const source = fs.readFileSync(
    path.join(root, 'review-tests/color-literals.test.cjs'), 'utf8',
  ).replace(
    /const loadCounter = .*;/,
    'const loadCounter = () => Promise.resolve(__counter);',
  );

  new Function('require', '__dirname', '__counter', source)(
    name => {
      if (name === 'node:test') {
        return (name, fn) => jobs.push({ name, fn });
      }
      if (name === 'node:fs') return mockFs;
      return require(name);
    },
    path.join(root, 'review-tests'),
    {
      ...counter,
      scanTree: () => ({
        ...counter.scanTree(),
        [fake]: fakeHits,
      }),
    },
  );

  const failures = [];
  for (const job of jobs) {
    try {
      await job.fn();
    } catch (error) {
      failures.push(error);
    }
  }
  assert.ok(failures.length > 0, 'new baseline entry bypassed the ratchet');
});
