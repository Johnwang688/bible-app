// The Hebrew and Greek fonts of the Original words panel: loaded on first use, system font until then.
import { useEffect, useState } from 'react';

import { ensureFont, LAZY_FONT_FAMILY, type LazyFont } from '../../fonts/lazy';

type OriginalLanguage = 'greek' | 'hebrew' | 'aramaic';

const loaded = new Set<LazyFont>();

/** Aramaic in Scripture is written in the Hebrew script. */
export function fontFor(language: OriginalLanguage | null): 'hebrew' | 'greek' | null {
  if (language === 'greek') return 'greek';
  if (language === 'hebrew' || language === 'aramaic') return 'hebrew';
  return null;
}

/** The `fontFamily` for a language once its font has loaded; `undefined` (the system font) before. */
export function useOriginalFont(language: OriginalLanguage | null): string | undefined {
  const font = fontFor(language);
  const [, setTick] = useState(0);
  useEffect(() => {
    if (!font || loaded.has(font)) return;
    let live = true;
    ensureFont(font)
      .then(() => {
        loaded.add(font);
        if (live) setTick((n) => n + 1);
      })
      .catch(() => undefined); // keep the system font; the next visit tries again
    return () => {
      live = false;
    };
  }, [font]);
  return font && loaded.has(font) ? LAZY_FONT_FAMILY[font] : undefined;
}

export const isRtl = (language: OriginalLanguage | null): boolean => language === 'hebrew' || language === 'aramaic';
