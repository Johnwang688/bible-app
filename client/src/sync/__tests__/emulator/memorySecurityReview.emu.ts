// Security review of SYNC-1 (Memory sync): failing end-to-end tests for findings SR-M1, SR-M2 and SR-M3 in
// C:/dev/bible-app-work/mem/sync1-security-review.md, through the real rules and the real adapter. A client holding
// the user's ID token writes another "device" document that the rules (isMemory) accept and the adapter decodes;
// the user's own engine then syncs. Run: the emulator command in the review.
import { doc, setDoc } from 'firebase/firestore';

import { dailyStreak } from '../../../memory/dailyLesson';
import type { VerseProgress } from '../../../memory/types';
import { memoryHistoryKey, memoryProgressKey } from '../../../storage/memoryKeys';
import { createStorage, memoryBackend } from '../../../storage/storage';
import { MEMORY_DAYS_MAX, MEMORY_ROWS_MAX } from '../../domains/memory';
import { createSyncEngine } from '../../engine';
import { createFirestoreRemote, wireDocs } from '../../firestoreRemote';
import { DOMAINS } from '../fixtures';
import { clearFirestore, closeAll, dbAs } from './emulator';

const EVIL = 'evil0000000000000000';
const DEV_A = 'devA0000000000000000';

beforeEach(clearFirestore);
afterAll(closeAll);

const real = (over: Partial<VerseProgress> = {}): VerseProgress => ({
  stage: 'review',
  successes: 12,
  failures: 1,
  masteryScore: 90,
  nextDueAt: new Date(Date.now() + 7 * 86_400_000).toISOString(),
  lastReviewedAt: new Date(Date.now() - 3_600_000).toISOString(),
  lapsedAt: null,
  ...over,
});

function deviceA() {
  const storage = createStorage(memoryBackend());
  const engine = createSyncEngine({
    uid: 'alice',
    storage,
    remote: createFirestoreRemote(dbAs('alice'), 'alice'),
    domains: { ...DOMAINS, memory: { progress: memoryProgressKey, history: memoryHistoryKey } },
    deviceId: DEV_A,
    debounceMs: 60_000,
  });
  return { storage, engine };
}

test('SR-M1 (e2e): a year-9999 review written with the user token does not override a real review', async () => {
  // Accepted by the rules: isoRe() takes any year, and nothing bounds lastReviewedAt by request.time.
  await setDoc(
    doc(dbAs('alice'), 'users', 'alice', 'memory', EVIL),
    wireDocs.memory({
      deviceId: EVIL,
      progress: { 'john-3-16': real({ stage: 'chunk_order', successes: 0, failures: 0, masteryScore: 0, lastReviewedAt: '9999-12-31T23:59:59.999Z' }) },
      history: { startedOn: null, completedDates: [] },
      updatedAt: Date.now(),
    }),
  );
  const a = deviceA();
  const mine = real();
  a.storage.set(memoryProgressKey, { 'john-3-16': mine });
  await a.engine.syncNow();
  expect(a.engine.status().state).toBe('idle');
  expect(a.storage.get(memoryProgressKey)['john-3-16']).toEqual(mine);
});

test('SR-M2 (e2e): 1000 far-future completed days written with the user token do not evict the real ones', async () => {
  const future = Array.from({ length: MEMORY_DAYS_MAX }, (_, i) => new Date(Date.UTC(9000, 0, 1 + i)).toISOString().slice(0, 10));
  await setDoc(
    doc(dbAs('alice'), 'users', 'alice', 'memory', EVIL),
    wireDocs.memory({ deviceId: EVIL, progress: {}, history: { startedOn: null, completedDates: future }, updatedAt: Date.now() }),
  );
  const a = deviceA();
  const today = new Date().toISOString().slice(0, 10);
  const yesterday = new Date(Date.now() - 86_400_000).toISOString().slice(0, 10);
  a.storage.set(memoryHistoryKey, { startedOn: yesterday, completedDates: [yesterday, today] });
  await a.engine.syncNow();
  expect(a.engine.status().state).toBe('idle');
  const after = a.storage.get(memoryHistoryKey).completedDates;
  expect(after).toEqual(expect.arrayContaining([yesterday, today]));
  expect(dailyStreak(after, today)).toBe(2);
});

test(`SR-M3a (e2e): Memory documents of unknown verses written with the user token do not grow local progress past ${MEMORY_ROWS_MAX} rows`, async () => {
  const db = dbAs('alice');
  for (let d = 0; d < 3; d++) {
    const id = `evil${String(d).padStart(16, '0')}`;
    const progress: Record<string, VerseProgress> = {};
    for (let i = 0; i < MEMORY_ROWS_MAX; i++) {
      progress[`x${d}-${String(i).padStart(6, '0')}-`.padEnd(64, 'x')] = real({ successes: 0, failures: 0, masteryScore: 0, nextDueAt: null });
    }
    await setDoc(doc(db, 'users', 'alice', 'memory', id), wireDocs.memory({ deviceId: id, progress, history: { startedOn: null, completedDates: [] }, updatedAt: Date.now() }));
  }
  const a = deviceA();
  a.storage.set(memoryProgressKey, { 'john-3-16': real() });
  await a.engine.syncNow();
  expect(a.engine.status().state).toBe('idle');
  expect(Object.keys(a.storage.get(memoryProgressKey)).length).toBeLessThanOrEqual(MEMORY_ROWS_MAX);
});
