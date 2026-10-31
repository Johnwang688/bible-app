// "Surprise me": pick a random chapter, mostly from chapters the reader has not read yet.
// Pure module: no React, no side-effecting imports. The order of random() draws is part of the contract
// (the unit tests script them): draw 1 chooses the branch, then one or two more choose the chapter.

export type SurpriseBook = { book_number: number; total_chapters: number };
export type ChapterRef = { book_number: number; chapter: number };

/** Chance that a draw goes to the unread chapters when there are any. */
export const SURPRISE_UNREAD_WEIGHT = 0.9;

/** Key of one chapter in the all-time record. Translation-agnostic. */
export function chapterReadKey(bookNumber: number, chapter: number): string {
  return `${bookNumber}:${chapter}`;
}

export function pickSurpriseChapter(
  books: SurpriseBook[],
  read: ReadonlySet<string>,
  current: ChapterRef | null,
  random: () => number,
): ChapterRef {
  const all: ChapterRef[] = [];
  const unreadByBook: { book_number: number; chapters: number[] }[] = [];
  let unreadCount = 0;
  for (const book of books) {
    const unread: number[] = [];
    for (let chapter = 1; chapter <= book.total_chapters; chapter++) {
      if (current && current.book_number === book.book_number && current.chapter === chapter) continue;
      all.push({ book_number: book.book_number, chapter });
      if (!read.has(chapterReadKey(book.book_number, chapter))) unread.push(chapter);
    }
    if (unread.length > 0) {
      unreadByBook.push({ book_number: book.book_number, chapters: unread });
      unreadCount += unread.length;
    }
  }
  if (all.length === 0 && current) return current;

  const branch = random();
  if (unreadCount > 0 && branch < SURPRISE_UNREAD_WEIGHT) {
    const book = unreadByBook[Math.floor(random() * unreadByBook.length)];
    const chapter = book.chapters[Math.floor(random() * book.chapters.length)];
    return { book_number: book.book_number, chapter };
  }
  const any = all[Math.floor(random() * all.length)];
  return any;
}
