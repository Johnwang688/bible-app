'use client';

import Link from 'next/link';
import type { ChapterData, CommentaryEntry } from '@/features/reader/types';
import { isSkipLabel, isSkipPlaceLabel, parseSummaryContent, slugifyEntityLabel } from '@/features/commentary/summary';
import { useReaderPosition } from '@/features/reader/ReaderPositionContext';

export interface CommentaryContentProps {
  commentaryLoading: boolean;
  commentaryError: boolean;
  commentaryEntries: CommentaryEntry[];
  commentarySource: string;
  chapterData: ChapterData | null;
  syncedVerseStart: number | null;
}

export default function CommentaryContent({
  commentaryLoading,
  commentaryError,
  commentaryEntries,
  commentarySource,
  chapterData,
  syncedVerseStart,
}: CommentaryContentProps) {
  const { currentBook, chapter } = useReaderPosition();
  if (commentaryLoading) {
    return (
      <div className="state-msg">
        <span className="spinner" />
        <div>Loading…</div>
      </div>
    );
  }
  if (commentaryError) return <div className="state-msg">Unable to load this content.</div>;
  if (!commentaryEntries.length) return <div className="state-msg">No content for this chapter.</div>;

  if (commentarySource === 'summary') {
    const bookForEntityNav = currentBook?.name ?? chapterData?.book ?? '';
    const entityNavSuffix =
      bookForEntityNav !== ''
        ? `?returnTo=${encodeURIComponent(
            `/app?book=${encodeURIComponent(bookForEntityNav)}&chapter=${chapter}&panel=commentary&source=${encodeURIComponent(commentarySource)}`,
          )}`
        : '';
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
          {p.points.length > 0 && (
            <div className="summary-section">
              <div className="summary-section-label">Key Points</div>
              <ul className="summary-points">{p.points.map((pt, j) => <li key={j}>{pt}</li>)}</ul>
            </div>
          )}
          {p.themes.length > 0 && (
            <div className="summary-section">
              <div className="summary-section-label">
                Themes
                <Link href={`/themes/bank${entityNavSuffix}`} className="summary-section-bank-link">Browse all</Link>
              </div>
              <div className="summary-tags">
                {entry.theme_tags && entry.theme_tags.length > 0
                  ? entry.theme_tags.map((tag, j) => (
                      <Link
                        key={j}
                        href={`/themes/${encodeURIComponent(tag.slug)}${entityNavSuffix}`}
                        className="summary-tag summary-tag-link"
                      >
                        {tag.label}
                      </Link>
                    ))
                  : p.themes.map((t, j) => (
                      <span key={j} className="summary-tag">{t}</span>
                    ))}
              </div>
            </div>
          )}
          {(() => {
            const filteredPeopleTags = entry.people_tags?.filter(t => !isSkipLabel(t.label)) ?? [];
            const filteredPeople = p.people.filter(t => !isSkipLabel(t));
            return (filteredPeopleTags.length > 0 || filteredPeople.length > 0) && (
              <div className="summary-section">
                <div className="summary-section-label">
                  People
                  <Link href={`/people/bank${entityNavSuffix}`} className="summary-section-bank-link">Browse all</Link>
                </div>
                <div className="summary-tags">
                  {filteredPeopleTags.length > 0
                    ? filteredPeopleTags.map((tag, j) => (
                        <Link
                          key={j}
                          href={`/people/${encodeURIComponent(tag.slug)}${entityNavSuffix}`}
                          className="summary-tag summary-tag-link"
                        >
                          {tag.label}
                        </Link>
                      ))
                    : filteredPeople.map((t, j) => (
                        <span key={j} className="summary-tag">{t}</span>
                      ))}
                </div>
              </div>
            );
          })()}
          {(() => {
            const filteredPlaceTags = entry.place_tags?.filter(t => !isSkipPlaceLabel(t.label)) ?? [];
            const filteredPlaces = p.places.filter(t => !isSkipPlaceLabel(t));
            const hasPlaces = filteredPlaceTags.length > 0 || filteredPlaces.length > 0;
            return (
              <div className="summary-section">
                <div className="summary-section-label">
                  Places
                  <Link href={`/places/bank${entityNavSuffix}`} className="summary-section-bank-link">Browse all</Link>
                </div>
                <div className="summary-tags">
                  {hasPlaces ? (
                    filteredPlaceTags.length > 0
                      ? filteredPlaceTags.map((tag, j) => (
                          <Link
                            key={j}
                            href={`/places/${encodeURIComponent(tag.slug)}${entityNavSuffix}`}
                            className="summary-tag summary-tag-link summary-tag-place"
                          >
                            {tag.label}
                          </Link>
                        ))
                      : filteredPlaces.map((t, j) => (
                          <Link
                            key={j}
                            href={`/places/${encodeURIComponent(slugifyEntityLabel(t))}${entityNavSuffix}`}
                            className="summary-tag summary-tag-link summary-tag-place"
                          >
                            {t}
                          </Link>
                        ))
                  ) : (
                    <span className="summary-empty-note">No specific places in this chapter summary.</span>
                  )}
                </div>
              </div>
            );
          })()}
          {p.verses.length > 0 && (
            <div className="summary-section summary-section-refs">
              <div className="summary-section-label">References</div>
              <div className="summary-tags">{p.verses.map((v, j) => <span key={j} className="summary-ref-tag">{v}</span>)}</div>
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
}
