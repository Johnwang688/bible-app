'use client';

import type { CSSProperties } from 'react';
import { useCallback, useEffect, useMemo, useRef, useState } from 'react';
import AiSidebar, { PERSONALITIES, restorePersonalityId, type AIActionParams } from './AiSidebar';

// ── Types ──────────────────────────────────────────────────────────────────────
interface BookInfo {
  book_number: number;
  name: string;
  testament: 'OT' | 'NT';
  total_chapters: number;
}
interface Translation { id: string; name: string; }
interface VerseData   { verse: number; text: string; }
interface ChapterData { book: string; chapter: number; translation: string; verses: VerseData[]; }
interface CommentaryEntry { verse_start: number; verse_end: number | null; content: string; }
interface CommentarySource { id: string; name: string; }
interface ThemeDef { id: string; name: string; swatches: string[]; }
type SidePanelMode = 'none' | 'commentary' | 'ai';

// ── Constants ──────────────────────────────────────────────────────────────────
const THEMES: ThemeDef[] = [
  { id: 'default',   name: 'Default',         swatches: ['#faf7f0', '#efdfcb', '#6d4c31', '#221d16'] },
  { id: 'dark',      name: 'Dark',            swatches: ['#16130f', '#342618', '#c9956a', '#ede8df'] },
  { id: 'dynamic',   name: 'Dynamic',         swatches: ['#FBDED8', '#FBF8D8', '#E1F8D8', '#E1F8F2', '#E1DEF2', '#FBDEF2'] },
  { id: 'pink',      name: 'Pastel Pink',     swatches: ['#ffe4eb', '#ffd4e0', '#c01848', '#14060c'] },
  { id: 'blue',      name: 'Pastel Blue',     swatches: ['#d9e7f5', '#cddff2', '#185088', '#040a14'] },
  { id: 'green',     name: 'Pastel Green',    swatches: ['#e1f9e1', '#cbf5cb', '#0c5c0c', '#030c04'] },
  { id: 'yellow',    name: 'Pastel Yellow',   swatches: ['#faf8e4', '#fff2c4', '#886000', '#181400'] },
  { id: 'purple',    name: 'Pastel Purple',   swatches: ['#e8e1f1', '#dacfe9', '#5c2888', '#0c0418'] },
  { id: 'orange',    name: 'Pastel Orange',   swatches: ['#fcefe3', '#ffe1cc', '#a84018', '#140802'] },
  { id: 'gold',      name: 'Gold & Silver',   swatches: ['#c9a84c', '#b89030', '#5c3e08', '#5a6068'] },
  { id: 'midnight',  name: 'Midnight Blue',   swatches: ['#003366', '#002b55', '#4d9fe0', '#f5f5f5'] },
  { id: 'rebecca',   name: 'Indigo',          swatches: ['#3c3c8c', '#2e2e72', '#9fa8ff', '#f5f5f5'] },
  { id: 'galaxy',    name: 'Galaxy Metallic', swatches: ['#301058', '#9a90b0', '#e8c478', '#f4f0ff'] },
  { id: 'parchment', name: 'Parchment Gold',  swatches: ['#f5e7a1', '#edd878', '#5a4200', '#3a3a3a'] },
  { id: 'teal',      name: 'Deep Teal',       swatches: ['#0f4c5c', '#0a3848', '#5ee8f0', '#d9f3f4'] },
  { id: 'forest',    name: 'Forest Rose',     swatches: ['#283618', '#1e2a12', '#FFB5A7', '#ffd6cc'] },
  { id: 'magenta',   name: 'Magenta Aqua',    swatches: ['#4A1942', '#5c2254', '#48cae4', '#90E0EF'] },
  { id: 'emerald',   name: 'Emerald Gold',    swatches: ['#0B3D2E', '#144d3a', '#f0c040', '#F4D35E'] },
  { id: 'canyon',    name: 'Canyon Mint',     swatches: ['#4C1D06', '#5e2608', '#8ee8cc', '#B8F2E6'] },
  { id: 'neonrose',  name: 'Pink',            swatches: ['#000000', '#F77FBE', '#FF71CD', '#FF71CD'] },
];

function getThemeCardStyle(theme: ThemeDef): CSSProperties {
  const [bg, border, accent, text] = theme.id === 'dynamic'
    ? [DYNAMIC_PREVIEW_BG, DYNAMIC_PREVIEW_BORDER, DYNAMIC_PREVIEW_ACCENT, '#221d16']
    : theme.swatches;
  return {
    '--theme-card-bg': bg,
    '--theme-card-border': border,
    '--theme-card-hover': accent,
    '--theme-card-accent': accent,
    '--theme-card-text': text,
  } as CSSProperties;
}

const DYNAMIC_BASE_THEME    = 'default';
const DYNAMIC_COLORS        = ['#FF0000', '#FFFF00', '#00FF00', '#00FFFF', '#0000FF', '#FF00FF'];
const DYNAMIC_FADE_MS       = 3000;
const DYNAMIC_CYCLE_MS      = DYNAMIC_FADE_MS * 2;
const DYNAMIC_PREVIEW_BG    = '#f7f7f7';
const DYNAMIC_PREVIEW_BORDER = '#ddd2c3';
const DYNAMIC_PREVIEW_ACCENT = '#d8cce8';

// ── Helpers ────────────────────────────────────────────────────────────────────
function hexToRgb(hex: string) {
  const n = parseInt(hex.replace('#', ''), 16);
  return { r: (n >> 16) & 255, g: (n >> 8) & 255, b: n & 255 };
}

function parseSummaryContent(content: string) {
  const result = {
    title: '', summary: '',
    themes: [] as string[], people: [] as string[],
    points: [] as string[], verses: [] as string[],
  };
  const titleMatch = content.match(/^TITLE::(.+)/m);
  if (titleMatch) result.title = titleMatch[1].trim();
  let rest = content.replace(/^TITLE::.+\n?/, '').trim();
  const themesMatch = rest.match(/^Themes:\s*(.+)$/m);
  if (themesMatch) result.themes = themesMatch[1].split(' · ').map(s => s.trim()).filter(Boolean);
  const peopleMatch = rest.match(/^Key People:\s*(.+)$/m);
  if (peopleMatch) result.people = peopleMatch[1].split(' · ').map(s => s.trim()).filter(Boolean);
  const versesMatch = rest.match(/^Supporting Verses:\s*(.+)$/m);
  if (versesMatch) result.verses = versesMatch[1].split(' · ').map(s => s.trim()).filter(Boolean);
  const pointsMatch = rest.match(/^Key Points:\n([\s\S]+?)(?=\n\n[A-Z]|$)/m);
  if (pointsMatch) {
    result.points = pointsMatch[1].split('\n').map(l => l.replace(/^• /, '').trim()).filter(Boolean);
  }
  const sectionStart = rest.search(/^(Themes:|Key People:|Key Points:|Supporting Verses:)/m);
  result.summary = (sectionStart > 0 ? rest.slice(0, sectionStart) : rest).trim();
  return result;
}

// ── Main Component ─────────────────────────────────────────────────────────────
export default function BibleApp() {
  // ── Bible data ───
  const [books, setBooks]             = useState<BookInfo[]>([]);
  const [translations, setTranslations] = useState<Translation[]>([]);
  const [currentBook, setCurrentBook] = useState<BookInfo | null>(null);
  const [chapter, setChapter]         = useState(1);
  const [translation, setTranslation] = useState('WEB');

  // ── Chapter display ───
  const [chapterData, setChapterData]   = useState<ChapterData | null>(null);
  const [chapterLoading, setChapterLoading] = useState(true);
  const [chapterError, setChapterError] = useState(false);
  const [animClass, setAnimClass]       = useState('');

  // ── Commentary ───
  const [commentaryEntries, setCommentaryEntries] = useState<CommentaryEntry[]>([]);
  const [commentaryLoading, setCommentaryLoading] = useState(false);
  const [commentaryError, setCommentaryError]     = useState(false);
  const [commentarySource, setCommentarySource]   = useState('matthew_henry');
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
  const [chromeVisible, setChromeVisible]   = useState(true);

  // ── Theme ───
  const [currentTheme, setCurrentTheme] = useState('default');

  // ── DOM Refs ───
  const biblePaneRef  = useRef<HTMLDivElement>(null);
  const sideScrollRef = useRef<HTMLDivElement>(null);
  const sidePaneRef   = useRef<HTMLElement>(null);
  const dividerRef    = useRef<HTMLDivElement>(null);
  const dynTintRef    = useRef<HTMLDivElement>(null);
  const versionBtnRef = useRef<HTMLButtonElement>(null);
  const commentarySourceMenuRef = useRef<HTMLDivElement>(null);
  const agentMenuRef = useRef<HTMLDivElement>(null);
  const cometCanvasRef = useRef<HTMLCanvasElement>(null);

  // ── Stable refs for use in callbacks without stale closures ───
  const booksRef               = useRef<BookInfo[]>([]);
  const currentBookRef         = useRef<BookInfo | null>(null);
  const chapterRef             = useRef(1);
  const translationRef         = useRef('WEB');
  const sidePanelModeRef       = useRef<SidePanelMode>('none');
  const commentarySourceRef    = useRef('matthew_henry');
  const commentarySourceNamesRef = useRef<Record<string, string>>({
    matthew_henry: 'Matthew Henry Commentary',
    summary: 'Chapter Summaries',
  });
  const currentThemeRef = useRef('default');

  // ── Imperative refs ───
  const commentaryCache     = useRef<Record<string, CommentaryEntry[]>>({});
  const lastScrollYRef      = useRef(0);
  const commSyncRafRef      = useRef<number | null>(null);
  const isDraggingRef       = useRef(false);
  const dragStartXRef       = useRef(0);
  const dragStartWidthRef   = useRef(0);
  const dynTimerRef         = useRef<ReturnType<typeof setTimeout> | null>(null);
  const dynRafRef           = useRef<number | null>(null);
  const cometRafRef         = useRef<number | null>(null);
  const dynIndexRef         = useRef(0);
  const touchStartXRef      = useRef<number | null>(null);
  const touchStartYRef      = useRef(0);
  const pendingAiNavRef = useRef<{ start: number; end: number } | null>(null);

  // Keep stable refs in sync
  useEffect(() => { booksRef.current = books; },                             [books]);
  useEffect(() => { currentBookRef.current = currentBook; },                 [currentBook]);
  useEffect(() => { chapterRef.current = chapter; },                         [chapter]);
  useEffect(() => { translationRef.current = translation; },                 [translation]);
  useEffect(() => { sidePanelModeRef.current = sidePanelMode; },             [sidePanelMode]);
  useEffect(() => { commentarySourceRef.current = commentarySource; },       [commentarySource]);
  useEffect(() => { commentarySourceNamesRef.current = commentarySourceNames; }, [commentarySourceNames]);
  useEffect(() => { currentThemeRef.current = currentTheme; },               [currentTheme]);

  useEffect(() => {
    setPersonalityId(restorePersonalityId());
  }, []);

  useEffect(() => {
    const handlePointerDown = (event: MouseEvent) => {
      if (!commentarySourceMenuRef.current?.contains(event.target as Node)) {
        setCommentarySourceMenuOpen(false);
      }
      if (!agentMenuRef.current?.contains(event.target as Node)) {
        setAgentMenuOpen(false);
      }
    };
    const handleKeyDown = (event: KeyboardEvent) => {
      if (event.key === 'Escape') {
        setCommentarySourceMenuOpen(false);
        setAgentMenuOpen(false);
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
    setChapterLoading(true);
    setChapterError(false);
    setChapterData(null);
    try {
      const data: ChapterData = await fetch(
        `/api/v1/chapters/${encodeURIComponent(book.name)}/${ch}?translation=${encodeURIComponent(trans)}`
      ).then(r => { if (!r.ok) throw new Error(); return r.json(); });
      setChapterData(data);
      setAnimClass(direction === 'next' ? 'slide-in-right' : direction === 'prev' ? 'slide-in-left' : '');
      setChapterLoading(false);
      if (biblePaneRef.current) biblePaneRef.current.scrollTop = 0;
      setChromeVisible(true);
      if (sidePanelModeRef.current === 'commentary') {
        loadCommentaryData(book, ch, commentarySourceRef.current);
      }
    } catch {
      pendingAiNavRef.current = null;
      setChapterError(true);
      setChapterLoading(false);
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

  const pickChapter = useCallback((bookNumber: number, ch: number) => {
    const book = booksRef.current.find(b => b.book_number === bookNumber);
    if (!book) return;
    setCurrentBook(book);
    setChapter(ch);
    setExpandedBook(null);
    setBookPopupOpen(false);
    loadChapter(book, ch, translationRef.current);
  }, [loadChapter]);

  const pickTranslation = useCallback((id: string) => {
    setTranslation(id);
    setVersionPopupOpen(false);
    const book = currentBookRef.current;
    if (book) loadChapter(book, chapterRef.current, id);
  }, [loadChapter]);

  // ── Side panel ────────────────────────────────────────────────────────────────
  const openSidePanel = useCallback((mode: 'commentary' | 'ai') => {
    setSidePanelMode(mode);
    if (mode === 'commentary') {
      const book = currentBookRef.current;
      if (book) loadCommentaryData(book, chapterRef.current, commentarySourceRef.current);
    }
  }, [loadCommentaryData]);

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

  const bibleBookNamesForAi = useMemo(
    () => [...new Set(books.map(b => b.name))],
    [books],
  );

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

  // ── Commentary sync ───────────────────────────────────────────────────────────
  const getTopVisibleVerse = useCallback((): number => {
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

  const scrollVerseIntoView = useCallback((verseNumber: number) => {
    const pane = biblePaneRef.current;
    if (!pane) return;
    const target = pane.querySelector<HTMLElement>(`.verse-line[data-verse="${verseNumber}"]`);
    if (!target) return;
    const paneRect = pane.getBoundingClientRect();
    const targetRect = target.getBoundingClientRect();
    const top = pane.scrollTop + (targetRect.top - paneRect.top) - 28;
    pane.scrollTo({ top: Math.max(0, top), behavior: 'smooth' });
  }, []);

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
    if (commSyncRafRef.current) cancelAnimationFrame(commSyncRafRef.current);
    commSyncRafRef.current = requestAnimationFrame(() => {
      commSyncRafRef.current = null;
      syncCommentaryToVerse(getTopVisibleVerse(), entries);
    });
  }, [syncCommentaryToVerse, getTopVisibleVerse]);

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

  // ── Scroll handler ────────────────────────────────────────────────────────────
  useEffect(() => {
    const pane = biblePaneRef.current;
    if (!pane) return;
    const onScroll = () => {
      const y = pane.scrollTop;
      const delta = y - lastScrollYRef.current;
      if (delta > 6 && y > 80)   setChromeVisible(false);
      else if (delta < -6)        setChromeVisible(true);
      if (y < 10)                 setChromeVisible(true);
      lastScrollYRef.current = y;
      requestCommentarySync(commentaryEntriesRef.current);
    };
    pane.addEventListener('scroll', onScroll, { passive: true });
    return () => pane.removeEventListener('scroll', onScroll);
  }, [requestCommentarySync]);

  // ── Touch swipe ───────────────────────────────────────────────────────────────
  useEffect(() => {
    const pane = biblePaneRef.current;
    if (!pane) return;
    const onStart = (e: TouchEvent) => {
      touchStartXRef.current = e.touches[0].clientX;
      touchStartYRef.current = e.touches[0].clientY;
    };
    const onEnd = (e: TouchEvent) => {
      if (touchStartXRef.current === null) return;
      const dx = e.changedTouches[0].clientX - touchStartXRef.current;
      const dy = e.changedTouches[0].clientY - touchStartYRef.current;
      if (Math.abs(dx) > 60 && Math.abs(dx) > Math.abs(dy) * 1.5) {
        dx < 0 ? goNext() : goPrev();
      }
      touchStartXRef.current = null;
    };
    pane.addEventListener('touchstart', onStart, { passive: true });
    pane.addEventListener('touchend', onEnd, { passive: true });
    return () => {
      pane.removeEventListener('touchstart', onStart);
      pane.removeEventListener('touchend', onEnd);
    };
  }, [goNext, goPrev]);

  // ── Keyboard ──────────────────────────────────────────────────────────────────
  useEffect(() => {
    const onKey = (e: KeyboardEvent) => {
      if (e.key === 'Escape') {
        setBookPopupOpen(false);
        setVersionPopupOpen(false);
        setSettingsOpen(false);
      }
      if (e.key === 'ArrowRight') goNext();
      if (e.key === 'ArrowLeft')  goPrev();
    };
    document.addEventListener('keydown', onKey);
    return () => document.removeEventListener('keydown', onKey);
  }, [goNext, goPrev]);

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
      const next     = Math.max(minWidth, Math.min(maxWidth, dragStartWidthRef.current + delta));
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

  // ── Galaxy comet animation ────────────────────────────────────────────────────
  useEffect(() => {
    const canvas = cometCanvasRef.current;
    if (!canvas) return;

    if (currentTheme !== 'galaxy') {
      if (cometRafRef.current !== null) {
        cancelAnimationFrame(cometRafRef.current);
        cometRafRef.current = null;
      }
      const ctx = canvas.getContext('2d');
      if (ctx) ctx.clearRect(0, 0, canvas.width, canvas.height);
      return;
    }

    function resize() {
      if (!canvas) return;
      canvas.width = window.innerWidth;
      canvas.height = window.innerHeight;
    }
    resize();
    window.addEventListener('resize', resize);

    const TOPBAR_H  = 56;
    const TASKBAR_H = 64;
    const GUTTER_W  = 52;

    interface CometParticle {
      x: number; y: number;
      vx: number; vy: number;
      tail: Array<[number, number]>;
      maxTail: number;
      alpha: number;
      size: number;
      dead: boolean;
      respawnIn: number;
    }

    function getZones(w: number, h: number) {
      return [
        { x: 0,          y: 0,                    w,          h: TOPBAR_H,                          horizontal: true  },
        { x: 0,          y: h - TASKBAR_H,         w,          h: TASKBAR_H,                         horizontal: true  },
        { x: 0,          y: TOPBAR_H,              w: GUTTER_W, h: h - TOPBAR_H - TASKBAR_H,         horizontal: false },
        { x: w - GUTTER_W, y: TOPBAR_H,            w: GUTTER_W, h: h - TOPBAR_H - TASKBAR_H,        horizontal: false },
      ];
    }

    function spawnComet(w: number, h: number): CometParticle {
      const zones   = getZones(w, h);
      const weights = [3, 3, 1, 1];
      let r = Math.random() * 8;
      let zoneIdx = 0;
      for (let i = 0; i < weights.length; i++) {
        r -= weights[i];
        if (r <= 0) { zoneIdx = i; break; }
      }
      const zone  = zones[zoneIdx];
      const speed = 1.2 + Math.random() * 2.2;
      let x: number, y: number, vx: number, vy: number;

      if (zone.horizontal) {
        const fromLeft = Math.random() < 0.5;
        x  = fromLeft ? zone.x - 5 : zone.x + zone.w + 5;
        y  = zone.y + zone.h * 0.15 + Math.random() * zone.h * 0.7;
        vx = fromLeft ? speed : -speed;
        vy = (Math.random() - 0.5) * speed * 0.3;
      } else {
        const fromTop = Math.random() < 0.5;
        x  = zone.x + zone.w * 0.1 + Math.random() * zone.w * 0.8;
        y  = fromTop ? zone.y - 5 : zone.y + zone.h + 5;
        vx = (Math.random() - 0.5) * speed * 0.3;
        vy = fromTop ? speed : -speed;
      }

      return { x, y, vx, vy, tail: [], maxTail: Math.floor(20 + Math.random() * 25),
               alpha: 0.65 + Math.random() * 0.35, size: 1.2 + Math.random() * 1.4,
               dead: false, respawnIn: 0 };
    }

    // ── Nebula orbs — large soft blobs that drift slowly through allowed zones ──
    interface NebulaOrb {
      x: number; y: number;
      vx: number; vy: number;
      radius: number;
      r: number; g: number; b: number;
      baseAlpha: number;
      phase: number;       // breathing phase offset
      phaseSpeed: number;  // breathing speed
    }

    const NEBULA_COLORS: [number, number, number][] = [
      [155, 60, 255],  // violet
      [255, 195, 55],  // gold
      [60,  95, 240],  // indigo
      [255, 80, 185],  // magenta
      [55, 230, 215],  // teal
      [255, 140, 40],  // amber
    ];

    function spawnOrb(w: number, h: number): NebulaOrb {
      const zones = getZones(w, h);
      const zone  = zones[Math.floor(Math.random() * zones.length)];
      const [r, g, b] = NEBULA_COLORS[Math.floor(Math.random() * NEBULA_COLORS.length)];
      const speed = 0.06 + Math.random() * 0.16;
      const angle = Math.random() * Math.PI * 2;
      return {
        x: zone.x + Math.random() * zone.w,
        y: zone.y + Math.random() * zone.h,
        vx: Math.cos(angle) * speed,
        vy: Math.sin(angle) * speed,
        radius: 70 + Math.random() * 110,
        r, g, b,
        baseAlpha: 0.055 + Math.random() * 0.065,
        phase: Math.random() * Math.PI * 2,
        phaseSpeed: 0.008 + Math.random() * 0.012,
      };
    }

    const ORB_COUNT = 6;
    const orbs: NebulaOrb[] = Array.from({ length: ORB_COUNT }, () => spawnOrb(canvas.width, canvas.height));
    let frame = 0;

    const COMET_COUNT = 12;
    const comets: CometParticle[] = Array.from({ length: COMET_COUNT }, () => {
      const c = spawnComet(canvas.width, canvas.height);
      // stagger initial positions so they don't all start at zone edges
      const advance = Math.floor(Math.random() * 80);
      for (let f = 0; f < advance; f++) {
        c.tail.push([c.x, c.y]);
        if (c.tail.length > c.maxTail) c.tail.shift();
        c.x += c.vx; c.y += c.vy;
      }
      return c;
    });

    function draw() {
      const ctx = canvas?.getContext('2d');
      if (!ctx || !canvas) return;
      const w = canvas.width;
      const h = canvas.height;

      ctx.clearRect(0, 0, w, h);
      const zones = getZones(w, h);
      frame++;

      ctx.save();
      ctx.beginPath();
      for (const z of zones) ctx.rect(z.x, z.y, z.w, z.h);
      ctx.clip();

      // ── Nebula orbs (drawn first, behind comets) ─────────────────────────────
      for (let i = 0; i < orbs.length; i++) {
        const o = orbs[i];
        o.phase += o.phaseSpeed;
        const breathe = 0.65 + 0.35 * Math.sin(o.phase);
        const a = o.baseAlpha * breathe;

        const grd = ctx.createRadialGradient(o.x, o.y, 0, o.x, o.y, o.radius);
        grd.addColorStop(0,    `rgba(${o.r}, ${o.g}, ${o.b}, ${(a * 1.6).toFixed(3)})`);
        grd.addColorStop(0.45, `rgba(${o.r}, ${o.g}, ${o.b}, ${(a * 0.8).toFixed(3)})`);
        grd.addColorStop(1,    `rgba(${o.r}, ${o.g}, ${o.b}, 0)`);
        ctx.beginPath();
        ctx.arc(o.x, o.y, o.radius, 0, Math.PI * 2);
        ctx.fillStyle = grd;
        ctx.fill();

        o.x += o.vx;
        o.y += o.vy;

        // Gently nudge velocity to keep orbs in their zone
        const inAnyZone = zones.some(z =>
          o.x >= z.x && o.x <= z.x + z.w && o.y >= z.y && o.y <= z.y + z.h,
        );
        if (!inAnyZone) {
          // Drift back toward nearest zone center
          const nearest = zones.reduce((best, z) => {
            const cx = z.x + z.w / 2, cy = z.y + z.h / 2;
            const d2 = (o.x - cx) ** 2 + (o.y - cy) ** 2;
            return d2 < best.d2 ? { d2, cx, cy } : best;
          }, { d2: Infinity, cx: 0, cy: 0 });
          o.vx += (nearest.cx - o.x) * 0.0002;
          o.vy += (nearest.cy - o.y) * 0.0002;
        }
      }

      for (let i = 0; i < comets.length; i++) {
        const c = comets[i];

        if (c.dead) {
          c.respawnIn--;
          if (c.respawnIn <= 0) comets[i] = spawnComet(w, h);
          continue;
        }

        c.tail.push([c.x, c.y]);
        if (c.tail.length > c.maxTail) c.tail.shift();

        // tail: fading, tapering line segments from base → head
        for (let j = 1; j < c.tail.length; j++) {
          const t  = j / c.tail.length; // 0 = oldest, 1 = near-head
          const [px, py] = c.tail[j - 1];
          const [cx, cy] = c.tail[j];
          ctx.beginPath();
          ctx.moveTo(px, py);
          ctx.lineTo(cx, cy);
          ctx.strokeStyle = `rgba(255, 210, 60, ${c.alpha * t * 0.85})`;
          ctx.lineWidth   = Math.max(0.3, c.size * t * 1.4);
          ctx.lineCap     = 'round';
          ctx.stroke();
        }

        // outer glow
        const grd = ctx.createRadialGradient(c.x, c.y, 0, c.x, c.y, c.size * 5);
        grd.addColorStop(0,    `rgba(255, 248, 180, ${c.alpha})`);
        grd.addColorStop(0.35, `rgba(255, 210, 60,  ${c.alpha * 0.6})`);
        grd.addColorStop(0.7,  `rgba(200, 150, 0,   ${c.alpha * 0.2})`);
        grd.addColorStop(1,    'rgba(180, 120, 0, 0)');
        ctx.beginPath();
        ctx.arc(c.x, c.y, c.size * 5, 0, Math.PI * 2);
        ctx.fillStyle = grd;
        ctx.fill();

        // bright core
        ctx.beginPath();
        ctx.arc(c.x, c.y, c.size, 0, Math.PI * 2);
        ctx.fillStyle = `rgba(255, 255, 230, ${c.alpha})`;
        ctx.fill();

        c.x += c.vx;
        c.y += c.vy;

        const BUFFER = 80;
        const alive  = zones.some(z =>
          c.x >= z.x - BUFFER && c.x <= z.x + z.w + BUFFER &&
          c.y >= z.y - BUFFER && c.y <= z.y + z.h + BUFFER,
        );
        if (!alive) { c.dead = true; c.respawnIn = Math.floor(20 + Math.random() * 60); }
      }

      ctx.restore();
      cometRafRef.current = requestAnimationFrame(draw);
    }

    cometRafRef.current = requestAnimationFrame(draw);

    return () => {
      if (cometRafRef.current !== null) {
        cancelAnimationFrame(cometRafRef.current);
        cometRafRef.current = null;
      }
      window.removeEventListener('resize', resize);
      const ctx = canvas.getContext('2d');
      if (ctx) ctx.clearRect(0, 0, canvas.width, canvas.height);
    };
  }, [currentTheme]);

  // ── Theme management ──────────────────────────────────────────────────────────
  const stopDynamicTheme = useCallback(() => {
    if (dynTimerRef.current) { clearTimeout(dynTimerRef.current); dynTimerRef.current = null; }
    if (dynRafRef.current)   { cancelAnimationFrame(dynRafRef.current); dynRafRef.current = null; }
    if (dynTintRef.current)  dynTintRef.current.style.backgroundColor = 'transparent';
    document.documentElement.removeAttribute('data-dynamic-wave');
  }, []);

  const runDynamicRgbStrip = useCallback(() => {
    if (currentThemeRef.current !== 'dynamic') return;
    const nextHex = DYNAMIC_COLORS[dynIndexRef.current % DYNAMIC_COLORS.length];
    dynIndexRef.current++;
    const { r, g, b } = hexToRgb(nextHex);
    const t0 = performance.now();
    const frame = (now: number) => {
      if (currentThemeRef.current !== 'dynamic') return;
      const u = Math.min((now - t0) / DYNAMIC_CYCLE_MS, 1);
      const a = u <= 0.5 ? u * 2 : (1 - u) * 2;
      if (dynTintRef.current) dynTintRef.current.style.backgroundColor = `rgba(${r},${g},${b},${a})`;
      if (u < 1) {
        dynRafRef.current = requestAnimationFrame(frame);
      } else {
        dynRafRef.current = null;
        if (dynTintRef.current) dynTintRef.current.style.backgroundColor = 'transparent';
        dynTimerRef.current = setTimeout(runDynamicRgbStrip, 0);
      }
    };
    dynRafRef.current = requestAnimationFrame(frame);
  }, []);

  const startDynamicTheme = useCallback(() => {
    dynIndexRef.current = 0;
    document.documentElement.setAttribute('data-theme', DYNAMIC_BASE_THEME);
    dynTimerRef.current = setTimeout(runDynamicRgbStrip, 0);
  }, [runDynamicRgbStrip]);

  const applyTheme = useCallback((id: string) => {
    if (id !== 'dynamic') stopDynamicTheme();
    setCurrentTheme(id);
    localStorage.setItem('theme', id);
    if (id === 'dynamic') {
      document.documentElement.setAttribute('data-dynamic-wave', '1');
      startDynamicTheme();
    } else {
      document.documentElement.removeAttribute('data-dynamic-wave');
      document.documentElement.setAttribute('data-theme', id);
    }
  }, [stopDynamicTheme, startDynamicTheme]);

  // ── Init ──────────────────────────────────────────────────────────────────────
  useEffect(() => {
    // Read theme from localStorage (inline script already applied it to the DOM)
    const saved = localStorage.getItem('theme') || 'default';
    setCurrentTheme(saved);
    if (saved === 'dynamic') startDynamicTheme();

    async function init() {
      try {
        const [booksData, translationsData, sourcesData] = await Promise.all([
          fetch('/api/v1/books').then(r => r.json()) as Promise<BookInfo[]>,
          fetch('/api/v1/translations').then(r => r.json()).catch(() => [{ id: 'WEB', name: 'World English Bible' }]) as Promise<Translation[]>,
          fetch('/api/v1/commentary/sources').then(r => r.json()).catch(() => []) as Promise<CommentarySource[]>,
        ]);
        setBooks(booksData);
        setTranslations(translationsData);
        if (sourcesData.length) {
          setCommentarySources(sourcesData);
          setCommentarySourceNames(prev => {
            const next = { ...prev };
            sourcesData.forEach(s => { next[s.id] = s.name; });
            return next;
          });
        }
        const firstBook = booksData.find(b => b.book_number === 1) ?? booksData[0] ?? null;
        setCurrentBook(firstBook);
        if (firstBook) {
          loadChapter(firstBook, 1, 'WEB');
        } else {
          setChapterLoading(false);
          setChapterError(true);
        }
      } catch {
        setChapterLoading(false);
        setChapterError(true);
      }
    }
    init();
    return () => stopDynamicTheme();
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  // ── Version popup positioning ─────────────────────────────────────────────────
  const openVersionPopup = useCallback(() => {
    const rect = versionBtnRef.current?.getBoundingClientRect();
    setVersionPanelLeft(Math.max(12, rect?.left ?? 20));
    setVersionPopupOpen(true);
  }, []);

  // ── Render helpers ────────────────────────────────────────────────────────────
  const renderChapterContent = () => {
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
    return (
      <div
        className={animClass}
        onAnimationEnd={() => setAnimClass('')}
      >
        <div className="reader-book">{chapterData.book}</div>
        <div className="reader-chapter">{chapterData.chapter}</div>
        <div className="reader-passages">
          {chapterData.verses.map(v => {
            const inAiNav =
              aiNavHighlight != null && v.verse >= aiNavHighlight.start && v.verse <= aiNavHighlight.end;
            return (
              <span
                key={v.verse}
                className={`verse-line${inAiNav ? ' verse-line--ai-nav' : ''}`}
                data-verse={v.verse}
              >
                <sup className="vnum">{v.verse}</sup>{v.text}{' '}
              </span>
            );
          })}
        </div>
      </div>
    );
  };

  const renderCommentaryContent = () => {
    if (commentaryLoading) {
      return (
        <div className="state-msg">
          <span className="spinner" />
          <div>Loading commentary...</div>
        </div>
      );
    }
    if (commentaryError) return <div className="state-msg">Commentary unavailable.</div>;
    if (!commentaryEntries.length) return <div className="state-msg">No commentary for this chapter.</div>;

    if (commentarySource === 'summary') {
      return commentaryEntries.map((entry, i) => {
        const start = Number(entry.verse_start);
        const end   = entry.verse_end == null ? start : Number(entry.verse_end);
        const p     = parseSummaryContent(entry.content);
        const isSynced = syncedVerseStart === entry.verse_start;
        return (
          <section
            key={i}
            className={`commentary-entry${isSynced ? ' synced' : ''}`}
            data-verse-start={start}
            data-verse-end={end}
          >
            {p.title  && <div className="summary-chapter-title">{p.title}</div>}
            {p.summary && <div className="summary-text">{p.summary}</div>}
            {p.themes.length > 0 && (
              <div className="summary-section">
                <div className="summary-section-label">Themes</div>
                <div className="summary-tags">{p.themes.map((t, j) => <span key={j} className="summary-tag">{t}</span>)}</div>
              </div>
            )}
            {p.people.length > 0 && (
              <div className="summary-section">
                <div className="summary-section-label">Key People</div>
                <div className="summary-tags">{p.people.map((t, j) => <span key={j} className="summary-tag">{t}</span>)}</div>
              </div>
            )}
            {p.points.length > 0 && (
              <div className="summary-section">
                <div className="summary-section-label">Key Points</div>
                <ul className="summary-points">{p.points.map((pt, j) => <li key={j}>{pt}</li>)}</ul>
              </div>
            )}
            {p.verses.length > 0 && (
              <div className="summary-section">
                <div className="summary-section-label">Supporting Verses</div>
                <div className="summary-tags">{p.verses.map((v, j) => <span key={j} className="summary-tag">{v}</span>)}</div>
              </div>
            )}
          </section>
        );
      });
    }

    // Standard (Matthew Henry style) commentary
    return commentaryEntries.map((entry, i) => {
      const start   = Number(entry.verse_start);
      const end     = entry.verse_end == null ? start : Number(entry.verse_end);
      const label   = end > start ? `Verses ${start}–${end}` : `Verse ${start}`;
      const isSynced = syncedVerseStart === entry.verse_start;
      return (
        <section
          key={i}
          className={`commentary-entry${isSynced ? ' synced' : ''}`}
          data-verse-start={start}
          data-verse-end={end}
        >
          <div className="commentary-label">{label}</div>
          <div className="commentary-text">{entry.content}</div>
        </section>
      );
    });
  };

  const sidePanelTitle = () => {
    if (sidePanelMode === 'commentary')  return commentarySourceNames[commentarySource] ?? commentarySource;
    return 'Bible Companion';
  };
  const sidePanelEyebrow = () => {
    if (sidePanelMode === 'commentary') return 'Commentary';
    return 'Companion';
  };

  const sidePanelContext = currentBook ? `${currentBook.name} ${chapter} • ${translation}` : '';
  const navLabel = currentBook ? `${currentBook.name} ${chapter}` : 'Select Book';

  const sideOpen = sidePanelMode !== 'none';
  const availableCommentarySources = commentarySources.length > 0
    ? commentarySources
    : [
        { id: 'matthew_henry', name: 'Matthew Henry Commentary' },
        { id: 'summary', name: 'Chapter Summaries' },
      ];

  // ── JSX ───────────────────────────────────────────────────────────────────────
  return (
    <>
      {/* Wave background */}
      <div id="wave-bg" aria-hidden="true">
        <svg className="wave-svg wv-1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320" preserveAspectRatio="none">
          <path fill="var(--muted)" d="M0,100 C180,30 540,190 720,100 C900,30 1260,190 1440,100 L1440,320 L0,320 Z"/>
        </svg>
        <svg className="wave-svg wv-2" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320" preserveAspectRatio="none">
          <path fill="var(--muted)" d="M0,130 C200,55 520,210 720,130 C920,55 1240,210 1440,130 L1440,320 L0,320 Z"/>
        </svg>
        <svg className="wave-svg wv-3" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320" preserveAspectRatio="none">
          <path fill="var(--muted)" d="M0,90 C160,15 560,175 720,90 C880,5 1280,175 1440,90 L1440,320 L0,320 Z"/>
        </svg>
      </div>

      {/* Topbar */}
      <nav className={`topbar${chromeVisible ? '' : ' chrome-hide-top'}`}>
        <div className="nav-left">
          <button
            className={`nav-btn${bookPopupOpen ? ' active' : ''}`}
            type="button"
            onClick={e => { e.stopPropagation(); setVersionPopupOpen(false); setBookPopupOpen(v => !v); }}
          >
            <span className="nav-btn-label">{navLabel}</span>
            <span className="chevron" aria-hidden="true" />
          </button>
          <button
            ref={versionBtnRef}
            className={`nav-btn${versionPopupOpen ? ' active' : ''}`}
            type="button"
            onClick={e => { e.stopPropagation(); setBookPopupOpen(false); versionPopupOpen ? setVersionPopupOpen(false) : openVersionPopup(); }}
          >
            <span className="nav-btn-label">{translation}</span>
            <span className="chevron" aria-hidden="true" />
          </button>
        </div>
      </nav>

      {/* Book popup */}
      <div
        className={`popup-overlay${bookPopupOpen ? ' open' : ''}`}
        onClick={e => { if (e.target === e.currentTarget) setBookPopupOpen(false); }}
      >
        <div className="book-panel">
          {books.length === 0 ? (
            <div className="state-msg"><span className="spinner" /><div>Loading...</div></div>
          ) : (
            <>
              {(['OT', 'NT'] as const).map(testament => (
                <div key={testament}>
                  <div className="testament-label">{testament === 'OT' ? 'Old Testament' : 'New Testament'}</div>
                  {books.filter(b => b.testament === testament).map(book => (
                    <div key={book.book_number} className="book-row">
                      <button
                        className={`book-btn${expandedBook === book.book_number ? ' expanded' : ''}`}
                        type="button"
                        onClick={() => setExpandedBook(v => v === book.book_number ? null : book.book_number)}
                      >
                        <span>{book.name}</span>
                        <span className="expand-arrow" aria-hidden="true" />
                      </button>
                      <div className={`chapter-picker${expandedBook === book.book_number ? ' open' : ''}`}>
                        {Array.from({ length: book.total_chapters }, (_, i) => i + 1).map(ch => (
                          <button
                            key={ch}
                            className={`ch-btn${currentBook?.book_number === book.book_number && chapter === ch ? ' current' : ''}`}
                            type="button"
                            onClick={e => { e.stopPropagation(); pickChapter(book.book_number, ch); }}
                          >
                            {ch}
                          </button>
                        ))}
                      </div>
                    </div>
                  ))}
                </div>
              ))}
            </>
          )}
        </div>
      </div>

      {/* Version popup */}
      <div
        className={`popup-overlay${versionPopupOpen ? ' open' : ''}`}
        onClick={e => { if (e.target === e.currentTarget) setVersionPopupOpen(false); }}
      >
        <div className="version-panel" style={{ left: `${versionPanelLeft}px` }}>
          <div className="version-header">Translation</div>
          {translations.map(t => (
            <button
              key={t.id}
              className={`version-item${t.id === translation ? ' selected' : ''}`}
              type="button"
              onClick={() => pickTranslation(t.id)}
            >
              <span className="v-abbr">{t.id}</span>
              <span className="v-name">{t.name}</span>
              {t.id === translation && <span className="v-check">✓</span>}
            </button>
          ))}
        </div>
      </div>

      {/* Content shell */}
      <div className="content-shell">
        {/* Smoke overlay */}
        <div id="smoke-overlay" aria-hidden="true">
          {([ ['300px','300px','var(--muted)','5%','4%','35px','18px','30s','0s'],
              ['220px','220px','var(--accent)','42%','2%','-25px','22px','22s','-8s'],
              ['260px','260px','var(--muted)','72%','6%','20px','14px','27s','-4s'],
              ['280px','280px','var(--accent)','18%','28%','-40px','-16px','34s','-12s'],
              ['200px','200px','var(--muted)','55%','25%','30px','-20px','25s','-2s'],
              ['320px','320px','var(--accent)','80%','32%','-28px','10px','38s','-18s'],
              ['260px','260px','var(--muted)','8%','54%','45px','-12px','28s','-6s'],
              ['190px','190px','var(--accent)','38%','58%','-22px','18px','21s','-14s'],
              ['290px','290px','var(--muted)','65%','50%','25px','-8px','33s','-9s'],
              ['240px','240px','var(--accent)','22%','76%','-38px','-22px','26s','-3s'],
              ['310px','310px','var(--muted)','58%','80%','32px','-18px','36s','-16s'],
              ['180px','180px','var(--accent)','85%','72%','-18px','24px','23s','-22s'],
          ] as [string,string,string,string,string,string,string,string,string][]).map(([w,h,bg,l,t,dx,dy,dur,del], i) => (
            <div key={i} className="smoke-wisp" style={{
              width: w, height: h, background: bg, left: l, top: t,
              ['--dx' as string]: dx, ['--dy' as string]: dy,
              animationDuration: dur, animationDelay: del,
            } as React.CSSProperties} />
          ))}
        </div>

        {/* Dynamic theme wave */}
        <div id="dynamic-wave" aria-hidden="true">
          <div className="dynamic-wave-tint" ref={dynTintRef} />
        </div>

        {/* Galaxy sparkles */}
        <div className="galaxy-sparkles" aria-hidden="true" />

        {/* Main content area */}
        <div className="content-area">
          {/* Side pane */}
          <aside
            ref={sidePaneRef}
            className={`side-pane${sideOpen ? ' open' : ''}${isPaneTransitioning ? ' transitioning' : ''}`}
            style={{ '--side-width': sidePaneWidth } as React.CSSProperties}
          >
            <div className="side-header">
              {sidePanelMode === 'ai' ? (
                <>
                  <span className="side-eyebrow">Assistant</span>
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
                        {PERSONALITIES.find(p => p.id === personalityId)?.name ?? 'Jessica'}
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
                            try { window.localStorage.setItem('logoslight-ai-personality-v1', p.id); } catch { /* ignore */ }
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
                  <span className="side-eyebrow">{sidePanelEyebrow()}</span>
                  <div className="side-title">{sidePanelTitle()}</div>
                </>
              )}
              <div className="side-subtitle">{sidePanelContext}</div>
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
                  <div className="commentary-source-menu" role="listbox" aria-label="Commentary source">
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
              {sidePanelMode === 'commentary' && renderCommentaryContent()}
              {sidePanelMode === 'ai' && (
                <AiSidebar
                  currentBookName={currentBook?.name ?? null}
                  chapter={chapter}
                  translation={translation}
                  personalityId={personalityId}
                  bibleBookNames={bibleBookNamesForAi}
                  onNavigate={handleAiNavigate}
                  onOpenCommentary={handleAiOpenCommentary}
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
          <main className="bible-pane" ref={biblePaneRef}>
            <div className="reader-wrap">
              {renderChapterContent()}
            </div>
          </main>
        </div>
      </div>

      {/* Chapter nav buttons */}
      <div className={`ch-nav ch-nav-prev${chromeVisible ? '' : ' chrome-hide-bottom'}`}>
        <button
          className="ch-nav-btn"
          type="button"
          aria-label="Previous chapter"
          disabled={!currentBook || !!isFirstChapter()}
          onClick={goPrev}
        >
          ‹
        </button>
      </div>
      <div className={`ch-nav ch-nav-next${chromeVisible ? '' : ' chrome-hide-bottom'}`}>
        <button
          className="ch-nav-btn"
          type="button"
          aria-label="Next chapter"
          disabled={!currentBook || !!isLastChapter()}
          onClick={goNext}
        >
          ›
        </button>
      </div>

      {/* Taskbar */}
      <div className={`taskbar${chromeVisible ? '' : ' chrome-hide-bottom'}`}>
        <button className="taskbar-btn taskbar-btn-settings" type="button" onClick={() => setSettingsOpen(true)}>
          <span className="taskbar-icon" aria-hidden="true">
            <svg viewBox="0 0 24 24">
              <circle cx="12" cy="12" r="3" />
              <path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1-2.83 2.83l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-4 0v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83-2.83l.06-.06A1.65 1.65 0 0 0 4.68 15a1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1 0-4h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 2.83-2.83l.06.06A1.65 1.65 0 0 0 9 4.68a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 4 0v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 2.83l-.06.06A1.65 1.65 0 0 0 19.4 9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 0 4h-.09a1.65 1.65 0 0 0-1.51 1Z" />
            </svg>
          </span>
          <span className="taskbar-label">Settings</span>
        </button>

        <button
          className={`taskbar-btn${sidePanelMode === 'commentary' ? ' active' : ''}`}
          type="button"
          onClick={toggleCommentary}
        >
          <span className="taskbar-icon" aria-hidden="true">
            <svg viewBox="0 0 24 24">
              <path d="M6 7.5h9" /><path d="M6 11h12" /><path d="M6 14.5h8" />
              <path d="M5 4.5h14a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H12l-4.5 3v-3H5a2 2 0 0 1-2-2v-8a2 2 0 0 1 2-2Z" />
            </svg>
          </span>
          <span className="taskbar-label">Commentary</span>
        </button>

        <button className="taskbar-btn is-primary" type="button">
          <span className="taskbar-icon" aria-hidden="true">
            <svg viewBox="0 0 24 24">
              <path d="M6.5 5.5h8a3 3 0 0 1 3 3v10h-8a3 3 0 0 0-3 3Z" />
              <path d="M17.5 18.5h-8a3 3 0 0 0-3 3V8.5a3 3 0 0 1 3-3h8Z" />
              <path d="M10 8.5v7" /><path d="M8.2 12h3.6" />
            </svg>
          </span>
          <span className="taskbar-label">Bible</span>
        </button>

        <button
          className={`taskbar-btn${sidePanelMode === 'ai' ? ' active' : ''}`}
          type="button"
          onClick={toggleAiPanel}
        >
          <span className="taskbar-icon" aria-hidden="true">
            <svg viewBox="0 0 24 24">
              <path d="M12 3.5 13.9 8l4.6 1.9-4.6 1.9-1.9 4.7-1.9-4.7L5.5 9.9 10.1 8 12 3.5Z" className="icon-solid" />
              <path d="M18 14.5 18.9 16.6 21 17.5l-2.1.9-.9 2.1-.9-2.1-2.1-.9 2.1-.9.9-2.1Z" className="icon-solid" />
              <path d="M6.5 15.5 7.2 17l1.5.7-1.5.7-.7 1.6-.7-1.6-1.6-.7 1.6-.7.7-1.5Z" className="icon-solid" />
            </svg>
          </span>
          <span className="taskbar-label">AI</span>
        </button>
      </div>

      {/* Settings panel */}
      <div
        className={`settings-overlay${settingsOpen ? ' open' : ''}`}
        onClick={e => { if (e.target === e.currentTarget) setSettingsOpen(false); }}
      >
        <div className="settings-panel">
          <div className="settings-header">
            <span className="settings-title">Settings</span>
            <button className="settings-close" type="button" aria-label="Close settings" onClick={() => setSettingsOpen(false)}>✕</button>
          </div>
          <div className="settings-body">
            <div className="settings-section-label">Appearance</div>
            <div className="theme-grid">
              {THEMES.map(theme => (
                <div
                  key={theme.id}
                  className={`theme-card${currentTheme === theme.id ? ' selected' : ''}`}
                  style={getThemeCardStyle(theme)}
                  role="button"
                  tabIndex={0}
                  onClick={() => applyTheme(theme.id)}
                  onKeyDown={e => e.key === 'Enter' && applyTheme(theme.id)}
                >
                  <div className="theme-swatches">
                    {theme.swatches.map((color, i) => (
                      <span key={i} style={{ background: color }} />
                    ))}
                  </div>
                  <div className="theme-name">{theme.name}</div>
                  <span className="theme-check" aria-hidden="true">✓</span>
                </div>
              ))}
            </div>
          </div>
        </div>
      </div>

      {/* Galaxy comet canvas — fixed overlay, clips to toolbar/gutter zones only */}
      <canvas
        ref={cometCanvasRef}
        aria-hidden="true"
        style={{
          position: 'fixed',
          inset: 0,
          width: '100%',
          height: '100%',
          pointerEvents: 'none',
          zIndex: 110,
          display: currentTheme === 'galaxy' ? 'block' : 'none',
        }}
      />
    </>
  );
}
