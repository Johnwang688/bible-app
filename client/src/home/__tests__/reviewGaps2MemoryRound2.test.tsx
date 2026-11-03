// Sol GAPS 2 review round 2 (orchestrator-owned): counterexamples, kept as regression tests.
import type { ComponentProps } from 'react';
import { act, fireEvent, screen } from '@testing-library/react-native';

import { startDailyLesson } from '../../memory/dailyLesson';
import { stepHref } from '../../memory/session';
import { appearanceKey } from '../../storage/keys';
import { memoryLessonKey } from '../../storage/memoryKeys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { MemoryCard } from '../HomeCards';
import { renderHome } from './homeHarness';

jest.mock('../HomeCards', () => {
  const React = jest.requireActual<typeof import('react')>('react');
  const actual = jest.requireActual<typeof import('../HomeCards')>('../HomeCards');
  return {
    ...actual,
    MemoryCard: jest.fn((props: ComponentProps<typeof actual.MemoryCard>) =>
      React.createElement(actual.MemoryCard, props)),
  };
});

const TODAY = '2026-11-04';
const AT = '2026-11-04T08:00:00.000Z';
const STEPS = [
  { verseId: '2-corinthians-5-17', stage: 'chunk-order' as const, completedAt: null },
  { verseId: 'galatians-2-20', stage: 'full-recall' as const, completedAt: null },
];

function seeded() {
  const storage = createStorage(memoryBackend());
  storage.set(appearanceKey, { preset: 'strawberry-milk', mode: 'light' });
  storage.set(memoryLessonKey, { date: TODAY, steps: STEPS, completedAt: null });
  return storage;
}

afterEach(() => {
  jest.clearAllMocks();
  jest.useRealTimers();
});

it.each([false, true])(
  'uses the current lesson on press before a storage update rerenders Home (all done: %s)',
  async (allDone) => {
    const storage = seeded();
    const { go } = await renderHome({ storage });
    const press = jest.mocked(MemoryCard).mock.calls.at(-1)![0].onPress;

    await act(async () => {
      storage.set(memoryLessonKey, {
        date: TODAY,
        steps: STEPS.map((step, index) => ({
          ...step,
          completedAt: allDone || index === 0 ? AT : null,
        })),
        completedAt: allDone ? AT : null,
      });
      press();
    });

    expect(go).toHaveBeenCalledWith(
      allDone ? '/study/memory/week' : stepHref(STEPS, 1),
    );
  },
);

it('opens the new day lesson if midnight passes before the timers run', async () => {
  jest.useFakeTimers({ doNotFake: ['queueMicrotask', 'nextTick', 'setImmediate'] });
  const clock = new Date(2026, 10, 4, 23, 59, 59);
  const storage = seeded();
  const { go } = await renderHome({ storage, now: clock });

  clock.setTime(new Date(2026, 10, 5, 0, 0, 1).getTime());
  const today = startDailyLesson(null, {}, clock);
  await fireEvent.press(screen.getByTestId('home-memory'));

  expect(go).toHaveBeenCalledWith(stepHref(today.steps, 0));
});
