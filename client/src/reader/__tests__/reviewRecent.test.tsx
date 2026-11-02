// Verifier round 1 on the reader UI (GPT-6.1 Sol). Orchestrator-owned; do not edit.
import { fireEvent, screen } from '@testing-library/react-native';

import {
  readerPositionKey,
  readingSettingsKey,
  recentPassagesKey,
} from '../../storage/keys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { renderReader } from './readerHarness';

it('restores a recent translation while keeping distinct parallel sides', async () => {
  const storage = createStorage(memoryBackend());
  storage.set(readingSettingsKey, {
    textSize: 2,
    parallel: 'CUV-SIMP',
  });
  storage.set(recentPassagesKey, [
    { bookNumber: 43, chapter: 5, translation: 'CUV-SIMP' },
  ]);
  const h = await renderReader({
    storage,
    position: { bookNumber: 43, chapter: 4, translation: 'BSB' },
  });

  try {
    await screen.findByTestId('verse-row-1');
    await fireEvent.press(screen.getByTestId('reader-book-button'));
    await fireEvent.press(await screen.findByTestId('picker-recent-0'));

    expect(storage.get(readerPositionKey)).toEqual({
      bookNumber: 43,
      chapter: 5,
      translation: 'CUV-SIMP',
    });
    expect(storage.get(readingSettingsKey).parallel).toBe('BSB');
    await screen.findByTestId('verse-1-second');
  } finally {
    await h.ui.unmount();
    h.queryClient.clear();
  }
});
