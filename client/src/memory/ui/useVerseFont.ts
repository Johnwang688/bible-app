// The face a verse is drawn in: the reader's English Scripture face for an English verse (as the reader draws the
// BSB), the lazily loaded Chinese face for a Chinese one.
import { scriptureFace } from '../../fonts/fonts';
import { useTheme } from '../../theme/ThemeProvider';
import type { VerseLanguage } from '../verseLanguage';
import { useChineseFont } from './useChineseFont';

export function useVerseFont(language: VerseLanguage): string | undefined {
  const theme = useTheme();
  const chinese = useChineseFont(language === 'zh');
  return language === 'en' ? scriptureFace(theme.type.scripture) : chinese;
}
