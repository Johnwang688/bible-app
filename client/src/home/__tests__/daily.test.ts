// Acceptance (orchestrator-owned): the greeting and the verse of the day.
import { CHAPTER_COUNTS } from '../../storage/keys';
import { greetingKey } from '../greeting';
import { VERSES_OF_THE_DAY, verseOfTheDay } from '../verseOfTheDay';

describe('greetingKey', () => {
  it('morning 5:00–11:59, afternoon 12:00–16:59, evening otherwise, by the local clock', () => {
    const at = (h: number, m = 0) => greetingKey(new Date(2026, 10, 4, h, m));
    expect(at(4, 59)).toBe('home.greeting.evening');
    expect(at(5)).toBe('home.greeting.morning');
    expect(at(11, 59)).toBe('home.greeting.morning');
    expect(at(12)).toBe('home.greeting.afternoon');
    expect(at(16, 59)).toBe('home.greeting.afternoon');
    expect(at(17)).toBe('home.greeting.evening');
    expect(at(0)).toBe('home.greeting.evening');
  });
});

describe('verse of the day', () => {
  it('the curated list: real verses in real chapters, no repeats', () => {
    expect(VERSES_OF_THE_DAY.length).toBe(60);
    const keys = new Set<string>();
    for (const v of VERSES_OF_THE_DAY) {
      expect(v.bookNumber).toBeGreaterThanOrEqual(1);
      expect(v.bookNumber).toBeLessThanOrEqual(66);
      expect(v.chapter).toBeGreaterThanOrEqual(1);
      expect(v.chapter).toBeLessThanOrEqual(CHAPTER_COUNTS[v.bookNumber - 1]!);
      expect(v.verse).toBeGreaterThanOrEqual(1);
      keys.add(`${v.bookNumber}:${v.chapter}:${v.verse}`);
    }
    expect(keys.size).toBe(VERSES_OF_THE_DAY.length);
  });

  it('starts the cycle on 1970-01-01 and moves one verse a day', () => {
    expect(verseOfTheDay('1970-01-01')).toEqual(VERSES_OF_THE_DAY[0]);
    expect(verseOfTheDay('1970-01-02')).toEqual(VERSES_OF_THE_DAY[1]);
    expect(verseOfTheDay('1970-03-01')).toEqual(VERSES_OF_THE_DAY[59]);
    expect(verseOfTheDay('1970-03-02')).toEqual(VERSES_OF_THE_DAY[0]);
  });

  it('is the same all day and for everyone on that date: Psalm 119:105 on 2026-11-03, John 3:16 on 2026-11-04', () => {
    expect(verseOfTheDay('2026-11-03')).toEqual({ bookNumber: 19, chapter: 119, verse: 105 });
    expect(verseOfTheDay('2026-11-04')).toEqual({ bookNumber: 43, chapter: 3, verse: 16 });
    expect(verseOfTheDay('2026-11-04')).toEqual(verseOfTheDay('2026-11-04'));
  });

  it('60 days in a row show 60 different verses, across a month, a year and a DST change', () => {
    const seen = new Set<string>();
    for (let i = 0; i < 60; i++) {
      const d = new Date(2026, 9, 20 + i);
      const day = `${d.getFullYear()}-${String(d.getMonth() + 1).padStart(2, '0')}-${String(d.getDate()).padStart(2, '0')}`;
      const v = verseOfTheDay(day);
      seen.add(`${v.bookNumber}:${v.chapter}:${v.verse}`);
    }
    expect(seen.size).toBe(60);
  });

  it('returns a copy: changing it does not change the list', () => {
    const v = verseOfTheDay('2026-11-04');
    v.verse = 99;
    expect(verseOfTheDay('2026-11-04').verse).toBe(16);
  });
});
