// Acceptance (orchestrator-owned): the local-first study store and the share text.
import { act, render } from '@testing-library/react-native';
import { useEffect } from 'react';

import { studyItemsKey, UNKNOWN_TIME, type VerseRef } from '../../storage/keys';
import { createStorage, memoryBackend, type Storage } from '../../storage/storage';
import { formatReference, shareText } from '../share';
import { useStudyItems } from '../useStudyItems';

const r = (verse: number, chapter = 3, bookNumber = 43): VerseRef => ({ bookNumber, chapter, verse });
const NOW = new Date('2026-11-01T12:00:00.000Z');

type Api = ReturnType<typeof useStudyItems>;
async function mount(storage: Storage) {
  const ref: { current: Api | null } = { current: null };
  function Probe() {
    const api = useStudyItems({ storage, now: () => NOW });
    useEffect(() => {
      ref.current = api;
    });
    return null;
  }
  await render(<Probe />);
  return ref;
}

describe('useStudyItems', () => {
  it('highlights verses, changes the colour, and clears with null', async () => {
    const storage = createStorage(memoryBackend());
    const s = await mount(storage);
    await act(async () => s.current!.setHighlight([r(16), r(17)], 'yellow'));
    expect(s.current!.highlightOf(r(16))).toBe('yellow');
    expect(s.current!.highlightOf(r(17))).toBe('yellow');
    await act(async () => s.current!.setHighlight([r(16)], 'blue'));
    expect(s.current!.highlightOf(r(16))).toBe('blue');
    await act(async () => s.current!.setHighlight([r(16), r(17)], null));
    expect(s.current!.highlightOf(r(16))).toBeNull();
    expect(storage.get(studyItemsKey).highlights).toEqual({});
  });

  it('toggles bookmarks: adds the missing ones, or removes all when every verse is bookmarked', async () => {
    const storage = createStorage(memoryBackend());
    const s = await mount(storage);
    await act(async () => s.current!.toggleBookmark([r(16)]));
    expect(s.current!.isBookmarked(r(16))).toBe(true);
    expect(storage.get(studyItemsKey).bookmarks['43:3:16']).toEqual({ createdAt: NOW.toISOString() });
    await act(async () => s.current!.toggleBookmark([r(16), r(17)]));
    expect(s.current!.isBookmarked(r(17))).toBe(true);
    await act(async () => s.current!.toggleBookmark([r(16), r(17)]));
    expect(s.current!.isBookmarked(r(16))).toBe(false);
    expect(s.current!.isBookmarked(r(17))).toBe(false);
  });

  it('saves, trims, edits and deletes notes (empty text deletes)', async () => {
    const storage = createStorage(memoryBackend());
    const s = await mount(storage);
    await act(async () => s.current!.setNote(r(16), '  God so loved  '));
    expect(s.current!.noteOf(r(16))).toEqual({ text: 'God so loved', updatedAt: NOW.toISOString() });
    await act(async () => s.current!.setNote(r(16), '   '));
    expect(s.current!.noteOf(r(16))).toBeNull();
  });

  it('refuses a note over the length limit without losing the old one', async () => {
    const storage = createStorage(memoryBackend());
    const s = await mount(storage);
    await act(async () => s.current!.setNote(r(1), 'keep'));
    expect(() => s.current!.setNote(r(1), 'x'.repeat(5001))).toThrow();
    expect(s.current!.noteOf(r(1))?.text).toBe('keep');
  });

  it('keeps items by reference, so they persist across a restart and any translation', async () => {
    const storage = createStorage(memoryBackend());
    const a = await mount(storage);
    await act(async () => {
      a.current!.setHighlight([r(1, 1, 1)], 'green');
      a.current!.toggleBookmark([r(1, 1, 1)]);
    });
    const b = await mount(storage);
    expect(b.current!.highlightOf(r(1, 1, 1))).toBe('green');
    expect(b.current!.isBookmarked(r(1, 1, 1))).toBe(true);
  });

  it('two quick writes in a row both land (each reads the latest stored items)', async () => {
    const storage = createStorage(memoryBackend());
    const s = await mount(storage);
    await act(async () => {
      s.current!.setHighlight([r(1)], 'pink');
      s.current!.toggleBookmark([r(2)]);
      s.current!.setNote(r(3), 'n');
    });
    const items = storage.get(studyItemsKey);
    expect(items.highlights['43:3:1']?.colour).toBe('pink');
    expect(items.bookmarks['43:3:2']).toBeDefined();
    expect(items.notes['43:3:3']?.text).toBe('n');
  });
});

describe('study items version 2 (R-3): highlights carry a time', () => {
  it('stores the time a highlight was set; the same colour again keeps it, a new colour renews it', async () => {
    const storage = createStorage(memoryBackend());
    let clock = new Date('2026-11-01T12:00:00.000Z');
    const ref: { current: Api | null } = { current: null };
    function Probe() {
      const api = useStudyItems({ storage, now: () => clock });
      useEffect(() => {
        ref.current = api;
      });
      return null;
    }
    await render(<Probe />);
    await act(async () => ref.current!.setHighlight([r(16), r(17)], 'yellow'));
    expect(storage.get(studyItemsKey).highlights['43:3:16']).toEqual({ colour: 'yellow', updatedAt: '2026-11-01T12:00:00.000Z' });
    clock = new Date('2026-11-02T08:00:00.000Z');
    await act(async () => ref.current!.setHighlight([r(16), r(17)], 'yellow'));
    expect(storage.get(studyItemsKey).highlights['43:3:16']?.updatedAt).toBe('2026-11-01T12:00:00.000Z');
    await act(async () => ref.current!.setHighlight([r(17)], 'blue'));
    expect(storage.get(studyItemsKey).highlights['43:3:17']).toEqual({ colour: 'blue', updatedAt: '2026-11-02T08:00:00.000Z' });
    expect(ref.current!.highlightOf(r(17))).toBe('blue');
  });

  it('reads R-2 (version 1) items, keeping every highlight, note and bookmark', () => {
    const backend = memoryBackend();
    const v1 = {
      highlights: { '43:3:16': 'green' },
      notes: { '43:3:17': { text: 'n', updatedAt: '2026-11-01T00:00:00.000Z' } },
      bookmarks: { '1:1:1': { createdAt: '2026-11-01T00:00:00.000Z' } },
    };
    backend.set('study.items', JSON.stringify({ v: 1, data: v1 }));
    expect(createStorage(backend).get(studyItemsKey)).toEqual({
      ...v1,
      highlights: { '43:3:16': { colour: 'green', updatedAt: UNKNOWN_TIME } },
    });
  });

  it('a version 1 value with a bad colour reads as empty, as any invalid value does', () => {
    const backend = memoryBackend();
    backend.set('study.items', JSON.stringify({ v: 1, data: { highlights: { '43:3:16': 'red' }, notes: {}, bookmarks: {} } }));
    expect(createStorage(backend).get(studyItemsKey)).toEqual({ highlights: {}, notes: {}, bookmarks: {} });
  });
});

describe('formatReference', () => {
  it('formats single verses, ranges and lists', () => {
    expect(formatReference('John', 3, [16])).toBe('John 3:16');
    expect(formatReference('John', 3, [18, 16, 17])).toBe('John 3:16–18');
    expect(formatReference('John', 3, [16, 18])).toBe('John 3:16, 18');
    expect(formatReference('John', 3, [1, 2, 3, 7, 9, 10])).toBe('John 3:1–3, 7, 9–10');
    expect(formatReference('约翰福音', 3, [16])).toBe('约翰福音 3:16');
  });
});

describe('shareText', () => {
  it('joins English verses with spaces and adds the reference and translation', () => {
    expect(shareText([{ verse: 16, text: 'For God so loved the world' }, { verse: 17, text: 'For God did not send' }], 'John 3:16–17', 'BSB', 'en')).toBe(
      'For God so loved the world For God did not send\n— John 3:16–17 (BSB)',
    );
  });

  it('joins Chinese verses without spaces and keeps the alternate readings out', () => {
    expect(shareText([{ verse: 15, text: '叫一切信他的都得永生〔或作：叫一切信的人在他里面得永生〕。」' }, { verse: 16, text: '神爱世人，' }], '约翰福音 3:15–16', '和合本', 'zh')).toBe(
      '叫一切信他的都得永生。」神爱世人，\n— 约翰福音 3:15–16（和合本）',
    );
  });
});
