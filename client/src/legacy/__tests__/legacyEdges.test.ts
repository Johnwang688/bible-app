// Edge cases beyond the acceptance suite: the web source wrapper, partial failures, and odd values.
import { Platform } from 'react-native';

import { NOTE_MAX_LENGTH, appearanceKey, readerPositionKey, studyItemsKey } from '../../storage/keys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { IMPORTED_PARTS, importLegacyDataOnce, parseLegacyProgress, webLegacySource, type LegacySource } from '..';
import { legacyImportKey } from '../keys';

const NOW = new Date('2026-11-02T15:00:00.000Z');
const now = () => NOW;
const src = (items: Record<string, string>): LegacySource => ({ getItem: (k) => items[k] ?? null });

describe('webLegacySource', () => {
  const original = Platform.OS;
  afterEach(() => {
    Platform.OS = original;
    delete (globalThis as { window?: unknown }).window;
  });

  it('is null on native', () => {
    Platform.OS = 'ios';
    expect(webLegacySource()).toBeNull();
  });

  it('is null when localStorage is missing or blocked', () => {
    Platform.OS = 'web';
    (globalThis as { window?: unknown }).window = {};
    expect(webLegacySource()).toBeNull();
    (globalThis as { window?: unknown }).window = {
      get localStorage(): never {
        throw new Error('SecurityError');
      },
    };
    expect(webLegacySource()).toBeNull();
  });

  it('reads through localStorage and turns a throwing read into null', () => {
    Platform.OS = 'web';
    (globalThis as { window?: unknown }).window = {
      localStorage: {
        getItem(k: string) {
          if (k === 'boom') throw new Error('nope');
          return k === 'theme' ? 'dark' : null;
        },
      },
    };
    const s = webLegacySource()!;
    expect(s.getItem('theme')).toBe('dark');
    expect(s.getItem('boom')).toBeNull();
    expect(s.getItem('other')).toBeNull();
  });
});

describe('importLegacyDataOnce edges', () => {
  it('a part whose write fails writes nothing but the others still import and all are recorded', () => {
    const storage = createStorage(memoryBackend());
    const realSet = storage.set.bind(storage);
    storage.set = ((k, v) => {
      if (k.key === readerPositionKey.key) throw new Error('disk full');
      realSet(k, v);
    }) as typeof storage.set;
    importLegacyDataOnce({
      storage,
      source: src({ 'bible-app-last-position': '{"book":"John","chapter":3}', theme: 'dark' }),
      now,
    });
    expect(storage.get(readerPositionKey)).toBeNull();
    expect(storage.get(appearanceKey)).toEqual({ preset: null, mode: 'dark' });
    expect([...storage.get(legacyImportKey).parts].sort()).toEqual([...IMPORTED_PARTS].sort());
  });

  it('keeps a recorded progress part when recording the others', () => {
    const storage = createStorage(memoryBackend());
    storage.set(legacyImportKey, { parts: ['progress'] });
    importLegacyDataOnce({ storage, source: src({}), now });
    expect([...storage.get(legacyImportKey).parts].sort()).toEqual(['position', 'progress', 'recent', 'study', 'theme']);
  });

  it('does not split a surrogate pair when cutting a long note, and keeps a note with an impossible time', () => {
    const long = 'a'.repeat(NOTE_MAX_LENGTH - 1) + '😀';
    const note = (text: string, updatedAt: number) => ({ key: 'john::3::16', book: 'John', chapter: 3, verse: 16, text, updatedAt });
    const storage = createStorage(memoryBackend());
    importLegacyDataOnce({ storage, source: src({ 'bible-app-notes': JSON.stringify({ 'john::3::16': note(long, 1) }) }), now });
    expect(storage.get(studyItemsKey).notes['43:3:16']!.text).toHaveLength(NOTE_MAX_LENGTH - 1);

    const s2 = createStorage(memoryBackend());
    importLegacyDataOnce({ storage: s2, source: src({ 'bible-app-notes': JSON.stringify({ 'john::3::16': note('hi', 1e20) }) }), now });
    expect(s2.get(studyItemsKey).notes['43:3:16']).toEqual({ text: 'hi', updatedAt: NOW.toISOString() });
  });

  it('existing highlights and bookmarks win per entry', () => {
    const storage = createStorage(memoryBackend());
    storage.set(studyItemsKey, {
      highlights: { '43:3:16': 'blue' },
      notes: {},
      bookmarks: { '43:3:16': { createdAt: '2026-01-01T00:00:00.000Z' } },
    });
    importLegacyDataOnce({
      storage,
      source: src({
        'bible-app-highlights': '["john::3::16","john::3::17"]',
        'bible-app-bookmarks': '["john::3::16"]',
      }),
      now,
    });
    const items = storage.get(studyItemsKey);
    expect(items.highlights['43:3:16']).toBe('blue');
    expect(items.highlights['43:3:17']).toBe('yellow');
    expect(items.bookmarks['43:3:16']!.createdAt).toBe('2026-01-01T00:00:00.000Z');
  });
});

describe('parseLegacyProgress edges', () => {
  it('does not throw on corrupt values and ignores a non-positive or non-finite time', () => {
    expect(parseLegacyProgress(src({ 'bible-app-reading-progress': '{bad', 'bible-app-chapters-read': '7' }), NOW)).toEqual({
      goalMinutes: 10,
      goalMetDays: [],
      activeMs: {},
      chaptersRead: {},
    });
    const zero = parseLegacyProgress(
      src({ 'bible-app-reading-progress': JSON.stringify({ todayIso: '2026-11-02', todayActiveLearningMs: 0.4 }) }),
      NOW,
    );
    expect(zero?.activeMs).toEqual({});
  });

  it('does not throw when the source throws', () => {
    const throwing: LegacySource = {
      getItem() {
        throw new Error('x');
      },
    };
    expect(parseLegacyProgress(throwing, NOW)).toBeNull();
  });
});
