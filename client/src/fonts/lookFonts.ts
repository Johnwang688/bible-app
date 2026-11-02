// Loads a look's fonts: its UI family (every registered weight of the UI and heading families) and its
// Scripture family (regular, italic, bold). Each face is asked for once, with `font-display: swap`, so the
// web shows text in a fallback font and swaps the face in. Used by FontGate (the active look) and the
// look picker (the looks its cards show).
import * as Font from 'expo-font';

import type { Theme } from '../theme/types';
import { FONT_SOURCES, scriptureFace, uiFace, type FontName, type FontWeight } from './fonts';

const WEIGHTS: readonly FontWeight[] = ['400', '700', '800'];

/** The faces a look uses, without duplicates. */
export function lookFontNames(theme: Theme): FontName[] {
  const names = new Set<FontName>();
  for (const family of new Set([theme.type.ui, theme.type.head])) {
    for (const weight of WEIGHTS) names.add(uiFace(family, weight));
  }
  for (const variant of ['regular', 'italic', 'bold'] as const) names.add(scriptureFace(theme.type.scripture, variant));
  return [...names];
}

const pending = new Map<FontName, Promise<void>>();

/** Starts one load for the faces nobody has asked for yet; each face remembers it until it fails. */
function loadMissing(missing: FontName[]): Promise<void> {
  const sources = Object.fromEntries(
    missing.map((name) => [name, { uri: FONT_SOURCES[name], display: Font.FontDisplay.SWAP }]),
  );
  const load = Font.loadAsync(sources).catch((err: unknown) => {
    for (const name of missing) if (pending.get(name) === load) pending.delete(name);
    throw err;
  });
  for (const name of missing) pending.set(name, load);
  return load;
}

/**
 * Loads each of a look's faces not loaded or loading yet, in one `loadAsync`. Concurrent callers share a
 * load; a failed face is forgotten so a later call retries it. Rejects if any face failed.
 */
export async function ensureLookFonts(theme: Theme): Promise<void> {
  const names = lookFontNames(theme);
  const missing = names.filter((name) => !pending.has(name));
  const loads = new Set(names.map((name) => pending.get(name)).filter((p): p is Promise<void> => !!p));
  if (missing.length > 0) loads.add(loadMissing(missing));
  const results = await Promise.allSettled(loads);
  const failed = results.find((r): r is PromiseRejectedResult => r.status === 'rejected');
  if (failed) throw failed.reason;
}

/** Tests only: forget loads so each test starts clean. */
export function resetLookFontsForTesting(): void {
  pending.clear();
}
