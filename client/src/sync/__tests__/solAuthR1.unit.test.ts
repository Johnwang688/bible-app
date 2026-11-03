// AUTH hardening verifier round 1: boundary and recovery checks using the acceptance suite's
// separate server/device clocks and Firestore request log. No production files are changed.
import { createStorage, memoryBackend } from '../../storage/storage';
import { CLOCK_AHEAD_MAX_MS } from '../clock';
import { createSyncEngine } from '../engine';
import { createFirestoreRemote } from '../firestoreRemote';
import type { RemoteItem } from '../types';
import { progressKey } from './fixtures';

type Data = Record<string, unknown>;
interface FakeState {
  serverNow: number;
  requests: { kind: 'batch' | 'set'; paths: string[]; ok: boolean }[];
  deniedIds: Set<string>;
  errorCode: string | null;
}

jest.mock('firebase/firestore', () => {
  const docs = new Map<string, Data>();
  const state: FakeState = { serverNow: 0, requests: [], deniedIds: new Set(), errorCode: null };
  let tick = 0;
  class Timestamp {
    readonly ms: number;
    constructor(at: number) { this.ms = at; }
    toMillis() { return this.ms; }
    static fromMillis(ms: number) { return new Timestamp(ms); }
  }
  class FirestoreError extends Error {
    name = 'FirebaseError';
    readonly code: string;
    constructor(code: string, message: string) { super(message); this.code = code; }
  }
  const isClientTime = (t: unknown) => typeof t === 'number' && Number.isInteger(t) && t > 0 && t <= state.serverNow + 86_400_000;
  const allowed = (path: string, d: Data) => {
    if (state.errorCode || state.deniedIds.has(path.split('/').at(-1)!)) return false;
    if (!isClientTime(d.updatedAt)) return false;
    return path.split('/')[2] !== 'devices' || d.goal === null || isClientTime((d.goal as Data).updatedAt);
  };
  const store = (path: string, d: Data) => docs.set(path, { ...d, serverTime: new Timestamp(state.serverNow + ++tick) });
  const refused = () => new FirestoreError(state.errorCode ?? 'permission-denied', 'refused');
  return {
    __fake: { docs, state },
    Timestamp,
    FirestoreError,
    serverTimestamp: () => ({ serverTimestamp: true }),
    collection: (_db: unknown, ...segs: string[]) => ({ path: segs.join('/') }),
    doc: (base: { path?: string }, ...segs: string[]) => ({ path: base?.path ? [base.path, ...segs].join('/') : segs.join('/') }),
    query: (c: { path: string }, ...cons: { field: string; value: Timestamp }[]) => ({ path: c.path, cons }),
    where: (field: string, _op: string, value: Timestamp) => ({ field, value }),
    getDocsFromServer: async (q: { path: string; cons: { field: string; value: Timestamp }[] }) => {
      const prefix = `${q.path}/`;
      const out: { id: string; data: () => Data }[] = [];
      for (const [p, d] of docs) {
        const id = p.slice(prefix.length);
        if (!p.startsWith(prefix) || id.includes('/')) continue;
        if (q.cons.some((c) => !((d[c.field] as Timestamp).toMillis() > c.value.toMillis()))) continue;
        out.push({ id, data: () => d });
      }
      return { docs: out };
    },
    setDoc: async (ref: { path: string }, d: Data) => {
      const ok = allowed(ref.path, d);
      state.requests.push({ kind: 'set', paths: [ref.path], ok });
      if (!ok) throw refused();
      store(ref.path, d);
    },
    writeBatch: () => {
      const ops: { ref: { path: string }; d: Data }[] = [];
      return {
        set: (ref: { path: string }, d: Data) => void ops.push({ ref, d }),
        commit: async () => {
          const ok = ops.every((o) => allowed(o.ref.path, o.d));
          state.requests.push({ kind: 'batch', paths: ops.map((o) => o.ref.path), ok });
          if (!ok) throw refused();
          for (const o of ops) store(o.ref.path, o.d);
        },
      };
    },
  };
});

const fake = (jest.requireMock('firebase/firestore') as { __fake: { docs: Map<string, Data>; state: FakeState } }).__fake;
const HOUR = 3_600_000;
const DAY = 24 * HOUR;
const T0 = Date.UTC(2026, 10, 2, 12);
const SELF = 'devA_0123456789abcde';
let deviceNow = T0;
const remote = (uid = 'alice') => createFirestoreRemote({} as never, uid);
const list = (): RemoteItem[] => [1, 2].map((v) => ({
  id: `note:1:1:${v}`, kind: 'note', ref: `1:1:${v}`, deleted: false,
  value: { text: `n${v}` }, updatedAt: T0, deviceId: SELF,
}));
const sets = () => fake.state.requests.filter((r) => r.kind === 'set').length;

beforeEach(() => {
  fake.docs.clear();
  fake.state.requests.length = 0;
  fake.state.serverNow = T0;
  fake.state.deniedIds.clear();
  fake.state.errorCode = null;
  deviceNow = T0;
  jest.spyOn(Date, 'now').mockImplementation(() => deviceNow);
  jest.spyOn(console, 'warn').mockImplementation(() => undefined);
});
afterEach(() => jest.restoreAllMocks());

test('sound: S5-2 partial recovery is discovered at exactly REFAN_MS, without extending the refusal time', async () => {
  const items = list();
  const r = remote();
  items.forEach((i) => fake.state.deniedIds.add(i.id));
  await expect(r.pushItems(items)).rejects.toMatchObject({ kind: 'denied' });
  expect(sets()).toBe(2);
  fake.state.deniedIds.delete(items[0]!.id);
  deviceNow += HOUR - 1;
  await expect(r.pushItems(items)).rejects.toMatchObject({ kind: 'denied' });
  expect(sets()).toBe(2);
  deviceNow++;
  await expect(r.pushItems(items)).resolves.toEqual({ held: [items[1]!.id] });
  expect(sets()).toBe(4);
  expect(fake.docs.get(`users/alice/items/${items[0]!.id}`)?.value).toEqual(items[0]!.value);
  // A successful partial fan-out must forget this signature too.
  await r.pushItems(items);
  expect(sets()).toBe(6);
});

test('sound: S5-2 signature distinguishes edited data, document ids and collection names', async () => {
  const items = list();
  const r = remote();
  fake.state.errorCode = 'permission-denied';
  await expect(r.pushItems(items)).rejects.toMatchObject({ kind: 'denied' });
  const edited = items.map((i) => ({ ...i, value: { text: `${(i.value as { text: string }).text} edited` } }));
  await expect(r.pushItems(edited)).rejects.toMatchObject({ kind: 'denied' });
  expect(sets()).toBe(4);
  await expect(r.pushItems(edited.map((i) => ({ ...i, id: `${i.id}0`, ref: `${i.ref}0` })))).rejects.toMatchObject({ kind: 'denied' });
  expect(sets()).toBe(6);
  await expect(r.pushSettings([
    { key: 'language', json: JSON.stringify('en'), updatedAt: T0, deviceId: SELF },
    { key: 'appearance', json: JSON.stringify({ preset: 'silver', mode: 'light' }), updatedAt: T0, deviceId: SELF },
  ])).rejects.toMatchObject({ kind: 'denied' });
  expect(sets()).toBe(8);
});

test('sound: S5-2 memory belongs to one uid and a successful commit clears it', async () => {
  const items = list();
  const alice = remote();
  fake.state.errorCode = 'permission-denied';
  await expect(alice.pushItems(items)).rejects.toMatchObject({ kind: 'denied' });
  await expect(remote('bob').pushItems(items)).rejects.toMatchObject({ kind: 'denied' });
  expect(sets()).toBe(4);
  fake.state.errorCode = null;
  await alice.pushItems(items);
  expect(fake.docs.has(`users/alice/items/${items[0]!.id}`)).toBe(true);
  fake.state.errorCode = 'permission-denied';
  await expect(alice.pushItems(items)).rejects.toMatchObject({ kind: 'denied' });
  expect(sets()).toBe(6);
});

test('sound: S5-2 a non-permission batch error is still propagated while a refusal is remembered', async () => {
  const items = list();
  const r = remote();
  fake.state.errorCode = 'permission-denied';
  await expect(r.pushItems(items)).rejects.toMatchObject({ kind: 'denied' });
  fake.state.errorCode = 'unavailable';
  await expect(r.pushItems(items)).rejects.toMatchObject({ kind: 'offline' });
  expect(sets()).toBe(2);
});

test('sound: S5-3 real progress goes out while a goal is held, and the goal goes out at its clock bound', async () => {
  const storage = createStorage(memoryBackend());
  const engine = createSyncEngine({ uid: 'alice', storage, remote: remote(), domains: { progress: progressKey }, deviceId: SELF, now: () => deviceNow });
  try {
    const goalAt = T0 + 30 * DAY;
    deviceNow = goalAt;
    storage.set(progressKey, { ...storage.get(progressKey), goalMinutes: 20 });
    await engine.syncNow();
    deviceNow = T0;
    await engine.syncNow();
    const path = `users/alice/devices/${SELF}`;
    expect(fake.docs.get(path)?.goal).toBeNull();
    storage.set(progressKey, {
      ...storage.get(progressKey), activeMs: { '2026-11-02': 60_000 },
      chaptersRead: { '1:1': new Date(T0).toISOString() }, goalMetDays: ['2026-11-02'],
    });
    await engine.syncNow();
    const sent = fake.docs.get(path)!;
    expect(sent.activeMs).toBe('2026-11-02=60000');
    expect(sent.chaptersRead).toEqual({ '1:1': new Date(T0).toISOString() });
    expect(sent.goalMetDays).toEqual(['2026-11-02']);
    expect(sent.goal).toBeNull();
    deviceNow = goalAt - CLOCK_AHEAD_MAX_MS;
    fake.state.serverNow = deviceNow;
    await engine.syncNow();
    expect(fake.docs.get(path)?.goal).toEqual({ minutes: 20, updatedAt: goalAt });
    const after = sets();
    await engine.syncNow();
    expect(sets()).toBe(after);
  } finally {
    await engine.stop();
  }
});
