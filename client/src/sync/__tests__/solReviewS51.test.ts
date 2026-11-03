// S5-1 review: production code and predecessor tests stay unchanged.
// These are soundness probes, not findings: each assertion states the conflict/retry contract.
// Production files were not mutated; the mutant sensitivity noted below is inferred from assertions.
import { appearanceKey, languageKey } from '../../storage/keys';
import { createStorage, memoryBackend, type KeyValueBackend, type Storage } from '../../storage/storage';
import { createSyncEngine } from '../engine';
import { createFirestoreRemote } from '../firestoreRemote';
import { createMemoryRemote, type MemoryRemote } from '../memoryRemote';
import type { SyncDomains } from '../shapes';
import { syncStateKey } from '../state';
import { RemoteError, type RemoteItem, type RemoteSetting } from '../types';
import { makeDevice, progressKey, removeItem, setNote, studyKey } from './fixtures';

type Data = Record<string, unknown>;
interface FakeState {
  serverNow: number;
  batches: number[];
  failBatch: number | null;
}

// The same server-clock rule and incremental-query pattern as securityReview5.unit.test.ts.
jest.mock('firebase/firestore', () => {
  const docs = new Map<string, Record<string, unknown>>();
  const state: FakeState = { serverNow: 0, batches: [], failBatch: null };
  let tick = 0;
  class Timestamp {
    readonly ms: number;
    constructor(ms: number) { this.ms = ms; }
    toMillis() { return this.ms; }
    static fromMillis(ms: number) { return new Timestamp(ms); }
  }
  class FirestoreError extends Error {
    name = 'FirebaseError';
    readonly code: string;
    constructor(code: string) { super(code); this.code = code; }
  }
  const allowed = (d: Data) => typeof d.updatedAt === 'number' && Number.isInteger(d.updatedAt)
    && d.updatedAt > 0 && d.updatedAt <= state.serverNow + 86_400_000;
  const store = (path: string, d: Data) => docs.set(path, { ...d, serverTime: new Timestamp(state.serverNow + ++tick) });
  return {
    __fake: { docs, state }, Timestamp, FirestoreError,
    serverTimestamp: () => ({ serverTimestamp: true }),
    collection: (_db: unknown, ...parts: string[]) => ({ path: parts.join('/') }),
    doc: (base: { path?: string }, ...parts: string[]) => ({ path: base.path ? [base.path, ...parts].join('/') : parts.join('/') }),
    query: (c: { path: string }, ...cons: { field: string; value: Timestamp }[]) => ({ ...c, cons }),
    where: (field: string, _op: string, value: Timestamp) => ({ field, value }),
    getDocsFromServer: async (q: { path: string; cons: { field: string; value: Timestamp }[] }) => ({
      docs: [...docs].filter(([path, d]) => path.startsWith(`${q.path}/`) && !path.slice(q.path.length + 1).includes('/')
        && q.cons.every((c) => (d[c.field] as Timestamp).toMillis() > c.value.toMillis()))
        .map(([path, d]) => ({ id: path.slice(q.path.length + 1), data: () => d })),
    }),
    setDoc: async (ref: { path: string }, d: Data) => {
      if (!allowed(d)) throw new FirestoreError('permission-denied');
      store(ref.path, d);
    },
    writeBatch: () => {
      const ops: { ref: { path: string }; d: Data }[] = [];
      return {
        set: (ref: { path: string }, d: Data) => void ops.push({ ref, d }),
        commit: async () => {
          state.batches.push(ops.length);
          if (state.batches.length === state.failBatch) throw new FirestoreError('unavailable');
          if (!ops.every((op) => allowed(op.d))) throw new FirestoreError('permission-denied');
          for (const op of ops) store(op.ref.path, op.d);
        },
      };
    },
  };
});

const fake = (jest.requireMock('firebase/firestore') as { __fake: { docs: Map<string, Data>; state: FakeState } }).__fake;
const UID = 'alice';
const SELF = 'devA_0123456789abcde';
const HOUR = 3_600_000;
const T0 = Date.UTC(2026, 10, 2, 12);
const ITEMS: SyncDomains = { studyItems: studyKey };
const SETTINGS: SyncDomains = { settings: [languageKey] };
const item = (ref: string, updatedAt: number, text: string | null = 'remote'): RemoteItem => ({
  id: `note:${ref}`, kind: 'note', ref, deleted: text === null,
  value: text === null ? null : { text }, updatedAt, deviceId: SELF,
});

afterEach(() => {
  jest.restoreAllMocks();
  jest.clearAllTimers();
  jest.useRealTimers();
});

describe('sound: the adapter reports held entries across the 450-document boundary', () => {
  beforeEach(() => {
    fake.docs.clear();
    fake.state.serverNow = T0 - 2 * HOUR;
    fake.state.batches = [];
    fake.state.failBatch = null;
    jest.spyOn(Date, 'now').mockReturnValue(T0);
    jest.spyOn(console, 'warn').mockImplementation(() => undefined);
  });

  test('ahead, denied, dropped and normalised items in three batches report exactly the retryable ids', async () => {
    const remote = createFirestoreRemote({} as never, UID);
    const list = Array.from({ length: 906 }, (_, i) => item(`1:${Math.floor(i / 100) + 1}:${i % 100 + 1}`, T0));
    const ahead = [0, 454, 905];
    const denied = [1, 451, 903];
    for (const i of ahead) list[i]!.updatedAt = T0 + 48 * HOUR;
    for (const i of denied) list[i]!.updatedAt = T0 + 23 * HOUR;
    list[2]!.value = { text: '' }; // permanently invalid: deliberately not retryable
    list[452]!.value = { text: 'normalised', extra: true } as never;
    const result = await remote.pushItems(list);
    const heldIds = [...ahead, ...denied].map((i) => list[i]!.id).sort();
    // Would detect mutants that omit denied ids, report successful ids, or reset held per batch.
    expect([...result.held].sort()).toEqual(heldIds);
    expect(fake.state.batches).toEqual([450, 450, 2]);
    expect(fake.docs.size).toBe(899);
    expect(fake.docs.get(`users/${UID}/items/${list[452]!.id}`)?.value).toEqual({ text: 'normalised' });
    expect(console.warn).toHaveBeenCalledTimes(1);
    expect(String(jest.mocked(console.warn).mock.calls[0])).not.toMatch(/note:|normalised"|devA_/);

    fake.state.serverNow = T0 + 49 * HOUR;
    jest.mocked(Date.now).mockReturnValue(fake.state.serverNow);
    const retry = list.filter((entry) => heldIds.includes(entry.id));
    expect(await remote.pushItems(retry)).toEqual({ held: [] });
    for (const entry of retry) expect(fake.docs.get(`users/${UID}/items/${entry.id}`)?.updatedAt).toBe(entry.updatedAt);
  });

  test('settings report ahead and denied keys together, then write both unchanged when clocks agree', async () => {
    const remote = createFirestoreRemote({} as never, UID);
    const list: RemoteSetting[] = [
      { key: 'language', json: '"en"', updatedAt: T0 + 48 * HOUR, deviceId: SELF },
      { key: 'appearance', json: '{"mode":"dark","preset":null}', updatedAt: T0 + 23 * HOUR, deviceId: SELF },
      { key: 'appearance.custom', json: '{}', updatedAt: T0, deviceId: SELF },
    ];
    expect([...(await remote.pushSettings(list)).held].sort()).toEqual(['appearance', 'language']);
    expect(fake.docs.size).toBe(1);
    fake.state.serverNow = T0 + 49 * HOUR;
    jest.mocked(Date.now).mockReturnValue(fake.state.serverNow);
    expect(await remote.pushSettings(list.slice(0, 2))).toEqual({ held: [] });
    for (const entry of list) expect(fake.docs.get(`users/${UID}/settings/${entry.key}`)?.updatedAt).toBe(entry.updatedAt);
  });

  test('the engine settles 902 written entries and retries only the three held entries across three batches', async () => {
    const remote = createFirestoreRemote({} as never, UID);
    const pushed = jest.spyOn(remote, 'pushItems');
    const storage = createStorage(memoryBackend());
    const value = storage.get(studyKey);
    const ahead = '1:1:1';
    const denied = ['1:5:52', '1:10:4'];
    for (let n = 0; n < 905; n++) {
      const ref = `1:${Math.floor(n / 100) + 1}:${n % 100 + 1}`;
      const time = ref === ahead ? T0 + 48 * HOUR : denied.includes(ref) ? T0 + 23 * HOUR : T0;
      value.notes[ref] = { text: ref, updatedAt: new Date(time).toISOString() };
    }
    storage.set(studyKey, value);
    const engine = createSyncEngine({ uid: UID, storage, remote, domains: ITEMS, deviceId: SELF, now: () => Date.now() });
    jest.mocked(Date.now).mockReturnValue(T0 + 48 * HOUR);
    jest.spyOn(jest.requireMock('firebase/firestore') as { getDocsFromServer: () => Promise<unknown> }, 'getDocsFromServer')
      .mockRejectedValueOnce(Object.assign(new Error('offline'), { name: 'FirebaseError', code: 'unavailable' }));
    await engine.syncNow();
    const before = storage.get(syncStateKey(UID)).items;
    jest.mocked(Date.now).mockReturnValue(T0);
    await engine.syncNow();
    expect(engine.status().state).toBe('idle');
    expect(fake.state.batches).toEqual([450, 450, 4]);
    expect(fake.docs.size).toBe(902);
    const held = [ahead, ...denied].map((ref) => `note:${ref}`).sort();
    const after = storage.get(syncStateKey(UID)).items;
    expect(Object.keys(after.stamps).sort()).toEqual(held);
    expect(Object.keys(after.base)).toHaveLength(902);
    for (const id of held) {
      expect(after.base[id]).toEqual(before.base[id]);
      expect(after.stamps[id]).toEqual(before.stamps[id]);
    }
    fake.state.serverNow = T0 + 49 * HOUR;
    jest.mocked(Date.now).mockReturnValue(fake.state.serverNow);
    await engine.syncNow();
    expect(pushed.mock.calls[1]![0].map((entry) => entry.id).sort()).toEqual(held);
    expect(fake.docs.size).toBe(905);
    expect(storage.get(syncStateKey(UID)).items.stamps).toEqual({});
    await engine.syncNow();
    expect(pushed).toHaveBeenCalledTimes(2);
  });

  test('a later batch failure leaves held and unacknowledged entries retryable with their original clocks', async () => {
    const remote = createFirestoreRemote({} as never, UID);
    const storage = createStorage(memoryBackend());
    const value = storage.get(studyKey);
    for (let n = 1; n <= 452; n++) value.notes[`1:1:${n}`] = { text: `n${n}`, updatedAt: new Date(T0).toISOString() };
    value.notes['1:1:1']!.updatedAt = new Date(T0 + 48 * HOUR).toISOString();
    storage.set(studyKey, value);
    // First fail the pull with the device clock ahead: one note keeps its future own time.
    const engine = createSyncEngine({ uid: UID, storage, remote, domains: ITEMS, deviceId: SELF, now: () => Date.now() });
    jest.mocked(Date.now).mockReturnValue(T0 + 48 * HOUR);
    jest.spyOn(jest.requireMock('firebase/firestore') as { getDocsFromServer: () => Promise<unknown> }, 'getDocsFromServer')
      .mockRejectedValueOnce(Object.assign(new Error('offline'), { name: 'FirebaseError', code: 'unavailable' }));
    await engine.syncNow();
    jest.mocked(Date.now).mockReturnValue(T0);
    fake.state.failBatch = 2;
    await engine.syncNow();
    expect(engine.status().state).toBe('offline');
    expect(fake.docs.size).toBe(450);
    expect(Object.keys(storage.get(syncStateKey(UID)).items.stamps)).toHaveLength(452);
    fake.state.failBatch = null;
    fake.state.serverNow = T0 + 49 * HOUR;
    jest.mocked(Date.now).mockReturnValue(fake.state.serverNow);
    await engine.syncNow();
    expect(engine.status().state).toBe('idle');
    expect(fake.docs.size).toBe(452);
    expect(storage.get(syncStateKey(UID)).items.stamps).toEqual({});
    for (const [path, d] of fake.docs) expect(d.updatedAt).toBe(path.endsWith('/note:1:1:1') ? T0 + 48 * HOUR : T0);
  });
});

describe('sound: held items and settings obey the existing conflict rules', () => {
  // A held item is compared with later remote changes; it is neither blindly retried nor discarded.
  test.each([false, true])('held deletion=%s survives a restart and an older remote edit', async (deleted) => {
    const remote = createMemoryRemote();
    const a = makeDevice(remote, SELF, { domains: ITEMS });
    setNote(a.storage, '1:1:1', 'base', 900_000);
    await a.engine.syncNow();
    a.clock.now = 3_000_000;
    if (deleted) removeItem(a.storage, 'notes', '1:1:1');
    else setNote(a.storage, '1:1:1', 'pending', 2_900_000);
    remote.holdBack(() => true);
    await a.engine.syncNow();
    const held = a.storage.get(syncStateKey(UID)).items;
    remote.putItem({ ...item('1:1:1', 2_000_000, 'older'), deviceId: 'devB' });
    a.restart();
    await a.engine.syncNow();
    expect(a.storage.get(syncStateKey(UID)).items.base).toEqual(held.base);
    expect(a.storage.get(syncStateKey(UID)).items.stamps).toEqual(held.stamps);
    remote.holdBack(null);
    a.clock.now = 9_000_000;
    await a.engine.syncNow();
    expect(remote.items.get('note:1:1:1')).toMatchObject({
      deleted, value: deleted ? null : { text: 'pending' }, updatedAt: deleted ? 3_000_000 : 2_900_000,
    });
    expect(a.storage.get(syncStateKey(UID)).items.stamps).toEqual({});
  });

  test.each([false, true])('a newer remote tombstone=%s replaces a held local change without reviving it', async (deleted) => {
    const remote = createMemoryRemote();
    const a = makeDevice(remote, SELF, { domains: ITEMS });
    setNote(a.storage, '1:1:1', 'base', 900_000);
    await a.engine.syncNow();
    a.clock.now = 2_000_000;
    setNote(a.storage, '1:1:1', 'held', 1_900_000);
    remote.holdBack(() => true);
    await a.engine.syncNow();
    remote.putItem({ ...item('1:1:1', 3_000_000, deleted ? null : 'newer'), deviceId: 'devB' });
    a.restart();
    await a.engine.syncNow();
    remote.holdBack(null);
    await a.engine.syncNow();
    expect(a.storage.get(studyKey).notes['1:1:1']?.text).toBe(deleted ? undefined : 'newer');
    expect(remote.items.get('note:1:1:1')?.updatedAt).toBe(3_000_000);
    expect(a.storage.get(syncStateKey(UID)).items.stamps).toEqual({});
  });

  test.each([1_500_000, 3_000_000])('a linked held setting compares a remote clock of %i with its pending stamp', async (remoteTime) => {
    const remote = createMemoryRemote();
    const a = makeDevice(remote, SELF, { domains: SETTINGS });
    a.storage.set(languageKey, 'en');
    await a.engine.syncNow();
    a.clock.now = 2_000_000;
    a.storage.set(languageKey, 'zh-Hans');
    remote.holdBack(() => true);
    await a.engine.syncNow();
    remote.putSetting({ key: 'language', json: '"system"', updatedAt: remoteTime, deviceId: 'devB' });
    a.restart();
    await a.engine.syncNow();
    remote.holdBack(null);
    a.clock.now = 9_000_000;
    await a.engine.syncNow();
    expect(remote.settings.get('language')).toMatchObject({
      json: remoteTime < 2_000_000 ? '"zh-Hans"' : '"system"',
      updatedAt: Math.max(2_000_000, remoteTime),
    });
    expect(a.storage.get(syncStateKey(UID)).settings.stamps).toEqual({});
  });

  test('a held repair without a stamp keeps its pull cursor through restart, then settles once', async () => {
    const remote = createMemoryRemote();
    const pushed = jest.spyOn(remote, 'pushItems');
    const a = makeDevice(remote, SELF, { domains: ITEMS });
    setNote(a.storage, '1:1:1', 'winner', 900_000);
    await a.engine.syncNow();
    await a.engine.syncNow();
    const before = a.storage.get(syncStateKey(UID)).items;
    remote.putItem({ ...item('1:1:1', 500_000, 'late older write'), deviceId: 'devB' });
    remote.holdBack(() => true);
    await a.engine.syncNow();
    expect(a.storage.get(syncStateKey(UID)).items).toEqual(before);
    a.restart();
    await a.engine.syncNow();
    expect(a.storage.get(syncStateKey(UID)).items).toEqual(before);
    remote.holdBack(null);
    await a.engine.syncNow();
    const calls = pushed.mock.calls.length;
    await a.engine.syncNow();
    await a.engine.syncNow();
    expect(pushed).toHaveBeenCalledTimes(calls);
    expect(remote.items.get('note:1:1:1')).toMatchObject({ value: { text: 'winner' }, updatedAt: 900_000 });
    // Would detect a mutant that preserves held stamps but advances the cursor of a held repair.
    expect(calls).toBe(4);
  });

  test('a held push keeps an actual ignored entry until the pending item is written', async () => {
    const remote = createMemoryRemote();
    const a = makeDevice(remote, SELF, { domains: ITEMS });
    remote.putItem({ ...item('1:1:1', 2_000_000, ''), deviceId: 'devB' });
    await a.engine.syncNow();
    expect(a.storage.get(syncStateKey(UID)).items.ignored['note:1:1:1']).toBeDefined();
    a.clock.now = 3_000_000;
    setNote(a.storage, '1:1:1', 'valid replacement', 2_900_000);
    remote.holdBack(() => true);
    await a.engine.syncNow();
    const before = a.storage.get(syncStateKey(UID)).items;
    a.restart();
    await a.engine.syncNow();
    expect(a.storage.get(syncStateKey(UID)).items.ignored).toEqual(before.ignored);
    expect(a.storage.get(syncStateKey(UID)).items.stamps).toEqual(before.stamps);
    remote.holdBack(null);
    await a.engine.syncNow();
    expect(a.storage.get(syncStateKey(UID)).items.ignored).toEqual({});
    expect(remote.items.get('note:1:1:1')?.value).toEqual({ text: 'valid replacement' });
  });

  test('an edit during a held push keeps its new stamp and sends the new value on the next run', async () => {
    jest.useFakeTimers();
    const remote = createMemoryRemote();
    const a = makeDevice(remote, SELF, { domains: { studyItems: studyKey, ...SETTINGS } });
    setNote(a.storage, '1:1:1', 'base', 900_000);
    a.storage.set(languageKey, 'en');
    await a.engine.syncNow();
    a.engine.start();
    await jest.advanceTimersByTimeAsync(0);
    a.clock.now = 2_000_000;
    setNote(a.storage, '1:1:1', 'held', 1_900_000);
    a.storage.set(languageKey, 'zh-Hans');
    remote.holdBack(() => true);
    const gate = remote.hold('pushItems');
    const run = a.engine.syncNow();
    await gate.started;
    a.clock.now = 3_000_000;
    setNote(a.storage, '1:1:1', 'edited during push', 2_900_000);
    a.storage.set(languageKey, 'system');
    const stamps = a.storage.get(syncStateKey(UID));
    gate.release();
    await run;
    expect(a.engine.status().state).toBe('idle');
    expect(a.storage.get(syncStateKey(UID)).items.stamps).toEqual(stamps.items.stamps);
    expect(a.storage.get(syncStateKey(UID)).settings.stamps).toEqual(stamps.settings.stamps);
    remote.holdBack(null);
    await a.engine.syncNow();
    expect(remote.items.get('note:1:1:1')).toMatchObject({ value: { text: 'edited during push' }, updatedAt: 2_900_000 });
    expect(remote.settings.get('language')).toMatchObject({ json: '"system"', updatedAt: 3_000_000 });
    await a.engine.stop();
  });

  test('stopping a mixed push leaves held and unacknowledged entries safe for the same uid after another account runs', async () => {
    const remote = createMemoryRemote();
    const domains: SyncDomains = { studyItems: studyKey, ...SETTINGS };
    const a = makeDevice(remote, SELF, { domains });
    setNote(a.storage, '1:1:1', 'held', 900_000);
    setNote(a.storage, '1:1:2', 'written', 900_000);
    a.storage.set(languageKey, 'en');
    remote.holdBack((id) => id === 'note:1:1:1');
    const gate = remote.hold('pushItems');
    const run = a.engine.syncNow();
    await gate.started;
    const stopping = a.engine.stop();
    gate.release();
    await Promise.all([run, stopping]);
    const aliceState = a.storage.get(syncStateKey(UID));
    const calls = [...remote.calls];
    await a.engine.syncNow();
    expect(remote.calls).toEqual(calls);
    expect(remote.items.has('note:1:1:1')).toBe(false);
    expect(remote.items.has('note:1:1:2')).toBe(true);
    expect(aliceState.items.stamps['note:1:1:1']).toBeDefined();
    expect(aliceState.settings.stamps.language).toBeDefined();
    const bob = makeDevice(createMemoryRemote(), SELF, { uid: 'bob', storage: a.storage, domains, start: 5_000_000 });
    await bob.engine.syncNow();
    await bob.engine.stop();
    expect(a.storage.get(syncStateKey(UID))).toEqual(aliceState);
    remote.holdBack(null);
    a.restart();
    await a.engine.syncNow();
    expect(remote.items.get('note:1:1:1')?.updatedAt).toBe(900_000);
    expect(remote.items.get('note:1:1:2')?.updatedAt).toBe(900_000);
    expect(remote.settings.get('language')?.updatedAt).toBe(1_000_000);
    expect(a.storage.get(syncStateKey(UID)).items.stamps).toEqual({});
  });

  test('stopping an in-flight mixed setting push acknowledges neither its held nor written setting', async () => {
    const remote = createMemoryRemote();
    const a = makeDevice(remote, SELF, { domains: { settings: [languageKey, appearanceKey] } });
    a.storage.set(languageKey, 'en');
    await a.engine.syncNow();
    a.clock.now = 2_000_000;
    a.storage.set(languageKey, 'zh-Hans');
    a.storage.set(appearanceKey, { mode: 'dark', preset: null });
    remote.holdBack((id) => id === 'language');
    const gate = remote.hold('pushSettings');
    const run = a.engine.syncNow();
    await gate.started;
    const before = a.storage.get(syncStateKey(UID));
    const stopping = a.engine.stop();
    gate.release();
    await Promise.all([run, stopping]);
    expect(a.storage.get(syncStateKey(UID))).toEqual(before);
    expect(remote.settings.get('appearance')?.updatedAt).toBe(2_000_000);
    expect(remote.settings.get('language')?.json).toBe('"en"');
    remote.holdBack(null);
    a.restart();
    await a.engine.syncNow();
    expect(a.engine.status().state).toBe('idle');
    expect(remote.settings.get('language')).toMatchObject({ json: '"zh-Hans"', updatedAt: 2_000_000 });
    expect(a.storage.get(syncStateKey(UID)).settings.stamps).toEqual({});
  });

  test('a held setting clears an earlier error retry without scheduling any run before the ordinary interval', async () => {
    jest.useFakeTimers();
    const remote = createMemoryRemote();
    const a = makeDevice(remote, SELF, { domains: SETTINGS });
    a.storage.set(languageKey, 'en');
    remote.failNext(new RemoteError('offline'), 'pullSettings');
    a.engine.start();
    await jest.advanceTimersByTimeAsync(0);
    expect(a.engine.status().state).toBe('offline');
    remote.holdBack(() => true);
    await a.engine.syncNow();
    expect(a.engine.status().state).toBe('idle');
    const count = () => remote.calls.filter((call) => call === 'pullSettings').length;
    expect(count()).toBe(2);
    await jest.advanceTimersByTimeAsync(5 * 60_000 - 1);
    expect(count()).toBe(2);
    remote.holdBack(null);
    await jest.advanceTimersByTimeAsync(1);
    expect(count()).toBe(3);
    expect(remote.settings.get('language')?.updatedAt).toBe(1_000_000);
    expect(a.engine.status().state).toBe('idle');
    await a.engine.stop();
  });
});

test('sound: every durable-write crash point preserves held notes, tombstones and settings with their clocks', async () => {
  const bytes = new Map<string, string>();
  const snapshots: { disk: Map<string, string>; remote: MemoryRemote }[] = [];
  const remote = createMemoryRemote();
  let armed = false;
  const capture = () => {
    const copy = createMemoryRemote();
    // Keep durable server times and advance the copy's internal write clock past the cursor.
    const maxTime = Math.max(1000, ...[...remote.items.values()].map((it) => it.serverTime));
    for (let t = 1000; t < maxTime; t++) copy.putItem(item('66:1:1', 1));
    copy.items.clear();
    for (const it of remote.items.values()) copy.items.set(it.id, JSON.parse(JSON.stringify(it)));
    for (const s of remote.settings.values()) copy.putSetting(s);
    for (const d of remote.devices.values()) copy.putDevice(d);
    snapshots.push({ disk: new Map(bytes), remote: copy });
  };
  const backend: KeyValueBackend = {
    getString: (k) => bytes.get(k),
    set: (k, v) => { bytes.set(k, v); if (armed) capture(); },
    remove: (k) => { bytes.delete(k); if (armed) capture(); },
  };
  const domains: SyncDomains = { studyItems: studyKey, settings: [languageKey, appearanceKey], progress: progressKey };
  const a = makeDevice(remote, SELF, { domains, storage: createStorage(backend) });
  for (let n = 1; n <= 4; n++) setNote(a.storage, `1:1:${n}`, 'base', 900_000);
  a.storage.set(languageKey, 'en');
  await a.engine.syncNow();
  await a.engine.syncNow();
  a.clock.now = 3_000_000;
  setNote(a.storage, '1:1:1', 'held', 2_900_000);
  removeItem(a.storage, 'notes', '1:1:2');
  setNote(a.storage, '1:1:3', 'written', 2_900_000);
  a.storage.set(languageKey, 'zh-Hans');
  remote.putItem({ ...item('1:1:4', 2_000_000, 'downloaded'), deviceId: 'devB' });
  remote.putSetting({ key: 'appearance', json: '{"mode":"dark","preset":null}', updatedAt: 2_000_000, deviceId: 'devB' });
  remote.putDevice({ deviceId: 'devB', activeMs: { '2026-11-02': 60_000 }, chaptersRead: {}, goalMetDays: [], goal: null, updatedAt: 2_000_000 });
  remote.holdBack((id) => ['note:1:1:1', 'note:1:1:2', 'language'].includes(id));
  // Record the pending stamps before simulating crashes, so restart time cannot replace first-seen time.
  const gate = remote.hold('pullSettings');
  const run = a.engine.syncNow();
  await gate.started;
  capture();
  armed = true;
  gate.release();
  await run;
  armed = false;
  expect(a.engine.status().state).toBe('idle');
  expect(snapshots.length).toBeGreaterThanOrEqual(7);

  for (const [at, snap] of snapshots.entries()) {
    const disk: KeyValueBackend = {
      getString: (k) => snap.disk.get(k),
      set: (k, v) => void snap.disk.set(k, v),
      remove: (k) => void snap.disk.delete(k),
    };
    const storage: Storage = createStorage(disk);
    const resumed = makeDevice(snap.remote, SELF, { domains, storage, start: 9_000_000 });
    await resumed.engine.syncNow();
    await resumed.engine.syncNow();
    // Include the crash index in a single expectation so a failure identifies its durable write.
    expect({
      at, state: resumed.engine.status().state,
      note: snap.remote.items.get('note:1:1:1')?.updatedAt,
      deletion: snap.remote.items.get('note:1:1:2')?.updatedAt,
      deleted: snap.remote.items.get('note:1:1:2')?.deleted,
      setting: snap.remote.settings.get('language')?.updatedAt,
      language: storage.get(languageKey),
      downloaded: storage.get(studyKey).notes['1:1:4']?.text,
      minutes: storage.get(progressKey).activeMs['2026-11-02'],
      journal: storage.get(syncStateKey(UID)).journal,
      stamps: storage.get(syncStateKey(UID)).items.stamps,
    }).toEqual({ at, state: 'idle', note: 2_900_000, deletion: 3_000_000, deleted: true,
      setting: 3_000_000, language: 'zh-Hans', downloaded: 'downloaded', minutes: 60_000,
      journal: null, stamps: {} });
  }
});
