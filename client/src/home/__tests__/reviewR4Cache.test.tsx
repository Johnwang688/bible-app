// Sol R-4 goal review round 1, F1 (orchestrator-owned): today's cached verse shows before the book catalogue arrives.
import { screen } from '@testing-library/react-native';

import { createStorage, memoryBackend } from '../../storage/storage';
import { lastVerseKey } from '../homeKeys';
import { renderHome } from './homeHarness';

it('shows today’s cached verse before the book catalogue arrives', async () => {
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
    position: { bookNumber: 43, chapter: 3, translation: 'WEB' },
    booksPending: true,
  });

  expect(screen.getByTestId('home-votd-text').props.children)
    .toBe('Saved today.');
  expect(screen.getByTestId('home-votd-ref').props.children)
    .toBe('John 3:16');
});
