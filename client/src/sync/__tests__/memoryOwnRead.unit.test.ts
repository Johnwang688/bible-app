// SYNC-1 fix 3 (delta check 2): when the engine reads its own Memory document by id (CONFLICTS.md rule 25).
// The acceptance tests (memoryDelta2) cover a loss seen at the start of a run and an unreadable overwrite;
// these cover the read the push makes when the values change during the run, and the steady state's cost.
import { getAllMemoryVerses } from '../../memory/library';
import type { VerseProgress } from '../../memory/types';
import { memoryHistoryKey, memoryProgressKey } from '../../storage/memoryKeys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { createMemoryRemote, type MemoryRemote } from '../memoryRemote';
import { DEFAULT_DOMAINS } from '../registry';
import type { SyncDomains } from '../shapes';
import { DOMAINS, iso, makeDevice } from './fixtures';

const PROD_DOMAINS: SyncDomains = {
  ...DOMAINS,
  memory: { progress: memoryProgressKey, history: memoryHistoryKey },
  memoryVerses: DEFAULT_DOMAINS.memoryVerses,
};
const NOW = Date.parse('2026-11-03T12:00:00.000Z');
const HOUR = 3_600_000;
const DAY = 86_400_000;
const [V1, V2] = getAllMemoryVerses().map((v) => v.id);

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

async function settled() {
  const backend = memoryBackend();
  const a = makeDevice(remote, 'devA', { domains: PROD_DOMAINS, start: NOW, storage: createStorage(backend) });
  a.storage.set(memoryProgressKey, { [V1!]: row() });
  await a.engine.syncNow(); // full, nothing on the account: pushes
  await a.engine.syncNow(); // full, finds its document: the cursor is set
  a.tick(HOUR);
  return { a, backend };
}

test('an incremental sync with nothing new and nothing changed does not read the own document', async () => {
  const { a } = await settled();
  remote.calls.length = 0;
  await a.engine.syncNow();
  expect(remote.calls).not.toContain('getMemory');
  expect(remote.calls).not.toContain('pushMemory');
});

test('local Memory lost during a run: the push reads the own document and never sends less than it holds', async () => {
  const { a, backend } = await settled();
  remote.calls.length = 0;
  // The run starts with the values of the last push (no read at the pull); the key stops reading back
  // while the run waits on a later pull.
  const held = remote.hold('pullItems');
  const run = a.engine.syncNow();
  await held.started;
  backend.set('memory.progress', '{not json');
  held.release();
  await run;
  expect(remote.calls).toContain('getMemory');
  expect(remote.calls).not.toContain('pushMemory'); // the account already holds what the device has
  expect(remote.memory.get('devA')!.progress[V1!]).toEqual(row());
});

test('local Memory replaced during a run: the push sends the join of the values and the own document', async () => {
  const { a } = await settled();
  const held = remote.hold('pullItems');
  const run = a.engine.syncNow();
  await held.started;
  // Raw storage write of a value that dropped V1 (not something the app does; it stands for any loss).
  a.storage.set(memoryProgressKey, { [V2!]: row({ successes: 3 }) });
  held.release();
  await run;
  const pushed = remote.memory.get('devA')!.progress;
  expect(pushed[V1!]).toEqual(row());
  expect(pushed[V2!]).toEqual(row({ successes: 3 }));
});
