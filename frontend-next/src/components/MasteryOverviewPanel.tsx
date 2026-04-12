'use client';

import { useCallback, useEffect, useState } from 'react';
import type { AuthSession } from '@/lib/account';
import CurrencyIcon from '@/components/CurrencyIcon';
import {
  formatMasteryRewardCoins,
  MASTERY_REWARD_BOOK,
  MASTERY_REWARD_SECTION,
  MASTERY_REWARD_TESTAMENT,
} from '../lib/masteryRewards';
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
  /**
   * `teaser` — summary row for dashboard cards (links to /app/mastery).
   * `accordion` — expandable OT/NT/section/book tree.
   */
  variant?: 'teaser' | 'accordion';
  /** When false, omit the top "Mastery" label (e.g. home card supplies its own heading). */
  showTitle?: boolean;
  /** Parent resolves book name and opens the reader. */
  onChapterSelect?: (
    bookNumber: number,
    chapter: number,
    translation: string,
    bookName?: string,
  ) => void;
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

function MasteryRewardBadge({ coins, scopeLabel }: { coins: number; scopeLabel: string }) {
  const tip = `Reward for mastering every quizzable chapter in ${scopeLabel}: ${coins.toLocaleString()} coins`;
  const shown = formatMasteryRewardCoins(coins);
  return (
    <span className="mastery-overview-reward" title={tip} aria-label={tip}>
      <CurrencyIcon className="mastery-overview-reward-icon" size={13} />
      <span className="mastery-overview-reward-amount" aria-hidden="true">
        {shown}
      </span>
    </span>
  );
}

export default function MasteryOverviewPanel({
  session,
  translation,
  variant = 'accordion',
  showTitle = true,
  onChapterSelect,
  className = '',
}: MasteryOverviewPanelProps) {
  const [data, setData] = useState<MasteryOverviewOut | null>(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [otOpen, setOtOpen] = useState(false);
  const [ntOpen, setNtOpen] = useState(false);
  const [openSectionKey, setOpenSectionKey] = useState<string | null>(null);

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
      }
      return !prev;
    });
  }, []);

  const toggleNt = useCallback(() => {
    setNtOpen(prev => {
      if (prev) {
        setOpenSectionKey(s => (s?.startsWith('NT:') ? null : s));
      }
      return !prev;
    });
  }, []);

  const toggleSection = useCallback((key: string) => {
    setOpenSectionKey(s => (s === key ? null : key));
  }, []);

  const handleChapterClick = useCallback(
    (bookNumber: number, chapter: number, bookName?: string) => {
      onChapterSelect?.(bookNumber, chapter, translation, bookName);
    },
    [onChapterSelect, translation],
  );

  if (!session) {
    return (
      <div
        className={`mastery-overview mastery-overview--guest ${variant === 'teaser' ? 'mastery-overview--teaser' : ''} ${className}`.trim()}
      >
        {showTitle && <div className="reader-dashboard-label">Mastery</div>}
        <p className="mastery-overview-guest-copy">
          Sign in to see your Old and New Testament quiz progress by section, book, and chapter.
        </p>
      </div>
    );
  }

  if (variant === 'teaser') {
    return (
      <div className={`mastery-overview mastery-overview--teaser ${className}`.trim()}>
        {showTitle && (
          <div className="mastery-overview-header">
            <div className="reader-dashboard-label">Mastery</div>
          </div>
        )}
        {loading && !data && (
          <div className="mastery-overview-loading" aria-busy="true">
            <div className="mastery-overview-skeleton" />
          </div>
        )}
        {error && !loading && <p className="mastery-overview-error">{error}</p>}
        {data && (
          <MasteryTeaserBody data={data} />
        )}
      </div>
    );
  }

  return (
    <div className={`mastery-overview ${className}`.trim()}>
      <div className="mastery-overview-header">
        {showTitle && <div className="reader-dashboard-label">Mastery</div>}
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
      {data && variant === 'accordion' && (
        <div className="mastery-overview-testaments">
          {data.testaments.map(t => (
            <TestamentBlock
              key={t.id}
              testament={t}
              expanded={t.id === 'OT' ? otOpen : ntOpen}
              onToggle={t.id === 'OT' ? toggleOt : toggleNt}
              openSectionKey={openSectionKey}
              onToggleSection={toggleSection}
              onChapterClick={handleChapterClick}
            />
          ))}
        </div>
      )}
    </div>
  );
}

function MasteryTeaserBody({ data }: { data: MasteryOverviewOut }) {
  const ot = data.testaments.find(t => t.id === 'OT');
  const nt = data.testaments.find(t => t.id === 'NT');
  const otPct = ot?.average_mastery_percent ?? 0;
  const ntPct = nt?.average_mastery_percent ?? 0;
  const q =
    (ot?.quizzable_chapters ?? 0) + (nt?.quizzable_chapters ?? 0);
  const m =
    (ot?.mastered_chapters ?? 0) + (nt?.mastered_chapters ?? 0);
  const sub =
    q === 0 ? 'Quiz banks are still rolling out.' : `${m}/${q} chapters mastered`;

  return (
    <div className="mastery-teaser-body">
      <div className="mastery-teaser-testaments" aria-label="Mastery summary">
        {ot && (
          <div className="mastery-teaser-testament">
            <div className="mastery-teaser-testament-hd">
              <span className="mastery-teaser-testament-label">{ot.label}</span>
              <span className="mastery-teaser-testament-pct">{otPct}%</span>
            </div>
            <div className="mastery-teaser-bar-row">
              <MasteryBar percent={otPct} />
              <MasteryRewardBadge coins={MASTERY_REWARD_TESTAMENT} scopeLabel={ot.label} />
            </div>
          </div>
        )}
        {nt && (
          <div className="mastery-teaser-testament">
            <div className="mastery-teaser-testament-hd">
              <span className="mastery-teaser-testament-label">{nt.label}</span>
              <span className="mastery-teaser-testament-pct">{ntPct}%</span>
            </div>
            <div className="mastery-teaser-bar-row">
              <MasteryBar percent={ntPct} />
              <MasteryRewardBadge coins={MASTERY_REWARD_TESTAMENT} scopeLabel={nt.label} />
            </div>
          </div>
        )}
      </div>
      <p className="mastery-teaser-meta">{sub}</p>
      <span className="mastery-teaser-cta">Open mastery map</span>
    </div>
  );
}

function TestamentBlock({
  testament,
  expanded,
  onToggle,
  openSectionKey,
  onToggleSection,
  onChapterClick,
}: {
  testament: MasteryTestamentOut;
  expanded: boolean;
  onToggle: () => void;
  openSectionKey: string | null;
  onToggleSection: (key: string) => void;
  onChapterClick: (bookNumber: number, chapter: number, bookName?: string) => void;
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
        <div className="mastery-overview-bar-row">
          <MasteryBar percent={pct} />
          <MasteryRewardBadge coins={MASTERY_REWARD_TESTAMENT} scopeLabel={testament.label} />
        </div>
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
                section={sec}
                expanded={openSectionKey === `${testament.id}:${sec.id}`}
                onToggle={() => onToggleSection(`${testament.id}:${sec.id}`)}
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
  section,
  expanded,
  onToggle,
  onChapterClick,
}: {
  section: MasterySectionOut;
  expanded: boolean;
  onToggle: () => void;
  onChapterClick: (bookNumber: number, chapter: number, bookName?: string) => void;
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
        <div className="mastery-overview-bar-row">
          <MasteryBar percent={pct} />
          <MasteryRewardBadge coins={MASTERY_REWARD_SECTION} scopeLabel={section.label} />
        </div>
        <span className="mastery-overview-meta">{sub}</span>
      </button>
      {expanded && (
        <div className="mastery-overview-nest mastery-overview-nest--section" role="region">
          {section.books.map(book => (
            <BookBlock key={book.book_number} book={book} onChapterClick={onChapterClick} />
          ))}
        </div>
      )}
    </div>
  );
}

function BookBlock({
  book,
  onChapterClick,
}: {
  book: MasteryBookOut;
  onChapterClick: (bookNumber: number, chapter: number, bookName?: string) => void;
}) {
  const [expanded, setExpanded] = useState(false);
  const pct = book.average_mastery_percent;
  const sub = `${book.mastered_chapters}/${book.quizzable_chapters} chapters`;
  const chapters = book.chapters ?? [];

  return (
    <div className="mastery-overview-book">
      <button
        type="button"
        className="mastery-overview-row mastery-overview-row--book"
        aria-expanded={expanded}
        onClick={e => {
          e.stopPropagation();
          setExpanded(v => !v);
        }}
      >
        <div className="mastery-overview-row-main">
          <span className="mastery-overview-chevron" aria-hidden="true">
            {expanded ? '▼' : '▶'}
          </span>
          <span className="mastery-overview-title">{book.name}</span>
          <span className="mastery-overview-pct">{pct}%</span>
        </div>
        <div className="mastery-overview-bar-row">
          <MasteryBar percent={pct} />
          <MasteryRewardBadge coins={MASTERY_REWARD_BOOK} scopeLabel={book.name} />
        </div>
        <span className="mastery-overview-meta">{sub}</span>
      </button>
      {expanded && (
        <ul className="mastery-chapter-list" role="list">
          {chapters.length === 0 ? (
            <li className="mastery-chapter-item mastery-chapter-item--empty">
              <span className="mastery-chapter-empty">No quiz chapters listed for this book.</span>
            </li>
          ) : (
            chapters.map(ch => (
              <li key={ch.chapter} className="mastery-chapter-item">
                <button
                  type="button"
                  className="mastery-chapter-btn"
                  onClick={() => onChapterClick(book.book_number, ch.chapter, book.name)}
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
            ))
          )}
        </ul>
      )}
    </div>
  );
}


