'use client';

import type { FormEvent } from 'react';
import { useEffect, useRef, useState } from 'react';

const SESSION_KEY = 'logoslight-ai-sidebar-v1';
const MAX_MESSAGE_CHARS = 1500;

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
  /** Text sent to the API and stored in conversation history. */
  content: string;
  /** If set, shown in the transcript instead of `content` (e.g. original suggestion label). */
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

interface AiSidebarProps {
  currentBookName: string | null;
  chapter: number;
  translation: string;
  onNavigate: (params: AIActionParams) => void;
  onOpenCommentary: (source?: string) => void;
}

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
    `What should I pay attention to in ${book} ${chapter}?`,
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

export default function AiSidebar({
  currentBookName,
  chapter,
  translation,
  onNavigate,
  onOpenCommentary,
}: AiSidebarProps) {
  const [entries, setEntries] = useState<AITranscriptEntry[]>([]);
  const [draft, setDraft] = useState('');
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const endRef = useRef<HTMLDivElement | null>(null);
  const lastContextRef = useRef<string>('');
  const currentContextLabel = getContextLabel(currentBookName, chapter, translation);
  const starterPrompts = getStarterPrompts(currentBookName, chapter);
  const remainingChars = MAX_MESSAGE_CHARS - draft.length;

  useEffect(() => {
    setEntries(restoreTranscript());
  }, []);

  useEffect(() => {
    if (typeof window === 'undefined') return;
    window.sessionStorage.setItem(SESSION_KEY, JSON.stringify(entries));
  }, [entries]);

  useEffect(() => {
    endRef.current?.scrollIntoView({ block: 'end' });
  }, [entries, isLoading, error]);

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
          context: {
            book: currentBookName,
            chapter,
            translation,
          },
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
      setEntries(prev => [...prev, assistantEntry]);
    } catch (caught) {
      const messageText = caught instanceof Error ? caught.message : 'The AI assistant could not answer right now.';
      setError(messageText);
    } finally {
      setIsLoading(false);
    }
  }

  function handleSubmit(event: FormEvent<HTMLFormElement>) {
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
        <div className="ai-context-card">
          <div className="ai-context-label">Study Workspace</div>
          <div className="ai-context-row">
            <span className="ai-context-pill">{currentContextLabel || 'Loading context...'}</span>
          </div>
        </div>

        {entries.length === 0 && !isLoading && (
          <section className="ai-empty-state">
            <div className="ai-empty-title">Ask about the chapter you are reading.</div>
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

          return (
            <article key={entry.id} className="ai-message ai-message-assistant">
              <div className="ai-message-label">AI</div>
              <div className="ai-message-body">{entry.content}</div>
              {entry.references.length > 0 && (
                <div className="ai-chip-row">
                  {entry.references.map(reference => (
                    <span key={`${entry.id}-${reference}`} className="ai-chip">
                      {reference}
                    </span>
                  ))}
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

        {isLoading && (
          <article className="ai-message ai-message-assistant ai-message-loading">
            <div className="ai-message-label">AI</div>
            <div className="ai-message-body">Checking the passage against Scripture...</div>
          </article>
        )}

        {error && <div className="ai-error-card">{error}</div>}
        <div ref={endRef} />
      </div>

      <div className="ai-composer-shell">
        <form className="ai-composer" onSubmit={handleSubmit}>
          <textarea
            className="ai-composer-input"
            value={draft}
            rows={3}
            maxLength={MAX_MESSAGE_CHARS}
            placeholder={
              currentBookName
                ? `Ask about ${currentBookName} ${chapter}...`
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
              {isLoading ? 'Thinking...' : 'Ask AI'}
            </button>
          </div>
        </form>
      </div>
    </div>
  );
}
