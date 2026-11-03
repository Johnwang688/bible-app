// Sol review R-4 round 3, F2 (orchestrator-owned, mutant killer): the greeting turns to evening at 17:00 while Home stays open.
import { act, screen } from '@testing-library/react-native';
import { renderHome } from './homeHarness';

it('changes to the evening greeting at 17:00 without a resume', async () => {
  jest.useFakeTimers({
    doNotFake: ['queueMicrotask', 'nextTick', 'setImmediate'],
  });
  let ui: Awaited<ReturnType<typeof renderHome>>['ui'] | undefined;

  try {
    const clock = new Date(2026, 10, 4, 16, 59, 59);
    ({ ui } = await renderHome({
      now: clock,
      position: { bookNumber: 43, chapter: 3, translation: 'WEB' },
    }));
    expect(screen.getByTestId('home-greeting').props.children)
      .toBe('Good afternoon');

    clock.setTime(clock.getTime() + 2000);
    await act(async () => {
      await jest.advanceTimersByTimeAsync(2000);
    });

    expect(screen.getByTestId('home-greeting').props.children)
      .toBe('Good evening');
  } finally {
    await ui?.unmount();
    jest.useRealTimers();
  }
});
