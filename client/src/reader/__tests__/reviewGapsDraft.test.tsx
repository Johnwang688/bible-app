// Sol GAPS review round 1 (orchestrator-owned): a counterexample, kept as a regression test.
import { act, fireEvent, screen } from '@testing-library/react-native';

import { studyItemsKey } from '../../storage/keys';
import { noteDraftOf, resetNoteDrafts } from '../noteDrafts';
import { renderReader } from './readerHarness';

jest.mock('../components/useReduceMotion', () => ({
  useReduceMotion: () => true,
}));

const REF = { bookNumber: 43, chapter: 3, verse: 16 };
const POSITION = {
  bookNumber: 43,
  chapter: 3,
  translation: 'WEB',
} as const;

beforeEach(() => resetNoteDrafts());
afterEach(() => resetNoteDrafts());

it('drops a draft when an external note update saves exactly that text', async () => {
  const { storage } = await renderReader({ position: POSITION });
  await fireEvent.press(await screen.findByTestId('verse-16'));
  await fireEvent.press(await screen.findByTestId('sheet-note'));
  await fireEvent.changeText(
    await screen.findByTestId('note-input'),
    'Saved elsewhere',
  );
  expect(noteDraftOf(REF)).toBe('Saved elsewhere');

  await act(async () => {
    const items = storage.get(studyItemsKey);
    items.notes['43:3:16'] = {
      text: 'Saved elsewhere',
      updatedAt: '2026-11-02T12:00:00.000Z',
    };
    storage.set(studyItemsKey, items);
  });

  await fireEvent.press(screen.getByTestId('note-back'));
  await fireEvent.press(screen.getByTestId('sheet-note'));
  expect(screen.getByTestId('note-input').props.value).toBe('Saved elsewhere');
  expect(screen.queryByTestId('note-draft')).toBeNull();
});
