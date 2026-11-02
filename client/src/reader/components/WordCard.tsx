// Original words, the word card (Words.dc.html): the lemma, what it means, how the word is parsed in
// this verse, how often it is used and where, with the dictionary's credit. A port of HG-3a.
import { useState } from 'react';
import { ActivityIndicator, Pressable, StyleSheet, Text, View } from 'react-native';

import { uiFace } from '../../fonts/fonts';
import { useI18n, useT } from '../../i18n/I18nProvider';
import { useTheme } from '../../theme/ThemeProvider';
import { findBook, bookNameForLocale, useBooks } from '../books';
import { formatReference } from '../../study';
import { languageOf, useLexicon, type WordRow } from '../words';
import { programmaticFocus, useFocusOnMount } from './a11y';
import { EnglishBadge, RoundIconButton, SheetFrame } from './sheetParts';
import { Icon } from './icons';
import { isRtl, useOriginalFont } from './useLazyFont';
import { buttonStyle } from './ui';

/** How many of a word's other uses the card lists. */
const MAX_REFERENCES = 20;

export function WordCard({
  row,
  onBack,
  onClose,
  onGoTo,
}: {
  row: WordRow;
  onBack(): void;
  onClose(): void;
  /** Take the reader to a reference (closes the sheet). */
  onGoTo(bookNumber: number, chapter: number, verse: number): void;
}) {
  const theme = useTheme();
  const t = useT();
  const { locale, formatNumber } = useI18n();
  const books = useBooks();
  const word = row.words[0]!;
  const lexicon = useLexicon(word.strongs ?? null);
  const entry = lexicon.data;
  const language = languageOf([word]);
  const originalFont = useOriginalFont(language);
  const lemmaRef = useFocusOnMount();
  const [showParsing, setShowParsing] = useState(false);
  const [showDefinition, setShowDefinition] = useState(false);

  const bold = uiFace(theme.type.ui, '700');
  const regular = uiFace(theme.type.ui, '400');
  const muted = { color: theme.colors.muted, fontFamily: regular };
  const body = { color: theme.colors.text, fontFamily: regular };

  const lemma = entry?.lemma ?? word.lemma ?? word.original ?? '';
  const translit = entry?.translit ?? word.translit;
  const gloss = entry?.gloss ?? word.gloss;

  const references = (entry?.references ?? []).slice(0, MAX_REFERENCES);

  return (
    <SheetFrame
      testID="word-card"
      header={
        <View style={styles.titleRow}>
          <RoundIconButton testID="word-back" label={t('words.backToList')} icon="chevronLeft" onPress={onBack} />
          <Text
            ref={lemmaRef}
            accessibilityRole="header"
            {...programmaticFocus}
            style={[
              styles.lemma,
              { color: theme.colors.text, fontFamily: originalFont },
              isRtl(language) ? { writingDirection: 'rtl', textAlign: 'right' } : null,
            ]}
          >
            {lemma}
          </Text>
          <RoundIconButton testID="sheet-close" label={t('common.close')} icon="close" onPress={onClose} />
        </View>
      }
    >
      {translit || gloss ? (
        <View style={styles.line}>
          <Text style={[muted, { fontSize: 15 }]}>{[translit, gloss].filter(Boolean).join(' · ')}</Text>
          {gloss ? <EnglishBadge /> : null}
        </View>
      ) : null}
      {word.grammar ? <Text style={[body, { fontSize: 14 }]}>{word.grammar}</Text> : null}
      {word.parsing ? (
        <>
          <ToggleButton testID="word-more" label={t(showParsing ? 'words.less' : 'words.more')} open={showParsing} onPress={() => setShowParsing((v) => !v)} />
          {showParsing ? (
            <Text testID="word-parsing" style={[muted, { fontSize: 14 }]}>
              {word.parsing}
            </Text>
          ) : null}
        </>
      ) : null}
      {word.footnote ? <Text style={[muted, { fontSize: 14 }]}>{word.footnote}</Text> : null}

      {!word.strongs ? <Text style={[muted, { fontSize: 15 }]}>{t('words.noEntry')}</Text> : null}
      {word.strongs && lexicon.isError && !lexicon.isFetching ? (
        <View style={styles.state}>
          <Text style={[body, { fontSize: 16 }]}>{t('words.error')}</Text>
          <Pressable
            testID="word-retry"
            accessibilityRole="button"
            onPress={() => void lexicon.refetch()}
            style={[styles.retry, { backgroundColor: theme.colors.cta }]}
          >
            <Text style={{ color: theme.colors.onCta, fontFamily: bold, fontSize: 15 }}>{t('common.retry')}</Text>
          </Pressable>
        </View>
      ) : null}
      {word.strongs && !entry && !(lexicon.isError && !lexicon.isFetching) ? (
        <ActivityIndicator accessibilityLabel={t('common.loading')} color={theme.colors.muted} />
      ) : null}

      {entry ? (
        <>
          <Text style={[body, { fontSize: 15, fontFamily: bold }]}>
            {t('words.uses', { occurrences: formatNumber(entry.occurrences), verses: formatNumber(entry.verse_count) })}
          </Text>
          {references.length > 0 ? (
            <View style={styles.refs}>
              {references.map((ref, i) => {
                const refBook = findBook(books.data, ref.book_number);
                const name = refBook ? bookNameForLocale(refBook, locale) : ref.book;
                const label = formatReference(name, ref.chapter, [ref.verse]);
                return (
                  <Pressable
                    key={`${ref.book_number}:${ref.chapter}:${ref.verse}`}
                    testID={`word-ref-${i}`}
                    accessibilityRole="button"
                    accessibilityLabel={label}
                    onPress={() => onGoTo(ref.book_number, ref.chapter, ref.verse)}
                    style={[styles.ref, buttonStyle(theme)]}
                  >
                    <Text style={{ color: theme.colors.btnText, fontFamily: bold, fontSize: 14 }}>{label}</Text>
                  </Pressable>
                );
              })}
            </View>
          ) : null}
          {entry.definition ? (
            <>
              <Pressable
                testID="word-full-definition"
                accessibilityRole="button"
                accessibilityState={{ expanded: showDefinition }}
                onPress={() => setShowDefinition((v) => !v)}
                style={[styles.definitionToggle, buttonStyle(theme)]}
              >
                <Text style={{ color: theme.colors.btnText, fontFamily: bold, fontSize: 15 }}>{t('words.fullDefinition')}</Text>
                <Icon name={showDefinition ? 'chevronDown' : 'chevronRight'} size={18} color={theme.colors.btnText} />
              </Pressable>
              {showDefinition ? (
                <View style={styles.definition}>
                  <EnglishBadge />
                  <Text testID="word-definition" style={[body, { fontSize: 14, lineHeight: 21 }]}>
                    {entry.definition}
                  </Text>
                </View>
              ) : null}
            </>
          ) : null}
          <Text style={[muted, { fontSize: 12 }]}>{entry.source}</Text>
        </>
      ) : null}
      <Text style={[muted, { fontSize: 12 }]}>{t('words.credit')}</Text>
    </SheetFrame>
  );
}

function ToggleButton({ testID, label, open, onPress }: { testID: string; label: string; open: boolean; onPress(): void }) {
  const theme = useTheme();
  return (
    <Pressable
      testID={testID}
      accessibilityRole="button"
      accessibilityState={{ expanded: open }}
      onPress={onPress}
      style={[styles.toggle, buttonStyle(theme)]}
    >
      <Text style={{ color: theme.colors.btnText, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 15 }}>{label}</Text>
    </Pressable>
  );
}

const styles = StyleSheet.create({
  titleRow: { flexDirection: 'row', alignItems: 'center', gap: 8 },
  lemma: { flex: 1, fontSize: 32, lineHeight: 40 },
  line: { flexDirection: 'row', alignItems: 'center', gap: 8, flexWrap: 'wrap' },
  toggle: { minHeight: 44, paddingHorizontal: 16, alignSelf: 'flex-start', alignItems: 'center', justifyContent: 'center' },
  state: { gap: 12, alignItems: 'flex-start' },
  retry: { minHeight: 44, paddingHorizontal: 20, borderRadius: 999, alignItems: 'center', justifyContent: 'center' },
  refs: { flexDirection: 'row', flexWrap: 'wrap', gap: 8 },
  ref: { minHeight: 44, paddingHorizontal: 14, alignItems: 'center', justifyContent: 'center' },
  definitionToggle: {
    minHeight: 50,
    paddingHorizontal: 16,
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
  },
  definition: { gap: 8, alignItems: 'flex-start' },
});
