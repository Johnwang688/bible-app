import { useEffect, useMemo, useRef } from 'react';
import { ActivityIndicator, Platform, Text, View } from 'react-native';

import type { BookInfo } from '../api/schemas';
import { scriptureFace, uiFace } from '../fonts/fonts';
import { useI18n, useT } from '../i18n/I18nProvider';
import { bookName, useBooks } from '../reader/books';
import { announce, programmaticFocus, useFocusOnMount } from '../reader/components/a11y';
import { EnglishBadge, SheetFrame } from '../reader/components/sheetParts';
import type { ReaderTarget } from '../reader/target';
import type { TranslationId } from '../reader/translations';
import { formatReference } from '../study/share';
import { useTheme } from '../theme/ThemeProvider';
import { parseSummary } from './parseSummary';
import { SummaryButton } from './SummaryButton';
import { useChapterSummary } from './useChapterSummary';

export function ChapterSummaryView({ book, chapter, translation, backLabel, onBack, onClose, onOpenRange }: {
  book: BookInfo; chapter: number; translation: TranslationId;
  /** Where Back goes, for screen readers: the tools list or the commentary. */
  backLabel: string;
  onBack(): void; onClose(): void; onOpenRange(target: ReaderTarget): void;
}) {
  const theme = useTheme();
  const t = useT();
  const { locale } = useI18n();
  const heading = useFocusOnMount();
  const query = useChapterSummary(book, chapter);
  const books = useBooks();
  const content = query.data?.find((r) => r.source === 'summary')?.content ?? '';
  const summary = useMemo(() => parseSummary(content, books.data ?? [book]), [content, books.data, book]);
  const state = query.isError && !query.isFetching ? 'error' : !query.data ? 'loading' : summary ? 'ready' : 'empty';
  const message = t(state === 'ready' ? 'summary.loaded' : `summary.${state}`);
  const announced = useRef('');
  useEffect(() => {
    if (announced.current !== message) { announce(message); announced.current = message; }
  }, [message]);
  const regular = uiFace(theme.type.ui, '400');
  const bold = uiFace(theme.type.ui, '700');
  const english = Platform.OS === 'web' ? { lang: 'en' } : {};
  const header = <View style={{ flexDirection: 'row', alignItems: 'center', gap: 8 }}>
    <SummaryButton testID="summary-back" label={backLabel} icon="chevronLeft" onPress={onBack} />
    <View style={{ flex: 1, minWidth: 0, gap: 1 }}>
      <Text ref={heading} {...programmaticFocus} accessibilityRole="header" style={{ color: theme.colors.text, fontFamily: uiFace(theme.type.head, '700'), fontSize: 19 }}>{t('summary.title')}</Text>
      <Text testID="summary-chapter" style={{ color: theme.colors.muted, fontFamily: regular, fontSize: 13, flexShrink: 1 }}>{t('reader.chapterTitle', { book: bookName(book, translation), chapter })}</Text>
    </View>
    <EnglishBadge />
    <SummaryButton testID="summary-close" label={t('common.close')} icon="close" onPress={onClose} />
  </View>;
  return <SheetFrame testID="summary-view" header={header}>
    {state === 'ready' && summary ? <>
      {summary.title ? <Text testID="summary-content-title" {...english} accessibilityRole="header" style={{ color: theme.colors.text, fontFamily: uiFace(theme.type.head, '700'), fontSize: 24 }}>{summary.title}</Text> : null}
      {summary.paragraphs.map((p, i) => <Text key={i} {...english} style={{ color: theme.colors.text, fontFamily: scriptureFace(theme.type.scripture), fontSize: 17, lineHeight: 28 }}>{p}</Text>)}
      {summary.points.length ? <View testID="summary-points" style={{ gap: 16, marginTop: 12 }}>
        <Text accessibilityRole="header" style={{ color: theme.colors.text, fontFamily: bold, fontSize: 16 }}>{t('summary.keyPoints')}</Text>
        {summary.points.map((point, i) => {
          const targetBook = point.target && (books.data ?? [book]).find((b) => b.book_number === point.target!.bookNumber);
          const ref = point.target && targetBook ? formatReference(bookName(targetBook, translation), point.target.chapter,
            Array.from({ length: point.target.end - point.target.start + 1 }, (_, n) => point.target!.start + n)) : null;
          return <View key={i} testID={`summary-point-${i}`} style={{ gap: 5, paddingLeft: 12 }}>
            <Text {...english} style={{ color: theme.colors.text, fontFamily: scriptureFace(theme.type.scripture), fontSize: 16, lineHeight: 26 }}><Text accessible={false} aria-hidden>• </Text>{point.text}</Text>
            {ref && point.target ? <SummaryButton testID={`summary-reference-${i}`} link label={ref}
              accessibilityLabel={t('summary.readReference', { ref, verse: point.target.start })}
              onPress={() => { announce(t('summary.opened', { ref })); onOpenRange(point.target!); }} /> : null}
          </View>;
        })}
      </View> : null}
      <Text testID="summary-footnote" style={{ marginTop: 6, paddingTop: 14, borderTopWidth: 1, borderTopColor: theme.colors.muted, color: theme.colors.muted, fontFamily: regular, fontSize: 13, lineHeight: 21 }}>
        <Text style={{ color: theme.colors.text, fontFamily: bold }}>{t('summary.ai')}</Text>{locale === 'zh-Hans' ? '' : ' '}{t('summary.disclaimer')}
      </Text>
    </> : <View testID={`summary-${state}`} style={{ gap: 12, paddingVertical: 8, alignItems: 'flex-start' }}>
      {state === 'loading' ? <ActivityIndicator accessible={false} color={theme.colors.muted} /> : null}
      <Text style={{ color: theme.colors.text, fontFamily: regular, fontSize: 16 }}>{message}</Text>
      {state === 'error' ? <SummaryButton testID="summary-retry" label={t('common.retry')} onPress={() => void query.refetch()} /> : null}
    </View>}
  </SheetFrame>;
}
