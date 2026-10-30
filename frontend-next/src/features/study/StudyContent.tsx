'use client';

import type { Dispatch, SetStateAction } from 'react';
import Link from 'next/link';
import AuthPanel from '@/components/AuthPanel';
import MasteryOverviewPanel from '@/components/MasteryOverviewPanel';
import { useAuth } from '@/features/account/AuthContext';
import type { BookInfo, ChapterData, ReadingProgress, SavedPassage, SidePanelMode, VerseNote } from '@/features/reader/types';
import { DailyTasksList } from '@/features/progress/DailyTasksList';
import { MAX_DAILY_GOAL_MINUTES, MIN_DAILY_GOAL_MINUTES, normalizeDailyGoalMinutes } from '@/features/progress/progress';

export interface StudyContentProps {
  highlightedVerses: string[];
  verseNotes: Record<string, VerseNote>;
  currentBook: BookInfo | null;
  chapter: number;
  chapterData: ChapterData | null;
  books: BookInfo[];
  translation: string;
  handleAuthSignIn: (email: string, password: string) => Promise<void>;
  handleAuthSignUp: (email: string, password: string, displayName: string) => Promise<void>;
  handleAuthSignOut: () => Promise<void>;
  coinBalance: number | null;
  readingGoalEditing: boolean;
  setReadingGoalEditing: Dispatch<SetStateAction<boolean>>;
  readingRhythmTitle: string;
  dailyGoalMinutes: number;
  setDailyGoalMinutes: Dispatch<SetStateAction<number>>;
  readingProgress: ReadingProgress;
  recentPassages: SavedPassage[];
  dailyGoalsExpanded: boolean;
  setDailyGoalsExpanded: Dispatch<SetStateAction<boolean>>;
  taskChapterDone: boolean;
  taskAiDone: boolean;
  taskMinutesDone: boolean;
  dailyRewardsStatus: { verse_claimed: boolean; tasks_claimed: boolean } | null;
  handleClaimDailyTasksBonus: () => Promise<void>;
  tasksBonusClaiming: boolean;
  navigateToPassage: (bookName: string | null | undefined, nextChapter: number, nextTranslation?: string, verseNumber?: number) => boolean;
  homeScreenActive: boolean;
  openReaderFromHome: (panel: SidePanelMode) => void;
  closeSidePanel: () => void;
}

export default function StudyContent({
  highlightedVerses,
  verseNotes,
  currentBook,
  chapter,
  chapterData,
  books,
  translation,
  handleAuthSignIn,
  handleAuthSignUp,
  handleAuthSignOut,
  coinBalance,
  readingGoalEditing,
  setReadingGoalEditing,
  readingRhythmTitle,
  dailyGoalMinutes,
  setDailyGoalMinutes,
  readingProgress,
  recentPassages,
  dailyGoalsExpanded,
  setDailyGoalsExpanded,
  taskChapterDone,
  taskAiDone,
  taskMinutesDone,
  dailyRewardsStatus,
  handleClaimDailyTasksBonus,
  tasksBonusClaiming,
  navigateToPassage,
  homeScreenActive,
  openReaderFromHome,
  closeSidePanel,
}: StudyContentProps) {
  const { authSession, accountProfile, authBusy, authError, authMode, setAuthMode } = useAuth();
  const highlightEntries = [...highlightedVerses]
    .map(key => {
      const [book, chStr, vStr] = key.split('::');
      const ch = Number(chStr);
      const verse = Number(vStr);
      const verseText = (() => {
        if (currentBook?.name.toLowerCase() === book && chapter === ch) {
          return chapterData?.verses.find(v => v.verse === verse)?.text ?? '';
        }
        return '';
      })();
      return { key, book, chapter: ch, verse, verseText };
    })
    .sort((a, b) => a.book.localeCompare(b.book) || a.chapter - b.chapter || a.verse - b.verse);

  type SavedEntry = {
    key: string;
    book: string;
    chapter: number;
    verse: number;
    verseText: string;
    noteText: string;
  };

  const savedByKey = new Map<string, SavedEntry>();

  for (const entry of highlightEntries) {
    savedByKey.set(entry.key, {
      key: entry.key,
      book: entry.book,
      chapter: entry.chapter,
      verse: entry.verse,
      verseText: entry.verseText,
      noteText: '',
    });
  }
  for (const note of Object.values(verseNotes)) {
    const existing = savedByKey.get(note.key);
    if (existing) {
      existing.noteText = note.text;
      if (!existing.verseText) {
        const [b, chStr, vStr] = note.key.split('::');
        const ch = Number(chStr);
        const v = Number(vStr);
        if (currentBook?.name.toLowerCase() === b && chapter === ch) {
          existing.verseText = chapterData?.verses.find(x => x.verse === v)?.text ?? '';
        }
      }
    } else {
      const [b, chStr, vStr] = note.key.split('::');
      const ch = Number(chStr);
      const v = Number(vStr);
      const verseText = (() => {
        if (currentBook?.name.toLowerCase() === b && chapter === ch) {
          return chapterData?.verses.find(x => x.verse === v)?.text ?? '';
        }
        return '';
      })();
      savedByKey.set(note.key, {
        key: note.key,
        book: b,
        chapter: ch,
        verse: v,
        verseText,
        noteText: note.text,
      });
    }
  }

  const savedEntries = [...savedByKey.values()].sort(
    (a, b) => a.book.localeCompare(b.book) || a.chapter - b.chapter || a.verse - b.verse,
  );

  // Capitalize first letter of book name (keys are lowercase)
  const displayBook = (raw: string) =>
    books.find(b => b.name.toLowerCase() === raw.toLowerCase())?.name ?? raw;

  return (
    <div className="study-panel-content">
      <section className="mystuff-section mystuff-account-section">
        <div className="mystuff-section-label">Account</div>
        {!accountProfile && (
          <>
            <div className="reader-dashboard-title">Guest study mode</div>
            <p className="reader-onboarding-copy">
              Highlights, notes, bookmarks, streak, and recent passages stay on this device until you sign in.
            </p>
          </>
        )}
        <AuthPanel
          isBusy={authBusy}
          error={authError}
          mode={authMode}
          profile={
            accountProfile
              ? {
                  email: accountProfile.email ?? '',
                  display_name: accountProfile.display_name ?? null,
                }
              : null
          }
          coinBalance={accountProfile ? coinBalance : null}
          onModeChange={setAuthMode}
          onSignIn={handleAuthSignIn}
          onSignUp={handleAuthSignUp}
          onSignOut={handleAuthSignOut}
        />
      </section>

      {/* Reading rhythm */}
      <section className="reader-dashboard">
        <div className="reader-dashboard-card">
          <div className="reader-goal-header">
            <div className="reader-dashboard-label">Reading rhythm</div>
            <button
              type="button"
              className="reader-goal-edit-btn"
              onClick={() => setReadingGoalEditing(v => !v)}
            >
              {readingGoalEditing ? 'Done' : 'Edit goal'}
            </button>
          </div>
          <div className="reader-dashboard-title">{readingRhythmTitle}</div>
          {readingGoalEditing && (
            <div className="reader-goal-panel reader-goal-panel--slider">
              <span className="reader-goal-panel-label">Active learning minutes per day</span>
              <div className="reader-goal-slider-wrap">
                <input
                  type="range"
                  className="reader-goal-range"
                  min={MIN_DAILY_GOAL_MINUTES}
                  max={MAX_DAILY_GOAL_MINUTES}
                  step={5}
                  value={dailyGoalMinutes}
                  aria-label="Daily active learning goal in minutes"
                  onChange={e => setDailyGoalMinutes(normalizeDailyGoalMinutes(e.target.value))}
                />
                <span className="reader-goal-slider-value" aria-live="polite">
                  {dailyGoalMinutes} min
                </span>
              </div>
            </div>
          )}
          <div className="reader-dashboard-metrics">
            <span className="reader-pill">{readingProgress.streak} day streak</span>
            <span className="reader-pill">{recentPassages.length} recent</span>
          </div>
          <div className="daily-goals-block">
            <button
              type="button"
              className="daily-goals-toggle"
              aria-expanded={dailyGoalsExpanded}
              onClick={() => setDailyGoalsExpanded(v => !v)}
            >
              Daily tasks
              <span className="daily-goals-toggle-chevron" aria-hidden="true">
                {dailyGoalsExpanded ? '▼' : '▶'}
              </span>
            </button>
            {dailyGoalsExpanded && (
              <DailyTasksList
                taskChapterDone={taskChapterDone}
                taskAiDone={taskAiDone}
                taskMinutesDone={taskMinutesDone}
                dailyGoalMinutes={dailyGoalMinutes}
                signedIn={Boolean(authSession)}
                tasksBonusClaimed={Boolean(dailyRewardsStatus?.tasks_claimed)}
                onClaimTasksBonus={handleClaimDailyTasksBonus}
                tasksBonusClaiming={tasksBonusClaiming}
              />
            )}
          </div>
        </div>
      </section>

      <section className="mystuff-section mystuff-mastery-section">
        <Link
          href="/app/mastery"
          className="reader-dashboard-card mastery-overview-card mastery-overview-card--link"
        >
          <MasteryOverviewPanel variant="teaser" session={authSession} translation={translation} />
        </Link>
      </section>

      {/* Saved (highlights + notes) */}
      <section className="mystuff-section">
        <div className="mystuff-section-label">Saved ({savedEntries.length})</div>
        {savedEntries.length === 0 ? (
          <div className="mystuff-empty">Nothing saved yet. Tap a verse and choose Highlight or Note.</div>
        ) : (
          savedEntries.map(entry => (
            <div
              key={entry.key}
              className="mystuff-item"
              role="button"
              tabIndex={0}
              onClick={() => {
                navigateToPassage(displayBook(entry.book), entry.chapter, translation, entry.verse);
                if (homeScreenActive) openReaderFromHome('none');
                else closeSidePanel();
              }}
              onKeyDown={e => {
                if (e.key !== 'Enter') return;
                navigateToPassage(displayBook(entry.book), entry.chapter, translation, entry.verse);
                if (homeScreenActive) openReaderFromHome('none');
                else closeSidePanel();
              }}
            >
              <span className="mystuff-item-ref">{displayBook(entry.book)} {entry.chapter}:{entry.verse}</span>
              {entry.verseText && <span className="mystuff-item-text">{entry.verseText}</span>}
              {entry.noteText && <span className="mystuff-item-note">{entry.noteText}</span>}
            </div>
          ))
        )}
      </section>

      {/* Study plans */}
      <section className="mystuff-section">
        <div className="mystuff-section-label">Study plans</div>
        <div className="mystuff-empty">Bible study plans coming soon.</div>
      </section>
    </div>
  );
}
