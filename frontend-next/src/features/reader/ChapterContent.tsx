'use client';

import type { Dispatch, RefObject, SetStateAction } from 'react';
import { MasteryStrip } from '@/components/ChapterQuiz';
import type { AuthSession } from '@/lib/account';
import type { BookInfo, ChapterData, ReaderSettings, ReadingProgress, SavedPassage, SidePanelMode, VerseData, VerseNote } from '@/features/reader/types';
import { READER_HIGHLIGHT_PRESETS, isPagedReadingMode } from '@/features/reader/settings';
import { formatVerseGroupRef, splitVersesForBookMode, verseStorageKey } from '@/features/reader/layout';
import { ONBOARDING_STORAGE_KEY } from '@/features/progress/progress';
import { buildExplainVersePrompt } from '@/features/ai/prompts';

export interface ChapterContentProps {
  chapterLoading: boolean;
  chapterError: boolean;
  chapterData: ChapterData | null;
  chapter: number;
  translation: string;
  currentBook: BookInfo | null;
  chapterBookLabel: string;
  readerSettings: ReaderSettings;
  setReaderSettings: Dispatch<SetStateAction<ReaderSettings>>;
  pagedPageSlices: VerseData[][] | null;
  chapterSpreadIndex: number;
  animClass: string;
  setAnimClass: Dispatch<SetStateAction<string>>;
  setChapterData: Dispatch<SetStateAction<ChapterData | null>>;
  setChapterLoading: Dispatch<SetStateAction<boolean>>;
  pagedFlipAnim: string;
  setPagedFlipAnim: Dispatch<SetStateAction<string>>;
  aiNavHighlight: { start: number; end: number } | null;
  highlightedVerses: string[];
  bookmarkedVerses: string[];
  verseNotes: Record<string, VerseNote>;
  setVerseNotes: Dispatch<SetStateAction<Record<string, VerseNote>>>;
  selectedVerse: number | null;
  setSelectedVerse: Dispatch<SetStateAction<number | null>>;
  selectedVerseGroup: number[];
  setSelectedVerseGroup: Dispatch<SetStateAction<number[]>>;
  selectedVerseData: VerseData | null;
  selectedVerseKey: string | null;
  selectedVerseNote: VerseNote | undefined;
  selectedVerseHighlighted: boolean;
  versePopupPos: { top: number; left: number } | null;
  setVersePopupPos: Dispatch<SetStateAction<{ top: number; left: number } | null>>;
  showVerseNoteEditor: boolean;
  setShowVerseNoteEditor: Dispatch<SetStateAction<boolean>>;
  currentNoteDraft: string;
  setCurrentNoteDraft: Dispatch<SetStateAction<string>>;
  closeVerseStudyPopup: () => void;
  toggleVerseHighlight: () => void;
  saveVerseNote: () => void;
  copySelectedVerse: () => Promise<void>;
  tutorialVerseToolsNavBlocked: boolean;
  openSidePanel: (mode: Exclude<SidePanelMode, 'none'>) => void;
  setAiComposerSeed: Dispatch<SetStateAction<{ id: number; text: string } | undefined>>;
  recordChapterEngagement: (bookName: string, currentChapter: number, currentTranslation: string, furthestVerse: number, totalVerses: number) => void;
  authSession: AuthSession | null;
  chapterQuizGate: { met: boolean; hint: string | null };
  quizTakenThisChapterVisit: boolean;
  setQuizOpen: Dispatch<SetStateAction<boolean>>;
  topVisibleVerseRef: RefObject<number>;
  exitAnimDoneRef: RefObject<boolean>;
  pendingFlipDataRef: RefObject<{ data: ChapterData; direction: 'next' | 'prev' } | null>;
  biblePaneRef: RefObject<HTMLDivElement | null>;
  sidePanelModeRef: RefObject<SidePanelMode>;
  currentBookRef: RefObject<BookInfo | null>;
  chapterRef: RefObject<number>;
  commentarySourceRef: RefObject<string>;
  loadCommentaryData: (book: BookInfo, ch: number, source: string) => Promise<void>;
  pagedContentRef: RefObject<HTMLDivElement | null>;
  pagedMeasureRef: RefObject<HTMLDivElement | null>;
  pagedFlipAnimRef: RefObject<string>;
  pagedFlipPendingRef: RefObject<(() => void) | null>;
  readerPassagesRef: RefObject<HTMLDivElement | null>;
  verseStudyPopupRef: RefObject<HTMLElement | null>;
  readingRhythmTitle: string;
  readingProgress: ReadingProgress;
  recentPassages: SavedPassage[];
  savedVerseCount: number;
  currentTranslationLabel: string;
  commentarySource: string;
  commentarySourceNames: Record<string, string>;
  sidePanelMode: SidePanelMode;
  navigateToPassage: (bookName: string | null | undefined, nextChapter: number, nextTranslation?: string, verseNumber?: number) => boolean;
  showOnboarding: boolean;
  setShowOnboarding: Dispatch<SetStateAction<boolean>>;
}

export default function ChapterContent({
  chapterLoading,
  chapterError,
  chapterData,
  chapter,
  translation,
  currentBook,
  chapterBookLabel,
  readerSettings,
  setReaderSettings,
  pagedPageSlices,
  chapterSpreadIndex,
  animClass,
  setAnimClass,
  setChapterData,
  setChapterLoading,
  pagedFlipAnim,
  setPagedFlipAnim,
  aiNavHighlight,
  highlightedVerses,
  bookmarkedVerses,
  verseNotes,
  setVerseNotes,
  selectedVerse,
  setSelectedVerse,
  selectedVerseGroup,
  setSelectedVerseGroup,
  selectedVerseData,
  selectedVerseKey,
  selectedVerseNote,
  selectedVerseHighlighted,
  versePopupPos,
  setVersePopupPos,
  showVerseNoteEditor,
  setShowVerseNoteEditor,
  currentNoteDraft,
  setCurrentNoteDraft,
  closeVerseStudyPopup,
  toggleVerseHighlight,
  saveVerseNote,
  copySelectedVerse,
  tutorialVerseToolsNavBlocked,
  openSidePanel,
  setAiComposerSeed,
  recordChapterEngagement,
  authSession,
  chapterQuizGate,
  quizTakenThisChapterVisit,
  setQuizOpen,
  topVisibleVerseRef,
  exitAnimDoneRef,
  pendingFlipDataRef,
  biblePaneRef,
  sidePanelModeRef,
  currentBookRef,
  chapterRef,
  commentarySourceRef,
  loadCommentaryData,
  pagedContentRef,
  pagedMeasureRef,
  pagedFlipAnimRef,
  pagedFlipPendingRef,
  readerPassagesRef,
  verseStudyPopupRef,
  readingRhythmTitle,
  readingProgress,
  recentPassages,
  savedVerseCount,
  currentTranslationLabel,
  commentarySource,
  commentarySourceNames,
  sidePanelMode,
  navigateToPassage,
  showOnboarding,
  setShowOnboarding,
}: ChapterContentProps) {
  if (chapterLoading) {
    return (
      <div className="state-msg">
        <span className="spinner" />
        <div>Loading chapter...</div>
      </div>
    );
  }
  if (chapterError || !chapterData) {
    return <div className="state-msg">Could not load this chapter.</div>;
  }
  const isBookMode = readerSettings.readingMode === 'book';
  const isPaged = isPagedReadingMode(readerSettings.readingMode);
  const isPagedDouble = readerSettings.readingMode === 'paged-double';
  const pagedSpreadCount =
    isPaged && pagedPageSlices?.length
      ? readerSettings.readingMode === 'paged-double'
        ? Math.ceil(pagedPageSlices.length / 2)
        : pagedPageSlices.length
      : 0;
  const [leftPageVerses, rightPageVerses] = splitVersesForBookMode(chapterData.verses);
  const renderVerse = (v: VerseData) => {
    const inAiNav =
      aiNavHighlight != null && v.verse >= aiNavHighlight.start && v.verse <= aiNavHighlight.end;
    const verseKey = verseStorageKey(chapterData.book, chapterData.chapter, v.verse);
    const isHighlighted = highlightedVerses.includes(verseKey);
    const isBookmarked = bookmarkedVerses.includes(verseKey);
    const hasNote = Boolean(verseNotes[verseKey]);
    return (
      <span
        key={v.verse}
        className={`verse-line${inAiNav ? ' verse-line--ai-nav' : ''}${selectedVerseGroup.includes(v.verse) ? ' verse-line--selected' : ''}${isHighlighted ? ' verse-line--highlighted' : ''}${isBookmarked ? ' verse-line--bookmarked' : ''}${hasNote ? ' verse-line--noted' : ''}`}
        data-verse={v.verse}
        onClick={(e) => {
          topVisibleVerseRef.current = v.verse;
          recordChapterEngagement(chapterData.book, chapterData.chapter, translation, v.verse, chapterData.verses.length);
          if (selectedVerse !== null && v.verse !== selectedVerse) {
            setSelectedVerseGroup(prev =>
              prev.includes(v.verse)
                ? prev.filter(n => n !== v.verse)
                : [...prev, v.verse].sort((a, b) => a - b)
            );
            return;
          }
          const isDeselecting = selectedVerse === v.verse;
          if (isDeselecting) {
            setSelectedVerse(null);
            setSelectedVerseGroup([]);
            setVersePopupPos(null);
          } else {
            const rect = (e.currentTarget as HTMLElement).getBoundingClientRect();
            const popupWidth = 268;
            const margin = 14;
            let left = rect.right + margin;
            if (left + popupWidth > window.innerWidth - 8) {
              left = Math.max(8, rect.left - popupWidth - margin);
            }
            const top = Math.min(rect.top, window.innerHeight - 60);
            setSelectedVerse(v.verse);
            setSelectedVerseGroup([v.verse]);
            setVersePopupPos({ top, left });
          }
          setShowVerseNoteEditor(false);
        }}
      >
        <sup className="vnum">{v.verse}</sup>{v.text}{' '}
      </span>
    );
  };
  const pagedLastSliceIndex =
    isPaged && pagedPageSlices?.length ? pagedPageSlices.length - 1 : -1;
  const showMasteryPagedSingle =
    isPaged &&
    !isPagedDouble &&
    pagedLastSliceIndex >= 0 &&
    chapterSpreadIndex === pagedLastSliceIndex;
  const showMasteryPagedLeft =
    isPaged &&
    isPagedDouble &&
    pagedLastSliceIndex >= 0 &&
    chapterSpreadIndex * 2 === pagedLastSliceIndex;
  const showMasteryPagedRight =
    isPaged &&
    isPagedDouble &&
    pagedLastSliceIndex >= 0 &&
    chapterSpreadIndex * 2 + 1 === pagedLastSliceIndex;
  const masteryQuizBlocked = quizTakenThisChapterVisit;
  const masteryQuizGateMet = chapterQuizGate.met && !masteryQuizBlocked;
  const masteryQuizHint = masteryQuizBlocked
    ? 'Leave this chapter and come back to take the quiz again.'
    : chapterQuizGate.hint;

  const readerMasteryBlockScroll =
    authSession && currentBook && !chapterLoading && !chapterError ? (
      <div className="reader-mastery-anchor reader-mastery-anchor--scroll">
        <MasteryStrip
          bookNumber={currentBook.book_number}
          chapter={chapter}
          session={authSession}
          quizGateMet={masteryQuizGateMet}
          quizGateHint={masteryQuizHint}
          onTakeQuiz={() => {
            if (chapterQuizGate.met && !quizTakenThisChapterVisit) setQuizOpen(true);
          }}
        />
        <div className="reader-mastery-scroll-pad" aria-hidden />
      </div>
    ) : null;
  const readerMasteryBlockPaged =
    authSession && currentBook && !chapterLoading && !chapterError ? (
      <div className="reader-mastery-anchor reader-mastery-anchor--paged">
        <MasteryStrip
          bookNumber={currentBook.book_number}
          chapter={chapter}
          session={authSession}
          quizGateMet={masteryQuizGateMet}
          quizGateHint={masteryQuizHint}
          onTakeQuiz={() => {
            if (chapterQuizGate.met && !quizTakenThisChapterVisit) setQuizOpen(true);
          }}
        />
      </div>
    ) : null;
  return (
    <>
    <div
      className={`reader-page-transition${(isBookMode || isPagedDouble) ? ' reader-page-transition--book' : ''}${isPagedDouble ? ' reader-paged-flip-shell' : ''}${animClass ? ` ${animClass}` : ''}`}
      onAnimationEnd={(e) => {
        // For paged-double, wait for the flipping column's animation to end,
        // not the static column's shorter bookPageStay.
        if (isPagedDouble && animClass) {
          const t = e.target as HTMLElement;
          const isFlipping = animClass.includes('next')
            ? t.classList.contains('reader-paged-column--double-right')
            : t.classList.contains('reader-paged-column--double-left');
          if (!isFlipping) return;
        }
        if (animClass.includes('exit')) {
          exitAnimDoneRef.current = true;
          const pending = pendingFlipDataRef.current;
          if (pending) {
            pendingFlipDataRef.current = null;
            setChapterData(pending.data);
            setAnimClass(pending.direction === 'next' ? 'page-flip-enter-next' : 'page-flip-enter-prev');
            if (biblePaneRef.current) biblePaneRef.current.scrollTop = 0;
            if (sidePanelModeRef.current === 'commentary') {
              loadCommentaryData(currentBookRef.current!, chapterRef.current, commentarySourceRef.current);
            }
          } else {
            // Data not ready yet — show loading spinner until it arrives
            setAnimClass('');
            setChapterLoading(true);
          }
        } else {
          setAnimClass('');
        }
      }}
    >
      {false && (
        <section className="reader-dashboard">
        <div className="reader-dashboard-card">
          <div className="reader-dashboard-label">Study rhythm</div>
          <div className="reader-dashboard-title">{readingRhythmTitle}</div>
          <div className="reader-dashboard-metrics">
            <span className="reader-pill">{readingProgress.streak} day streak</span>
            <span className="reader-pill">{recentPassages.length} recent passages</span>
            <span className="reader-pill">{savedVerseCount} saved study items</span>
          </div>
        </div>
        <div className="reader-dashboard-card">
          <div className="reader-dashboard-label">Current context</div>
          <div className="reader-dashboard-metrics">
            <span className="reader-pill">{currentTranslationLabel}</span>
            <span className="reader-pill">{commentarySourceNames[commentarySource] ?? commentarySource}</span>
            <span className="reader-pill">{sidePanelMode === 'none' ? 'Reader focus' : `Open: ${sidePanelMode === 'ai' ? 'AI' : 'Resources'}`}</span>
          </div>
          {recentPassages.length > 0 && (
            <div className="reader-recent-row">
              {recentPassages.slice(0, 3).map(entry => (
                <button
                  key={`${entry.book}-${entry.chapter}-${entry.translation}`}
                  className="reader-recent-btn"
                  type="button"
                  onClick={() => navigateToPassage(entry.book, entry.chapter, entry.translation)}
                >
                  {entry.book} {entry.chapter}
                </button>
              ))}
            </div>
          )}
        </div>
        </section>
      )}
      {false && showOnboarding && (
        <section className="reader-onboarding">
          <div className="reader-dashboard-label">Welcome</div>
          <div className="reader-dashboard-title">Read, open commentary, or ask AI from the same workspace.</div>
          <p className="reader-onboarding-copy">
            Tap any verse to highlight it, bookmark it, or add a note. Use Search to jump straight to a passage or find a phrase.
          </p>
          <div className="reader-onboarding-actions">
            <button
              className="reader-onboarding-btn"
              type="button"
              onClick={() => {
                setShowOnboarding(false);
                localStorage.setItem(ONBOARDING_STORAGE_KEY, '1');
              }}
            >
              Start reading
            </button>
            <button
              className="reader-onboarding-btn secondary"
              type="button"
              onClick={() => {
                openSidePanel('ai');
                setShowOnboarding(false);
                localStorage.setItem(ONBOARDING_STORAGE_KEY, '1');
              }}
            >
              Show me AI
            </button>
          </div>
        </section>
      )}
      <div className="reader-book">{chapterBookLabel}</div>
      <div className="reader-chapter">{chapterData.chapter}</div>
      {isPaged ? (
        <div className="reader-paged-viewport">
          {!isPagedDouble ? (
            <header
              className="reader-paged-context"
              aria-label={`${chapterBookLabel} ${chapterData.chapter}`}
            >
              <span className="reader-paged-context-book">{chapterBookLabel}</span>
              <span className="reader-paged-context-sep" aria-hidden>
                ·
              </span>
              <span className="reader-paged-context-chapter">{chapterData.chapter}</span>
            </header>
          ) : null}
          <div ref={pagedContentRef} className="reader-paged-content">
            <div
              ref={pagedMeasureRef}
              className="reader-paged-hidden-measure reader-passages"
              aria-hidden
            />
            {!pagedPageSlices ? (
              <div className="state-msg reader-paged-measuring">
                <span className="spinner" aria-hidden />
                <div>Laying out pages…</div>
              </div>
            ) : (
              <div
                className={`reader-paged-flip-shell reader-page-transition${readerSettings.readingMode === 'paged-double' ? ' reader-page-transition--book' : ''}${pagedFlipAnim ? ` ${pagedFlipAnim}` : ''}`}
                onAnimationEnd={(e) => {
                  const cur = pagedFlipAnimRef.current;
                  const shell = e.currentTarget as HTMLElement;
                  const spread = shell.querySelector('.reader-paged-spread--double');
                  if (readerSettings.readingMode === 'paged-double' && spread) {
                    const t = e.target as HTMLElement;
                    const pageCol = spread.querySelector('.reader-paged-column--double-right');
                    const pageColLeft = spread.querySelector('.reader-paged-column--double-left');
                    if (!t.classList.contains('reader-paged-column') || t.parentElement !== spread) return;
                    if (cur.includes('next') && t !== pageCol) return;
                    if (cur.includes('prev') && t !== pageColLeft) return;
                  } else if (e.target !== e.currentTarget) {
                    return;
                  }
                  if (cur.includes('exit')) {
                    const fn = pagedFlipPendingRef.current;
                    pagedFlipPendingRef.current = null;
                    fn?.();
                  } else if (cur.includes('enter')) {
                    setPagedFlipAnim('');
                  }
                }}
              >
                <div ref={readerPassagesRef} className="reader-paged-verse-root">
                  {readerSettings.readingMode === 'paged-double' ? (
                    <div className="reader-paged-spread reader-paged-spread--double">
                      {pagedPageSlices[chapterSpreadIndex * 2]?.length ? (
                        <div
                          className="reader-paged-double-context-left"
                          aria-label={`${chapterBookLabel} ${chapterData.chapter}`}
                        >
                          <div className="reader-book">{chapterBookLabel}</div>
                          <div className="reader-chapter">{chapterData.chapter}</div>
                        </div>
                      ) : (
                        <div className="reader-paged-double-context-left reader-paged-double-context-left--empty" aria-hidden />
                      )}
                      <div className="reader-paged-double-context-right" aria-hidden />
                      <div className="reader-paged-column reader-paged-column--double-page reader-paged-column--double-left">
                        {pagedPageSlices[chapterSpreadIndex * 2]?.length ? (
                          <>
                            <div className="reader-paged-sheet">
                              <div className="reader-passages reader-paged-passages">
                                {pagedPageSlices[chapterSpreadIndex * 2].map(renderVerse)}
                              </div>
                            </div>
                            {showMasteryPagedLeft ? readerMasteryBlockPaged : null}
                            <div className="reader-paged-tail" aria-hidden />
                            <div className="reader-paged-col-footer">
                              <span className="reader-paged-col-pagenum">
                                {chapterSpreadIndex * 2 + 1} / {pagedPageSlices.length}
                              </span>
                            </div>
                          </>
                        ) : (
                          <div className="reader-paged-full" aria-hidden />
                        )}
                      </div>
                      <div className="reader-paged-column reader-paged-column--double-page reader-paged-column--double-right">
                        {pagedPageSlices[chapterSpreadIndex * 2 + 1]?.length ? (
                          <>
                            <div className="reader-paged-sheet">
                              <div className="reader-passages reader-paged-passages">
                                {pagedPageSlices[chapterSpreadIndex * 2 + 1].map(renderVerse)}
                              </div>
                            </div>
                            {showMasteryPagedRight ? readerMasteryBlockPaged : null}
                            <div className="reader-paged-tail" aria-hidden />
                            <div className="reader-paged-col-footer">
                              <span className="reader-paged-col-pagenum">
                                {chapterSpreadIndex * 2 + 2} / {pagedPageSlices.length}
                              </span>
                            </div>
                          </>
                        ) : (
                          <div className="reader-paged-full" aria-hidden />
                        )}
                      </div>
                    </div>
                  ) : (
                    <div className="reader-paged-spread reader-paged-spread--single">
                      <div className="reader-paged-column">
                        <div className="reader-paged-sheet">
                          <div className="reader-passages reader-paged-passages">
                            {pagedPageSlices[chapterSpreadIndex]?.map(renderVerse)}
                          </div>
                        </div>
                        {showMasteryPagedSingle ? readerMasteryBlockPaged : null}
                        <div className="reader-paged-tail" aria-hidden />
                      </div>
                    </div>
                  )}
                </div>
              </div>
            )}
          </div>
          {pagedSpreadCount > 0 && !isPagedDouble ? (
            <footer
              className="reader-paged-pagebar"
              aria-live="polite"
              aria-label={`Page ${chapterSpreadIndex + 1} of ${pagedSpreadCount} in this chapter`}
            >
              <span aria-hidden className="reader-paged-pagebar-fraction">
                {chapterSpreadIndex + 1} / {pagedSpreadCount}
              </span>
            </footer>
          ) : null}
        </div>
      ) : isBookMode ? (
        <>
          <div className="reader-book-spread" ref={readerPassagesRef}>
            <section className="reader-book-page reader-book-page--left" aria-label="Left page">
              <div className="reader-passages reader-passages--book">
                {leftPageVerses.map(renderVerse)}
              </div>
            </section>
            <section className="reader-book-page reader-book-page--right" aria-label="Right page">
              <div className="reader-passages reader-passages--book">
                {rightPageVerses.map(renderVerse)}
              </div>
            </section>
          </div>
          {readerMasteryBlockScroll}
        </>
      ) : (
        <div className="reader-passages" ref={readerPassagesRef}>
        {chapterData.verses.map(v => {
          const inAiNav =
            aiNavHighlight != null && v.verse >= aiNavHighlight.start && v.verse <= aiNavHighlight.end;
          const verseKey = verseStorageKey(chapterData.book, chapterData.chapter, v.verse);
          const isHighlighted = highlightedVerses.includes(verseKey);
          const isBookmarked = bookmarkedVerses.includes(verseKey);
          const hasNote = Boolean(verseNotes[verseKey]);
          return (
            <span
              key={v.verse}
              className={`verse-line${inAiNav ? ' verse-line--ai-nav' : ''}${selectedVerseGroup.includes(v.verse) ? ' verse-line--selected' : ''}${isHighlighted ? ' verse-line--highlighted' : ''}${isBookmarked ? ' verse-line--bookmarked' : ''}${hasNote ? ' verse-line--noted' : ''}`}
              data-verse={v.verse}
              onClick={(e) => {
                topVisibleVerseRef.current = v.verse;
                recordChapterEngagement(chapterData.book, chapterData.chapter, translation, v.verse, chapterData.verses.length);
                // Popup open + clicking a different verse → add/remove from group
                if (selectedVerse !== null && v.verse !== selectedVerse) {
                  setSelectedVerseGroup(prev =>
                    prev.includes(v.verse)
                      ? prev.filter(n => n !== v.verse)
                      : [...prev, v.verse].sort((a, b) => a - b)
                  );
                  return;
                }
                // Clicking anchor verse again → close popup
                const isDeselecting = selectedVerse === v.verse;
                if (isDeselecting) {
                  setSelectedVerse(null);
                  setSelectedVerseGroup([]);
                  setVersePopupPos(null);
                } else {
                  const rect = (e.currentTarget as HTMLElement).getBoundingClientRect();
                  const popupWidth = 268;
                  const margin = 14;
                  let left = rect.right + margin;
                  if (left + popupWidth > window.innerWidth - 8) {
                    left = Math.max(8, rect.left - popupWidth - margin);
                  }
                  const top = Math.min(rect.top, window.innerHeight - 60);
                  setSelectedVerse(v.verse);
                  setSelectedVerseGroup([v.verse]);
                  setVersePopupPos({ top, left });
                }
                setShowVerseNoteEditor(false);
              }}
            >
              <sup className="vnum">{v.verse}</sup>{v.text}{' '}
            </span>
          );
        })}
        {readerMasteryBlockScroll}
        </div>
      )}
    </div>
    {selectedVerseData && currentBook && versePopupPos && (
      <section
        ref={verseStudyPopupRef}
        className="verse-study-card verse-study-popup"
        style={{ top: versePopupPos.top, left: versePopupPos.left }}
      >
        <div className="verse-study-header">
          <div>
            <div className="reader-dashboard-label">
              {selectedVerseGroup.length > 1 ? `${selectedVerseGroup.length} verses` : 'Selected verse'}
            </div>
            <div className="verse-study-title">
              {formatVerseGroupRef(currentBook.name, chapter, selectedVerseGroup)}
            </div>
          </div>
          <button className="verse-study-close" type="button" aria-label="Close" onClick={closeVerseStudyPopup}>
            <svg viewBox="0 0 24 24" aria-hidden="true">
              <path d="M6 6l12 12M18 6 6 18" />
            </svg>
          </button>
        </div>
        <div className="verse-study-actions">
          <div className="verse-highlight-row">
            <button
              className={`verse-action-btn${selectedVerseHighlighted ? ' active' : ''}`}
              type="button"
              title="Add or remove a highlight in your preset color. Hover this row to pick a different highlight color."
              onClick={toggleVerseHighlight}
            >
              Highlight
            </button>
            <div className="verse-color-strip" role="group" aria-label="Highlight color">
              {(['yellow', 'amber', 'green', 'blue', 'pink'] as const).map(colorId => (
                <button
                  key={colorId}
                  type="button"
                  aria-label={colorId}
                  className={`verse-color-dot${readerSettings.highlightColor === colorId ? ' active' : ''}`}
                  style={{ background: READER_HIGHLIGHT_PRESETS[colorId].light }}
                  onClick={() => setReaderSettings(prev => ({ ...prev, highlightColor: colorId }))}
                />
              ))}
            </div>
          </div>
          <button
            className="verse-action-btn"
            type="button"
            title={
              tutorialVerseToolsNavBlocked
                ? 'Copy verse text to the clipboard or use your device share sheet.'
                : undefined
            }
            onClick={copySelectedVerse}
          >
            <span className="verse-action-icon" aria-hidden="true">
              <svg viewBox="0 0 24 24">
                <path d="M4 12v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2v-8" />
                <path d="m16 6-4-4-4 4" />
                <path d="M12 2v15" />
              </svg>
            </span>
            Share
          </button>
          <button
            className={`verse-action-btn${showVerseNoteEditor || selectedVerseNote ? ' active' : ''}`}
            type="button"
            title="Add or edit a note for this verse. Save when you are done."
            onClick={() => setShowVerseNoteEditor(true)}
          >
            <span className="verse-action-icon verse-action-icon--fill" aria-hidden="true">
              <svg viewBox="0 0 24 24">
                <path d="M19 21 12 16.89 5 21V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v16Z" />
              </svg>
            </span>
            Notes
          </button>
          <button
            className="verse-action-btn"
            type="button"
            aria-disabled={tutorialVerseToolsNavBlocked}
            title={
              tutorialVerseToolsNavBlocked
                ? 'Opens the AI assistant with your selected verse text. Disabled during the guided tour so you can explore the rest of this card first.'
                : undefined
            }
            onClick={() => {
              if (tutorialVerseToolsNavBlocked) return;
              openSidePanel('ai');
              const sorted = [...selectedVerseGroup].sort((a, b) => a - b);
              const verseTexts = sorted
                .map(vn => chapterData?.verses.find(v => v.verse === vn))
                .filter(Boolean)
                .map(v => v!.text)
                .join(' ');
              const ref = formatVerseGroupRef(currentBook.name, chapter, sorted);
              setAiComposerSeed({ id: Date.now(), text: buildExplainVersePrompt(ref, verseTexts) });
            }}
          >
            <span className="verse-action-icon verse-action-icon--taskbar" aria-hidden="true">
              <svg viewBox="0 0 24 24">
                <path d="M12 3.5 13.9 8l4.6 1.9-4.6 1.9-1.9 4.7-1.9-4.7L5.5 9.9 10.1 8 12 3.5Z" className="icon-solid" />
                <path d="M18 14.5 18.9 16.6 21 17.5l-2.1.9-.9 2.1-.9-2.1-2.1-.9 2.1-.9.9-2.1Z" className="icon-solid" />
                <path d="M6.5 15.5 7.2 17l1.5.7-1.5.7-.7 1.6-.7-1.6-1.6-.7 1.6-.7.7-1.5Z" className="icon-solid" />
              </svg>
            </span>
            Ask AI
          </button>
        </div>
        {(showVerseNoteEditor || selectedVerseNote) && (
          <div className="verse-note-editor">
            <textarea
              className="verse-note-input"
              value={currentNoteDraft}
              rows={3}
              placeholder="Add a note (optional)..."
              onChange={event => setCurrentNoteDraft(event.target.value)}
            />
            <div className="verse-note-actions">
              <button className="verse-action-btn active" type="button" onClick={saveVerseNote}>
                <span className="verse-action-icon verse-action-icon--fill" aria-hidden="true">
                  <svg viewBox="0 0 24 24">
                    <path d="M19 21 12 16.89 5 21V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v16Z" />
                  </svg>
                </span>
                Save
              </button>
              {selectedVerseNote && (
                <button className="verse-action-btn" type="button" onClick={() => { setCurrentNoteDraft(''); setVerseNotes(prev => { const next = { ...prev }; if (selectedVerseKey) delete next[selectedVerseKey]; return next; }); }}>
                  Remove note
                </button>
              )}
            </div>
          </div>
        )}
      </section>
    )}
  </>
  );
}
