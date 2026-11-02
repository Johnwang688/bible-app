// Acceptance (orchestrator-owned, R-7a, John 2026-11-02): the age choice never leaves the device, so the age
// step's "It stays on this device" stays true. It is never synced and never sent to the server. The only thing
// other modules may learn from it is `isSignInAllowed` (onboarding/signIn.ts), a boolean.
//
// Works before and after R-6b's sync engine merges: it reads the sources, and when `src/sync/` exists it also
// loads the sync registry and the synced setting keys and checks the onboarding key is in neither.
import * as fs from 'fs';
import * as path from 'path';

import { readSource, sourceFiles } from '../../__tests__/ratchetScan';
import { onboardingKey } from '../keys';

const SRC = path.resolve(__dirname, '../..');
const outside = sourceFiles().filter((f) => !f.startsWith('onboarding/'));

/** The module specifiers a file imports or re-exports (static and dynamic). */
function imports(text: string): string[] {
  const out: string[] = [];
  const re = /(?:from\s+|import\s*\(\s*|require\s*\(\s*)['"]([^'"]+)['"]/g;
  for (let m = re.exec(text); m; m = re.exec(text)) out.push(m[1]!);
  return out;
}

const fromOnboarding = (spec: string) => /(^|\/)onboarding(\/|$)/.test(spec);

/** Every object reachable from `value` (cycles visited once). */
function walk(value: unknown, seen = new Set<unknown>()): unknown[] {
  if (value === null || typeof value !== 'object' || seen.has(value)) return [];
  seen.add(value);
  return [value, ...Object.values(value as Record<string, unknown>).flatMap((v) => walk(v, seen))];
}

/** Loads a module from src/ when it exists on this branch (R-6b's sync engine may not have merged yet). */
function loadIfPresent(rel: string): Record<string, unknown> | null {
  if (!['.ts', '.tsx'].some((ext) => fs.existsSync(path.join(SRC, rel + ext)))) return null;
  return jest.requireActual<Record<string, unknown>>(path.join(SRC, rel));
}

describe('the age choice never leaves the device', () => {
  it('lives in its own key, apart from the shared keys', () => {
    expect(onboardingKey.key).toBe('onboarding');
    expect(readSource('storage/keys.ts')).not.toMatch(/['"]onboarding['"]|ageRange/);
  });

  it('nothing in sync/ or api/ imports the onboarding module', () => {
    const bad = outside
      .filter((f) => f.startsWith('sync/') || f.startsWith('api/'))
      .flatMap((f) => imports(readSource(f)).filter(fromOnboarding).map((s) => `${f}: ${s}`));
    expect(bad).toEqual([]);
  });

  it('outside the root layout, other modules import only the sign-in selector (a boolean), never the age', () => {
    const bad = outside
      .filter((f) => f !== 'app/_layout.tsx')
      .flatMap((f) =>
        imports(readSource(f))
          .filter(fromOnboarding)
          .filter((s) => !/(^|\/)onboarding\/signIn$/.test(s))
          .map((s) => `${f}: ${s}`),
      );
    expect(bad).toEqual([]);
  });

  it('no other module names the onboarding key or the age range', () => {
    const bad = outside.filter((f) => /['"`]onboarding['"`]|\bageRange\b|\bAGE_RANGES\b/.test(readSource(f)));
    expect(bad).toEqual([]);
  });

  it('when the sync engine is present, the onboarding key is in none of its domains or setting keys', () => {
    const registry = loadIfPresent('sync/registry');
    const types = loadIfPresent('sync/types');
    const synced = [registry, types]
      .filter((m): m is Record<string, unknown> => m !== null)
      .flatMap((m) => walk(m))
      .filter((o) => (o as { key?: unknown }).key === onboardingKey.key);
    expect(synced).toEqual([]);
    const settingKeys = (types?.SETTING_KEYS as readonly string[] | undefined) ?? [];
    expect(settingKeys).not.toContain(onboardingKey.key);
  });
});
