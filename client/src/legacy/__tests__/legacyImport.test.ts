// Acceptance (orchestrator-owned, R-7a): importing the old web app's localStorage once.
import * as fs from 'fs';
import * as path from 'path';

import { appearanceKey, readerPositionKey, recentPassagesKey, studyItemsKey } from '../../storage/keys';
import { createStorage, memoryBackend, type Storage } from '../../storage/storage';
import { IMPORTED_PARTS, LEGACY_BOOKS, importLegacyDataOnce, parseLegacyProgress, type LegacySource } from '..';
import { legacyImportKey } from '../keys';

const NOW = new Date('2026-11-02T15:00:00.000Z');
const now = () => NOW;

/** A read-only source over a plain object of raw localStorage strings. */
function source(items: Record<string, string>): LegacySource & { reads: string[] } {
  const reads: string[] = [];
  return {
    reads,
    getItem(key) {
      reads.push(key);
      return Object.prototype.hasOwnProperty.call(items, key) ? items[key]! : null;
    },
  };
}

const json = (v: unknown) => JSON.stringify(v);
const fresh = (): Storage => createStorage(memoryBackend());

/** The highlight colour whichever shape the key stores (main: the id; R-3: `{ colour, updatedAt }`). */
function colourOf(v: unknown): string | undefined {
  if (typeof v === 'string') return v;
  if (v && typeof v === 'object' && 'colour' in v) return (v as { colour: string }).colour;
  return undefined;
}

function run(items: Record<string, string>, storage = fresh()) {
  const report = importLegacyDataOnce({ storage, source: source(items), now });
  return { storage, report };
}

describe('the book table', () => {
  it('matches the backend catalogue: 66 books in canon order with their chapter counts', () => {
    const py = fs.readFileSync(path.resolve(__dirname, '../../../../app/core/book_catalog.py'), 'utf8');
    const rows = [...py.matchAll(/"number": (\d+),[^}]*?"name": "([^"]+)",[^}]*?"chapters": (\d+)/g)].map((m) => ({
      number: Number(m[1]),
      name: m[2],
      chapters: Number(m[3]),
    }));
    expect(rows).toHaveLength(66);
    expect(LEGACY_BOOKS.map((b, i) => ({ number: i + 1, name: b.name, chapters: b.chapters }))).toEqual(rows);
  });
});

describe('position', () => {
  it('imports the last position, book named in any case', () => {
    const { storage } = run({ 'bible-app-last-position': json({ book: 'john', chapter: 3, translation: 'WEB' }) });
    expect(storage.get(readerPositionKey)).toEqual({ bookNumber: 43, chapter: 3, translation: 'WEB' });
  });

  it('reads multi-word names and falls back to BSB for a translation the new app lacks or omits', () => {
    expect(run({ 'bible-app-last-position': json({ book: '1 Corinthians', chapter: 13, translation: 'KJV' }) }).storage.get(readerPositionKey)).toEqual({
      bookNumber: 46,
      chapter: 13,
      translation: 'BSB',
    });
    expect(run({ 'bible-app-last-position': json({ book: 'Song of Solomon', chapter: 2 }) }).storage.get(readerPositionKey)).toEqual({
      bookNumber: 22,
      chapter: 2,
      translation: 'BSB',
    });
    expect(run({ 'bible-app-last-position': json({ book: 'Psalms', chapter: 23, translation: 'cuv-simp' }) }).storage.get(readerPositionKey)).toEqual({
      bookNumber: 19,
      chapter: 23,
      translation: 'CUV-SIMP',
    });
  });

  it('drops a position that names no real chapter', () => {
    for (const bad of [
      { book: 'John', chapter: 22 },
      { book: 'Nowhere', chapter: 1 },
      { book: 'John', chapter: 0 },
      { book: 'John', chapter: 2.5 },
      { chapter: 3 },
      'John 3',
    ]) {
      expect(run({ 'bible-app-last-position': json(bad) }).storage.get(readerPositionKey)).toBeNull();
    }
  });

  it('never replaces a position the new app already has', () => {
    const storage = fresh();
    storage.set(readerPositionKey, { bookNumber: 1, chapter: 1, translation: 'ASV' });
    run({ 'bible-app-last-position': json({ book: 'John', chapter: 3 }) }, storage);
    expect(storage.get(readerPositionKey)).toEqual({ bookNumber: 1, chapter: 1, translation: 'ASV' });
  });
});

describe('recent passages', () => {
  it('imports most recent first, one per chapter, at most five, dropping invalid entries', () => {
    const old = [
      { book: 'Genesis', chapter: 1, translation: 'BSB', savedAt: 100 },
      { book: 'John', chapter: 3, translation: 'WEB', savedAt: 700 },
      { book: 'John', chapter: 3, translation: 'BSB', savedAt: 600 },
      { book: 'Romans', chapter: 8, translation: 'BSB', savedAt: 500 },
      { book: 'Nowhere', chapter: 1, translation: 'BSB', savedAt: 900 },
      { book: 'Psalms', chapter: 23, translation: 'KJV', savedAt: 400 },
      { book: 'Mark', chapter: 1, translation: 'ASV', savedAt: 300 },
      { book: 'Luke', chapter: 2, translation: 'BSB', savedAt: 200 },
      { book: 'Acts', chapter: 2, translation: 'BSB' },
    ];
    const { storage } = run({ 'bible-app-recent-passages': json(old) });
    expect(storage.get(recentPassagesKey)).toEqual([
      { bookNumber: 43, chapter: 3, translation: 'WEB' },
      { bookNumber: 45, chapter: 8, translation: 'BSB' },
      { bookNumber: 19, chapter: 23, translation: 'BSB' },
      { bookNumber: 41, chapter: 1, translation: 'ASV' },
      { bookNumber: 42, chapter: 2, translation: 'BSB' },
    ]);
  });

  it('never replaces recent passages the new app already has', () => {
    const storage = fresh();
    storage.set(recentPassagesKey, [{ bookNumber: 1, chapter: 2, translation: 'BSB' }]);
    run({ 'bible-app-recent-passages': json([{ book: 'John', chapter: 3, translation: 'BSB', savedAt: 1 }]) }, storage);
    expect(storage.get(recentPassagesKey)).toEqual([{ bookNumber: 1, chapter: 2, translation: 'BSB' }]);
  });
});

describe('study items', () => {
  it('imports highlights in the old reader colour, mapped to the new six', () => {
    const cases: [string | undefined, string][] = [
      [undefined, 'yellow'],
      ['yellow', 'yellow'],
      ['amber', 'orange'],
      ['green', 'green'],
      ['blue', 'blue'],
      ['pink', 'pink'],
      ['lavender', 'purple'],
      ['mint', 'green'],
      ['plaid', 'yellow'],
    ];
    for (const [old, expected] of cases) {
      const items: Record<string, string> = { 'bible-app-highlights': json(['john::3::16', 'genesis::1::1']) };
      if (old !== undefined) items['bible-app-reader-settings'] = json({ highlightColor: old, fontSize: 18 });
      const got = run(items).storage.get(studyItemsKey).highlights;
      expect(Object.keys(got).sort()).toEqual(['1:1:1', '43:3:16']);
      expect([colourOf(got['43:3:16']), colourOf(got['1:1:1'])]).toEqual([expected, expected]);
    }
  });

  it('drops highlight and bookmark keys that name no real verse', () => {
    const bad = ['nowhere::1::1', 'john::22::1', 'john::3::0', 'john::3', 'john:3:16', '', 'john::3::abc'];
    const { storage } = run({
      'bible-app-highlights': json([...bad, '1 john::4::8']),
      'bible-app-bookmarks': json([...bad, 'song of solomon::2::4']),
    });
    const items = storage.get(studyItemsKey);
    expect(Object.keys(items.highlights)).toEqual(['62:4:8']);
    expect(Object.keys(items.bookmarks)).toEqual(['22:2:4']);
  });

  it('imports bookmarks, timed at the import', () => {
    const { storage } = run({ 'bible-app-bookmarks': json(['romans::8::28']) });
    expect(storage.get(studyItemsKey).bookmarks).toEqual({ '45:8:28': { createdAt: NOW.toISOString() } });
  });

  it('imports notes with their time, drops empty or mismatched ones, and cuts very long ones to the limit', () => {
    const note = (key: string, book: string, chapter: number, verse: number, text: string, updatedAt: number) => ({
      key,
      book,
      chapter,
      verse,
      text,
      updatedAt,
    });
    const { storage } = run({
      'bible-app-notes': json({
        'john::3::16': note('john::3::16', 'John', 3, 16, 'For God so loved', 1_700_000_000_000),
        'john::3::17': note('john::3::17', 'John', 3, 17, '   ', 1_700_000_000_000),
        'john::3::18': note('john::3::99', 'John', 3, 18, 'mismatched key', 1_700_000_000_000),
        'genesis::1::1': note('genesis::1::1', 'Genesis', 1, 1, 'x'.repeat(6000), 1_600_000_000_000),
        'acts::2::1': { key: 'acts::2::1', book: 'Acts', chapter: 2, verse: 1, text: 'no time' },
      }),
    });
    const notes = storage.get(studyItemsKey).notes;
    expect(Object.keys(notes).sort()).toEqual(['1:1:1', '43:3:16']);
    expect(notes['43:3:16']).toEqual({ text: 'For God so loved', updatedAt: new Date(1_700_000_000_000).toISOString() });
    expect(notes['1:1:1']!.text).toHaveLength(5000);
  });

  it('keeps study items the new app already has, and adds the rest', () => {
    const storage = fresh();
    const existing = storage.get(studyItemsKey);
    storage.set(studyItemsKey, {
      ...existing,
      notes: { '43:3:16': { text: 'mine', updatedAt: '2026-11-01T00:00:00.000Z' } },
    });
    run(
      {
        'bible-app-notes': json({
          'john::3::16': { key: 'john::3::16', book: 'John', chapter: 3, verse: 16, text: 'old', updatedAt: 1 },
          'john::3::17': { key: 'john::3::17', book: 'John', chapter: 3, verse: 17, text: 'old 17', updatedAt: 1 },
        }),
      },
      storage,
    );
    const notes = storage.get(studyItemsKey).notes;
    expect(notes['43:3:16']!.text).toBe('mine');
    expect(notes['43:3:17']!.text).toBe('old 17');
  });
});

describe('theme', () => {
  it('maps Light and Dark to the default look in that mode, Paper to Silver, legacy ids by their mode', () => {
    const cases: [string, unknown][] = [
      ['light', { preset: null, mode: 'light' }],
      ['dark', { preset: null, mode: 'dark' }],
      ['paper', { preset: null, mode: 'light' }],
      ['midnight', { preset: null, mode: 'dark' }],
      ['parchment', { preset: null, mode: 'light' }],
      ['pink', { preset: null, mode: 'light' }],
    ];
    for (const [old, expected] of cases) expect(run({ theme: old }).storage.get(appearanceKey)).toEqual(expected);
  });

  it('leaves Auto, the old default and unknown ids as the default (follow the phone)', () => {
    for (const old of ['system', 'default', 'neon-plaid', '']) {
      expect(run({ theme: old }).storage.get(appearanceKey)).toEqual(appearanceKey.fallback);
    }
  });

  it('never replaces a look chosen in the new app', () => {
    const storage = fresh();
    storage.set(appearanceKey, { preset: 'sky', mode: 'system' });
    run({ theme: 'dark' }, storage);
    expect(storage.get(appearanceKey)).toEqual({ preset: 'sky', mode: 'system' });
  });
});

describe('once', () => {
  it('records every imported part, and a second run imports nothing', () => {
    const storage = fresh();
    const first = importLegacyDataOnce({ storage, source: source({ theme: 'dark' }), now });
    expect([...first.imported].sort()).toEqual([...IMPORTED_PARTS].sort());
    expect([...storage.get(legacyImportKey).parts].sort()).toEqual([...IMPORTED_PARTS].sort());

    storage.set(appearanceKey, appearanceKey.fallback);
    const second = importLegacyDataOnce({
      storage,
      source: source({ theme: 'light', 'bible-app-last-position': json({ book: 'John', chapter: 3 }) }),
      now,
    });
    expect(second.imported).toEqual([]);
    expect(storage.get(appearanceKey)).toEqual(appearanceKey.fallback);
    expect(storage.get(readerPositionKey)).toBeNull();
  });

  it('imports only the parts not yet recorded', () => {
    const storage = fresh();
    storage.set(legacyImportKey, { parts: ['position'] });
    const report = importLegacyDataOnce({
      storage,
      source: source({ theme: 'dark', 'bible-app-last-position': json({ book: 'John', chapter: 3 }) }),
      now,
    });
    expect(report.imported).not.toContain('position');
    expect(storage.get(readerPositionKey)).toBeNull();
    expect(storage.get(appearanceKey)).toEqual({ preset: null, mode: 'dark' });
  });

  it('survives corrupt values in every key without throwing, and marks the parts done', () => {
    const keys = [
      'theme',
      'bible-app-last-position',
      'bible-app-recent-passages',
      'bible-app-highlights',
      'bible-app-notes',
      'bible-app-bookmarks',
      'bible-app-reader-settings',
      'bible-app-reading-progress',
      'bible-app-chapters-read',
      'bible-app-daily-goal-minutes',
    ];
    for (const garbage of ['{not json', 'null', '42', '"text"', '[1,2,3]', json({ a: { b: 1 } })]) {
      const storage = fresh();
      const items = Object.fromEntries(keys.map((k) => [k, garbage]));
      expect(() => importLegacyDataOnce({ storage, source: source(items), now })).not.toThrow();
      expect([...storage.get(legacyImportKey).parts].sort()).toEqual([...IMPORTED_PARTS].sort());
      expect(storage.get(readerPositionKey)).toBeNull();
      expect(storage.get(recentPassagesKey)).toEqual([]);
      expect(storage.get(studyItemsKey)).toEqual(studyItemsKey.fallback);
    }
  });

  it('survives a source whose reads throw', () => {
    const storage = fresh();
    const throwing: LegacySource = {
      getItem() {
        throw new Error('SecurityError');
      },
    };
    expect(() => importLegacyDataOnce({ storage, source: throwing, now })).not.toThrow();
  });

  it('does nothing without a source (native)', () => {
    const storage = fresh();
    expect(importLegacyDataOnce({ storage, source: null, now }).imported).toEqual([]);
    expect(storage.get(legacyImportKey)).toEqual(legacyImportKey.fallback);
  });

  it('only reads the old keys (the old app keeps working until the cut-over)', () => {
    const src = source({ theme: 'dark' });
    importLegacyDataOnce({ storage: fresh(), source: src, now });
    expect(Object.keys(src).sort()).toEqual(['getItem', 'reads']);
    for (const k of src.reads) expect(k === 'theme' || k.startsWith('bible-app-')).toBe(true);
  });
});

describe('reading progress (parsed now; written into R-3 reading.progress after R-3 merges)', () => {
  it('is not imported yet', () => {
    expect(IMPORTED_PARTS).not.toContain('progress');
  });

  it('parses the goal, the goal days, today’s time and the chapters read', () => {
    const got = parseLegacyProgress(
      source({
        'bible-app-daily-goal-minutes': '12',
        'bible-app-reading-progress': json({
          streak: 3,
          goalMetDays: ['2026-10-30', '2026-10-31', 'yesterday', '2026-02-30', '2026-11-01'],
          todayIso: '2026-11-02',
          todayChapters: ['john::3::bsb'],
          todayActiveLearningMs: 125_000,
        }),
        'bible-app-chapters-read': json(['43:3', '1:51', '1:50', 'x', '43:3', '67:1']),
      }),
      NOW,
    );
    expect(got).toEqual({
      goalMinutes: 10,
      goalMetDays: ['2026-10-30', '2026-10-31', '2026-11-01'],
      activeMs: { '2026-11-02': 125_000 },
      chaptersRead: { '43:3': NOW.toISOString(), '1:50': NOW.toISOString() },
    });
  });

  it('clamps the goal to 5..120 in steps of 5, and returns null when nothing is stored', () => {
    expect(parseLegacyProgress(source({ 'bible-app-daily-goal-minutes': '500' }), NOW)?.goalMinutes).toBe(120);
    expect(parseLegacyProgress(source({ 'bible-app-daily-goal-minutes': '1' }), NOW)?.goalMinutes).toBe(5);
    expect(parseLegacyProgress(source({ 'bible-app-daily-goal-minutes': '23' }), NOW)?.goalMinutes).toBe(25);
    expect(parseLegacyProgress(source({}), NOW)).toBeNull();
  });
});
