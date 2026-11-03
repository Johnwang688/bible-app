// The verse of the day: one curated verse per local calendar day, the same for everyone on that date.
// Pure module: the caller passes the "YYYY-MM-DD" day key.

export interface DailyVerse {
  bookNumber: number;
  chapter: number;
  verse: number;
}

export const VERSES_OF_THE_DAY: readonly DailyVerse[] = [
  { bookNumber: 19, chapter: 119, verse: 105 }, // Psalm 119:105
  { bookNumber: 43, chapter: 3, verse: 16 }, // John 3:16
  { bookNumber: 20, chapter: 3, verse: 5 }, // Proverbs 3:5
  { bookNumber: 45, chapter: 8, verse: 28 }, // Romans 8:28
  { bookNumber: 23, chapter: 41, verse: 10 }, // Isaiah 41:10
  { bookNumber: 40, chapter: 11, verse: 28 }, // Matthew 11:28
  { bookNumber: 19, chapter: 23, verse: 1 }, // Psalm 23:1
  { bookNumber: 50, chapter: 4, verse: 6 }, // Philippians 4:6
  { bookNumber: 6, chapter: 1, verse: 9 }, // Joshua 1:9
  { bookNumber: 43, chapter: 14, verse: 27 }, // John 14:27
  { bookNumber: 25, chapter: 3, verse: 22 }, // Lamentations 3:22
  { bookNumber: 47, chapter: 5, verse: 17 }, // 2 Corinthians 5:17
  { bookNumber: 24, chapter: 29, verse: 11 }, // Jeremiah 29:11
  { bookNumber: 48, chapter: 2, verse: 20 }, // Galatians 2:20
  { bookNumber: 19, chapter: 46, verse: 1 }, // Psalm 46:1
  { bookNumber: 58, chapter: 11, verse: 1 }, // Hebrews 11:1
  { bookNumber: 23, chapter: 40, verse: 31 }, // Isaiah 40:31
  { bookNumber: 49, chapter: 2, verse: 8 }, // Ephesians 2:8
  { bookNumber: 33, chapter: 6, verse: 8 }, // Micah 6:8
  { bookNumber: 60, chapter: 5, verse: 7 }, // 1 Peter 5:7
  { bookNumber: 5, chapter: 31, verse: 6 }, // Deuteronomy 31:6
  { bookNumber: 40, chapter: 6, verse: 33 }, // Matthew 6:33
  { bookNumber: 19, chapter: 27, verse: 1 }, // Psalm 27:1
  { bookNumber: 45, chapter: 12, verse: 2 }, // Romans 12:2
  { bookNumber: 23, chapter: 26, verse: 3 }, // Isaiah 26:3
  { bookNumber: 43, chapter: 15, verse: 5 }, // John 15:5
  { bookNumber: 20, chapter: 16, verse: 3 }, // Proverbs 16:3
  { bookNumber: 62, chapter: 4, verse: 19 }, // 1 John 4:19
  { bookNumber: 36, chapter: 3, verse: 17 }, // Zephaniah 3:17
  { bookNumber: 51, chapter: 3, verse: 23 }, // Colossians 3:23
  { bookNumber: 19, chapter: 37, verse: 4 }, // Psalm 37:4
  { bookNumber: 40, chapter: 5, verse: 16 }, // Matthew 5:16
  { bookNumber: 4, chapter: 6, verse: 24 }, // Numbers 6:24
  { bookNumber: 55, chapter: 1, verse: 7 }, // 2 Timothy 1:7
  { bookNumber: 23, chapter: 43, verse: 2 }, // Isaiah 43:2
  { bookNumber: 59, chapter: 1, verse: 5 }, // James 1:5
  { bookNumber: 19, chapter: 34, verse: 18 }, // Psalm 34:18
  { bookNumber: 43, chapter: 8, verse: 12 }, // John 8:12
  { bookNumber: 2, chapter: 14, verse: 14 }, // Exodus 14:14
  { bookNumber: 45, chapter: 15, verse: 13 }, // Romans 15:13
  { bookNumber: 16, chapter: 8, verse: 10 }, // Nehemiah 8:10
  { bookNumber: 50, chapter: 4, verse: 13 }, // Philippians 4:13
  { bookNumber: 19, chapter: 121, verse: 2 }, // Psalm 121:2
  { bookNumber: 46, chapter: 13, verse: 4 }, // 1 Corinthians 13:4
  { bookNumber: 35, chapter: 3, verse: 19 }, // Habakkuk 3:19
  { bookNumber: 58, chapter: 13, verse: 8 }, // Hebrews 13:8
  { bookNumber: 1, chapter: 1, verse: 1 }, // Genesis 1:1
  { bookNumber: 66, chapter: 21, verse: 4 }, // Revelation 21:4
  { bookNumber: 19, chapter: 90, verse: 12 }, // Psalm 90:12
  { bookNumber: 40, chapter: 28, verse: 20 }, // Matthew 28:20
  { bookNumber: 23, chapter: 53, verse: 5 }, // Isaiah 53:5
  { bookNumber: 52, chapter: 5, verse: 18 }, // 1 Thessalonians 5:18
  { bookNumber: 21, chapter: 3, verse: 1 }, // Ecclesiastes 3:1
  { bookNumber: 43, chapter: 11, verse: 25 }, // John 11:25
  { bookNumber: 19, chapter: 139, verse: 14 }, // Psalm 139:14
  { bookNumber: 45, chapter: 5, verse: 8 }, // Romans 5:8
  { bookNumber: 20, chapter: 18, verse: 10 }, // Proverbs 18:10
  { bookNumber: 49, chapter: 3, verse: 20 }, // Ephesians 3:20
  { bookNumber: 19, chapter: 51, verse: 10 }, // Psalm 51:10
  { bookNumber: 41, chapter: 10, verse: 27 }, // Mark 10:27
];

const MS_PER_DAY = 86_400_000;

/** The verse for a "YYYY-MM-DD" local day key. Returns a copy. */
export function verseOfTheDay(day: string): DailyVerse {
  const [y, m, d] = day.split('-').map(Number) as [number, number, number];
  const days = Date.UTC(y, m - 1, d) / MS_PER_DAY;
  const n = VERSES_OF_THE_DAY.length;
  const index = ((days % n) + n) % n;
  const v = VERSES_OF_THE_DAY[index]!;
  return { bookNumber: v.bookNumber, chapter: v.chapter, verse: v.verse };
}
