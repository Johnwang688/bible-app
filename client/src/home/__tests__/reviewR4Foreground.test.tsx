// Sol review R-4 round 2, F3 (mutant killer): a resume after midnight refreshes before any timer runs (orchestrator-owned).
import { act, screen } from '@testing-library/react-native';
import { AppState, type AppStateStatus } from 'react-native';

import { renderHome } from './homeHarness';

it('refreshes after suspension across midnight before timers run', async () => {
  const clock = new Date(2026, 10, 4, 23, 0);
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
      progress: { activeMs: { '2026-11-04': 420000 } },
    });
    await screen.findByTestId('home-votd-text');
    expect(screen.getByTestId('home-goal-done').props.children).toBe('7');

    await act(async () => { onChange?.('background'); });
    clock.setTime(new Date(2026, 10, 5, 8, 0).getTime());
    await act(async () => { onChange?.('active'); });

    expect(screen.getByTestId('home-date').props.children)
      .toBe('Thursday, November 5');
    expect(screen.getByTestId('home-goal-done').props.children).toBe('0');
  } finally {
    listener.mockRestore();
  }
});
