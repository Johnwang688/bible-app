// The verse sheet (the bottom of Reader.dc.html): acts on the selected verses. Its actions view holds
// the highlight swatches and the note, bookmark, copy, share and Original words actions; the note
// editor, the word list, the word card and the commentary are views inside the same sheet.
// Closing the sheet discards the view, so reopening always starts on the actions. An unsaved note is kept per
// verse (`../noteDrafts`) until it is saved or deleted, so a chapter change under the editor loses no typing.
import * as Clipboard from 'expo-clipboard';
import { useEffect, useLayoutEffect, useMemo, useRef, useState } from 'react';
import { BackHandler, Platform, Pressable, Share, StyleSheet, Text, View } from 'react-native';

import type { BookInfo, ChapterOut } from '../../api/schemas';
import { CommentaryView } from '../../commentary/CommentaryView';
import { useEscapeKey } from '../../components/escapeStack';
import { uiFace } from '../../fonts/fonts';
import { useT } from '../../i18n/I18nProvider';
import type { VerseRef } from '../../storage/keys';
import { formatReference, shareText, type StudyItemsApi } from '../../study';
import { HIGHLIGHT_IDS, HIGHLIGHTS, type HighlightId } from '../../theme/highlights';
import { useTheme } from '../../theme/ThemeProvider';
import { ChapterSummaryView } from '../../summary/ChapterSummaryView';
import type { ReaderTarget } from '../target';
import { bookName } from '../books';
import { clearNoteDraft, keepNoteDraft, noteDraftOf } from '../noteDrafts';
import { isChineseTranslation, TRANSLATIONS, type TranslationId } from '../translations';
import type { WordRow } from '../words';
import { announce, programmaticFocus, useFocusOnMount } from './a11y';
import { Icon, type IconName } from './icons';
import { NoteEditor } from './NoteEditor';
import { SheetModal } from './SheetModal';
import { useTabFocused } from './useTabFocused';
import { RoundIconButton, SheetFrame } from './sheetParts';
import { buttonStyle } from './ui';
import { WordCard } from './WordCard';
import { WordsList } from './WordsList';

// A sub-view is bound to the verse it opened for (the first verse of the selection at that moment).
//
// The rule for a selection change while a sub-view is open: the sub-view keeps its target. The sheet is
// not modal, so tapping or long-pressing verses still changes the selection shown in the chapter, but the
// note editor keeps its verse, its title and the text typed so far, and Save writes to that verse only;
// the words list, the word card and the commentary stay on their verse too. Stepping back to the actions shows the
// current selection. So a draft is never discarded by a tap, and never lands on another verse's note.
type SheetView =
  | { name: 'actions' }
  | { name: 'note'; verse: number }
  | { name: 'commentary'; verse: number }
  | { name: 'summary'; verse: number }
  | { name: 'words'; verse: number }
  | { name: 'word'; verse: number; row: WordRow };

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
  onOpenRange(target: ReaderTarget): void;
  /**
   * A modal sheet (the book picker, version picker or reading settings) is open above this one. The topmost
   * sheet handles Escape and the back button, so this sheet ignores them while covered.
   */
  covered?: boolean;
}

export function VerseSheet({ book, chapter, translation, start, end, study, onClose, onHeight, onGoTo, onOpenRange, covered = false }: VerseSheetProps) {
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
  const reference = formatReference(bookName(book, translation), chapter.chapter, verses);
  const refOf = (verse: number): VerseRef => ({ bookNumber: chapter.book_number, chapter: chapter.chapter, verse });
  const referenceOf = (verse: number) => formatReference(bookName(book, translation), chapter.chapter, [verse]);

  // The actions view follows the live selection; its note action is about the first selected verse.
  const hasNote = study.noteOf(refs[0]!) !== null;
  const allBookmarked = refs.every((r) => study.isBookmarked(r));

  // The one way back. Every back control (each sub-view's back button), Escape and the Android back
  // button come through here: it steps back one view, then closes. Back from a word card returns the list
  // to where it was scrolled, with the row that was open focused.
  const back = () => {
    switch (view.name) {
      case 'actions':
        onClose();
        return;
      case 'word':
        setRestore({ y: listScrollY.current, key: view.row.key });
        setView({ name: 'words', verse: view.verse });
        return;
      case 'summary':
        setView({ name: 'commentary', verse: view.verse });
        return;
      default:
        setView({ name: 'actions' });
    }
  };

  // The sheet is not a Modal (the chapter stays usable above it), so it takes Escape (web) and the hardware back
  // button (Android) itself, but only while it is the topmost sheet and its tab is the one showing. Escape goes
  // through the shared Escape stack: a sheet or screen opened above this one takes the press first. The ref is set
  // in the layout phase, in the same commit that opens or closes a covering sheet, before another key can arrive.
  const focused = useTabFocused();
  useEscapeKey(back, { enabled: !covered && focused });
  const latest = useRef({ back, covered });
  useLayoutEffect(() => {
    latest.current = { back, covered };
  });
  useEffect(() => {
    if (Platform.OS === 'web') return;
    const sub = BackHandler.addEventListener('hardwareBackPress', () => {
      // Covered: not handled here, so the topmost sheet (or the system) gets the press.
      if (latest.current.covered) return false;
      latest.current.back();
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

  // Saving and deleting write to the verse the editor is bound to, never to the live selection.
  // Both clear the verse's unsaved draft (`noteDrafts`); a failed save keeps it.
  const saveNote = (verse: number, value: string) => {
    try {
      study.setNote(refOf(verse), value);
    } catch {
      return; // over the limit: the editor already says so and keeps the old note
    }
    clearNoteDraft(refOf(verse));
    announce(t('note.saved'));
    setView({ name: 'actions' });
  };

  const deleteNote = (verse: number) => {
    study.setNote(refOf(verse), '');
    clearNoteDraft(refOf(verse));
    setView({ name: 'actions' });
  };

  let content;
  switch (view.name) {
    case 'note': {
      const verse = view.verse;
      const saved = study.noteOf(refOf(verse));
      content = (
        <NoteEditor
          reference={referenceOf(verse)}
          initial={saved?.text ?? null}
          draft={noteDraftOf(refOf(verse), saved)}
          onDraft={(text) => keepNoteDraft(refOf(verse), text, study.noteOf(refOf(verse)))}
          onBack={back}
          onClose={onClose}
          onSave={(value) => saveNote(verse, value)}
          onDelete={() => deleteNote(verse)}
        />
      );
      break;
    }
    case 'commentary':
      content = (
        <CommentaryView book={book} chapter={chapter} translation={translation} verse={view.verse} onBack={back} onClose={onClose}
          onSummary={() => setView({ name: 'summary', verse: view.verse })} />
      );
      break;
    case 'summary':
      content = <ChapterSummaryView book={book} chapter={chapter.chapter} translation={translation} onBack={back} onClose={onClose} onOpenRange={onOpenRange} />;
      break;
    case 'words': {
      const verse = view.verse;
      content = (
        <WordsList
          book={book}
          chapter={chapter.chapter}
          verse={verse}
          reference={referenceOf(verse)}
          onBack={back}
          onClose={onClose}
          onOpenWord={(row) => setView({ name: 'word', verse, row })}
          onScrolled={(y) => {
            listScrollY.current = y;
          }}
          restoreScrollY={restore?.y}
          restoreFocusKey={restore?.key}
        />
      );
      break;
    }
    case 'word':
      content = <WordCard row={view.row} onBack={back} onClose={onClose} onGoTo={onGoTo} />;
      break;
    default:
      content = (
        <Actions
          reference={reference}
          study={study}
          refs={refs}
          hasNote={hasNote}
          allBookmarked={allBookmarked}
          onClose={onClose}
          onHighlight={highlight}
          onNote={() => setView({ name: 'note', verse: start })}
          onBookmark={toggleBookmark}
          onCopy={() => void copy()}
          onShare={() => void share()}
          onWords={() => {
            setRestore(null);
            setView({ name: 'words', verse: start });
          }}
          onCommentary={() => setView({ name: 'commentary', verse: start })}
        />
      );
  }

  return (
    <SheetModal testID="verse-sheet" modal={false} dock onClose={onClose} onHeight={onHeight} avoidKeyboard={view.name === 'note'}>
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
