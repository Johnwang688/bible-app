// R-2 gap (GAPS, board 11-03): a chapter change while a note is half-written keeps the unsaved draft, per verse,
// until that note is saved or deleted.
import { fireEvent, screen, waitFor } from '@testing-library/react-native';

import { studyItemsKey } from '../../storage/keys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { resetNoteDrafts } from '../noteDrafts';
import { renderReader, synthText } from './readerHarness';

const JOHN3_WEB = { bookNumber: 43, chapter: 3, translation: 'WEB' } as const;

beforeEach(() => resetNoteDrafts());

async function openNoteOn(verse: number) {
  await fireEvent.press(await screen.findByTestId(`verse-${verse}`));
  await fireEvent.press(await screen.findByTestId('sheet-note'));
  return screen.findByTestId('note-input');
}

/** Next chapter and back: the selection (and with it the sheet) is dropped on the way. */
async function awayAndBack() {
  await fireEvent.press(screen.getByTestId('reader-next'));
  await screen.findByText(new RegExp(synthText('John', 4, 1, 'WEB')));
  await waitFor(() => expect(screen.queryByTestId('verse-sheet')).toBeNull());
  await fireEvent.press(screen.getByTestId('reader-prev'));
}

describe('unsaved note drafts', () => {
  it('a chapter change keeps the draft; opening that verse’s note again restores it, and says so', async () => {
    const { storage } = await renderReader({ position: JOHN3_WEB });
    await fireEvent.changeText(await openNoteOn(16), 'Half a thou');
    await awayAndBack();

    const input = await openNoteOn(16);
    expect(input.props.value).toBe('Half a thou');
    expect(screen.getByTestId('note-draft')).toHaveTextContent('Your unsaved changes are back. Save to keep them.');
    // Nothing was saved on the way.
    expect(storage.get(studyItemsKey).notes['43:3:16']).toBeUndefined();
  });

  it('is per verse: another verse’s note opens empty, with no hint', async () => {
    await renderReader({ position: JOHN3_WEB });
    await fireEvent.changeText(await openNoteOn(16), 'For 16');
    await awayAndBack();

    expect((await openNoteOn(17)).props.value).toBe('');
    expect(screen.queryByTestId('note-draft')).toBeNull();
  });

  it('a draft over a saved note wins over it until saved; saving clears the draft', async () => {
    const storage = createStorage(memoryBackend());
    storage.set(studyItemsKey, { highlights: {}, bookmarks: {}, notes: { '43:3:16': { text: 'Saved', updatedAt: '2026-11-01T00:00:00.000Z' } } });
    await renderReader({ storage, position: JOHN3_WEB });
    await fireEvent.changeText(await openNoteOn(16), 'Saved, and more');
    await awayAndBack();

    expect((await openNoteOn(16)).props.value).toBe('Saved, and more');
    await fireEvent.press(screen.getByTestId('note-save'));
    expect(storage.get(studyItemsKey).notes['43:3:16']?.text).toBe('Saved, and more');

    await fireEvent.press(await screen.findByTestId('sheet-note'));
    expect((await screen.findByTestId('note-input')).props.value).toBe('Saved, and more');
    expect(screen.queryByTestId('note-draft')).toBeNull();
  });

  it('deleting the note clears the draft', async () => {
    const storage = createStorage(memoryBackend());
    storage.set(studyItemsKey, { highlights: {}, bookmarks: {}, notes: { '43:3:16': { text: 'Saved', updatedAt: '2026-11-01T00:00:00.000Z' } } });
    await renderReader({ storage, position: JOHN3_WEB });
    await fireEvent.changeText(await openNoteOn(16), 'Changed');
    await awayAndBack();

    await openNoteOn(16);
    await fireEvent.press(screen.getByTestId('note-delete'));
    expect(storage.get(studyItemsKey).notes['43:3:16']).toBeUndefined();
    await fireEvent.press(await screen.findByTestId('sheet-note'));
    expect((await screen.findByTestId('note-input')).props.value).toBe('');
    expect(screen.queryByTestId('note-draft')).toBeNull();
  });

  it('a save over the length limit fails and keeps the draft', async () => {
    const { storage } = await renderReader({ position: JOHN3_WEB });
    const long = 'x'.repeat(6000);
    await fireEvent.changeText(await openNoteOn(16), long);
    expect(screen.getByTestId('note-save').props.accessibilityState?.disabled).toBe(true);
    await awayAndBack();

    expect((await openNoteOn(16)).props.value).toBe(long);
    expect(storage.get(studyItemsKey).notes['43:3:16']).toBeUndefined();
  });

  it('typing back to the saved text is no draft', async () => {
    await renderReader({ position: JOHN3_WEB });
    const input = await openNoteOn(16);
    await fireEvent.changeText(input, 'Typed');
    await fireEvent.changeText(input, '');
    await awayAndBack();

    expect((await openNoteOn(16)).props.value).toBe('');
    expect(screen.queryByTestId('note-draft')).toBeNull();
  });
});
