// Sol review R-4 round 1, F1 (orchestrator-owned): Home moves to the new day at midnight without another render.
// Rewritten by the orchestrator from Sol's test: fake timers are installed before the render, so a timer the
// screen sets while mounting is one the test can advance.
import { act, screen } from '@testing-library/react-native';

import { renderHome } from './homeHarness';

afterEach(() => jest.useRealTimers());

it('refreshes the date, goal and daily verse across midnight', async () => {
  jest.useFakeTimers({ doNotFake: ['queueMicrotask', 'nextTick', 'setImmediate'] });
  const clock = new Date(2026, 10, 4, 23, 59, 59);
  await renderHome({
    position: { bookNumber: 43, chapter: 3, translation: 'WEB' },
    now: clock,
    progress: { activeMs: { '2026-11-04': 7 * 60_000 } },
  });
  await screen.findByTestId('home-votd-text');
  expect(screen.getByTestId('home-goal-done').props.children).toBe('7');

  clock.setTime(clock.getTime() + 2000);
  await act(async () => {
    await jest.advanceTimersByTimeAsync(2000);
  });

  expect(screen.getByTestId('home-date').props.children).toBe('Thursday, November 5');
  expect(screen.getByTestId('home-goal-done').props.children).toBe('0');
  expect(screen.queryByTestId('home-votd-ref')?.props.children).not.toBe('John 3:16');
});

it('keeps moving: the next midnight too', async () => {
  jest.useFakeTimers({ doNotFake: ['queueMicrotask', 'nextTick', 'setImmediate'] });
  const clock = new Date(2026, 10, 4, 23, 59, 59);
  await renderHome({ position: { bookNumber: 43, chapter: 3, translation: 'WEB' }, now: clock });
  clock.setTime(clock.getTime() + 2000);
  await act(async () => {
    await jest.advanceTimersByTimeAsync(2000);
  });
  clock.setTime(new Date(2026, 10, 6, 0, 0, 1).getTime());
  await act(async () => {
    await jest.advanceTimersByTimeAsync(24 * 60 * 60_000);
  });
  expect(screen.getByTestId('home-date').props.children).toBe('Friday, November 6');
});
