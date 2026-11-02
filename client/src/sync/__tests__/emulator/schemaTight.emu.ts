// Acceptance tests (orchestrator-owned; the implementer may not edit them): FOLLOW-UP item 3b, schema-tight rules
// (John, 2026-11-02). Every document a client writes is checked against the exact schema the sync engine uses
// (keys, types, sizes), so a device or user document cannot carry arbitrary data.
//
// The documents are built with the adapter's own encoders (`wireDocs` in firestoreRemote.ts), so the wire format
// may change (for example to make map contents checkable by the rules) without these tests changing. The encoders
// only shape documents; they never validate, so a bad logical value reaches the rules as a bad document.
// Run: npm run test:emulator
import { doc, setDoc, type Firestore } from 'firebase/firestore';

import { wireDocs } from '../../firestoreRemote';
import type { DeviceProgress, RemoteItem, RemoteSetting } from '../../types';
import { clearFirestore, closeAll, dbAs, denied } from './emulator';

let alice: Firestore;
beforeAll(() => {
  alice = dbAs('alice');
});
beforeEach(clearFirestore);
afterAll(closeAll);

const NOW = () => Date.now();
const DEVICE_ID = 'Ab3_-xYz0123456789Qw'; // the engine's ids: 20 url-safe characters

const progress = (over: Partial<DeviceProgress> = {}): DeviceProgress => ({
  deviceId: DEVICE_ID,
  activeMs: { '2026-11-02': 300_000, '2026-11-01': 45_000 },
  chaptersRead: { '43:3': '2026-11-02T10:00:00.000Z', '1:1': '2026-11-01T08:30:12.345Z' },
  goalMetDays: ['2026-11-01', '2026-11-02'],
  goal: { minutes: 15, updatedAt: NOW() - 1000 },
  updatedAt: NOW() - 1000,
  ...over,
});
const pushDevice = (p: DeviceProgress, extra: Record<string, unknown> = {}) =>
  setDoc(doc(alice, 'users', 'alice', 'devices', p.deviceId), { ...wireDocs.device(p), ...extra });

const setting = (over: Partial<RemoteSetting> = {}): RemoteSetting => ({
  key: 'language',
  json: '"zh-Hans"',
  updatedAt: NOW() - 1000,
  deviceId: DEVICE_ID,
  ...over,
});
const pushSetting = (s: RemoteSetting, extra: Record<string, unknown> = {}) =>
  setDoc(doc(alice, 'users', 'alice', 'settings', s.key), { ...wireDocs.setting(s), ...extra });

const item = (over: Partial<RemoteItem> = {}): RemoteItem => ({
  id: 'note:43:3:16',
  kind: 'note',
  ref: '43:3:16',
  deleted: false,
  value: { text: 'For God so loved the world' },
  updatedAt: NOW() - 1000,
  deviceId: DEVICE_ID,
  ...over,
});
const pushItem = (i: RemoteItem, extra: Record<string, unknown> = {}) =>
  setDoc(doc(alice, 'users', 'alice', 'items', i.id), { ...wireDocs.item(i), ...extra });

const days = (n: number) => {
  const out: string[] = [];
  const d = new Date(Date.UTC(2000, 0, 1));
  for (let i = 0; i < n; i++) {
    out.push(d.toISOString().slice(0, 10));
    d.setUTCDate(d.getUTCDate() + 1);
  }
  return out;
};

describe('device documents: what the engine writes is accepted', () => {
  test('a typical device', async () => {
    await pushDevice(progress());
  });

  test('an empty device and no goal', async () => {
    await pushDevice(progress({ activeMs: {}, chaptersRead: {}, goalMetDays: [], goal: null }));
  });

  test('ten years of reading, every chapter read', async () => {
    const ten = days(3650);
    const chapters: Record<string, string> = {};
    for (let c = 1; c <= 150; c++) chapters[`19:${c}`] = '2026-11-02T10:00:00.000Z';
    for (let c = 1; c <= 50; c++) chapters[`1:${c}`] = '2026-11-02T10:00:00.000Z';
    await pushDevice(
      progress({
        activeMs: Object.fromEntries(ten.map((d) => [d, 3_600_000])),
        chaptersRead: chapters,
        goalMetDays: ten,
      }),
    );
  });

  test("a full day's reading", async () => {
    await pushDevice(progress({ activeMs: { '2026-11-02': 86_400_000 } }));
  });
});

describe('device documents: anything else is refused', () => {
  test.each<[string, Partial<DeviceProgress>]>([
    ['an activeMs key that is not a day', { activeMs: { 'not-a-day': 1000 } }],
    ['an activeMs key with a payload after the day', { activeMs: { '2026-11-02xxxxxxxxxxxxxxxxxxxxxxxx': 1000 } }],
    ['an activeMs value that is a string', { activeMs: { '2026-11-02': 'x'.repeat(5000) as unknown as number } }],
    ['an activeMs value that is a map', { activeMs: { '2026-11-02': { a: 1 } as unknown as number } }],
    ['a negative activeMs value', { activeMs: { '2026-11-02': -1 } }],
    ['a fractional activeMs value', { activeMs: { '2026-11-02': 1.5 } }],
    ['more than a day in a day', { activeMs: { '2026-11-02': 86_400_001 } }],
    ['a chaptersRead key that is not a chapter', { chaptersRead: { '43:3:16': '2026-11-02T10:00:00.000Z' } }],
    ['a chaptersRead key outside the Bible', { chaptersRead: { '67:1': '2026-11-02T10:00:00.000Z' } }],
    ['a chaptersRead value that is not an ISO time', { chaptersRead: { '43:3': 'x'.repeat(5000) } }],
    ['a chaptersRead value that is a number', { chaptersRead: { '43:3': 5 as unknown as string } }],
    ['a goalMetDays entry that is not a day', { goalMetDays: ['2026-11-02', 'x'.repeat(5000)] }],
    ['a goalMetDays entry that is a number', { goalMetDays: [20261102 as unknown as string] }],
    ['a goal of 7 minutes (not a multiple of 5)', { goal: { minutes: 7, updatedAt: Date.now() - 1000 } }],
  ])('%s', async (_name, over) => {
    await denied(pushDevice(progress(over)));
  });

  test('more days than the engine can hold', async () => {
    await denied(pushDevice(progress({ goalMetDays: days(20_001) })));
  });

  test('an extra top-level field', async () => {
    await denied(pushDevice(progress(), { evidence: { day: '2026-11-02', chapters: {} } }));
    await denied(pushDevice(progress(), { blob: 'x'.repeat(100) }));
  });

  test('an extra field in the goal', async () => {
    await denied(pushDevice(progress({ goal: { minutes: 15, updatedAt: Date.now() - 1000, note: 'x' } as unknown as DeviceProgress['goal'] })));
  });

  test('a device id that is not the engine shape', async () => {
    await denied(pushDevice(progress({ deviceId: 'x'.repeat(64) })));
  });
});

describe('settings: exact values', () => {
  test.each(['"system"', '"en"', '"zh-Hans"'])('language %s is accepted', async (json) => {
    await pushSetting(setting({ json }));
  });

  test('an appearance as the app stores it is accepted', async () => {
    await pushSetting(setting({ key: 'appearance', json: JSON.stringify({ preset: 'strawberry-milk', mode: 'dark' }) }));
    await pushSetting(setting({ key: 'appearance', json: JSON.stringify({ mode: 'system', preset: null }) }));
  });

  test.each<[string, Partial<RemoteSetting>]>([
    ['an unknown language', { json: '"klingon"' }],
    ['a language padded with data', { json: `"en"${' '.repeat(5000)}` }],
    ['an appearance with an extra key', { key: 'appearance', json: '{"mode":"dark","preset":null,"x":"' + 'y'.repeat(1000) + '"}' }],
    ['an appearance with an unknown preset', { key: 'appearance', json: '{"mode":"dark","preset":"not-a-preset"}' }],
    ['an appearance that is not JSON of the shape', { key: 'appearance', json: 'z'.repeat(19_000) }],
    ['a custom appearance far larger than any theme', { key: 'appearance.custom', json: `{"a":"${'z'.repeat(19_000)}"}` }],
  ])('%s is refused', async (_name, over) => {
    await denied(pushSetting(setting(over)));
  });

  test('an extra field is refused', async () => {
    await denied(pushSetting(setting(), { blob: 'x' }));
  });
});

describe('items: exact values', () => {
  test('a note, a highlight, a bookmark and a tombstone are accepted', async () => {
    await pushItem(item());
    await pushItem(item({ id: 'highlight:43:3:16', kind: 'highlight', value: { colour: 'green' } }));
    await pushItem(item({ id: 'bookmark:43:3:16', kind: 'bookmark', value: { createdAt: '2026-11-02T10:00:00.000Z' } }));
    await pushItem(item({ id: 'note:1:1:1', ref: '1:1:1', deleted: true, value: null }));
  });

  test.each<[string, Partial<RemoteItem>, Record<string, unknown>?]>([
    ['a note over the length limit', { value: { text: 'x'.repeat(5001) } }],
    ['a bookmark whose createdAt is not an ISO time', { id: 'bookmark:43:3:16', kind: 'bookmark', value: { createdAt: 'x'.repeat(40) } }],
    ['an extra field', {}, { blob: 'x' }],
    ['a device id that is not the engine shape', { deviceId: 'x'.repeat(64) }],
  ])('%s is refused', async (_name, over, extra) => {
    await denied(pushItem(item(over), extra));
  });
});
