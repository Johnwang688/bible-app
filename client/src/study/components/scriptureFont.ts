// The Scripture face for a translation: the preset's serif for English, the lazily loaded Noto Serif SC for
// Chinese (system font until it arrives). Used by the Saved list's verse text.
import { useEffect, useState } from 'react';

import { ensureFont, LAZY_FONT_FAMILY } from '../../fonts/lazy';
import { scriptureFace } from '../../fonts/fonts';
import { isChineseTranslation, type TranslationId } from '../../reader/translations';
import type { Theme } from '../../theme/types';

// Once the Chinese font has loaded it stays loaded; later rows start with it.
let chineseFontLoaded = false;

function useChineseFont(needed: boolean): string | undefined {
  const [, setLoaded] = useState(chineseFontLoaded);
  useEffect(() => {
    if (!needed || chineseFontLoaded) return;
    ensureFont('chineseScripture')
      .then(() => {
        chineseFontLoaded = true;
        setLoaded(true);
      })
      .catch(() => undefined); // keep the system font; the next visit tries again
  }, [needed]);
  return needed && chineseFontLoaded ? LAZY_FONT_FAMILY.chineseScripture : undefined;
}

export function useScriptureFont(theme: Theme, translation: TranslationId): { fontFamily: string | undefined; zh: boolean } {
  const zh = isChineseTranslation(translation);
  const chinese = useChineseFont(zh);
  return { fontFamily: zh ? chinese : scriptureFace(theme.type.scripture), zh };
}
