// The Chinese Scripture face (Noto Serif SC) for the verse text, loaded on first use; the system font until it arrives.
import { useEffect, useState } from 'react';

import { ensureFont, LAZY_FONT_FAMILY } from '../../fonts/lazy';

// Once loaded it stays loaded; later screens start with it.
let loaded = false;

/** `needed` false (an English verse on screen): nothing is loaded and the result is undefined. */
export function useChineseFont(needed = true): string | undefined {
  const [, setLoaded] = useState(loaded);
  useEffect(() => {
    if (loaded || !needed) return;
    let live = true;
    ensureFont('chineseScripture')
      .then(() => {
        loaded = true;
        if (live) setLoaded(true);
      })
      .catch(() => undefined); // keep the system font; the next visit tries again
    return () => {
      live = false;
    };
  }, [needed]);
  return needed && loaded ? LAZY_FONT_FAMILY.chineseScripture : undefined;
}
