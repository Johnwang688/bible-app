// Sol GAPS 2 review round 1 (orchestrator-owned): counterexamples, kept as regression tests.
import { fireEvent, screen } from '@testing-library/react-native';

import { appearanceKey } from '../../storage/keys';
import { memoryLessonKey } from '../../storage/memoryKeys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { renderHome } from './homeHarness';

const TODAY = '2026-11-04';
const AT = '2026-11-04T08:00:00.000Z';

it('shows the ordinal of the skipped step that Continue actually opens', async () => {
  const storage = createStorage(memoryBackend());
  storage.set(appearanceKey, { preset: 'strawberry-milk', mode: 'light' });
  storage.set(memoryLessonKey, {
    date: TODAY,
    steps: [
      { verseId: '2-corinthians-5-17', stage: 'chunk-order', completedAt: null },
      { verseId: '2-corinthians-5-17', stage: 'fill-blank', completedAt: AT },
      { verseId: '2-corinthians-5-17', stage: 'full-recall', completedAt: AT },
      { verseId: 'galatians-2-20', stage: 'full-recall', completedAt: AT },
    ],
    completedAt: null,
  });

  const { go } = await renderHome({ storage });
  await fireEvent.press(screen.getByTestId('home-memory'));
  const href = go.mock.calls[0]![0] as string;
  const index = Number(new URL(href, 'https://example.test').searchParams.get('i'));

  expect(index).toBe(0);
  expect(screen.getByTestId('home-memory-sub').props.children).toBe(
    'Step ' + (index + 1) + ' of 4',
  );
});

it('does not offer a lesson whose accessible name has an empty verse reference', async () => {
  const storage = createStorage(memoryBackend());
  storage.set(appearanceKey, { preset: 'strawberry-milk', mode: 'light' });
  storage.set(memoryLessonKey, {
    date: TODAY,
    steps: [{ verseId: 'unknown-verse', stage: 'chunk-order', completedAt: null }],
    completedAt: null,
  });

  await renderHome({ storage });
  expect(screen.getByTestId('home-memory').props.accessibilityLabel).not.toBe(
    'Start Memory lesson, ',
  );
});
