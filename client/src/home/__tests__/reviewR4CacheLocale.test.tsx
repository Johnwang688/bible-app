// Sol R-4 goal review round 2, F3 (orchestrator-owned): mutant killer, the fallback book name follows the interface
// locale (simplified Chinese) before the catalogue arrives.
import { screen } from '@testing-library/react-native';

import { ZH } from '../../reader/__tests__/readerHarness';
import { createStorage, memoryBackend } from '../../storage/storage';
import { lastVerseKey } from '../homeKeys';
import { renderHome } from './homeHarness';

it('uses the interface locale before the catalogue arrives', async () => {
  const storage = createStorage(memoryBackend());
  storage.set(lastVerseKey, {
    day: '2026-11-04',
    translation: 'WEB',
    bookNumber: 43,
    chapter: 3,
    verse: 16,
    text: 'Saved today.',
  });

  await renderHome({
    storage,
    locales: [ZH],
    position: { bookNumber: 43, chapter: 3, translation: 'WEB' },
    booksPending: true,
  });

  expect(screen.getByTestId('home-votd-text').props.children)
    .toBe('Saved today.');
  expect(screen.getByTestId('home-votd-ref').props.children)
    .toBe('约翰福音 3:16');
});
