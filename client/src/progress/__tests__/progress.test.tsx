// Acceptance (orchestrator-owned): the reading-progress model and the reading-time tracker (R-3).
import * as fs from 'fs';
import * as path from 'path';

import { act, render } from '@testing-library/react-native';
import { useEffect } from 'react';

import type { BookInfo } from '../../api/schemas';
import { readingProgressKey, type ReadingProgress } from '../../storage/keys';
import { createStorage, memoryBackend } from '../../storage/storage';
import {
  addDays,
  bestStreak,
  COMMIT_EVERY_MS,
  coverage,
  coverageLevel,
  createEngagementTracker,
  creditThreshold,
  currentStreak,
  dayKey,
  IDLE_LIMIT_MS,
  MAX_GAP_MS,
  qualifies,
  useReadingProgress,
  weekOf,
  type ReadingProgressView,
} from '..';

const BOOKS: BookInfo[] = JSON.parse(
  fs.readFileSync(path.resolve(__dirname, '../../../../tests/golden/fixtures/books.json'), 'utf8'),
).body;

describe('days', () => {
  it('uses the local calendar day, not UTC', () => {
    // 23:30 local on 1 November is still 1 November, whatever the UTC date.
    expect(dayKey(new Date(2026, 10, 1, 23, 30))).toBe('2026-11-01');
    expect(dayKey(new Date(2026, 0, 5, 0, 5))).toBe('2026-01-05');
  });

  it('steps across months, years and leap days', () => {
    expect(addDays('2026-11-01', -1)).toBe('2026-10-31');
    expect(addDays('2026-12-31', 1)).toBe('2027-01-01');
    expect(addDays('2028-02-28', 1)).toBe('2028-02-29');
    expect(addDays('2026-03-01', -1)).toBe('2026-02-28');
  });
});

describe('chapter credit (ported from the old app)', () => {
  it('needs half the chapter (at least 3 verses) and 1.5 s a verse, between 20 s and 75 s', () => {
    expect(creditThreshold(2)).toEqual({ requiredVerse: 2, requiredMs: 20_000 });
    expect(creditThreshold(10)).toEqual({ requiredVerse: 5, requiredMs: 20_000 });
    expect(creditThreshold(36)).toEqual({ requiredVerse: 18, requiredMs: 54_000 });
    expect(creditThreshold(176)).toEqual({ requiredVerse: 88, requiredMs: 75_000 });
    expect(qualifies({ furthestVerse: 18, engagedMs: 54_000 }, 36)).toBe(true);
    expect(qualifies({ furthestVerse: 17, engagedMs: 99_000 }, 36)).toBe(false);
    expect(qualifies({ furthestVerse: 36, engagedMs: 53_999 }, 36)).toBe(false);
  });
});

describe('streaks', () => {
  const days = ['2026-10-25', '2026-10-26', '2026-10-27', '2026-10-30', '2026-10-31', '2026-11-01'];

  it('counts back from today, or from yesterday while today is not met yet', () => {
    expect(currentStreak(days, '2026-11-01')).toBe(3);
    expect(currentStreak(days, '2026-11-02')).toBe(3);
    expect(currentStreak(days, '2026-11-03')).toBe(0);
    expect(currentStreak([], '2026-11-01')).toBe(0);
  });

  it('finds the best run ever, ignoring order and repeats', () => {
    expect(bestStreak(days)).toBe(3);
    expect(bestStreak(['2026-12-31', '2027-01-01', '2026-12-30', '2027-01-01'])).toBe(3);
    expect(bestStreak([])).toBe(0);
  });

  it('lays out Monday to Sunday of this week', () => {
    // 2026-11-04 is a Wednesday.
    const week = weekOf(['2026-11-02', '2026-11-04', '2026-11-08'], '2026-11-04');
    expect(week.map((d) => d.day)).toEqual([
      '2026-11-02',
      '2026-11-03',
      '2026-11-04',
      '2026-11-05',
      '2026-11-06',
      '2026-11-07',
      '2026-11-08',
    ]);
    expect(week.map((d) => d.met)).toEqual([true, false, true, false, false, false, true]);
    expect(week.map((d) => d.isToday)).toEqual([false, false, true, false, false, false, false]);
    expect(week.map((d) => d.future)).toEqual([false, false, false, true, true, true, true]);
    // A Sunday is the last day of its week.
    expect(weekOf([], '2026-11-08')[6]!.isToday).toBe(true);
  });
});

describe('coverage', () => {
  it('grades a book none / under a third / under two thirds / more / every chapter', () => {
    expect([coverageLevel(0, 50), coverageLevel(1, 50), coverageLevel(17, 50), coverageLevel(34, 50), coverageLevel(50, 50)]).toEqual([
      0, 1, 2, 3, 4,
    ]);
    expect(coverageLevel(1, 1)).toBe(4);
  });

  it('gives one entry per book in canon order, counting only real chapters', () => {
    const map = coverage({ '1:1': 't', '1:2': 't', '65:1': 't', '1:51': 't' }, BOOKS);
    expect(map).toHaveLength(66);
    expect(map[0]).toEqual({ bookNumber: 1, read: 2, total: 50, level: 1 });
    expect(map[64]).toMatchObject({ bookNumber: 65, read: 1, total: 1, level: 4 });
    expect(map.map((b) => b.bookNumber)).toEqual(Array.from({ length: 66 }, (_, i) => i + 1));
  });
});

describe('the reading-time tracker', () => {
  const JOHN3 = { bookNumber: 43, chapter: 3, totalVerses: 36 };
  function setup(start = new Date(2026, 10, 2, 9, 0).getTime()) {
    const storage = createStorage(memoryBackend());
    let t = start;
    const tracker = createEngagementTracker({ storage, now: () => t });
    const advance = (ms: number) => {
      t += ms;
    };
    const stored = () => storage.get(readingProgressKey);
    return { storage, tracker, advance, stored };
  }

  it('counts time between reports on the same chapter, capped per gap', () => {
    const h = setup();
    h.tracker.interact(JOHN3, 5);
    h.advance(4000);
    h.tracker.interact(JOHN3, 8);
    h.advance(60_000); // a long gap counts only MAX_GAP_MS
    h.tracker.interact(JOHN3, 9);
    h.tracker.flush();
    expect(h.stored().activeMs['2026-11-02']).toBe(4000 + MAX_GAP_MS);
    expect(h.stored().evidence).toEqual({ day: '2026-11-02', chapters: { '43:3': { furthestVerse: 9, engagedMs: 4000 + MAX_GAP_MS } } });
  });

  it('heartbeats count only within the idle limit of the last interaction', () => {
    const h = setup();
    h.tracker.interact(JOHN3, 5);
    for (let i = 0; i < 30; i++) {
      h.advance(5000);
      h.tracker.tick();
    }
    h.tracker.flush();
    // 150 s passed, but only the first IDLE_LIMIT_MS after the interaction count.
    expect(h.stored().activeMs['2026-11-02']).toBe(IDLE_LIMIT_MS);
    // The next interaction restarts the clock without counting the idle time.
    h.advance(1000);
    h.tracker.interact(JOHN3, 6);
    h.advance(2000);
    h.tracker.interact(JOHN3, 6);
    h.tracker.flush();
    expect(h.stored().activeMs['2026-11-02']).toBe(IDLE_LIMIT_MS + 2000);
  });

  it('pausing stops the clock: time away is never counted', () => {
    const h = setup();
    h.tracker.interact(JOHN3, 5);
    h.advance(3000);
    h.tracker.pause();
    h.advance(10_000);
    h.tracker.tick();
    h.tracker.interact(JOHN3, 5);
    h.advance(1000);
    h.tracker.interact(JOHN3, 5);
    h.tracker.flush();
    expect(h.stored().activeMs['2026-11-02']).toBe(4000);
  });

  it('a new chapter starts its own clock; nothing carries over', () => {
    const h = setup();
    h.tracker.interact(JOHN3, 5);
    h.advance(3000);
    h.tracker.interact({ bookNumber: 43, chapter: 4, totalVerses: 54 }, 2);
    h.advance(2000);
    h.tracker.interact({ bookNumber: 43, chapter: 4, totalVerses: 54 }, 3);
    h.tracker.flush();
    expect(h.stored().evidence.chapters).toEqual({
      '43:3': { furthestVerse: 5, engagedMs: 0 },
      '43:4': { furthestVerse: 3, engagedMs: 2000 },
    });
  });

  it('credits a chapter once it qualifies, writing at once, and keeps the first time', () => {
    const h = setup();
    h.tracker.interact(JOHN3, 18);
    for (let i = 0; i < 11; i++) {
      h.advance(5000);
      h.tracker.tick();
    }
    // 55 s ≥ 54 s and verse 18 of 36: credited without a flush.
    expect(Object.keys(h.stored().chaptersRead)).toEqual(['43:3']);
    const first = h.stored().chaptersRead['43:3'];
    h.advance(5000);
    h.tracker.tick();
    h.tracker.flush();
    expect(h.stored().chaptersRead['43:3']).toBe(first);
  });

  it('does not credit a chapter seen only partly, however long', () => {
    const h = setup();
    h.tracker.interact(JOHN3, 10);
    for (let i = 0; i < 20; i++) {
      h.advance(3000);
      h.tracker.interact(JOHN3, 10);
    }
    h.tracker.flush();
    expect(h.stored().chaptersRead).toEqual({});
  });

  it('caps the furthest verse at the chapter length', () => {
    const h = setup();
    h.tracker.interact({ bookNumber: 65, chapter: 1, totalVerses: 25 }, 400);
    h.tracker.flush();
    expect(h.stored().evidence.chapters['65:1']!.furthestVerse).toBe(25);
  });

  it('batches writes: at most one per COMMIT_EVERY_MS while reading', () => {
    const h = setup();
    const writes = jest.fn();
    h.storage.subscribe(readingProgressKey, writes);
    h.tracker.interact(JOHN3, 2);
    for (let i = 0; i < 20; i++) {
      h.advance(250);
      h.tracker.interact(JOHN3, 2);
    }
    expect(writes.mock.calls.length).toBeLessThanOrEqual(Math.ceil((20 * 250) / COMMIT_EVERY_MS) + 1);
    h.tracker.flush();
    expect(h.stored().activeMs['2026-11-02']).toBe(5000);
  });

  it('marks the goal met the moment today reaches it, and keeps the day if the goal later rises', () => {
    const h = setup();
    h.storage.set(readingProgressKey, { ...h.stored(), goalMinutes: 5 });
    h.tracker.interact(JOHN3, 2);
    for (let i = 0; i < 61; i++) {
      h.advance(5000);
      h.tracker.interact(JOHN3, 2);
    }
    h.tracker.flush();
    expect(h.stored().goalMetDays).toEqual(['2026-11-02']);
    h.storage.set(readingProgressKey, { ...h.stored(), goalMinutes: 60 });
    h.advance(5000);
    h.tracker.interact(JOHN3, 2);
    h.tracker.flush();
    expect(h.stored().goalMetDays).toEqual(['2026-11-02']);
  });

  it('splits time at midnight: each day gets its own part, and the new day its own evidence', () => {
    const h = setup(new Date(2026, 10, 2, 23, 59, 50).getTime());
    h.tracker.interact(JOHN3, 4);
    h.advance(5000);
    h.tracker.interact(JOHN3, 4);
    h.advance(10_000); // 23:59:55 → 00:00:05 on the 3rd: 5 s each side
    h.tracker.interact(JOHN3, 6);
    h.tracker.flush();
    expect(h.stored().activeMs).toEqual({ '2026-11-02': 10_000, '2026-11-03': 5000 });
    expect(h.stored().evidence).toEqual({ day: '2026-11-03', chapters: { '43:3': { furthestVerse: 6, engagedMs: 5000 } } });
  });

  it('two trackers on the same storage both land (each write reads the latest stored value)', () => {
    const h = setup();
    let t = new Date(2026, 10, 2, 9, 0).getTime();
    const other = createEngagementTracker({ storage: h.storage, now: () => t });
    h.tracker.interact(JOHN3, 2);
    other.interact({ bookNumber: 1, chapter: 1, totalVerses: 31 }, 2);
    h.advance(1000);
    t += 2000;
    h.tracker.interact(JOHN3, 2);
    other.interact({ bookNumber: 1, chapter: 1, totalVerses: 31 }, 2);
    h.tracker.flush();
    other.flush();
    expect(h.stored().activeMs['2026-11-02']).toBe(3000);
  });
});

describe('useReadingProgress', () => {
  async function mount(progress: Partial<ReadingProgress>, now: Date) {
    const storage = createStorage(memoryBackend());
    storage.set(readingProgressKey, { ...storage.get(readingProgressKey), ...progress });
    const ref: { current: ReadingProgressView | null } = { current: null };
    function Probe() {
      const view = useReadingProgress({ storage, now: () => now });
      useEffect(() => {
        ref.current = view;
      });
      return null;
    }
    await render(<Probe />);
    return { ref, storage };
  }

  it('derives today, the goal bar, the streaks, the week and the explored count', async () => {
    const { ref } = await mount(
      {
        goalMinutes: 15,
        activeMs: { '2026-11-04': 9 * 60_000 + 59_000, '2026-11-03': 20 * 60_000 },
        goalMetDays: ['2026-11-02', '2026-11-03'],
        chaptersRead: { '43:3': 'x', '1:1': 'y' },
      },
      new Date(2026, 10, 4, 18, 0),
    );
    const v = ref.current!;
    expect(v.today).toBe('2026-11-04');
    expect([v.goalMinutes, v.goalProgressMinutes, v.goalMet]).toEqual([15, 9, false]);
    expect([v.streak, v.best]).toEqual([2, 2]);
    expect(v.week.filter((d) => d.met).map((d) => d.day)).toEqual(['2026-11-02', '2026-11-03']);
    expect(v.exploredCount).toBe(2);
    expect([v.isRead(43, 3), v.isRead(43, 4)]).toEqual([true, false]);
  });

  it('the goal bar stops at the goal', async () => {
    const { ref } = await mount({ goalMinutes: 10, activeMs: { '2026-11-04': 25 * 60_000 }, goalMetDays: ['2026-11-04'] }, new Date(2026, 10, 4, 18, 0));
    expect([ref.current!.goalProgressMinutes, ref.current!.goalMet]).toEqual([10, true]);
  });

  it('updates when the tracker writes', async () => {
    const { ref, storage } = await mount({}, new Date(2026, 10, 4, 18, 0));
    await act(async () => {
      storage.set(readingProgressKey, { ...storage.get(readingProgressKey), chaptersRead: { '19:23': 'z' } });
    });
    expect(ref.current!.isRead(19, 23)).toBe(true);
  });
});
