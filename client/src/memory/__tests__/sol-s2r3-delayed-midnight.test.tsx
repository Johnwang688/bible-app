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

it.each(['home', 'week'] as const)(
  '%s refreshes yesterday on a post-midnight practice update before its timer runs',
  async (surface) => {
    // P2: a progress/history notification after midnight leaves the screen on yesterday's completed lesson.
    const storage = createStorage(memoryBackend());
    const store = createMemoryStore(storage);
    const yesterday = store.todayLesson(new Date());
    storage.set(memoryLessonKey, {
      ...yesterday,
      steps: yesterday.steps.map((step) => ({ ...step, completedAt: new Date().toISOString() })),
      completedAt: new Date().toISOString(),
    });
    storage.set(memoryHistoryKey, { startedOn: '2026-10-30', completedDates: ['2026-10-31'] });
    await renderMemory(({ onNavigate }) => surface === 'home'
      ? <MemoryHome storage={storage} onNavigate={onNavigate} />
      : <WeekScreen storage={storage} onNavigate={onNavigate} />);
    expect(screen.getByTestId(surface === 'home' ? 'memory-lesson-done' : 'memory-week-done')).toBeTruthy();

    jest.setSystemTime(new Date(2026, 10, 1, 0, 0, 1));
    await act(async () => {
      const step = yesterday.steps[0]!;
      store.submitStep({ index: null, verseId: step.verseId, stage: step.stage, passed: true, now: new Date() });
    });

    expect(screen.queryByTestId(surface === 'home' ? 'memory-lesson-done' : 'memory-week-done')).toBeNull();
    expect(storage.get(memoryLessonKey)?.date).toBe('2026-11-01');
    expect(screen.getByTestId('memory-day-2026-11-01').props.accessibilityLabel).toMatch(/today/i);
    await screen.unmount();
  },
);