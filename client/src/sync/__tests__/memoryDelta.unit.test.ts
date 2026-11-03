// Delta check of the SYNC-1 security fix (c46c37e): failing tests for new findings in
// C:/dev/bible-app-work/mem/sync1-delta-check.md. Each hostile document is one the Firestore rules (isMemory) and the
// adapter's decoder accept, and one the fix's pull bounds accept too: a known library verse, a review time in the
// past, no lapse. Anyone holding the user's ID token can write it as another "device" of that user.
import { getAllMemoryVerses } from '../../memory/library';
import { recordAttempt } from '../../memory/schedule';
import type { VerseProgress } from '../../memory/types';
import { memoryHistoryKey, memoryProgressKey } from '../../storage/memoryKeys';
import { createMemoryRemote, type MemoryRemote } from '../memoryRemote';
import { DEFAULT_DOMAINS } from '../registry';
import type { SyncDomains } from '../shapes';
import { DOMAINS, iso, makeDevice } from './fixtures';

// As production wires it: Memory plus the library filter (registry.ts DEFAULT_DOMAINS.memoryVerses).
const PROD_DOMAINS: SyncDomains = {
  ...DOMAINS,
  memory: { progress: memoryProgressKey, history: memoryHistoryKey },
  memoryVerses: DEFAULT_DOMAINS.memoryVerses,
};
const NOW = Date.parse('2026-11-03T12:00:00.000Z');
const DAY = 86_400_000;
const VERSE = getAllMemoryVerses()[0]!.id;

let remote: MemoryRemote;
beforeEach(() => {
  remote = createMemoryRemote();
});

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

describe('SYNC-1 delta check: pulled Memory documents after the fix', () => {
  test('D-1: a far-future nextDueAt on another device does not take a verse out of the review schedule for good', async () => {
    // The fix bounds lastReviewedAt and lapsedAt but not nextDueAt (memory.ts boundMemoryProgress). A row reviewed a
    // minute ago (so it wins the verse) whose next review is in the year 9999 is accepted and joined. The verse is then
    // never due again: buildSession only offers it as fill, and recordAttempt's due-gate keeps nextDueAt on a pass
    // of a verse that is not due, so every later real review carries the year-9999 date on, to every device.
    remote.putMemory({
      deviceId: 'evilDevice0000000000',
      progress: { [VERSE]: row({ masteryScore: 100, lastReviewedAt: iso(NOW - 60_000), nextDueAt: '9999-12-31T23:59:59.999Z' }) },
      history: { startedOn: null, completedDates: [] },
      updatedAt: NOW,
    });
    const a = makeDevice(remote, 'devA', { domains: PROD_DOMAINS, start: NOW });
    a.storage.set(memoryProgressKey, { [VERSE]: row() });
    await a.engine.syncNow();

    // A month later the user passes the verse (offered as fill). Honest schedules are at most 16 days out.
    const later = NOW + 30 * DAY;
    const stored = a.storage.get(memoryProgressKey)[VERSE]!;
    const next = recordAttempt(stored, true, new Date(later), later + 6 * 3_600_000);
    expect(Date.parse(next.nextDueAt!)).toBeLessThanOrEqual(later + 17 * DAY);
  });
});

describe('SYNC-1 delta check: this device\'s own Memory document', () => {
  test('D-3: a device repairs its own Memory document after another client overwrites it', async () => {
    // The engine skips the push when its last acknowledged push sent these values (state.memory.pushed === sig),
    // even when the pulled copy of its own document says something else. engine.ts assumes "only this device writes
    // its document", but any holder of the user's token can overwrite memory/{thisDeviceId} (the rules allow update).
    // Blanked, it stays blank until this device's values change, so a new or reinstalled device restores nothing.
    const a = makeDevice(remote, 'devA', { domains: PROD_DOMAINS, start: NOW });
    a.storage.set(memoryProgressKey, { [VERSE]: row() });
    a.storage.set(memoryHistoryKey, { startedOn: '2026-11-01', completedDates: ['2026-11-02'] });
    await a.engine.syncNow();
    expect(remote.memory.get('devA')!.progress[VERSE]).toBeDefined();

    remote.putMemory({ deviceId: 'devA', progress: {}, history: { startedOn: null, completedDates: [] }, updatedAt: NOW });
    a.tick(60_000);
    await a.engine.syncNow();
    expect(remote.memory.get('devA')!.progress[VERSE]).toEqual(row());
    expect(remote.memory.get('devA')!.history.completedDates).toEqual(['2026-11-02']);
  });
});
