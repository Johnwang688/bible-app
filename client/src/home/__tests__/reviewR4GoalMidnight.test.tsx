// Sol R-4 goal review round 1, F2 (orchestrator-owned): GoalSheet, mounted without Home, moves to the new day at
// midnight ("Today counts as done" is for today only).
import { act, render, screen } from '@testing-library/react-native';
import { SafeAreaProvider } from 'react-native-safe-area-context';

import { I18nProvider } from '../../i18n/I18nProvider';
import { readingProgressKey } from '../../storage/keys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { ThemeProvider } from '../../theme/ThemeProvider';
import { GoalSheet } from '../GoalSheet';

it('stops showing yesterday as completed when mounted without Home', async () => {
  jest.useFakeTimers({
    doNotFake: ['queueMicrotask', 'nextTick', 'setImmediate'],
  });
  const clock = new Date(2026, 10, 4, 23, 59, 59);
  const storage = createStorage(memoryBackend());

  storage.set(readingProgressKey, {
    ...storage.get(readingProgressKey),
    goalMetDays: ['2026-11-04'],
  });

  const ui = await render(
    <SafeAreaProvider initialMetrics={{
      frame: { x: 0, y: 0, width: 390, height: 844 },
      insets: { top: 0, left: 0, right: 0, bottom: 0 },
    }}>
      <I18nProvider storage={storage} locales={[{
        languageTag: 'en-US',
        languageCode: 'en',
        regionCode: 'US',
      }]}>
        <ThemeProvider storage={storage} systemScheme="light">
          <GoalSheet
            storage={storage}
            now={() => clock}
            onClose={() => {}}
          />
        </ThemeProvider>
      </I18nProvider>
    </SafeAreaProvider>,
  );

  try {
    expect(screen.getByTestId('goal-met-today')).toBeTruthy();

    clock.setTime(new Date(2026, 10, 5, 0, 0, 1).getTime());
    await act(async () => {
      await jest.advanceTimersByTimeAsync(2000);
    });

    expect(screen.queryByTestId('goal-met-today')).toBeNull();
  } finally {
    await ui.unmount();
    jest.useRealTimers();
  }
});
