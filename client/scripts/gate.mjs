#!/usr/bin/env node
// The local gate: the CI-equivalent check for the client (there is no CI workflow).
// Run from client/:  npm run gate            (everything)
//                    npm run gate -- --quick (typecheck, lint, unit tests only)
//                    npm run gate -- --offline (skip expo-doctor, which needs the network)
// Exits non-zero if any step fails, and prints which R-0 acceptance item each step covers.
import { spawnSync } from 'node:child_process';
import { mkdtempSync, readFileSync, rmSync } from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const client = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
const args = new Set(process.argv.slice(2));
const quick = args.has('--quick');
const offline = args.has('--offline');

const nativeOut = mkdtempSync(path.join(os.tmpdir(), 'bible-client-native-'));
const jestJson = path.join(nativeOut, 'jest.json');

/** Jest suites that carry an acceptance item by themselves. */
const ACCEPTANCE_SUITES = [
  ['token ratchet', 'src/__tests__/ratchets.test.ts', 'token ratchet'],
  ['string ratchet', 'src/__tests__/ratchets.test.ts', 'string ratchet'],
  ['contrast over every preset', 'src/theme/__tests__/contrast.test.ts', 'preset contrast'],
  ['missing-key test', 'src/i18n/__tests__/catalogue.test.ts', 'message catalogue'],
  ['presets match the canvas', 'src/theme/__tests__/canvas.test.ts', ''],
  ['API client vs golden responses', 'src/api/__tests__/golden.test.ts', ''],
];

const steps = [
  { name: 'typecheck', covers: 'TypeScript strict', cmd: 'npx tsc --noEmit' },
  { name: 'lint', covers: 'ESLint', cmd: 'npx eslint . --max-warnings 0' },
  {
    name: 'unit tests',
    covers: 'ratchets, contrast, missing keys, canvas, API contract',
    cmd: `npx jest --ci --json --outputFile="${jestJson}"`,
    after: checkAcceptanceSuites,
  },
  !quick && !offline && { name: 'expo-doctor', covers: 'native config and SDK versions', cmd: 'npx --yes expo-doctor' },
  !quick && { name: 'export web', covers: 'builds for web', cmd: 'npx expo export -p web --output-dir dist' },
  !quick && {
    name: 'export ios + android',
    covers: 'builds for iOS and Android (Metro + Hermes bundles)',
    cmd: `npx expo export -p ios -p android --output-dir "${nativeOut}/dist"`,
  },
  !quick && { name: 'e2e (web export)', covers: 'four empty tabs, both languages, looks', cmd: 'npx playwright test' },
].filter(Boolean);

function checkAcceptanceSuites() {
  const report = JSON.parse(readFileSync(jestJson, 'utf8'));
  const problems = [];
  for (const [item, file, describe] of ACCEPTANCE_SUITES) {
    const suite = report.testResults.find((r) => r.name.split(path.sep).join('/').endsWith(file));
    const tests = (suite?.assertionResults ?? []).filter((a) => !describe || a.ancestorTitles[0] === describe);
    const ok = tests.length > 0 && tests.every((a) => a.status === 'passed');
    console.log(`    ${ok ? 'pass' : 'FAIL'}  ${item}  (${tests.length} tests in ${file})`);
    if (!ok) problems.push(item);
  }
  return problems.length === 0;
}

const results = [];
for (const step of steps) {
  console.log(`\n=== ${step.name}: ${step.cmd}`);
  const started = Date.now();
  const run = spawnSync(step.cmd, { cwd: client, stdio: 'inherit', shell: true });
  let ok = run.status === 0;
  if (step.after) {
    try {
      ok = step.after() && ok;
    } catch (err) {
      console.log(`    could not read the jest report: ${err.message}`);
      ok = false;
    }
  }
  results.push({ ...step, ok, seconds: ((Date.now() - started) / 1000).toFixed(1) });
}
rmSync(nativeOut, { recursive: true, force: true });

console.log('\n=== gate summary');
for (const r of results) console.log(`  ${r.ok ? 'pass' : 'FAIL'}  ${r.name.padEnd(22)} ${String(r.seconds).padStart(6)}s  ${r.covers}`);
if (quick) console.log('  (quick: exports, expo-doctor and e2e skipped)');
else if (offline) console.log('  (offline: expo-doctor skipped)');
const failed = results.filter((r) => !r.ok);
console.log(failed.length ? `\nGATE FAILED: ${failed.map((r) => r.name).join(', ')}` : '\nGATE PASSED');
process.exit(failed.length ? 1 : 0);
