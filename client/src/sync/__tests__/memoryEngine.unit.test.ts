// The engine's Memory domain beyond the acceptance tests (MEM 3, implementer-owned): when it pushes, what a
// local change schedules, failures, and the registry wiring.
import type { VerseProgress } from '../../memory/types';
import { memoryHistoryKey, memoryLessonKey, memoryProgressKey, memorySettingsKey } from '../../storage/memoryKeys';
import { createMemoryRemote, type MemoryRemote } from '../memoryRemote';
import { DEFAULT_DOMAINS } from '../registry';
import type { SyncDomains } from '../shapes';
import { syncStateKey } from '../state';
import { RemoteError, type RemoteStore } from '../types';
import { DOMAINS, makeDevice } from './fixtures';

const MEM: SyncDomains = { ...DOMAINS, memory: { progress: memoryProgressKey, history: memoryHistoryKey } };

const row = (lastReviewedAt: string | null, over: Partial<VerseProgress> = {}): VerseProgress => ({
  stage: 'fill_blank',
  successes: 1,
  failures: 0,
  masteryScore: 20,
  nextDueAt: '2026-11-05T09:00:00.000Z',
  lastReviewedAt,
  lapsedAt: null,
  ...over,
});

let remote: MemoryRemote;
beforeEach(() => {
  remote = createMemoryRemote();
});

const pushes = () => remote.calls.filter((c) => c === 'pushMemory').length;

test('the registry syncs Memory progress and history, and not the lesson plan or the Memory settings', () => {
  expect(DEFAULT_DOMAINS.memory).toEqual({ progress: memoryProgressKey, history: memoryHistoryKey });
  const synced = [...(DEFAULT_DOMAINS.settings ?? []).map((k) => k.key), DEFAULT_DOMAINS.memory!.progress.key, DEFAULT_DOMAINS.memory!.history.key];
  expect(synced).not.toContain(memoryLessonKey.key);
  expect(synced).not.toContain(memorySettingsKey.key);
});

test('an unchanged device does not push its Memory document again', async () => {
  const a = makeDevice(remote, 'devA', { domains: MEM });
  a.storage.set(memoryProgressKey, { 'john-3-16': row('2026-11-02T09:00:00.000Z') });
  await a.engine.syncNow();
  expect(pushes()).toBe(1);
  await a.engine.syncNow();
  await a.engine.syncNow();
  expect(pushes()).toBe(1);
  // Another device's new verse is joined in, and then this device's document carries it too.
  remote.putMemory({ deviceId: 'devB', progress: { 'romans-12-1': row('2026-11-02T10:00:00.000Z') }, history: { startedOn: null, completedDates: [] }, updatedAt: 5 });
  await a.engine.syncNow();
  expect(pushes()).toBe(2);
  expect(Object.keys(remote.memory.get('devA')!.progress).sort()).toEqual(['john-3-16', 'romans-12-1']);
  await a.engine.syncNow();
  expect(pushes()).toBe(2);
});

test('its own document missing from the account (wiped) is pushed again', async () => {
  const a = makeDevice(remote, 'devA', { domains: MEM });
  a.storage.set(memoryProgressKey, { 'john-3-16': row('2026-11-02T09:00:00.000Z') });
  await a.engine.syncNow();
  remote.memory.clear();
  await a.engine.syncNow();
  expect(remote.memory.get('devA')?.progress).toEqual({ 'john-3-16': row('2026-11-02T09:00:00.000Z') });
});

describe('with the engine started', () => {
  beforeEach(() => jest.useFakeTimers());
  afterEach(() => {
    jest.clearAllTimers();
    jest.useRealTimers();
  });

  test('a Memory change schedules a sync; the engine’s own writes do not', async () => {
    const a = makeDevice(remote, 'devA', { domains: MEM });
    remote.putMemory({ deviceId: 'devB', progress: { 'romans-12-1': row('2026-11-02T10:00:00.000Z') }, history: { startedOn: '2026-11-01', completedDates: ['2026-11-01'] }, updatedAt: 5 });
    a.engine.start();
    await jest.advanceTimersByTimeAsync(0); // the first run: it writes B's Memory locally
    expect(a.storage.get(memoryProgressKey)['romans-12-1']).toBeDefined();
    const after = remote.calls.length;
    await jest.advanceTimersByTimeAsync(120_000);
    expect(remote.calls.length).toBe(after); // nothing scheduled by the engine's own writes
    a.storage.set(memoryHistoryKey, { startedOn: '2026-11-01', completedDates: ['2026-11-01', '2026-11-02'] });
    await jest.advanceTimersByTimeAsync(60_000); // the debounce
    expect(remote.memory.get('devA')?.history.completedDates).toEqual(['2026-11-01', '2026-11-02']);
    await a.engine.stop();
  });
});

test('offline while pulling Memory: the status is offline and the device keeps its Memory', async () => {
  const a = makeDevice(remote, 'devA', { domains: MEM });
  const mine = { 'john-3-16': row('2026-11-02T09:00:00.000Z') };
  a.storage.set(memoryProgressKey, mine);
  remote.failNext(new RemoteError('offline'), 'pullMemory');
  await a.engine.syncNow();
  expect(a.engine.status().state).toBe('offline');
  expect(a.storage.get(memoryProgressKey)).toEqual(mine);
  remote.failNext(new RemoteError('denied'), 'pushMemory');
  await a.engine.syncNow();
  expect(a.engine.status().state).toBe('error');
  await a.engine.syncNow();
  expect(a.engine.status().state).toBe('idle');
  expect(remote.memory.get('devA')?.progress).toEqual(mine);
});

test('a document whose history the device cannot store still gives its progress (parts are checked apart)', async () => {
  const a = makeDevice(remote, 'devA', { domains: MEM });
  a.storage.set(memoryHistoryKey, { startedOn: '2026-11-01', completedDates: ['2026-11-01'] });
  remote.putMemory({ deviceId: 'devZ', progress: { 'romans-12-1': row('2026-11-02T09:00:00.000Z') }, history: { startedOn: 'yesterday', completedDates: ['2026-02-30'] }, updatedAt: 5 });
  await a.engine.syncNow();
  expect(a.engine.status().state).toBe('idle');
  expect(a.storage.get(memoryProgressKey)['romans-12-1']).toBeDefined();
  expect(a.storage.get(memoryHistoryKey)).toEqual({ startedOn: '2026-11-01', completedDates: ['2026-11-01'] });
});

test('a remote without the Memory methods: Memory stays local and the rest syncs', async () => {
  const legacy: RemoteStore = {
    pullItems: remote.pullItems,
    pushItems: remote.pushItems,
    pullDevices: remote.pullDevices,
    pushDevice: remote.pushDevice,
    pullSettings: remote.pullSettings,
    pushSettings: remote.pushSettings,
  };
  // makeDevice takes a MemoryRemote; the engine only ever sees the RemoteStore methods.
  const a = makeDevice(legacy as MemoryRemote, 'devA', { domains: MEM });
  a.storage.set(memoryProgressKey, { 'john-3-16': row('2026-11-02T09:00:00.000Z') });
  await a.engine.syncNow();
  expect(a.engine.status().state).toBe('idle');
  expect(remote.memory.size).toBe(0);
  expect(a.storage.get(syncStateKey('alice')).memory).toBeUndefined();
});

test('signing in as another account combines; the first account’s document is untouched', async () => {
  const a = makeDevice(remote, 'devA', { domains: MEM });
  a.storage.set(memoryProgressKey, { 'john-3-16': row('2026-11-02T09:00:00.000Z') });
  await a.engine.syncNow();
  await a.engine.stop();
  const other = createMemoryRemote();
  other.putMemory({ deviceId: 'devB', progress: { 'romans-12-1': row('2026-11-02T10:00:00.000Z') }, history: { startedOn: null, completedDates: [] }, updatedAt: 5 });
  const b = makeDevice(other, 'devA', { domains: MEM, storage: a.storage, uid: 'bob' });
  await b.engine.syncNow();
  expect(Object.keys(a.storage.get(memoryProgressKey)).sort()).toEqual(['john-3-16', 'romans-12-1']);
  expect(Object.keys(remote.memory.get('devA')!.progress)).toEqual(['john-3-16']);
});
