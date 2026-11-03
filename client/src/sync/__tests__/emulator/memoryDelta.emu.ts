// Delta check of the SYNC-1 security fix (c46c37e): a failing end-to-end test for finding D-2 in
// C:/dev/bible-app-work/mem/sync1-delta-check.md, through the real rules and the real adapter. A client holding the
// user's ID token writes MEMORY_PULL_MAX rule-valid Memory documents once, each at the rules' size bound. The fix
// keeps them out of local storage (unknown verses), but every later sync of every device still downloads and decodes
// them, and no client can delete them. Run: the emulator command in the delta check.
import { doc, setDoc } from 'firebase/firestore';

import type { VerseProgress } from '../../../memory/types';
import { memoryHistoryKey, memoryProgressKey } from '../../../storage/memoryKeys';
import { createStorage, memoryBackend } from '../../../storage/storage';
import { encodeMemoryProgress, MEMORY_PULL_MAX, MEMORY_ROWS_MAX } from '../../domains/memory';
import { createSyncEngine } from '../../engine';
import { createFirestoreRemote, wireDocs } from '../../firestoreRemote';
import { DEFAULT_DOMAINS } from '../../registry';
import { DOMAINS } from '../fixtures';
import { clearFirestore, closeAll, dbAs } from './emulator';

jest.setTimeout(240_000);
beforeEach(clearFirestore);
afterAll(closeAll);

const DOMAINS_PROD = { ...DOMAINS, memory: { progress: memoryProgressKey, history: memoryHistoryKey }, memoryVerses: DEFAULT_DOMAINS.memoryVerses };

function device(id: string) {
  const storage = createStorage(memoryBackend());
  const engine = createSyncEngine({ uid: 'alice', storage, remote: createFirestoreRemote(dbAs('alice'), 'alice'), domains: DOMAINS_PROD, deviceId: id, debounceMs: 60_000 });
  return { storage, engine };
}

/** A rule-valid progress of MEMORY_ROWS_MAX rows at the rules' row bound (171 characters: 343999 in all). */
function maxProgress(tag: string): Record<string, VerseProgress> {
  const t = new Date(Date.now() - 3_600_000).toISOString();
  const out: Record<string, VerseProgress> = {};
  for (let i = 0; i < MEMORY_ROWS_MAX; i++) {
    out[`${tag}-${String(i).padStart(6, '0')}-`.padEnd(64, 'x')] = {
      stage: 'chunk_order',
      successes: 9_999_999,
      failures: 9_999_999,
      masteryScore: 100,
      nextDueAt: t,
      lastReviewedAt: t,
      lapsedAt: t,
    };
  }
  return out;
}

test(`D-2 (e2e): ${MEMORY_PULL_MAX} documents written once do not make every later sync download megabytes`, async () => {
  const db = dbAs('alice');
  for (let d = 0; d < MEMORY_PULL_MAX; d++) {
    const id = `evil${String(d).padStart(16, '0')}`;
    await setDoc(
      doc(db, 'users', 'alice', 'memory', id),
      wireDocs.memory({ deviceId: id, progress: maxProgress(`e${d}`), history: { startedOn: null, completedDates: [] }, updatedAt: Date.now() }),
    );
  }
  // The attacker is gone. The user's two devices sync as usual (each re-pushes into the 50-document window).
  const a = device('devA0000000000000000');
  const b = device('devB0000000000000000');
  for (let i = 0; i < 2; i++) {
    await a.engine.syncNow();
    await b.engine.syncNow();
  }
  expect(a.engine.status().state).toBe('idle');
  // What one ordinary later sync of either device downloads and decodes: budget 2 MB of progress strings
  // (an honest document is about 10 KB: 60 verses).
  const pulled = await createFirestoreRemote(dbAs('alice'), 'alice').pullMemory();
  const chars = pulled.reduce((n, m) => n + encodeMemoryProgress(m.progress).length, 0);
  expect(chars).toBeLessThanOrEqual(2_000_000);
});
