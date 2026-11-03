// "Surprise me": pick a random chapter, mostly from chapters the reader has not read yet.
// Pure module: no React, no side-effecting imports. The order of random() draws is part of the contract
// (the unit tests script them): draw 1 chooses the branch, then one or two more choose the chapter.
import { chapterKey } from '../storage/keys';

export interface SurpriseBook {
  book_number: number;
  total_chapters: number;
}

export interface ChapterRef {
  bookNumber: number;
  chapter: number;
}

/** Chance that a draw goes to the unread chapters when there are any. */
export const SURPRISE_UNREAD_WEIGHT = 0.9;

/**
 * Returns a random chapter other than `current`. `read` holds `chapterKey(book, chapter)` keys.
 * Returns null when there are no books. Always returns a new object.
 */
export function pickSurpriseChapter(
  books: readonly SurpriseBook[],
  read: ReadonlySet<string>,
  current: ChapterRef | null,
  random: () => number,
): ChapterRef | null {
  if (books.length === 0) return null;

  const all: ChapterRef[] = [];
  const unreadByBook: { bookNumber: number; chapters: number[] }[] = [];
  let unreadCount = 0;
  for (const book of books) {
    const unread: number[] = [];
    for (let chapter = 1; chapter <= book.total_chapters; chapter++) {
      if (current && current.bookNumber === book.book_number && current.chapter === chapter) continue;
      all.push({ bookNumber: book.book_number, chapter });
      if (!read.has(chapterKey(book.book_number, chapter))) unread.push(chapter);
    }
    if (unread.length > 0) {
      unreadByBook.push({ bookNumber: book.book_number, chapters: unread });
      unreadCount += unread.length;
    }
  }
  if (all.length === 0) return current ? { bookNumber: current.bookNumber, chapter: current.chapter } : null;

  const branch = random();
  if (unreadCount > 0 && branch < SURPRISE_UNREAD_WEIGHT) {
    const book = unreadByBook[Math.floor(random() * unreadByBook.length)]!;
    const chapter = book.chapters[Math.floor(random() * book.chapters.length)]!;
    return { bookNumber: book.bookNumber, chapter };
  }
  const any = all[Math.floor(random() * all.length)]!;
  return { bookNumber: any.bookNumber, chapter: any.chapter };
}
