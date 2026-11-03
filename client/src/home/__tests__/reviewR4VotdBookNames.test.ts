// Sol R-4 goal review round 1, F1 support (orchestrator-owned): the verse of the day's reference can be drawn before
// the book catalogue arrives, so every curated verse's book has a fallback name, the same as the catalogue's.
import { BOOKS } from '../../reader/__tests__/readerHarness';
import { VERSES_OF_THE_DAY } from '../verseOfTheDay';
import { VOTD_BOOK_NAMES } from '../votdBookNames';

it('names every verse-of-the-day book exactly as the catalogue does, in English and simplified Chinese', () => {
  const numbers = [...new Set(VERSES_OF_THE_DAY.map((v) => v.bookNumber))];
  for (const n of numbers) {
    const book = BOOKS.find((b) => b.book_number === n);
    expect(book).toBeDefined();
    expect(VOTD_BOOK_NAMES[n]).toEqual({ en: book!.name, zhHans: book!.name_zh_simplified });
  }
});
