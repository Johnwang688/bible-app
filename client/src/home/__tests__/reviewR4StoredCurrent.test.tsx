// Sol review R-4 round 1, F2 (orchestrator-owned, mutant killer): Surprise me excludes the stored chapter, not the rendered one.
// (GAPS, 11-03: Surprise me is now the one-row SurpriseRow.)
import type { ComponentProps } from 'react';
import { act, screen } from '@testing-library/react-native';

import { CHAPTER_COUNTS, readerPositionKey } from '../../storage/keys';
import { SurpriseRow } from '../HomeCards';
import { renderHome } from './homeHarness';

jest.mock('../HomeCards', () => {
  const React = jest.requireActual<typeof import('react')>('react');
  const actual =
    jest.requireActual<typeof import('../HomeCards')>('../HomeCards');

  return {
    ...actual,
    SurpriseRow: jest.fn(
      (props: ComponentProps<typeof actual.SurpriseRow>) =>
        React.createElement(actual.SurpriseRow, props),
    ),
  };
});

it('excludes the stored chapter even before Home rerenders', async () => {
  const chaptersRead: Record<string, string> = {};
  CHAPTER_COUNTS.forEach((count, index) => {
    for (let chapter = 1; chapter <= count; chapter++) {
      const key = `${index + 1}:${chapter}`;
      if (!['43:3', '43:4'].includes(key)) {
        chaptersRead[key] = '2026-10-01T00:00:00.000Z';
      }
    }
  });

  const values = [0.5, 0, 0];
  const { storage } = await renderHome({
    position: { bookNumber: 43, chapter: 3, translation: 'WEB' },
    progress: { chaptersRead },
    random: () => {
      const value = values.shift();
      if (value === undefined) throw new Error('Unexpected random draw');
      return value;
    },
  });
  await screen.findByTestId('home-votd-text');

  const press = jest.mocked(SurpriseRow).mock.calls.at(-1)![0].onPress;
  await act(async () => {
    storage.set(readerPositionKey, {
      bookNumber: 43,
      chapter: 4,
      translation: 'WEB',
    });
    press();
  });

  expect(storage.get(readerPositionKey)).toEqual({
    bookNumber: 43,
    chapter: 3,
    translation: 'WEB',
  });
});
