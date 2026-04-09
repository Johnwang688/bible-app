'use client';

import { useCallback, useEffect, useLayoutEffect, useMemo, useRef, useState } from 'react';

import {
  parseReferenceLabel,
  segmentTextWithScriptureRefs,
  sortBookNamesForMatching,
} from '@/lib/scriptureReference';
import { STORAGE_KEYS } from '@/lib/storageKeys';

const AI_SIDEBAR_STORAGE_KEY = STORAGE_KEYS.AI_SIDEBAR;
/** Persisted assistant personality id (`jessica` | `john` | `girl2` | `boy2`). */
export const AI_PERSONALITY_STORAGE_KEY = STORAGE_KEYS.AI_PERSONALITY;
const LEGACY_SIDEBAR_SESSION_KEY = 'logoslight-ai-sidebar-v1';
const LEGACY_PERSONALITY_KEY = 'logoslight-ai-personality-v1';
const COMPOSER_MAX_HEIGHT_PX = 168;

interface AIStoredSidebarState {
  entries: AITranscriptEntry[];
  draft: string;
}

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
  /** Static image under `public/` (e.g. `/avatars/name.png`). When set, replaces the SVG face. */
  avatarImageSrc?: string;
}

const OPENBIBLE_LOGO_AVATAR = '/logo/openbible-logo.png';

export const PERSONALITIES: Personality[] = [
  {
    id: 'jessica',
    name: 'Jessica',
    tagline: 'Warm & casual',
    avatarBg: '#c07858',
    avatarInner: '#e8a880',
    avatarImageSrc: OPENBIBLE_LOGO_AVATAR,
  },
  {
    id: 'john',
    name: 'John',
    tagline: 'Direct & grounded',
    avatarBg: '#4878a0',
    avatarInner: '#80b0d0',
    avatarImageSrc: OPENBIBLE_LOGO_AVATAR,
  },
  {
    id: 'girl2',
    name: 'Girl 2',
    tagline: 'Heart-focused',
    avatarBg: '#8858a8',
    avatarInner: '#c090d8',
    avatarImageSrc: OPENBIBLE_LOGO_AVATAR,
  },
  {
    id: 'boy2',
    name: 'Boy 2',
    tagline: 'Classic & wise',
    avatarBg: '#7a6038',
    avatarInner: '#b89058',
    avatarImageSrc: OPENBIBLE_LOGO_AVATAR,
  },
];

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
  /** Fired once when the user sends a message to the assistant (daily task / analytics). */
  onUserMessageSent?: () => void;
}

// ─── Helpers ─────────────────────────────────────────────────────────────────

function createId(prefix: string) {
  if (typeof crypto !== 'undefined' && typeof crypto.randomUUID === 'function') {
    return `${prefix}-${crypto.randomUUID()}`;
  }
  return `${prefix}-${Date.now()}-${Math.random().toString(36).slice(2, 8)}`;
}

function normalizeBookName(book: string) {
  return book.trim().toLowerCase().replace(/\s+/g, ' ');
}

function formatReferencePillLabel(
  reference: string,
  nav: { book: string; chapter: number; verse_start?: number; verse_end?: number } | null,
  currentBookName: string | null,
  currentChapter: number,
) {
  if (!nav) return reference;
  const start = nav.verse_start;
  const end = nav.verse_end ?? start;
  const versePart =
    start == null
      ? ''
      : end != null && end !== start
        ? `${start}-${end}`
        : `${start}`;
  const isSameChapter =
    currentBookName != null &&
    normalizeBookName(nav.book) === normalizeBookName(currentBookName) &&
    nav.chapter === currentChapter;
  if (isSameChapter && versePart) return `v${versePart}`;
  return versePart ? `${nav.book} ${nav.chapter}:${versePart}` : `${nav.book} ${nav.chapter}`;
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

function isTranscriptEntry(value: unknown): value is AITranscriptEntry {
  if (!value || typeof value !== 'object') return false;
  const entry = value as Partial<AITranscriptEntry>;
  if (typeof entry.id !== 'string' || typeof entry.kind !== 'string') return false;
  if (entry.kind === 'context') return typeof (entry as Partial<AIContextEntry>).label === 'string';
  if (entry.kind === 'user') return typeof (entry as Partial<AIUserEntry>).content === 'string';
  if (entry.kind === 'assistant') {
    const assistant = entry as Partial<AIAssistantEntry>;
    return (
      typeof assistant.content === 'string' &&
      Array.isArray(assistant.references) &&
      Array.isArray(assistant.actions) &&
      Array.isArray(assistant.suggestedFollowUps) &&
      typeof assistant.contextLabel === 'string'
    );
  }
  return false;
}

function normalizeStoredSidebarState(value: unknown): AIStoredSidebarState {
  if (Array.isArray(value)) {
    return {
      entries: value.filter(isTranscriptEntry),
      draft: '',
    };
  }
  if (!value || typeof value !== 'object') {
    return { entries: [], draft: '' };
  }
  const stored = value as Partial<AIStoredSidebarState>;
  return {
    entries: Array.isArray(stored.entries) ? stored.entries.filter(isTranscriptEntry) : [],
    draft: typeof stored.draft === 'string' ? stored.draft.slice(0, MAX_MESSAGE_CHARS) : '',
  };
}

function restoreSidebarState(): AIStoredSidebarState {
  if (typeof window === 'undefined') return { entries: [], draft: '' };
  removeLegacyAiStorageKeys();
  try {
    const localRaw = window.localStorage.getItem(AI_SIDEBAR_STORAGE_KEY);
    if (localRaw) {
      return normalizeStoredSidebarState(JSON.parse(localRaw));
    }

    const sessionRaw = window.sessionStorage.getItem(AI_SIDEBAR_STORAGE_KEY);
    if (sessionRaw) {
      const restored = normalizeStoredSidebarState(JSON.parse(sessionRaw));
      window.localStorage.setItem(AI_SIDEBAR_STORAGE_KEY, JSON.stringify(restored));
      window.sessionStorage.removeItem(AI_SIDEBAR_STORAGE_KEY);
      return restored;
    }

    return { entries: [], draft: '' };
  } catch {
    return { entries: [], draft: '' };
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

function AgentAvatar({ personality, isLoading }: { personality: Personality; isLoading: boolean }) {
  const bg = personality.avatarBg;
  const inner = personality.avatarInner;
  const photoSrc = personality.avatarImageSrc;

  if (photoSrc) {
    return (
      <div className={`ai-avatar${isLoading ? ' ai-avatar-loading' : ' ai-avatar-idle'}`} aria-hidden="true">
        <img className="ai-avatar-photo" src={photoSrc} alt="" width={40} height={40} decoding="async" />
      </div>
    );
  }

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
  currentBookName,
  currentChapter,
}: {
  text: string;
  bookNamesSorted: string[];
  onNavigate: (params: AIActionParams) => void;
  currentBookName: string | null;
  currentChapter: number;
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
            className="summary-tag ai-inline-scripture-pill"
            onClick={() =>
              onNavigate({
                book: seg.book,
                chapter: seg.chapter,
                verse_start: seg.verse_start,
                verse_end: seg.verse_end,
              })
            }
          >
            {formatReferencePillLabel(
              seg.text,
              { book: seg.book, chapter: seg.chapter, verse_start: seg.verse_start, verse_end: seg.verse_end },
              currentBookName,
              currentChapter,
            )}
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
  currentBookName,
  currentChapter,
}: {
  text: string;
  animate: boolean;
  bookNamesSorted: string[];
  onNavigate: (params: AIActionParams) => void;
  currentBookName: string | null;
  currentChapter: number;
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
        currentBookName={currentBookName}
        currentChapter={currentChapter}
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
  onUserMessageSent,
}: AiSidebarProps) {
  const [entries, setEntries] = useState<AITranscriptEntry[]>(() => restoreSidebarState().entries);
  const [draft, setDraft] = useState<string>(() => restoreSidebarState().draft);
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [thinkingVerbIndex, setThinkingVerbIndex] = useState(0);

  const personality = PERSONALITIES.find(p => p.id === personalityId) ?? PERSONALITIES[0];
  const composerTextareaRef = useRef<HTMLTextAreaElement | null>(null);

  const bibleBookNames = useMemo(() => bibleBooks.map(b => b.name), [bibleBooks]);
  const bookNamesSorted = useMemo(() => sortBookNamesForMatching(bibleBookNames), [bibleBookNames]);

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

  const resizeComposerTextarea = useCallback(() => {
    const el = composerTextareaRef.current;
    if (!el) return;

    el.style.height = '0px';
    const nextHeight = Math.min(el.scrollHeight, COMPOSER_MAX_HEIGHT_PX);
    el.style.height = `${nextHeight}px`;
    el.style.overflowY = el.scrollHeight > COMPOSER_MAX_HEIGHT_PX ? 'auto' : 'hidden';
  }, []);

  useLayoutEffect(() => {
    resizeComposerTextarea();
  }, [draft, resizeComposerTextarea]);

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

  // Persist transcript and draft locally so accidental tab/app closes can recover the latest chat.
  useEffect(() => {
    if (typeof window === 'undefined') return;
    window.localStorage.setItem(AI_SIDEBAR_STORAGE_KEY, JSON.stringify({ entries, draft } satisfies AIStoredSidebarState));
  }, [entries, draft]);

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
    onUserMessageSent?.();

    try {
      const response = await fetch('/api/v1/ai/chat', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          message,
          context: { book: currentBookName, chapter, translation },
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

  function handleClearChat() {
    if (isLoading) return;
    newestAssistantId.current = null;
    assistantReplyTopRef.current = null;
    setAnimatedIds(new Set());
    setEntries([]);
    setDraft('');
    setError(null);
    if (typeof window !== 'undefined') {
      window.localStorage.removeItem(AI_SIDEBAR_STORAGE_KEY);
      window.sessionStorage.removeItem(AI_SIDEBAR_STORAGE_KEY);
    }
    requestAnimationFrame(() => {
      composerTextareaRef.current?.focus();
    });
  }

  return (
    <div className="ai-workspace">
      <div className="ai-thread">

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
                  currentBookName={currentBookName}
                  currentChapter={chapter}
                />
              </div>
              {entry.references.length > 0 && (
                <div className="summary-tags ai-citation-row">
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
                          {formatReferencePillLabel(reference, nav, currentBookName, chapter)}
                        </button>
                      );
                    }
                    return (
                      <span key={`${entry.id}-${reference}`} className="summary-tag ai-citation-pill">
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
          <div className="ai-composer-field">
            <textarea
              ref={composerTextareaRef}
              className="ai-composer-input"
              value={draft}
              rows={1}
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
            <button
              className="ai-send-btn"
              type="submit"
              aria-label={isLoading ? 'Thinking...' : 'Send message'}
              disabled={isLoading || !draft.trim() || !currentBookName}
            >
              <svg viewBox="0 0 20 20" aria-hidden="true" focusable="false">
                <path
                  d="M10 15V5M10 5L5.75 9.25M10 5l4.25 4.25"
                  fill="none"
                  stroke="currentColor"
                  strokeWidth="2"
                  strokeLinecap="round"
                  strokeLinejoin="round"
                />
              </svg>
            </button>
          </div>
          <div className="ai-composer-footer">
            <button
              className="ai-clear-chat-btn"
              type="button"
              onClick={handleClearChat}
              disabled={isLoading || (entries.length === 0 && !draft.trim() && !error)}
            >
              New chat
            </button>
            <span className={`ai-char-count${remainingChars < 120 ? ' warning' : ''}`}>
              {remainingChars} characters left
            </span>
          </div>
        </form>
      </div>
    </div>
  );
}
