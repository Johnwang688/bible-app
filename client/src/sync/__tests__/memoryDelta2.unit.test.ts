// SYNC-1 delta check 2 (reviewer-owned, read-only review of a6c3b14): incremental Memory pulls.
// Fails on a6c3b14 only on the finding it names (C:/dev/bible-app-work/mem/sync1-delta-check-2.md).
import { getAllMemoryVerses } from '../../memory/library';
import type { VerseProgress } from '../../memory/types';
import { memoryHistoryKey, memoryProgressKey } from '../../storage/memoryKeys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { createMemoryRemote, type MemoryRemote } from '../memoryRemote';
import { DEFAULT_DOMAINS } from '../registry';
import type { SyncDomains } from '../shapes';
import { syncStateKey } from '../state';
import { DOMAINS, iso, makeDevice } from './fixtures';

const PROD_DOMAINS: SyncDomains = {
  ...DOMAINS,
  memory: { progress: memoryProgressKey, history: memoryHistoryKey },
  memoryVerses: DEFAULT_DOMAINS.memoryVerses,
};
const NOW = Date.parse('2026-11-03T12:00:00.000Z');
const HOUR = 3_600_000;
const DAY = 86_400_000;
const [V1] = getAllMemoryVerses().map((v) => v.id);

const row = (over: Partial<VerseProgress> = {}): VerseProgress => ({
  stage: 'review',
  successes: 12,
  failures: 1,
  masteryScore: 80,
  nextDueAt: iso(NOW + 2 * DAY),
  lastReviewedAt: iso(NOW - 2 * DAY),
  lapsedAt: null,
  ...over,
});

let remote: MemoryRemote;
beforeEach(() => {
  remote = createMemoryRemote();
});

describe('SYNC-1 delta check 2: the cursor assumes the local values still hold what was pulled', () => {
  test('D2-1: a device whose local Memory reads back empty does not overwrite its own document on the account with nothing', async () => {
    const backend = memoryBackend();
    const a = makeDevice(remote, 'devA', { domains: PROD_DOMAINS, start: NOW, storage: createStorage(backend) });
    a.storage.set(memoryProgressKey, { [V1!]: row() });
    await a.engine.syncNow(); // full: nothing on the account, pushes its document
    await a.engine.syncNow(); // full again (no cursor yet): finds its document, the cursor is set
    expect(a.storage.get(syncStateKey('alice')).memory!.cursor).not.toBeNull();
    expect(remote.memory.get('devA')!.progress[V1!]).toEqual(row());

    // The local key stops reading back (corrupt JSON, or a newer version after an app rollback):
    // storage.get returns the fallback, {}. The sync state, a separate key, is intact.
    backend.set('memory.progress', '{not json');
    expect(a.storage.get(memoryProgressKey)).toEqual({});

    a.tick(HOUR); // within the day: the next pull is incremental, and nobody wrote since the cursor
    await a.engine.syncNow();

    // The account's only copy must survive (and, ideally, come back to the device). On a6c3b14 the
    // incremental pull returns nothing, the values ({}) differ from the last push, and the device pushes
    // {} over its own document: the row is gone from the account, and later full pulls cannot restore it.
    expect(remote.memory.get('devA')!.progress[V1!]).toEqual(row());
  });
});
