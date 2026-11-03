// Loads the active look's fonts and, when the interface or the translation is Chinese, the Chinese Scripture
// font. The web shows the children at once (the browser swaps each face in, `font-display: swap`). A phone's
// fonts are bundled local files, so its first render waits for the active look's fonts, or for a failure
// (then the system font); after that the children are never hidden again.
import { useEffect, useRef, useState, type ReactNode } from 'react';
import { Platform } from 'react-native';

import { useI18n } from '../i18n/I18nProvider';
import { isChineseTranslation } from '../reader/translations';
import { readerPositionKey } from '../storage/keys';
import { getStorage, useStoredValue } from '../storage/storage';
import { useTheme } from '../theme/ThemeProvider';
import { ensureFont } from './lazy';
import { ensureLookFonts } from './lookFonts';

export function FontGate({ children, onReady }: { children: ReactNode; onReady?: () => void }) {
  const theme = useTheme();
  const { locale } = useI18n();
  const [position] = useStoredValue(getStorage(), readerPositionKey);
  const needsChinese = locale === 'zh-Hans' || (position !== null && isChineseTranslation(position.translation));
  const isWeb = Platform.OS === 'web';
  const [loaded, setLoaded] = useState(false);
  const ready = isWeb || loaded;

  // The active look's fonts: on start and whenever the look changes.
  useEffect(() => {
    let live = true;
    const done = () => {
      if (live) setLoaded(true);
    };
    ensureLookFonts(theme).then(done, done);
    return () => {
      live = false;
    };
  }, [theme]);

  useEffect(() => {
    if (needsChinese) ensureFont('chineseScripture').catch(() => undefined);
  }, [needsChinese]);

  const told = useRef(false);
  useEffect(() => {
    if (ready && !told.current) {
      told.current = true;
      onReady?.();
    }
  }, [ready, onReady]);

  return ready ? <>{children}</> : null;
}
