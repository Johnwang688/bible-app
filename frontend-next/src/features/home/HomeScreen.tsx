'use client';

import type { ReactNode, RefObject } from 'react';
import Link from 'next/link';
import CurrencyIcon from '@/components/CurrencyIcon';
import MasteryOverviewPanel from '@/components/MasteryOverviewPanel';
import type { AuthSession } from '@/lib/account';
import type { BookInfo, ChapterData, DailyVerse, ReadingProgress, SidePanelMode } from '@/features/reader/types';
import { DailyTasksList } from '@/features/progress/DailyTasksList';
import { logoSrcForTheme } from '@/features/settings/themeHelpers';

export interface HomeScreenProps {
  currentTheme: string;
  homeTimeGreeting: string;
  authSession: AuthSession | null;
  coinBalance: number | null;
  sidePanelMode: SidePanelMode;
  toggleStudyPanel: () => void;
  tutorialHomeSpotRef: RefObject<HTMLDivElement | null>;
  dailyVerse: DailyVerse;
  handleDailyVerseRefClick: () => Promise<void>;
  dailyRewardsStatus: { verse_claimed: boolean; tasks_claimed: boolean } | null;
  readingProgress: ReadingProgress;
  minutesTowardGoal: number;
  dailyGoalMinutes: number;
  taskChapterDone: boolean;
  taskAiDone: boolean;
  taskMinutesDone: boolean;
  handleClaimDailyTasksBonus: () => Promise<void>;
  tasksBonusClaiming: boolean;
  chapterLoading: boolean;
  chapterData: ChapterData | null;
  currentBook: BookInfo | null;
  openReaderFromHome: (panel: SidePanelMode) => void;
  currentBookLabel: string;
  chapter: number;
  currentTranslationLabel: string;
  openTutorial: (startIndex?: number) => void;
  translation: string;
  sidePanelTitle: () => string;
  sidePanelContext: string;
  closeSidePanel: () => void;
  studyContent: ReactNode;
}

export default function HomeScreen({
  currentTheme,
  homeTimeGreeting,
  authSession,
  coinBalance,
  sidePanelMode,
  toggleStudyPanel,
  tutorialHomeSpotRef,
  dailyVerse,
  handleDailyVerseRefClick,
  dailyRewardsStatus,
  readingProgress,
  minutesTowardGoal,
  dailyGoalMinutes,
  taskChapterDone,
  taskAiDone,
  taskMinutesDone,
  handleClaimDailyTasksBonus,
  tasksBonusClaiming,
  chapterLoading,
  chapterData,
  currentBook,
  openReaderFromHome,
  currentBookLabel,
  chapter,
  currentTranslationLabel,
  openTutorial,
  translation,
  sidePanelTitle,
  sidePanelContext,
  closeSidePanel,
  studyContent,
}: HomeScreenProps) {
  return (
    <div className="home-screen" role="region" aria-label="Home">
      <div className="home-screen-inner">
        <header className="home-screen-header">
          <div className="home-screen-title-row">
            <img
              className="home-screen-logo"
              src={logoSrcForTheme(currentTheme)}
              alt=""
              width={40}
              height={40}
              aria-hidden="true"
            />
            <h1 className="home-screen-title">{homeTimeGreeting || 'Welcome'}</h1>
          </div>
          <div className="home-header-actions">
            {authSession ? (
              <span className="home-header-coins-chip" aria-label={`${coinBalance != null ? coinBalance.toLocaleString() : '…'} coins`}>
                <CurrencyIcon className="home-header-coins-icon" size={16} />
                <span className="home-header-coins-amount" aria-live="polite">
                  {coinBalance != null ? coinBalance.toLocaleString() : '…'}
                </span>
              </span>
            ) : null}
            <span className="topbar-tooltip-wrap" data-tooltip="Profile">
              <button
                className={`nav-btn nav-btn-icon-only${sidePanelMode === 'study' ? ' active' : ''}`}
                type="button"
                aria-label="Open profile"
                aria-expanded={sidePanelMode === 'study'}
                aria-controls="home-profile-panel"
                onClick={() => toggleStudyPanel()}
              >
                <svg className="nav-search-icon" viewBox="0 0 24 24" width={20} height={20} aria-hidden="true">
                  <circle cx="12" cy="9" r="3.25" />
                  <path d="M5 20.5v-.35c0-3.2 2.85-5.65 7-5.65s7 2.45 7 5.65v.35" />
                </svg>
              </button>
            </span>
          </div>
        </header>
        <div ref={tutorialHomeSpotRef} className="home-cards-grid">
          {/* Verse of the day — full width */}
          <section className="home-screen-card reader-dashboard-card home-daily-verse-card home-grid-full" aria-labelledby="home-daily-verse-heading">
            <h2 id="home-daily-verse-heading" className="reader-dashboard-label">Verse of the day</h2>
            <p className="home-daily-verse-text">{dailyVerse.text}</p>
            <button
              type="button"
              className="home-daily-verse-ref"
              onClick={() => void handleDailyVerseRefClick()}
            >
              {dailyVerse.book} {dailyVerse.chapter}:{dailyVerse.verse}
            </button>
            {authSession ? (
              <p className={`home-daily-verse-reward-hint${dailyRewardsStatus?.verse_claimed ? ' home-daily-verse-reward-hint--done' : ''}`}>
                {dailyRewardsStatus?.verse_claimed
                  ? 'Daily verse reward claimed'
                  : (
                    <span className="home-daily-verse-reward-inline">
                      <span>Tap</span>
                      <CurrencyIcon size={14} decorative className="home-daily-verse-reward-inline-icon" />
                      <span>10</span>
                    </span>
                  )}
              </p>
            ) : (
              <p className="home-daily-verse-reward-hint">Sign in to earn coins when you open today&apos;s verse.</p>
            )}
          </section>
          {/* Streak (left) | Continue 1/3 + Tutorial 2/3 stacked (right) */}
          <div className="home-grid-full home-streak-right-col-row">
            {/* ── Streak card ── */}
            <section
              className="home-screen-card reader-dashboard-card home-streak-card"
              aria-labelledby="home-streak-heading"
            >
              <h2 id="home-streak-heading" className="reader-dashboard-label">Your streak</h2>
              <div className="home-streak-flame-row">
                <p className="reader-dashboard-title home-streak-number">{readingProgress.streak}</p>
                <span className="home-streak-days-label">day streak</span>
              </div>
              <div className="reader-dashboard-metrics" style={{ marginTop: 6 }}>
                <span className="reader-pill">
                  {minutesTowardGoal}/{dailyGoalMinutes} min active today
                </span>
              </div>
              <div className="home-streak-7days" aria-label="Last 7 days">
                {Array.from({ length: 7 }, (_, i) => {
                  const d = new Date(readingProgress.todayIso);
                  d.setDate(d.getDate() - (6 - i));
                  const iso = d.toISOString().slice(0, 10);
                  const isToday = iso === readingProgress.todayIso;
                  const met = readingProgress.goalMetDays.includes(iso);
                  const dayLabel = ['S', 'M', 'T', 'W', 'T', 'F', 'S'][d.getDay()];
                  return (
                    <div key={iso} className={`home-streak-dot-col${isToday ? ' today' : ''}`}>
                      <div className={`home-streak-dot${met ? ' met' : ''}${isToday ? ' today' : ''}`} aria-label={met ? 'Goal met' : 'Missed'} />
                      <span className="home-streak-dot-label">{dayLabel}</span>
                    </div>
                  );
                })}
              </div>
              <div className="home-streak-tasks-section">
                <p className="home-daily-tasks-summary">Daily tasks</p>
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
              </div>
            </section>
            {/* ── Right column: Continue (1/3 height) stacked above Tutorial (2/3 height) ── */}
            <div className="home-right-col">
              <section
                className="home-screen-card reader-dashboard-card home-continue-card"
                aria-labelledby="home-continue-heading"
              >
                <h2 id="home-continue-heading" className="reader-dashboard-label">Continue reading</h2>
                <div className="home-continue-half-body">
                  {chapterLoading && !chapterData ? (
                    <div className="home-continue-loading">
                      <span className="spinner" aria-hidden="true" />
                      <span>Loading…</span>
                    </div>
                  ) : currentBook ? (
                    <button
                      type="button"
                      className="home-continue-btn"
                      onClick={() => openReaderFromHome('none')}
                    >
                      <span className="home-continue-ref">{currentBookLabel} {chapter}</span>
                      <span className="home-continue-meta">{currentTranslationLabel}</span>
                    </button>
                  ) : (
                    <p className="home-continue-empty">Pick a book to get started.</p>
                  )}
                </div>
              </section>
              <section
                className="home-screen-card tutorial-home-card home-tutorial-card"
                aria-labelledby="home-tutorial-heading"
              >
                <div className="tutorial-home-copy">
                  <h2 id="home-tutorial-heading" className="reader-dashboard-label">Guided tour</h2>
                  <p className="tutorial-home-title">Learn every feature in a few quick steps.</p>
                  <p className="home-screen-card-caption">Walk through reading, search, verse tools, resources, AI, My Stuff, and settings without leaving the app.</p>
                </div>
                <div className="tutorial-home-actions">
                  <button
                    type="button"
                    className="tutorial-home-btn"
                    onClick={() => openTutorial(0)}
                  >
                    Start tutorial
                  </button>
                  <button
                    type="button"
                    className="tutorial-home-btn tutorial-home-btn-secondary"
                    onClick={() => openTutorial(2)}
                  >
                    Jump to features
                  </button>
                </div>
              </section>
            </div>
          </div>
          {/* Mastery — full width */}
          <Link
            href="/app/mastery"
            className="home-screen-card reader-dashboard-card home-mastery-card home-mastery-card--link home-grid-full"
            aria-labelledby="home-mastery-heading"
          >
            <h2 id="home-mastery-heading" className="reader-dashboard-label">Mastery</h2>
            <MasteryOverviewPanel
              variant="teaser"
              showTitle={false}
              session={authSession}
              translation={translation}
            />
          </Link>
        </div>
      </div>
      {sidePanelMode === 'study' && (
        <aside
          className="home-study-pane"
          id="home-profile-panel"
          role="dialog"
          aria-modal="true"
          aria-label="Profile"
        >
          <div className="home-study-pane-panel">
            <div className="side-header home-study-pane-header">
              <div className="home-study-pane-kicker">Profile</div>
              <div className="side-close-row">
                <div>
                  <div className="side-title">{sidePanelTitle()}</div>
                  <div className="side-subtitle">{sidePanelContext}</div>
                </div>
                <button
                  type="button"
                  className="side-close-btn"
                  aria-label="Close profile page"
                  onClick={closeSidePanel}
                >
                  Close
                </button>
              </div>
            </div>
            <div className="side-scroll home-study-pane-scroll">{studyContent}</div>
          </div>
        </aside>
      )}
    </div>
  );
}
