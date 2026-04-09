'use client';

import Link from 'next/link';
import { useSearchParams } from 'next/navigation';
import { useEffect, useRef, useState } from 'react';

function safeReaderReturnHref(raw: string | null): string {
  if (!raw || typeof raw !== 'string') return '/app';
  const t = raw.trim();
  if (!t.startsWith('/') || t.startsWith('//')) return '/app';
  if (t.length > 2048) return '/app';
  try {
    const u = new URL(t, 'http://reader.local');
    if (u.pathname !== '/app') return '/app';
    return `${u.pathname}${u.search}`;
  } catch {
    return '/app';
  }
}

type Reference = {
  commentary_id: number;
  book_number: number;
  book_name: string;
  chapter: number;
};

type EntityPayload = {
  kind: string;
  slug: string;
  label: string;
  references: Reference[];
};

type AIMessage = { role: 'user' | 'assistant'; content: string };

const KIND_META: Record<string, { label: string; bankPath: string; color: string }> = {
  theme:  { label: 'Theme',    bankPath: '/themes/bank',  color: 'theme'  },
  person: { label: 'Person',   bankPath: '/people/bank',  color: 'person' },
  place:  { label: 'Place',    bankPath: '/places/bank',  color: 'place'  },
};

function buildDescriptionPrompt(kind: string, label: string): string {
  if (kind === 'theme') {
    return `In 3–4 sentences, explain the biblical theme of "${label}": what it means in Scripture, how it develops across the Old and New Testaments, and why it matters for understanding the Christian faith. Write in flowing prose — do not list verse citations like "Romans 3:23" in the text. Be specific and substantive.`;
  }
  if (kind === 'person') {
    return `In 4–6 sentences, describe who ${label} is in the Bible. Include a brief historical timeline in prose: their background, the major events they are involved in in chronological flow, and how their role or significance develops over time. End with why they matter to the biblical story. Write in flowing prose without listing verse citations like "Genesis 12:1" in the text.`;
  }
  return `In 4–6 sentences, describe ${label} as a biblical place. Cover where it is, what key events happened there, and how its role changes across Scripture when relevant (for example, Jerusalem in David's era compared with Jerusalem in the Gospels). Briefly narrate that progression so the reader gets a mini-history of what happened to the place and why it matters in the biblical story. Write in flowing prose without listing verse citations like "Genesis 12:1" in the text.`;
}

export default function SummaryEntityPage({
  kind,
  slug,
}: {
  kind: 'theme' | 'person' | 'place';
  slug: string;
}) {
  const searchParams = useSearchParams();
  const readerBackHref = safeReaderReturnHref(searchParams.get('returnTo'));
  const [data, setData] = useState<EntityPayload | null>(null);
  const [error, setError] = useState(false);

  // Description (AI-generated on load)
  const [description, setDescription] = useState('');
  const [descLoading, setDescLoading] = useState(false);

  // AI chat
  const [history, setHistory] = useState<AIMessage[]>([]);
  const [chatInput, setChatInput] = useState('');
  const [chatLoading, setChatLoading] = useState(false);
  const [chatError, setChatError] = useState('');
  const [chatOpen, setChatOpen] = useState(false);
  const chatBottomRef = useRef<HTMLDivElement>(null);
  const inputRef = useRef<HTMLTextAreaElement>(null);

  const meta = KIND_META[kind] ?? KIND_META.theme;

  useEffect(() => {
    let cancelled = false;
    setData(null);
    setError(false);
    setDescription('');
    setHistory([]);
    setChatOpen(false);
    fetch(`/api/v1/summary-entities/${kind}/${encodeURIComponent(slug)}`)
      .then((r) => {
        if (!r.ok) throw new Error('not found');
        return r.json() as Promise<EntityPayload>;
      })
      .then((j) => {
        if (!cancelled) {
          setData(j);
          loadDescription(j.label, j.references, cancelled);
        }
      })
      .catch(() => {
        if (!cancelled) setError(true);
      });
    return () => { cancelled = true; };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [kind, slug]);

  function loadDescription(label: string, refs: Reference[], cancelled: boolean) {
    if (cancelled) return;
    const firstRef = refs[0];
    const ctx = firstRef
      ? { book: firstRef.book_name, chapter: firstRef.chapter, translation: 'WEB' }
      : { book: 'Genesis', chapter: 1, translation: 'WEB' };
    setDescLoading(true);
    fetch('/api/v1/ai/chat', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        message: buildDescriptionPrompt(kind, label),
        context: ctx,
        personality: 'jessica',
        conversation_history: [],
      }),
    })
      .then((r) => r.json())
      .then((j) => {
        if (!cancelled && j?.message) setDescription(j.message);
      })
      .catch(() => {/* silently skip */})
      .finally(() => { if (!cancelled) setDescLoading(false); });
  }

  useEffect(() => {
    chatBottomRef.current?.scrollIntoView({ behavior: 'smooth' });
  }, [history, chatLoading]);

  async function sendChat(e: React.FormEvent) {
    e.preventDefault();
    const msg = chatInput.trim();
    if (!msg || chatLoading || !data) return;
    const firstRef = data.references[0];
    const ctx = firstRef
      ? { book: firstRef.book_name, chapter: firstRef.chapter, translation: 'WEB' }
      : { book: 'Genesis', chapter: 1, translation: 'WEB' };
    const newHistory: AIMessage[] = [...history, { role: 'user', content: msg }];
    setHistory(newHistory);
    setChatInput('');
    setChatError('');
    setChatLoading(true);
    try {
      const r = await fetch('/api/v1/ai/chat', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          message: msg,
          context: ctx,
          personality: 'jessica',
          conversation_history: history.map(h => ({ role: h.role, content: h.content })),
        }),
      });
      const j = await r.json().catch(() => null);
      if (!r.ok || !j?.message) throw new Error(j?.detail || 'AI unavailable');
      setHistory(prev => [...prev, { role: 'assistant', content: j.message }]);
    } catch (err) {
      setChatError((err as Error).message || 'Something went wrong.');
    } finally {
      setChatLoading(false);
    }
  }

  const title = meta.label;

  // Group references by book
  const refsByBook: Record<string, Reference[]> = {};
  for (const r of (data?.references ?? [])) {
    (refsByBook[r.book_name] ??= []).push(r);
  }

  return (
    <div className={`entity-page entity-page--${kind}`}>
    <div className="entity-page-inner">
      <header className="entity-page-header">
        <div className="entity-page-nav">
          <Link href={readerBackHref} className="entity-page-back">← Reader</Link>
          <Link href={meta.bankPath} className="entity-page-bank-link">All {title}s</Link>
        </div>
        <div className="entity-page-kind-badge" data-kind={kind}>{title}</div>
        <h1 className="entity-page-title">
          {data ? data.label : error ? 'Not found' : '…'}
        </h1>
        {data && data.references.length > 0 && (
          <div className="entity-page-ref-count">
            Appears in {data.references.length} chapter{data.references.length !== 1 ? 's' : ''}
          </div>
        )}
      </header>

      {error && <p className="entity-page-error">This {title.toLowerCase()} could not be loaded.</p>}

      {data && (
        <>
          {/* Description */}
          <section className="entity-page-section entity-page-desc-section">
            <div className="entity-page-subheading">{kind === 'theme' ? 'Overview' : 'Overview & Timeline'}</div>
            {descLoading && !description ? (
              <div className="entity-desc-loading">
                <span className="spinner" />
                <span>Loading overview…</span>
              </div>
            ) : description ? (
              <p className="entity-desc-text">{description}</p>
            ) : null}
          </section>

          {/* AI Chat */}
          <section className="entity-page-section entity-chat-section">
            <button
              className="entity-chat-toggle"
              onClick={() => { setChatOpen(o => !o); setTimeout(() => inputRef.current?.focus(), 100); }}
            >
              <span className="entity-chat-toggle-icon">{chatOpen ? '▾' : '▸'}</span>
              Ask AI about {data.label}
            </button>
            {chatOpen && (
              <div className="entity-chat-body">
                {history.length === 0 && !chatLoading && (
                  <div className="entity-chat-suggestions">
                    {[
                      `What does ${data.label} mean in the Bible?`,
                      `How does ${data.label} relate to Jesus?`,
                      `Give me a key verse about ${data.label}.`,
                    ].map((q, i) => (
                      <button
                        key={i}
                        className="entity-chat-suggestion"
                        onClick={() => { setChatInput(q); inputRef.current?.focus(); }}
                      >
                        {q}
                      </button>
                    ))}
                  </div>
                )}
                {history.length > 0 && (
                  <div className="entity-chat-transcript">
                    {history.map((m, i) => (
                      <div key={i} className={`entity-chat-msg entity-chat-msg--${m.role}`}>
                        <div className="entity-chat-msg-content">{m.content}</div>
                      </div>
                    ))}
                    {chatLoading && (
                      <div className="entity-chat-msg entity-chat-msg--assistant">
                        <div className="entity-chat-msg-content entity-chat-thinking">
                          <span className="spinner" />
                        </div>
                      </div>
                    )}
                    <div ref={chatBottomRef} />
                  </div>
                )}
                {chatError && <div className="entity-chat-error">{chatError}</div>}
                <form className="entity-chat-form" onSubmit={sendChat}>
                  <textarea
                    ref={inputRef}
                    className="entity-chat-input"
                    value={chatInput}
                    onChange={e => setChatInput(e.target.value)}
                    onKeyDown={e => { if (e.key === 'Enter' && !e.shiftKey) { e.preventDefault(); void sendChat(e as unknown as React.FormEvent); } }}
                    placeholder={`Ask about ${data.label}…`}
                    rows={2}
                    maxLength={1500}
                    disabled={chatLoading}
                  />
                  <button
                    type="submit"
                    className="entity-chat-send"
                    disabled={chatLoading || !chatInput.trim()}
                  >
                    Send
                  </button>
                </form>
              </div>
            )}
          </section>

          {/* References at bottom */}
          {data.references.length > 0 && (
            <section className="entity-page-section entity-refs-section">
              <div className="entity-page-subheading">Scripture references</div>
              <div className="entity-refs-grid">
                {Object.entries(refsByBook).map(([book, refs]) => (
                  <div key={book} className="entity-refs-book">
                    <div className="entity-refs-book-name">{book}</div>
                    <div className="entity-refs-chapters">
                      {refs.map((r) => (
                        <Link
                          key={`${r.book_number}-${r.chapter}-${r.commentary_id}`}
                          href={`/app?book=${encodeURIComponent(r.book_name)}&chapter=${r.chapter}`}
                          className="entity-ref-chip"
                        >
                          {r.chapter}
                        </Link>
                      ))}
                    </div>
                  </div>
                ))}
              </div>
            </section>
          )}
          {data.references.length === 0 && (
            <section className="entity-page-section">
              <p className="entity-page-muted">No chapter references indexed yet.</p>
            </section>
          )}
        </>
      )}
    </div>
    </div>
  );
}
