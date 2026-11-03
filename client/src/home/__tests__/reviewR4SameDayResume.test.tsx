// Sol review R-4 round 2, F1: the greeting refreshes on a same-day resume (orchestrator-owned).
import { act, screen } from '@testing-library/react-native';
import { AppState, type AppStateStatus } from 'react-native';

import { renderHome } from './homeHarness';

it('refreshes the greeting when returning later the same day', async () => {
  const clock = new Date(2026, 10, 4, 11, 59);
  let onChange: ((state: AppStateStatus) => void) | undefined;
  const listener = jest.spyOn(AppState, 'addEventListener')
    .mockImplementation((event, cb) => {
      if (event === 'change') onChange = cb;
      return { remove: jest.fn() };
    });

  try {
    await renderHome({
      now: clock,
      position: { bookNumber: 43, chapter: 3, translation: 'WEB' },
    });
    await screen.findByTestId('home-votd-text');
    expect(screen.getByTestId('home-greeting').props.children)
      .toBe('Good morning');

    await act(async () => { onChange?.('background'); });
    clock.setHours(13, 0);
    await act(async () => { onChange?.('active'); });

    expect(screen.getByTestId('home-greeting').props.children)
      .toBe('Good afternoon');
  } finally {
    listener.mockRestore();
  }
});

// Orchestrator: the greeting also changes while Home stays open (no resume), at 12:00 and 17:00.
it('changes the greeting at noon while Home stays open', async () => {
  jest.useFakeTimers({ doNotFake: ['queueMicrotask', 'nextTick', 'setImmediate'] });
  try {
    const clock = new Date(2026, 10, 4, 11, 59, 59);
    await renderHome({ now: clock, position: { bookNumber: 43, chapter: 3, translation: 'WEB' } });
    expect(screen.getByTestId('home-greeting').props.children).toBe('Good morning');
    clock.setTime(clock.getTime() + 2000);
    await act(async () => {
      await jest.advanceTimersByTimeAsync(2000);
    });
    expect(screen.getByTestId('home-greeting').props.children).toBe('Good afternoon');
  } finally {
    jest.useRealTimers();
  }
});
