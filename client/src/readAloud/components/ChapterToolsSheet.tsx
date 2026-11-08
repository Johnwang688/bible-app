import { useEffect, useRef, useState, type ComponentRef } from 'react';
import { Platform, Pressable, Text, View } from 'react-native';

import type { BookInfo } from '../../api/schemas';
import { uiFace } from '../../fonts/fonts';
import { useT } from '../../i18n/I18nProvider';
import { Icon } from '../../reader/components/icons';
import { SheetModal } from '../../reader/components/SheetModal';
import { buttonStyle } from '../../reader/components/ui';
import { useFocusNodeSoon } from '../../reader/components/a11y';
import type { ReaderTarget } from '../../reader/target';
import type { TranslationId } from '../../reader/translations';
import { ChapterSummaryView } from '../../summary/ChapterSummaryView';
import { useTheme } from '../../theme/ThemeProvider';
import { ctaStyle, SheetHeading } from './parts';

export function ChapterToolsSheet({ title, translation, fromVerse, ready, onStart, onClose, book, chapter, readerTranslation, onOpenRange }: {
  title: string; translation: string; fromVerse: number; ready: boolean; onStart(): void; onClose(): void;
  book: BookInfo; chapter: number; readerTranslation: TranslationId; onOpenRange(target: ReaderTarget): void;
}) {
  const t = useT();
  const theme = useTheme();
  const [summary, setSummary] = useState(false);
  const [focused, setFocused] = useState(false);
  const row = useRef<ComponentRef<typeof View>>(null);
  const returning = useRef(false);
  const focusSoon = useFocusNodeSoon();
  const back = () => {
    if (summary) { returning.current = true; setSummary(false); }
    else onClose();
  };
  useEffect(() => {
    if (!summary && returning.current) { returning.current = false; focusSoon(row.current); }
  }, [summary, focusSoon]);
  return summary ? <SheetModal testID="chapter-tools-sheet" onClose={onClose} onRequestClose={back}>
    <ChapterSummaryView book={book} chapter={chapter} translation={readerTranslation} backLabel={t('summary.backToTools')} onBack={back} onClose={onClose} onOpenRange={onOpenRange} />
  </SheetModal> : <SheetModal testID="chapter-tools-sheet" onClose={onClose} onRequestClose={back}
    header={<SheetHeading title={title} caps={t('readAloud.tools')} onClose={onClose} />}>
    <Pressable ref={row} testID="chapter-summary-open" accessibilityRole="button" onPress={() => setSummary(true)}
      onFocus={() => setFocused(true)} onBlur={() => setFocused(false)}
      style={({ pressed }) => [buttonStyle(theme), { minHeight: 64, margin: 5, padding: 10, flexDirection: 'row', alignItems: 'center', gap: 12, borderRadius: theme.radii.card, opacity: pressed ? 0.7 : 1 },
        Platform.OS === 'web' && focused && { outlineStyle: 'solid', outlineWidth: 3, outlineColor: theme.colors.text, outlineOffset: 2 }]}>
      <View style={[ctaStyle(theme), { width: 44, height: 44, alignItems: 'center', justifyContent: 'center' }]}>
        <Icon name="words" size={22} color={theme.colors.onCta} />
      </View>
      <View style={{ flex: 1, gap: 2 }}>
        <Text style={{ fontSize: 16, color: theme.colors.btnText, fontFamily: uiFace(theme.type.ui, '700') }}>{t('summary.title')}</Text>
        <Text style={{ fontSize: 13, color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400') }}>{t('summary.overview')}</Text>
      </View>
      <Icon name="chevronRight" size={18} color={theme.colors.btnText} />
    </Pressable>
    <Pressable testID="read-aloud-start" accessibilityRole="button" accessibilityState={{ disabled: !ready }} aria-disabled={!ready}
      disabled={!ready} onPress={() => { if (ready) onStart(); }}
      style={({ pressed }) => [buttonStyle(theme), { minHeight: 64, padding: 10, flexDirection: 'row', alignItems: 'center', gap: 12, borderRadius: theme.radii.card, opacity: !ready ? 0.45 : pressed ? 0.7 : 1 }]}>
      <View style={[ctaStyle(theme), { width: 44, height: 44, alignItems: 'center', justifyContent: 'center' }]}>
        <Icon name="play" size={22} color={theme.colors.onCta} filled />
      </View>
      <View style={{ flex: 1, gap: 2 }}>
        <Text style={{ fontSize: 16, color: theme.colors.btnText, fontFamily: uiFace(theme.type.ui, '700') }}>{t('readAloud.row')}</Text>
        <Text style={{ fontSize: 13, color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '400') }}>{t('readAloud.row.from', { n: fromVerse, translation })}</Text>
      </View>
    </Pressable>
  </SheetModal>;
}
