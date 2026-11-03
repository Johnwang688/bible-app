// Incremental Memory pulls through the real adapter and rules (SYNC-1 fix 2, implementer-owned; CONFLICTS.md
// rule 25): the cursor, oldest-first pages that skip nothing, documents written in one commit, the per-pull
// character budget, and a device repairing its own document without pushing on every sync.
// Run: the emulator command in C:/dev/bible-app-work/mem/SYNC-1-memory-sync.md.
import { doc, setDoc, writeBatch } from 'firebase/firestore';

import type { ProgressMap, VerseProgress } from '../../../memory/types';
import { memoryHistoryKey, memoryProgressKey } from '../../../storage/memoryKeys';
import { createStorage, memoryBackend } from '../../../storage/storage';
import { encodeMemoryProgress, MEMORY_PULL_CHARS_MAX, MEMORY_PULL_MAX, MEMORY_ROWS_MAX } from '../../domains/memory';
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

const memDoc = (deviceId: string, progress: ProgressMap = {}): MemoryDoc => ({
  deviceId,
  progress,
  history: { startedOn: null, completedDates: [] },
  updatedAt: Date.now(),
});

async function write(m: MemoryDoc): Promise<void> {
  await setDoc(doc(dbAs('alice'), 'users', 'alice', 'memory', m.deviceId), wireDocs.memory(m));
}

const ids = (docs: readonly MemoryDoc[]) => docs.map((d) => d.deviceId);

test('an incremental pull returns only what was written after the cursor, oldest first', async () => {
  const remote = createFirestoreRemote(dbAs('alice'), 'alice');
  for (const tag of ['devA', 'devB', 'devC']) await write(memDoc(devId(tag)));
  const full = await remote.pullMemory();
  expect(ids(full)).toEqual([devId('devC'), devId('devB'), devId('devA')]); // newest first
  expect(full.cursor).not.toBeNull();

  expect(await remote.pullMemory(full.cursor)).toEqual([]);
  await write(memDoc(devId('devD'), { 'john-3-16': row() }));
  await write(memDoc(devId('devA'), { 'romans-12-1': row() })); // rewritten: a new document to the pull
  const next = await remote.pullMemory(full.cursor);
  expect(ids(next)).toEqual([devId('devD'), devId('devA')]);
  expect(next[1]!.progress['romans-12-1']).toEqual(row());
  expect(next.cursor!).toBeGreaterThan(full.cursor!);
  expect(await remote.pullMemory(next.cursor)).toEqual([]);
});

test('documents written in one commit (one server time) are paged through, and not read again', async () => {
  const remote = createFirestoreRemote(dbAs('alice'), 'alice');
  await write(memDoc(devId('devA')));
  const start = (await remote.pullMemory()).cursor;
  const db = dbAs('alice');
  const batch = writeBatch(db);
  const crowd = Array.from({ length: 30 }, (_, i) => devId(`crowd${String(i).padStart(2, '0')}`));
  for (const id of crowd) batch.set(doc(db, 'users', 'alice', 'memory', id), wireDocs.memory(memDoc(id)));
  await batch.commit();
  const pulled = await remote.pullMemory(start);
  expect(ids(pulled).sort()).toEqual([...crowd].sort()); // more than one page of them
  expect(await remote.pullMemory(pulled.cursor)).toEqual([]);
});

/** A rule-valid progress of MEMORY_ROWS_MAX rows of the widest form. */
function widest(tag: string): ProgressMap {
  const time = t(3_600_000);
  const out: ProgressMap = {};
  for (let i = 0; i < MEMORY_ROWS_MAX; i++) {
    out[`${tag}-${String(i).padStart(6, '0')}-`.padEnd(64, 'x')] = {
      stage: 'chunk_order',
      successes: 9_999_999,
      failures: 9_999_999,
      masteryScore: 100,
      nextDueAt: time,
      lastReviewedAt: time,
      lapsedAt: time,
    };
  }
  return out;
}

test('a pull stays within its character budget, and successive incremental pulls read every document once', async () => {
  const remote = createFirestoreRemote(dbAs('alice'), 'alice');
  await write(memDoc(devId('devA')));
  const start = (await remote.pullMemory()).cursor;
  const written = Array.from({ length: 20 }, (_, i) => devId(`big${String(i).padStart(2, '0')}`));
  for (const id of written) await write(memDoc(id, widest(id.toLowerCase())));
  const chars = (docs: readonly MemoryDoc[]) => docs.reduce((n, m) => n + encodeMemoryProgress(m.progress).length, 0);

  const full = await remote.pullMemory();
  expect(full.length).toBeLessThan(written.length);
  expect(chars(full)).toBeLessThanOrEqual(MEMORY_PULL_CHARS_MAX);
  expect(ids(full)[0]).toBe(written[written.length - 1]); // the newest

  const seen: string[] = [];
  let cursor = start;
  for (let n = 0; n < 5; n++) {
    const page = await remote.pullMemory(cursor);
    expect(page.length).toBeLessThanOrEqual(MEMORY_PULL_MAX);
    expect(chars(page)).toBeLessThanOrEqual(MEMORY_PULL_CHARS_MAX);
    seen.push(...ids(page));
    cursor = page.cursor;
  }
  expect(seen).toEqual(written); // oldest first, each once, none skipped
});

describe('two engines through Firestore', () => {
  /** An engine on Firestore whose Memory pushes are counted. */
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

  test('a device repairs its own document once another client overwrites it, and never pushes on every sync', async () => {
    const id = devId('devA');
    const a = device(id);
    // Counts past what the wire carries: the adapter clamps them, so the document never reads back equal to the
    // local value; the comparison normalises both sides, so this is not taken for a difference.
    const mine = { 'john-3-16': row({ successes: 12_345_678 }) };
    a.storage.set(memoryProgressKey, mine);
    for (let i = 0; i < 4; i++) await a.engine.syncNow();
    expect(a.engine.status().state).toBe('idle');
    expect(a.counted.pushes).toBe(1);

    await write(memDoc(id)); // blanked by another client holding the token
    await a.engine.syncNow();
    expect(a.counted.pushes).toBe(2);
    const [back] = (await createFirestoreRemote(dbAs('alice'), 'alice').pullMemory()).filter((d) => d.deviceId === id);
    expect(back!.progress['john-3-16']).toEqual(row({ successes: 9_999_999 }));
    for (let i = 0; i < 3; i++) await a.engine.syncNow();
    expect(a.counted.pushes).toBe(2);

    // A new device restores it.
    const b = device(devId('devB'));
    await b.engine.syncNow();
    expect(b.storage.get(memoryProgressKey)['john-3-16']).toEqual(row({ successes: 9_999_999 }));
  });
});
