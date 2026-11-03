// The Memory rules in /firestore.rules (MEM 3, implementer-owned): users/{uid}/memory/{deviceId}, one device's
// Memory progress and history, schema-tight like the other collections. Documents are built with the adapter's
// own encoder (`wireDocs.memory`), which only shapes and never validates, so a bad value reaches the rules as a
// bad document. Run: npm run test:emulator
import { deleteApp, initializeApp, type FirebaseApp } from 'firebase/app';
import {
  collection,
  connectFirestoreEmulator,
  deleteDoc,
  doc,
  getDoc,
  getDocs,
  getFirestore,
  setDoc,
  terminate,
  Timestamp,
  type Firestore,
} from 'firebase/firestore';

import type { ProgressMap, VerseProgress } from '../../../memory/types';
import { MEMORY_ROWS_MAX, MEMORY_WIRE_MAX } from '../../domains/memory';
import { wireDocs } from '../../firestoreRemote';
import type { MemoryDoc } from '../../types';
import { clearFirestore, closeAll, dbAs, denied, FIRESTORE_HOST, FIRESTORE_PORT, mockToken, PROJECT } from './emulator';

const apps: FirebaseApp[] = [];
let n = 0;

const DEV = 'Ab3_-xYz0123456789Qw'; // the engine's ids: 20 url-safe characters
const NOW = () => Date.now();

let alice: Firestore;
let bob: Firestore;
let anon: Firestore;
beforeAll(() => {
  alice = dbAs('alice');
  bob = dbAs('bob');
  anon = dbAs(null);
});
beforeEach(clearFirestore);
afterAll(async () => {
  for (const app of apps.splice(0)) {
    await terminate(getFirestore(app)).catch(() => undefined);
    await deleteApp(app).catch(() => undefined);
  }
  await closeAll();
});

const row = (over: Partial<VerseProgress> = {}): VerseProgress => ({
  stage: 'fill_blank',
  successes: 3,
  failures: 1,
  masteryScore: 40,
  nextDueAt: '2026-11-05T09:00:00.000Z',
  lastReviewedAt: '2026-11-02T09:00:00.000Z',
  lapsedAt: null,
  ...over,
});

const memory = (over: Partial<MemoryDoc> = {}): MemoryDoc => ({
  deviceId: DEV,
  progress: { 'john-3-16': row(), 'romans-12-1': row({ stage: 'review', masteryScore: 100, lapsedAt: '2026-11-02T10:11:12.345Z' }) },
  history: { startedOn: '2026-10-30', completedDates: ['2026-10-30', '2026-11-01', '2026-11-02'] },
  updatedAt: NOW() - 1000,
  ...over,
});

const ref = (db: Firestore, id = DEV, uid = 'alice') => doc(db, 'users', uid, 'memory', id);
/** The adapter's wire document for `m`, with fields overridden (undefined removes one). */
const wire = (m: MemoryDoc, extra: Record<string, unknown> = {}) => {
  const out: Record<string, unknown> = { ...wireDocs.memory(m), ...extra };
  for (const k of Object.keys(out)) if (out[k] === undefined) delete out[k];
  return out;
};
const push = (m: MemoryDoc, extra: Record<string, unknown> = {}, db = alice, id = m.deviceId) => setDoc(ref(db, id), wire(m, extra));
/** A document whose progress string is `progress`, verbatim. */
const pushRaw = (progress: unknown) => push(memory(), { progress });

const days = (n: number) => Array.from({ length: n }, (_, i) => new Date(Date.UTC(2000, 0, 1 + i)).toISOString().slice(0, 10));
const GOOD_ROW = 'fill_blank,john-3-16,3,1,40,2026-11-05T09:00:00.000Z,2026-11-02T09:00:00.000Z,';

describe('what the engine writes is accepted, and only the owner reads it', () => {
  test('a typical document; the owner reads it back (get and list)', async () => {
    await push(memory());
    expect((await getDoc(ref(alice))).data()?.progress).toBe(wireDocs.memory(memory()).progress);
    expect((await getDocs(collection(alice, 'users', 'alice', 'memory'))).size).toBe(1);
    // ... and replaces it.
    await push(memory({ history: { startedOn: '2026-10-30', completedDates: ['2026-11-03'] } }));
  });

  test('an empty document: no verses, no days, no start', async () => {
    await push(memory({ progress: {}, history: { startedOn: null, completedDates: [] } }));
  });

  test('every stage, the widest counts, never-reviewed rows', async () => {
    const progress: ProgressMap = {
      a: row({ stage: 'chunk_order', successes: 0, failures: 0, masteryScore: 0, nextDueAt: null, lastReviewedAt: null }),
      b: row({ stage: 'fill_blank' }),
      c: row({ stage: 'full_recall', successes: 9_999_999, failures: 9_999_999 }),
      'd-1-2': row({ stage: 'review', masteryScore: 100 }),
    };
    await push(memory({ progress }));
  });

  test(`at the bounds: ${MEMORY_ROWS_MAX} rows of the widest form (${MEMORY_WIRE_MAX} characters) and 1000 days`, async () => {
    const progress: ProgressMap = {};
    for (let i = 0; i < MEMORY_ROWS_MAX; i++) {
      const id = `${'x'.repeat(59)}-${String(i).padStart(4, '0')}`; // 64 characters, the storage cap
      progress[id] = row({ stage: 'full_recall', successes: 9_999_999, failures: 9_999_999, masteryScore: 100, lapsedAt: '2026-11-02T09:00:00.000Z' });
    }
    const m = memory({ progress, history: { startedOn: '2000-01-01', completedDates: days(1000) } });
    expect(wireDocs.memory(m).progress).toHaveLength(MEMORY_WIRE_MAX);
    await push(m);
  });

  test('another user cannot read or write it; a signed-out client neither', async () => {
    await push(memory());
    await denied(getDoc(ref(bob)));
    await denied(getDocs(collection(bob, 'users', 'alice', 'memory')));
    await denied(push(memory(), {}, bob));
    await denied(getDoc(ref(anon)));
    await denied(getDocs(collection(anon, 'users', 'alice', 'memory')));
    await denied(push(memory(), {}, anon));
  });

  test('nobody deletes one, nor reaches below it', async () => {
    await push(memory());
    await denied(deleteDoc(ref(alice)));
    await denied(setDoc(doc(alice, 'users', 'alice', 'memory', DEV, 'sub', 'x'), { a: 1 }));
  });
});

describe('the document shape', () => {
  const FIELDS = ['deviceId', 'progress', 'completedDates', 'startedOn', 'updatedAt', 'serverTime'];

  test.each(FIELDS)('a document without %s is refused', async (field) => {
    await denied(push(memory(), { [field]: undefined }));
  });

  test('an extra field is refused (the lesson plan, the settings, a streak, anything)', async () => {
    for (const extra of [{ lesson: {} }, { settings: { voiceConsent: true } }, { streak: 3 }, { x: 1 }]) {
      await denied(push(memory(), extra));
    }
  });

  test('a deviceId that is not the document id, or a document id that is not a device id, is refused', async () => {
    await denied(push(memory(), { deviceId: 'Zz3_-xYz0123456789Qw' }));
    await denied(push(memory({ deviceId: 'short' })));
    await denied(push(memory({ deviceId: 'Ab3_-xYz0123456789Q!' })));
  });

  test('wrong types are refused', async () => {
    for (const extra of [
      { progress: { 'john-3-16': row() } },
      { progress: 5 },
      { progress: null },
      { completedDates: '2026-11-02' },
      { completedDates: [20261102] },
      { startedOn: 20261030 },
      { startedOn: '' },
      { updatedAt: String(NOW()) },
      { updatedAt: 1.5 },
      { deviceId: 5 },
    ]) {
      await denied(push(memory(), extra));
    }
  });

  test('serverTime must be the server time, not a client value', async () => {
    await denied(push(memory(), { serverTime: Timestamp.now() }));
    await denied(push(memory(), { serverTime: NOW() }));
  });

  test('a client clock more than a day ahead, zero or negative is refused', async () => {
    await denied(push(memory({ updatedAt: NOW() + 2 * 86_400_000 })));
    await denied(push(memory({ updatedAt: 0 })));
    await denied(push(memory({ updatedAt: -5 })));
  });

  test('completed days: more than 1000, a repeat, or not a day is refused', async () => {
    await push(memory({ history: { startedOn: null, completedDates: days(1000) } }));
    await denied(push(memory({ history: { startedOn: null, completedDates: days(1001) } })));
    await denied(push(memory({ history: { startedOn: null, completedDates: ['2026-11-02', '2026-11-02'] } })));
    for (const bad of ['2026-13-01', '2026-11-32', '2026-11-2', '26-11-02', '2026-11-02;2026-11-03', '2026-11-02T00:00:00.000Z']) {
      await denied(push(memory({ history: { startedOn: null, completedDates: [bad] } })));
    }
  });

  test('a start that is not a day is refused', async () => {
    for (const bad of ['2026-13-01', '2026-11-2', 'yesterday', '2026-11-02T00:00:00.000Z']) {
      await denied(push(memory({ history: { startedOn: bad, completedDates: [] } })));
    }
  });
});

describe('the progress string, row by row', () => {
  test('the good row (the control) and an empty string are accepted', async () => {
    await pushRaw(GOOD_ROW);
    await pushRaw('');
    await pushRaw(`${GOOD_ROW};${GOOD_ROW.replace('john-3-16', 'romans-12-1')}`);
  });

  test.each([
    ['a stage that is not one', GOOD_ROW.replace('fill_blank', 'mastered')],
    ['a stage in another case', GOOD_ROW.replace('fill_blank', 'Fill_blank')],
    ['something before a row', `x${GOOD_ROW}`],
    ['a negative count', GOOD_ROW.replace(',3,1,', ',-3,1,')],
    ['a count with a leading zero', GOOD_ROW.replace(',3,1,', ',03,1,')],
    ['a count of eight digits', GOOD_ROW.replace(',3,1,', ',3,10000000,')],
    ['a fractional count', GOOD_ROW.replace(',3,1,', ',3.5,1,')],
    ['mastery 101', GOOD_ROW.replace(',40,', ',101,')],
    ['mastery -1', GOOD_ROW.replace(',40,', ',-1,')],
    ['a time without milliseconds', GOOD_ROW.replace('2026-11-05T09:00:00.000Z', '2026-11-05T09:00:00Z')],
    ['a time with an offset', GOOD_ROW.replace('2026-11-05T09:00:00.000Z', '2026-11-05T09:00:00.000+01:00')],
    ['a time that is not one', GOOD_ROW.replace('2026-11-05T09:00:00.000Z', '2026-11-05T25:00:00.000Z')],
    ['a time in the last field that is a word', `${GOOD_ROW}null`],
    ['a verse id in capitals', GOOD_ROW.replace('john-3-16', 'John-3-16')],
    ['a verse id with a double dash', GOOD_ROW.replace('john-3-16', 'john--3-16')],
    ['a verse id with a trailing dash', GOOD_ROW.replace('john-3-16', 'john-3-16-')],
    ['an empty verse id', GOOD_ROW.replace('john-3-16', '')],
    ['a missing field', GOOD_ROW.replace(',3,1,', ',3,')],
    ['an extra field', `${GOOD_ROW},`],
    ['a trailing separator', `${GOOD_ROW};`],
    ['an empty row between two', `${GOOD_ROW};;${GOOD_ROW}`],
    ['JSON', JSON.stringify({ 'john-3-16': row() })],
    ['a newline', `${GOOD_ROW}\n`],
  ])('%s is refused', async (_name, progress) => {
    await denied(pushRaw(progress));
  });

  test(`more than ${MEMORY_ROWS_MAX} rows, or a string over ${MEMORY_WIRE_MAX} characters, is refused`, async () => {
    const short = (i: number) => `review,v${i},0,0,0,,,`;
    await pushRaw(Array.from({ length: MEMORY_ROWS_MAX }, (_, i) => short(i)).join(';'));
    await denied(pushRaw(Array.from({ length: MEMORY_ROWS_MAX + 1 }, (_, i) => short(i)).join(';')));
    // The size bound holds before the regex: one row too long to fit.
    const wide = `review,${'x'.repeat(MEMORY_WIRE_MAX)},0,0,0,,,`;
    await denied(pushRaw(wide));
  });
});

// ---- the "delete my data" marker (as deletedMarker.emu.ts) ----

function dbSignedInAt(uid: string, authTimeMs: number): Firestore {
  const app = initializeApp({ projectId: PROJECT, apiKey: 'demo-key' }, `memory-marker-${++n}`);
  apps.push(app);
  const db = getFirestore(app);
  const authTime = Math.floor(authTimeMs / 1000);
  connectFirestoreEmulator(db, FIRESTORE_HOST, FIRESTORE_PORT, { mockUserToken: mockToken(uid, { iat: authTime, auth_time: authTime }) });
  return db;
}

async function writeMarker(uid: string, deletedAtMs: number): Promise<void> {
  const url = `http://${FIRESTORE_HOST}:${FIRESTORE_PORT}/v1/projects/${PROJECT}/databases/(default)/documents/deletedUsers/${uid}`;
  const res = await fetch(url, {
    method: 'PATCH',
    headers: { Authorization: 'Bearer owner', 'Content-Type': 'application/json' },
    body: JSON.stringify({ fields: { deletedAt: { timestampValue: new Date(deletedAtMs).toISOString() } } }),
  });
  if (!res.ok) throw new Error(`marker write failed: ${res.status} ${await res.text()}`);
}

describe('after "delete my data"', () => {
  test('a sign-in from before the delete cannot write Memory; one after it can; reads stay open', async () => {
    const deletedAt = NOW() - 10 * 60_000;
    const before = dbSignedInAt('alice', deletedAt - 50 * 60_000);
    const after = dbSignedInAt('alice', deletedAt + 5 * 60_000);
    await writeMarker('alice', deletedAt);
    await denied(push(memory(), {}, before));
    await denied(push(memory(), {}, alice)); // a mock token without auth_time
    await push(memory(), {}, after);
    expect((await getDoc(ref(before))).exists()).toBe(true);
  });
});
