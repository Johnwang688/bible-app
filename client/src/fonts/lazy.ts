// Fonts loaded on first use: Hebrew and Greek (the Original words panel, R-2) and Chinese
// Scripture (CUV and CUV-SIMP). Noto Serif SC is large, so it never ships in the app bundle:
// - web: the Google Fonts stylesheet, whose unicode-range slices download only the glyphs a page uses;
// - native: downloaded once from a pinned, versioned CDN copy of the font file, then cached by expo-font.
import * as Font from 'expo-font';
import { Platform } from 'react-native';

export type LazyFont = 'hebrew' | 'greek' | 'chineseScripture';

/** The `fontFamily` to use once a lazy font has loaded. */
export const LAZY_FONT_FAMILY: Record<LazyFont, string> = {
  hebrew: 'NotoSerifHebrew_400Regular',
  greek: 'GentiumBookPlus_400Regular',
  chineseScripture: Platform.OS === 'web' ? 'Noto Serif SC' : 'NotoSerifSC_400Regular',
};

/** Pinned so a CDN change can never swap the font under us. */
export const NOTO_SERIF_SC_URL =
  'https://cdn.jsdelivr.net/npm/@expo-google-fonts/noto-serif-sc@0.4.4/400Regular/NotoSerifSC_400Regular.ttf';
export const NOTO_SERIF_SC_CSS = 'https://fonts.googleapis.com/css2?family=Noto+Serif+SC:wght@400;700&display=swap';

const pending = new Map<LazyFont, Promise<void>>();

/**
 * Loads a lazy font once. Concurrent and repeated calls share one load; a failed load is
 * forgotten so the next call retries. Text keeps its fallback font until this resolves.
 */
export function ensureFont(font: LazyFont): Promise<void> {
  const existing = pending.get(font);
  if (existing) return existing;
  const load = loadFont(font).catch((err: unknown) => {
    pending.delete(font);
    throw err;
  });
  pending.set(font, load);
  return load;
}

async function loadFont(font: LazyFont): Promise<void> {
  switch (font) {
    case 'hebrew': {
      const { NotoSerifHebrew_400Regular } = await import('@expo-google-fonts/noto-serif-hebrew');
      await Font.loadAsync({ [LAZY_FONT_FAMILY.hebrew]: NotoSerifHebrew_400Regular });
      return;
    }
    case 'greek': {
      const { GentiumBookPlus_400Regular } = await import('@expo-google-fonts/gentium-book-plus');
      await Font.loadAsync({ [LAZY_FONT_FAMILY.greek]: GentiumBookPlus_400Regular });
      return;
    }
    case 'chineseScripture':
      if (Platform.OS === 'web') {
        addStylesheet(NOTO_SERIF_SC_CSS);
        return;
      }
      await Font.loadAsync({ [LAZY_FONT_FAMILY.chineseScripture]: { uri: NOTO_SERIF_SC_URL } });
      return;
  }
}

function addStylesheet(href: string): void {
  if (typeof document === 'undefined') return;
  if (document.querySelector(`link[rel="stylesheet"][href="${href}"]`)) return;
  const link = document.createElement('link');
  link.rel = 'stylesheet';
  link.href = href;
  document.head.appendChild(link);
}

/** Tests only: forget loads so each test starts clean. */
export function resetLazyFontsForTesting(): void {
  pending.clear();
}
