export interface BookInfo {
  book_number: number;
  name: string;
  name_zh?: string | null;
  name_zh_simplified?: string | null;
  testament: 'OT' | 'NT';
  total_chapters: number;
}
export interface Translation { id: string; name: string; language?: string; }

export interface VerseData   { verse: number; text: string; }
export interface ChapterData { book: string; chapter: number; translation: string; verses: VerseData[]; }
export interface SummaryEntityTag { slug: string; label: string; }
export interface CommentaryEntry {
  id?: number;
  source?: string;
  verse_start: number;
  verse_end: number | null;
  content: string;
  theme_tags?: SummaryEntityTag[] | null;
  people_tags?: SummaryEntityTag[] | null;
  place_tags?: SummaryEntityTag[] | null;
}
export interface CommentarySource { id: string; name: string; }
export interface SearchResult { verse: { book: string; chapter: number; verse: number; text: string; translation: string; }; relevance: number | null; }
export interface SearchSuggestion {
  id: string;
  label: string;
  hint: string;
  book: string;
  chapter: number;
  verseStart?: number;
  verseEnd?: number;
  translation?: string;
  score: number;
  source: 'direct' | 'recent' | 'popular' | 'typo';
}
export interface SavedPassage { book: string; chapter: number; translation: string; savedAt: number; }
export interface VerseNote { key: string; book: string; chapter: number; verse: number; text: string; updatedAt: number; }
export interface TutorialStep {
  id: string;
  title: string;
  instruction?: string;
  description?: string;
  tips?: string[];
  actionLabel?: string;
}
export interface TutorialRect {
  top: string;
  left: string;
  width: string;
  height: string;
}
export interface DailyVerse {
  book: string;
  chapter: number;
  verse: number;
  text: string;
}
export interface ChapterReadEvidence {
  furthestVerse: number;
  engagedMs: number;
}
export interface ReadingProgress {
  streak: number;
  goalMetDays: string[];
  todayIso: string;
  todayChapters: string[];
  todayChapterEvidence: Record<string, ChapterReadEvidence>;
  /** Cumulative engaged time today while reading Bible, commentary, or AI (ms). */
  todayActiveLearningMs: number;
  /** User sent at least one message to the AI assistant today (daily task). */
  todaySpokeToAi: boolean;
}
export const READER_FONT_PX_OPTIONS = ['8', '10', '12', '14', '16', '18', '20', '22', '24', '26', '28', '30'] as const;
export type ReaderFontPx = (typeof READER_FONT_PX_OPTIONS)[number];
export const READER_LINE_HEIGHT_OPTIONS = ['1.5', '2', '2.5'] as const;
export type ReaderLineHeightOption = (typeof READER_LINE_HEIGHT_OPTIONS)[number];
export const READER_FONT_IDS = ['georgia', 'charter', 'palatino', 'garamond', 'times', 'sans', 'openSans', 'dyslexie'] as const;
export type ReaderFontId = (typeof READER_FONT_IDS)[number];
export const HIGHLIGHT_COLOR_IDS = ['yellow', 'amber', 'green', 'blue', 'pink', 'lavender', 'mint'] as const;
export type ReaderHighlightColorId = (typeof HIGHLIGHT_COLOR_IDS)[number];
export const READING_MODE_IDS = ['single', 'book', 'paged-single', 'paged-double'] as const;
export type ReaderReadingMode = (typeof READING_MODE_IDS)[number];

export type ChapterQuizVisitState = { visibleAccumMs: number; visibleStartedAt: number | null };

export type GraphicsMode = 'auto' | 'performance' | 'efficiency';

export interface ReaderSettings {
  fontScale: ReaderFontPx;
  lineHeight: ReaderLineHeightOption;
  readerFont: ReaderFontId;
  highlightColor: ReaderHighlightColorId;
  readingMode: ReaderReadingMode;
  specialEffects: boolean;
  pageFlipEnabled: boolean;
  defaultPanel: SidePanelMode;
  sidePanelPosition: SidePanelPosition;
  graphicsMode: GraphicsMode;
}

/** API / JSON may use plain `string`; runtime checks narrow to `ReaderSettings` literals. */
export type ReaderSettingsNormalizeInput = {
  [K in keyof ReaderSettings]?:
    ReaderSettings[K] extends string ? ReaderSettings[K] | string : ReaderSettings[K];
} & {
  /** Legacy persisted flag; inverted when mapping to `specialEffects`. */
  reducedMotion?: boolean;
};
export type SidePanelMode = 'none' | 'commentary' | 'ai' | 'study';
export type SidePanelPosition = 'left' | 'right';
