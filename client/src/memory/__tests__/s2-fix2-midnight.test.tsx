// S2-fix2 (implementer-hard): try to break "a plan is only ever written by todayLesson(now()) at the time of
// writing, so a stored plan is never replaced by an older day's" (useTodayLesson.ts).
import { act, screen, within } from '@testing-library/react-native';

import { memoryLessonKey } from '../../storage/memoryKeys';
import { createStorage, memoryBackend, type Storage } from '../../storage/storage';
import type { DailyLessonRecord } from '../dailyLesson';
import { createMemoryStore } from '../memoryStore';
import { MemoryHome } from '../ui/home/MemoryHome';
import { WeekScreen } from '../ui/home/WeekScreen';
import { renderMemory } from './memoryHarness';

const HOUR = 3_600_000;

beforeEach(() => {
  jest.useFakeTimers();
  jest.setSystemTime(new Date(2026, 9, 31, 23, 59, 59));
});

afterEach(() => {
  jest.useRealTimers();
});

/** Every plan written to storage, in order (the dates and the plans themselves). */
function recordWrites(storage: Storage) {
  const writes: DailyLessonRecord[] = [];
  const stop = storage.subscribe(memoryLessonKey, () => {
    const v = storage.get(memoryLessonKey);
    if (v !== null) writes.push(v);
  });
  return { writes, stop, dates: () => writes.map((w) => w.date) };
}

function expectNeverBackwards(dates: string[]) {
  for (let i = 1; i < dates.length; i++) expect(dates[i]! >= dates[i - 1]!).toBe(true);
}

/** Another screen (a trainer) opens today's plan by the clock and ticks its first step. */
function otherScreenTicksFirstStep(storage: Storage): DailyLessonRecord {
  const plan = createMemoryStore(storage).todayLesson(new Date());
  const ticked = {
    ...plan,
    steps: plan.steps.map((s, i) => (i === 0 ? { ...s, completedAt: new Date().toISOString() } : s)),
  };
  storage.set(memoryLessonKey, ticked);
  return ticked;
}

it('home and week mounted together across midnight: one new-day plan, written once, never rolled back', async () => {
  const storage = createStorage(memoryBackend());
  await renderMemory(({ onNavigate }) => (
    <>
      <MemoryHome storage={storage} onNavigate={onNavigate} />
      <WeekScreen storage={storage} onNavigate={onNavigate} />
    </>
  ));
  expect(storage.get(memoryLessonKey)?.date).toBe('2026-10-31');
  const log = recordWrites(storage);

  await act(async () => { jest.advanceTimersByTime(2000); });

  expect(log.dates()).toEqual(['2026-11-01']);
  expect(screen.getAllByTestId('memory-day-2026-11-01')).toHaveLength(2);
  expect(within(screen.getByTestId('memory-week')).getByTestId('memory-day-2026-11-01').props.accessibilityLabel).toMatch(/today/i);

  // Another day passes with both still open: still one write per day, forwards only.
  await act(async () => { jest.advanceTimersByTime(24 * HOUR + HOUR); });
  expectNeverBackwards(log.dates());
  expect(new Set(log.dates()).size).toBe(log.dates().length);
  expect(storage.get(memoryLessonKey)?.date).toBe('2026-11-02');
  log.stop();
});

it('a tick written by another screen just before midnight is kept, and the new day is opened at midnight', async () => {
  const storage = createStorage(memoryBackend());
  await renderMemory(({ onNavigate }) => <MemoryHome storage={storage} onNavigate={onNavigate} />);
  const log = recordWrites(storage);

  jest.setSystemTime(new Date(2026, 9, 31, 23, 59, 59, 500));
  await act(async () => { otherScreenTicksFirstStep(storage); });
  expect(storage.get(memoryLessonKey)?.steps[0]?.completedAt).not.toBeNull();
  expect(screen.getByTestId('memory-lesson-start')).toHaveTextContent('Continue');

  await act(async () => { jest.advanceTimersByTime(1000); });
  expect(storage.get(memoryLessonKey)?.date).toBe('2026-11-01');
  expect(screen.getByTestId('memory-lesson-start')).toHaveTextContent('Start');
  expect(log.dates()).toEqual(['2026-10-31', '2026-11-01']);
  log.stop();
});

it('a new-day plan with a tick, written by another screen just after midnight, survives the mounted screens', async () => {
  const storage = createStorage(memoryBackend());
  await renderMemory(({ onNavigate }) => (
    <>
      <MemoryHome storage={storage} onNavigate={onNavigate} />
      <WeekScreen storage={storage} onNavigate={onNavigate} />
    </>
  ));
  const log = recordWrites(storage);

  // The clock is past midnight, but neither screen's timer has fired yet.
  jest.setSystemTime(new Date(2026, 10, 1, 0, 0, 0, 1));
  let ticked: DailyLessonRecord | undefined;
  await act(async () => { ticked = otherScreenTicksFirstStep(storage); });

  // Nothing written by the screens; they moved on to the stored day.
  expect(storage.get(memoryLessonKey)).toEqual(ticked);
  expect(screen.getByTestId('memory-lesson-start')).toHaveTextContent('Continue');
  expect(screen.getAllByTestId('memory-day-2026-11-01')).toHaveLength(2);

  // Their timers (old and re-set) fire: still nothing overwritten.
  await act(async () => { jest.advanceTimersByTime(5000); });
  expect(storage.get(memoryLessonKey)).toEqual(ticked);
  expectNeverBackwards(log.dates());
  expect(log.dates().every((d) => d === '2026-11-01')).toBe(true);
  log.stop();
});

it('a remount after midnight opens the new day; the unmounted screen writes nothing', async () => {
  const storage = createStorage(memoryBackend());
  const first = await renderMemory(({ onNavigate }) => <WeekScreen storage={storage} onNavigate={onNavigate} />);
  expect(storage.get(memoryLessonKey)?.date).toBe('2026-10-31');
  const log = recordWrites(storage);
  await first.ui.unmount();

  await act(async () => { jest.advanceTimersByTime(5000); });
  expect(log.writes).toHaveLength(0);
  expect(storage.get(memoryLessonKey)?.date).toBe('2026-10-31');

  await renderMemory(({ onNavigate }) => <WeekScreen storage={storage} onNavigate={onNavigate} />);
  expect(storage.get(memoryLessonKey)?.date).toBe('2026-11-01');
  expect(screen.getByTestId('memory-day-2026-11-01').props.accessibilityLabel).toMatch(/today/i);
  expect(log.dates()).toEqual(['2026-11-01']);
  log.stop();
});

it('DST: on 1 Nov 2026 (US clocks fell back) the day rolls over at local midnight, not 24 h after the last one', async () => {
  // A test file cannot change the zone, so it is measured: 25 h where the host is in a US zone (America/Chicago on
  // the dev machine), 24 h in a zone without the change, where this is a plain-day test.
  const dayMs = new Date(2026, 10, 2).getTime() - new Date(2026, 10, 1).getTime();
  jest.setSystemTime(new Date(2026, 10, 1, 0, 30));
  const storage = createStorage(memoryBackend());
  await renderMemory(({ onNavigate }) => <MemoryHome storage={storage} onNavigate={onNavigate} />);
  expect(storage.get(memoryLessonKey)?.date).toBe('2026-11-01');
  const log = recordWrites(storage);

  let elapsed = 0;
  const advance = async (ms: number) => {
    elapsed += ms;
    await act(async () => { jest.advanceTimersByTime(ms); });
  };
  // A second past 24 h after the previous midnight is still 1 November on a 25-hour day.
  if (dayMs > 24 * HOUR) {
    await advance(24 * HOUR - 30 * 60_000 + 1000);
    expect(new Date().getHours()).toBe(23);
    expect(storage.get(memoryLessonKey)?.date).toBe('2026-11-01');
  }

  // One second before local midnight: still 1 November.
  await advance(dayMs - 30 * 60_000 - 1000 - elapsed);
  expect(new Date().getDate()).toBe(1);
  expect(storage.get(memoryLessonKey)?.date).toBe('2026-11-01');
  expect(log.writes).toHaveLength(0);

  // Past local midnight: 2 November, written once.
  await act(async () => { jest.advanceTimersByTime(2000); });
  expect(storage.get(memoryLessonKey)?.date).toBe('2026-11-02');
  expect(screen.queryByTestId('memory-day-2026-11-02')).not.toBeNull();
  expect(log.dates()).toEqual(['2026-11-02']);
  log.stop();
});
