'use client';

import type { Dispatch, SetStateAction } from 'react';
import type { BookInfo, Translation } from '@/features/reader/types';
import { getLocalizedBookName } from '@/features/reader/translations';

export interface BookPanelProps {
  books: BookInfo[];
  expandedBook: number | null;
  setExpandedBook: Dispatch<SetStateAction<number | null>>;
  bookPopupOpen: boolean;
  setBookPopupOpen: Dispatch<SetStateAction<boolean>>;
  translation: string;
  translationsById: Map<string, Translation>;
  currentBook: BookInfo | null;
  chapter: number;
  pickChapter: (bookNumber: number, ch: number) => void;
}

export default function BookPanel({
  books,
  expandedBook,
  setExpandedBook,
  bookPopupOpen,
  setBookPopupOpen,
  translation,
  translationsById,
  currentBook,
  chapter,
  pickChapter,
}: BookPanelProps) {
  return (
    <div
      className={`popup-overlay${bookPopupOpen ? ' open' : ''}`}
      onClick={e => { if (e.target === e.currentTarget) setBookPopupOpen(false); }}
    >
      <div className="book-panel">
        {books.length === 0 ? (
          <div className="state-msg"><span className="spinner" /><div>Loading...</div></div>
        ) : (
          <>
            {(['OT', 'NT'] as const).map(testament => (
              <div key={testament}>
                <div className="testament-label">{testament === 'OT' ? 'Old Testament' : 'New Testament'}</div>
                {books.filter(b => b.testament === testament).map(book => (
                  <div key={book.book_number} className="book-row">
                    <button
                      className={`book-btn${expandedBook === book.book_number ? ' expanded' : ''}`}
                      type="button"
                      onClick={() => setExpandedBook(v => v === book.book_number ? null : book.book_number)}
                    >
                      <span>{getLocalizedBookName(book, translation, translationsById)}</span>
                      <span className="expand-arrow" aria-hidden="true" />
                    </button>
                    <div className={`chapter-picker${expandedBook === book.book_number ? ' open' : ''}`}>
                      {Array.from({ length: book.total_chapters }, (_, i) => i + 1).map(ch => (
                        <button
                          key={ch}
                          className={`ch-btn${currentBook?.book_number === book.book_number && chapter === ch ? ' current' : ''}`}
                          type="button"
                          onClick={e => { e.stopPropagation(); pickChapter(book.book_number, ch); }}
                        >
                          {ch}
                        </button>
                      ))}
                    </div>
                  </div>
                ))}
              </div>
            ))}
          </>
        )}
      </div>
    </div>
  );
}
