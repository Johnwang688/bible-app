// Acceptance (orchestrator-owned): the reading position persists; recents and settings are kept.
import { act, render } from '@testing-library/react-native';
import { useEffect } from 'react';

import type { DeviceLocale } from '../../i18n/types';
import { readerPositionKey, readingSettingsKey, recentPassagesKey, type ReaderPosition, type ReadingSettings } from '../../storage/keys';
import { createStorage, memoryBackend, type Storage } from '../../storage/storage';
import { DEFAULT_POSITION, useReaderPosition, useReadingSettings } from '../state';

const en: DeviceLocale = { languageTag: 'en-US', languageCode: 'en', regionCode: 'US' };
const zhTW: DeviceLocale = { languageTag: 'zh-TW', languageCode: 'zh', regionCode: 'TW' };
const zhCN: DeviceLocale = { languageTag: 'zh-CN', languageCode: 'zh', regionCode: 'CN' };

type PosApi = ReturnType<typeof useReaderPosition>;
type SetApi = ReturnType<typeof useReadingSettings>;

async function mountPosition(storage: Storage, locales: DeviceLocale[]) {
  const ref: { current: PosApi | null } = { current: null };
  function Probe() {
    const api = useReaderPosition({ storage, locales });
    useEffect(() => {
      ref.current = api;
    });
    return null;
  }
  const ui = await render(<Probe />);
  return { ref, ui };
}

describe('useReaderPosition', () => {
  it('starts a brand-new reader at the default chapter in the phone-language translation', async () => {
    expect(DEFAULT_POSITION).toEqual({ bookNumber: 1, chapter: 1 });
    for (const [locales, translation] of [
      [[en], 'BSB'],
      [[zhCN], 'CUV-SIMP'],
      [[zhTW], 'CUV'],
    ] as const) {
      const { ref } = await mountPosition(createStorage(memoryBackend()), [...locales]);
      expect(ref.current!.position).toEqual({ ...DEFAULT_POSITION, translation });
    }
  });

  it('does not write anything until the reader moves', async () => {
    const storage = createStorage(memoryBackend());
    await mountPosition(storage, [en]);
    expect(storage.get(readerPositionKey)).toBeNull();
  });

  it('persists the position: a new mount (an app restart) shows the same place', async () => {
    const storage = createStorage(memoryBackend());
    const first = await mountPosition(storage, [en]);
    const john3: ReaderPosition = { bookNumber: 43, chapter: 3, translation: 'WEB' };
    await act(async () => first.ref.current!.setPosition(john3));
    expect(first.ref.current!.position).toEqual(john3);
    await first.ui.unmount();
    const second = await mountPosition(storage, [zhCN]);
    expect(second.ref.current!.position).toEqual(john3);
  });

  it('keeps a saved translation even when the phone language says otherwise', async () => {
    const storage = createStorage(memoryBackend());
    storage.set(readerPositionKey, { bookNumber: 19, chapter: 23, translation: 'BSB' });
    const { ref } = await mountPosition(storage, [zhCN]);
    expect(ref.current!.position.translation).toBe('BSB');
  });

  it('records recent passages: most recent first, one per book and chapter, at most five', async () => {
    const storage = createStorage(memoryBackend());
    const { ref } = await mountPosition(storage, [en]);
    const go = (bookNumber: number, chapter: number, translation: ReaderPosition['translation'] = 'BSB') =>
      act(async () => ref.current!.setPosition({ bookNumber, chapter, translation }));
    await go(43, 3);
    await go(19, 23);
    await go(43, 3, 'CUV-SIMP');
    expect(storage.get(recentPassagesKey).map((p) => [p.bookNumber, p.chapter, p.translation])).toEqual([
      [43, 3, 'CUV-SIMP'],
      [19, 23, 'BSB'],
    ]);
    for (let c = 1; c <= 6; c++) await go(1, c);
    const recent = storage.get(recentPassagesKey);
    expect(recent).toHaveLength(5);
    expect(recent[0]).toEqual({ bookNumber: 1, chapter: 6, translation: 'BSB' });
  });

  // Verifier round 2 (GPT-6.1 Sol): a mutant-killing memoisation check.
  it('keeps the API and setter identities across unrelated rerenders', async () => {
    const storage = createStorage(memoryBackend());
    const seen: PosApi[] = [];
    function Probe() {
      seen.push(useReaderPosition({ storage, locales: [en] }));
      return null;
    }
    const ui = await render(<Probe />);
    const initial = seen[seen.length - 1]!;
    await ui.rerender(<Probe />);
    expect(seen[seen.length - 1]).toBe(initial);
    const next: ReaderPosition = { bookNumber: 43, chapter: 3, translation: 'WEB' };
    await act(async () => initial.setPosition(next));
    expect(seen[seen.length - 1]!.position).toEqual(next);
    expect(seen[seen.length - 1]!.setPosition).toBe(initial.setPosition);
    const afterMove = seen[seen.length - 1]!;
    await ui.rerender(<Probe />);
    expect(seen[seen.length - 1]).toBe(afterMove);
  });

  it('a corrupt stored position falls back to the default', async () => {
    const backend = memoryBackend();
    backend.set('reader.position', JSON.stringify({ v: 1, data: { bookNumber: 400, chapter: 1, translation: 'BSB' } }));
    const { ref } = await mountPosition(createStorage(backend), [en]);
    expect(ref.current!.position).toEqual({ ...DEFAULT_POSITION, translation: 'BSB' });
  });
});

describe('useReadingSettings', () => {
  it('defaults to the design text size with parallel reading off, and persists changes', async () => {
    const storage = createStorage(memoryBackend());
    const ref: { current: SetApi | null } = { current: null };
    function Probe() {
      const api = useReadingSettings({ storage });
      useEffect(() => {
        ref.current = api;
      });
      return null;
    }
    await render(<Probe />);
    expect(ref.current![0]).toEqual({ textSize: 2, parallel: null });
    const next: ReadingSettings = { textSize: 4, parallel: 'CUV-SIMP' };
    await act(async () => ref.current![1](next));
    expect(ref.current![0]).toEqual(next);
    expect(storage.get(readingSettingsKey)).toEqual(next);
  });
});
