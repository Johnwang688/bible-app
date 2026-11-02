// Acceptance tests for the Firestore adapter against the emulator, with the real rules loaded
// (R-6b, orchestrator-owned; the implementer may not edit them). Run: npm run test:emulator
import { languageKey } from '../../storage/keys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { createSyncEngine } from '../engine';
import { createFirestoreRemote } from '../firestoreRemote';
import { RemoteError, type RemoteItem } from '../types';
import { DOMAINS, setNote, studyKey } from '../__tests__/fixtures';
import { clearFirestore, closeAll, dbAs } from './emulator';

beforeEach(clearFirestore);
afterAll(closeAll);

const note = (ref: string, text: string, updatedAt = Date.now() - 5000): RemoteItem => ({
  id: `note:${ref}`,
  kind: 'note',
  ref,
  deleted: false,
  value: { text },
  updatedAt,
  deviceId: 'devA',
});

test('items round-trip; pulls are incremental on serverTime', async () => {
  const remote = createFirestoreRemote(dbAs('alice'), 'alice');
  await remote.pushItems([note('1:1:1', 'one'), { ...note('1:1:2', 'two'), deleted: true, value: null }]);
  const first = await remote.pullItems(null);
  expect(first.items.map((i) => i.id).sort()).toEqual(['note:1:1:1', 'note:1:1:2']);
  const one = first.items.find((i) => i.id === 'note:1:1:1')!;
  expect(one).toMatchObject({ kind: 'note', ref: '1:1:1', deleted: false, value: { text: 'one' }, deviceId: 'devA' });
  expect(typeof one.serverTime).toBe('number');
  expect(first.items.find((i) => i.id === 'note:1:1:2')).toMatchObject({ deleted: true, value: null });
  expect(first.cursor).toBe(Math.max(...first.items.map((i) => i.serverTime)));

  await remote.pushItems([note('1:1:3', 'three')]);
  const next = await remote.pullItems(first.cursor);
  expect(next.items.map((i) => i.id)).toContain('note:1:1:3');
  expect(next.cursor).toBeGreaterThan(first.cursor!);
  const none = await remote.pullItems(next.cursor);
  expect(none.cursor).toBe(next.cursor);
});

test('more than one batch of items is written', async () => {
  const remote = createFirestoreRemote(dbAs('alice'), 'alice');
  const many = Array.from({ length: 620 }, (_, i) => note(`1:${Math.floor(i / 100) + 1}:${(i % 100) + 1}`, `n${i}`));
  await remote.pushItems(many);
  expect((await remote.pullItems(null)).items).toHaveLength(620);
});

test('devices and settings round-trip', async () => {
  const remote = createFirestoreRemote(dbAs('alice'), 'alice');
  const progress = {
    deviceId: 'devA',
    activeMs: { '2026-11-02': 1000 },
    chaptersRead: { '43:3': '2026-11-02T10:00:00.000Z' },
    goalMetDays: ['2026-11-02'],
    goal: { minutes: 20, updatedAt: Date.now() - 1000 },
    updatedAt: Date.now() - 1000,
  };
  await remote.pushDevice(progress);
  await remote.pushDevice({ ...progress, deviceId: 'devB', goal: null });
  const devices = await remote.pullDevices();
  expect(devices.find((d) => d.deviceId === 'devA')).toEqual(progress);
  expect(devices.find((d) => d.deviceId === 'devB')?.goal).toBeNull();

  const s = { key: 'language' as const, json: '"en"', updatedAt: Date.now() - 1000, deviceId: 'devA' };
  await remote.pushSettings([s]);
  expect(await remote.pullSettings()).toEqual([s]);
});

test('another user is refused with RemoteError denied', async () => {
  const mallory = createFirestoreRemote(dbAs('mallory'), 'alice');
  await expect(mallory.pullItems(null)).rejects.toBeInstanceOf(RemoteError);
  await expect(mallory.pullItems(null)).rejects.toMatchObject({ kind: 'denied' });
  await expect(mallory.pushItems([note('1:1:1', 'x')])).rejects.toMatchObject({ kind: 'denied' });
});

test('two engines sync a note and a setting through Firestore', async () => {
  const mk = (deviceId: string) => {
    const storage = createStorage(memoryBackend());
    const engine = createSyncEngine({
      uid: 'alice',
      storage,
      remote: createFirestoreRemote(dbAs('alice'), 'alice'),
      domains: DOMAINS,
      deviceId,
      debounceMs: 60_000,
    });
    return { storage, engine };
  };
  const a = mk('devA');
  const b = mk('devB');
  setNote(a.storage, '43:3:16', 'For God so loved the world', Date.now() - 1000);
  a.storage.set(languageKey, 'zh-Hans');
  await a.engine.syncNow();
  expect(a.engine.status().state).toBe('idle');
  await b.engine.syncNow();
  expect(b.engine.status().state).toBe('idle');
  expect(b.storage.get(studyKey).notes['43:3:16']?.text).toBe('For God so loved the world');
  expect(b.storage.get(languageKey)).toBe('zh-Hans');
});
