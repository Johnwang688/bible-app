// Test harness for the Study tab (R-3): the reader's fake API and every provider the screen needs.
// Orchestrator-owned.
import { QueryClient } from '@tanstack/react-query';
import { render } from '@testing-library/react-native';
import { SafeAreaProvider } from 'react-native-safe-area-context';

import { ApiProvider } from '../../api/ApiProvider';
import { I18nProvider } from '../../i18n/I18nProvider';
import type { DeviceLocale } from '../../i18n/types';
import { EN, fakeApi, type FakeApiOptions } from '../../reader/__tests__/readerHarness';
import {
  readerPositionKey,
  readingProgressKey,
  studyItemsKey,
  type ReaderPosition,
  type ReadingProgress,
  type StudyItems,
} from '../../storage/keys';
import { createStorage, memoryBackend, type Storage } from '../../storage/storage';
import { ThemeProvider } from '../../theme/ThemeProvider';
import { StudyScreen } from '../components/StudyScreen';

export interface RenderStudyOptions extends FakeApiOptions {
  storage?: Storage;
  items?: StudyItems;
  progress?: Partial<ReadingProgress>;
  position?: ReaderPosition;
  locales?: DeviceLocale[];
  /** "Now" for the progress view (today, this week). */
  now?: Date;
}

export async function renderStudy(opts: RenderStudyOptions = {}) {
  const storage = opts.storage ?? createStorage(memoryBackend());
  if (opts.items) storage.set(studyItemsKey, opts.items);
  if (opts.progress) storage.set(readingProgressKey, { ...storage.get(readingProgressKey), ...opts.progress });
  if (opts.position) storage.set(readerPositionKey, opts.position);
  const { api, calls } = fakeApi(opts);
  const queryClient = new QueryClient({ defaultOptions: { queries: { retry: false, gcTime: Infinity } } });
  const locales = opts.locales ?? [EN];
  const navigate = jest.fn();
  const now = opts.now ?? new Date(2026, 10, 4, 18, 0);
  const ui = await render(
    <SafeAreaProvider initialMetrics={{ frame: { x: 0, y: 0, width: 390, height: 844 }, insets: { top: 47, left: 0, right: 0, bottom: 34 } }}>
      <ApiProvider client={api} queryClient={queryClient}>
        <I18nProvider storage={storage} locales={locales}>
          <ThemeProvider storage={storage} systemScheme="light">
            <StudyScreen storage={storage} locales={locales} now={() => now} navigate={navigate} />
          </ThemeProvider>
        </I18nProvider>
      </ApiProvider>
    </SafeAreaProvider>,
  );
  return { ui, storage, calls, navigate, queryClient };
}
