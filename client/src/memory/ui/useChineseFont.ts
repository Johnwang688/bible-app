// The Chinese Scripture face (Noto Serif SC) for the verse text, loaded on first use; the system font until it arrives.
import { useEffect, useState } from 'react';

import { ensureFont, LAZY_FONT_FAMILY } from '../../fonts/lazy';

// Once loaded it stays loaded; later screens start with it.
let loaded = false;

export function useChineseFont(): string | undefined {
  const [, setLoaded] = useState(loaded);
  useEffect(() => {
    if (loaded) return;
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
  }, []);
  return loaded ? LAZY_FONT_FAMILY.chineseScripture : undefined;
}
