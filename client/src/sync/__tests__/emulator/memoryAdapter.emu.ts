// The Firestore adapter's Memory documents against the emulator with the real rules (MEM 3, implementer-owned):
// pushMemory/pullMemory round-trip, the push path normalises what the rules refuse, the pull drops what does not
// decode, and two engines sync Memory through Firestore. Run: npm run test:emulator
import { doc, setDoc, serverTimestamp } from 'firebase/firestore';

import type { ProgressMap, VerseProgress } from '../../../memory/types';
import { memoryHistoryKey, memoryLessonKey, memoryProgressKey, memorySettingsKey } from '../../../storage/memoryKeys';
import { createStorage, memoryBackend } from '../../../storage/storage';
import { createSyncEngine } from '../../engine';
import { createFirestoreRemote } from '../../firestoreRemote';
import { RemoteError, type MemoryDoc } from '../../types';
import { DOMAINS } from '../fixtures';
import { clearFirestore, closeAll, dbAs } from './emulator';

const DEV_A = 'devA0000000000000000';
const DEV_B = 'devB0000000000000000';

beforeEach(clearFirestore);
afterAll(closeAll);

const row = (over: Partial<VerseProgress> = {}): VerseProgress => ({
  stage: 'fill_blank',
  successes: 1,
  failures: 0,
  masteryScore: 20,
  nextDueAt: '2026-11-05T09:00:00.000Z',
  lastReviewedAt: '2026-11-02T09:00:00.000Z',
  lapsedAt: null,
  ...over,
});

const memory = (over: Partial<MemoryDoc> = {}): MemoryDoc => ({
  deviceId: DEV_A,
  progress: {
    'john-3-16': row(),
    'psalm-119-105': row({ stage: 'review', successes: 12, failures: 3, masteryScore: 100, nextDueAt: null, lapsedAt: '2026-11-02T10:11:12.345Z' }),
    'romans-12-1': row({ stage: 'chunk_order', successes: 0, masteryScore: 0, nextDueAt: null, lastReviewedAt: null }),
  },
  history: { startedOn: '2026-10-30', completedDates: ['2026-10-30', '2026-11-02'] },
  updatedAt: Date.now() - 1000,
  ...over,
});

test('Memory documents round-trip, one per device', async () => {
  const remote = createFirestoreRemote(dbAs('alice'), 'alice');
  const a = memory();
  const b = memory({ deviceId: DEV_B, progress: {}, history: { startedOn: null, completedDates: [] } });
  await remote.pushMemory(a);
  await remote.pushMemory(b);
  const pulled = await remote.pullMemory();
  expect(pulled.find((d) => d.deviceId === DEV_A)).toEqual(a);
  expect(pulled.find((d) => d.deviceId === DEV_B)).toEqual(b);
  expect(pulled).toHaveLength(2);
  // A push replaces the device's own document.
  await remote.pushMemory({ ...a, history: { startedOn: '2026-10-30', completedDates: ['2026-11-03'] } });
  expect((await remote.pullMemory()).find((d) => d.deviceId === DEV_A)?.history.completedDates).toEqual(['2026-11-03']);
});

test('the push normalises what the storage schema allows but the rules refuse, and writes the rest', async () => {
  const remote = createFirestoreRemote(dbAs('alice'), 'alice');
  const warn = jest.spyOn(console, 'warn').mockImplementation(() => undefined);
  try {
    const progress: ProgressMap = {
      // A time the storage schema takes (no milliseconds, or microseconds), and a count past seven digits.
      'john-3-16': row({ lastReviewedAt: '2026-11-02T09:00:00Z', nextDueAt: '2026-11-05T09:00:00.123456Z', successes: 123_456_789 }),
      'romans-12-1': row(),
    };
    await remote.pushMemory(memory({ progress, history: { startedOn: '2026-10-30', completedDates: ['2026-11-02', '2026-10-30', '2026-11-02'] } }));
    const [pulled] = await remote.pullMemory();
    expect(pulled!.progress).toEqual({
      'john-3-16': row({ lastReviewedAt: '2026-11-02T09:00:00.000Z', nextDueAt: '2026-11-05T09:00:00.123Z', successes: 9_999_999 }),
      'romans-12-1': row(),
    });
    expect(pulled!.history.completedDates).toEqual(['2026-10-30', '2026-11-02']);
    expect(warn).toHaveBeenCalledTimes(1);
    expect(String(warn.mock.calls[0]![0])).not.toMatch(/john|romans|2026/);
  } finally {
    warn.mockRestore();
  }
});

test('a document the device cannot decode is dropped on pull; the others still come', async () => {
  const db = dbAs('alice');
  const remote = createFirestoreRemote(db, 'alice');
  await remote.pushMemory(memory({ deviceId: DEV_B }));
  // Rows out of order: the rules accept the rows, but it is not exactly an encoding.
  await setDoc(doc(db, 'users', 'alice', 'memory', DEV_A), {
    deviceId: DEV_A,
    progress: 'review,romans-12-1,0,0,0,,,;review,john-3-16,0,0,0,,,',
    completedDates: [],
    startedOn: null,
    updatedAt: Date.now() - 1000,
    serverTime: serverTimestamp(),
  });
  expect((await remote.pullMemory()).map((d) => d.deviceId)).toEqual([DEV_B]);
});

test('another user is refused with RemoteError denied', async () => {
  const mallory = createFirestoreRemote(dbAs('mallory'), 'alice');
  await expect(mallory.pullMemory()).rejects.toBeInstanceOf(RemoteError);
  await expect(mallory.pullMemory()).rejects.toMatchObject({ kind: 'denied' });
  await expect(mallory.pushMemory(memory())).rejects.toMatchObject({ kind: 'denied' });
});

test('a push stamped by a clock more than a day ahead is refused as denied, as a device document is', async () => {
  const remote = createFirestoreRemote(dbAs('alice'), 'alice');
  await expect(remote.pushMemory(memory({ updatedAt: Date.now() + 2 * 86_400_000 }))).rejects.toMatchObject({ kind: 'denied' });
});

test('two engines sync Memory through Firestore; the lesson plan and the Memory settings stay put', async () => {
  const mk = (deviceId: string) => {
    const storage = createStorage(memoryBackend());
    const engine = createSyncEngine({
      uid: 'alice',
      storage,
      remote: createFirestoreRemote(dbAs('alice'), 'alice'),
      domains: { ...DOMAINS, memory: { progress: memoryProgressKey, history: memoryHistoryKey } },
      deviceId,
      debounceMs: 60_000,
    });
    return { storage, engine };
  };
  const a = mk(DEV_A);
  const b = mk(DEV_B);
  a.storage.set(memoryProgressKey, { 'john-3-16': row({ lastReviewedAt: '2026-11-02T09:00:00.000Z' }) });
  a.storage.set(memoryHistoryKey, { startedOn: '2026-11-01', completedDates: ['2026-11-01', '2026-11-02'] });
  a.storage.set(memorySettingsKey, { speech: 'cantonese', script: 'traditional', voice: false, voiceConsent: true });
  b.storage.set(memoryProgressKey, {
    'john-3-16': row({ stage: 'review', lastReviewedAt: '2026-11-03T09:00:00.000Z' }),
    'romans-12-1': row(),
  });
  for (const d of [a, b, a]) {
    await d.engine.syncNow();
    expect(d.engine.status().state).toBe('idle');
  }
  const want = { 'john-3-16': row({ stage: 'review', lastReviewedAt: '2026-11-03T09:00:00.000Z' }), 'romans-12-1': row() };
  expect(a.storage.get(memoryProgressKey)).toEqual(want);
  expect(b.storage.get(memoryProgressKey)).toEqual(want);
  expect(b.storage.get(memoryHistoryKey)).toEqual({ startedOn: '2026-11-01', completedDates: ['2026-11-01', '2026-11-02'] });
  expect(b.storage.get(memorySettingsKey)).toEqual(memorySettingsKey.fallback);
  expect(b.storage.get(memoryLessonKey)).toBeNull();
});
