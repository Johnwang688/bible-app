import { act, screen } from '@testing-library/react-native';

import { memoryLessonKey } from '../../storage/memoryKeys';
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

it('mounted home must not overwrite the new day plan before its midnight callback runs', async () => {
  // P2: another screen's new-day plan is overwritten with the home hook's cached yesterday.
  const storage = createStorage(memoryBackend());
  await renderMemory(({ onNavigate }) => <MemoryHome storage={storage} onNavigate={onNavigate} />);
  expect(storage.get(memoryLessonKey)?.date).toBe('2026-10-31');
  jest.setSystemTime(new Date(2026, 10, 1, 0, 0, 0));
  await act(async () => {
    createMemoryStore(storage).todayLesson(new Date());
  });
  expect(storage.get(memoryLessonKey)?.date).toBe('2026-11-01');
  expect(screen.queryByTestId('memory-day-2026-11-01')).not.toBeNull();
});

it('mounted week must not overwrite the new day plan before its midnight callback runs', async () => {
  // P2: the week hook rolls shared lesson storage back if home advances before its timer fires.
  const storage = createStorage(memoryBackend());
  await renderMemory(({ onNavigate }) => <WeekScreen storage={storage} onNavigate={onNavigate} />);
  expect(storage.get(memoryLessonKey)?.date).toBe('2026-10-31');
  jest.setSystemTime(new Date(2026, 10, 1, 0, 0, 0));
  await act(async () => {
    createMemoryStore(storage).todayLesson(new Date());
  });
  expect(storage.get(memoryLessonKey)?.date).toBe('2026-11-01');
  expect(screen.getByTestId('memory-day-2026-11-01').props.accessibilityLabel).toMatch(/today/i);
});
