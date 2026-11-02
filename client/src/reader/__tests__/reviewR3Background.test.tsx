// Regression test from the Sol review of the R-3 teams (round 1, F6).
import { act, renderHook } from '@testing-library/react-native';
import { AppState, type AppStateStatus } from 'react-native';

import { readingProgressKey } from '../../storage/keys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { useReadingTime } from '../components/useReadingTime';

it('pauses in the background and restarts when active', async () => {
  jest.useFakeTimers();
  const saved = AppState.currentState;
  let listener: ((state: AppStateStatus) => void) | undefined;
  const subscription = jest.spyOn(AppState, 'addEventListener')
    .mockImplementation((event, cb) => {
      if (event === 'change') listener = cb;
      return { remove: jest.fn() };
    });
  Object.defineProperty(AppState, 'currentState', {
    configurable: true, writable: true, value: 'active',
  });
  const storage = createStorage(memoryBackend());
  let t = new Date(2026, 10, 2, 9).getTime();
  const now = () => t;
  const chapter = { bookNumber: 43, chapter: 3, totalVerses: 36 };

  try {
    const h = await renderHook(() =>
      useReadingTime({ storage, now, chapter, focused: true }),
    );
    t += 1000;
    await act(() => {
      AppState.currentState = 'background';
      listener?.('background');
    });
    t += 5000;
    await act(() => jest.advanceTimersByTime(5000));
    await act(() => {
      AppState.currentState = 'active';
      listener?.('active');
    });
    t += 1000;
    await h.unmount();

    expect(storage.get(readingProgressKey).activeMs['2026-11-02'])
      .toBe(2000);
  } finally {
    AppState.currentState = saved;
    subscription.mockRestore();
    jest.useRealTimers();
  }
});
