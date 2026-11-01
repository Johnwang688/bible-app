// Chapter navigation over the book catalogue. Books are matched by book_number, never by index.
import type { BookInfo } from '../api/schemas';

export interface Position {
  bookNumber: number;
  chapter: number;
}

function sorted(books: BookInfo[] | undefined): BookInfo[] {
  return books && books.length > 0 ? [...books].sort((a, b) => a.book_number - b.book_number) : [];
}

/** The chapter after `p`, crossing into the next book; null at the end or before the books load. */
export function nextPosition(books: BookInfo[] | undefined, p: Position): Position | null {
  const list = sorted(books);
  const i = list.findIndex((b) => b.book_number === p.bookNumber);
  const book = list[i];
  if (!book) return null;
  if (p.chapter < book.total_chapters) return { bookNumber: book.book_number, chapter: p.chapter + 1 };
  const next = list[i + 1];
  return next ? { bookNumber: next.book_number, chapter: 1 } : null;
}

/** The chapter before `p`, crossing into the previous book; null at the start or before the books load. */
export function prevPosition(books: BookInfo[] | undefined, p: Position): Position | null {
  const list = sorted(books);
  const i = list.findIndex((b) => b.book_number === p.bookNumber);
  const book = list[i];
  if (!book) return null;
  if (p.chapter > 1) return { bookNumber: book.book_number, chapter: p.chapter - 1 };
  const prev = list[i - 1];
  return prev ? { bookNumber: prev.book_number, chapter: prev.total_chapters } : null;
}

/** Makes a stored position one the catalogue has. With no books it is returned unchanged. */
export function clampPosition(books: BookInfo[] | undefined, p: Position): Position {
  if (!books || books.length === 0) return p;
  const book = books.find((b) => b.book_number === p.bookNumber);
  if (!book) return { bookNumber: 1, chapter: 1 };
  if (p.chapter > book.total_chapters || p.chapter < 1) return { bookNumber: book.book_number, chapter: 1 };
  return p;
}
