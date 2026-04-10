'use client';

import Link from 'next/link';
import { useSearchParams } from 'next/navigation';
import { useEffect, useMemo, useRef, useState } from 'react';

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

function parseChapterContext(returnTo: string | null): { book: string; chapter: number } | null {
  if (!returnTo) return null;
  try {
    const u = new URL(returnTo, 'http://reader.local');
    const book = u.searchParams.get('book');
    const chapter = parseInt(u.searchParams.get('chapter') ?? '', 10);
    if (book && chapter > 0) return { book, chapter };
  } catch {
    /* ignore */
  }
  return null;
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
  overview?: string | null;
  timeline?: { events?: unknown } | null;
};

type AIMessage = { role: 'user' | 'assistant'; content: string };
type TimelineItem = {
  era: string;
  title: string;
  summary: string;
  developments: string[];
  significance: string;
};

const KIND_META: Record<string, { label: string; bankPath: string; color: string }> = {
  theme:  { label: 'Theme',    bankPath: '/themes/bank',  color: 'theme'  },
  person: { label: 'Person',   bankPath: '/people/bank',  color: 'person' },
  place:  { label: 'Place',    bankPath: '/places/bank',  color: 'place'  },
};

/** Theme pages only: AI-generated summary when the API has no curated overview. */
function buildThemeDescriptionPrompt(label: string): string {
  return `In 3–4 sentences, explain the biblical theme of "${label}": what it means in Scripture, how it develops across the Old and New Testaments, and why it matters for understanding the Christian faith. Write in flowing prose — do not list verse citations like "Romans 3:23" in the text. Be specific and substantive.`;
}

/** Person / place page, opened from a chapter: short spotlight for that entity in that chapter only. */
function buildEntityChapterSpotlightPrompt(
  entityKind: 'person' | 'place',
  label: string,
  book: string,
  chapter: number,
): string {
  const budget =
    'Write exactly one short paragraph (at most about 150–200 tokens of text, roughly 100–120 words). '
    + 'Ground your answer in the events of that chapter only. Use flowing prose, no bullet points, no title line, no verse-reference lists.';
  if (entityKind === 'place') {
    return (
      `${budget} Describe how the place "${label}" functions in ${book} chapter ${chapter}: what happens there, who is present, and why that setting matters in the chapter’s story.`
    );
  }
  return (
    `${budget} Describe what "${label}" does in ${book} chapter ${chapter} and their significance in that chapter’s narrative.`
  );
}

type RawTimelineEvent = {
  title?: string;
  era?: string;
  period?: string;
  summary?: string;
  detail?: string;
  developments?: unknown;
  significance?: string;
};

function normalizeTimelineEventObjects(raw: RawTimelineEvent[], maxItems: number): TimelineItem[] {
  return raw
    .map((e) => ({
      era: (e.era ?? e.period ?? '').trim(),
      title: (e.title ?? '').trim(),
      summary: (e.summary ?? e.detail ?? '').trim(),
      developments: (Array.isArray(e.developments) ? e.developments : [])
        .map((d) => (typeof d === 'string' ? d.trim() : ''))
        .filter(Boolean)
        .slice(0, 5),
      significance: (e.significance ?? '').trim(),
    }))
    .filter((e) => e.title && e.summary)
    .slice(0, maxItems);
}

function timelineFromApiPayload(timeline: unknown): TimelineItem[] {
  if (!timeline || typeof timeline !== 'object') return [];
  const ev = (timeline as { events?: unknown }).events;
  if (!Array.isArray(ev) || ev.length === 0) return [];
  return normalizeTimelineEventObjects(ev as RawTimelineEvent[], 14);
}

// ── Vertical Timeline Component ───────────────────────────────────────────────

function VerticalTimeline({
  timeline,
}: {
  timeline: TimelineItem[];
}) {
  const [openItems, setOpenItems] = useState<Record<number, boolean>>({});

  function toggleOpen(idx: number) {
    setOpenItems((prev) => ({ ...prev, [idx]: !prev[idx] }));
  }

  return (
    <div className="htl htl--vertical htl--centered" aria-label="Chronological timeline">
      <div className="htl-center-line" aria-hidden />
      {timeline.map((item, idx) => (
        <div className={`htl-c-row ${idx % 2 === 0 ? 'is-left' : 'is-right'}`} key={`${item.title}-${idx}`}>
          <div className="htl-c-panel">
            <button
              type="button"
              className="htl-c-toggle"
              onClick={() => toggleOpen(idx)}
              aria-expanded={!!openItems[idx]}
              aria-controls={`milestone-panel-${idx}`}
            >
              <span className="htl-c-milestone">Milestone {idx + 1}</span>
              <span className="htl-c-era">{item.era || 'Scripture context'}</span>
            </button>
            {!!openItems[idx] && (
              <div id={`milestone-panel-${idx}`} className="htl-v-content">
                <div className="htl-detail-title">{item.title}</div>
                <p className="htl-detail-summary">{item.summary}</p>
                {item.developments.length > 0 && (
                  <ul className="htl-detail-points">
                    {item.developments.map((pt, i) => (
                      <li key={i}>{pt}</li>
                    ))}
                  </ul>
                )}
                {item.significance && (
                  <p className="htl-detail-significance">{item.significance}</p>
                )}
              </div>
            )}
          </div>
          <button
            type="button"
            className={`htl-c-dot${openItems[idx] ? ' is-open' : ''}`}
            onClick={() => toggleOpen(idx)}
            aria-label={`Toggle milestone ${idx + 1}`}
            aria-expanded={!!openItems[idx]}
            aria-controls={`milestone-panel-${idx}`}
          />
          <div className="htl-c-gap" aria-hidden />
        </div>
      ))}
    </div>
  );
}

// ── Main Page ─────────────────────────────────────────────────────────────────

export default function SummaryEntityPage({
  kind,
  slug,
}: {
  kind: 'theme' | 'person' | 'place';
  slug: string;
}) {
  const searchParams = useSearchParams();
  const returnToRaw = searchParams.get('returnTo');
  const readerBackHref = safeReaderReturnHref(returnToRaw);
  const chapterCtx = useMemo(() => parseChapterContext(returnToRaw), [returnToRaw]);

  const [data, setData] = useState<EntityPayload | null>(null);
  const [error, setError] = useState(false);

  // Theme only: AI-generated summary when API has no curated overview
  const [description, setDescription] = useState('');
  const [descLoading, setDescLoading] = useState(false);

  // Person / place: AI “opened from chapter” spotlight (when navigated from reader with returnTo)
  const [chapterSpotlightBlurb, setChapterSpotlightBlurb] = useState('');
  const [chapterSpotlightLoading, setChapterSpotlightLoading] = useState(false);

  // Person / place: curated timeline from Supabase (same GET as overview)
  const [timeline, setTimeline] = useState<TimelineItem[]>([]);

  // Theme only: Ask AI
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
    setChapterSpotlightBlurb('');
    setChapterSpotlightLoading(false);
    setTimeline([]);
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
          const isPersonOrPlace = kind === 'person' || kind === 'place';

          if (isPersonOrPlace) {
            const overview = typeof j.overview === 'string' ? j.overview.trim() : '';
            setDescription(overview);
            setDescLoading(false);
            setTimeline(timelineFromApiPayload(j.timeline ?? null));
            return;
          }

          const hasOverview = typeof j.overview === 'string' && j.overview.trim().length > 0;
          if (hasOverview) {
            setDescription(j.overview!.trim());
            setDescLoading(false);
          } else {
            loadThemeDescription(j.label, cancelled);
          }
        }
      })
      .catch(() => {
        if (!cancelled) setError(true);
      });
    return () => { cancelled = true; };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [kind, slug]);

  useEffect(() => {
    const isSpotlightKind = kind === 'person' || kind === 'place';
    if (!isSpotlightKind || !chapterCtx || !data) {
      setChapterSpotlightBlurb('');
      setChapterSpotlightLoading(false);
      return;
    }
    let cancelled = false;
    setChapterSpotlightBlurb('');
    setChapterSpotlightLoading(true);
    const { book, chapter } = chapterCtx;
    fetch('/api/v1/ai/entity-content', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        prompt: buildEntityChapterSpotlightPrompt(kind, data.label, book, chapter),
        max_tokens: 200,
      }),
    })
      .then((r) => r.json())
      .then((j) => {
        if (!cancelled && typeof j?.content === 'string' && j.content.trim()) {
          setChapterSpotlightBlurb(j.content.trim());
        }
      })
      .catch(() => {/* leave empty; UI falls back */})
      .finally(() => {
        if (!cancelled) setChapterSpotlightLoading(false);
      });
    return () => {
      cancelled = true;
    };
  }, [kind, data, chapterCtx]);

  function loadThemeDescription(label: string, cancelled: boolean) {
    if (cancelled) return;
    setDescLoading(true);
    fetch('/api/v1/ai/entity-content', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        prompt: buildThemeDescriptionPrompt(label),
        max_tokens: 500,
      }),
    })
      .then((r) => r.json())
      .then((j) => { if (!cancelled && j?.content) setDescription(j.content); })
      .catch(() => {/* silently skip */})
      .finally(() => { if (!cancelled) setDescLoading(false); });
  }

  useEffect(() => {
    if (kind !== 'theme') return;
    chatBottomRef.current?.scrollIntoView({ behavior: 'smooth' });
  }, [kind, history, chatLoading]);

  async function sendChat(e: React.SyntheticEvent) {
    e.preventDefault();
    if (kind !== 'theme') return;
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

  const refsByBook = useMemo(() => {
    const m: Record<string, Reference[]> = {};
    for (const r of data?.references ?? []) {
      (m[r.book_name] ??= []).push(r);
    }
    return m;
  }, [data?.references]);

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
          {/* Chapter-specific contribution — shown only when navigating from a chapter */}
          {chapterCtx && (kind === 'person' || kind === 'place') && (
            <section className="entity-page-section entity-chapter-section">
              <div className="entity-chapter-context-label">
                Opened from {chapterCtx.book} {chapterCtx.chapter}
              </div>
              <>
                {chapterSpotlightLoading && !chapterSpotlightBlurb && (
                  <div className="entity-desc-loading entity-chapter-spotlight-loading">
                    <span className="spinner" />
                    <span>Generating chapter summary…</span>
                  </div>
                )}
                {chapterSpotlightBlurb && (
                  <p className="entity-desc-text entity-chapter-spotlight-text">{chapterSpotlightBlurb}</p>
                )}
                {!chapterSpotlightLoading && !chapterSpotlightBlurb && (
                  <p className="entity-page-muted">
                    Use the overview and Scripture references on this page to study passages where {data.label} appears.
                  </p>
                )}
              </>
            </section>
          )}

          {/* Overall description */}
          <section className="entity-page-section entity-page-desc-section">
            <div className="entity-page-subheading">
              {chapterCtx && (kind === 'person' || kind === 'place') ? `About ${data.label}` : 'Summary'}
            </div>
            {descLoading && !description ? (
              <div className="entity-desc-loading">
                <span className="spinner" />
                <span>{kind === 'theme' ? 'Loading summary…' : 'Loading…'}</span>
              </div>
            ) : description ? (
              <p className="entity-desc-text">{description}</p>
            ) : (kind === 'person' || kind === 'place') ? (
              <p className="entity-page-muted">No overview is stored for this entry yet.</p>
            ) : null}
          </section>

          {/* Vertical Timeline */}
          {(kind === 'person' || kind === 'place') && (
            <section className="entity-page-section entity-timeline-section">
              <div className="entity-page-subheading">Timeline</div>
              {timeline.length === 0 && (
                <p className="entity-page-muted">No timeline is stored for this entry yet.</p>
              )}
              {timeline.length > 0 && (
                <VerticalTimeline timeline={timeline} />
              )}
            </section>
          )}

          {/* AI Chat — theme pages only; person/place use Supabase-backed content */}
          {kind === 'theme' && (
            <section className="entity-page-section entity-chat-section">
              <button
                type="button"
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
                          type="button"
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
                      onKeyDown={e => { if (e.key === 'Enter' && !e.shiftKey) { e.preventDefault(); void sendChat(e as unknown as React.SyntheticEvent); } }}
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
          )}

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
