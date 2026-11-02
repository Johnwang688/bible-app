// Regression test from the Sol review of the R-3 teams (round 1, F7).
import { screen } from '@testing-library/react-native';

import { ZH } from '../../reader/__tests__/readerHarness';
import { renderStudy } from './studyHarness';

it('joins Chinese verses without an inserted space', async () => {
  await renderStudy({
    locales: [ZH],
    position: {
      bookNumber: 43, chapter: 4, translation: 'CUV-SIMP',
    },
    items: {
      highlights: {
        '43:4:1': {
          colour: 'yellow', updatedAt: '2026-11-02T15:00:00.000Z',
        },
        '43:4:2': {
          colour: 'yellow', updatedAt: '2026-11-02T15:00:00.000Z',
        },
      },
      notes: {},
      bookmarks: {},
    },
  });

  const text = await screen.findByTestId(
    'study-entry-highlight:43:4:1-2-text',
  );
  expect(text.props.children)
    .toBe('John 4:1 CUV-SIMPJohn 4:2 CUV-SIMP');
});
