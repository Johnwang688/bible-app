// The commentary view inside the verse sheet (Commentary.dc.html): Matthew Henry's note on the verse, with
// the verse pinned above it. A long note opens as a preview with Read all. Where no note covers the verse the
// view says so. The note is English only, so Chinese readers see the 英文 badge beside a note that is shown.
import { useState } from 'react';
import { ActivityIndicator, Pressable, StyleSheet, Text, View } from 'react-native';
import Svg, { Path } from 'react-native-svg';

import type { BookInfo, ChapterOut } from '../api/schemas';
import { scriptureFace, uiFace } from '../fonts/fonts';
import { useT } from '../i18n/I18nProvider';
import { splitAlternateReadings } from '../reader/alternateReadings';
import { bookName } from '../reader/books';
import { programmaticFocus, useFocusOnMount } from '../reader/components/a11y';
import { EnglishBadge, RoundIconButton, SheetFrame } from '../reader/components/sheetParts';
import { buttonStyle } from '../reader/components/ui';
import type { TranslationId } from '../reader/translations';
import { useScriptureFont } from '../study/components/scriptureFont';
import { formatReference } from '../study/share';
import { useTheme } from '../theme/ThemeProvider';
import { SummaryButton } from '../summary/SummaryButton';
import { commentaryParagraphs, commentaryPreview, entryRange, useVerseCommentary } from './useVerseCommentary';

export interface CommentaryViewProps {
  book: BookInfo;
  chapter: ChapterOut;
  translation: TranslationId;
  /** The verse the view opened for. */
  verse: number;
  onBack(): void;
  onClose(): void;
  onSummary?(): void;
}

export function CommentaryView({ book, chapter, translation, verse, onBack, onClose, onSummary }: CommentaryViewProps) {
  const theme = useTheme();
  const t = useT();
  const titleRef = useFocusOnMount();
  const query = useVerseCommentary(book, chapter.chapter, verse);
  const [expanded, setExpanded] = useState(false);
  const verseFont = useScriptureFont(theme, translation);

  const name = bookName(book, translation);
  const entries = query.data ?? [];
  const failed = query.isError && !query.isFetching;
  const loading = !query.data && !failed;
  const showNote = entries.length > 0;

  const rangeText = (e: (typeof entries)[number]) => {
    const r = entryRange(e);
    return formatReference(
      name,
      chapter.chapter,
      Array.from({ length: r.end - r.start + 1 }, (_, i) => r.start + i),
    );
  };
  const first = entries[0];
  const sub = first ? rangeText(first) : formatReference(name, chapter.chapter, [verse]);

  const bold = uiFace(theme.type.ui, '700');
  const regular = uiFace(theme.type.ui, '400');
  const muted = { color: theme.colors.muted, fontFamily: regular };
  const noteFont = scriptureFace(theme.type.scripture);

  // The verse as the translation has it, without CUV alternate readings.
  const pinned = chapter.verses.find((v) => v.verse === verse);
  const pinnedText = pinned
    ? splitAlternateReadings(pinned.text)
        .filter((run) => !run.note)
        .map((run) => run.text)
        .join('')
    : null;

  const previews = entries.map((e) => commentaryPreview(e.content));
  const readAll = !expanded && previews.some((p) => p.truncated);

  const header = (
    <View style={styles.titleRow}>
      <RoundIconButton testID="commentary-back" label={t('note.back')} icon="chevronLeft" onPress={onBack} />
      <View style={styles.titleText}>
        <Text
          ref={titleRef}
          accessibilityRole="header"
          {...programmaticFocus}
          style={{ color: theme.colors.text, fontFamily: uiFace(theme.type.head, '700'), fontSize: 19 }}
        >
          {t('commentary.title')}
        </Text>
        <Text testID="commentary-range" style={[muted, { fontSize: 13 }]}>
          {sub}
        </Text>
      </View>
      {showNote ? <EnglishBadge /> : null}
      <RoundIconButton testID="sheet-close" label={t('common.close')} icon="close" onPress={onClose} />
    </View>
  );

  let body;
  if (failed) {
    body = (
      <View testID="commentary-error" style={styles.state}>
        <Text style={{ color: theme.colors.text, fontFamily: regular, fontSize: 16 }}>{t('commentary.error')}</Text>
        <SummaryButton
          testID="commentary-retry"
          label={t('common.retry')}
          onPress={() => void query.refetch()}
        />
      </View>
    );
  } else if (loading) {
    body = (
      <View testID="commentary-loading" style={styles.state}>
        <ActivityIndicator accessible={false} color={theme.colors.muted} />
        <Text style={[muted, { fontSize: 14 }]}>{t('common.loading')}</Text>
      </View>
    );
  } else if (!showNote) {
    body = (
      <View testID="commentary-empty" style={styles.empty}>
        <View
          accessible={false}
          importantForAccessibility="no-hide-descendants"
          style={[styles.disc, buttonStyle(theme), { borderRadius: 999 }]}
        >
          <Svg width={26} height={26} viewBox="0 0 24 24" fill="none" accessible={false}>
            <Path
              d="M4 5a2 2 0 0 1 2-2h5v17H6a2 2 0 0 0-2 2zM20 5a2 2 0 0 0-2-2h-5v17h5a2 2 0 0 1 2 2z"
              stroke={theme.colors.muted}
              strokeWidth={1.9}
              strokeLinecap="round"
              strokeLinejoin="round"
            />
          </Svg>
        </View>
        <Text style={{ color: theme.colors.text, fontFamily: uiFace(theme.type.head, '700'), fontSize: 17, textAlign: 'center' }}>
          {t('commentary.emptyTitle')}
        </Text>
        <Text style={[muted, { fontSize: 14, lineHeight: 21, textAlign: 'center' }]}>{t(onSummary ? 'summary.fallback' : 'commentary.emptyBody')}</Text>
        {onSummary ? <SummaryButton testID="commentary-summary" label={t('summary.read')} onPress={onSummary} /> : null}
      </View>
    );
  } else {
    body = (
      <>
        {entries.map((e, i) => (
          <View key={e.id} style={styles.entryWrap}>
            {i > 0 ? <Text style={[muted, { fontSize: 13 }]}>{rangeText(e)}</Text> : null}
            <View testID={`commentary-entry-${e.id}`} style={styles.paragraphs}>
              {commentaryParagraphs(expanded ? e.content : previews[i]!.preview).map((p, j) => (
                <Text key={j} style={{ color: theme.colors.text, fontFamily: noteFont, fontSize: 17, lineHeight: 28 }}>
                  {p}
                </Text>
              ))}
            </View>
          </View>
        ))}
        <View style={styles.footer}>
          <Text style={[muted, { fontSize: 12, flex: 1 }]}>{t('commentary.credit')}</Text>
          {readAll ? (
            <Pressable
              testID="commentary-read-all"
              accessibilityRole="button"
              onPress={() => setExpanded(true)}
              style={[styles.readAll, buttonStyle(theme), { borderRadius: 999 }]}
            >
              <Text style={{ color: theme.colors.btnText, fontFamily: bold, fontSize: 14 }}>{t('commentary.readAll')}</Text>
            </Pressable>
          ) : null}
        </View>
      </>
    );
  }

  return (
    <SheetFrame testID="commentary-view" header={header}>
      {pinnedText !== null ? (
        <View testID="commentary-verse" style={[styles.pinned, { borderLeftColor: theme.colors.accent, backgroundColor: theme.colors.hl }]}>
          <Text style={{ color: theme.colors.hlText, fontFamily: verseFont.fontFamily, fontSize: 16, lineHeight: 24 }}>
            <Text style={{ fontFamily: bold, fontSize: 12 }}>{verse} </Text>
            {pinnedText}
          </Text>
        </View>
      ) : null}
      {body}
    </SheetFrame>
  );
}

const styles = StyleSheet.create({
  titleRow: { flexDirection: 'row', alignItems: 'center', gap: 8 },
  titleText: { flex: 1, gap: 1 },
  pinned: { borderLeftWidth: 4, borderRadius: 4, paddingVertical: 10, paddingHorizontal: 14 },
  entryWrap: { gap: 6 },
  paragraphs: { gap: 12 },
  footer: { flexDirection: 'row', alignItems: 'center', justifyContent: 'space-between', gap: 12 },
  readAll: { minHeight: 44, paddingHorizontal: 16, alignItems: 'center', justifyContent: 'center' },
  state: { gap: 12, paddingVertical: 8, alignItems: 'flex-start' },
  empty: { marginTop: 16, alignItems: 'center', gap: 10, paddingHorizontal: 24 },
  disc: { width: 56, height: 56, alignItems: 'center', justifyContent: 'center' },
});
