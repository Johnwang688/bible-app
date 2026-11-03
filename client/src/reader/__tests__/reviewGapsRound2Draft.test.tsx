// Sol GAPS review round 2 (orchestrator-owned): a counterexample, kept as a regression test.
/*
Actual failure, reproduced in isolation and in the extended run:
Expected: "Newer saved version"
Received: "First saved version"
*/
import { act, fireEvent, screen } from '@testing-library/react-native';

import { studyItemsKey } from '../../storage/keys';
import { resetNoteDrafts } from '../noteDrafts';
import { renderReader } from './readerHarness';

jest.mock('../components/useReduceMotion', () => ({
  useReduceMotion: () => true,
}));

beforeEach(() => resetNoteDrafts());
afterEach(() => resetNoteDrafts());

it('does not resurrect a draft already saved elsewhere after a later external edit', async () => {
  const { storage } = await renderReader({
    position: { bookNumber: 43, chapter: 3, translation: 'WEB' },
  });
  await fireEvent.press(await screen.findByTestId('verse-16'));
  await fireEvent.press(await screen.findByTestId('sheet-note'));
  await fireEvent.changeText(screen.getByTestId('note-input'), 'First saved version');

  async function saveElsewhere(text: string) {
    await act(async () => {
      const items = storage.get(studyItemsKey);
      items.notes['43:3:16'] = {
        text,
        updatedAt: '2026-11-02T12:00:00.000Z',
      };
      storage.set(studyItemsKey, items);
    });
  }

  await saveElsewhere('First saved version');
  await fireEvent.press(screen.getByTestId('note-back'));
  await fireEvent.press(screen.getByTestId('sheet-note'));
  expect(screen.getByTestId('note-input').props.value).toBe('First saved version');
  expect(screen.queryByTestId('note-draft')).toBeNull();

  await fireEvent.press(screen.getByTestId('note-back'));
  await saveElsewhere('Newer saved version');
  await fireEvent.press(screen.getByTestId('sheet-note'));
  expect(screen.getByTestId('note-input').props.value).toBe('Newer saved version');
  expect(screen.queryByTestId('note-draft')).toBeNull();
});
