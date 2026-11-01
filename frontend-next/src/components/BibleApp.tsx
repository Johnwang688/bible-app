'use client';

import type { CSSProperties } from 'react';
import { useCallback, useEffect, useLayoutEffect, useMemo, useRef, useState } from 'react';
import AiSidebar, {
  PERSONALITIES,
  restorePersonalityId,
  type AIActionParams,
} from './AiSidebar';
import { STORAGE_KEYS } from '@/lib/storageKeys';
import ChapterQuiz from './ChapterQuiz';
import {
  type AuthSession,
  type SyncedReadingProgress,
  type SyncedStudyItem,
  type SyncedUserSettings,
  getProfile,
  getReadingProgress,
  getStudyItems,
  getUserSettings,
  persistAuthSession,
  putReadingProgress,
  putStudyItems,
  putUserSettings,
  refreshSession,
  signIn,
  signOut,
  signUp,
} from '@/lib/account';
import {
  claimDailyTasksBonus,
  claimDailyVerseReward,
  getDailyRewardsStatus,
  getWallet,
  type WalletOut,
} from '@/lib/quiz';
import { parseReferenceLabel, sortBookNamesForMatching } from '@/lib/scriptureReference';
import { normalizeThemeId, type AppliedTheme, type ThemePreference } from '@/lib/themes';
import { useThemePreference } from '@/lib/useThemePreference';

import type { BookInfo, ChapterData, ChapterQuizVisitState, ChapterReadEvidence, CommentaryEntry, CommentarySource, ReaderSettings, SavedPassage, SearchResult, SearchSuggestion, SidePanelMode, SidePanelPosition, Translation, TutorialStep, VerseData, VerseNote } from '@/features/reader/types';
import { DEFAULT_TRANSLATION, filterTranslationsForPicker, getLocalizedBookName, getLocalizedBookNameFromRaw, getTranslationDisplayId, getTranslationDisplayName, normalizeTranslationChoice } from '@/features/reader/translations';
import { DEFAULT_READER_SETTINGS, applyReaderHighlightVars, isPagedReadingMode, normalizeReaderSettings } from '@/features/reader/settings';
import { biblePaneScrollDepthRatio, chapterStorageKey, closestVerseLine, formatVerseGroupRef, scrollVerseLineIntoBiblePaneCenter, sliceVersesIntoPages, verseStorageKey } from '@/features/reader/layout';
import { computeChapterQuizRequiredDwellMs, getChapterQuizVisibleMs } from '@/features/quiz/dwell';
import { chapterReadKey, pickSurpriseChapter } from '@/features/progress/surprise';
import { COMMENTARY_SYNC_THROTTLE_MS, ENGAGEMENT_COMMIT_MS, LAST_POSITION_STORAGE_KEY, MAX_ENGAGEMENT_GAP_MS, MAX_RECENT_PASSAGES, ONBOARDING_STORAGE_KEY, chapterEvidenceQualifies, computeTodayIso, selectDailyVerse, syncGoalCompletion, timeOfDayGreeting } from '@/features/progress/progress';
import { logoSrcForTheme } from '@/features/settings/themeHelpers';
import { SEARCH_SUGGESTION_LIMIT, clampChapterForBook, compactSearchText, extractLooseReferenceParts, formatSearchSuggestionLabel, getBookPopularityScore, normalizeReferenceSpacing, normalizeSearchText, scoreBookMatch } from '@/features/search/search';
import { TUTORIAL_VERSE_TOOLS_VERSE, boundsToTutorialRect } from '@/features/onboarding/tutorial';
import { buildExplainVersePrompt } from '@/features/ai/prompts';
import { readStoredLastPosition, readStoredReaderSettings } from '@/lib/localState';
import BookPanel from '@/features/reader/BookPanel';
import VersionPanel from '@/features/reader/VersionPanel';
import SearchPanel from '@/features/search/SearchPanel';
import SettingsPanel from '@/features/settings/SettingsPanel';
import { ReaderSettingsProvider, useReaderSettings } from '@/features/settings/ReaderSettingsContext';
import { AuthProvider, useAuth } from '@/features/account/AuthContext';
import HomeScreen from '@/features/home/HomeScreen';
import TopBar from '@/features/reader/TopBar';
import CommentaryContent from '@/features/commentary/CommentaryContent';
import ChapterContent from '@/features/reader/ChapterContent';
import type { VersePopupPlacement } from '@/features/reader/popupPlacement';
import StudyContent from '@/features/study/StudyContent';
import WordsPanel, { type WordsTarget } from '@/features/words/WordsPanel';
import { ReaderPositionProvider, useReaderPosition } from '@/features/reader/ReaderPositionContext';
import { StudyItemsProvider, useStudyItems } from '@/features/study/StudyItemsContext';
type BibleAppProps = {
  initialReader?: { book: string; chapter: number } | null;
  initialPanel?: 'commentary' | 'ai' | 'study' | null;
  initialCommentarySource?: string | null;
};

export default function BibleApp(props: BibleAppProps = {}) {
  return (
    <ReaderSettingsProvider>
      <AuthProvider>
        <StudyItemsProvider>
          <ReaderPositionProvider>
            <BibleAppInner {...props} />
          </ReaderPositionProvider>
        </StudyItemsProvider>
      </AuthProvider>
    </ReaderSettingsProvider>
  );
}

// ── Main Component ─────────────────────────────────────────────────────────────
function BibleAppInner({
  initialReader = null,
  initialPanel = null,
  initialCommentarySource = null,
}: BibleAppProps = {}) {
  // ── Bible data ───
  const {
    books, setBooks,
    translations, setTranslations,
    currentBook, setCurrentBook,
    chapter, setChapter,
    translation, setTranslation,
  } = useReaderPosition();

  // ── Chapter display ───
  const [chapterData, setChapterData]   = useState<ChapterData | null>(null);
  const [chapterLoading, setChapterLoading] = useState(true);
  const [chapterError, setChapterError] = useState(false);
  const [animClass, setAnimClass]       = useState('');

  // ── Commentary ───
  const [commentaryEntries, setCommentaryEntries] = useState<CommentaryEntry[]>([]);
  const [commentaryLoading, setCommentaryLoading] = useState(false);
  const [commentaryError, setCommentaryError]     = useState(false);
  const [commentarySource, setCommentarySource]   = useState('summary');
  const [commentarySourceNames, setCommentarySourceNames] = useState<Record<string, string>>({
    matthew_henry: 'Matthew Henry Commentary',
    summary: 'Chapter Summaries',
  });
  const [commentarySources, setCommentarySources] = useState<CommentarySource[]>([]);
  const [commentarySourceMenuOpen, setCommentarySourceMenuOpen] = useState(false);
  const [personalityId, setPersonalityId] = useState<string>('jessica');
  const [agentMenuOpen, setAgentMenuOpen] = useState(false);
  const [syncedVerseStart, setSyncedVerseStart]   = useState<number | null>(null);
  /** Verses to tint after jumping from the AI sidebar (cleared after a few seconds or on manual navigation). */
  const [aiNavHighlight, setAiNavHighlight]       = useState<{ start: number; end: number } | null>(null);

  // ── UI state ───
  const [sidePanelMode, setSidePanelMode]   = useState<SidePanelMode>('none');
  const [sidePaneWidth, setSidePaneWidth]   = useState('38%');
  const [isPaneTransitioning, setIsPaneTransitioning] = useState(true);
  const [expandedBook, setExpandedBook]     = useState<number | null>(null);
  const [bookPopupOpen, setBookPopupOpen]   = useState(false);
  const [versionPanelLeft, setVersionPanelLeft] = useState(20);
  const [versionPopupOpen, setVersionPopupOpen] = useState(false);
  const [settingsOpen, setSettingsOpen]     = useState(false);
  const settingsOpenedFromHomeRef = useRef(false);
  const [searchOpen, setSearchOpen]         = useState(false);
  /** Reader: top nav revealed when the pointer nears the top edge (or while hovering it). */
  const [chromeTopShown, setChromeTopShown] = useState(true);
  /** Reader: taskbar + chapter arrows when the pointer nears the bottom edge (or while hovering them). */
  const [chromeBottomShown, setChromeBottomShown] = useState(true);
  /** Landing view: bottom taskbar only; taskbar actions enter the reader (and optional sidebar). */
  const [homeScreenActive, setHomeScreenActive] = useState(true);
  const [homeTimeGreeting, setHomeTimeGreeting] = useState('');
  const [tutorialOpen, setTutorialOpen] = useState(false);
  const [tutorialStepIndex, setTutorialStepIndex] = useState(0);
  const [readerAskBubble, setReaderAskBubble] = useState<{ top: number; left: number } | null>(null);
  const [aiComposerSeed, setAiComposerSeed] = useState<{ id: number; text: string } | undefined>();
  const [selectedVerse, setSelectedVerse]   = useState<number | null>(null);
  const [selectedVerseGroup, setSelectedVerseGroup] = useState<number[]>([]);
  const [wordsTarget, setWordsTarget] = useState<WordsTarget | null>(null);
  const [versePopupPos, setVersePopupPos]   = useState<VersePopupPlacement | null>(null);
  const [searchQuery, setSearchQuery]       = useState('');
  const [searchResults, setSearchResults]   = useState<SearchResult[]>([]);
  const [searchLoading, setSearchLoading]   = useState(false);
  const [searchError, setSearchError]       = useState<string | null>(null);
  const {
    recentPassages, setRecentPassages,
    highlightedVerses, setHighlightedVerses,
    bookmarkedVerses, setBookmarkedVerses,
    verseNotes, setVerseNotes,
    readingProgress, setReadingProgress,
    dailyGoalMinutes, setDailyGoalMinutes,
    chaptersRead, setChaptersRead,
  } = useStudyItems();
  const [readingGoalEditing, setReadingGoalEditing] = useState(false);
  const [dailyGoalsExpanded, setDailyGoalsExpanded] = useState(false);
  const { readerSettings, setReaderSettings } = useReaderSettings();
  /** In-page spreads for paged reading modes (each entry is one printed page of verses). */
  const [pagedPageSlices, setPagedPageSlices] = useState<VerseData[][] | null>(null);
  const [chapterSpreadIndex, setChapterSpreadIndex] = useState(0);
  /** Chapter-internal page flip (separate from chapter-load flip on reader-page-transition). */
  const [pagedFlipAnim, setPagedFlipAnim] = useState('');
  const [, setShowOnboarding] = useState(false);
  const [currentNoteDraft, setCurrentNoteDraft] = useState('');
  const [showVerseNoteEditor, setShowVerseNoteEditor] = useState(false);
  const { authSession, setAuthSession, accountProfile, setAccountProfile, authMode, setAuthMode, authBusy, setAuthBusy, authError, setAuthError } = useAuth();
  /** Quiz wallet balance (signed-in only); refreshed after quiz submit. */
  const [coinBalance, setCoinBalance] = useState<number | null>(null);
  const [dailyRewardsStatus, setDailyRewardsStatus] = useState<{
    verse_claimed: boolean;
    tasks_claimed: boolean;
  } | null>(null);
  const [tasksBonusClaiming, setTasksBonusClaiming] = useState(false);
  const [homeRewardToast, setHomeRewardToast] = useState<{ msg: string; visible: boolean }>({
    msg: '',
    visible: false,
  });
  const homeToastTimerRef = useRef<ReturnType<typeof setTimeout> | null>(null);

  // ── Quiz ───
  const [quizOpen, setQuizOpen] = useState(false);
  /** After a successful submit, block another attempt until book/chapter/translation changes. */
  const [quizTakenThisChapterVisit, setQuizTakenThisChapterVisit] = useState(false);
  const chapterQuizGateKeyRef = useRef('');
  const chapterQuizVisitRef = useRef<ChapterQuizVisitState>({
    visibleAccumMs: 0,
    visibleStartedAt: null,
  });
  const chapterQuizScrollDepthMaxRef = useRef(0);
  const chapterQuizPagedSpreadMaxRef = useRef(0);
  /** Engaged seconds in AI/commentary panel (same pulses as daily goal); pairs with wall clock via Math.max. */
  const chapterQuizSideEngagedDwellMsRef = useRef(0);
  const chapterQuizHasChapterRef = useRef(false);
  /** Bumps periodically so quiz gate UI (dwell timer) stays fresh. */
  const [chapterQuizGateTick, setChapterQuizGateTick] = useState(0);
  const homeScreenActiveRef = useRef(homeScreenActive);

  // ── Text-to-Speech ───
  const [ttsPlaying, setTtsPlaying]             = useState(false);
  const [ttsVoices, setTtsVoices]               = useState<SpeechSynthesisVoice[]>([]);
  const [ttsSelectedVoiceUri, setTtsSelectedVoiceUri] = useState<string | null>(null);
  const [ttsVoiceOpen, setTtsVoiceOpen]         = useState(false);
  const [ttsRate, setTtsRate]                   = useState(1.0);

  // ── Theme ───
  /** The stored preference, shared with ThemeSync and other tabs; null until hydrated (the pre-paint script owns the DOM until then). */
  const [storedTheme, setThemePreference] = useThemePreference();
  const currentTheme: ThemePreference = storedTheme ?? 'system';
  // The applied mode (for the logo): ThemeSync paints <html data-theme>; this just reads it back.
  const [appliedTheme, setAppliedTheme] = useState<AppliedTheme>('default');
  useEffect(() => {
    const root = document.documentElement;
    const read = () => {
      const t = root.getAttribute('data-theme');
      setAppliedTheme(t === 'dark' || t === 'paper' ? t : 'default');
    };
    read();
    const observer = new MutationObserver(read);
    observer.observe(root, { attributes: true, attributeFilter: ['data-theme'] });
    return () => observer.disconnect();
  }, []);

  // ── Theme management ──────────────────────────────────────────────────────────
  const applyTheme = setThemePreference;

  // ── DOM Refs ───
  const biblePaneRef  = useRef<HTMLDivElement>(null);
  const contentAreaRef = useRef<HTMLDivElement>(null);
  const sideScrollRef = useRef<HTMLDivElement>(null);
  const sidePaneRef   = useRef<HTMLElement>(null);
  const dividerRef    = useRef<HTMLDivElement>(null);
  const versionBtnRef = useRef<HTMLButtonElement>(null);
  const tutorialHomeSpotRef = useRef<HTMLDivElement>(null);
  const searchPanelRef = useRef<HTMLDivElement>(null);
  const settingsPanelRef = useRef<HTMLDivElement>(null);
  const verseStudyPopupRef = useRef<HTMLElement>(null);
  const searchInputRef = useRef<HTMLInputElement>(null);
  const commentarySourceMenuRef = useRef<HTMLDivElement>(null);
  const agentMenuRef = useRef<HTMLDivElement>(null);
  const readerPassagesRef = useRef<HTMLDivElement>(null);
  const readerSelectionPayloadRef = useRef<{ text: string; refLabel?: string } | null>(null);
  const readerSelectionRafRef = useRef<number | null>(null);

  // ── Stable refs for use in callbacks without stale closures ───
  const booksRef               = useRef<BookInfo[]>([]);
  const currentBookRef         = useRef<BookInfo | null>(null);
  const chapterRef             = useRef(1);
  const translationRef         = useRef(DEFAULT_TRANSLATION);
  const sidePanelModeRef       = useRef<SidePanelMode>('none');
  const sidePanelPositionRef   = useRef<SidePanelPosition>('right');
  const commentarySourceRef    = useRef('summary');
  const commentarySourceNamesRef = useRef<Record<string, string>>({
    matthew_henry: 'Matthew Henry Commentary',
    summary: 'Chapter Summaries',
  });
  const readerSettingsRef = useRef<ReaderSettings>(DEFAULT_READER_SETTINGS);
  const pagedPageSlicesRef = useRef<VerseData[][] | null>(null);
  const chapterSpreadIndexRef = useRef(0);
  /** Verse column (.reader-paged-content); height drives pagination vs header/footer. */
  const pagedContentRef = useRef<HTMLDivElement>(null);
  const pagedMeasureRef = useRef<HTMLDivElement>(null);
  const pagedFlipPendingRef = useRef<(() => void) | null>(null);
  const pagedFlipAnimRef = useRef('');

  // ── Imperative refs ───
  const commentaryCache     = useRef<Record<string, CommentaryEntry[]>>({});
  const lastScrollYRef      = useRef(0);
  const commSyncRafRef      = useRef<number | null>(null);
  const isDraggingRef       = useRef(false);
  const dragStartXRef       = useRef(0);
  const dragStartWidthRef   = useRef(0);
  const touchStartXRef      = useRef<number | null>(null);
  const touchStartYRef      = useRef(0);
  const touchGestureModeRef = useRef<'chapter' | 'side-toggle'>('chapter');
  const lastSidePanelModeRef = useRef<Exclude<SidePanelMode, 'none'>>('commentary');
  const searchRequestIdRef  = useRef(0);
  const pendingAiNavRef = useRef<{ start: number; end: number } | null>(null);
  const pendingFlipDataRef  = useRef<{ data: ChapterData; direction: 'next' | 'prev' } | null>(null);
  const exitAnimDoneRef     = useRef(false);
  const syncReadyRef        = useRef(false);
  const hydratingAccountRef = useRef(false);
  const accountBootstrapRef = useRef(false);
  // Whether this device had a saved reading position when the app started (set once by the init effect).
  // The position effect writes one on every change, so "has one now" cannot tell a new device apart.
  const startedWithSavedPositionRef = useRef(false);
  const initStartedRef = useRef(false);
  const chapterEngagementRef = useRef<{ key: string; lastInteractionAt: number | null }>({
    key: '',
    lastInteractionAt: null,
  });
  const visibleVersesRef = useRef<Set<number>>(new Set());
  const topVisibleVerseRef = useRef(1);
  const verseObserverRef = useRef<IntersectionObserver | null>(null);
  const engagementTimerRef = useRef<ReturnType<typeof setTimeout> | null>(null);
  const pendingEngagementRef = useRef<{
    bookName: string;
    currentChapter: number;
    currentTranslation: string;
    furthestVerse: number;
    totalVerses: number;
  } | null>(null);
  const lastEngagementCommitAtRef = useRef(0);
  /** Last activity in side panel while commentary or AI is open (for active-learning ticks). */
  const sidePanelEngagementActivityRef = useRef(0);
  const commentarySyncTimerRef = useRef<ReturnType<typeof setTimeout> | null>(null);
  const lastCommentarySyncAtRef = useRef(0);
  const chromeTopShownRef = useRef(true);
  const chromeBottomShownRef = useRef(true);
  const topChromeHoverRef = useRef(false);
  const bottomChromeHoverRef = useRef(false);
  /** After scroll-up, suppress mouse-edge hiding until the auto-hide timer fires or user scrolls down. */
  const chromeScrollRevealActiveRef = useRef(false);
  /** Reader: hide chrome 3s after last scroll-up unless the user interacts or scrolls up again. */
  const chromeScrollAutoHideTimerRef = useRef<ReturnType<typeof setTimeout> | null>(null);
  /** Latest pointer Y for chrome hide checks when leaving topbar / bottom chrome. */
  const lastPointerYRef = useRef(0);
  const lastPointerXRef = useRef(0);
  const readerChromeCtxRef = useRef({ home: true, overlay: false, coarse: false });
  const commentarySyncIdleTimerRef = useRef<ReturnType<typeof setTimeout> | null>(null);

  // Keep stable refs in sync
  useEffect(() => { booksRef.current = books; },                             [books]);
  useEffect(() => { currentBookRef.current = currentBook; },                 [currentBook]);
  useEffect(() => { chapterRef.current = chapter; },                         [chapter]);
  useEffect(() => { translationRef.current = translation; },                 [translation]);
  useEffect(() => { sidePanelModeRef.current = sidePanelMode; },             [sidePanelMode]);
  useEffect(() => {
    if (sidePanelMode !== 'none') lastSidePanelModeRef.current = sidePanelMode;
  }, [sidePanelMode]);
  useEffect(() => { sidePanelPositionRef.current = readerSettings.sidePanelPosition; }, [readerSettings.sidePanelPosition]);
  useEffect(() => { commentarySourceRef.current = commentarySource; },       [commentarySource]);
  useEffect(() => { commentarySourceNamesRef.current = commentarySourceNames; }, [commentarySourceNames]);
  useEffect(() => { readerSettingsRef.current = readerSettings; },           [readerSettings]);
  useEffect(() => { pagedPageSlicesRef.current = pagedPageSlices; },           [pagedPageSlices]);
  useEffect(() => { chapterSpreadIndexRef.current = chapterSpreadIndex; },   [chapterSpreadIndex]);
  useEffect(() => { pagedFlipAnimRef.current = pagedFlipAnim; },               [pagedFlipAnim]);
  useEffect(() => { chromeTopShownRef.current = chromeTopShown; },             [chromeTopShown]);
  useEffect(() => { chromeBottomShownRef.current = chromeBottomShown; },       [chromeBottomShown]);
  useEffect(() => { homeScreenActiveRef.current = homeScreenActive; },         [homeScreenActive]);
  useEffect(() => {
    chapterQuizHasChapterRef.current = Boolean(chapterData?.verses?.length);
  }, [chapterData?.verses?.length]);

  useEffect(() => {
    readerChromeCtxRef.current = {
      ...readerChromeCtxRef.current,
      home: homeScreenActive,
      overlay: bookPopupOpen || versionPopupOpen || searchOpen || settingsOpen,
      coarse: typeof window !== 'undefined' && window.matchMedia('(pointer: coarse)').matches,
    };
  }, [homeScreenActive, bookPopupOpen, versionPopupOpen, searchOpen, settingsOpen]);

  useEffect(() => {
    if (typeof window === 'undefined') return;
    const mq = window.matchMedia('(pointer: coarse)');
    const onChange = () => {
      readerChromeCtxRef.current = {
        ...readerChromeCtxRef.current,
        coarse: mq.matches,
      };
    };
    mq.addEventListener('change', onChange);
    return () => mq.removeEventListener('change', onChange);
  }, []);

  useEffect(() => {
    if (homeScreenActive) {
      chromeScrollRevealActiveRef.current = false;
      if (chromeScrollAutoHideTimerRef.current) {
        clearTimeout(chromeScrollAutoHideTimerRef.current);
        chromeScrollAutoHideTimerRef.current = null;
      }
      setChromeTopShown(true);
      setChromeBottomShown(true);
    } else {
      setChromeTopShown(false);
      setChromeBottomShown(false);
    }
  }, [homeScreenActive]);

  useEffect(() => {
    if (typeof window === 'undefined') return;
    const onMove = (e: MouseEvent) => {
      lastPointerYRef.current = e.clientY;
      lastPointerXRef.current = e.clientX;
      const { home, overlay, coarse } = readerChromeCtxRef.current;
      if (home || overlay || coarse) return;
      const x = e.clientX;
      const y = e.clientY;
      const h = window.innerHeight;
      const w = window.innerWidth;
      const topZone = h * 0.2;
      const bottomZone = h * 0.2;
      if (y <= topZone || topChromeHoverRef.current) setChromeTopShown(true);
      else if (!topChromeHoverRef.current && !chromeScrollRevealActiveRef.current) setChromeTopShown(false);
      // Paged mode: corner prev/next buttons sit in the bottom band — don't auto-reveal the taskbar there.
      const chNavCornerPx = 100;
      const inPagedChNavCorner =
        isPagedReadingMode(readerSettingsRef.current.readingMode) &&
        y >= h - bottomZone &&
        (x <= chNavCornerPx || x >= w - chNavCornerPx);
      if (inPagedChNavCorner) {
        if (!bottomChromeHoverRef.current) setChromeBottomShown(false);
      } else if (y >= h - bottomZone || bottomChromeHoverRef.current) {
        setChromeBottomShown(true);
      } else if (!bottomChromeHoverRef.current && !chromeScrollRevealActiveRef.current) {
        setChromeBottomShown(false);
      }
    };
    window.addEventListener('mousemove', onMove, { passive: true });
    return () => {
      window.removeEventListener('mousemove', onMove);
    };
  }, []);

  const enterBottomChrome = useCallback(() => {
    bottomChromeHoverRef.current = true;
    setChromeBottomShown(true);
  }, []);

  const leaveBottomChrome = useCallback(() => {
    bottomChromeHoverRef.current = false;
    if (chromeScrollRevealActiveRef.current) return;
    const h = typeof window !== 'undefined' ? window.innerHeight : 0;
    if (h === 0) return;
    const bottomZone = h * 0.2;
    if (lastPointerYRef.current < h - bottomZone) setChromeBottomShown(false);
  }, []);

  const scheduleChromeScrollAutoHide = useCallback(() => {
    if (typeof window === 'undefined') return;
    if (chromeScrollAutoHideTimerRef.current) {
      clearTimeout(chromeScrollAutoHideTimerRef.current);
      chromeScrollAutoHideTimerRef.current = null;
    }
    chromeScrollAutoHideTimerRef.current = setTimeout(() => {
      chromeScrollAutoHideTimerRef.current = null;
      const ctx = readerChromeCtxRef.current;
      chromeScrollRevealActiveRef.current = false;
      if (ctx.home || ctx.overlay) return;
      if (topChromeHoverRef.current || bottomChromeHoverRef.current) return;
      const h = window.innerHeight;
      const w = window.innerWidth;
      if (h === 0) return;
      const py = lastPointerYRef.current;
      const px = lastPointerXRef.current;
      const topZone = h * 0.2;
      const bottomZone = h * 0.2;
      const chNavCornerPx = 100;
      const inPagedChNavCorner =
        isPagedReadingMode(readerSettingsRef.current.readingMode) &&
        py >= h - bottomZone &&
        (px <= chNavCornerPx || px >= w - chNavCornerPx);
      if (py > topZone) {
        setChromeTopShown(false);
        chromeTopShownRef.current = false;
      }
      if (py < h - bottomZone && !inPagedChNavCorner) {
        setChromeBottomShown(false);
        chromeBottomShownRef.current = false;
      }
    }, 3000);
  }, []);

  /** Resets the 3s auto-hide countdown while chrome was revealed by scrolling up. */
  const bumpChromeScrollInteraction = useCallback(() => {
    const ctx = readerChromeCtxRef.current;
    if (ctx.home || ctx.overlay) return;
    if (!chromeScrollRevealActiveRef.current) return;
    scheduleChromeScrollAutoHide();
  }, [scheduleChromeScrollAutoHide]);

  useEffect(() => {
    setPersonalityId(restorePersonalityId());
  }, []);

  useEffect(() => {
    const noteKey = currentBook && selectedVerse != null
      ? verseStorageKey(currentBook.name, chapter, selectedVerse)
      : null;
    if (!noteKey) {
      setCurrentNoteDraft('');
      setShowVerseNoteEditor(false);
      return;
    }
    setCurrentNoteDraft(verseNotes[noteKey]?.text ?? '');
  }, [chapter, currentBook, selectedVerse, verseNotes]);

  useEffect(() => {
    setReadingProgress(prev => {
      const today = computeTodayIso();
      return syncGoalCompletion(prev, dailyGoalMinutes, today);
    });
  }, [dailyGoalMinutes]);

  useEffect(() => {
    if (typeof window === 'undefined') return;
    document.documentElement.dataset.readerScale = readerSettings.fontScale;
    document.documentElement.dataset.readerLineHeight = readerSettings.lineHeight;
    document.documentElement.dataset.readerFont = readerSettings.readerFont;
    applyReaderHighlightVars(readerSettings.highlightColor);
    if (!readerSettings.specialEffects) document.documentElement.setAttribute('data-reduced-motion', '1');
    else document.documentElement.removeAttribute('data-reduced-motion');
    document.documentElement.removeAttribute('data-high-contrast');
  }, [readerSettings]);

  useEffect(() => {
    const handlePointerDown = (event: MouseEvent) => {
      if (!commentarySourceMenuRef.current?.contains(event.target as Node)) {
        setCommentarySourceMenuOpen(false);
      }
      if (!agentMenuRef.current?.contains(event.target as Node)) {
        setAgentMenuOpen(false);
      }
      const ttsCenter = document.querySelector('.tts-center');
      if (!ttsCenter?.contains(event.target as Node)) {
        setTtsVoiceOpen(false);
      }
    };
    const handleKeyDown = (event: KeyboardEvent) => {
      if (event.key === 'Escape') {
        setCommentarySourceMenuOpen(false);
        setAgentMenuOpen(false);
        setTtsVoiceOpen(false);
      }
    };
    document.addEventListener('mousedown', handlePointerDown);
    document.addEventListener('keydown', handleKeyDown);
    return () => {
      document.removeEventListener('mousedown', handlePointerDown);
      document.removeEventListener('keydown', handleKeyDown);
    };
  }, []);

  // ── Derived ───────────────────────────────────────────────────────────────────
  const isFirstChapter = useCallback(() => {
    const b = currentBookRef.current;
    return b?.book_number === 1 && chapterRef.current === 1;
  }, []);

  const isLastChapter = useCallback(() => {
    const b = currentBookRef.current;
    return !!b && b.book_number === 66 && chapterRef.current === b.total_chapters;
  }, []);

  // ── Commentary loading ─────────────────────────────────────────────────────────
  const loadCommentaryData = useCallback(async (
    book: BookInfo, ch: number, source: string,
  ) => {
    const key = `${book.book_number}:${ch}:${source}`;
    if (commentaryCache.current[key]) {
      setCommentaryEntries(commentaryCache.current[key]);
      setCommentaryLoading(false);
      setCommentaryError(false);
      return;
    }
    setCommentaryLoading(true);
    setCommentaryError(false);
    try {
      const entries: CommentaryEntry[] = await fetch(
        `/api/v1/commentary?book=${encodeURIComponent(book.name)}&chapter=${ch}&source=${encodeURIComponent(source)}`
      ).then(r => { if (!r.ok) throw new Error(); return r.json(); });
      commentaryCache.current[key] = entries;
      setCommentaryEntries(entries);
      setCommentaryLoading(false);
    } catch {
      setCommentaryEntries([]);
      setCommentaryError(true);
      setCommentaryLoading(false);
    }
  }, []);

  // ── Chapter loading ────────────────────────────────────────────────────────────
  const loadChapter = useCallback(async (
    book: BookInfo, ch: number, trans: string, direction: 'next' | 'prev' | null = null,
    opts?: { fromAiNavigate?: boolean },
  ) => {
    if (!opts?.fromAiNavigate) {
      pendingAiNavRef.current = null;
      setAiNavHighlight(null);
    }

    const useFlip = direction != null
      && readerSettingsRef.current.pageFlipEnabled
      && readerSettingsRef.current.specialEffects;

    setChapterError(false);

    if (useFlip) {
      exitAnimDoneRef.current = false;
      pendingFlipDataRef.current = null;
      // Start exit animation immediately; keep old chapterData visible
      setAnimClass(direction === 'next' ? 'page-flip-exit-next' : 'page-flip-exit-prev');
    } else {
      setChapterLoading(true);
      setChapterData(null);
      setAnimClass('');
    }

    try {
      const data: ChapterData = await fetch(
        `/api/v1/chapters/${encodeURIComponent(book.name)}/${ch}?translation=${encodeURIComponent(trans)}`
      ).then(r => { if (!r.ok) throw new Error(); return r.json(); });

      if (useFlip) {
        if (exitAnimDoneRef.current) {
          // Exit animation already finished — show new content immediately
          setChapterData(data);
          setChapterLoading(false);
          setAnimClass(direction === 'next' ? 'page-flip-enter-next' : 'page-flip-enter-prev');
          if (biblePaneRef.current) biblePaneRef.current.scrollTop = 0;
          if (sidePanelModeRef.current === 'commentary') {
            loadCommentaryData(book, ch, commentarySourceRef.current);
          }
        } else {
          // Exit animation still running — hand off to onAnimationEnd
          pendingFlipDataRef.current = { data, direction };
        }
      } else {
        setChapterData(data);
        setChapterLoading(false);
        if (biblePaneRef.current) biblePaneRef.current.scrollTop = 0;
        if (sidePanelModeRef.current === 'commentary') {
          loadCommentaryData(book, ch, commentarySourceRef.current);
        }
      }
    } catch {
      pendingAiNavRef.current = null;
      pendingFlipDataRef.current = null;
      setChapterError(true);
      setChapterLoading(false);
      setAnimClass('');
    }
  }, [loadCommentaryData]);

  // ── Navigation ─────────────────────────────────────────────────────────────────
  const goPrev = useCallback(() => {
    const book = currentBookRef.current;
    const books = booksRef.current;
    if (!book || isFirstChapter()) return;
    if (chapterRef.current > 1) {
      const ch = chapterRef.current - 1;
      setChapter(ch);
      loadChapter(book, ch, translationRef.current, 'prev');
    } else {
      const prevBook = books.find(b => b.book_number === book.book_number - 1);
      if (!prevBook) return;
      setCurrentBook(prevBook);
      setChapter(prevBook.total_chapters);
      loadChapter(prevBook, prevBook.total_chapters, translationRef.current, 'prev');
    }
  }, [isFirstChapter, loadChapter]);

  const goNext = useCallback(() => {
    const book = currentBookRef.current;
    const books = booksRef.current;
    if (!book || isLastChapter()) return;
    if (chapterRef.current < book.total_chapters) {
      const ch = chapterRef.current + 1;
      setChapter(ch);
      loadChapter(book, ch, translationRef.current, 'next');
    } else {
      const nextBook = books.find(b => b.book_number === book.book_number + 1);
      if (!nextBook) return;
      setCurrentBook(nextBook);
      setChapter(1);
      loadChapter(nextBook, 1, translationRef.current, 'next');
    }
  }, [isLastChapter, loadChapter]);

  const readerStepForward = useCallback(() => {
    const book = currentBookRef.current;
    if (!book) return;
    const mode = readerSettingsRef.current.readingMode;
    if (!isPagedReadingMode(mode)) {
      goNext();
      return;
    }
    const slices = pagedPageSlicesRef.current;
    if (!slices?.length) {
      goNext();
      return;
    }
    const numSpreads = mode === 'paged-double' ? Math.ceil(slices.length / 2) : slices.length;
    const ix = chapterSpreadIndexRef.current;
    if (ix < numSpreads - 1) {
      const doAdvance = () => { setChapterSpreadIndex(ix + 1); };
      const fx = readerSettingsRef.current.pageFlipEnabled && readerSettingsRef.current.specialEffects;
      if (fx) {
        pagedFlipPendingRef.current = () => {
          doAdvance();
          setPagedFlipAnim('page-flip-enter-next');
        };
        setPagedFlipAnim('page-flip-exit-next');
      } else {
        doAdvance();
      }
      return;
    }
    goNext();
  }, [goNext]);

  const readerStepBack = useCallback(() => {
    const book = currentBookRef.current;
    if (!book) return;
    const mode = readerSettingsRef.current.readingMode;
    if (!isPagedReadingMode(mode)) {
      goPrev();
      return;
    }
    const slices = pagedPageSlicesRef.current;
    if (!slices?.length) {
      goPrev();
      return;
    }
    const ix = chapterSpreadIndexRef.current;
    if (ix > 0) {
      const doBack = () => { setChapterSpreadIndex(ix - 1); };
      const fx = readerSettingsRef.current.pageFlipEnabled && readerSettingsRef.current.specialEffects;
      if (fx) {
        pagedFlipPendingRef.current = () => {
          doBack();
          setPagedFlipAnim('page-flip-enter-prev');
        };
        setPagedFlipAnim('page-flip-exit-prev');
      } else {
        doBack();
      }
      return;
    }
    goPrev();
  }, [goPrev]);

  const pickChapter = useCallback((bookNumber: number, ch: number) => {
    const book = booksRef.current.find(b => b.book_number === bookNumber);
    if (!book) return;
    setCurrentBook(book);
    setChapter(ch);
    setExpandedBook(null);
    setBookPopupOpen(false);
    setSearchOpen(false);
    loadChapter(book, ch, translationRef.current);
  }, [loadChapter]);

  const pickTranslation = useCallback((id: string) => {
    setTranslation(id);
    setVersionPopupOpen(false);
    setSearchOpen(false);
    const book = currentBookRef.current;
    if (book) loadChapter(book, chapterRef.current, id);
  }, [loadChapter]);

  const navigateToPassage = useCallback((
    bookName: string | null | undefined,
    nextChapter: number,
    nextTranslation?: string,
    verseNumber?: number,
  ) => {
    if (bookName == null || bookName === '') return false;
    const needle = bookName.toLowerCase();
    const targetBook = booksRef.current.find(book => book.name?.toLowerCase() === needle);
    if (!targetBook) return false;
    if (verseNumber != null) {
      pendingAiNavRef.current = { start: verseNumber, end: verseNumber };
    } else {
      pendingAiNavRef.current = null;
      setAiNavHighlight(null);
    }
    const chosenTranslation = normalizeTranslationChoice(nextTranslation ?? translationRef.current);
    setCurrentBook(targetBook);
    setChapter(nextChapter);
    setTranslation(chosenTranslation);
    setBookPopupOpen(false);
    setVersionPopupOpen(false);
    setSearchOpen(false);
    loadChapter(targetBook, nextChapter, chosenTranslation, null, { fromAiNavigate: verseNumber != null });
    return true;
  }, [loadChapter]);

  // ── Side panel ────────────────────────────────────────────────────────────────
  const openSidePanel = useCallback((mode: Exclude<SidePanelMode, 'none'>) => {
    lastSidePanelModeRef.current = mode;
    setSidePanelMode(mode);
    if (mode === 'commentary') {
      const book = currentBookRef.current;
      if (book) loadCommentaryData(book, chapterRef.current, commentarySourceRef.current);
    }
  }, [loadCommentaryData]);

  const closeVerseStudyPopup = useCallback(() => {
    setSelectedVerse(null);
    setSelectedVerseGroup([]);
    setVersePopupPos(null);
    setShowVerseNoteEditor(false);
  }, []);

  const openOriginalWords = useCallback((verse: number) => {
    const book = currentBookRef.current;
    if (!book) return;
    setWordsTarget({ bookNumber: book.book_number, bookName: book.name, chapter: chapterRef.current, verse });
    // Close the floating verse card and clear the selection: the next tap starts a fresh
    // single-verse selection, positioned with the pane already open. The panel keeps its own target.
    closeVerseStudyPopup();
    openSidePanel('words');
  }, [closeVerseStudyPopup, openSidePanel]);

  const closeSidePanel = useCallback(() => {
    setSidePanelMode('none');
    setSyncedVerseStart(null);
    setCommentaryEntries([]);
  }, []);

  const toggleCommentary = useCallback(() => {
    sidePanelModeRef.current === 'commentary' ? closeSidePanel() : openSidePanel('commentary');
  }, [closeSidePanel, openSidePanel]);

  const toggleAiPanel = useCallback(() => {
    sidePanelModeRef.current === 'ai' ? closeSidePanel() : openSidePanel('ai');
  }, [closeSidePanel, openSidePanel]);

  const toggleStudyPanel = useCallback(() => {
    sidePanelModeRef.current === 'study' ? closeSidePanel() : openSidePanel('study');
  }, [closeSidePanel, openSidePanel]);

  const refreshCoinBalance = useCallback(() => {
    const session = authSession;
    if (!session) {
      setCoinBalance(null);
      return;
    }
    getWallet(session)
      .then((w: WalletOut) => setCoinBalance(w.balance))
      .catch(() => setCoinBalance(null));
  }, [authSession]);

  useEffect(() => {
    refreshCoinBalance();
  }, [refreshCoinBalance]);

  const showHomeToast = useCallback((msg: string) => {
    if (homeToastTimerRef.current) clearTimeout(homeToastTimerRef.current);
    setHomeRewardToast({ msg, visible: true });
    homeToastTimerRef.current = setTimeout(() => {
      setHomeRewardToast(t => ({ ...t, visible: false }));
    }, 2800);
  }, []);

  const refreshDailyRewardsStatus = useCallback(() => {
    const session = authSession;
    if (!session) {
      setDailyRewardsStatus(null);
      return;
    }
    getDailyRewardsStatus(session)
      .then(s => setDailyRewardsStatus({ verse_claimed: s.verse_claimed, tasks_claimed: s.tasks_claimed }))
      .catch(() => setDailyRewardsStatus(null));
  }, [authSession]);

  useEffect(() => {
    refreshDailyRewardsStatus();
  }, [refreshDailyRewardsStatus]);

  useEffect(() => {
    return () => {
      if (homeToastTimerRef.current) clearTimeout(homeToastTimerRef.current);
    };
  }, []);

  const handleClaimDailyTasksBonus = useCallback(async () => {
    if (!authSession) return;
    setTasksBonusClaiming(true);
    try {
      const r = await claimDailyTasksBonus(authSession);
      setCoinBalance(r.balance);
      setDailyRewardsStatus(prev => ({
        verse_claimed: prev?.verse_claimed ?? false,
        tasks_claimed: true,
      }));
      if (r.already_claimed) {
        showHomeToast('Daily bonus already claimed today.');
      } else {
        showHomeToast(`+${r.coins_awarded} coins — all daily tasks done!`);
      }
    } catch {
      showHomeToast('Could not claim bonus. Try again.');
    } finally {
      setTasksBonusClaiming(false);
    }
  }, [authSession, showHomeToast]);

  const openReaderFromHome = useCallback((panel: SidePanelMode) => {
    setHomeScreenActive(false);
    setSettingsOpen(false);
    setSearchOpen(false);
    setBookPopupOpen(false);
    setVersionPopupOpen(false);
    if (panel === 'none') {
      closeSidePanel();
    } else {
      openSidePanel(panel);
    }
  }, [closeSidePanel, openSidePanel]);

  const goToHome = useCallback(() => {
    setHomeScreenActive(true);
    setSettingsOpen(false);
    setSearchOpen(false);
    setBookPopupOpen(false);
    setVersionPopupOpen(false);
    closeSidePanel();
  }, [closeSidePanel]);

  const openTutorial = useCallback((startIndex = 0) => {
    setTutorialStepIndex(startIndex);
    setTutorialOpen(true);
    goToHome();
  }, [goToHome]);

  const closeTutorial = useCallback(() => {
    setTutorialOpen(false);
  }, []);

  const openSearchFromTutorial = useCallback(() => {
    setHomeScreenActive(false);
    setSettingsOpen(false);
    closeSidePanel();
    setBookPopupOpen(false);
    setVersionPopupOpen(false);
    setSearchOpen(true);
  }, [closeSidePanel]);

  const openStudyFromTutorial = useCallback(() => {
    setHomeScreenActive(false);
    setSettingsOpen(false);
    setSearchOpen(false);
    setBookPopupOpen(false);
    setVersionPopupOpen(false);
    openSidePanel('study');
  }, [openSidePanel]);

  const openSettingsFromTutorial = useCallback(() => {
    settingsOpenedFromHomeRef.current = true;
    setHomeScreenActive(true);
    setSearchOpen(false);
    setBookPopupOpen(false);
    setVersionPopupOpen(false);
    closeSidePanel();
    setSettingsOpen(true);
  }, [closeSidePanel]);

  useEffect(() => {
    if (!homeScreenActive) return;
    const refresh = () => setHomeTimeGreeting(timeOfDayGreeting(new Date()));
    refresh();
    const intervalId = window.setInterval(refresh, 60_000);
    return () => window.clearInterval(intervalId);
  }, [homeScreenActive]);

  const reopenLastSidePanel = useCallback(() => {
    const preferredDefault = readerSettingsRef.current.defaultPanel;
    const preferred =
      preferredDefault === 'none' ? lastSidePanelModeRef.current : preferredDefault;
    openSidePanel(preferred);
  }, [openSidePanel]);

  const tutorialSteps = useMemo<TutorialStep[]>(() => ([
    {
      id: 'home',
      title: 'Home',
      instruction:
        'Verse of the day, your streak and daily chapter goal, and Continue where you left off are highlighted here—tap any of them to start or resume reading.',
    },
    {
      id: 'reader',
      title: 'Translation',
      instruction: `Tap the translation control next to the book (${getTranslationDisplayId(translation)}) to choose another Bible version.`,
    },
    {
      id: 'search',
      title: 'Search',
      instruction: 'Type a reference or phrase here, then tap a suggestion to go straight to it.',
    },
    {
      id: 'verse-tools',
      title: 'Verse Tools',
      instruction: `John 3:${TUTORIAL_VERSE_TOOLS_VERSE} is outlined below—tap it to open the study card. Use the preview buttons to see what each tool does (they won't run until you open the card).`,
    },
    {
      id: 'commentary',
      title: 'Resources',
      instruction: 'Use this side panel for chapter summaries and other resources beside the chapter without losing your place.',
    },
    {
      id: 'ai',
      title: 'Ask AI',
      instruction: `Ask ${PERSONALITIES.find(p => p.id === personalityId)?.name ?? 'Ruth'} about the chapter, or use Ask AI from a selected verse.`,
    },
    {
      id: 'study',
      title: 'My Stuff',
      instruction:
        'Your highlights, notes, bookmarks, and reading streak live here. With an account you can sync study data across devices, manage your profile, and keep your rhythm in one place.',
    },
    {
      id: 'settings',
      title: 'Settings',
      instruction: 'Adjust theme, text size, layout, and effects here to make reading feel right.',
    },
  ]), [personalityId, translation]);

  const tutorialStep = tutorialSteps[tutorialStepIndex] ?? tutorialSteps[0];
  /** Verse Tools step: after user opens the study card, spotlight targets the card instead of the verse line. */
  const tutorialVerseToolsStudyOpen =
    tutorialOpen &&
    tutorialStep.id === 'verse-tools' &&
    selectedVerse !== null &&
    versePopupPos !== null;
  const tutorialVerseToolsNavBlocked = tutorialOpen && tutorialStep.id === 'verse-tools';
  const spotlightOnRight = readerSettings.sidePanelPosition === 'right';
  const [tutorialSpotBounds, setTutorialSpotBounds] = useState<{
    top: number;
    left: number;
    width: number;
    height: number;
  } | null>(null);

  const tutorialFallbackBounds = useMemo(() => {
    if (typeof window === 'undefined') {
      return { top: 80, left: 16, width: 400, height: 300 };
    }
    const vw = window.innerWidth;
    const vh = window.innerHeight;
    switch (tutorialStep.id) {
      case 'home':
        return { top: 72, left: Math.max(20, vw / 2 - 260), width: Math.min(520, vw - 40), height: vh - 160 };
      case 'reader':
        return { top: 56, left: 16, width: vw - 32, height: vh - 120 };
      case 'search':
        return { top: 64, left: Math.max(12, vw - Math.min(540, vw - 24) - 12), width: Math.min(540, vw - 24), height: 320 };
      case 'verse-tools':
        return { top: 150, left: vw / 2 + 12, width: 280, height: 340 };
      case 'commentary':
      case 'ai':
      case 'study':
        return spotlightOnRight
          ? { top: 64, left: vw - Math.min(vw * 0.42, 560), width: Math.min(vw * 0.42, 560), height: vh - 124 }
          : { top: 64, left: 0, width: Math.min(vw * 0.42, 560), height: vh - 124 };
      case 'settings':
        return { top: 72, left: Math.max(20, vw / 2 - 260), width: Math.min(520, vw - 40), height: vh - 144 };
      default:
        return { top: 96, left: 24, width: 320, height: 220 };
    }
  }, [spotlightOnRight, tutorialStep.id]);

  const tutorialSpotRect = useMemo(
    () => boundsToTutorialRect(tutorialSpotBounds ?? tutorialFallbackBounds),
    [tutorialSpotBounds, tutorialFallbackBounds],
  );

  useLayoutEffect(() => {
    if (!tutorialOpen) {
      setTutorialSpotBounds(null);
      return;
    }
    const id = tutorialStep.id;
    const getTarget = (): HTMLElement | null => {
      switch (id) {
        case 'home':
          return tutorialHomeSpotRef.current;
        case 'reader':
          return versionBtnRef.current;
        case 'search':
          return searchPanelRef.current;
        case 'verse-tools': {
          if (selectedVerse !== null && versePopupPos !== null && verseStudyPopupRef.current) {
            return verseStudyPopupRef.current;
          }
          return (
            readerPassagesRef.current?.querySelector<HTMLElement>(
              `[data-verse="${TUTORIAL_VERSE_TOOLS_VERSE}"]`,
            ) ?? null
          );
        }
        case 'commentary':
        case 'ai':
        case 'study':
          return sidePaneRef.current;
        case 'settings':
          return settingsPanelRef.current;
        default:
          return null;
      }
    };

    const measure = () => {
      const el = getTarget();
      if (!el) {
        setTutorialSpotBounds(null);
        return;
      }
      void el.offsetHeight;
      const rect = el.getBoundingClientRect();
      if (rect.width < 2 || rect.height < 2) {
        setTutorialSpotBounds(null);
        return;
      }
      if (id === 'verse-tools') {
        const pad = selectedVerse !== null && versePopupPos !== null ? 8 : 6;
        const vw = window.innerWidth;
        const vh = window.innerHeight;
        const top = Math.max(0, rect.top - pad);
        const left = Math.max(0, rect.left - pad);
        const right = Math.min(vw, rect.right + pad);
        const bottom = Math.min(vh, rect.bottom + pad);
        setTutorialSpotBounds({
          top,
          left,
          width: Math.max(0, right - left),
          height: Math.max(0, bottom - top),
        });
        return;
      }
      setTutorialSpotBounds({
        top: rect.top,
        left: rect.left,
        width: rect.width,
        height: rect.height,
      });
    };

    measure();
    const el = getTarget();
    const rafId = window.requestAnimationFrame(measure);
    const settleId = window.setTimeout(measure, 360);
    const verseExtraTimers: number[] =
      id === 'verse-tools'
        ? [120, 260, 520].map(ms => window.setTimeout(measure, ms))
        : [];
    const ro = typeof ResizeObserver !== 'undefined' ? new ResizeObserver(measure) : null;
    const observeTarget =
      el ??
      (id === 'verse-tools'
        ? selectedVerse !== null && versePopupPos !== null
          ? verseStudyPopupRef.current
          : readerPassagesRef.current
        : null);
    if (observeTarget && ro) ro.observe(observeTarget);
    const pane = sidePaneRef.current;
    window.addEventListener('resize', measure);
    window.addEventListener('scroll', measure, { passive: true, capture: true });
    pane?.addEventListener('transitionend', measure);

    return () => {
      window.cancelAnimationFrame(rafId);
      window.clearTimeout(settleId);
      verseExtraTimers.forEach(t => window.clearTimeout(t));
      ro?.disconnect();
      window.removeEventListener('resize', measure);
      window.removeEventListener('scroll', measure, true);
      pane?.removeEventListener('transitionend', measure);
    };
  }, [
    chapterData?.book,
    chapterData?.chapter,
    chapterLoading,
    chapterSpreadIndex,
    homeScreenActive,
    isPaneTransitioning,
    pagedPageSlices,
    readerSettings.readingMode,
    searchOpen,
    settingsOpen,
    sidePanelMode,
    sidePaneWidth,
    tutorialOpen,
    tutorialStep.id,
    selectedVerse,
    versePopupPos,
    showVerseNoteEditor,
  ]);

  /** CSS custom-property vars passed to the overlay container so pieces can use them. */
  const tutorialOverlayVars = useMemo<CSSProperties>(() => ({
    ['--spot-top' as string]: tutorialSpotRect.top,
    ['--spot-left' as string]: tutorialSpotRect.left,
    ['--spot-width' as string]: tutorialSpotRect.width,
    ['--spot-height' as string]: tutorialSpotRect.height,
  }), [tutorialSpotRect]);

  /** Positional style applied only to the spotlight highlight box. */
  const tutorialSpotlightStyle = useMemo<CSSProperties>(() => ({
    top: tutorialSpotRect.top,
    left: tutorialSpotRect.left,
    width: tutorialSpotRect.width,
    height: tutorialSpotRect.height,
  }), [tutorialSpotRect]);

  /** Verse Tools: four transparent hit targets leave the spotlight hole clickable (full-screen catcher blocks it). */
  const tutorialVerseToolsBlockers = useMemo(() => {
    if (tutorialStep.id !== 'verse-tools' || !tutorialSpotBounds) return null;
    if (typeof window === 'undefined') return null;
    const b = tutorialSpotBounds;
    const vh = window.innerHeight;
    const vw = window.innerWidth;
    return {
      top: { top: 0, left: 0, width: vw, height: b.top },
      bottom: {
        top: b.top + b.height,
        left: 0,
        width: vw,
        height: Math.max(0, vh - b.top - b.height),
      },
      left: { top: b.top, left: 0, width: b.left, height: b.height },
      right: {
        top: b.top,
        left: b.left + b.width,
        width: Math.max(0, vw - b.left - b.width),
        height: b.height,
      },
    };
  }, [tutorialStep.id, tutorialSpotBounds]);

  const runTutorialStepAction = useCallback((stepId: string) => {
    setSearchError(null);
    setSearchResults([]);
    switch (stepId) {
      case 'home':
        goToHome();
        break;
      case 'reader':
        navigateToPassage('John', 3, translationRef.current);
        openReaderFromHome('none');
        break;
      case 'verse-tools':
        navigateToPassage('John', 3, translationRef.current, TUTORIAL_VERSE_TOOLS_VERSE);
        openReaderFromHome('none');
        setSelectedVerse(null);
        setSelectedVerseGroup([]);
        setVersePopupPos(null);
        break;
      case 'search':
        setSearchQuery('Romans 8:28');
        openSearchFromTutorial();
        break;
      case 'commentary':
        navigateToPassage('John', 3, translationRef.current, TUTORIAL_VERSE_TOOLS_VERSE);
        openReaderFromHome('commentary');
        break;
      case 'ai':
        navigateToPassage('John', 3, translationRef.current, TUTORIAL_VERSE_TOOLS_VERSE);
        openReaderFromHome('ai');
        setAiComposerSeed({
          id: Date.now(),
          text: 'What does John 3 teach about being born again? Give me a simple explanation.',
        });
        break;
      case 'study':
        navigateToPassage('John', 3, translationRef.current, TUTORIAL_VERSE_TOOLS_VERSE);
        openStudyFromTutorial();
        break;
      case 'settings':
        openSettingsFromTutorial();
        break;
      default:
        break;
    }
  }, [
    goToHome,
    navigateToPassage,
    openReaderFromHome,
    openSearchFromTutorial,
    openSettingsFromTutorial,
    openStudyFromTutorial,
    tutorialStepIndex,
  ]);

  useEffect(() => {
    if (!tutorialOpen) return;
    runTutorialStepAction(tutorialStep.id);
  }, [runTutorialStepAction, tutorialOpen, tutorialStep.id]);

  useEffect(() => {
    if (!tutorialOpen || tutorialStep.id !== 'verse-tools') return;
    if (homeScreenActive || chapterLoading || chapterError) return;
    if (chapterData?.book !== 'John' || chapterData.chapter !== 3) return;
    if (selectedVerse !== null && versePopupPos !== null) return;

    const centerVerse = () => {
      const verseEl = readerPassagesRef.current?.querySelector<HTMLElement>(
        `[data-verse="${TUTORIAL_VERSE_TOOLS_VERSE}"]`,
      );
      if (!verseEl) return;
      scrollVerseLineIntoBiblePaneCenter(verseEl, biblePaneRef.current);
    };

    const t0 = window.setTimeout(centerVerse, 0);
    const t1 = window.setTimeout(centerVerse, 100);
    const t2 = window.setTimeout(centerVerse, 400);
    const t3 = window.setTimeout(centerVerse, 650);
    return () => {
      window.clearTimeout(t0);
      window.clearTimeout(t1);
      window.clearTimeout(t2);
      window.clearTimeout(t3);
    };
  }, [
    chapterData,
    chapterError,
    chapterLoading,
    homeScreenActive,
    selectedVerse,
    tutorialOpen,
    tutorialStep.id,
    tutorialStepIndex,
    versePopupPos,
  ]);

  useEffect(() => {
    if (!tutorialOpen) return;
    const onKeyDown = (event: KeyboardEvent) => {
      if (event.key === 'ArrowRight') {
        setTutorialStepIndex(index => Math.min(index + 1, tutorialSteps.length - 1));
        return;
      }
      if (event.key === 'ArrowLeft') {
        setTutorialStepIndex(index => Math.max(index - 1, 0));
      }
    };
    window.addEventListener('keydown', onKeyDown);
    return () => window.removeEventListener('keydown', onKeyDown);
  }, [tutorialOpen, tutorialSteps.length]);

  useEffect(() => {
    if (!tutorialOpen) return;
    const prevOverflow = document.body.style.overflow;
    document.body.style.overflow = 'hidden';
    return () => {
      document.body.style.overflow = prevOverflow;
    };
  }, [tutorialOpen]);

  useEffect(() => {
    if (!tutorialOpen) return;
    const blockScroll = (e: WheelEvent | TouchEvent) => {
      if (tutorialStep.id === 'verse-tools' && biblePaneRef.current) {
        const target = e.target;
        if (target instanceof Node && biblePaneRef.current.contains(target)) {
          return;
        }
      }
      e.preventDefault();
    };
    document.addEventListener('wheel', blockScroll, { passive: false });
    document.addEventListener('touchmove', blockScroll, { passive: false });
    return () => {
      document.removeEventListener('wheel', blockScroll);
      document.removeEventListener('touchmove', blockScroll);
    };
  }, [tutorialOpen, tutorialStep.id]);

  const toggleReaderFocus = useCallback(() => {
    if (sidePanelModeRef.current === 'none') {
      reopenLastSidePanel();
      return;
    }
    closeSidePanel();
  }, [closeSidePanel, reopenLastSidePanel]);

  const translationsById = useMemo(
    () => new Map(translations.map(item => [item.id, item])),
    [translations],
  );
  const booksByName = useMemo(
    () => new Map(books.map(book => [book.name.toLowerCase(), book])),
    [books],
  );
  // All-time record for "Surprise me": every chapter credited today, whatever the translation, is remembered by
  // book number. Runs as an effect on the credited list, not inside the progress updater.
  useEffect(() => {
    if (!books.length || readingProgress.todayChapters.length === 0) return;
    const keys: string[] = [];
    for (const credited of readingProgress.todayChapters) {
      const [bookName, chapterText] = credited.split('::');
      const book = booksByName.get(bookName ?? '');
      const chapterNumber = Number(chapterText);
      if (!book || !Number.isInteger(chapterNumber) || chapterNumber < 1 || chapterNumber > book.total_chapters) continue;
      keys.push(chapterReadKey(book.book_number, chapterNumber));
    }
    // Same set back when nothing is new, so React skips the update and nothing is written.
    setChaptersRead(prev => {
      const missing = keys.filter(key => !prev.has(key));
      return missing.length === 0 ? prev : new Set([...prev, ...missing]);
    });
  }, [setChaptersRead, books.length, booksByName, readingProgress.todayChapters]);
  const bibleBooksForAi = useMemo(
    () => books.map(b => ({ name: b.name, total_chapters: b.total_chapters })),
    [books],
  );
  const booksByNumber = useMemo(
    () => new Map(books.map(book => [book.book_number, book])),
    [books],
  );
  const bookNamesSorted = useMemo(
    () => sortBookNamesForMatching(books.map(book => book.name)),
    [books],
  );

  // ── TTS helpers ─────────────────────────────────────────────────────────────

  // Load available voices (async on some browsers)
  useEffect(() => {
    if (typeof window === 'undefined' || !window.speechSynthesis) return;
    const load = () => setTtsVoices(window.speechSynthesis.getVoices());
    load();
    window.speechSynthesis.addEventListener('voiceschanged', load);
    return () => window.speechSynthesis.removeEventListener('voiceschanged', load);
  }, []);

  const ttsLang = useMemo(() => {
    const lang = translationsById.get(translation)?.language;
    const upperId = translation.toUpperCase();
    if (lang === 'zh' || upperId.includes('CUV')) {
      if (upperId.includes('SIMP')) return 'zh-CN';
      return 'zh-TW';
    }
    if (lang) return lang;
    return 'en';
  }, [translation, translationsById]);

  const ttsLangVoices = useMemo(
    () => ttsVoices.filter(v => v.lang.startsWith(ttsLang.split('-')[0])),
    [ttsVoices, ttsLang],
  );

  const stopTts = useCallback(() => {
    if (typeof window !== 'undefined' && window.speechSynthesis) {
      window.speechSynthesis.cancel();
    }
    setTtsPlaying(false);
  }, []);

  const startTts = useCallback(() => {
    if (!chapterData || typeof window === 'undefined' || !window.speechSynthesis) return;
    window.speechSynthesis.cancel();
    const text = chapterData.verses.map(v => `${v.verse}. ${v.text}`).join('  ');
    const utt = new SpeechSynthesisUtterance(text);
    utt.lang = ttsLang;
    utt.rate = ttsRate;
    const voice = ttsSelectedVoiceUri
      ? ttsVoices.find(v => v.voiceURI === ttsSelectedVoiceUri) ?? ttsLangVoices[0] ?? null
      : ttsLangVoices[0] ?? null;
    if (voice) utt.voice = voice;
    utt.onend = () => setTtsPlaying(false);
    utt.onerror = () => setTtsPlaying(false);
    window.speechSynthesis.speak(utt);
    setTtsPlaying(true);
  }, [chapterData, ttsLang, ttsRate, ttsSelectedVoiceUri, ttsVoices, ttsLangVoices]);

  const toggleTts = useCallback(() => {
    if (ttsPlaying) stopTts(); else startTts();
  }, [ttsPlaying, stopTts, startTts]);

  // Stop playback when chapter changes
  useEffect(() => { stopTts(); }, [chapterData]); // eslint-disable-line react-hooks/exhaustive-deps

  const parsedNavigation = useMemo(() => {
    const trimmed = searchQuery.trim();
    if (!trimmed) return null;
    const exact = parseReferenceLabel(trimmed, bookNamesSorted);
    if (exact) return exact;
    return parseReferenceLabel(normalizeReferenceSpacing(trimmed), bookNamesSorted);
  }, [bookNamesSorted, searchQuery]);
  const looseNavigationParts = useMemo(
    () => extractLooseReferenceParts(searchQuery),
    [searchQuery],
  );
  const searchSuggestions = useMemo(() => {
    const trimmed = searchQuery.trim();
    const suggestions: SearchSuggestion[] = [];
    const seenDestinations = new Set<string>();
    const addSuggestion = (suggestion: SearchSuggestion | null) => {
      if (!suggestion) return;
      const destinationKey = [
        suggestion.book.toLowerCase(),
        suggestion.chapter,
        suggestion.verseStart ?? '',
        suggestion.translation ?? '',
      ].join('::');
      if (seenDestinations.has(destinationKey)) return;
      seenDestinations.add(destinationKey);
      suggestions.push(suggestion);
    };

    if (!trimmed) {
      recentPassages.slice(0, 4).forEach((entry, index) => {
        addSuggestion({
          id: `recent-${chapterStorageKey(entry.book, entry.chapter, entry.translation)}`,
          label: formatSearchSuggestionLabel(entry.book, entry.chapter),
          hint: `Recent passage • ${entry.translation}`,
          book: entry.book,
          chapter: entry.chapter,
          translation: entry.translation,
          score: 860 - index * 24,
          source: 'recent',
        });
      });
      [...books]
        .sort((a, b) => getBookPopularityScore(b) - getBookPopularityScore(a))
        .slice(0, SEARCH_SUGGESTION_LIMIT)
        .forEach((book, index) => {
          addSuggestion({
            id: `popular-${book.book_number}`,
            label: formatSearchSuggestionLabel(book.name, 1),
            hint: index === 0 ? 'Popular book' : 'Popular suggestion',
            book: book.name,
            chapter: 1,
            score: 620 - index * 20 + getBookPopularityScore(book),
            source: 'popular',
          });
        });
      return suggestions
        .sort((a, b) => b.score - a.score)
        .slice(0, SEARCH_SUGGESTION_LIMIT);
    }

    if (parsedNavigation) {
      addSuggestion({
        id: `direct-${parsedNavigation.book}-${parsedNavigation.chapter}-${parsedNavigation.verse_start ?? ''}-${parsedNavigation.verse_end ?? ''}`.toLowerCase(),
        label: formatSearchSuggestionLabel(
          parsedNavigation.book,
          parsedNavigation.chapter,
          parsedNavigation.verse_start,
          parsedNavigation.verse_end,
        ),
        hint: 'Go to passage',
        book: parsedNavigation.book,
        chapter: parsedNavigation.chapter,
        verseStart: parsedNavigation.verse_start,
        verseEnd: parsedNavigation.verse_end,
        score: 1200,
        source: 'direct',
      });
    }

    const bookPart = looseNavigationParts.bookPart || trimmed;
    const compactQuery = compactSearchText(bookPart);
    const wantsSpecificPassage = looseNavigationParts.chapter != null || looseNavigationParts.verseStart != null;

    books
      .map(book => {
        const matchScore = scoreBookMatch(bookPart, book);
        if (!Number.isFinite(matchScore)) return null;
        const popularityScore = getBookPopularityScore(book);
        return {
          book,
          totalScore: matchScore + popularityScore,
        };
      })
      .filter((entry): entry is { book: BookInfo; totalScore: number } => !!entry && entry.totalScore > 250)
      .sort((a, b) => b.totalScore - a.totalScore)
      .slice(0, SEARCH_SUGGESTION_LIMIT)
      .forEach((entry, index) => {
        const chapter = wantsSpecificPassage ? clampChapterForBook(entry.book, looseNavigationParts.chapter) : 1;
        const exactish =
          compactQuery.length > 0 &&
          (compactSearchText(entry.book.name) === compactQuery
            || compactSearchText(entry.book.name).startsWith(compactQuery)
            || normalizeSearchText(entry.book.name).includes(normalizeSearchText(bookPart)));
        addSuggestion({
          id: `book-${entry.book.book_number}-${chapter}-${looseNavigationParts.verseStart ?? ''}-${looseNavigationParts.verseEnd ?? ''}`.toLowerCase(),
          label: formatSearchSuggestionLabel(
            entry.book.name,
            chapter,
            wantsSpecificPassage ? looseNavigationParts.verseStart : undefined,
            wantsSpecificPassage ? looseNavigationParts.verseEnd : undefined,
          ),
          hint: exactish
            ? index === 0
              ? 'Popular match'
              : 'Suggested book'
            : `Did you mean ${entry.book.name}?`,
          book: entry.book.name,
          chapter,
          verseStart: wantsSpecificPassage ? looseNavigationParts.verseStart : undefined,
          verseEnd: wantsSpecificPassage ? looseNavigationParts.verseEnd : undefined,
          score: entry.totalScore - index * 6,
          source: exactish ? 'popular' : 'typo',
        });
      });

    recentPassages.forEach((entry, index) => {
      const book = books.find(candidate => candidate.name.toLowerCase() === entry.book.toLowerCase());
      const label = formatSearchSuggestionLabel(entry.book, entry.chapter);
      const labelMatch = normalizeSearchText(label).includes(normalizeSearchText(trimmed));
      const bookScore = book ? scoreBookMatch(bookPart, book) : Number.NEGATIVE_INFINITY;
      const totalScore = Math.max(bookScore, labelMatch ? 320 : Number.NEGATIVE_INFINITY);
      if (!Number.isFinite(totalScore) || totalScore < 260) return;
      addSuggestion({
        id: `recent-match-${chapterStorageKey(entry.book, entry.chapter, entry.translation)}`,
        label,
        hint: `Recent passage • ${entry.translation}`,
        book: entry.book,
        chapter: entry.chapter,
        translation: entry.translation,
        score: totalScore + 44 - index * 5,
        source: 'recent',
      });
    });

    return suggestions
      .sort((a, b) => b.score - a.score)
      .slice(0, SEARCH_SUGGESTION_LIMIT);
  }, [bookNamesSorted, books, looseNavigationParts, parsedNavigation, recentPassages, searchQuery]);
  const topSearchSuggestion = searchSuggestions[0] ?? null;
  const searchLooksLikeNavigation = useMemo(() => {
    const trimmed = searchQuery.trim();
    if (!trimmed) return false;
    if (parsedNavigation) return true;
    if (!topSearchSuggestion) return false;
    if (looseNavigationParts.chapter != null || looseNavigationParts.verseStart != null) return true;
    const words = normalizeSearchText(looseNavigationParts.bookPart || trimmed).split(' ').filter(Boolean);
    return words.length <= 2 && topSearchSuggestion.score >= 320;
  }, [looseNavigationParts, parsedNavigation, searchQuery, topSearchSuggestion]);

  const handleAiNavigate = useCallback((params: AIActionParams) => {
    if (!params.book || !params.chapter) return;
    const targetBook = booksRef.current.find(
      book => book.name.toLowerCase() === params.book?.toLowerCase(),
    );
    if (!targetBook) return;
    const vs = params.verse_start;
    if (vs != null) {
      const ve = params.verse_end ?? vs;
      pendingAiNavRef.current = { start: vs, end: Math.max(vs, ve) };
    } else {
      pendingAiNavRef.current = null;
      setAiNavHighlight(null);
    }
    setCurrentBook(targetBook);
    setChapter(params.chapter);
    loadChapter(targetBook, params.chapter, translationRef.current, null, { fromAiNavigate: true });
  }, [loadChapter]);

  const handleAiOpenCommentary = useCallback((source?: string) => {
    const nextSource = source?.trim() || commentarySourceRef.current;
    commentarySourceRef.current = nextSource;
    setCommentarySource(nextSource);
    const book = currentBookRef.current;
    setSidePanelMode('commentary');
    if (book) loadCommentaryData(book, chapterRef.current, nextSource);
  }, [loadCommentaryData]);

  const clearReaderAskBubble = useCallback(() => {
    readerSelectionPayloadRef.current = null;
    setReaderAskBubble(null);
  }, []);

  const syncReaderTextSelection = useCallback(() => {
    const root = readerPassagesRef.current;
    if (!root) {
      clearReaderAskBubble();
      return;
    }
    const sel = window.getSelection();
    if (!sel || sel.rangeCount === 0 || sel.isCollapsed) {
      clearReaderAskBubble();
      return;
    }
    const range = sel.getRangeAt(0);
    const anchor = range.commonAncestorContainer;
    const anchorEl =
      anchor.nodeType === Node.TEXT_NODE ? anchor.parentElement : (anchor as Element);
    if (!anchorEl || !root.contains(anchorEl)) {
      clearReaderAskBubble();
      return;
    }
    const raw = sel.toString().replace(/\u00a0/g, ' ').trim();
    if (raw.length < 2) {
      clearReaderAskBubble();
      return;
    }
    const rect = range.getBoundingClientRect();
    if (rect.width < 2 && rect.height < 2) {
      clearReaderAskBubble();
      return;
    }
    const startLine = closestVerseLine(range.startContainer);
    const endLine = closestVerseLine(range.endContainer);
    let refLabel: string | undefined;
    if (chapterData && startLine?.dataset.verse && endLine?.dataset.verse) {
      const v1 = Number(startLine.dataset.verse);
      const v2 = Number(endLine.dataset.verse);
      if (Number.isFinite(v1) && Number.isFinite(v2)) {
        const lo = Math.min(v1, v2);
        const hi = Math.max(v1, v2);
        refLabel =
          hi > lo
            ? `${chapterData.book} ${chapterData.chapter}:${lo}–${hi}`
            : `${chapterData.book} ${chapterData.chapter}:${lo}`;
      }
    }
    readerSelectionPayloadRef.current = { text: raw, refLabel };
    setReaderAskBubble({ top: rect.top, left: rect.left + rect.width / 2 });
  }, [chapterData, clearReaderAskBubble]);

  const scheduleReaderSelectionSync = useCallback(() => {
    if (readerSelectionRafRef.current != null) cancelAnimationFrame(readerSelectionRafRef.current);
    readerSelectionRafRef.current = requestAnimationFrame(() => {
      readerSelectionRafRef.current = null;
      syncReaderTextSelection();
    });
  }, [syncReaderTextSelection]);

  useEffect(() => {
    document.addEventListener('selectionchange', scheduleReaderSelectionSync);
    return () => {
      document.removeEventListener('selectionchange', scheduleReaderSelectionSync);
      if (readerSelectionRafRef.current != null) cancelAnimationFrame(readerSelectionRafRef.current);
    };
  }, [scheduleReaderSelectionSync]);

  useEffect(() => {
    const pane = biblePaneRef.current;
    if (!pane) return;
    const onScroll = () => clearReaderAskBubble();
    pane.addEventListener('scroll', onScroll, { passive: true });
    return () => pane.removeEventListener('scroll', onScroll);
  }, [clearReaderAskBubble]);

  useEffect(() => {
    clearReaderAskBubble();
  }, [chapterData?.book, chapterData?.chapter, translation, clearReaderAskBubble]);

  useEffect(() => {
    setSelectedVerse(null);
    setSelectedVerseGroup([]);
    setVersePopupPos(null);
  }, [chapterData?.book, chapterData?.chapter, translation]);

  useEffect(() => {
    if (sidePanelMode !== 'commentary' || !currentBook) return;
    loadCommentaryData(currentBook, chapter, commentarySource);
  }, [chapter, commentarySource, currentBook, loadCommentaryData, sidePanelMode]);

  const handleAskFromReaderSelection = useCallback(() => {
    const payload = readerSelectionPayloadRef.current;
    if (!payload?.text) return;
    openSidePanel('ai');
    setAiComposerSeed({ id: Date.now(), text: buildExplainVersePrompt(payload.refLabel, payload.text) });
    clearReaderAskBubble();
    window.getSelection()?.removeAllRanges();
  }, [openSidePanel, clearReaderAskBubble]);

  const currentAgentName = PERSONALITIES.find(p => p.id === personalityId)?.name ?? 'Ruth';
  const selectedVerseKey = currentBook && selectedVerse != null
    ? verseStorageKey(currentBook.name, chapter, selectedVerse)
    : null;
  const selectedVerseData = selectedVerse != null
    ? chapterData?.verses.find(verse => verse.verse === selectedVerse) ?? null
    : null;
  const selectedVerseNote = selectedVerseKey ? verseNotes[selectedVerseKey] : undefined;
  const todayIso = computeTodayIso();
  const isProgressToday = readingProgress.todayIso === todayIso;
  const chaptersToday = isProgressToday ? readingProgress.todayChapters.length : 0;
  const activeLearningMsToday = isProgressToday ? readingProgress.todayActiveLearningMs : 0;
  const dailyGoalMs = dailyGoalMinutes * 60 * 1000;
  const todayGoalDone = activeLearningMsToday >= dailyGoalMs;
  const dailyVerse = selectDailyVerse(todayIso);
  const minutesTowardGoal = Math.min(dailyGoalMinutes, Math.floor(activeLearningMsToday / 60_000));
  const readingRhythmTitle = todayGoalDone
    ? "Today\u2019s goal is done."
    : `Active learning: ${minutesTowardGoal} of ${dailyGoalMinutes} min today.`;
  const taskChapterDone = chaptersToday >= 1;
  const taskAiDone = isProgressToday && Boolean(readingProgress.todaySpokeToAi);
  const taskMinutesDone = activeLearningMsToday >= dailyGoalMs;

  const handleDailyVerseRefClick = async () => {
    if (authSession) {
      try {
        const r = await claimDailyVerseReward(authSession);
        setCoinBalance(r.balance);
        setDailyRewardsStatus(prev => ({
          verse_claimed: true,
          tasks_claimed: prev?.tasks_claimed ?? false,
        }));
        if (r.already_claimed) {
          showHomeToast('Daily verse reward already claimed today.');
        } else {
          showHomeToast(`+${r.coins_awarded} coins!`);
        }
      } catch {
        showHomeToast('Could not claim reward. Try again.');
      }
    }
    const didNavigate = navigateToPassage(dailyVerse.book, dailyVerse.chapter, translation, dailyVerse.verse);
    if (didNavigate) openReaderFromHome('none');
  };

  const handleSurpriseMe = () => {
    if (books.length === 0) return;
    const current = currentBook ? { book_number: currentBook.book_number, chapter } : null;
    const pick = pickSurpriseChapter(books, chaptersRead, current, Math.random);
    const book = booksByNumber.get(pick.book_number);
    if (!book) return;
    if (navigateToPassage(book.name, pick.chapter, translation)) openReaderFromHome('none');
  };

  const persistRecentPassage = useCallback((bookName: string, currentChapter: number, currentTranslation: string) => {
    const nextEntry: SavedPassage = {
      book: bookName,
      chapter: currentChapter,
      translation: currentTranslation,
      savedAt: Date.now(),
    };
    setRecentPassages(prev => {
      const filtered = prev.filter(entry => chapterStorageKey(entry.book, entry.chapter, entry.translation) !== chapterStorageKey(bookName, currentChapter, currentTranslation));
      return [nextEntry, ...filtered].slice(0, MAX_RECENT_PASSAGES);
    });
  }, []);

  const recordChapterEngagement = useCallback((bookName: string, currentChapter: number, currentTranslation: string, furthestVerse: number, totalVerses: number) => {
    const today = computeTodayIso();
    const chKey = chapterStorageKey(bookName, currentChapter, currentTranslation);
    const now = Date.now();
    const priorSession = chapterEngagementRef.current;
    const sameSession = priorSession.key === chKey;
    const engagedDelta = sameSession && priorSession.lastInteractionAt != null
      ? Math.min(MAX_ENGAGEMENT_GAP_MS, Math.max(0, now - priorSession.lastInteractionAt))
      : 0;
    chapterEngagementRef.current = { key: chKey, lastInteractionAt: now };
    setReadingProgress(prev => {
      let nextProgress = prev;
      if (nextProgress.todayIso !== today) {
        nextProgress = {
          ...nextProgress,
          todayIso: today,
          todayChapters: [],
          todayChapterEvidence: {},
          todayActiveLearningMs: 0,
          todaySpokeToAi: false,
        };
      }
      const priorActive = nextProgress.todayActiveLearningMs ?? 0;
      const nextActiveLearningMs = priorActive + engagedDelta;
      const priorEvidence = nextProgress.todayChapterEvidence[chKey] ?? { furthestVerse: 0, engagedMs: 0 };
      const nextEvidence: ChapterReadEvidence = {
        furthestVerse: Math.max(priorEvidence.furthestVerse, furthestVerse),
        engagedMs: priorEvidence.engagedMs + engagedDelta,
      };
      const alreadyCounted = nextProgress.todayChapters.includes(chKey);
      const shouldCount = alreadyCounted || chapterEvidenceQualifies(nextEvidence, totalVerses);
      const todayChapters = shouldCount && !alreadyCounted
        ? [...nextProgress.todayChapters, chKey]
        : nextProgress.todayChapters;
      const evidenceUnchanged =
        priorEvidence.furthestVerse === nextEvidence.furthestVerse &&
        priorEvidence.engagedMs === nextEvidence.engagedMs;
      if (evidenceUnchanged && todayChapters === nextProgress.todayChapters) {
        return syncGoalCompletion(nextProgress, dailyGoalMinutes, today);
      }
      return syncGoalCompletion({
        ...nextProgress,
        todayChapters,
        todayActiveLearningMs: nextActiveLearningMs,
        todayChapterEvidence: {
          ...nextProgress.todayChapterEvidence,
          [chKey]: nextEvidence,
        },
      }, dailyGoalMinutes, today);
    });
  }, [dailyGoalMinutes]);

  const addSidePanelActiveLearning = useCallback((deltaMs: number) => {
    if (deltaMs <= 0) return;
    const today = computeTodayIso();
    setReadingProgress(prev => {
      let next = prev;
      if (next.todayIso !== today) {
        next = {
          ...next,
          todayIso: today,
          todayChapters: [],
          todayChapterEvidence: {},
          todayActiveLearningMs: 0,
          todaySpokeToAi: false,
        };
      }
      const nextActive = (next.todayActiveLearningMs ?? 0) + deltaMs;
      return syncGoalCompletion(
        { ...next, todayActiveLearningMs: nextActive },
        dailyGoalMinutes,
        today,
      );
    });
  }, [dailyGoalMinutes]);

  const markSpokeToAi = useCallback(() => {
    const today = computeTodayIso();
    setReadingProgress(prev => {
      let next = prev;
      if (next.todayIso !== today) {
        next = {
          ...next,
          todayIso: today,
          todayChapters: [],
          todayChapterEvidence: {},
          todayActiveLearningMs: 0,
          todaySpokeToAi: false,
        };
      }
      if (next.todaySpokeToAi) return syncGoalCompletion(next, dailyGoalMinutes, today);
      return syncGoalCompletion({ ...next, todaySpokeToAi: true }, dailyGoalMinutes, today);
    });
  }, [dailyGoalMinutes]);

  useLayoutEffect(() => {
    const el = sideScrollRef.current;
    if (!el || homeScreenActive) return;
    if (sidePanelMode !== 'commentary' && sidePanelMode !== 'ai') return;
    const mark = () => {
      sidePanelEngagementActivityRef.current = Date.now();
    };
    mark();
    el.addEventListener('scroll', mark, { passive: true });
    el.addEventListener('pointerdown', mark);
    el.addEventListener('keydown', mark);
    return () => {
      el.removeEventListener('scroll', mark);
      el.removeEventListener('pointerdown', mark);
      el.removeEventListener('keydown', mark);
    };
  }, [sidePanelMode, homeScreenActive]);

  useEffect(() => {
    if (typeof document === 'undefined') return;
    if (homeScreenActive) return;
    if (sidePanelMode !== 'commentary' && sidePanelMode !== 'ai') return;
    const id = window.setInterval(() => {
      if (document.visibilityState !== 'visible') return;
      if (Date.now() - sidePanelEngagementActivityRef.current > MAX_ENGAGEMENT_GAP_MS) return;
      addSidePanelActiveLearning(1000);
      if (chapterQuizHasChapterRef.current) {
        chapterQuizSideEngagedDwellMsRef.current += 1000;
        setChapterQuizGateTick((t) => t + 1);
      }
    }, 1000);
    return () => clearInterval(id);
  }, [sidePanelMode, homeScreenActive, addSidePanelActiveLearning]);

  const computeTopVisibleVerseFromDom = useCallback((): number => {
    const pane = biblePaneRef.current;
    if (!pane) return 1;
    const paneRect = pane.getBoundingClientRect();
    const verses = pane.querySelectorAll<HTMLElement>('.verse-line[data-verse]');
    for (const el of verses) {
      const rect = el.getBoundingClientRect();
      if (rect.bottom > paneRect.top + 12) return Number(el.dataset.verse);
    }
    return 1;
  }, []);

  const updateTopVisibleVerse = useCallback((fallbackVerse?: number) => {
    if (visibleVersesRef.current.size > 0) {
      topVisibleVerseRef.current = Math.min(...visibleVersesRef.current);
      return topVisibleVerseRef.current;
    }
    if (fallbackVerse != null) {
      topVisibleVerseRef.current = fallbackVerse;
      return fallbackVerse;
    }
    const nextVerse = computeTopVisibleVerseFromDom();
    topVisibleVerseRef.current = nextVerse;
    return nextVerse;
  }, [computeTopVisibleVerseFromDom]);

  const getTopVisibleVerse = useCallback((): number => {
    return topVisibleVerseRef.current || updateTopVisibleVerse();
  }, [updateTopVisibleVerse]);

  const flushPendingEngagement = useCallback(() => {
    if (engagementTimerRef.current) {
      clearTimeout(engagementTimerRef.current);
      engagementTimerRef.current = null;
    }
    const pending = pendingEngagementRef.current;
    if (!pending) return;
    pendingEngagementRef.current = null;
    lastEngagementCommitAtRef.current = Date.now();
    recordChapterEngagement(
      pending.bookName,
      pending.currentChapter,
      pending.currentTranslation,
      pending.furthestVerse,
      pending.totalVerses,
    );
  }, [recordChapterEngagement]);

  const scheduleReadingProgressCommit = useCallback((
    bookName: string,
    currentChapter: number,
    currentTranslation: string,
    furthestVerse: number,
    totalVerses: number,
  ) => {
    const existing = pendingEngagementRef.current;
    if (
      existing &&
      existing.bookName === bookName &&
      existing.currentChapter === currentChapter &&
      existing.currentTranslation === currentTranslation
    ) {
      existing.furthestVerse = Math.max(existing.furthestVerse, furthestVerse);
      existing.totalVerses = totalVerses;
    } else {
      pendingEngagementRef.current = {
        bookName,
        currentChapter,
        currentTranslation,
        furthestVerse,
        totalVerses,
      };
    }

    const now = Date.now();
    const elapsed = now - lastEngagementCommitAtRef.current;
    if (elapsed >= ENGAGEMENT_COMMIT_MS) {
      flushPendingEngagement();
      return;
    }
    if (engagementTimerRef.current) return;
    engagementTimerRef.current = setTimeout(
      flushPendingEngagement,
      Math.max(40, ENGAGEMENT_COMMIT_MS - elapsed),
    );
  }, [flushPendingEngagement]);

  useEffect(() => {
    if (typeof window === 'undefined' || !currentBook) return;
    window.localStorage.setItem(LAST_POSITION_STORAGE_KEY, JSON.stringify({
      book: currentBook.name,
      chapter,
      translation,
    }));
    persistRecentPassage(currentBook.name, chapter, translation);
  }, [chapter, currentBook, persistRecentPassage, translation]);

  useEffect(() => {
    if (!currentBook) return;
    chapterEngagementRef.current = {
      key: chapterStorageKey(currentBook.name, chapter, translation),
      lastInteractionAt: Date.now(),
    };
  }, [chapter, currentBook, translation]);

  const applySearchSuggestion = useCallback((
    suggestion: SearchSuggestion,
    options?: { closePanel?: boolean },
  ) => {
    searchRequestIdRef.current += 1;
    setSearchLoading(false);
    const moved = navigateToPassage(
      suggestion.book,
      suggestion.chapter,
      suggestion.translation,
      suggestion.verseStart,
    );
    setSearchResults([]);
    setSearchError(moved ? null : 'Could not navigate to that passage.');
    if (moved) {
      setSearchQuery(suggestion.label);
      if (options?.closePanel ?? true) setSearchOpen(false);
    }
  }, [navigateToPassage]);

  const runPhraseSearch = useCallback(async (
    query: string,
    options?: { showEmptyError?: boolean },
  ) => {
    const trimmed = query.trim();
    if (!trimmed) {
      searchRequestIdRef.current += 1;
      setSearchResults([]);
      setSearchError(null);
      setSearchLoading(false);
      return;
    }
    const requestId = ++searchRequestIdRef.current;
    setSearchLoading(true);
    setSearchError(null);
    try {
      const response = await fetch('/api/v1/search', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ query: trimmed, translation, limit: 12 }),
      });
      if (!response.ok) throw new Error('Search is unavailable right now.');
      const results = await response.json() as SearchResult[];
      if (requestId !== searchRequestIdRef.current) return;
      setSearchResults(results);
      if (!results.length) {
        setSearchError(
          options?.showEmptyError
            ? 'No matching verses found. Try a shorter phrase or a passage reference.'
            : null,
        );
      }
    } catch (error) {
      if (requestId !== searchRequestIdRef.current) return;
      setSearchResults([]);
      setSearchError(error instanceof Error ? error.message : 'Search is unavailable right now.');
    } finally {
      if (requestId === searchRequestIdRef.current) setSearchLoading(false);
    }
  }, [translation]);

  const runSearch = useCallback(async () => {
    const trimmed = searchQuery.trim();
    if (!trimmed) {
      searchRequestIdRef.current += 1;
      setSearchResults([]);
      setSearchError(null);
      setSearchLoading(false);
      return;
    }
    if (searchLooksLikeNavigation && topSearchSuggestion) {
      applySearchSuggestion(topSearchSuggestion);
      return;
    }
    await runPhraseSearch(trimmed, { showEmptyError: true });
  }, [applySearchSuggestion, runPhraseSearch, searchLooksLikeNavigation, searchQuery, topSearchSuggestion]);

  const toggleVerseHighlight = useCallback(() => {
    if (!selectedVerseKey || !currentBook) return;
    const isCurrentlyHighlighted = highlightedVerses.includes(selectedVerseKey);
    const groupKeys = selectedVerseGroup.map(v => verseStorageKey(currentBook.name, chapter, v));
    setHighlightedVerses(prev =>
      isCurrentlyHighlighted
        ? prev.filter(k => !groupKeys.includes(k))
        : [...new Set([...prev, ...groupKeys])]
    );
  }, [chapter, currentBook, highlightedVerses, selectedVerseGroup, selectedVerseKey]);

  const saveVerseNote = useCallback(() => {
    if (!selectedVerseKey || !currentBook || selectedVerse == null) return;
    const text = currentNoteDraft.trim();
    setVerseNotes(prev => {
      if (!text) {
        const next = { ...prev };
        delete next[selectedVerseKey];
        return next;
      }
      return {
        ...prev,
        [selectedVerseKey]: {
          key: selectedVerseKey,
          book: currentBook.name,
          chapter,
          verse: selectedVerse,
          text,
          updatedAt: Date.now(),
        },
      };
    });
    closeVerseStudyPopup();
  }, [chapter, closeVerseStudyPopup, currentBook, currentNoteDraft, selectedVerse, selectedVerseKey]);

  const copySelectedVerse = useCallback(async () => {
    if (!currentBook || !chapterData) return;
    const sorted = [...selectedVerseGroup].sort((a, b) => a - b);
    const lines = sorted
      .map(vn => chapterData.verses.find(v => v.verse === vn))
      .filter(Boolean)
      .map(v => v!.text);
    const ref = formatVerseGroupRef(currentBook.name, chapter, sorted);
    const text = `${ref} (${translation})\n${lines.join(' ')}`;
    try {
      if (navigator.share) {
        await navigator.share({ title: ref, text });
      } else if (navigator.clipboard?.writeText) {
        await navigator.clipboard.writeText(text);
      }
    } catch {
      /* ignore */
    }
  }, [chapter, chapterData, currentBook, selectedVerseGroup, translation]);

  const buildSyncedStudyItems = useCallback((): SyncedStudyItem[] => {
    if (!books.length) return [];
    const notesEntries = Object.values(verseNotes).map(note => {
      const book = books.find(entry => entry.name.toLowerCase() === note.book.toLowerCase());
      return book ? {
        translation,
        book_number: book.book_number,
        chapter: note.chapter,
        verse_start: note.verse,
        verse_end: note.verse,
        kind: 'note' as const,
        note: note.text,
      } : null;
    }).filter(Boolean) as SyncedStudyItem[];

    const highlights = highlightedVerses.map(key => {
      const [bookName, chapterRaw, verseRaw] = key.split('::');
      const book = books.find(entry => entry.name.toLowerCase() === bookName.toLowerCase());
      return book ? {
        translation,
        book_number: book.book_number,
        chapter: Number(chapterRaw),
        verse_start: Number(verseRaw),
        verse_end: Number(verseRaw),
        kind: 'highlight' as const,
        color: '#FFEB3B',
      } : null;
    }).filter(Boolean) as SyncedStudyItem[];

    const bookmarks = bookmarkedVerses.map(key => {
      const [bookName, chapterRaw, verseRaw] = key.split('::');
      const book = books.find(entry => entry.name.toLowerCase() === bookName.toLowerCase());
      return book ? {
        translation,
        book_number: book.book_number,
        chapter: Number(chapterRaw),
        verse_start: Number(verseRaw),
        verse_end: Number(verseRaw),
        kind: 'bookmark' as const,
      } : null;
    }).filter(Boolean) as SyncedStudyItem[];

    return [...highlights, ...bookmarks, ...notesEntries];
  }, [bookmarkedVerses, books, highlightedVerses, translation, verseNotes]);

  const buildSyncedReadingProgress = useCallback((): SyncedReadingProgress[] => {
    if (!currentBook) return [];
    const chKey = chapterStorageKey(currentBook.name, chapter, translation);
    const today = computeTodayIso();
    const furthestTrackedVerse = readingProgress.todayIso === today
      ? readingProgress.todayChapterEvidence[chKey]?.furthestVerse ?? 0
      : 0;
    return [{
      translation,
      book_number: currentBook.book_number,
      chapter,
      last_verse: Math.max(selectedVerse ?? 0, furthestTrackedVerse, 1),
    }];
  }, [chapter, currentBook, readingProgress.todayChapterEvidence, readingProgress.todayIso, selectedVerse, translation]);

  const buildSyncedUserSettings = useCallback((): SyncedUserSettings => ({
    theme: currentTheme,
    font_scale: readerSettings.fontScale,
    line_height: readerSettings.lineHeight,
    reduced_motion: !readerSettings.specialEffects,
    page_flip_enabled: readerSettings.pageFlipEnabled,
    default_panel: readerSettings.defaultPanel,
    side_panel_position: readerSettings.sidePanelPosition,
    reader_font: readerSettings.readerFont,
    highlight_color: readerSettings.highlightColor,
    reading_mode: readerSettings.readingMode,
    recent_passages: recentPassages.map(entry => ({
      book: entry.book,
      chapter: entry.chapter,
      translation: entry.translation,
      saved_at: entry.savedAt,
    })),
  }), [currentTheme, readerSettings, recentPassages]);

  const applyRemoteAccountState = useCallback((
    items: SyncedStudyItem[],
    progressItems: SyncedReadingProgress[],
    settings: SyncedUserSettings,
  ) => {
    hydratingAccountRef.current = true;
    const nextHighlights: string[] = [];
    const nextBookmarks: string[] = [];
    const nextNotes: Record<string, VerseNote> = {};
    items.forEach(item => {
      const book = booksByNumber.get(item.book_number);
      if (!book) return;
      const key = verseStorageKey(book.name, item.chapter, item.verse_start);
      if (item.kind === 'highlight') nextHighlights.push(key);
      if (item.kind === 'bookmark') nextBookmarks.push(key);
      if (item.kind === 'note' && item.note) {
        nextNotes[key] = {
          key,
          book: book.name,
          chapter: item.chapter,
          verse: item.verse_start,
          text: item.note,
          updatedAt: Date.now(),
        };
      }
    });
    setHighlightedVerses(nextHighlights);
    setBookmarkedVerses(nextBookmarks);
    setVerseNotes(nextNotes);
    setRecentPassages((settings.recent_passages ?? []).map(item => ({
      book: item.book,
      chapter: item.chapter,
      translation: item.translation,
      savedAt: item.saved_at,
    })));
    // Merge with current reader prefs so API fields missing from older servers do not reset layout, etc.
    setReaderSettings(prev => normalizeReaderSettings({
      fontScale: settings.font_scale ?? prev.fontScale,
      lineHeight: settings.line_height ?? prev.lineHeight,
      readerFont: settings.reader_font ?? prev.readerFont,
      highlightColor: settings.highlight_color ?? prev.highlightColor,
      readingMode: settings.reading_mode ?? prev.readingMode,
      specialEffects: typeof settings.reduced_motion === 'boolean'
        ? !settings.reduced_motion
        : prev.specialEffects,
      pageFlipEnabled: typeof settings.page_flip_enabled === 'boolean'
        ? settings.page_flip_enabled
        : prev.pageFlipEnabled,
      defaultPanel: settings.default_panel ?? prev.defaultPanel,
      sidePanelPosition: settings.side_panel_position ?? prev.sidePanelPosition,
      graphicsMode: prev.graphicsMode,
    }));
    const restorePosition = (
      book: BookInfo | undefined,
      chapterNumber: number,
      translationId: string,
    ) => {
      if (!book) return;
      const t = normalizeTranslationChoice(translationId);
      setCurrentBook(book);
      setChapter(chapterNumber);
      setTranslation(t);
      void loadChapter(book, chapterNumber, t);
    };
    const recentPassage = settings.recent_passages?.[0];
    if (progressItems.length > 0) {
      const latest = progressItems[0];
      restorePosition(booksByNumber.get(latest.book_number), latest.chapter, latest.translation);
    } else if (recentPassage && !startedWithSavedPositionRef.current) {
      // Only a device that started without its own saved position adopts synced history.
      const bookName = recentPassage.book.toLowerCase();
      restorePosition(
        booksByName.get(bookName) ?? books.find(b =>
          b.name_zh?.toLowerCase() === bookName
          || b.name_zh_simplified?.toLowerCase() === bookName),
        recentPassage.chapter,
        recentPassage.translation,
      );
    }
    queueMicrotask(() => {
      hydratingAccountRef.current = false;
      syncReadyRef.current = true;
    });
  }, [books, booksByName, booksByNumber, loadChapter]);

  const syncAccountState = useCallback(async (session: AuthSession) => {
    if (!books.length) return;
    const [profile, items, progressItems, settings] = await Promise.all([
      getProfile(session),
      getStudyItems(session),
      getReadingProgress(session),
      getUserSettings(session),
    ]);
    setAccountProfile(profile);
    const hasLocalStudyState =
      highlightedVerses.length > 0 ||
      bookmarkedVerses.length > 0 ||
      Object.keys(verseNotes).length > 0 ||
      recentPassages.length > 0;
    const remoteHasStudyState = items.length > 0 || progressItems.length > 0;
    if (!remoteHasStudyState && hasLocalStudyState) {
      await Promise.all([
        putStudyItems(session, buildSyncedStudyItems()),
        putReadingProgress(session, buildSyncedReadingProgress()),
        putUserSettings(session, buildSyncedUserSettings()),
      ]);
      const [freshItems, freshProgress, freshSettings] = await Promise.all([
        getStudyItems(session),
        getReadingProgress(session),
        getUserSettings(session),
      ]);
      applyRemoteAccountState(freshItems, freshProgress, freshSettings);
      return;
    }
    applyRemoteAccountState(items, progressItems, settings);
  }, [
    applyRemoteAccountState,
    bookmarkedVerses.length,
    books.length,
    buildSyncedReadingProgress,
    buildSyncedStudyItems,
    buildSyncedUserSettings,
    getStudyItems,
    highlightedVerses.length,
    recentPassages.length,
    verseNotes,
  ]);

  const syncAccountStateRef = useRef(syncAccountState);
  syncAccountStateRef.current = syncAccountState;

  const handleAuthSignIn = useCallback(async (email: string, password: string) => {
    setAuthBusy(true);
    setAuthError(null);
    try {
      const session = await signIn(email, password);
      accountBootstrapRef.current = true;
      persistAuthSession(session);
      setAuthSession(session);
      await syncAccountState(session);
    } catch (error) {
      setAuthError(error instanceof Error ? error.message : 'Could not sign in.');
    } finally {
      setAuthBusy(false);
    }
  }, [syncAccountState]);

  const handleAuthSignUp = useCallback(async (email: string, password: string, displayName: string) => {
    setAuthBusy(true);
    setAuthError(null);
    try {
      const session = await signUp(email, password, displayName);
      accountBootstrapRef.current = true;
      persistAuthSession(session);
      setAuthSession(session);
      await syncAccountState(session);
    } catch (error) {
      setAuthError(error instanceof Error ? error.message : 'Could not create the account.');
    } finally {
      setAuthBusy(false);
    }
  }, [syncAccountState]);

  const handleAuthSignOut = useCallback(async () => {
    if (!authSession) return;
    setAuthBusy(true);
    setAuthError(null);
    try {
      await signOut(authSession);
    } catch {
      /* ignore sign-out transport issues and clear local session */
    } finally {
      persistAuthSession(null);
      setAuthSession(null);
      setAccountProfile(null);
      accountBootstrapRef.current = false;
      syncReadyRef.current = false;
      hydratingAccountRef.current = false;
      setAuthBusy(false);
    }
  }, [authSession]);

  // ── Commentary sync ───────────────────────────────────────────────────────────
  const scrollVerseIntoView = useCallback((verseNumber: number) => {
    const mode = readerSettingsRef.current.readingMode;
    if (isPagedReadingMode(mode)) {
      const slices = pagedPageSlicesRef.current;
      if (!slices?.length) return;
      const pageIx = slices.findIndex(page => page.some(v => v.verse === verseNumber));
      if (pageIx < 0) return;
      const spreadIx = mode === 'paged-double' ? Math.floor(pageIx / 2) : pageIx;
      setChapterSpreadIndex(spreadIx);
      return;
    }
    const pane = biblePaneRef.current;
    if (!pane) return;
    const target = pane.querySelector<HTMLElement>(`.verse-line[data-verse="${verseNumber}"]`);
    if (!target) return;
    const paneRect = pane.getBoundingClientRect();
    const targetRect = target.getBoundingClientRect();
    const top = pane.scrollTop + (targetRect.top - paneRect.top) - 28;
    pane.scrollTo({ top: Math.max(0, top), behavior: 'smooth' });
  }, []);

  useEffect(() => {
    setChapterSpreadIndex(0);
  }, [chapterData?.book, chapterData?.chapter, translation]);

  useEffect(() => {
    setPagedFlipAnim('');
    pagedFlipPendingRef.current = null;
  }, [chapterData?.book, chapterData?.chapter, translation]);

  useEffect(() => {
    if (!isPagedReadingMode(readerSettings.readingMode)) {
      setPagedPageSlices(null);
      setPagedFlipAnim('');
      pagedFlipPendingRef.current = null;
    }
  }, [readerSettings.readingMode]);

  useEffect(() => {
    if (!pagedPageSlices?.length) return;
    if (!isPagedReadingMode(readerSettings.readingMode)) return;
    const spreads = readerSettings.readingMode === 'paged-double'
      ? Math.ceil(pagedPageSlices.length / 2)
      : pagedPageSlices.length;
    setChapterSpreadIndex(ix => Math.min(ix, Math.max(0, spreads - 1)));
  }, [pagedPageSlices, readerSettings.readingMode]);

  useLayoutEffect(() => {
    if (!chapterData?.verses.length) {
      if (isPagedReadingMode(readerSettings.readingMode)) setPagedPageSlices(null);
      return;
    }
    if (!isPagedReadingMode(readerSettings.readingMode)) return;
    const vp = pagedContentRef.current;
    const ms = pagedMeasureRef.current;
    if (!vp || !ms) return;
    const run = () => {
      const h = vp.clientHeight;
      const w = vp.clientWidth;
      if (h < 100 || w < 64) return;
      const isDouble = readerSettings.readingMode === 'paged-double';
      // For double mode: gap matches CSS clamp(22px,3vw,42px); passages padding is 20px each side.
      const colGap = isDouble ? Math.max(22, Math.min(42, window.innerWidth * 0.03)) : 0;
      const passageHPad = 40; // 20px left + 20px right from .reader-paged-passages
      const rawPageW = isDouble
        ? Math.max(120, (w - colGap) / 2 - passageHPad)
        : Math.min(w, 720); // single page: cap to 720px (matches CSS max-width)
      const pageW = Math.floor(rawPageW);
      // Subtract a small buffer so measurement rounding never causes visible cut-off.
      // Double spread: book/chapter row + per-column page number footer (see .reader-paged-double-context-left, .reader-paged-col-footer).
      // `h` is .reader-paged-content clientHeight (includes the spread chrome).
      const colFooterH = isDouble ? 26 : 0;
      const colHeaderH = isDouble ? 152 : 0;
      const slices = sliceVersesIntoPages(chapterData.verses, ms, pageW, h - 12 - colHeaderH - colFooterH);
      setPagedPageSlices(slices.length ? slices : [chapterData.verses]);
    };
    run();
    const ro = new ResizeObserver(() => {
      window.requestAnimationFrame(run);
    });
    ro.observe(vp);
    return () => ro.disconnect();
  }, [
    chapterData,
    readerSettings.readingMode,
    readerSettings.fontScale,
    readerSettings.lineHeight,
    readerSettings.readerFont,
    sidePanelMode,
  ]);

  const syncCommentaryToVerse = useCallback((verseNumber: number, entries: CommentaryEntry[]) => {
    if (!entries.length) return;
    let synced = entries[0];
    for (const e of entries) {
      const start = Number(e.verse_start);
      const end   = e.verse_end == null ? start : Number(e.verse_end);
      if (verseNumber >= start && verseNumber <= end) { synced = e; break; }
      if (start <= verseNumber) synced = e;
    }
    setSyncedVerseStart(synced.verse_start);
  }, []);

  const requestCommentarySync = useCallback((entries: CommentaryEntry[]) => {
    if (sidePanelModeRef.current !== 'commentary') return;
    const now = performance.now();
    if (commentarySyncTimerRef.current) return;
    const schedule = () => {
      if (commSyncRafRef.current) return;
      commSyncRafRef.current = requestAnimationFrame(() => {
        commSyncRafRef.current = null;
        lastCommentarySyncAtRef.current = performance.now();
        syncCommentaryToVerse(getTopVisibleVerse(), entries);
      });
    };
    if (now - lastCommentarySyncAtRef.current >= COMMENTARY_SYNC_THROTTLE_MS) {
      schedule();
      return;
    }
    commentarySyncTimerRef.current = setTimeout(() => {
      commentarySyncTimerRef.current = null;
      schedule();
    }, Math.max(16, COMMENTARY_SYNC_THROTTLE_MS - (now - lastCommentarySyncAtRef.current)));
  }, [syncCommentaryToVerse, getTopVisibleVerse]);

  const scheduleCommentarySyncAfterScroll = useCallback((entries: CommentaryEntry[]) => {
    if (sidePanelModeRef.current !== 'commentary') return;
    if (commentarySyncIdleTimerRef.current) clearTimeout(commentarySyncIdleTimerRef.current);
    commentarySyncIdleTimerRef.current = setTimeout(() => {
      commentarySyncIdleTimerRef.current = null;
      requestCommentarySync(entries);
    }, COMMENTARY_SYNC_THROTTLE_MS);
  }, [requestCommentarySync]);

  // Stable ref so scroll handler can always access latest entries
  const commentaryEntriesRef = useRef<CommentaryEntry[]>([]);
  useEffect(() => { commentaryEntriesRef.current = commentaryEntries; }, [commentaryEntries]);

  // Scroll synced entry into view when syncedVerseStart changes
  useEffect(() => {
    if (syncedVerseStart === null || !sideScrollRef.current) return;
    const container = sideScrollRef.current;
    const synced = container.querySelector<HTMLElement>('.commentary-entry.synced');
    if (!synced) return;
    const containerRect = synced.parentElement?.getBoundingClientRect() ?? container.getBoundingClientRect();
    const entryRect = synced.getBoundingClientRect();
    const headerEl = sidePaneRef.current?.querySelector<HTMLElement>('.side-header');
    const headerH  = headerEl?.offsetHeight ?? 0;
    const viewportTop    = container.scrollTop + headerH;
    const viewportBottom = container.scrollTop + container.clientHeight - 32;
    const entryTop    = container.scrollTop + (entryRect.top - containerRect.top);
    const entryBottom = entryTop + entryRect.height;
    if (entryTop < viewportTop || entryBottom > viewportBottom) {
      container.scrollTo({ top: Math.max(0, entryTop - 18), behavior: 'smooth' });
    }
  }, [syncedVerseStart]);

  // Trigger initial sync when commentary loads
  useEffect(() => {
    if (commentaryEntries.length && sidePanelMode === 'commentary') {
      if (sideScrollRef.current) sideScrollRef.current.scrollTop = 0;
      requestCommentarySync(commentaryEntries);
    }
  }, [commentaryEntries, sidePanelMode, requestCommentarySync]);

  useEffect(() => {
    const pane = biblePaneRef.current;
    const passages = readerPassagesRef.current;
    visibleVersesRef.current.clear();
    topVisibleVerseRef.current = chapterData?.verses[0]?.verse ?? 1;
    if (!pane || !passages || !chapterData) return;
    if (isPagedReadingMode(readerSettings.readingMode)) return;

    const verseEls = passages.querySelectorAll<HTMLElement>('.verse-line[data-verse]');
    if (!verseEls.length) return;

    if (typeof window.IntersectionObserver !== 'function') {
      topVisibleVerseRef.current = computeTopVisibleVerseFromDom();
      return;
    }

    const observer = new window.IntersectionObserver((entries) => {
      for (const entry of entries) {
        const verse = Number((entry.target as HTMLElement).dataset.verse);
        if (!Number.isFinite(verse)) continue;
        if (entry.isIntersecting) visibleVersesRef.current.add(verse);
        else visibleVersesRef.current.delete(verse);
      }
      updateTopVisibleVerse(chapterData.verses[0]?.verse ?? 1);
    }, {
      root: pane,
      threshold: 0,
      rootMargin: '-12px 0px -68% 0px',
    });

    verseObserverRef.current = observer;
    verseEls.forEach(el => observer.observe(el));
    topVisibleVerseRef.current = computeTopVisibleVerseFromDom();

    return () => {
      observer.disconnect();
      if (verseObserverRef.current === observer) verseObserverRef.current = null;
      visibleVersesRef.current.clear();
    };
  }, [
    chapterData?.book,
    chapterData?.chapter,
    chapterData?.verses,
    computeTopVisibleVerseFromDom,
    readerSettings.readingMode,
    updateTopVisibleVerse,
  ]);

  useEffect(() => {
    if (!isPagedReadingMode(readerSettings.readingMode) || !pagedPageSlices?.length) return;
    const mode = readerSettings.readingMode;
    const leftSlice =
      mode === 'paged-double'
        ? pagedPageSlices[chapterSpreadIndex * 2]
        : pagedPageSlices[chapterSpreadIndex];
    const v = leftSlice?.[0]?.verse;
    if (v != null) topVisibleVerseRef.current = v;
  }, [readerSettings.readingMode, pagedPageSlices, chapterSpreadIndex]);

  useEffect(() => {
    const pending = pendingAiNavRef.current;
    if (!chapterData || !pending) return;
    pendingAiNavRef.current = null;
    const maxV = chapterData.verses.length
      ? Math.max(...chapterData.verses.map(v => v.verse))
      : 1;
    const start = Math.min(Math.max(1, pending.start), maxV);
    const end = Math.min(Math.max(start, pending.end), maxV);
    const rafId = requestAnimationFrame(() => {
      scrollVerseIntoView(start);
      setAiNavHighlight({ start, end });
    });
    return () => cancelAnimationFrame(rafId);
  }, [chapterData, scrollVerseIntoView]);

  useEffect(() => {
    if (!aiNavHighlight) return;
    const t = window.setTimeout(() => setAiNavHighlight(null), 4200);
    return () => clearTimeout(t);
  }, [aiNavHighlight]);

  useEffect(() => {
    return () => {
      flushPendingEngagement();
    };
  }, [flushPendingEngagement]);

  useEffect(() => {
    return () => {
      if (commentarySyncTimerRef.current) clearTimeout(commentarySyncTimerRef.current);
      if (commentarySyncIdleTimerRef.current) clearTimeout(commentarySyncIdleTimerRef.current);
      if (engagementTimerRef.current) clearTimeout(engagementTimerRef.current);
      if (chromeScrollAutoHideTimerRef.current) {
        clearTimeout(chromeScrollAutoHideTimerRef.current);
        chromeScrollAutoHideTimerRef.current = null;
      }
    };
  }, []);

  useEffect(() => {
    flushPendingEngagement();
    pendingEngagementRef.current = null;
    lastEngagementCommitAtRef.current = 0;
    if (engagementTimerRef.current) {
      clearTimeout(engagementTimerRef.current);
      engagementTimerRef.current = null;
    }
  }, [chapterData?.book, chapterData?.chapter, translation, flushPendingEngagement]);

  // ── Scroll handler ────────────────────────────────────────────────────────────
  useEffect(() => {
    const pane = biblePaneRef.current;
    if (!pane || !currentBook || !chapterData) return;
    const onScroll = () => {
      const y = pane.scrollTop;
      const delta = y - lastScrollYRef.current;
      const { home, overlay } = readerChromeCtxRef.current;
      const chromeScrollDownDelta = 2;
      const chromeScrollUpDelta = 6;
      if (!home && !overlay) {
        if (delta > chromeScrollDownDelta && y > 80) {
          chromeScrollRevealActiveRef.current = false;
          if (chromeScrollAutoHideTimerRef.current) {
            clearTimeout(chromeScrollAutoHideTimerRef.current);
            chromeScrollAutoHideTimerRef.current = null;
          }
          if (chromeTopShownRef.current) {
            chromeTopShownRef.current = false;
            setChromeTopShown(false);
          }
          if (chromeBottomShownRef.current) {
            chromeBottomShownRef.current = false;
            setChromeBottomShown(false);
          }
        } else if (delta < -chromeScrollUpDelta || y < 10) {
          chromeScrollRevealActiveRef.current = true;
          chromeTopShownRef.current = true;
          chromeBottomShownRef.current = true;
          setChromeTopShown(true);
          setChromeBottomShown(true);
          scheduleChromeScrollAutoHide();
        }
      }
      lastScrollYRef.current = y;
      const topVerse = updateTopVisibleVerse(chapterData.verses[0]?.verse ?? 1);
      scheduleReadingProgressCommit(
        currentBook.name,
        chapter,
        translation,
        topVerse,
        chapterData.verses.length,
      );
      scheduleCommentarySyncAfterScroll(commentaryEntriesRef.current);
      const depth = biblePaneScrollDepthRatio(pane);
      const prevDepthMax = chapterQuizScrollDepthMaxRef.current;
      chapterQuizScrollDepthMaxRef.current = Math.max(prevDepthMax, depth);
      if (prevDepthMax < 0.5 && chapterQuizScrollDepthMaxRef.current >= 0.5) {
        setChapterQuizGateTick((t) => t + 1);
      }
    };
    pane.addEventListener('scroll', onScroll, { passive: true });
    return () => pane.removeEventListener('scroll', onScroll);
  }, [
    chapter,
    chapterData,
    currentBook,
    scheduleCommentarySyncAfterScroll,
    scheduleReadingProgressCommit,
    scheduleChromeScrollAutoHide,
    translation,
    updateTopVisibleVerse,
  ]);

  useEffect(() => {
    if (!chapterData || isPagedReadingMode(readerSettings.readingMode)) return;
    const pane = biblePaneRef.current;
    if (!pane) return;
    const updateDepth = () => {
      const d = biblePaneScrollDepthRatio(pane);
      const prev = chapterQuizScrollDepthMaxRef.current;
      chapterQuizScrollDepthMaxRef.current = Math.max(prev, d);
      if (chapterQuizScrollDepthMaxRef.current > prev) setChapterQuizGateTick((t) => t + 1);
    };
    const ro = new ResizeObserver(() => requestAnimationFrame(updateDepth));
    ro.observe(pane);
    updateDepth();
    return () => ro.disconnect();
  }, [chapterData?.book, chapterData?.chapter, readerSettings.readingMode]);

  // ── Touch swipe + trackpad two-finger swipe ───────────────────────────────────
  useEffect(() => {
    const pane = biblePaneRef.current;
    const contentArea = contentAreaRef.current;
    if (!pane || !contentArea) return;

    const isHorizontalGesture = (dx: number, dy: number) =>
      Math.abs(dx) > 60 && Math.abs(dx) > Math.abs(dy) * 1.5;

    const isSideEdgeStart = (clientX: number) => {
      const edgeThreshold = 48;
      return sidePanelPositionRef.current === 'left'
        ? clientX <= edgeThreshold
        : clientX >= window.innerWidth - edgeThreshold;
    };

    // ── Single-finger touch (mobile) ──────────────────────────────────────────
    const onStart = (e: TouchEvent) => {
      touchStartXRef.current = e.touches[0].clientX;
      touchStartYRef.current = e.touches[0].clientY;
      touchGestureModeRef.current = isSideEdgeStart(e.touches[0].clientX) ? 'side-toggle' : 'chapter';
    };
    const onEnd = (e: TouchEvent) => {
      if (touchStartXRef.current === null) return;
      const dx = e.changedTouches[0].clientX - touchStartXRef.current;
      const dy = e.changedTouches[0].clientY - touchStartYRef.current;
      if (!isHorizontalGesture(dx, dy)) {
        touchStartXRef.current = null;
        touchGestureModeRef.current = 'chapter';
        return;
      }
      if (touchGestureModeRef.current === 'side-toggle') {
        toggleReaderFocus();
      } else {
        // swipe left → previous chapter, swipe right → next chapter
        dx < 0 ? readerStepForward() : readerStepBack();
      }
      touchStartXRef.current = null;
      touchGestureModeRef.current = 'chapter';
    };

    // ── Two-finger trackpad horizontal swipe (desktop) ────────────────────────
    // Panel on the right: swipe left (deltaX < 0) opens; swipe right (deltaX > 0) closes.
    // Panel on the left: the opposite. Avoids canceling deltas and matches edge direction.
    let wheelAccX = 0;
    let wheelLocked = false;
    let wheelResetTimer: number | null = null;

    const onWheel = (e: WheelEvent) => {
      // Only handle dominant horizontal movement (two-finger horizontal swipe)
      if (Math.abs(e.deltaX) <= Math.abs(e.deltaY) * 1.1) return;
      if (e.ctrlKey || e.metaKey || e.altKey) return;
      e.preventDefault();
      if (wheelLocked) return;

      const panelRight = sidePanelPositionRef.current === 'right';
      const closed = sidePanelModeRef.current === 'none';
      const wantSign = closed
        ? (panelRight ? -1 : 1)
        : (panelRight ? 1 : -1);
      const sx = Math.sign(e.deltaX);
      if (sx === 0) return;

      if (sx !== wantSign) {
        wheelAccX = 0;
      } else {
        wheelAccX += e.deltaX;
      }

      if (wheelResetTimer) clearTimeout(wheelResetTimer);
      wheelResetTimer = window.setTimeout(() => { wheelAccX = 0; }, 1200);

      const threshold = 100;
      if (wheelAccX * wantSign >= threshold) {
        wheelLocked = true;
        wheelAccX = 0;
        if (closed) reopenLastSidePanel();
        else closeSidePanel();
        if (wheelResetTimer) clearTimeout(wheelResetTimer);
        wheelResetTimer = window.setTimeout(() => { wheelLocked = false; }, 650);
      }
    };

    pane.addEventListener('touchstart', onStart, { passive: true });
    pane.addEventListener('touchend', onEnd, { passive: true });
    contentArea.addEventListener('wheel', onWheel, { passive: false });
    return () => {
      pane.removeEventListener('touchstart', onStart);
      pane.removeEventListener('touchend', onEnd);
      contentArea.removeEventListener('wheel', onWheel);
      if (wheelResetTimer) clearTimeout(wheelResetTimer);
    };
  }, [closeSidePanel, goNext, goPrev, readerStepBack, readerStepForward, reopenLastSidePanel, toggleReaderFocus]);

  // ── Keyboard ──────────────────────────────────────────────────────────────────
  useEffect(() => {
    const onKey = (e: KeyboardEvent) => {
      if (e.key === 'Escape') {
        setBookPopupOpen(false);
        setVersionPopupOpen(false);
        if (settingsOpenedFromHomeRef.current) setHomeScreenActive(true);
        setSettingsOpen(false);
        setSearchOpen(false);
      }
      if (e.key === 'ArrowRight') readerStepForward();
      if (e.key === 'ArrowLeft') readerStepBack();
    };
    document.addEventListener('keydown', onKey);
    return () => document.removeEventListener('keydown', onKey);
  }, [readerStepBack, readerStepForward]);

  useEffect(() => {
    if (!searchOpen) return;
    const id = window.requestAnimationFrame(() => searchInputRef.current?.focus());
    return () => cancelAnimationFrame(id);
  }, [searchOpen]);

  useEffect(() => {
    if (!searchOpen) return;
    const trimmed = searchQuery.trim();
    if (!trimmed || searchLooksLikeNavigation || trimmed.length < 3) {
      searchRequestIdRef.current += 1;
      setSearchLoading(false);
      setSearchResults([]);
      setSearchError(null);
      return;
    }
    const timeoutId = window.setTimeout(() => {
      void runPhraseSearch(trimmed, { showEmptyError: false });
    }, 220);
    return () => window.clearTimeout(timeoutId);
  }, [runPhraseSearch, searchLooksLikeNavigation, searchOpen, searchQuery]);

  // ── Draggable divider ─────────────────────────────────────────────────────────
  useEffect(() => {
    const divider = dividerRef.current;
    if (!divider) return;

    const beginDrag = (clientX: number) => {
      if (sidePanelModeRef.current === 'none') return;
      isDraggingRef.current   = true;
      dragStartXRef.current   = clientX;
      dragStartWidthRef.current = sidePaneRef.current?.offsetWidth ?? 0;
      setIsPaneTransitioning(false);
      divider.classList.add('dragging');
      document.body.classList.add('no-select');
    };
    const updateDrag = (clientX: number) => {
      if (!isDraggingRef.current) return;
      const delta    = clientX - dragStartXRef.current;
      const minWidth = Math.min(220, Math.max(160, Math.floor(window.innerWidth * 0.34)));
      const maxWidth = Math.max(minWidth + 20, Math.floor(window.innerWidth * 0.72));
      const direction = sidePanelPositionRef.current === 'right' ? -1 : 1;
      const next      = Math.max(minWidth, Math.min(maxWidth, dragStartWidthRef.current + (delta * direction)));
      setSidePaneWidth(`${next}px`);
    };
    const endDrag = () => {
      if (!isDraggingRef.current) return;
      isDraggingRef.current = false;
      divider.classList.remove('dragging');
      setIsPaneTransitioning(true);
      document.body.classList.remove('no-select');
    };

    const onMouseDown  = (e: MouseEvent)  => { e.preventDefault(); beginDrag(e.clientX); };
    const onMouseMove  = (e: MouseEvent)  => updateDrag(e.clientX);
    const onTouchStart = (e: TouchEvent)  => beginDrag(e.touches[0].clientX);
    const onTouchMove  = (e: TouchEvent)  => updateDrag(e.touches[0].clientX);

    divider.addEventListener('mousedown', onMouseDown);
    divider.addEventListener('touchstart', onTouchStart, { passive: true });
    document.addEventListener('mousemove', onMouseMove);
    document.addEventListener('touchmove', onTouchMove, { passive: true });
    document.addEventListener('mouseup', endDrag);
    document.addEventListener('touchend', endDrag);
    return () => {
      divider.removeEventListener('mousedown', onMouseDown);
      divider.removeEventListener('touchstart', onTouchStart);
      document.removeEventListener('mousemove', onMouseMove);
      document.removeEventListener('touchmove', onTouchMove);
      document.removeEventListener('mouseup', endDrag);
      document.removeEventListener('touchend', endDrag);
    };
  }, []);

  /** Expose panel width on the root element so fixed chapter nav can inset with the side pane (resize-aware). */
  useEffect(() => {
    document.documentElement.style.setProperty('--side-width', sidePaneWidth);
    return () => {
      document.documentElement.style.removeProperty('--side-width');
    };
  }, [sidePaneWidth]);

  // ── Init ──────────────────────────────────────────────────────────────────────
  useEffect(() => {
    // Store the migrated theme id (useThemePreference reads it normalised; the inline script already painted it)
    const saved = normalizeThemeId(localStorage.getItem('theme'));
    const storedLastPosition = readStoredLastPosition();
    startedWithSavedPositionRef.current = storedLastPosition !== null;
    const storedReaderSettings = readStoredReaderSettings();
    localStorage.setItem('theme', saved);
    setShowOnboarding(localStorage.getItem(ONBOARDING_STORAGE_KEY) !== '1');

    async function init() {
      try {
        const [booksData, translationsData, sourcesData] = await Promise.all([
          fetch('/api/v1/books').then(r => r.json()) as Promise<BookInfo[]>,
          fetch('/api/v1/translations').then(r => r.json()).catch(() => [{ id: DEFAULT_TRANSLATION, name: 'Berean Standard Bible' }]) as Promise<Translation[]>,
          fetch('/api/v1/commentary/sources').then(r => r.json()).catch(() => []) as Promise<CommentarySource[]>,
        ]);
        setBooks(booksData);
        setTranslations(filterTranslationsForPicker(translationsData));
        if (sourcesData.length) {
          setCommentarySources(sourcesData);
          setCommentarySourceNames(prev => {
            const next = { ...prev };
            sourcesData.forEach(s => { next[s.id] = s.name; });
            return next;
          });
        }
        const initialTranslation = normalizeTranslationChoice(storedLastPosition?.translation ?? DEFAULT_TRANSLATION);
        const urlBookName = initialReader?.book?.trim();
        const urlChapter = initialReader?.chapter;
        const urlChapterNum =
          urlChapter != null && Number.isFinite(urlChapter) && urlChapter > 0 ? urlChapter : undefined;
        const bookFromUrl =
          urlBookName && urlChapterNum != null
            ? booksData.find(b => b.name.toLowerCase() === urlBookName.toLowerCase())
            : undefined;
        if (bookFromUrl && urlChapterNum != null) {
          setHomeScreenActive(false);
          setTranslation(initialTranslation);
          if (initialCommentarySource) {
            commentarySourceRef.current = initialCommentarySource;
            setCommentarySource(initialCommentarySource);
          }
          if (initialPanel) {
            sidePanelModeRef.current = initialPanel;
            setSidePanelMode(initialPanel);
            lastSidePanelModeRef.current = initialPanel;
          } else if (storedReaderSettings.defaultPanel !== 'none') {
            const d = storedReaderSettings.defaultPanel;
            sidePanelModeRef.current = d;
            setSidePanelMode(d);
          }
          setCurrentBook(bookFromUrl);
          // Without this, the top bar and verse popup show chapter 1 and highlights/notes are keyed to chapter 1.
          setChapter(Math.min(urlChapterNum, bookFromUrl.total_chapters));
          loadChapter(
            bookFromUrl,
            Math.min(urlChapterNum, bookFromUrl.total_chapters),
            initialTranslation,
          );
        } else {
          const initialBook = booksData.find(b => b.name.toLowerCase() === storedLastPosition?.book?.toLowerCase())
            ?? booksData.find(b => b.book_number === 1)
            ?? booksData[0]
            ?? null;
          const initialChapter = storedLastPosition?.chapter && storedLastPosition.chapter > 0
            ? storedLastPosition.chapter
            : 1;
          setTranslation(initialTranslation);
          setCurrentBook(initialBook);
          if (initialBook) {
            // Without this, chapter stays 1 and the last-position effect overwrites the saved chapter with 1.
            setChapter(Math.min(initialChapter, initialBook.total_chapters));
            loadChapter(initialBook, Math.min(initialChapter, initialBook.total_chapters), initialTranslation);
            if (storedReaderSettings.defaultPanel !== 'none') {
              setSidePanelMode(storedReaderSettings.defaultPanel);
            }
          } else {
            setChapterLoading(false);
            setChapterError(true);
          }
        }
      } catch {
        setChapterLoading(false);
        setChapterError(true);
      }
    }
    // Strict Mode runs this effect twice on the same instance. Refs survive that, so the fetch runs once and a
    // late duplicate response can't reload the chapter (and close an open note editor) after the user starts.
    if (!initStartedRef.current) {
      initStartedRef.current = true;
      init();
    }
    // Nothing to tear down: the fetch is guarded by initStartedRef, so a Strict Mode replay is a no-op.
    return () => {};
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  useEffect(() => {
    if (!authSession || books.length === 0 || accountBootstrapRef.current) return;
    accountBootstrapRef.current = true;
    const sessionSnapshot = authSession;
    let cancelled = false;
    (async () => {
      try {
        const refreshed = await refreshSession(sessionSnapshot);
        if (cancelled) return;
        persistAuthSession(refreshed);
        setAuthSession(refreshed);
        await syncAccountStateRef.current(refreshed);
      } catch {
        if (cancelled) return;
        persistAuthSession(null);
        setAuthSession(null);
        setAccountProfile(null);
        accountBootstrapRef.current = false;
      }
    })();
    return () => {
      cancelled = true;
    };
    /* Intentionally omit authSession object identity and syncAccountState: deps on user id + books
       only so init hydration and token refresh do not cancel this effect mid-flight (fixes sign-in
       from /signin when a stored session is restored on first /app load). */
    // eslint-disable-next-line react-hooks/exhaustive-deps -- see above
  }, [authSession?.userId, books.length]);

  useEffect(() => {
    if (!authSession || !syncReadyRef.current || hydratingAccountRef.current || books.length === 0) return;
    const timer = window.setTimeout(() => {
      void putStudyItems(authSession, buildSyncedStudyItems()).catch(() => {
        /* ignore background sync errors */
      });
    }, 600);
    return () => clearTimeout(timer);
  }, [
    authSession,
    books.length,
    buildSyncedStudyItems,
    bookmarkedVerses,
    highlightedVerses,
    verseNotes,
  ]);

  useEffect(() => {
    if (!authSession || !syncReadyRef.current || hydratingAccountRef.current || books.length === 0) return;
    const timer = window.setTimeout(() => {
      void putReadingProgress(authSession, buildSyncedReadingProgress()).catch(() => {
        /* ignore background sync errors */
      });
    }, 600);
    return () => clearTimeout(timer);
  }, [authSession, books.length, buildSyncedReadingProgress, chapter, currentBook, selectedVerse, translation]);

  useEffect(() => {
    if (!authSession || !syncReadyRef.current || hydratingAccountRef.current) return;
    const timer = window.setTimeout(() => {
      void putUserSettings(authSession, buildSyncedUserSettings()).catch(() => {
        /* ignore background sync errors */
      });
    }, 600);
    return () => clearTimeout(timer);
  }, [authSession, buildSyncedUserSettings, currentTheme, readerSettings, recentPassages]);

  // ── Version popup positioning ─────────────────────────────────────────────────
  const openVersionPopup = useCallback(() => {
    setSearchOpen(false);
    const rect = versionBtnRef.current?.getBoundingClientRect();
    setVersionPanelLeft(Math.max(12, rect?.left ?? 20));
    setVersionPopupOpen(true);
  }, []);

  // ── Chapter quiz gate (≥50% through chapter + visible dwell; dwell scales with verse count) ──
  useEffect(() => {
    if (!chapterData || !currentBook) return;
    const key = `${currentBook.book_number}|${chapter}|${translation}|${readerSettings.readingMode}`;
    if (chapterQuizGateKeyRef.current === key) return;
    chapterQuizGateKeyRef.current = key;
    chapterQuizScrollDepthMaxRef.current = 0;
    chapterQuizPagedSpreadMaxRef.current = 0;
    chapterQuizSideEngagedDwellMsRef.current = 0;
    const docVisible = typeof document !== 'undefined' && document.visibilityState === 'visible';
    chapterQuizVisitRef.current = {
      visibleAccumMs: 0,
      visibleStartedAt: docVisible && !homeScreenActiveRef.current ? Date.now() : null,
    };
  }, [
    chapterData?.book,
    chapterData?.chapter,
    currentBook?.book_number,
    chapter,
    translation,
    readerSettings.readingMode,
  ]);

  useEffect(() => {
    const onVis = () => {
      const v = chapterQuizVisitRef.current;
      if (document.visibilityState === 'hidden') {
        if (v.visibleStartedAt != null) {
          v.visibleAccumMs += Date.now() - v.visibleStartedAt;
          v.visibleStartedAt = null;
        }
      } else if (!homeScreenActiveRef.current && v.visibleStartedAt == null) {
        v.visibleStartedAt = Date.now();
      }
    };
    document.addEventListener('visibilitychange', onVis);
    return () => document.removeEventListener('visibilitychange', onVis);
  }, []);

  useEffect(() => {
    const v = chapterQuizVisitRef.current;
    if (homeScreenActive) {
      if (v.visibleStartedAt != null) {
        v.visibleAccumMs += Date.now() - v.visibleStartedAt;
        v.visibleStartedAt = null;
      }
      return;
    }
    if (typeof document === 'undefined') return;
    if (document.visibilityState === 'visible' && v.visibleStartedAt == null) {
      v.visibleStartedAt = Date.now();
    }
  }, [homeScreenActive]);

  useEffect(() => {
    if (homeScreenActive || !chapterData) return;
    const id = window.setInterval(() => setChapterQuizGateTick((t) => t + 1), 500);
    return () => clearInterval(id);
  }, [homeScreenActive, chapterData?.book, chapterData?.chapter]);

  useEffect(() => {
    setQuizOpen(false);
    setQuizTakenThisChapterVisit(false);
  }, [chapter, chapterData?.book, translation]);

  useLayoutEffect(() => {
    if (!chapterData || isPagedReadingMode(readerSettings.readingMode)) return;
    const pane = biblePaneRef.current;
    if (!pane) return;
    const d = biblePaneScrollDepthRatio(pane);
    chapterQuizScrollDepthMaxRef.current = Math.max(chapterQuizScrollDepthMaxRef.current, d);
  }, [
    chapterData?.book,
    chapterData?.chapter,
    chapterData?.verses,
    readerSettings.readingMode,
    pagedPageSlices,
    chapterLoading,
  ]);

  useEffect(() => {
    if (!isPagedReadingMode(readerSettings.readingMode) || !pagedPageSlices?.length) return;
    const prev = chapterQuizPagedSpreadMaxRef.current;
    chapterQuizPagedSpreadMaxRef.current = Math.max(prev, chapterSpreadIndex);
    if (chapterQuizPagedSpreadMaxRef.current > prev) setChapterQuizGateTick((t) => t + 1);
  }, [chapterSpreadIndex, pagedPageSlices, readerSettings.readingMode]);

  const chapterQuizGate = useMemo(() => {
    const verseCount = chapterData?.verses.length ?? 0;
    const requiredMs = computeChapterQuizRequiredDwellMs(verseCount);
    const wallMs = getChapterQuizVisibleMs(chapterQuizVisitRef);
    const sideMs = chapterQuizSideEngagedDwellMsRef.current;
    const visibleMs = Math.max(wallMs, sideMs);
    const timeOk = visibleMs >= requiredMs;
    const isPaged = isPagedReadingMode(readerSettings.readingMode);
    const slicesLen = pagedPageSlices?.length ?? 0;
    const spreadTotal =
      isPaged && slicesLen > 0
        ? readerSettings.readingMode === 'paged-double'
          ? Math.ceil(slicesLen / 2)
          : slicesLen
        : 0;
    const scrollMax = chapterQuizScrollDepthMaxRef.current;
    let progressOk = false;
    if (isPaged && spreadTotal > 0) {
      progressOk = (chapterQuizPagedSpreadMaxRef.current + 1) / spreadTotal >= 0.5;
    } else {
      progressOk = scrollMax >= 0.5;
    }
    const met = timeOk && progressOk;
    const remainingSec = Math.max(0, Math.ceil((requiredMs - visibleMs) / 1000));
    const secWord = remainingSec === 1 ? 'second' : 'seconds';
    let hint: string | null = null;
    if (!met) {
      if (!progressOk && !timeOk) {
        hint = `Go through at least half of this chapter and read ${remainingSec} more ${secWord}.`;
      } else if (!progressOk) {
        hint = 'Go through at least half of this chapter to unlock the quiz.';
      } else {
        hint = `Read ${remainingSec} more ${secWord}.`;
      }
    }
    return { met, hint, timeOk, progressOk, requiredMs, visibleMs };
  }, [
    chapterQuizGateTick,
    chapterData?.verses.length,
    readerSettings.readingMode,
    chapterSpreadIndex,
    pagedPageSlices?.length,
  ]);

  // ── Render helpers ────────────────────────────────────────────────────────────
  const sidePanelTitle = () => {
    if (sidePanelMode === 'commentary')  return commentarySourceNames[commentarySource] ?? commentarySource;
    if (sidePanelMode === 'study') return 'My Stuff';
    if (sidePanelMode === 'words') return 'Original words';
    return 'Bible Companion';
  };
  const currentBookLabel = currentBook
    ? getLocalizedBookName(currentBook, translation, translationsById)
    : '';
  const chapterBookLabel = getLocalizedBookNameFromRaw(
    chapterData?.book,
    translation,
    booksByName,
    translationsById,
  );
  const currentTranslationLabel = getTranslationDisplayId(translation);
  const currentTranslationMeta = translationsById.get(translation);
  const currentTranslationTitle =
    currentTranslationMeta?.name != null
      ? `${getTranslationDisplayName(translation, currentTranslationMeta.name)} (${currentTranslationLabel})`
      : currentTranslationLabel;
  const sidePanelContext = currentBook ? `${currentBookLabel} ${chapter} • ${currentTranslationLabel}` : '';
  const navLabel = currentBook ? `${currentBookLabel} ${chapter}` : 'Select Book';

  const sideOpen = sidePanelMode !== 'none';
  const sidePaneOnRight = readerSettings.sidePanelPosition === 'right';
  const pagedSpreadTotal =
    !isPagedReadingMode(readerSettings.readingMode) || !pagedPageSlices?.length
      ? 0
      : readerSettings.readingMode === 'paged-double'
        ? Math.ceil(pagedPageSlices.length / 2)
        : pagedPageSlices.length;
  const readerAtFirstSpread =
    !isPagedReadingMode(readerSettings.readingMode) || chapterSpreadIndex === 0;
  const readerAtLastSpread =
    !isPagedReadingMode(readerSettings.readingMode) ||
    (pagedSpreadTotal > 0 && chapterSpreadIndex >= pagedSpreadTotal - 1);
  const readerNavPrevDisabled =
    !currentBook || (!!isFirstChapter() && readerAtFirstSpread);
  const readerNavNextDisabled =
    !currentBook || (!!isLastChapter() && readerAtLastSpread);
  const selectedVerseHighlighted = selectedVerseKey ? highlightedVerses.includes(selectedVerseKey) : false;
  const availableCommentarySources = commentarySources.length > 0
    ? [...commentarySources].sort((a, b) => {
        if (a.id === 'summary') return -1;
        if (b.id === 'summary') return 1;
        return 0;
      })
    : [
        { id: 'summary', name: 'Chapter Summaries' },
        { id: 'matthew_henry', name: 'Matthew Henry Commentary' },
      ];

  const chromeOverlaysOpen =
    bookPopupOpen || versionPopupOpen || searchOpen || settingsOpen;
  const tutorialPinsReaderChrome =
    tutorialOpen &&
    !homeScreenActive &&
    (tutorialStep.id === 'reader' ||
      tutorialStep.id === 'verse-tools' ||
      tutorialStep.id === 'search');
  const chromeBottomPinned = ttsVoiceOpen;
  const chromeTopVisible =
    homeScreenActive || chromeOverlaysOpen || chromeTopShown || tutorialPinsReaderChrome;
  const chromeBottomVisible =
    homeScreenActive || chromeOverlaysOpen || chromeBottomPinned || chromeBottomShown;
  const contentShellChromeHidden =
    !homeScreenActive && !chromeTopVisible && !chromeBottomVisible;

  // ── JSX ───────────────────────────────────────────────────────────────────────
  return (
    <>
      {homeScreenActive && (
        <HomeScreen
          appliedTheme={appliedTheme}
          homeTimeGreeting={homeTimeGreeting}
          coinBalance={coinBalance}
          sidePanelMode={sidePanelMode}
          toggleStudyPanel={toggleStudyPanel}
          tutorialHomeSpotRef={tutorialHomeSpotRef}
          dailyVerse={dailyVerse}
          handleDailyVerseRefClick={handleDailyVerseRefClick}
          handleSurpriseMe={handleSurpriseMe}
          surpriseDisabled={books.length === 0}
          dailyRewardsStatus={dailyRewardsStatus}
          minutesTowardGoal={minutesTowardGoal}
          taskChapterDone={taskChapterDone}
          taskAiDone={taskAiDone}
          taskMinutesDone={taskMinutesDone}
          handleClaimDailyTasksBonus={handleClaimDailyTasksBonus}
          tasksBonusClaiming={tasksBonusClaiming}
          chapterLoading={chapterLoading}
          chapterData={chapterData}
          openReaderFromHome={openReaderFromHome}
          currentBookLabel={currentBookLabel}
          currentTranslationLabel={currentTranslationLabel}
          openTutorial={openTutorial}
          sidePanelTitle={sidePanelTitle}
          sidePanelContext={sidePanelContext}
          closeSidePanel={closeSidePanel}
          studyContent={<StudyContent chapterData={chapterData} handleAuthSignIn={handleAuthSignIn} handleAuthSignUp={handleAuthSignUp} handleAuthSignOut={handleAuthSignOut} coinBalance={coinBalance} readingGoalEditing={readingGoalEditing} setReadingGoalEditing={setReadingGoalEditing} readingRhythmTitle={readingRhythmTitle} dailyGoalsExpanded={dailyGoalsExpanded} setDailyGoalsExpanded={setDailyGoalsExpanded} taskChapterDone={taskChapterDone} taskAiDone={taskAiDone} taskMinutesDone={taskMinutesDone} dailyRewardsStatus={dailyRewardsStatus} handleClaimDailyTasksBonus={handleClaimDailyTasksBonus} tasksBonusClaiming={tasksBonusClaiming} navigateToPassage={navigateToPassage} homeScreenActive={homeScreenActive} openReaderFromHome={openReaderFromHome} closeSidePanel={closeSidePanel} />}
        />
      )}

      {/* Topbar */}
      {!homeScreenActive && (
      <TopBar
        chromeTopVisible={chromeTopVisible}
        bumpChromeScrollInteraction={bumpChromeScrollInteraction}
        topChromeHoverRef={topChromeHoverRef}
        setChromeTopShown={setChromeTopShown}
        chromeScrollRevealActiveRef={chromeScrollRevealActiveRef}
        lastPointerYRef={lastPointerYRef}
        bookPopupOpen={bookPopupOpen}
        setBookPopupOpen={setBookPopupOpen}
        setSearchOpen={setSearchOpen}
        setVersionPopupOpen={setVersionPopupOpen}
        navLabel={navLabel}
        versionBtnRef={versionBtnRef}
        versionPopupOpen={versionPopupOpen}
        openVersionPopup={openVersionPopup}
        currentTranslationTitle={currentTranslationTitle}
        currentTranslationLabel={currentTranslationLabel}
        searchOpen={searchOpen}
        sidePanelMode={sidePanelMode}
        toggleStudyPanel={toggleStudyPanel}
      />
      )}

      {/* Book popup */}
      {!homeScreenActive && (
      <BookPanel
        expandedBook={expandedBook}
        setExpandedBook={setExpandedBook}
        bookPopupOpen={bookPopupOpen}
        setBookPopupOpen={setBookPopupOpen}
        translationsById={translationsById}
        pickChapter={pickChapter}
      />
      )}

      {/* Version popup */}
      {!homeScreenActive && (
      <VersionPanel
        versionPopupOpen={versionPopupOpen}
        setVersionPopupOpen={setVersionPopupOpen}
        versionPanelLeft={versionPanelLeft}
        pickTranslation={pickTranslation}
      />
      )}

      {!homeScreenActive && (
      <SearchPanel
        searchOpen={searchOpen}
        setSearchOpen={setSearchOpen}
        searchPanelRef={searchPanelRef}
        searchInputRef={searchInputRef}
        searchQuery={searchQuery}
        setSearchQuery={setSearchQuery}
        searchLoading={searchLoading}
        searchError={searchError}
        searchSuggestions={searchSuggestions}
        searchResults={searchResults}
        recentPassages={recentPassages}
        runSearch={runSearch}
        applySearchSuggestion={applySearchSuggestion}
        navigateToPassage={navigateToPassage}
      />
      )}

      {/* Content shell */}
      <div className={`content-shell${contentShellChromeHidden ? ' chrome-hidden' : ''}${homeScreenActive ? ' home-screen-behind' : ''}`}>
        {/* Main content area */}
        <div
          ref={contentAreaRef}
          className={`content-area${sidePaneOnRight ? ' side-pane-right' : ''}`}
        >
          <button
            type="button"
            className={`side-edge-toggle${sidePaneOnRight ? ' side-edge-toggle-right' : ' side-edge-toggle-left'}${sideOpen ? ' open' : ''}`}
            aria-label={sideOpen ? 'Return to full-screen reader' : 'Open side panel'}
            aria-expanded={sideOpen}
            onClick={toggleReaderFocus}
          >
            <span className="side-edge-toggle-text">
              {sideOpen ? 'Full reader' : 'Open panel'}
            </span>
          </button>
          {/* Side pane */}
          <aside
            ref={sidePaneRef}
            className={`side-pane${sideOpen ? ' open' : ''}${isPaneTransitioning ? ' transitioning' : ''}`}
          >
            <div className="side-header">
              {sidePanelMode === 'ai' ? (
                <>
                  <div className="side-header-row">
                    <div className="side-header-title-row">
                      <button
                        type="button"
                        className="side-close-btn"
                        aria-label="Close AI sidebar"
                        onClick={closeSidePanel}
                      >
                        ×
                      </button>
                      <span className="side-eyebrow">AI assistant</span>
                    </div>
                    <span className="side-subtitle side-subtitle-inline">{sidePanelContext}</span>
                  </div>
                  <div
                    ref={agentMenuRef}
                    className={`commentary-source-row visible${agentMenuOpen ? ' open' : ''}`}
                  >
                    <button
                      className="commentary-source-select"
                      type="button"
                      aria-haspopup="listbox"
                      aria-expanded={agentMenuOpen}
                      onClick={() => setAgentMenuOpen(v => !v)}
                    >
                      <span className="commentary-source-select-label">
                        {PERSONALITIES.find(p => p.id === personalityId)?.name ?? 'Ruth'}
                      </span>
                      <span className="commentary-source-chevron" aria-hidden="true" />
                    </button>
                    <div className="commentary-source-menu" role="listbox" aria-label="AI assistant">
                      {PERSONALITIES.map(p => (
                        <button
                          key={p.id}
                          className={`commentary-source-option${p.id === personalityId ? ' selected' : ''}`}
                          type="button"
                          role="option"
                          aria-selected={p.id === personalityId}
                          onClick={() => {
                            setPersonalityId(p.id);
                            try {
                              window.localStorage.setItem(STORAGE_KEYS.AI_PERSONALITY, p.id);
                            } catch {
                              /* ignore */
                            }
                            setAgentMenuOpen(false);
                          }}
                        >
                          <span>{p.name}</span>
                          {p.id === personalityId && <span className="commentary-source-check">✓</span>}
                        </button>
                      ))}
                    </div>
                  </div>
                </>
              ) : (
                <>
                  {sidePanelMode === 'commentary' && (
                    <div className="side-header-title-row">
                      <button
                        type="button"
                        className="side-close-btn"
                        aria-label="Close resources sidebar"
                        onClick={closeSidePanel}
                      >
                        ×
                      </button>
                      <span className="side-eyebrow">Resources</span>
                    </div>
                  )}
                  {sidePanelMode !== 'commentary' && (
                    <div className="side-close-row">
                      <button
                        type="button"
                        className="side-close-btn"
                        aria-label={sidePanelMode === 'study' ? 'Close My Stuff sidebar' : 'Close sidebar'}
                        onClick={closeSidePanel}
                      >
                        ×
                      </button>
                    </div>
                  )}
                  <div className="side-title">{sidePanelTitle()}</div>
                  <div className="side-subtitle">{sidePanelContext}</div>
                </>
              )}
              {sidePanelMode === 'commentary' && (
                <div
                  ref={commentarySourceMenuRef}
                  className={`commentary-source-row visible${commentarySourceMenuOpen ? ' open' : ''}`}
                >
                  <button
                    className="commentary-source-select"
                    type="button"
                    aria-haspopup="listbox"
                    aria-expanded={commentarySourceMenuOpen}
                    onClick={() => setCommentarySourceMenuOpen(v => !v)}
                  >
                    <span className="commentary-source-select-label">
                      {commentarySourceNames[commentarySource] ?? commentarySource}
                    </span>
                    <span className="commentary-source-chevron" aria-hidden="true" />
                  </button>
                  <div className="commentary-source-menu" role="listbox" aria-label="Resource type">
                    {availableCommentarySources.map(source => (
                      <button
                        key={source.id}
                        className={`commentary-source-option${source.id === commentarySource ? ' selected' : ''}`}
                        type="button"
                        role="option"
                        aria-selected={source.id === commentarySource}
                        onClick={() => {
                          setCommentarySource(source.id);
                          setCommentarySourceMenuOpen(false);
                          const book = currentBookRef.current;
                          if (book) loadCommentaryData(book, chapterRef.current, source.id);
                        }}
                      >
                        <span>{source.name}</span>
                        {source.id === commentarySource && <span className="commentary-source-check">✓</span>}
                      </button>
                    ))}
                  </div>
                </div>
              )}
            </div>
            <div className="side-scroll" ref={sideScrollRef}>
              {sidePanelMode === 'commentary' && <CommentaryContent commentaryLoading={commentaryLoading} commentaryError={commentaryError} commentaryEntries={commentaryEntries} commentarySource={commentarySource} chapterData={chapterData} syncedVerseStart={syncedVerseStart} />}
              {sidePanelMode === 'study' && !homeScreenActive && <StudyContent chapterData={chapterData} handleAuthSignIn={handleAuthSignIn} handleAuthSignUp={handleAuthSignUp} handleAuthSignOut={handleAuthSignOut} coinBalance={coinBalance} readingGoalEditing={readingGoalEditing} setReadingGoalEditing={setReadingGoalEditing} readingRhythmTitle={readingRhythmTitle} dailyGoalsExpanded={dailyGoalsExpanded} setDailyGoalsExpanded={setDailyGoalsExpanded} taskChapterDone={taskChapterDone} taskAiDone={taskAiDone} taskMinutesDone={taskMinutesDone} dailyRewardsStatus={dailyRewardsStatus} handleClaimDailyTasksBonus={handleClaimDailyTasksBonus} tasksBonusClaiming={tasksBonusClaiming} navigateToPassage={navigateToPassage} homeScreenActive={homeScreenActive} openReaderFromHome={openReaderFromHome} closeSidePanel={closeSidePanel} />}
              {sidePanelMode === 'words' && <WordsPanel target={wordsTarget} translation={translation} navigateToPassage={navigateToPassage} />}
              {sidePanelMode === 'ai' && (
                <AiSidebar
                  currentBookName={currentBook?.name ?? null}
                  chapter={chapter}
                  translation={translation}
                  personalityId={personalityId}
                  bibleBooks={bibleBooksForAi}
                  onNavigate={handleAiNavigate}
                  onOpenCommentary={handleAiOpenCommentary}
                  composerSeed={aiComposerSeed}
                  onUserMessageSent={markSpokeToAi}
                />
              )}
            </div>
          </aside>

          {/* Draggable divider */}
          <div
            ref={dividerRef}
            className={`pane-divider${sideOpen ? ' visible' : ''}`}
          />

          {/* Bible pane */}
          <main
            className={`bible-pane${isPagedReadingMode(readerSettings.readingMode) ? ' bible-pane--paged' : ''}`}
            ref={biblePaneRef}
          >
            <div
              className={`reader-wrap${
                readerSettings.readingMode === 'book' ? ' reader-wrap--book' : ''
              }${
                isPagedReadingMode(readerSettings.readingMode) ? ' reader-wrap--paged' : ''
              }${!sideOpen ? ' reader-wrap--full' : ''}`}
            >
              {<ChapterContent chapterLoading={chapterLoading} chapterError={chapterError} chapterData={chapterData} chapterBookLabel={chapterBookLabel} pagedPageSlices={pagedPageSlices} chapterSpreadIndex={chapterSpreadIndex} animClass={animClass} setAnimClass={setAnimClass} setChapterData={setChapterData} setChapterLoading={setChapterLoading} pagedFlipAnim={pagedFlipAnim} setPagedFlipAnim={setPagedFlipAnim} aiNavHighlight={aiNavHighlight} selectedVerse={selectedVerse} setSelectedVerse={setSelectedVerse} selectedVerseGroup={selectedVerseGroup} setSelectedVerseGroup={setSelectedVerseGroup} selectedVerseData={selectedVerseData} selectedVerseKey={selectedVerseKey} selectedVerseNote={selectedVerseNote} selectedVerseHighlighted={selectedVerseHighlighted} versePopupPos={versePopupPos} setVersePopupPos={setVersePopupPos} showVerseNoteEditor={showVerseNoteEditor} setShowVerseNoteEditor={setShowVerseNoteEditor} currentNoteDraft={currentNoteDraft} setCurrentNoteDraft={setCurrentNoteDraft} closeVerseStudyPopup={closeVerseStudyPopup} toggleVerseHighlight={toggleVerseHighlight} saveVerseNote={saveVerseNote} copySelectedVerse={copySelectedVerse} tutorialVerseToolsNavBlocked={tutorialVerseToolsNavBlocked} openSidePanel={openSidePanel} openOriginalWords={openOriginalWords} setAiComposerSeed={setAiComposerSeed} recordChapterEngagement={recordChapterEngagement} chapterQuizGate={chapterQuizGate} quizTakenThisChapterVisit={quizTakenThisChapterVisit} setQuizOpen={setQuizOpen} topVisibleVerseRef={topVisibleVerseRef} exitAnimDoneRef={exitAnimDoneRef} pendingFlipDataRef={pendingFlipDataRef} biblePaneRef={biblePaneRef} sidePanelModeRef={sidePanelModeRef} currentBookRef={currentBookRef} chapterRef={chapterRef} commentarySourceRef={commentarySourceRef} loadCommentaryData={loadCommentaryData} pagedContentRef={pagedContentRef} pagedMeasureRef={pagedMeasureRef} pagedFlipAnimRef={pagedFlipAnimRef} pagedFlipPendingRef={pagedFlipPendingRef} readerPassagesRef={readerPassagesRef} verseStudyPopupRef={verseStudyPopupRef} />}
            </div>
            <div
              className={`ch-nav ch-nav-prev${chromeBottomVisible ? '' : ' chrome-hide-bottom'}${homeScreenActive ? ' home-screen-behind' : ''}${sideOpen && !sidePaneOnRight ? ' side-pane-open' : ''}`}
              onPointerDown={bumpChromeScrollInteraction}
              onFocusCapture={bumpChromeScrollInteraction}
              onMouseEnter={isPagedReadingMode(readerSettings.readingMode) ? undefined : enterBottomChrome}
              onMouseLeave={isPagedReadingMode(readerSettings.readingMode) ? undefined : leaveBottomChrome}
            >
              <button
                className="ch-nav-btn"
                type="button"
                aria-label="Previous page or chapter"
                disabled={readerNavPrevDisabled}
                onClick={readerStepBack}
              >
                &lsaquo;
              </button>
            </div>

            <div
              className={`ch-nav ch-nav-next${chromeBottomVisible ? '' : ' chrome-hide-bottom'}${homeScreenActive ? ' home-screen-behind' : ''}${sideOpen && sidePaneOnRight ? ' side-pane-open' : ''}`}
              onPointerDown={bumpChromeScrollInteraction}
              onFocusCapture={bumpChromeScrollInteraction}
              onMouseEnter={isPagedReadingMode(readerSettings.readingMode) ? undefined : enterBottomChrome}
              onMouseLeave={isPagedReadingMode(readerSettings.readingMode) ? undefined : leaveBottomChrome}
            >
              <button
                className="ch-nav-btn"
                type="button"
                aria-label="Next page or chapter"
                disabled={readerNavNextDisabled}
                onClick={readerStepForward}
              >
                &rsaquo;
              </button>
            </div>
          </main>
        </div>
      </div>

      {readerAskBubble && chapterData && !homeScreenActive && (
        <button
          type="button"
          className="reader-selection-ask-btn"
          style={{
            position: 'fixed',
            top: readerAskBubble.top - 6,
            left: readerAskBubble.left,
            zIndex: 80,
          }}
          aria-label={`Ask ${currentAgentName} to explain the selected passage`}
          onClick={handleAskFromReaderSelection}
        >
          Ask {currentAgentName}
        </button>
      )}

      {/* Chapter nav buttons */}
      <div
        className={`ch-nav ch-nav-prev ch-nav--legacy${chromeBottomVisible ? '' : ' chrome-hide-bottom'}${homeScreenActive ? ' home-screen-behind' : ''}${sideOpen && !sidePaneOnRight ? ' side-pane-open' : ''}`}
        onPointerDown={bumpChromeScrollInteraction}
        onFocusCapture={bumpChromeScrollInteraction}
        onMouseEnter={isPagedReadingMode(readerSettings.readingMode) ? undefined : enterBottomChrome}
        onMouseLeave={isPagedReadingMode(readerSettings.readingMode) ? undefined : leaveBottomChrome}
      >
        <button
          className="ch-nav-btn"
          type="button"
          aria-label="Previous page or chapter"
          disabled={readerNavPrevDisabled}
          onClick={readerStepBack}
        >
          &lsaquo;
        </button>
      </div>

      <div
        className={`ch-nav ch-nav-next ch-nav--legacy${chromeBottomVisible ? '' : ' chrome-hide-bottom'}${homeScreenActive ? ' home-screen-behind' : ''}${sideOpen && sidePaneOnRight ? ' side-pane-open' : ''}`}
        onPointerDown={bumpChromeScrollInteraction}
        onFocusCapture={bumpChromeScrollInteraction}
        onMouseEnter={isPagedReadingMode(readerSettings.readingMode) ? undefined : enterBottomChrome}
        onMouseLeave={isPagedReadingMode(readerSettings.readingMode) ? undefined : leaveBottomChrome}
      >
        <button
          className="ch-nav-btn"
          type="button"
          aria-label="Next page or chapter"
          disabled={readerNavNextDisabled}
          onClick={readerStepForward}
        >
          &rsaquo;
        </button>
      </div>

      {/* TTS play button (center, same level as chapter nav arrows) */}
      <div
        className={`ch-nav tts-center${chromeBottomVisible ? '' : ' chrome-hide-bottom'}${homeScreenActive ? ' home-screen-behind' : ''}`}
        onPointerDown={bumpChromeScrollInteraction}
        onFocusCapture={bumpChromeScrollInteraction}
      >
        <div className="tts-btn-group">
          <button
            className={`ch-nav-btn tts-play-btn${ttsPlaying ? ' tts-playing' : ''}`}
            type="button"
            aria-label={ttsPlaying ? 'Stop reading' : 'Read aloud'}
            disabled={!chapterData}
            onClick={toggleTts}
          >
            {ttsPlaying ? (
              <svg viewBox="0 0 24 24" width="18" height="18" fill="currentColor" aria-hidden="true">
                <rect x="6" y="5" width="4" height="14" rx="1" />
                <rect x="14" y="5" width="4" height="14" rx="1" />
              </svg>
            ) : (
              <svg viewBox="0 0 24 24" width="18" height="18" fill="currentColor" aria-hidden="true">
                <path d="M8 5.14v14l11-7-11-7z" />
              </svg>
            )}
          </button>
          <button
            className={`tts-voice-toggle${ttsVoiceOpen ? ' active' : ''}`}
            type="button"
            aria-label="Voice settings"
            onClick={() => setTtsVoiceOpen(o => !o)}
          >
            <svg viewBox="0 0 24 24" width="13" height="13" fill="currentColor" aria-hidden="true">
              <circle cx="6" cy="12" r="1.9" />
              <circle cx="12" cy="12" r="1.9" />
              <circle cx="18" cy="12" r="1.9" />
            </svg>
          </button>
        </div>

        {ttsVoiceOpen && (
          <div className="tts-voice-panel" onClick={e => e.stopPropagation()}>
            <div className="tts-voice-panel-row">
              <label className="tts-label" htmlFor="tts-voice-select">Voice</label>
              <select
                id="tts-voice-select"
                className="tts-select"
                value={ttsSelectedVoiceUri ?? ''}
                onChange={e => setTtsSelectedVoiceUri(e.target.value || null)}
              >
                <option value="">Auto ({ttsLang})</option>
                {ttsLangVoices.map(v => (
                  <option key={v.voiceURI} value={v.voiceURI}>{v.name}</option>
                ))}
                {ttsLangVoices.length === 0 && ttsVoices.map(v => (
                  <option key={v.voiceURI} value={v.voiceURI}>{v.name} ({v.lang})</option>
                ))}
              </select>
            </div>
            <div className="tts-voice-panel-row">
              <label className="tts-label" htmlFor="tts-rate-range">Speed</label>
              <input
                id="tts-rate-range"
                type="range"
                className="tts-rate"
                min="0.5"
                max="2"
                step="0.1"
                value={ttsRate}
                onChange={e => setTtsRate(Number(e.target.value))}
              />
              <span className="tts-rate-val">{ttsRate.toFixed(1)}×</span>
            </div>
          </div>
        )}
      </div>

      {/* Taskbar */}
      <div
        className={`taskbar${chromeBottomVisible ? '' : ' chrome-hide-bottom'}`}
        onPointerDown={bumpChromeScrollInteraction}
        onFocusCapture={bumpChromeScrollInteraction}
        onMouseEnter={enterBottomChrome}
        onMouseLeave={leaveBottomChrome}
      >
        <button
          className="taskbar-btn taskbar-btn-settings"
          type="button"
          aria-label="Settings"
          onClick={() => {
            settingsOpenedFromHomeRef.current = homeScreenActive;
            setSettingsOpen(true);
          }}
        >
          <span className="taskbar-icon" aria-hidden="true">
            <svg viewBox="0 0 24 24">
              <circle cx="12" cy="12" r="3" />
              <path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1-2.83 2.83l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-4 0v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83-2.83l.06-.06A1.65 1.65 0 0 0 4.68 15a1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1 0-4h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 2.83-2.83l.06.06A1.65 1.65 0 0 0 9 4.68a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 4 0v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 2.83l-.06.06A1.65 1.65 0 0 0 19.4 9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 0 4h-.09a1.65 1.65 0 0 0-1.51 1Z" />
            </svg>
          </span>
        </button>

        <span
          className="taskbar-tooltip-wrap"
          data-tooltip="Home"
        >
          <button
            className={`taskbar-btn${homeScreenActive ? ' active' : ''}`}
            type="button"
            aria-label="Home"
            onClick={goToHome}
          >
            <span className="taskbar-icon" aria-hidden="true">
              <svg viewBox="0 0 24 24">
                <path d="M10.5 3.5 3 9.5V20a1.5 1.5 0 0 0 1.5 1.5H9V14h6v7.5h4.5A1.5 1.5 0 0 0 21 20V9.5L13.5 3.5a2 2 0 0 0-3 0Z" />
              </svg>
            </span>
          </button>
        </span>

        <span
          className="taskbar-tooltip-wrap"
          data-tooltip="Bible"
        >
          <button
            className={`taskbar-btn taskbar-btn-brand is-primary${!homeScreenActive && sidePanelMode === 'none' ? ' active' : ''}`}
            type="button"
            aria-label="Bible reader"
            onClick={() => (homeScreenActive ? openReaderFromHome('none') : closeSidePanel())}
          >
            <span className="taskbar-icon" aria-hidden="true">
              <img
                src={logoSrcForTheme(appliedTheme)}
                alt=""
                className="taskbar-icon-img"
                width={22}
                height={22}
                draggable={false}
              />
            </span>
          </button>
        </span>

        <span
          className="taskbar-tooltip-wrap"
          data-tooltip="Resources"
        >
          <button
            className={`taskbar-btn${!homeScreenActive && sidePanelMode === 'commentary' ? ' active' : ''}`}
            type="button"
            aria-label="Resources"
            onClick={() => (homeScreenActive ? openReaderFromHome('commentary') : toggleCommentary())}
          >
            <span className="taskbar-icon" aria-hidden="true">
              <svg viewBox="0 0 24 24">
                <path d="M6 7.5h9" /><path d="M6 11h12" /><path d="M6 14.5h8" />
                <path d="M5 4.5h14a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H12l-4.5 3v-3H5a2 2 0 0 1-2-2v-8a2 2 0 0 1 2-2Z" />
              </svg>
            </span>
          </button>
        </span>

        <span
          className="taskbar-tooltip-wrap"
          data-tooltip="AI"
        >
          <button
            className={`taskbar-btn${!homeScreenActive && sidePanelMode === 'ai' ? ' active' : ''}`}
            type="button"
            aria-label="AI assistant"
            onClick={() => (homeScreenActive ? openReaderFromHome('ai') : toggleAiPanel())}
          >
            <span className="taskbar-icon" aria-hidden="true">
              <svg viewBox="0 0 24 24">
                <path d="M12 3.5 13.9 8l4.6 1.9-4.6 1.9-1.9 4.7-1.9-4.7L5.5 9.9 10.1 8 12 3.5Z" className="icon-solid" />
                <path d="M18 14.5 18.9 16.6 21 17.5l-2.1.9-.9 2.1-.9-2.1-2.1-.9 2.1-.9.9-2.1Z" className="icon-solid" />
                <path d="M6.5 15.5 7.2 17l1.5.7-1.5.7-.7 1.6-.7-1.6-1.6-.7 1.6-.7.7-1.5Z" className="icon-solid" />
              </svg>
            </span>
          </button>
        </span>

      </div>

      {/* Settings panel */}
      <SettingsPanel
        settingsOpen={settingsOpen}
        setSettingsOpen={setSettingsOpen}
        settingsPanelRef={settingsPanelRef}
        settingsOpenedFromHomeRef={settingsOpenedFromHomeRef}
        setHomeScreenActive={setHomeScreenActive}
        currentTheme={currentTheme}
        applyTheme={applyTheme}
      />

      {tutorialOpen && tutorialStep && (
        <div
          className="tutorial-overlay"
          style={tutorialOverlayVars}
          role="dialog"
          aria-modal="true"
          aria-labelledby="tutorial-title"
        >
          {tutorialVerseToolsBlockers ? (
            <>
              {(['top', 'bottom', 'left', 'right'] as const).map(side => (
                <div
                  key={side}
                  className={`tutorial-blocker tutorial-blocker--${side}`}
                  style={tutorialVerseToolsBlockers[side]}
                  aria-hidden="true"
                  onPointerDown={e => {
                    e.preventDefault();
                    e.stopPropagation();
                  }}
                />
              ))}
            </>
          ) : (
            <div
              className="tutorial-pointer-catcher"
              aria-hidden="true"
              onPointerDown={e => {
                e.preventDefault();
                e.stopPropagation();
              }}
            />
          )}
          <div
            className={`tutorial-overlay-dimmer${
              tutorialStep.id === 'verse-tools'
                ? tutorialVerseToolsStudyOpen
                  ? ' tutorial-overlay-dimmer--verse-tools-popup'
                  : ' tutorial-overlay-dimmer--verse-tools-line'
                : ''
            }`}
            style={tutorialSpotlightStyle}
            aria-hidden="true"
          />
          <div
            className={`tutorial-spotlight tutorial-spotlight--${tutorialStep.id}${
              tutorialStep.id === 'verse-tools'
                ? tutorialVerseToolsStudyOpen
                  ? ' tutorial-spotlight--verse-tools-popup'
                  : ' tutorial-spotlight--verse-tools-line'
                : ''
            }`}
            style={tutorialSpotlightStyle}
            aria-hidden="true"
          />
          <section className={`tutorial-card tutorial-card--${tutorialStep.id}`}>
            <div className="tutorial-card-top">
              <div>
                <h2 id="tutorial-title" className="tutorial-title">{tutorialStep.title}</h2>
              </div>
              <button
                type="button"
                className="tutorial-close"
                aria-label="Close tutorial"
                onClick={closeTutorial}
              >
                ✕
              </button>
            </div>
            <p className="tutorial-description">
              {tutorialStep.id === 'verse-tools' && tutorialVerseToolsStudyOpen
                ? "The study card is highlighted. Try Highlight (hover for colors), Share, Notes, and Save. Ask AI won't leave this step during the tour—hover it to read what it does."
                : tutorialStep.instruction}
            </p>
            {tutorialStep.id === 'verse-tools' && !tutorialVerseToolsStudyOpen && (
              <div className="tutorial-verse-tools-preview" aria-label="Verse tools preview">
                <p className="tutorial-verse-tools-preview-hint">
                  Preview — buttons are inactive; tap the outlined verse to use the real card.
                </p>
                <div className="tutorial-verse-tools-preview-row" role="group">
                  <button
                    type="button"
                    className="tutorial-verse-tools-preview-btn"
                    title="Highlights the verse with your chosen color. Change the default color in Settings."
                    onClick={e => {
                      e.preventDefault();
                      e.stopPropagation();
                    }}
                  >
                    Highlight
                  </button>
                  <button
                    type="button"
                    className="tutorial-verse-tools-preview-btn"
                    title="Copies the verse text or uses your device share sheet."
                    onClick={e => {
                      e.preventDefault();
                      e.stopPropagation();
                    }}
                  >
                    Share
                  </button>
                  <button
                    type="button"
                    className="tutorial-verse-tools-preview-btn"
                    title="Opens the note field for this verse. Save stores your note."
                    onClick={e => {
                      e.preventDefault();
                      e.stopPropagation();
                    }}
                  >
                    Notes
                  </button>
                  <button
                    type="button"
                    className="tutorial-verse-tools-preview-btn"
                    title="Sends the selected verse to the AI assistant with a helpful prompt."
                    onClick={e => {
                      e.preventDefault();
                      e.stopPropagation();
                    }}
                  >
                    Ask AI
                  </button>
                </div>
              </div>
            )}
            <div className="tutorial-actions">
              <button
                type="button"
                className="tutorial-action-btn tutorial-action-btn-secondary"
                onClick={() => setTutorialStepIndex(index => Math.max(index - 1, 0))}
                disabled={tutorialStepIndex === 0}
              >
                Back
              </button>
              <button
                type="button"
                className="tutorial-action-btn tutorial-action-btn-ghost"
                onClick={() => runTutorialStepAction(tutorialStep.id)}
              >
                Show again
              </button>
              {tutorialStepIndex === tutorialSteps.length - 1 ? (
                <button
                  type="button"
                  className="tutorial-action-btn"
                  onClick={() => {
                    closeTutorial();
                    goToHome();
                  }}
                >
                  Finish tutorial
                </button>
              ) : (
                <button
                  type="button"
                  className="tutorial-action-btn"
                  onClick={() => setTutorialStepIndex(index => Math.min(index + 1, tutorialSteps.length - 1))}
                >
                  Next
                </button>
              )}
            </div>
          </section>
        </div>
      )}

      {/* Quiz modal */}
      {quizOpen && authSession && currentBook && (
        <ChapterQuiz
          bookNumber={currentBook.book_number}
          chapter={chapter}
          session={authSession}
          onClose={() => setQuizOpen(false)}
          onSubmitted={() => {
            setQuizTakenThisChapterVisit(true);
            refreshCoinBalance();
          }}
        />
      )}

      <div
        className={`sp-toast${homeRewardToast.visible ? ' sp-toast--visible' : ''}`}
        aria-live="polite"
      >
        {homeRewardToast.msg}
      </div>
    </>
  );
}
