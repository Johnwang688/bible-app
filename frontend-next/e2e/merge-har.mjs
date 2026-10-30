// Folds the per-test HARs written by `UPDATE_HAR=1 npx playwright test` into e2e/fixtures/api.har.
// Usage (from frontend-next/):  node e2e/merge-har.mjs
import { existsSync, mkdirSync, readFileSync, readdirSync, rmSync, writeFileSync } from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const here = path.dirname(fileURLToPath(import.meta.url));
const recordDir = path.join(here, '..', 'test-results', 'har');
const target = path.join(here, 'fixtures', 'api.har');

if (!existsSync(recordDir)) {
  console.error(`No recordings in ${recordDir}. Run: UPDATE_HAR=1 npx playwright test`);
  process.exit(1);
}

const files = readdirSync(recordDir).filter((f) => f.endsWith('.har'));
if (files.length === 0) {
  console.error(`No .har files in ${recordDir}.`);
  process.exit(1);
}

// Recording also captures responses fulfilled by the mocks in e2e/mocks; those paths must stay mock-only.
// Keep in sync with resolve() in e2e/mocks/index.ts.
const MOCKED = /\/api\/v1\/(ai\/(?!guided-chapter\/sections)|auth\/|me(\?|$)|study-items|reading-progress|user-settings|wallet|quiz\/)/;

const byKey = new Map();
let log = null;
for (const file of files) {
  const har = JSON.parse(readFileSync(path.join(recordDir, file), 'utf8'));
  log ??= har.log;
  for (const entry of har.log.entries) {
    if (MOCKED.test(new URL(entry.request.url).pathname + new URL(entry.request.url).search)) continue;
    const key = `${entry.request.method} ${entry.request.url} ${entry.request.postData?.text ?? ''}`;
    if (!byKey.has(key)) byKey.set(key, entry);
  }
}

const entries = [...byKey.entries()].sort(([a], [b]) => (a < b ? -1 : 1)).map(([, e]) => e);
mkdirSync(path.dirname(target), { recursive: true });
writeFileSync(target, JSON.stringify({ log: { ...log, entries } }, null, 2) + '\n');
rmSync(recordDir, { recursive: true, force: true });
console.log(`Merged ${files.length} recordings -> ${entries.length} entries in ${path.relative(process.cwd(), target)}`);
