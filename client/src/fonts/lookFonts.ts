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
/** Faces whose last load failed: on the web expo-font still holds each one's `@font-face` rule. */
const failed = new Set<FontName>();

/**
 * Loads one face. On the web expo-font keeps a failed face's `@font-face` rule, and `loadAsync` skips a family
 * whose rule exists, so a retry would download nothing: a face that failed is unloaded first (it stays
 * in its `error` state until then). A face that loaded is never unloaded. A failure is rethrown, and the face is
 * forgotten so a later call asks again.
 */
async function loadFace(name: FontName): Promise<void> {
  if (failed.delete(name)) {
    try {
      await Font.unloadAsync?.(name);
    } catch {
      // Nothing to remove (a phone face that never loaded), or the rule is already gone.
    }
  }
  try {
    await Font.loadAsync(name, { uri: FONT_SOURCES[name], display: Font.FontDisplay.SWAP });
  } catch (err) {
    failed.add(name);
    pending.delete(name);
    throw err;
  }
}

/**
 * Loads each of a look's faces not loaded or loading yet, each on its own `loadAsync` and all settled
 * together. Concurrent callers share a face's load; a failed face is forgotten, and unloaded when a later call
 * asks for it again, so that call downloads it again. Rejects if any face failed.
 */
export async function ensureLookFonts(theme: Theme): Promise<void> {
  const loads = lookFontNames(theme).map((name) => {
    let load = pending.get(name);
    if (!load) {
      load = loadFace(name);
      pending.set(name, load);
    }
    return load;
  });
  const results = await Promise.allSettled(loads);
  const failed = results.find((r): r is PromiseRejectedResult => r.status === 'rejected');
  if (failed) throw failed.reason;
}

/** Tests only: forget loads so each test starts clean. */
export function resetLookFontsForTesting(): void {
  pending.clear();
  failed.clear();
}
