import { act, screen } from '@testing-library/react-native';

import { memoryHistoryKey, memoryLessonKey } from '../../storage/memoryKeys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { createMemoryStore } from '../memoryStore';
import { MemoryHome } from '../ui/home/MemoryHome';
import { WeekScreen } from '../ui/home/WeekScreen';
import { renderMemory } from './memoryHarness';

beforeEach(() => {
  jest.useFakeTimers();
  jest.setSystemTime(new Date(2026, 9, 31, 23, 59, 59));
});

afterEach(() => {
  jest.useRealTimers();
});

it('home opens a new lesson at local midnight without an unrelated render', async () => {
  const storage = createStorage(memoryBackend());
  const previous = createMemoryStore(storage).todayLesson(new Date());
  storage.set(memoryLessonKey, {
    ...previous,
    steps: previous.steps.map((step) => ({ ...step, completedAt: new Date().toISOString() })),
    completedAt: new Date().toISOString(),
  });
  storage.set(memoryHistoryKey, { startedOn: '2026-10-30', completedDates: ['2026-10-31'] });
  await renderMemory(({ onNavigate }) => <MemoryHome storage={storage} onNavigate={onNavigate} />);
  expect(screen.getByTestId('memory-lesson-done')).toBeTruthy();

  await act(async () => { jest.advanceTimersByTime(2000); });

  // P2: the completed October 31 plan remains displayed as today's lesson on November 1.
  expect(storage.get(memoryLessonKey)?.date).toBe('2026-11-01');
  expect(screen.queryByTestId('memory-lesson-done')).toBeNull();
  expect(screen.getByTestId('memory-lesson-start')).toHaveTextContent('Start');
});

it('home expires yesterday-surviving streak at local midnight while idle', async () => {
  const storage = createStorage(memoryBackend());
  storage.set(memoryHistoryKey, { startedOn: '2026-10-30', completedDates: ['2026-10-30'] });
  await renderMemory(({ onNavigate }) => <MemoryHome storage={storage} onNavigate={onNavigate} />);
  expect(screen.getByTestId('memory-streak-chip')).toHaveTextContent(/1\s*day streak/);

  await act(async () => { jest.advanceTimersByTime(2000); });

  // P2: a missed October 31 never expires the streak until another state change causes a render.
  expect(screen.getByTestId('memory-streak-chip')).toHaveTextContent('Start a streak');
});

it('week rolls into Sunday at local midnight while idle', async () => {
  await renderMemory(({ storage, onNavigate }) => <WeekScreen storage={storage} onNavigate={onNavigate} />);
  expect(screen.getByTestId('memory-day-2026-10-31')).toBeTruthy();

  await act(async () => { jest.advanceTimersByTime(2000); });

  // P2: the week continues showing October 25-31 after Sunday November 1 starts.
  expect(screen.queryByTestId('memory-day-2026-11-01')).not.toBeNull();
});


