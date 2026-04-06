'use client';

import { useCallback, useEffect, useMemo, useRef, useState } from 'react';

import {
  parseReferenceLabel,
  segmentTextWithScriptureRefs,
  sortBookNamesForMatching,
} from '@/lib/scriptureReference';

const MAX_ADDITIONAL_CHAPTERS = 3;
const AI_SIDEBAR_SESSION_KEY = 'bible-app-ai-sidebar';
/** Persisted assistant personality id (`jessica` | `john` | `girl2` | `boy2`). */
export const AI_PERSONALITY_STORAGE_KEY = 'bible-app-ai-personality';
const LEGACY_SIDEBAR_SESSION_KEY = 'logoslight-ai-sidebar-v1';
const LEGACY_PERSONALITY_KEY = 'logoslight-ai-personality-v1';

function removeLegacyAiStorageKeys() {
  if (typeof window === 'undefined') return;
  try {
    window.localStorage.removeItem(LEGACY_PERSONALITY_KEY);
    window.sessionStorage.removeItem(LEGACY_SIDEBAR_SESSION_KEY);
  } catch {
    /* ignore */
  }
}
/** Exported for reader “Ask from selection” prompt length (must match server expectations). */
export const MAX_MESSAGE_CHARS = 1500;
const TYPEWRITER_SPEED_MS = 12; // ms per step (2 chars per step)
const THINKING_VERB_INTERVAL_MS = 2400;

/** Rotating status line while the assistant is thinking (Claude Code–style verbs). */
const AI_THINKING_VERBS = [
  'philosophizing',
  'reading',
  'researching',
  'pondering',
  'cross-referencing',
  'reflecting',
  'considering',
  'unpacking',
  'connecting ideas',
  'weighing',
  'meditating',
  'gathering context',
  'sifting',
  'parsing',
  'searching',
  'tracing themes',
] as const;

// ─── Personality system ──────────────────────────────────────────────────────

interface Personality {
  id: string;
  name: string;
  tagline: string;
  avatarBg: string;
  avatarInner: string;
}

export const PERSONALITIES: Personality[] = [
  { id: 'jessica', name: 'Jessica', tagline: 'Warm & casual',     avatarBg: '#c07858', avatarInner: '#e8a880' },
  { id: 'john',    name: 'John',    tagline: 'Direct & grounded', avatarBg: '#4878a0', avatarInner: '#80b0d0' },
  { id: 'girl2',   name: 'Girl 2',  tagline: 'Heart-focused',     avatarBg: '#8858a8', avatarInner: '#c090d8' },
  { id: 'boy2',    name: 'Boy 2',   tagline: 'Classic & wise',    avatarBg: '#7a6038', avatarInner: '#b89058' },
];

const JESSICA_THEME = PERSONALITIES.find(p => p.id === 'jessica')!;
const JOHN_THEME = PERSONALITIES.find(p => p.id === 'john')!;

// ─── Types ───────────────────────────────────────────────────────────────────

export interface AIActionParams {
  book?: string;
  chapter?: number;
  verse_start?: number;
  verse_end?: number;
  source?: string;
}

interface AIAction {
  type: 'navigate' | 'open_commentary';
  label: string;
  description: string;
  params: AIActionParams;
}

interface AIChatResponse {
  message: string;
  references: string[];
  actions: AIAction[];
  suggested_follow_ups: string[];
  context_label: string;
}

interface AIHistoryMessage {
  role: 'user' | 'assistant';
  content: string;
}

interface AIUserEntry {
  id: string;
  kind: 'user';
  content: string;
  displayContent?: string;
}

interface AIAssistantEntry {
  id: string;
  kind: 'assistant';
  content: string;
  references: string[];
  actions: AIAction[];
  suggestedFollowUps: string[];
  contextLabel: string;
}

interface AIContextEntry {
  id: string;
  kind: 'context';
  label: string;
}

type AITranscriptEntry = AIUserEntry | AIAssistantEntry | AIContextEntry;

export interface AiSidebarProps {
  currentBookName: string | null;
  chapter: number;
  translation: string;
  personalityId: string;
  /** Bible books with chapter counts from `/api/v1/books`. Used for autocomplete and reference parsing. */
  bibleBooks: Array<{ name: string; total_chapters: number }>;
  onNavigate: (params: AIActionParams) => void;
  onOpenCommentary: (source?: string) => void;
  /** When `id` changes, replaces the composer draft and focuses the textarea (e.g. “ask from selection”). */
  composerSeed?: { id: number; text: string };
}

// ─── Helpers ─────────────────────────────────────────────────────────────────

function createId(prefix: string) {
  if (typeof crypto !== 'undefined' && typeof crypto.randomUUID === 'function') {
    return `${prefix}-${crypto.randomUUID()}`;
  }
  return `${prefix}-${Date.now()}-${Math.random().toString(36).slice(2, 8)}`;
}

function getContextLabel(book: string | null, chapter: number, translation: string) {
  return book ? `${book} ${chapter} (${translation})` : '';
}

function getStarterPrompts(book: string | null, chapter: number) {
  if (!book) return [];
  return [
    `Summarize ${book} ${chapter} for me.`,
    `What does ${book} ${chapter} teach about God?`,
  ];
}

function wrapFollowUpSelection(suggestion: string): string {
  const trimmed = suggestion.trim();
  return (
    'The user selected one of your suggested follow-ups below. Treat this as them agreeing to that direction—not as them asking you a new question. Continue accordingly.\n\n' +
    trimmed
  );
}

function toHistory(entries: AITranscriptEntry[]): AIHistoryMessage[] {
  return entries.reduce<AIHistoryMessage[]>((history, entry) => {
    if (entry.kind === 'user') return [...history, { role: 'user' as const, content: entry.content }];
    if (entry.kind === 'assistant') return [...history, { role: 'assistant' as const, content: entry.content }];
    return history;
  }, []);
}

function restoreTranscript(): AITranscriptEntry[] {
  if (typeof window === 'undefined') return [];
  removeLegacyAiStorageKeys();
  try {
    const raw = window.sessionStorage.getItem(AI_SIDEBAR_SESSION_KEY);
    if (!raw) return [];
    const parsed = JSON.parse(raw);
    if (!Array.isArray(parsed)) return [];
    return parsed.filter(Boolean);
  } catch {
    return [];
  }
}

export function restorePersonalityId(): string {
  if (typeof window === 'undefined') return 'jessica';
  removeLegacyAiStorageKeys();
  try {
    const stored = window.localStorage.getItem(AI_PERSONALITY_STORAGE_KEY);
    return PERSONALITIES.some(p => p.id === stored) ? stored! : 'jessica';
  } catch {
    return 'jessica';
  }
}

// ─── Jessica avatar (princess — tiara & hair, same viewBox / expressions as before) ─

function JessicaAvatar({ isLoading }: { isLoading: boolean }) {
  const bg = JESSICA_THEME.avatarBg;
  const inner = JESSICA_THEME.avatarInner;
  const hair = '#4a3228';
  const hairLight = '#5c4034';
  const gold = '#e8c04a';
  const goldDeep = '#c49a2a';
  const gem = '#e85d75';
  return (
    <div className={`ai-avatar${isLoading ? ' ai-avatar-loading' : ' ai-avatar-idle'}`} aria-hidden="true">
      <svg viewBox="0 0 60 70" xmlns="http://www.w3.org/2000/svg" width="40" height="40">
        {/* Hair volume behind the face */}
        <path
          d="M 7 68 Q 6 38 14 24 Q 22 10 30 9 Q 38 10 46 24 Q 54 38 53 68 Z"
          fill={hair}
        />
        <path
          d="M 14 26 Q 22 14 30 12 Q 38 14 46 26 Q 40 22 30 20 Q 20 22 14 26"
          fill={hairLight}
          opacity="0.55"
        />
        {/* Face: tapered jaw + higher cheekbones (less “round mascot”) */}
        <path
          d="M 30 25.5
             C 40.5 25.5 48 33.5 48 43.5
             C 48 53.5 41.5 62 30 63
             C 18.5 62 12 53.5 12 43.5
             C 12 33.5 19.5 25.5 30 25.5 Z"
          fill={inner}
        />
        {/* Side curls framing the face (under the tiara) */}
        <path
          d="M 11 41 Q 10 33 15 28 Q 18.5 31 17.5 39 Q 14.5 43.5 11 41"
          fill={hair}
        />
        <path
          d="M 49 41 Q 50 33 45 28 Q 41.5 31 42.5 39 Q 45.5 43.5 49 41"
          fill={hair}
        />
        {/* Tiara on the forehead */}
        <path
          d="M 17 28 L 30 14 L 43 28 L 41 31 L 19 31 Z"
          fill={gold}
          stroke={goldDeep}
          strokeWidth="0.9"
          strokeLinejoin="round"
        />
        <circle cx="30" cy="17" r="2.1" fill={gem} />
        <circle cx="21.5" cy="26" r="1.5" fill={gem} opacity="0.88" />
        <circle cx="38.5" cy="26" r="1.5" fill={gem} opacity="0.88" />
        <rect x="18" y="29" width="24" height="2.8" rx="0.8" fill={goldDeep} />
        {/* Soft cheek tint + freckles (inset, not full “chipmunk” cheeks) */}
        <ellipse cx="17" cy="47" rx="4.5" ry="2.8" fill="#e86060" opacity="0.2" />
        <ellipse cx="43" cy="47" rx="4.5" ry="2.8" fill="#e86060" opacity="0.2" />
        <circle cx="18.5" cy="45.5" r="0.75" fill={bg} opacity="0.22" />
        <circle cx="16.5" cy="47.5" r="0.65" fill={bg} opacity="0.22" />
        <circle cx="41.5" cy="45.5" r="0.75" fill={bg} opacity="0.22" />
        <circle cx="43.5" cy="47.5" r="0.65" fill={bg} opacity="0.22" />
        {isLoading ? (
          <>
            {/* Thinking: warm brow + subtle smile; eyes match idle (forward) */}
            <path
              d="M 17.5 33.4 Q 21.5 31.8 25.5 33.4"
              stroke={bg}
              strokeWidth="1.1"
              fill="none"
              strokeLinecap="round"
              opacity="0.8"
            />
            <path
              d="M 34.5 33.4 Q 38.5 31.8 42.5 33.4"
              stroke={bg}
              strokeWidth="1.1"
              fill="none"
              strokeLinecap="round"
              opacity="0.8"
            />
            <path
              d="M 18 36 Q 22 35.2 26 36"
              stroke={bg}
              strokeWidth="0.85"
              fill="none"
              strokeLinecap="round"
              opacity="0.28"
            />
            <path
              d="M 34 36 Q 38 35.2 42 36"
              stroke={bg}
              strokeWidth="0.85"
              fill="none"
              strokeLinecap="round"
              opacity="0.28"
            />
            <ellipse cx="22" cy="40" rx="3.5" ry="4.2" fill="#1a0c08" />
            <ellipse cx="38" cy="40" rx="3.5" ry="4.2" fill="#1a0c08" />
            <ellipse cx="23" cy="38.2" rx="1.35" ry="1.55" fill="white" />
            <ellipse cx="39" cy="38.2" rx="1.35" ry="1.55" fill="white" />
            <ellipse cx="20.6" cy="41" rx="0.85" ry="1" fill="white" opacity="0.5" />
            <ellipse cx="36.6" cy="41" rx="0.85" ry="1" fill="white" opacity="0.5" />
            {/* Nose bridge + tip */}
            <path
              d="M 30 41.5 L 30 45.5 M 27.8 45.8 Q 30 46.6 32.2 45.8"
              stroke={bg}
              strokeWidth="1.05"
              fill="none"
              strokeLinecap="round"
              opacity="0.9"
            />
            {/* Subtle smile while pondering */}
            <path
              d="M 24 53.6 Q 30 56.8 36 53.6"
              stroke="#1a0c08"
              strokeWidth="1.15"
              fill="none"
              strokeLinecap="round"
            />
          </>
        ) : (
          <>
            {/* Soft arch brows */}
            <path
              d="M 17.5 34 Q 21.5 32 25.5 34"
              stroke={bg}
              strokeWidth="1.15"
              fill="none"
              strokeLinecap="round"
              opacity="0.82"
            />
            <path
              d="M 34.5 34 Q 38.5 32 42.5 34"
              stroke={bg}
              strokeWidth="1.15"
              fill="none"
              strokeLinecap="round"
              opacity="0.82"
            />
            {/* Almond eyes, slightly closer — less “cartoon animal” */}
            <ellipse cx="22" cy="40" rx="3.5" ry="4.2" fill="#1a0c08" />
            <ellipse cx="38" cy="40" rx="3.5" ry="4.2" fill="#1a0c08" />
            <ellipse cx="23" cy="38.2" rx="1.35" ry="1.55" fill="white" />
            <ellipse cx="39" cy="38.2" rx="1.35" ry="1.55" fill="white" />
            <ellipse cx="20.6" cy="41" rx="0.85" ry="1" fill="white" opacity="0.5" />
            <ellipse cx="36.6" cy="41" rx="0.85" ry="1" fill="white" opacity="0.5" />
            <path
              d="M 30 41.8 L 30 45.6 M 28 46 Q 30 46.9 32 46"
              stroke={bg}
              strokeWidth="1.05"
              fill="none"
              strokeLinecap="round"
              opacity="0.92"
            />
            {/* Smile line only — avoids prominent “buck teeth” read */}
            <path
              d="M 24 52.5 Q 30 57.5 36 52.5"
              stroke="#1a0c08"
              strokeWidth="1.35"
              fill="none"
              strokeLinecap="round"
            />
          </>
        )}
      </svg>
    </div>
  );
}

// ─── John avatar (older-kid / teen boy — hairline & hoodie, same viewBox + idle/loading as Jessica) ─

function JohnAvatar({ isLoading }: { isLoading: boolean }) {
  const hoodieTrim = JOHN_THEME.avatarBg;
  const hoodie = JOHN_THEME.avatarInner;
  const skin = '#c9a178';
  const skinDeep = '#a67b52';
  const hair = '#2a221c';

  return (
    <div className={`ai-avatar${isLoading ? ' ai-avatar-loading' : ' ai-avatar-idle'}`} aria-hidden="true">
      <svg viewBox="0 0 60 70" xmlns="http://www.w3.org/2000/svg" width="40" height="40">
        {/* Hoodie + shoulders */}
        <path
          d="M6 62 Q30 56 54 62 L58 70 H2 L6 62"
          fill={hoodie}
          opacity="0.9"
        />
        <path d="M12 60 Q30 57.5 48 60" stroke={hoodieTrim} strokeWidth="1.5" fill="none" strokeLinecap="round" opacity="0.85" />
        {/* Neck */}
        <rect x="23" y="50" width="14" height="14" rx="3" fill={skinDeep} />
        {/* Ears */}
        <ellipse cx="11.5" cy="43.5" rx="3.8" ry="5.2" fill={skin} />
        <ellipse cx="48.5" cy="43.5" rx="3.8" ry="5.2" fill={skin} />
        {/* Face — round head */}
        <circle cx="30" cy="44" r="19" fill={skin} />
        <ellipse cx="30" cy="47" rx="15" ry="13" fill={skinDeep} opacity="0.12" />
        {/* Hair — thin stroke along top arc of head (matches face circle cx=30 cy=44 r=19) */}
        <path
          d="M 15.27 32 A 19 19 0 0 1 44.73 32"
          fill="none"
          stroke={hair}
          strokeWidth="1.35"
          strokeLinecap="round"
        />
        {/* Light stubble wash — reads older-kid without looking polished-cute */}
        <ellipse cx="30" cy="51" rx="12" ry="7" fill={hair} opacity="0.06" />
        {isLoading ? (
          <>
            {/* Thinking: open brow + light smile; eyes match idle (forward) */}
            <path
              d="M 16.5 32.2 Q 21 31 25.5 32.2"
              stroke={hair}
              strokeWidth="1.08"
              fill="none"
              strokeLinecap="round"
              opacity="0.88"
            />
            <path
              d="M 34.5 32.2 Q 39 31 43.5 32.2"
              stroke={hair}
              strokeWidth="1.08"
              fill="none"
              strokeLinecap="round"
              opacity="0.88"
            />
            <path
              d="M 17 35 Q 21.5 34.2 26 35"
              stroke={hair}
              strokeWidth="0.75"
              fill="none"
              strokeLinecap="round"
              opacity="0.26"
            />
            <path
              d="M 34 35 Q 38.5 34.2 43 35"
              stroke={hair}
              strokeWidth="0.75"
              fill="none"
              strokeLinecap="round"
              opacity="0.26"
            />
            <ellipse cx="21.5" cy="41" rx="3.2" ry="3.6" fill="#141008" />
            <ellipse cx="38.5" cy="41" rx="3.2" ry="3.6" fill="#141008" />
            <circle cx="22.5" cy="39.5" r="1.25" fill="white" />
            <circle cx="39.5" cy="39.5" r="1.25" fill="white" />
            <circle cx="20.5" cy="42" r="0.65" fill="white" opacity="0.45" />
            <circle cx="37.5" cy="42" r="0.65" fill="white" opacity="0.45" />
            <path
              d="M 26.5 45.5 L28 48 L31 46.5 L33.5 48.5 L35 45.5"
              stroke={skinDeep}
              strokeWidth="1.1"
              fill="none"
              strokeLinecap="round"
              strokeLinejoin="round"
              opacity="0.85"
            />
            <path
              d="M 24 52.6 Q 30 55.8 36 52.6"
              stroke="#141008"
              strokeWidth="1.15"
              fill="none"
              strokeLinecap="round"
            />
          </>
        ) : (
          <>
            {/* Relaxed, approachable eyes */}
            <ellipse cx="21.5" cy="41" rx="3.2" ry="3.6" fill="#141008" />
            <ellipse cx="38.5" cy="41" rx="3.2" ry="3.6" fill="#141008" />
            <circle cx="22.5" cy="39.5" r="1.25" fill="white" />
            <circle cx="39.5" cy="39.5" r="1.25" fill="white" />
            <circle cx="20.5" cy="42" r="0.65" fill="white" opacity="0.45" />
            <circle cx="37.5" cy="42" r="0.65" fill="white" opacity="0.45" />
            <path
              d="M 26.5 45.5 L28 48 L31 46.5 L33.5 48.5 L35 45.5"
              stroke={skinDeep}
              strokeWidth="1.1"
              fill="none"
              strokeLinecap="round"
              strokeLinejoin="round"
              opacity="0.85"
            />
            {/* Chill closed-mouth smirk */}
            <path
              d="M 24 53 Q 30 57 36 52.5"
              stroke="#141008"
              strokeWidth="1.45"
              fill="none"
              strokeLinecap="round"
            />
          </>
        )}
      </svg>
    </div>
  );
}

function AgentAvatar({ personality, isLoading }: { personality: Personality; isLoading: boolean }) {
  if (personality.id === 'jessica') {
    return <JessicaAvatar isLoading={isLoading} />;
  }
  if (personality.id === 'john') {
    return <JohnAvatar isLoading={isLoading} />;
  }
  const bg = personality.avatarBg;
  const inner = personality.avatarInner;
  return (
    <div className={`ai-avatar${isLoading ? ' ai-avatar-loading' : ' ai-avatar-idle'}`} aria-hidden="true">
      <svg viewBox="0 0 60 70" xmlns="http://www.w3.org/2000/svg" width="40" height="40">
        {/* Left ear */}
        <ellipse cx="13" cy="20" rx="9.5" ry="16" fill={bg} />
        <ellipse cx="13" cy="21.5" rx="5.5" ry="11" fill={inner} opacity="0.75" />
        {/* Right ear */}
        <ellipse cx="47" cy="20" rx="9.5" ry="16" fill={bg} />
        <ellipse cx="47" cy="21.5" rx="5.5" ry="11" fill={inner} opacity="0.75" />
        {/* Face */}
        <circle cx="30" cy="44" r="22" fill={inner} />
        {/* Eyes */}
        <circle cx="22" cy="42" r="4.5" fill="#1a0c08" />
        <circle cx="38" cy="42" r="4.5" fill="#1a0c08" />
        {/* Eye shine */}
        <circle cx="23.5" cy="40.5" r="1.8" fill="white" />
        <circle cx="39.5" cy="40.5" r="1.8" fill="white" />
        {/* Nose */}
        <ellipse cx="30" cy="47.5" rx="2.2" ry="1.5" fill={bg} />
        {/* Mouth arc */}
        <path d="M21 52 Q30 62 39 52" stroke="#1a0c08" strokeWidth="1.5" fill="none" strokeLinecap="round" />
        {/* Teeth */}
        <rect x="25.5" y="51.5" width="4" height="4.5" rx="1" fill="white" />
        <rect x="30.5" y="51.5" width="4" height="4.5" rx="1" fill="white" />
        {/* Cheeks */}
        <ellipse cx="16" cy="47.5" rx="5.5" ry="3.5" fill="#e04040" opacity="0.2" />
        <ellipse cx="44" cy="47.5" rx="5.5" ry="3.5" fill="#e04040" opacity="0.2" />
      </svg>
    </div>
  );
}

// ─── Typewriter text ──────────────────────────────────────────────────────────

function TypewriterText({
  text,
  animate,
  onComplete,
}: {
  text: string;
  animate: boolean;
  onComplete?: () => void;
}) {
  const [displayed, setDisplayed] = useState(animate ? '' : text);
  const idxRef = useRef(animate ? 0 : text.length);
  const timerRef = useRef<ReturnType<typeof setInterval> | null>(null);
  const onCompleteRef = useRef(onComplete);
  onCompleteRef.current = onComplete;

  useEffect(() => {
    if (!animate || idxRef.current >= text.length) {
      setDisplayed(text);
      idxRef.current = text.length;
      onCompleteRef.current?.();
      return;
    }
    timerRef.current = setInterval(() => {
      idxRef.current = Math.min(idxRef.current + 2, text.length);
      setDisplayed(text.slice(0, idxRef.current));
      if (idxRef.current >= text.length && timerRef.current) {
        clearInterval(timerRef.current);
        onCompleteRef.current?.();
      }
    }, TYPEWRITER_SPEED_MS);
    return () => {
      if (timerRef.current) clearInterval(timerRef.current);
    };
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []); // intentionally run once on mount

  return <>{displayed}</>;
}

function LinkedScriptureParagraph({
  text,
  bookNamesSorted,
  onNavigate,
}: {
  text: string;
  bookNamesSorted: string[];
  onNavigate: (params: AIActionParams) => void;
}) {
  const segments = useMemo(
    () => segmentTextWithScriptureRefs(text, bookNamesSorted),
    [text, bookNamesSorted],
  );
  return (
    <>
      {segments.map((seg, i) =>
        seg.kind === 'text' ? (
          <span key={i}>{seg.text}</span>
        ) : (
          <button
            key={i}
            type="button"
            className="ai-inline-scripture-ref"
            onClick={() =>
              onNavigate({
                book: seg.book,
                chapter: seg.chapter,
                verse_start: seg.verse_start,
                verse_end: seg.verse_end,
              })
            }
          >
            {seg.text}
          </button>
        ),
      )}
    </>
  );
}

function AssistantMessageRichBody({
  text,
  animate,
  bookNamesSorted,
  onNavigate,
}: {
  text: string;
  animate: boolean;
  bookNamesSorted: string[];
  onNavigate: (params: AIActionParams) => void;
}) {
  const [animDone, setAnimDone] = useState(!animate);

  useEffect(() => {
    setAnimDone(!animate);
  }, [text, animate]);

  const handleTypewriterComplete = useCallback(() => setAnimDone(true), []);

  const hasBooks = bookNamesSorted.length > 0;
  if (hasBooks && animDone) {
    return (
      <LinkedScriptureParagraph
        text={text}
        bookNamesSorted={bookNamesSorted}
        onNavigate={onNavigate}
      />
    );
  }

  return (
    <TypewriterText
      text={text}
      animate={animate && !animDone}
      onComplete={handleTypewriterComplete}
    />
  );
}

// ─── Chapter picker (autocomplete book + chapter dropdown) ───────────────────

function ChapterPickerForm({
  bibleBooks,
  onAdd,
  onCancel,
}: {
  bibleBooks: Array<{ name: string; total_chapters: number }>;
  onAdd: (book: string, chapter: number) => void;
  onCancel: () => void;
}) {
  const [bookQuery, setBookQuery] = useState('');
  const [selectedBookName, setSelectedBookName] = useState('');
  const [chapterNum, setChapterNum] = useState(1);

  const filteredBooks = useMemo(() => {
    const q = bookQuery.toLowerCase().trim();
    if (!q) return bibleBooks;
    return bibleBooks.filter(b => b.name.toLowerCase().includes(q));
  }, [bookQuery, bibleBooks]);

  useEffect(() => {
    setSelectedBookName(prev => {
      if (filteredBooks.length === 0) return '';
      if (filteredBooks.some(b => b.name === prev)) return prev;
      return filteredBooks[0].name;
    });
  }, [filteredBooks]);

  const selectedBook = useMemo(
    () => bibleBooks.find(b => b.name === selectedBookName) ?? null,
    [bibleBooks, selectedBookName],
  );

  useEffect(() => {
    setChapterNum(1);
  }, [selectedBookName]);

  useEffect(() => {
    if (!selectedBook) return;
    if (chapterNum > selectedBook.total_chapters) {
      setChapterNum(selectedBook.total_chapters);
    }
  }, [selectedBook, chapterNum]);

  return (
    <div className="ai-add-chapter-form">
      <div className="ai-book-picker-block">
        <input
          className="ai-add-chapter-input ai-book-search-input"
          type="search"
          placeholder="Search book…"
          value={bookQuery}
          autoComplete="off"
          aria-label="Filter books by name"
          onChange={e => setBookQuery(e.target.value)}
        />
        <select
          className="ai-add-chapter-input ai-book-select"
          aria-label="Book"
          value={selectedBookName}
          onChange={e => setSelectedBookName(e.target.value)}
          disabled={bibleBooks.length === 0 || filteredBooks.length === 0}
        >
          {filteredBooks.length === 0 ? (
            <option value="">
              {bibleBooks.length === 0 ? 'No books loaded' : 'No matching books'}
            </option>
          ) : (
            filteredBooks.map(b => (
              <option key={b.name} value={b.name}>
                {b.name}
              </option>
            ))
          )}
        </select>
      </div>

      {selectedBook ? (
        <select
          className="ai-add-chapter-input ai-chapter-select"
          aria-label="Chapter"
          value={chapterNum}
          onChange={e => setChapterNum(Number(e.target.value))}
        >
          {Array.from({ length: selectedBook.total_chapters }, (_, i) => i + 1).map(n => (
            <option key={n} value={n}>{n}</option>
          ))}
        </select>
      ) : null}

      <button
        className="ai-add-chapter-confirm"
        type="button"
        disabled={!selectedBook}
        onClick={() => { if (selectedBook) onAdd(selectedBook.name, chapterNum); }}
      >
        Add
      </button>
      <button className="ai-add-chapter-cancel" type="button" onClick={onCancel}>
        Cancel
      </button>
    </div>
  );
}

/**
 * Adjust scroll on the AI side panel only. `Element.scrollIntoView` walks ancestors
 * and can move unrelated scroll regions (e.g. the Bible reader) when the layout updates.
 */
function scrollWithinSideScroll(el: HTMLElement, align: 'start' | 'bottom') {
  const scrollRoot = el.closest('.side-scroll');
  if (!(scrollRoot instanceof HTMLElement)) return;
  if (align === 'bottom') {
    const max = Math.max(0, scrollRoot.scrollHeight - scrollRoot.clientHeight);
    scrollRoot.scrollTo({ top: max, behavior: 'smooth' });
    return;
  }
  const rootRect = scrollRoot.getBoundingClientRect();
  const elRect = el.getBoundingClientRect();
  scrollRoot.scrollTo({
    top: Math.max(0, scrollRoot.scrollTop + (elRect.top - rootRect.top)),
    behavior: 'smooth',
  });
}

// ─── Main component ───────────────────────────────────────────────────────────

export default function AiSidebar({
  currentBookName,
  chapter,
  translation,
  personalityId,
  bibleBooks,
  onNavigate,
  onOpenCommentary,
  composerSeed,
}: AiSidebarProps) {
  const [entries, setEntries] = useState<AITranscriptEntry[]>([]);
  const [draft, setDraft] = useState('');
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [thinkingVerbIndex, setThinkingVerbIndex] = useState(0);

  const personality = PERSONALITIES.find(p => p.id === personalityId) ?? PERSONALITIES[0];
  const composerTextareaRef = useRef<HTMLTextAreaElement | null>(null);

  const bibleBookNames = useMemo(() => bibleBooks.map(b => b.name), [bibleBooks]);
  const bookNamesSorted = useMemo(() => sortBookNamesForMatching(bibleBookNames), [bibleBookNames]);

  // Additional context chapters
  const [additionalChapters, setAdditionalChapters] = useState<Array<{ book: string; chapter: number }>>([]);
  const [showAddForm, setShowAddForm] = useState(false);
  const atMaxChapters = additionalChapters.length >= MAX_ADDITIONAL_CHAPTERS;

  // Typewriter: set of entry IDs that should animate on render
  const [animatedIds, setAnimatedIds] = useState<ReadonlySet<string>>(new Set());

  // Scroll refs — top of the in-flight or newest assistant turn (loading bubble or latest reply)
  const endRef = useRef<HTMLDivElement | null>(null);
  const assistantReplyTopRef = useRef<HTMLElement | null>(null);
  const newestAssistantId = useRef<string | null>(null);

  const lastContextRef = useRef<string>('');
  const currentContextLabel = getContextLabel(currentBookName, chapter, translation);
  const starterPrompts = getStarterPrompts(currentBookName, chapter);
  const remainingChars = MAX_MESSAGE_CHARS - draft.length;

  // Restore session
  useEffect(() => {
    setEntries(restoreTranscript());
  }, []);

  // Prefill composer when parent requests (reader text selection → Ask agent)
  useEffect(() => {
    if (!composerSeed) return;
    const next =
      composerSeed.text.length > MAX_MESSAGE_CHARS
        ? composerSeed.text.slice(0, MAX_MESSAGE_CHARS)
        : composerSeed.text;
    setDraft(next);
    setError(null);
    const id = requestAnimationFrame(() => {
      const el = composerTextareaRef.current;
      if (!el) return;
      el.focus();
      const len = el.value.length;
      el.setSelectionRange(len, len);
    });
    return () => cancelAnimationFrame(id);
  }, [composerSeed?.id]);

  // Persist transcript
  useEffect(() => {
    if (typeof window === 'undefined') return;
    window.sessionStorage.setItem(AI_SIDEBAR_SESSION_KEY, JSON.stringify(entries));
  }, [entries]);

  // Claude Code–style rotating verbs while waiting for the model
  useEffect(() => {
    if (!isLoading) return;
    setThinkingVerbIndex(Math.floor(Math.random() * AI_THINKING_VERBS.length));
    const id = window.setInterval(() => {
      setThinkingVerbIndex(i => (i + 1) % AI_THINKING_VERBS.length);
    }, THINKING_VERB_INTERVAL_MS);
    return () => window.clearInterval(id);
  }, [isLoading]);

  // Scroll so the assistant’s current reply (thinking state or latest message) starts in view
  useEffect(() => {
    const id = requestAnimationFrame(() => {
      const el = assistantReplyTopRef.current;
      if (el) {
        scrollWithinSideScroll(el, 'start');
        return;
      }
      const end = endRef.current;
      if (end) scrollWithinSideScroll(end, 'bottom');
    });
    return () => cancelAnimationFrame(id);
  }, [entries, isLoading, error]);

  // Context change marker
  useEffect(() => {
    if (!currentContextLabel) return;
    const previous = lastContextRef.current;
    lastContextRef.current = currentContextLabel;
    if (!previous || previous === currentContextLabel) return;
    setEntries(prev => {
      if (!prev.some(entry => entry.kind !== 'context')) return prev;
      const last = prev[prev.length - 1];
      if (last?.kind === 'context' && last.label === currentContextLabel) return prev;
      return [...prev, { id: createId('context'), kind: 'context', label: currentContextLabel }];
    });
  }, [currentContextLabel]);

  async function sendMessage(
    rawMessage: string,
    options?: { fromFollowUpSuggestion?: boolean; displayAs?: string },
  ) {
    const trimmed = rawMessage.trim();
    const message = options?.fromFollowUpSuggestion ? wrapFollowUpSelection(trimmed) : trimmed;
    if (!trimmed || isLoading) return;
    if (!currentBookName) {
      setError('The Bible context is still loading. Try again in a moment.');
      return;
    }
    if (message.length > MAX_MESSAGE_CHARS) {
      setError('Please keep your message under 1,500 characters.');
      return;
    }

    const history = toHistory(entries);
    const userEntry: AIUserEntry = {
      id: createId('user'),
      kind: 'user',
      content: message,
      ...(options?.fromFollowUpSuggestion
        ? { displayContent: options.displayAs?.trim() || trimmed }
        : {}),
    };
    newestAssistantId.current = null; // loading bubble is the scroll target until the reply arrives
    setEntries(prev => [...prev, userEntry]);
    setDraft('');
    setError(null);
    setIsLoading(true);

    try {
      const response = await fetch('/api/v1/ai/chat', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          message,
          context: { book: currentBookName, chapter, translation },
          additional_chapters: additionalChapters,
          personality: personalityId,
          conversation_history: history,
        }),
      });
      const payload = (await response.json().catch(() => null)) as AIChatResponse | { detail?: string } | null;
      if (!response.ok) {
        throw new Error(payload && 'detail' in payload && payload.detail ? payload.detail : 'The AI assistant could not answer right now.');
      }
      if (!payload || !('message' in payload)) {
        throw new Error('The AI assistant returned an unexpected response.');
      }
      const assistantEntry: AIAssistantEntry = {
        id: createId('assistant'),
        kind: 'assistant',
        content: payload.message,
        references: payload.references ?? [],
        actions: payload.actions ?? [],
        suggestedFollowUps: payload.suggested_follow_ups ?? [],
        contextLabel: payload.context_label ?? currentContextLabel,
      };
      newestAssistantId.current = assistantEntry.id;
      setAnimatedIds(prev => new Set([...prev, assistantEntry.id]));
      setEntries(prev => [...prev, assistantEntry]);
    } catch (caught) {
      const messageText = caught instanceof Error ? caught.message : 'The AI assistant could not answer right now.';
      setError(messageText);
    } finally {
      setIsLoading(false);
    }
  }

  function removeAdditionalChapter(index: number) {
    setAdditionalChapters(prev => prev.filter((_, i) => i !== index));
  }

  function handleSubmit(event: { preventDefault(): void }) {
    event.preventDefault();
    void sendMessage(draft);
  }

  function handleAction(action: AIAction) {
    if (action.type === 'navigate') {
      onNavigate(action.params);
      return;
    }
    if (action.type === 'open_commentary') {
      onOpenCommentary(action.params.source);
    }
  }

  return (
    <div className="ai-workspace">
      <div className="ai-thread">

        {/* ── Context / workspace card ── */}
        <div className="ai-context-card">
          <div className="ai-context-label">Study Workspace</div>
          <div className="ai-context-row">
            <span className="ai-context-pill">{currentContextLabel || 'Loading context...'}</span>
            {additionalChapters.map((ch, i) => (
              <span key={`${ch.book}-${ch.chapter}-${i}`} className="ai-context-pill ai-context-pill-extra">
                {ch.book} {ch.chapter}
                <button
                  className="ai-context-pill-remove"
                  type="button"
                  aria-label={`Remove ${ch.book} ${ch.chapter}`}
                  onClick={() => removeAdditionalChapter(i)}
                >
                  ×
                </button>
              </span>
            ))}
          </div>
          {atMaxChapters ? (
            <div className="ai-max-context-note">Max context reached</div>
          ) : showAddForm ? (
            <ChapterPickerForm
              bibleBooks={bibleBooks}
              onAdd={(book, ch) => {
                setAdditionalChapters(prev => [...prev, { book, chapter: ch }]);
                setShowAddForm(false);
              }}
              onCancel={() => setShowAddForm(false)}
            />
          ) : (
            <button className="ai-add-chapter-btn" type="button" onClick={() => setShowAddForm(true)}>
              + Add chapter
            </button>
          )}

        </div>

        {/* ── Empty state ── */}
        {entries.length === 0 && !isLoading && (
          <section className="ai-empty-state">
            <AgentAvatar personality={personality} isLoading={false} />
            <div className="ai-empty-title">Hi! I&apos;m {personality.name}. What&apos;s on your mind today?</div>
            <div className="ai-starter-grid">
              {starterPrompts.map(prompt => (
                <button
                  key={prompt}
                  className="ai-starter-btn"
                  type="button"
                  onClick={() => void sendMessage(prompt)}
                >
                  {prompt}
                </button>
              ))}
            </div>
          </section>
        )}

        {/* ── Transcript ── */}
        {entries.map(entry => {
          if (entry.kind === 'context') {
            return (
              <div key={entry.id} className="ai-context-marker">
                Context changed to {entry.label}
              </div>
            );
          }

          if (entry.kind === 'user') {
            return (
              <article key={entry.id} className="ai-message ai-message-user">
                <div className="ai-message-label">You</div>
                <div className="ai-message-body">{entry.displayContent ?? entry.content}</div>
              </article>
            );
          }

          // Assistant message
          const isNewest = entry.id === newestAssistantId.current;
          return (
            <article
              key={entry.id}
              ref={isNewest ? (el => { assistantReplyTopRef.current = el; }) : undefined}
              className="ai-message ai-message-assistant"
            >
              <div className="ai-message-header">
                <AgentAvatar personality={personality} isLoading={false} />
                <span className="ai-message-label">{personality.name}</span>
              </div>
              <div className="ai-message-body">
                <AssistantMessageRichBody
                  text={entry.content}
                  animate={animatedIds.has(entry.id)}
                  bookNamesSorted={bookNamesSorted}
                  onNavigate={onNavigate}
                />
              </div>
              {entry.references.length > 0 && (
                <div className="ai-chip-row">
                  {entry.references.map(reference => {
                    const nav = parseReferenceLabel(reference, bookNamesSorted);
                    if (nav) {
                      return (
                        <button
                          key={`${entry.id}-${reference}`}
                          type="button"
                          className="ai-chip ai-chip-nav"
                          onClick={() =>
                            onNavigate({
                              book: nav.book,
                              chapter: nav.chapter,
                              verse_start: nav.verse_start,
                              verse_end: nav.verse_end,
                            })
                          }
                        >
                          {reference}
                        </button>
                      );
                    }
                    return (
                      <span key={`${entry.id}-${reference}`} className="ai-chip">
                        {reference}
                      </span>
                    );
                  })}
                </div>
              )}
              {entry.actions.length > 0 && (
                <div className="ai-action-stack">
                  {entry.actions.map((action, index) => (
                    <button
                      key={`${entry.id}-${action.type}-${index}`}
                      className="ai-action-btn"
                      type="button"
                      onClick={() => handleAction(action)}
                    >
                      <span className="ai-action-title">{action.label}</span>
                      {action.description && <span className="ai-action-copy">{action.description}</span>}
                    </button>
                  ))}
                </div>
              )}
              {entry.suggestedFollowUps.length > 0 && (
                <div className="ai-follow-up-row">
                  {entry.suggestedFollowUps.map(prompt => (
                    <button
                      key={`${entry.id}-${prompt}`}
                      className="ai-follow-up-btn"
                      type="button"
                      onClick={() => void sendMessage(prompt, { fromFollowUpSuggestion: true })}
                    >
                      {prompt}
                    </button>
                  ))}
                </div>
              )}
            </article>
          );
        })}

        {/* ── Loading state ── */}
        {isLoading && (
          <article
            ref={el => { assistantReplyTopRef.current = el; }}
            className="ai-message ai-message-assistant ai-message-loading"
            aria-busy="true"
          >
            <div className="ai-message-header">
              <AgentAvatar personality={personality} isLoading={true} />
              <span className="ai-message-label">{personality.name}</span>
            </div>
            <div className="ai-loading-status" aria-live="polite">
              <span className="ai-loading-verb" key={thinkingVerbIndex}>
                {AI_THINKING_VERBS[thinkingVerbIndex]}…
              </span>
              <div className="ai-loading-dots" aria-hidden="true">
                <span /><span /><span />
              </div>
            </div>
          </article>
        )}

        {error && <div className="ai-error-card">{error}</div>}
        <div ref={endRef} />
      </div>

      {/* ── Composer ── */}
      <div className="ai-composer-shell">
        <form className="ai-composer" onSubmit={handleSubmit}>
          <textarea
            ref={composerTextareaRef}
            className="ai-composer-input"
            value={draft}
            rows={3}
            maxLength={MAX_MESSAGE_CHARS}
            placeholder={
              currentBookName
                ? `Ask ${personality.name} about ${currentBookName} ${chapter}...`
                : 'Waiting for chapter context...'
            }
            disabled={isLoading || !currentBookName}
            onChange={event => setDraft(event.target.value)}
            onKeyDown={event => {
              if (event.key === 'Enter' && !event.shiftKey) {
                event.preventDefault();
                void sendMessage(draft);
              }
            }}
          />
          <div className="ai-composer-footer">
            <span className={`ai-char-count${remainingChars < 120 ? ' warning' : ''}`}>
              {remainingChars} characters left
            </span>
            <button
              className="ai-send-btn"
              type="submit"
              disabled={isLoading || !draft.trim() || !currentBookName}
            >
              {isLoading ? 'Thinking...' : 'Ask'}
            </button>
          </div>
        </form>
      </div>
    </div>
  );
}
