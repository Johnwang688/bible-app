// SYNC-1 delta check 2 (reviewer-owned, read-only review of a6c3b14), through the real adapter and rules.
// Fails on a6c3b14 only on the finding it names (C:/dev/bible-app-work/mem/sync1-delta-check-2.md).
// Run: the emulator command in C:/dev/bible-app-work/mem/SYNC-1-memory-sync.md.
import { doc, setDoc } from 'firebase/firestore';

import type { VerseProgress } from '../../../memory/types';
import { memoryHistoryKey, memoryProgressKey } from '../../../storage/memoryKeys';
import { createStorage, memoryBackend } from '../../../storage/storage';
import { createSyncEngine } from '../../engine';
import { createFirestoreRemote, wireDocs } from '../../firestoreRemote';
import type { MemoryDoc, RemoteStore } from '../../types';
import { DOMAINS } from '../fixtures';
import { clearFirestore, closeAll, dbAs } from './emulator';

jest.setTimeout(240_000);
beforeEach(clearFirestore);
afterAll(closeAll);

const MEM = { ...DOMAINS, memory: { progress: memoryProgressKey, history: memoryHistoryKey } };
const devId = (tag: string) => `${tag}`.padEnd(20, '0');
const BASE = Date.now();
const t = (msAgo: number) => new Date(BASE - msAgo).toISOString();

const row = (over: Partial<VerseProgress> = {}): VerseProgress => ({
  stage: 'review',
  successes: 3,
  failures: 1,
  masteryScore: 60,
  nextDueAt: t(-2 * 86_400_000),
  lastReviewedAt: t(3_600_000),
  lapsedAt: null,
  ...over,
});

const memDoc = (deviceId: string): MemoryDoc => ({
  deviceId,
  progress: {},
  history: { startedOn: null, completedDates: [] },
  updatedAt: Date.now(),
});

function device(id: string) {
  const storage = createStorage(memoryBackend());
  const base = createFirestoreRemote(dbAs('alice'), 'alice');
  const counted = { pushes: 0 };
  const remote: RemoteStore = {
    ...base,
    pushMemory: async (m) => {
      counted.pushes++;
      await base.pushMemory(m);
    },
  };
  const engine = createSyncEngine({ uid: 'alice', storage, remote, domains: MEM, deviceId: id, debounceMs: 60_000 });
  return { storage, engine, counted };
}

test('D2-2 (e2e): a device repairs its own document after another client overwrites it with one the adapter cannot read', async () => {
  const id = devId('devA');
  const a = device(id);
  a.storage.set(memoryProgressKey, { 'john-3-16': row() });
  for (let i = 0; i < 3; i++) await a.engine.syncNow();
  expect(a.counted.pushes).toBe(1);

  // Rule-valid (the rules cannot cap a verse id at 64 characters) but dropped whole by readMemory /
  // decodeMemoryProgress, so the pull never returns it: `mine` is undefined, the pull is incremental,
  // and `pushed === sig` holds, so a6c3b14 does not push until the next full pull (up to a day).
  await setDoc(doc(dbAs('alice'), 'users', 'alice', 'memory', id), {
    ...wireDocs.memory(memDoc(id)),
    progress: `review,${'a'.repeat(65)},0,0,0,,,`,
  });
  await a.engine.syncNow();
  expect(a.counted.pushes).toBe(2);

  // A new device's first sync restores the verse.
  const b = device(devId('devB'));
  await b.engine.syncNow();
  expect(b.storage.get(memoryProgressKey)['john-3-16']).toEqual(row());
});
