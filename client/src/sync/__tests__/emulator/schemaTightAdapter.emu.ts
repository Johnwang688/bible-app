// The schema-tight wire format through the Firestore adapter (R6b-fu-rules, implementer's tests): every
// field round-trips through push and pull (the largest legal documents included), the push path drops or
// normalises what the rules would refuse instead of failing (and says so in one warning without user
// data), and raw documents probe the rules' per-entry checks. Run: npm run test:emulator
import { doc, setDoc, type Firestore } from 'firebase/firestore';

import { CHAPTER_COUNTS, languageKey } from '../../../storage/keys';
import { createStorage, memoryBackend } from '../../../storage/storage';
import { createSyncEngine } from '../../engine';
import { createFirestoreRemote, wireDocs } from '../../firestoreRemote';
import type { DeviceProgress, RemoteItem, RemoteSetting } from '../../types';
import { DOMAINS, progressKey, setNote, studyKey } from '../fixtures';
import { clearFirestore, closeAll, dbAs, denied } from './emulator';

const DEV_A = 'devA0000000000000000';
const DEV_B = 'devB0000000000000000';
const ISO = '2026-11-02T10:00:00.000Z';

let alice: Firestore;
let warn: jest.SpyInstance;
beforeAll(() => {
  alice = dbAs('alice');
});
beforeEach(async () => {
  await clearFirestore();
  warn = jest.spyOn(console, 'warn').mockImplementation(() => undefined);
});
afterEach(() => warn.mockRestore());
afterAll(closeAll);

const remote = () => createFirestoreRemote(alice, 'alice');

const days = (n: number, from = Date.UTC(1990, 0, 1)) => {
  const out: string[] = [];
  const d = new Date(from);
  for (let i = 0; i < n; i++) {
    out.push(d.toISOString().slice(0, 10));
    d.setUTCDate(d.getUTCDate() + 1);
  }
  return out;
};

/** Every chapter of the Bible (1189), each credited at a distinct ISO time. */
const everyChapter = (): Record<string, string> => {
  const out: Record<string, string> = {};
  let t = Date.UTC(2020, 0, 1);
  CHAPTER_COUNTS.forEach((count, i) => {
    for (let c = 1; c <= count; c++) out[`${i + 1}:${c}`] = new Date((t += 61_001)).toISOString();
  });
  return out;
};

const progress = (over: Partial<DeviceProgress> = {}): DeviceProgress => ({
  deviceId: DEV_A,
  activeMs: { '2026-11-01': 0, '2026-11-02': 300_000 },
  chaptersRead: { '43:3': ISO, '1:1': '1970-01-01T00:00:00.000Z' },
  goalMetDays: ['2026-11-01', '2026-11-02'],
  goal: { minutes: 120, updatedAt: Date.now() - 1000 },
  updatedAt: Date.now() - 1000,
  ...over,
});

const mine = async (deviceId = DEV_A) => (await remote().pullDevices()).find((d) => d.deviceId === deviceId);

/** Every warning so far, as one string. */
const warnings = () => warn.mock.calls.map((c) => c.join(' ')).join('\n');

describe('round trip through pushDevice / pullDevices', () => {
  test('every field, including 0 ms days and the largest goal', async () => {
    const p = progress();
    await remote().pushDevice(p);
    expect(await mine()).toEqual(p);
    expect(warn).not.toHaveBeenCalled();
  });

  test('an empty device with no goal', async () => {
    const p = progress({ activeMs: {}, chaptersRead: {}, goalMetDays: [], goal: null });
    await remote().pushDevice(p);
    expect(await mine()).toEqual(p);
  });

  test('the largest legal document: 20000 full days, every chapter, 20000 goal days', async () => {
    const all = days(20_000);
    const p = progress({
      activeMs: Object.fromEntries(all.map((d) => [d, 86_400_000])),
      chaptersRead: everyChapter(),
      goalMetDays: all,
      goal: { minutes: 5, updatedAt: Date.now() - 1000 },
    });
    await remote().pushDevice(p);
    const back = await mine();
    expect(back).toEqual(p);
    expect(Object.keys(back!.chaptersRead)).toHaveLength(1189);
    expect(warn).not.toHaveBeenCalled();
  });

  test('two devices keep their own documents', async () => {
    await remote().pushDevice(progress());
    await remote().pushDevice(progress({ deviceId: DEV_B, activeMs: { '2026-11-02': 1 }, goal: null }));
    expect((await mine(DEV_B))?.activeMs).toEqual({ '2026-11-02': 1 });
    expect((await mine(DEV_A))?.activeMs).toEqual(progress().activeMs);
  });

  test('activeMs is one "day=ms" string on the wire, sorted by day', () => {
    expect(wireDocs.device(progress({ activeMs: { '2026-11-02': 5, '2026-01-09': 86_400_000 } })).activeMs).toBe(
      '2026-01-09=86400000;2026-11-02=5',
    );
    expect(wireDocs.device(progress({ activeMs: {} })).activeMs).toBe('');
  });
});

describe('round trip of items and settings', () => {
  test('a bookmark with an ISO time, a note and a tombstone', async () => {
    const items: RemoteItem[] = [
      { id: 'bookmark:43:3:16', kind: 'bookmark', ref: '43:3:16', deleted: false, value: { createdAt: ISO }, updatedAt: Date.now() - 1000, deviceId: DEV_A },
      { id: 'note:1:1:1', kind: 'note', ref: '1:1:1', deleted: false, value: { text: '起初，神创造天地。'.repeat(500).slice(0, 5000) }, updatedAt: Date.now() - 1000, deviceId: DEV_A },
      { id: 'highlight:2:2:2', kind: 'highlight', ref: '2:2:2', deleted: true, value: null, updatedAt: Date.now() - 1000, deviceId: DEV_A },
    ];
    await remote().pushItems(items);
    const pulled = (await remote().pullItems(null)).items.map(({ serverTime: _s, ...i }) => i);
    expect(pulled.sort((a, b) => a.id.localeCompare(b.id))).toEqual([...items].sort((a, b) => a.id.localeCompare(b.id)));
  });

  test('settings are written with sorted keys and read back as written', async () => {
    const t = Date.now() - 1000;
    const custom = JSON.stringify({ z: 'x'.repeat(3970), a: [1, { c: 2, b: 1 }] });
    expect(custom.length).toBeLessThanOrEqual(4000);
    await remote().pushSettings([
      { key: 'language', json: '"zh-Hans"', updatedAt: t, deviceId: DEV_A },
      { key: 'appearance', json: JSON.stringify({ preset: 'deep-blue', mode: 'light' }), updatedAt: t, deviceId: DEV_A },
      { key: 'appearance.custom', json: custom, updatedAt: t, deviceId: DEV_A },
    ]);
    const byKey = Object.fromEntries((await remote().pullSettings()).map((s) => [s.key, s.json]));
    expect(byKey).toEqual({
      language: '"zh-Hans"',
      appearance: '{"mode":"light","preset":"deep-blue"}',
      'appearance.custom': JSON.stringify({ a: [1, { b: 1, c: 2 }], z: 'x'.repeat(3970) }),
    });
    expect(warn).not.toHaveBeenCalled();
  });
});

describe('the push path never gets stuck on what the rules refuse', () => {
  test('a bookmark whose time is not an ISO time is dropped; the rest of the batch is written', async () => {
    const t = Date.now() - 1000;
    await remote().pushItems([
      { id: 'note:1:1:1', kind: 'note', ref: '1:1:1', deleted: false, value: { text: 'In the beginning' }, updatedAt: t, deviceId: DEV_A },
      { id: 'bookmark:1:1:2', kind: 'bookmark', ref: '1:1:2', deleted: false, value: { createdAt: 'last Tuesday' }, updatedAt: t, deviceId: DEV_A },
      { id: 'bookmark:1:1:3', kind: 'bookmark', ref: '1:1:3', deleted: false, value: { createdAt: ISO }, updatedAt: t, deviceId: DEV_A },
    ]);
    const ids = (await remote().pullItems(null)).items.map((i) => i.id).sort();
    expect(ids).toEqual(['bookmark:1:1:3', 'note:1:1:1']);
    expect(warn).toHaveBeenCalledTimes(1);
    expect(warnings()).toMatch(/1 study items/);
    expect(warnings()).not.toMatch(/Tuesday|beginning|1:1:/);
  });

  test('device entries are normalised or dropped, and the device document is written', async () => {
    const tooMany = days(20_003);
    await remote().pushDevice(
      progress({
        activeMs: {
          ...Object.fromEntries(tooMany.map((d) => [d, 60_000])),
          '2026-11-02': 90_000_000, // more than a day: clamped
          '2026-13-45': 1000, // not a day (the fixture storage schema allows it): dropped
        },
        chaptersRead: {
          '43:3': 'not a time', // dropped
          '1:2': '2026-11-02', // a time, not as toISOString writes it: normalised
          '1:3': ISO,
          '67:1': ISO, // not a chapter: dropped
        },
        goalMetDays: ['2026-11-02', '2026-11-01', '2026-11-02', '2026-02-30x'],
      }),
    );
    const back = (await mine())!;
    expect(Object.keys(back.activeMs)).toHaveLength(20_000);
    expect(back.activeMs['2026-11-02']).toBe(86_400_000);
    expect(back.activeMs[tooMany[0]!]).toBeUndefined(); // the oldest days go first
    expect(back.activeMs['2026-13-45']).toBeUndefined();
    expect(back.chaptersRead).toEqual({ '1:2': '2026-11-02T00:00:00.000Z', '1:3': ISO });
    expect(back.goalMetDays).toEqual(['2026-11-01', '2026-11-02']);
    expect(warn).toHaveBeenCalledTimes(1);
    expect(warnings()).not.toMatch(/2026|43:3|not a time/);
  });

  test('fields the types do not have are left out of the written value and goal', async () => {
    const t = Date.now() - 1000;
    await remote().pushItems([
      { id: 'highlight:1:1:1', kind: 'highlight', ref: '1:1:1', deleted: false, value: { colour: 'blue', extra: 'x' } as never, updatedAt: t, deviceId: DEV_A },
    ]);
    expect((await remote().pullItems(null)).items[0]?.value).toEqual({ colour: 'blue' });
    await remote().pushDevice(progress({ goal: { minutes: 15, updatedAt: t, extra: 1 } as never }));
    expect((await mine())?.goal).toEqual({ minutes: 15, updatedAt: t });
  });

  test('more than 20000 goal days keeps the newest; a goal the rules refuse becomes null', async () => {
    const all = days(20_010);
    await remote().pushDevice(progress({ goalMetDays: [...all].reverse(), goal: { minutes: 7, updatedAt: Date.now() - 1000 } }));
    const back = (await mine())!;
    expect(back.goalMetDays).toEqual(all.slice(-20_000));
    expect(back.goal).toBeNull();
  });

  test('settings the rules refuse are dropped; the others in the batch are written', async () => {
    const s = (key: RemoteSetting['key'], json: string): RemoteSetting => ({ key, json, updatedAt: Date.now() - 1000, deviceId: DEV_A });
    await remote().pushSettings([
      s('appearance', '{"mode":"dark","preset":"not-a-preset"}'),
      s('appearance.custom', JSON.stringify({ a: 'z'.repeat(4000) })),
      s('language', '"en"'),
    ]);
    expect((await remote().pullSettings()).map((x) => [x.key, x.json])).toEqual([['language', '"en"']]);
    expect(warnings()).toMatch(/2 settings/);
    expect(warnings()).not.toMatch(/not-a-preset|zzz/);

    await remote().pushSettings([s('language', '"klingon"'), s('appearance.custom', '[1,2]'), s('appearance', 'nonsense')]);
    expect((await remote().pullSettings()).map((x) => x.json)).toEqual(['"en"']);
  });

  test('an engine whose storage holds what the rules refuse still syncs the rest and goes idle', async () => {
    const storage = createStorage(memoryBackend());
    setNote(storage, '43:3:16', 'For God so loved the world', Date.now() - 5000);
    storage.set(studyKey, {
      ...storage.get(studyKey),
      bookmarks: { '1:1:1': { createdAt: 'soon' }, '1:1:2': { createdAt: ISO } },
    });
    storage.set(progressKey, {
      ...progressKey.fallback,
      activeMs: { '2026-11-02': 100_000_000 },
      chaptersRead: { '43:3': 'yesterday', '1:1': ISO },
    });
    storage.set(languageKey, 'zh-Hans');
    const engine = createSyncEngine({ uid: 'alice', storage, remote: remote(), domains: DOMAINS, deviceId: DEV_A, debounceMs: 60_000 });
    await engine.syncNow();
    expect(engine.status().state).toBe('idle');
    await engine.syncNow();
    expect(engine.status().state).toBe('idle');

    const items = (await remote().pullItems(null)).items.map((i) => i.id).sort();
    expect(items).toEqual(['bookmark:1:1:2', 'note:43:3:16']);
    expect((await remote().pullSettings()).map((x) => x.json)).toContain('"zh-Hans"');
    const dev = (await mine())!;
    expect(dev.activeMs).toEqual({ '2026-11-02': 86_400_000 });
    expect(dev.chaptersRead).toEqual({ '1:1': ISO });
    await engine.stop();
  });
});

describe('the rules check every entry (raw documents)', () => {
  const raw = (over: Record<string, unknown>) => ({ ...wireDocs.device(progress()), ...over });
  const put = (data: Record<string, unknown>) => setDoc(doc(alice, 'users', 'alice', 'devices', DEV_A), data);

  test('the wire documents themselves are accepted', async () => {
    await put(raw({}));
    await setDoc(
      doc(alice, 'users', 'alice', 'items', 'bookmark:43:3:16'),
      wireDocs.item({ id: 'bookmark:43:3:16', kind: 'bookmark', ref: '43:3:16', deleted: false, value: { createdAt: ISO }, updatedAt: Date.now() - 1000, deviceId: DEV_A }),
    );
  });

  test.each<[string, Record<string, unknown>]>([
    ['activeMs as a map', { activeMs: { '2026-11-02': 1000 } }],
    ['an activeMs ms with a leading zero', { activeMs: '2026-11-02=0100' }],
    ['an activeMs entry without ms', { activeMs: '2026-11-02=' }],
    ['an empty activeMs entry', { activeMs: '2026-11-02=1;;2026-11-03=1' }],
    ['a trailing ";" in activeMs', { activeMs: '2026-11-02=1;' }],
    ['a month 13', { activeMs: '2026-13-02=1' }],
    ['more than 20000 activeMs days', { activeMs: days(20_001).map((d) => `${d}=0`).join(';') }],
    ['a chapter key hiding a second entry', { chaptersRead: { [`1:1;1:2`]: `${ISO};${ISO}` } }],
    ['a chapter 151', { chaptersRead: { '19:151': ISO } }],
    ['a chapter with a leading zero', { chaptersRead: { '19:01': ISO } }],
    ['a time without milliseconds', { chaptersRead: { '1:1': '2026-11-02T10:00:00Z' } }],
    ['a time with an offset', { chaptersRead: { '1:1': '2026-11-02T10:00:00.000+01:00' } }],
    ['a time value hiding a second time', { chaptersRead: { '1:1': `${ISO};${ISO}`, '1:2': ISO } }],
    ['a nested map in chaptersRead', { chaptersRead: { '1:1': { any: ['thing'] } } }],
    [
      'more than 1189 chapters',
      { chaptersRead: Object.fromEntries(Array.from({ length: 1190 }, (_, i) => [`${(i % 66) + 1}:${Math.floor(i / 66) + 1}`, ISO])) },
    ],
    ['a goal day hiding a second day', { goalMetDays: ['2026-11-01;2026-11-02'] }],
    ['a repeated goal day', { goalMetDays: ['2026-11-01', '2026-11-01'] }],
    ['a goal day that is a map', { goalMetDays: [{ day: '2026-11-01' }] }],
    ['a goal of 125 minutes', { goal: { minutes: 125, updatedAt: Date.now() - 1000 } }],
  ])('refuses %s', async (_why, over) => {
    await denied(put(raw(over)));
  });

  // The same cases as schemaTight.emu.ts's two-element item rows, which jest runs as done-callback tests
  // (their callback takes a third parameter), so they time out there whatever the rules do.
  test.each<[string, Partial<RemoteItem>]>([
    ['a note over the length limit', { value: { text: 'x'.repeat(5001) } }],
    ['a bookmark whose createdAt is not an ISO time', { id: 'bookmark:43:3:16', kind: 'bookmark', value: { createdAt: 'x'.repeat(24) } }],
    ['a device id that is not the engine shape', { deviceId: 'x'.repeat(64) }],
    ['a device id of 19 characters', { deviceId: 'x'.repeat(19) }],
    ['a highlight with an extra value field', { id: 'highlight:43:3:16', kind: 'highlight', value: { colour: 'blue', text: 'x' } as never }],
  ])('refuses an item: %s', async (_why, over) => {
    const i: RemoteItem = {
      id: 'note:43:3:16',
      kind: 'note',
      ref: '43:3:16',
      deleted: false,
      value: { text: 'For God so loved the world' },
      updatedAt: Date.now() - 1000,
      deviceId: DEV_A,
      ...over,
    };
    await denied(setDoc(doc(alice, 'users', 'alice', 'items', i.id), wireDocs.item(i)));
  });

  test('settings: refused values', async () => {
    const s = (over: Partial<RemoteSetting>): Record<string, unknown> =>
      wireDocs.setting({ key: 'appearance.custom', json: '{}', updatedAt: Date.now() - 1000, deviceId: DEV_A, ...over });
    const at = (key: string) => doc(alice, 'users', 'alice', 'settings', key);
    await setDoc(at('appearance.custom'), s({ json: `{"a":"${'z'.repeat(3992)}"}` })); // exactly 4000
    await denied(setDoc(at('appearance.custom'), s({ json: `{"a":"${'z'.repeat(3993)}"}` }))); // 4001
    await denied(setDoc(at('appearance.custom'), s({ json: '"a string"' })));
    await denied(setDoc(at('appearance.custom'), s({ json: '[{}]' })));
    await denied(setDoc(at('appearance'), s({ key: 'appearance', json: '{"mode":"dark","preset":null} ' })));
    await denied(setDoc(at('appearance'), s({ key: 'appearance', json: '{"mode":"dark"}' })));
    await denied(setDoc(at('language'), s({ key: 'language', json: 'en' })));
  });
});
