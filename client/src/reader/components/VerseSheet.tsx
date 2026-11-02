// The verse sheet (the bottom of Reader.dc.html): acts on the selected verses. Its actions view holds
// the highlight swatches and the note, bookmark, copy, share and Original words actions; the note
// editor, the word list, the word card and the commentary placeholder are views inside the same sheet.
// Closing the sheet discards the view, so reopening always starts on the actions.
import * as Clipboard from 'expo-clipboard';
import { useCallback, useEffect, useMemo, useRef, useState } from 'react';
import { BackHandler, Platform, Pressable, Share, StyleSheet, Text, View } from 'react-native';

import type { BookInfo, ChapterOut } from '../../api/schemas';
import { uiFace } from '../../fonts/fonts';
import { useT } from '../../i18n/I18nProvider';
import type { VerseRef } from '../../storage/keys';
import { formatReference, shareText, type StudyItemsApi } from '../../study';
import { HIGHLIGHT_IDS, HIGHLIGHTS, type HighlightId } from '../../theme/highlights';
import { useTheme } from '../../theme/ThemeProvider';
import { bookName } from '../books';
import { isChineseTranslation, TRANSLATIONS, type TranslationId } from '../translations';
import type { WordRow } from '../words';
import { announce, programmaticFocus, useFocusOnMount } from './a11y';
import { CommentaryPlaceholder } from './CommentaryPlaceholder';
import { Icon, type IconName } from './icons';
import { NoteEditor } from './NoteEditor';
import { SheetModal } from './SheetModal';
import { RoundIconButton, SheetFrame } from './sheetParts';
import { buttonStyle } from './ui';
import { WordCard } from './WordCard';
import { WordsList } from './WordsList';

type SheetView = { name: 'actions' } | { name: 'note' } | { name: 'commentary' } | { name: 'words' } | { name: 'word'; row: WordRow };

export interface VerseSheetProps {
  book: BookInfo;
  /** The first translation's chapter: its text is what copy and share send. */
  chapter: ChapterOut;
  translation: TranslationId;
  /** The selected verses, `start` to `end`. */
  start: number;
  end: number;
  study: StudyItemsApi;
  onClose(): void;
  /** The sheet's height, so the chapter keeps every verse scrollable above it. */
  onHeight?(height: number): void;
  /** Take the reader to a reference from a word card (the screen closes the sheet). */
  onGoTo(bookNumber: number, chapter: number, verse: number): void;
}

export function VerseSheet({ book, chapter, translation, start, end, study, onClose, onHeight, onGoTo }: VerseSheetProps) {
  const t = useT();
  const [view, setView] = useState<SheetView>({ name: 'actions' });
  // Coming back from a word card: where the list was scrolled to, and the row that was open.
  const listScrollY = useRef(0);
  const [restore, setRestore] = useState<{ y: number; key: string } | null>(null);

  const verses = useMemo(() => Array.from({ length: end - start + 1 }, (_, i) => start + i), [start, end]);
  const refs = useMemo<VerseRef[]>(
    () => verses.map((verse) => ({ bookNumber: chapter.book_number, chapter: chapter.chapter, verse })),
    [verses, chapter.book_number, chapter.chapter],
  );
  const firstRef = refs[0]!;
  const reference = formatReference(bookName(book, translation), chapter.chapter, verses);
  const firstReference = formatReference(bookName(book, translation), chapter.chapter, [start]);

  const note = study.noteOf(firstRef);
  const allBookmarked = refs.every((r) => study.isBookmarked(r));
  const toActions = useCallback(() => setView({ name: 'actions' }), []);

  // Every way back from a word card (its back button, Escape, the Android back button) comes through here,
  // so the list always returns to where it was scrolled, with the row that was open focused.
  const closeWord = (row: WordRow) => {
    setRestore({ y: listScrollY.current, key: row.key });
    setView({ name: 'words' });
  };

  // Escape and the back button step back one view, then close.
  const back = () => {
    if (view.name === 'actions') onClose();
    else if (view.name === 'word') closeWord(view.row);
    else setView({ name: 'actions' });
  };

  // The sheet is not a Modal (the chapter stays usable above it), so it listens for Escape (web) and the
  // hardware back button (Android) itself.
  const backRef = useRef(back);
  useEffect(() => {
    backRef.current = back;
  });
  useEffect(() => {
    if (Platform.OS === 'web') {
      if (typeof document === 'undefined') return;
      const onKeyDown = (e: KeyboardEvent) => {
        if (e.key !== 'Escape' || e.repeat) return;
        e.preventDefault();
        backRef.current();
      };
      document.addEventListener('keydown', onKeyDown);
      return () => document.removeEventListener('keydown', onKeyDown);
    }
    const sub = BackHandler.addEventListener('hardwareBackPress', () => {
      backRef.current();
      return true;
    });
    return () => sub.remove();
  }, []);

  const highlight = (id: HighlightId) => {
    const selected = refs.every((r) => study.highlightOf(r) === id);
    study.setHighlight(refs, selected ? null : id);
    announce(selected ? t('sheet.highlightRemoved') : t('sheet.highlighted', { colour: t(HIGHLIGHTS[id].nameKey) }));
  };

  const toggleBookmark = () => {
    study.toggleBookmark(refs);
    announce(t(allBookmarked ? 'sheet.bookmarkRemoved' : 'sheet.bookmarkAdded'));
  };

  const text = () => {
    const selected = chapter.verses.filter((v) => v.verse >= start && v.verse <= end);
    return shareText(selected, reference, t(TRANSLATIONS[translation].shortKey), isChineseTranslation(translation) ? 'zh' : 'en');
  };

  const copy = async () => {
    try {
      await Clipboard.setStringAsync(text());
      announce(t('sheet.copied'));
    } catch {
      // The clipboard is unavailable; there is nothing more to do.
    }
  };

  const share = async () => {
    // Browsers without the Web Share API (most desktops) cannot share, so copying is the way out.
    if (Platform.OS === 'web' && (typeof navigator === 'undefined' || !('share' in navigator))) {
      await copy();
      return;
    }
    try {
      await Share.share({ message: text() });
    } catch {
      // Dismissed or failed: the share sheet reported it.
    }
  };

  const saveNote = (value: string) => {
    try {
      study.setNote(firstRef, value);
    } catch {
      return; // over the limit: the editor already says so and keeps the old note
    }
    announce(t('note.saved'));
    toActions();
  };

  const deleteNote = () => {
    study.setNote(firstRef, '');
    toActions();
  };

  let content;
  switch (view.name) {
    case 'note':
      content = (
        <NoteEditor reference={firstReference} initial={note?.text ?? null} onBack={toActions} onClose={onClose} onSave={saveNote} onDelete={deleteNote} />
      );
      break;
    case 'commentary':
      content = <CommentaryPlaceholder onBack={toActions} onClose={onClose} />;
      break;
    case 'words':
      content = (
        <WordsList
          book={book}
          chapter={chapter.chapter}
          verse={start}
          reference={firstReference}
          onBack={toActions}
          onClose={onClose}
          onOpenWord={(row) => setView({ name: 'word', row })}
          onScrolled={(y) => {
            listScrollY.current = y;
          }}
          restoreScrollY={restore?.y}
          restoreFocusKey={restore?.key}
        />
      );
      break;
    case 'word': {
      const row = view.row;
      content = (
        <WordCard
          row={row}
          onBack={() => closeWord(row)}
          onClose={onClose}
          onGoTo={onGoTo}
        />
      );
      break;
    }
    default:
      content = (
        <Actions
          reference={reference}
          study={study}
          refs={refs}
          hasNote={note !== null}
          allBookmarked={allBookmarked}
          onClose={onClose}
          onHighlight={highlight}
          onNote={() => setView({ name: 'note' })}
          onBookmark={toggleBookmark}
          onCopy={() => void copy()}
          onShare={() => void share()}
          onWords={() => {
            setRestore(null);
            setView({ name: 'words' });
          }}
          onCommentary={() => setView({ name: 'commentary' })}
        />
      );
  }

  return (
    <SheetModal testID="verse-sheet" modal={false} onClose={onClose} onHeight={onHeight} avoidKeyboard={view.name === 'note'}>
      <View style={styles.views}>
        {content}
      </View>
    </SheetModal>
  );
}

function Actions({
  reference,
  study,
  refs,
  hasNote,
  allBookmarked,
  onClose,
  onHighlight,
  onNote,
  onBookmark,
  onCopy,
  onShare,
  onWords,
  onCommentary,
}: {
  reference: string;
  study: StudyItemsApi;
  refs: VerseRef[];
  hasNote: boolean;
  allBookmarked: boolean;
  onClose(): void;
  onHighlight(id: HighlightId): void;
  onNote(): void;
  onBookmark(): void;
  onCopy(): void;
  onShare(): void;
  onWords(): void;
  onCommentary(): void;
}) {
  const theme = useTheme();
  const t = useT();
  const titleRef = useFocusOnMount();
  const bold = uiFace(theme.type.ui, '700');
  const swatchRadius = Math.min(theme.radii.swatch, 22);

  return (
    <SheetFrame
      testID="sheet-actions"
      header={
        <View style={styles.titleRow}>
          <Text
            ref={titleRef}
            accessibilityRole="header"
            {...programmaticFocus}
            style={[styles.title, { color: theme.colors.text, fontFamily: uiFace(theme.type.head, '700') }]}
          >
            {reference}
          </Text>
          <RoundIconButton testID="sheet-close" label={t('common.close')} icon="close" onPress={onClose} />
        </View>
      }
    >
      <View style={styles.swatches}>
        {HIGHLIGHT_IDS.map((id) => {
          const selected = refs.every((r) => study.highlightOf(r) === id);
          return (
            <Pressable
              key={id}
              testID={`sheet-swatch-${id}`}
              accessibilityRole="button"
              accessibilityLabel={t('sheet.highlight', { colour: t(HIGHLIGHTS[id].nameKey) })}
              accessibilityState={{ selected }}
              onPress={() => onHighlight(id)}
              style={[styles.swatch, { borderRadius: swatchRadius, borderColor: selected ? theme.colors.text : 'transparent' }]}
            >
              <View style={[styles.swatchFill, { borderRadius: Math.max(0, swatchRadius - 3), backgroundColor: HIGHLIGHTS[id].swatch }]} />
            </Pressable>
          );
        })}
      </View>
      <View style={styles.actions}>
        <ActionButton testID="sheet-note" icon="note" label={t(hasNote ? 'sheet.editNote' : 'sheet.note')} on={hasNote} onPress={onNote} />
        <ActionButton
          testID="sheet-bookmark"
          icon="bookmark"
          label={t(allBookmarked ? 'sheet.removeBookmark' : 'sheet.bookmark')}
          on={allBookmarked}
          onPress={onBookmark}
        />
        <ActionButton testID="sheet-copy" icon="copy" label={t('sheet.copy')} onPress={onCopy} />
        <ActionButton testID="sheet-share" icon="share" label={t('sheet.share')} onPress={onShare} />
        <ActionButton testID="sheet-original-words" icon="words" label={t('sheet.originalWords')} onPress={onWords} />
      </View>
      <Pressable
        testID="sheet-commentary"
        accessibilityRole="button"
        accessibilityLabel={t('sheet.commentary')}
        onPress={onCommentary}
        style={[styles.commentary, buttonStyle(theme)]}
      >
        <Text style={{ color: theme.colors.btnText, fontFamily: bold, fontSize: 15, flex: 1 }}>{t('sheet.commentary')}</Text>
        <Icon name="chevronRight" size={18} color={theme.colors.btnText} />
      </Pressable>
    </SheetFrame>
  );
}

/** An action tile: an icon over its label. A filled tile means the action is on (a note or bookmark exists). */
function ActionButton({
  testID,
  icon,
  label,
  on = false,
  onPress,
}: {
  testID: string;
  icon: IconName;
  label: string;
  on?: boolean;
  onPress(): void;
}) {
  const theme = useTheme();
  const colour = on ? theme.colors.onAccent : theme.colors.btnText;
  return (
    <Pressable
      testID={testID}
      accessibilityRole="button"
      accessibilityLabel={label}
      onPress={onPress}
      style={[styles.action, buttonStyle(theme), on && { backgroundColor: theme.colors.accent }]}
    >
      <Icon name={icon} size={22} strokeWidth={1.9} color={colour} />
      <Text numberOfLines={2} style={[styles.actionLabel, { color: colour, fontFamily: uiFace(theme.type.ui, '700') }]}>
        {label}
      </Text>
    </Pressable>
  );
}

const styles = StyleSheet.create({
  views: { flexShrink: 1, minHeight: 0 },
  titleRow: { flexDirection: 'row', alignItems: 'center', justifyContent: 'space-between', gap: 8 },
  title: { flex: 1, fontSize: 20 },
  swatches: { flexDirection: 'row', justifyContent: 'space-between' },
  swatch: { width: 44, height: 44, borderWidth: 2, padding: 3 },
  swatchFill: { flex: 1 },
  actions: { flexDirection: 'row', flexWrap: 'wrap', gap: 6 },
  action: { flexGrow: 1, flexBasis: 0, minWidth: 62, minHeight: 68, paddingHorizontal: 0, alignItems: 'center', justifyContent: 'center', gap: 5 },
  // 11 pt, no side padding: a one-word label (Bookmark) fits a 63 px tile at a 150% display scale. On the web
  // overflowWrap stays normal, so a word is never broken in the middle; only the gap between words wraps.
  actionLabel: { fontSize: 11, textAlign: 'center', ...(Platform.OS === 'web' ? ({ overflowWrap: 'normal', wordBreak: 'normal' } as object) : null) },
  commentary: { minHeight: 52, paddingHorizontal: 16, flexDirection: 'row', alignItems: 'center', justifyContent: 'space-between' },
});
