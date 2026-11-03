// Sol GAPS 2 review round 4 (orchestrator-owned): a counterexample, kept as a regression test.
// Opening today's plan can synchronously notify another writer.
import { fireEvent, screen } from '@testing-library/react-native';

import { createMemoryStore } from '../../memory/memoryStore';
import { stepHref } from '../../memory/session';
import { appearanceKey } from '../../storage/keys';
import { memoryLessonKey } from '../../storage/memoryKeys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { renderHome } from './homeHarness';

afterEach(() => jest.useRealTimers());

it.each([false, true])(
  'uses the updated new-day plan when its opening notifies a writer (all done: %s)',
  async (allDone) => {
    jest.useFakeTimers({ doNotFake: ['queueMicrotask', 'nextTick', 'setImmediate'] });
    const clock = new Date(2026, 10, 4, 23, 59, 59);
    const storage = createStorage(memoryBackend());
    storage.set(appearanceKey, { preset: 'strawberry-milk', mode: 'light' });
    storage.set(memoryLessonKey, {
      date: '2026-11-04',
      steps: [{
        verseId: '2-corinthians-5-17',
        stage: 'chunk-order',
        completedAt: null,
      }],
      completedAt: null,
    });
    const { go } = await renderHome({ storage, now: clock });
    expect(screen.getByTestId('home-memory').props.accessibilityLabel)
      .toBe('Start Memory lesson, 2 Corinthians 5:17');

    // Complete a step (or the plan) when the press opens the new day,
    // before todayLesson returns to Home's navigation handler.
    let delivered = false;
    const unsubscribe = storage.subscribe(memoryLessonKey, () => {
      const opened = storage.get(memoryLessonKey);
      if (delivered || opened?.date !== '2026-11-05') return;
      delivered = true;
      const store = createMemoryStore(storage);
      opened.steps.forEach((step, index) => {
        if (allDone || index === 0) {
          store.submitStep({
            index,
            verseId: step.verseId,
            stage: step.stage,
            passed: true,
            now: clock,
          });
        }
      });
    });

    try {
      clock.setTime(new Date(2026, 10, 5, 0, 0, 1).getTime());
      await fireEvent.press(screen.getByTestId('home-memory'));

      expect(delivered).toBe(true);
      const current = storage.get(memoryLessonKey)!;
      const next = current.steps.findIndex((step) => step.completedAt === null);
      expect(next).toBe(allDone ? -1 : 1);
      expect(go).toHaveBeenCalledWith(
        next === -1 ? '/study/memory/week' : stepHref(current.steps, next),
      );
    } finally {
      unsubscribe();
    }
  },
);
