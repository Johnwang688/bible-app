// Sol review R-4 round 2, F2: midnight still updates after the injected clock is replaced (orchestrator-owned).
import { act, renderHook } from '@testing-library/react-native';
import { AppState } from 'react-native';

import { useToday } from '../useToday';

it('updates at midnight after the injected clock is replaced', async () => {
  jest.useFakeTimers({
    doNotFake: ['queueMicrotask', 'nextTick', 'setImmediate'],
  });
  const subscription = jest.spyOn(AppState, 'addEventListener')
    .mockReturnValue({ remove: jest.fn() });
  let clock = new Date(2026, 10, 4, 23, 59, 59);
  const h = await renderHook(
    ({ now }: { now: () => Date }) => useToday(now).getDate(),
    { initialProps: { now: () => new Date(2026, 10, 5, 12) } },
  );

  try {
    await h.rerender({ now: () => new Date(clock) });
    expect(h.result.current).toBe(4);

    clock = new Date(2026, 10, 5, 0, 0, 1);
    await act(async () => {
      await jest.advanceTimersByTimeAsync(2000);
    });

    expect(h.result.current).toBe(5);
  } finally {
    await h.unmount();
    subscription.mockRestore();
    jest.useRealTimers();
  }
});
