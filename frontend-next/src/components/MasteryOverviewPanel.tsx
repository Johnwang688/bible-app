'use client';

import { useCallback, useEffect, useState } from 'react';
import type { AuthSession } from '@/lib/account';
import {
  getMasteryOverview,
  type MasteryBookOut,
  type MasteryOverviewOut,
  type MasterySectionOut,
  type MasteryTestamentOut,
} from '../lib/quiz';

export type MasteryOverviewPanelProps = {
  session: AuthSession | null;
  translation: string;
  /** Parent resolves book name and opens the reader. */
  onChapterSelect?: (bookNumber: number, chapter: number, translation: string) => void;
  className?: string;
};

function MasteryBar({ percent }: { percent: number }) {
  return (
    <div className="mastery-bar-wrap mastery-overview-bar">
      <div className="mastery-bar-track" aria-hidden="true">
        <div className="mastery-bar-fill" style={{ width: `${percent}%` }} />
      </div>
    </div>
  );
}

export default function MasteryOverviewPanel({
  session,
  translation,
  onChapterSelect,
  className = '',
}: MasteryOverviewPanelProps) {
  const [data, setData] = useState<MasteryOverviewOut | null>(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [otOpen, setOtOpen] = useState(false);
  const [ntOpen, setNtOpen] = useState(false);
  const [openSectionKey, setOpenSectionKey] = useState<string | null>(null);
  const [openBookKey, setOpenBookKey] = useState<string | null>(null);

  const load = useCallback(async () => {
    if (!session) return;
    setLoading(true);
    setError(null);
    try {
      const overview = await getMasteryOverview(session);
      setData(overview);
    } catch (e) {
      setData(null);
      setError(e instanceof Error ? e.message : 'Could not load mastery.');
    } finally {
      setLoading(false);
    }
  }, [session]);

  useEffect(() => {
    if (!session) {
      setData(null);
      setError(null);
      return;
    }
    void load();
  }, [session, load]);

  const toggleOt = useCallback(() => {
    setOtOpen(prev => {
      if (prev) {
        setOpenSectionKey(s => (s?.startsWith('OT:') ? null : s));
        setOpenBookKey(b => (b?.startsWith('OT:') ? null : b));
      }
      return !prev;
    });
  }, []);

  const toggleNt = useCallback(() => {
    setNtOpen(prev => {
      if (prev) {
        setOpenSectionKey(s => (s?.startsWith('NT:') ? null : s));
        setOpenBookKey(b => (b?.startsWith('NT:') ? null : b));
      }
      return !prev;
    });
  }, []);

  const toggleSection = useCallback((key: string) => {
    setOpenSectionKey(s => (s === key ? null : key));
    setOpenBookKey(null);
  }, []);

  const toggleBook = useCallback((key: string) => {
    setOpenBookKey(b => (b === key ? null : key));
  }, []);

  const handleChapterClick = useCallback(
    (bookNumber: number, chapter: number) => {
      onChapterSelect?.(bookNumber, chapter, translation);
    },
    [onChapterSelect, translation],
  );

  if (!session) {
    return (
      <div className={`mastery-overview mastery-overview--guest ${className}`.trim()}>
        <div className="reader-dashboard-label">Mastery</div>
        <p className="mastery-overview-guest-copy">
          Sign in to see your Old and New Testament quiz progress by section, book, and chapter.
        </p>
      </div>
    );
  }

  return (
    <div className={`mastery-overview ${className}`.trim()}>
      <div className="mastery-overview-header">
        <div className="reader-dashboard-label">Mastery</div>
        {error && (
          <button type="button" className="mastery-overview-retry" onClick={() => void load()}>
            Retry
          </button>
        )}
      </div>
      {loading && !data && (
        <div className="mastery-overview-loading" aria-busy="true">
          <div className="mastery-overview-skeleton" />
        </div>
      )}
      {error && !loading && <p className="mastery-overview-error">{error}</p>}
      {data && (
        <div className="mastery-overview-testaments">
          {data.testaments.map(t => (
            <TestamentBlock
              key={t.id}
              testament={t}
              expanded={t.id === 'OT' ? otOpen : ntOpen}
              onToggle={t.id === 'OT' ? toggleOt : toggleNt}
              openSectionKey={openSectionKey}
              openBookKey={openBookKey}
              onToggleSection={toggleSection}
              onToggleBook={toggleBook}
              onChapterClick={handleChapterClick}
            />
          ))}
        </div>
      )}
    </div>
  );
}

function TestamentBlock({
  testament,
  expanded,
  onToggle,
  openSectionKey,
  openBookKey,
  onToggleSection,
  onToggleBook,
  onChapterClick,
}: {
  testament: MasteryTestamentOut;
  expanded: boolean;
  onToggle: () => void;
  openSectionKey: string | null;
  openBookKey: string | null;
  onToggleSection: (key: string) => void;
  onToggleBook: (key: string) => void;
  onChapterClick: (bookNumber: number, chapter: number) => void;
}) {
  const pct = testament.average_mastery_percent;
  const sub =
    testament.quizzable_chapters === 0
      ? 'No quiz banks yet'
      : `${testament.mastered_chapters}/${testament.quizzable_chapters} chapters mastered`;

  return (
    <div className="mastery-overview-testament">
      <button
        type="button"
        className="mastery-overview-row mastery-overview-row--testament"
        aria-expanded={expanded}
        onClick={onToggle}
      >
        <div className="mastery-overview-row-main">
          <span className="mastery-overview-chevron" aria-hidden="true">
            {expanded ? '▼' : '▶'}
          </span>
          <span className="mastery-overview-title">{testament.label}</span>
          <span className="mastery-overview-pct">{pct}%</span>
        </div>
        <MasteryBar percent={pct} />
        <span className="mastery-overview-meta">{sub}</span>
      </button>
      {expanded && (
        <div className="mastery-overview-nest" role="region" aria-label={`${testament.label} sections`}>
          {testament.sections.length === 0 ? (
            <p className="mastery-overview-empty">No chapters with quizzes in this testament yet.</p>
          ) : (
            testament.sections.map(sec => (
              <SectionBlock
                key={sec.id}
                testamentId={testament.id}
                section={sec}
                expanded={openSectionKey === `${testament.id}:${sec.id}`}
                onToggle={() => onToggleSection(`${testament.id}:${sec.id}`)}
                openBookKey={openBookKey}
                onToggleBook={onToggleBook}
                onChapterClick={onChapterClick}
              />
            ))
          )}
        </div>
      )}
    </div>
  );
}

function SectionBlock({
  testamentId,
  section,
  expanded,
  onToggle,
  openBookKey,
  onToggleBook,
  onChapterClick,
}: {
  testamentId: string;
  section: MasterySectionOut;
  expanded: boolean;
  onToggle: () => void;
  openBookKey: string | null;
  onToggleBook: (key: string) => void;
  onChapterClick: (bookNumber: number, chapter: number) => void;
}) {
  const pct = section.average_mastery_percent;
  const sub = `${section.mastered_chapters}/${section.quizzable_chapters} chapters`;

  return (
    <div className="mastery-overview-section">
      <button
        type="button"
        className="mastery-overview-row mastery-overview-row--section"
        aria-expanded={expanded}
        onClick={onToggle}
      >
        <div className="mastery-overview-row-main">
          <span className="mastery-overview-chevron" aria-hidden="true">
            {expanded ? '▼' : '▶'}
          </span>
          <span className="mastery-overview-title">{section.label}</span>
          <span className="mastery-overview-pct">{pct}%</span>
        </div>
        <MasteryBar percent={pct} />
        <span className="mastery-overview-meta">{sub}</span>
      </button>
      {expanded && (
        <div className="mastery-overview-nest mastery-overview-nest--section" role="region">
          {section.books.map(book => (
            <BookBlock
              key={book.book_number}
              testamentId={testamentId}
              sectionId={section.id}
              book={book}
              expanded={openBookKey === `${testamentId}:${section.id}:${book.book_number}`}
              onToggle={() => onToggleBook(`${testamentId}:${section.id}:${book.book_number}`)}
              onChapterClick={onChapterClick}
            />
          ))}
        </div>
      )}
    </div>
  );
}

function BookBlock({
  testamentId,
  sectionId,
  book,
  expanded,
  onToggle,
  onChapterClick,
}: {
  testamentId: string;
  sectionId: string;
  book: MasteryBookOut;
  expanded: boolean;
  onToggle: () => void;
  onChapterClick: (bookNumber: number, chapter: number) => void;
}) {
  const pct = book.average_mastery_percent;
  const sub = `${book.mastered_chapters}/${book.quizzable_chapters} chapters`;

  return (
    <div className="mastery-overview-book">
      <button
        type="button"
        className="mastery-overview-row mastery-overview-row--book"
        aria-expanded={expanded}
        onClick={onToggle}
      >
        <div className="mastery-overview-row-main">
          <span className="mastery-overview-chevron" aria-hidden="true">
            {expanded ? '▼' : '▶'}
          </span>
          <span className="mastery-overview-title">{book.name}</span>
          <span className="mastery-overview-pct">{pct}%</span>
        </div>
        <MasteryBar percent={pct} />
        <span className="mastery-overview-meta">{sub}</span>
      </button>
      {expanded && (
        <ul className="mastery-chapter-list" role="list">
          {book.chapters.map(ch => (
            <li key={ch.chapter} className="mastery-chapter-item">
              <button
                type="button"
                className="mastery-chapter-btn"
                onClick={() => onChapterClick(book.book_number, ch.chapter)}
              >
                <span className="mastery-chapter-label">
                  Ch. {ch.chapter}
                  {ch.is_mastered && <span className="mastery-chapter-badge">Mastered</span>}
                </span>
                <div className="mastery-bar-wrap mastery-overview-bar mastery-overview-bar--chapter">
                  <div className="mastery-bar-track" aria-hidden="true">
                    <div className="mastery-bar-fill" style={{ width: `${ch.mastery_percent}%` }} />
                  </div>
                </div>
                <span className="mastery-chapter-pct">{ch.mastery_percent}%</span>
              </button>
            </li>
          ))}
        </ul>
      )}
    </div>
  );
}
