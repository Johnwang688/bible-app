// Sol GAPS 2 review round 3 (orchestrator-owned): a counterexample, kept as a regression test.
import { fireEvent, screen } from '@testing-library/react-native';

import { appearanceKey } from '../../storage/keys';
import { memoryLessonKey } from '../../storage/memoryKeys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { renderHome } from './homeHarness';

afterEach(() => jest.useRealTimers());

it('keeps See the week pointing at the week when midnight passes before timers run', async () => {
  jest.useFakeTimers({ doNotFake: ['queueMicrotask', 'nextTick', 'setImmediate'] });
  const clock = new Date(2026, 10, 4, 23, 59, 59);
  const storage = createStorage(memoryBackend());
  storage.set(appearanceKey, { preset: 'strawberry-milk', mode: 'light' });
  storage.set(memoryLessonKey, {
    date: '2026-11-04',
    steps: [{
      verseId: '2-corinthians-5-17',
      stage: 'chunk-order',
      completedAt: '2026-11-04T08:00:00.000Z',
    }],
    completedAt: '2026-11-04T08:00:00.000Z',
  });
  const { go } = await renderHome({ storage, now: clock });
  expect(screen.getByTestId('home-memory').props.accessibilityLabel).toBe('See the week');

  clock.setTime(new Date(2026, 10, 5, 0, 0, 1).getTime());
  await fireEvent.press(screen.getByTestId('home-memory'));

  expect(go).toHaveBeenCalledWith('/study/memory/week');
});
