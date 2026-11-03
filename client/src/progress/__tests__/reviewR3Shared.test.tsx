// Regression tests from the Sol review of the R-3 shared layer (round 1, F1–F7).
import * as fs from 'fs';
import * as path from 'path';

import { act, render } from '@testing-library/react-native';

import { readerTargets, useOpenInReader, type ReaderTarget } from '../../reader/target';
import { CHAPTER_COUNTS, readerPositionKey, readingProgressKey } from '../../storage/keys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { createEngagementTracker } from '../engagement';

const JOHN3 = { bookNumber: 43, chapter: 3, totalVerses: 36 };

afterEach(() => readerTargets.clear());

test('F2: a late write for yesterday never erases today’s evidence', () => {
  const storage = createStorage(memoryBackend());
  let t = new Date(2026, 10, 2, 23, 59, 59).getTime();
  const a = createEngagementTracker({ storage, now: () => t });
  const b = createEngagementTracker({ storage, now: () => t });
  a.interact(JOHN3, 18);
  b.interact({ bookNumber: 1, chapter: 1, totalVerses: 31 }, 16);
  t += 2000;
  b.tick();
  b.flush();
  a.flush();
  const p = storage.get(readingProgressKey);
  expect(p.evidence.day).toBe('2026-11-03');
  expect(p.evidence.chapters['1:1']).toBeDefined();
});

test('F3: a heartbeat past the idle limit still counts the time up to the limit', () => {
  const storage = createStorage(memoryBackend());
  let t = new Date(2026, 10, 2, 9).getTime();
  const tracker = createEngagementTracker({ storage, now: () => t });
  tracker.interact(JOHN3, 2);
  for (let i = 0; i < 11; i++) {
    t += 5000;
    tracker.tick();
  }
  t += 4000;
  tracker.tick();
  t += 2000;
  tracker.tick();
  tracker.flush();
  expect(storage.get(readingProgressKey).activeMs['2026-11-02']).toBe(60_000);
});

test('F3: pausing long after the last interaction counts only up to the idle limit', () => {
  const storage = createStorage(memoryBackend());
  let t = new Date(2026, 10, 2, 9).getTime();
  const tracker = createEngagementTracker({ storage, now: () => t });
  tracker.interact(JOHN3, 2);
  t += 10_000;
  tracker.tick();
  t += 5 * 60_000;
  tracker.pause();
  expect(storage.get(readingProgressKey).activeMs['2026-11-02']).toBe(10_000 + 15_000);
});

test.each([
  { chaptersRead: { '66:999': '2026-11-02T00:00:00.000Z' } },
  { chaptersRead: { '1:51': '2026-11-02T00:00:00.000Z' } },
  { activeMs: { '2026-02-30': 60_000 } },
  { goalMetDays: ['2026-13-01'] },
  { evidence: { day: '2026-02-31', chapters: {} } },
])('F4: progress naming a chapter or day that does not exist reads as the fallback: %j', (bad) => {
  const backend = memoryBackend();
  backend.set('reading.progress', JSON.stringify({ v: 1, data: { ...readingProgressKey.fallback, ...bad } }));
  expect(createStorage(backend).get(readingProgressKey)).toEqual(readingProgressKey.fallback);
});

test('F4: the chapter table matches the backend’s books', () => {
  const books = JSON.parse(fs.readFileSync(path.resolve(__dirname, '../../../../tests/golden/fixtures/books.json'), 'utf8')).body as {
    book_number: number;
    total_chapters: number;
  }[];
  expect(books.map((b) => b.total_chapters)).toEqual([...CHAPTER_COUNTS]);
  expect(CHAPTER_COUNTS.reduce((a, b) => a + b, 0)).toBe(1189);
});

test('F5: finishing an older target leaves a newer one for the same verses', () => {
  const target = { bookNumber: 43, chapter: 3, start: 16, end: 17 };
  readerTargets.set(target);
  const old = readerTargets.get()!;
  readerTargets.set(target);
  const next = readerTargets.get()!;
  readerTargets.done(old);
  expect(readerTargets.get()).toBe(next);
  readerTargets.done(next);
  expect(readerTargets.get()).toBeNull();
});

test('F6: opening a passage keeps the translation the reader is in now', async () => {
  const storage = createStorage(memoryBackend());
  storage.set(readerPositionKey, { bookNumber: 1, chapter: 1, translation: 'WEB' });
  const navigate = jest.fn();
  let open!: (target: ReaderTarget) => void;
  function Probe() {
    open = useOpenInReader({ storage, navigate });
    return null;
  }
  await render(<Probe />);
  await act(async () => {
    storage.set(readerPositionKey, { bookNumber: 1, chapter: 1, translation: 'CUV-SIMP' });
    open({ bookNumber: 43, chapter: 3, start: 16, end: 17 });
  });
  expect(storage.get(readerPositionKey)).toEqual({ bookNumber: 43, chapter: 3, translation: 'CUV-SIMP' });
  expect(navigate).toHaveBeenCalledTimes(1);
});

test('F7: a credit lands at once, between the batched writes', () => {
  const storage = createStorage(memoryBackend());
  let t = new Date(2026, 10, 2, 9).getTime();
  const tracker = createEngagementTracker({ storage, now: () => t });
  tracker.interact(JOHN3, 18);
  for (let i = 0; i < 10; i++) {
    t += 5000;
    tracker.tick();
  }
  t += 4000;
  tracker.tick();
  expect(storage.get(readingProgressKey).chaptersRead['43:3']).toBeDefined();
});

test('round 2: a late write for yesterday keeps its time and leaves today’s evidence (kills "skip older day")', () => {
  const storage = createStorage(memoryBackend());
  let t = new Date(2026, 10, 2, 23, 59, 58).getTime();
  const a = createEngagementTracker({ storage, now: () => t });
  const b = createEngagementTracker({ storage, now: () => t });
  a.interact(JOHN3, 18);
  t += 1000;
  a.interact(JOHN3, 18);
  b.interact({ bookNumber: 1, chapter: 1, totalVerses: 31 }, 16);
  t += 2000;
  b.tick();
  b.flush();
  a.flush();
  const p = storage.get(readingProgressKey);
  expect(p.activeMs).toEqual({ '2026-11-02': 2000, '2026-11-03': 1000 });
  expect(p.evidence.day).toBe('2026-11-03');
  expect(p.evidence.chapters['1:1']).toEqual({ furthestVerse: 0, engagedMs: 1000 });
});
