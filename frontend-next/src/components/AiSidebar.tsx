'use client';

import { useCallback, useEffect, useMemo, useRef, useState } from 'react';

import {
  parseReferenceLabel,
  segmentTextWithScriptureRefs,
  sortBookNamesForMatching,
} from '@/lib/scriptureReference';

const MAX_ADDITIONAL_CHAPTERS = 3;
const SESSION_KEY = 'logoslight-ai-sidebar-v1';
const PERSONALITY_KEY = 'logoslight-ai-personality-v1';
const MAX_MESSAGE_CHARS = 1500;
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
  { id: 'noah',    name: 'Noah',    tagline: 'Direct & grounded', avatarBg: '#4878a0', avatarInner: '#80b0d0' },
  { id: 'lydia',   name: 'Lydia',   tagline: 'Heart-focused',     avatarBg: '#8858a8', avatarInner: '#c090d8' },
  { id: 'eli',     name: 'Eli',     tagline: 'Classic & wise',    avatarBg: '#7a6038', avatarInner: '#b89058' },
];

const JESSICA_THEME = PERSONALITIES.find(p => p.id === 'jessica')!;

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
  /** Canonical Bible book names from `/api/v1/books` (any order). Used to parse reference chips and links. */
  bibleBookNames: string[];
  onNavigate: (params: AIActionParams) => void;
  onOpenCommentary: (source?: string) => void;
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
  try {
    const raw = window.sessionStorage.getItem(SESSION_KEY);
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
  try {
    const stored = window.localStorage.getItem(PERSONALITY_KEY);
    return PERSONALITIES.some(p => p.id === stored) ? stored! : 'jessica';
  } catch {
    return 'jessica';
  }
}

// ─── Jessica avatar (warm bunny — same viewBox / stack as AgentAvatar) ───────

function JessicaAvatar({ isLoading }: { isLoading: boolean }) {
  const bg = JESSICA_THEME.avatarBg;
  const inner = JESSICA_THEME.avatarInner;
  return (
    <div className={`ai-avatar${isLoading ? ' ai-avatar-loading' : ' ai-avatar-idle'}`} aria-hidden="true">
      <svg viewBox="0 0 60 70" xmlns="http://www.w3.org/2000/svg" width="40" height="40">
        {/* Soft bunny ears — terracotta outer, peach inner */}
        <ellipse cx="15" cy="21" rx="9" ry="15" fill={bg} />
        <ellipse cx="15" cy="22" rx="5" ry="10" fill="#fce8dc" opacity="0.95" />
        <ellipse cx="45" cy="21" rx="9" ry="15" fill={bg} />
        <ellipse cx="45" cy="22" rx="5" ry="10" fill="#fce8dc" opacity="0.95" />
        {/* Tiny bow between the ears */}
        <ellipse cx="25.5" cy="14.5" rx="5" ry="3.6" fill="#e85d75" transform="rotate(-18 25.5 14.5)" />
        <ellipse cx="34.5" cy="14.5" rx="5" ry="3.6" fill="#e85d75" transform="rotate(18 34.5 14.5)" />
        <circle cx="30" cy="14.5" r="2.2" fill={bg} />
        {/* Rounded face */}
        <ellipse cx="30" cy="44" rx="23" ry="20" fill={inner} />
        {/* Rosy cheeks + light freckles (casual warmth) */}
        <ellipse cx="10" cy="46" rx="6.5" ry="4" fill="#e86060" opacity="0.24" />
        <ellipse cx="50" cy="46" rx="6.5" ry="4" fill="#e86060" opacity="0.24" />
        <circle cx="12" cy="44" r="1" fill={bg} opacity="0.28" />
        <circle cx="9.5" cy="46.5" r="0.9" fill={bg} opacity="0.28" />
        <circle cx="48" cy="44" r="1" fill={bg} opacity="0.28" />
        <circle cx="50.5" cy="46.5" r="0.9" fill={bg} opacity="0.28" />
        {isLoading ? (
          <>
            {/* Thinking: uneven brows + mismatched eyes + wavy unsure mouth */}
            <path
              d="M 14.5 31 Q 18.5 29.5 22.5 31.5"
              stroke={bg}
              strokeWidth="1.35"
              fill="none"
              strokeLinecap="round"
              opacity="0.85"
            />
            <path
              d="M 37.5 28.5 Q 41 26.5 45.5 29"
              stroke={bg}
              strokeWidth="1.35"
              fill="none"
              strokeLinecap="round"
              opacity="0.85"
            />
            <ellipse cx="20.5" cy="39" rx="4.8" ry="5.4" fill="#1a0c08" transform="rotate(-8 20.5 39)" />
            <ellipse cx="39.5" cy="37" rx="5.5" ry="4.6" fill="#1a0c08" transform="rotate(6 39.5 37)" />
            <circle cx="21.5" cy="37.2" r="1.7" fill="white" />
            <circle cx="40.8" cy="35.5" r="1.9" fill="white" />
            <circle cx="19" cy="40.5" r="0.9" fill="white" opacity="0.45" />
            <circle cx="38" cy="38.5" r="0.85" fill="white" opacity="0.45" />
            {/* Nose */}
            <ellipse cx="30" cy="44.5" rx="2" ry="1.35" fill={bg} />
            {/* Wavy “hmm?” mouth */}
            <path
              d="M 21 51 Q 24.5 48.5 28 51 Q 31.5 53.5 35 50.5 Q 37.5 49 39 51.5"
              stroke="#1a0c08"
              strokeWidth="1.45"
              fill="none"
              strokeLinecap="round"
              strokeLinejoin="round"
            />
          </>
        ) : (
          <>
            {/* Big friendly eyes */}
            <circle cx="21" cy="38" r="5.2" fill="#1a0c08" />
            <circle cx="39" cy="38" r="5.2" fill="#1a0c08" />
            <circle cx="22.5" cy="35.8" r="2" fill="white" />
            <circle cx="40.5" cy="35.8" r="2" fill="white" />
            <circle cx="19.5" cy="40" r="1.1" fill="white" opacity="0.55" />
            <circle cx="37.5" cy="40" r="1.1" fill="white" opacity="0.55" />
            {/* Nose */}
            <ellipse cx="30" cy="44.5" rx="2" ry="1.35" fill={bg} />
            {/* Gentle smile + tiny teeth like other agents */}
            <path d="M22 50.5 Q30 59 38 50.5" stroke="#1a0c08" strokeWidth="1.5" fill="none" strokeLinecap="round" />
            <rect x="26" y="50" width="3.5" height="4" rx="0.9" fill="white" />
            <rect x="30.5" y="50" width="3.5" height="4" rx="0.9" fill="white" />
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

// ─── Main component ───────────────────────────────────────────────────────────

export default function AiSidebar({
  currentBookName,
  chapter,
  translation,
  personalityId,
  bibleBookNames,
  onNavigate,
  onOpenCommentary,
}: AiSidebarProps) {
  const [entries, setEntries] = useState<AITranscriptEntry[]>([]);
  const [draft, setDraft] = useState('');
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [thinkingVerbIndex, setThinkingVerbIndex] = useState(0);

  const personality = PERSONALITIES.find(p => p.id === personalityId) ?? PERSONALITIES[0];

  const bookNamesSorted = useMemo(() => sortBookNamesForMatching(bibleBookNames), [bibleBookNames]);

  // Additional context chapters
  const [additionalChapters, setAdditionalChapters] = useState<Array<{ book: string; chapter: number }>>([]);
  const [showAddForm, setShowAddForm] = useState(false);
  const [newBook, setNewBook] = useState('');
  const [newChapter, setNewChapter] = useState('');
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

  // Persist transcript
  useEffect(() => {
    if (typeof window === 'undefined') return;
    window.sessionStorage.setItem(SESSION_KEY, JSON.stringify(entries));
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
        el.scrollIntoView({ block: 'start', behavior: 'smooth' });
        return;
      }
      endRef.current?.scrollIntoView({ block: 'end' });
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

  function confirmAddChapter() {
    const book = newBook.trim();
    const ch = parseInt(newChapter, 10);
    if (!book || !ch || ch < 1) return;
    setAdditionalChapters(prev => [...prev, { book, chapter: ch }]);
    setNewBook('');
    setNewChapter('');
    setShowAddForm(false);
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
            <div className="ai-add-chapter-form">
              <input
                className="ai-add-chapter-input"
                type="text"
                placeholder="Book"
                value={newBook}
                onChange={e => setNewBook(e.target.value)}
                onKeyDown={e => { if (e.key === 'Enter') confirmAddChapter(); }}
              />
              <input
                className="ai-add-chapter-input ai-add-chapter-input-num"
                type="number"
                placeholder="Ch."
                min={1}
                value={newChapter}
                onChange={e => setNewChapter(e.target.value)}
                onKeyDown={e => { if (e.key === 'Enter') confirmAddChapter(); }}
              />
              <button className="ai-add-chapter-confirm" type="button" onClick={confirmAddChapter}>Add</button>
              <button className="ai-add-chapter-cancel" type="button" onClick={() => { setShowAddForm(false); setNewBook(''); setNewChapter(''); }}>Cancel</button>
            </div>
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
