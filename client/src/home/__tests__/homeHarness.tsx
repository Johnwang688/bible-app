// Test harness for the Home tab (R-4): the reader's fake API and every provider the screen needs.
// Orchestrator-owned.
import { QueryClient } from '@tanstack/react-query';
import { render } from '@testing-library/react-native';
import { SafeAreaProvider } from 'react-native-safe-area-context';

import type { ApiClient } from '../../api/client';
import { ApiProvider } from '../../api/ApiProvider';
import { I18nProvider } from '../../i18n/I18nProvider';
import type { DeviceLocale } from '../../i18n/types';
import { EN, fakeApi, type FakeApiOptions } from '../../reader/__tests__/readerHarness';
import { readerPositionKey, readingProgressKey, type ReaderPosition, type ReadingProgress } from '../../storage/keys';
import { createStorage, memoryBackend, type Storage } from '../../storage/storage';
import { ThemeProvider } from '../../theme/ThemeProvider';
import { HomeScreen } from '../HomeScreen';

export interface RenderHomeOptions extends FakeApiOptions {
  storage?: Storage;
  progress?: Partial<ReadingProgress>;
  position?: ReaderPosition;
  locales?: DeviceLocale[];
  /** "Now" for the greeting, the date, today's goal and the verse of the day. Default: Wed 4 Nov 2026, 18:00. */
  now?: Date;
  /** The Surprise me random source. */
  random?: () => number;
  /** The book catalogue never arrives (Surprise me before the books load). */
  booksPending?: boolean;
}

export async function renderHome(opts: RenderHomeOptions = {}) {
  const storage = opts.storage ?? createStorage(memoryBackend());
  if (opts.progress) storage.set(readingProgressKey, { ...storage.get(readingProgressKey), ...opts.progress });
  if (opts.position) storage.set(readerPositionKey, opts.position);
  const fake = fakeApi(opts);
  const api = (
    opts.booksPending ? { ...(fake.api as object), books: () => new Promise(() => undefined) } : fake.api
  ) as ApiClient;
  const queryClient = new QueryClient({ defaultOptions: { queries: { retry: false, gcTime: Infinity } } });
  const locales = opts.locales ?? [EN];
  const navigate = jest.fn();
  const now = opts.now ?? new Date(2026, 10, 4, 18, 0);
  const ui = await render(
    <SafeAreaProvider initialMetrics={{ frame: { x: 0, y: 0, width: 390, height: 844 }, insets: { top: 47, left: 0, right: 0, bottom: 34 } }}>
      <ApiProvider client={api} queryClient={queryClient}>
        <I18nProvider storage={storage} locales={locales}>
          <ThemeProvider storage={storage} systemScheme="light">
            <HomeScreen storage={storage} locales={locales} now={() => now} navigate={navigate} random={opts.random} />
          </ThemeProvider>
        </I18nProvider>
      </ApiProvider>
    </SafeAreaProvider>,
  );
  return { ui, storage, calls: fake.calls, navigate, queryClient };
}
