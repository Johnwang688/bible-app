// The "delete my data" marker in /firestore.rules (R6b-secfix-server). The backend writes
// deletedUsers/{uid} = { deletedAt } with the Admin SDK; while it exists, only a sign-in after deletedAt may
// write under users/{uid}. Clients can never read or write deletedUsers. Run: npm run test:emulator
import { deleteApp, initializeApp, type FirebaseApp } from 'firebase/app';
import {
  collection,
  connectFirestoreEmulator,
  deleteDoc,
  doc,
  getDoc,
  getDocs,
  getFirestore,
  serverTimestamp,
  setDoc,
  terminate,
  Timestamp,
  type Firestore,
} from 'firebase/firestore';

import { clearFirestore, closeAll, dbAs, denied, FIRESTORE_HOST, FIRESTORE_PORT, mockToken, PROJECT } from './emulator';

// Device ids in the engine's shape (20 url-safe characters); activeMs on the wire is "day=ms;..." (R6b-fu-rules).
const DEV_A = 'devA0000000000000000';

const apps: FirebaseApp[] = [];
let n = 0;

/** A Firestore client for `uid` whose (mock) ID token says it signed in at `authTimeMs` (whole seconds). */
function dbSignedInAt(uid: string, authTimeMs: number): Firestore {
  const app = initializeApp({ projectId: PROJECT, apiKey: 'demo-key' }, `marker-${++n}`);
  apps.push(app);
  const db = getFirestore(app);
  const authTime = Math.floor(authTimeMs / 1000);
  connectFirestoreEmulator(db, FIRESTORE_HOST, FIRESTORE_PORT, {
    mockUserToken: mockToken(uid, { iat: authTime, auth_time: authTime }),
  });
  return db;
}

/** Writes deletedUsers/{uid} as the backend does (the emulator's admin bypass stands in for the Admin SDK). */
async function writeMarker(uid: string, deletedAtMs: number): Promise<void> {
  const url =
    `http://${FIRESTORE_HOST}:${FIRESTORE_PORT}/v1/projects/${PROJECT}/databases/(default)/documents/` +
    `deletedUsers/${uid}`;
  const res = await fetch(url, {
    method: 'PATCH',
    headers: { Authorization: 'Bearer owner', 'Content-Type': 'application/json' },
    body: JSON.stringify({ fields: { deletedAt: { timestampValue: new Date(deletedAtMs).toISOString() } } }),
  });
  if (!res.ok) throw new Error(`marker write failed: ${res.status} ${await res.text()}`);
}

const NOW = () => Date.now();

const highlight = () => ({
  kind: 'highlight',
  ref: '43:3:16',
  deleted: false,
  value: { colour: 'blue' },
  updatedAt: NOW() - 1000,
  deviceId: DEV_A,
  serverTime: serverTimestamp(),
});
const device = () => ({
  deviceId: DEV_A,
  activeMs: '2026-11-02=300000',
  chaptersRead: {},
  goalMetDays: [],
  goal: null,
  updatedAt: NOW() - 1000,
  serverTime: serverTimestamp(),
});
const setting = () => ({
  key: 'language',
  json: '"zh-Hans"',
  updatedAt: NOW() - 1000,
  deviceId: DEV_A,
  serverTime: serverTimestamp(),
});

const writeAll = (db: Firestore, uid: string) => [
  setDoc(doc(db, 'users', uid, 'items', 'highlight:43:3:16'), highlight()),
  setDoc(doc(db, 'users', uid, 'devices', DEV_A), device()),
  setDoc(doc(db, 'users', uid, 'settings', 'language'), setting()),
];

// Signed in an hour ago, i.e. before the delete; and a sign-in after it.
let deletedAt: number;
let aliceBefore: Firestore;
let aliceAfter: Firestore;
let bobBefore: Firestore;
let aliceMock: Firestore; // dbAs: a mock token without auth_time (0), as the other suites use
let anon: Firestore;

beforeAll(() => {
  deletedAt = NOW() - 10 * 60_000;
  aliceBefore = dbSignedInAt('alice', deletedAt - 50 * 60_000);
  aliceAfter = dbSignedInAt('alice', deletedAt + 5 * 60_000);
  bobBefore = dbSignedInAt('bob', deletedAt - 50 * 60_000);
  aliceMock = dbAs('alice');
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

describe('without a marker', () => {
  test('an old sign-in writes as usual', async () => {
    await Promise.all(writeAll(aliceBefore, 'alice'));
  });
});

describe('after "delete my data"', () => {
  beforeEach(() => writeMarker('alice', deletedAt));

  test('a token from a sign-in before the delete cannot write items, devices or settings', async () => {
    for (const p of writeAll(aliceBefore, 'alice')) await denied(p);
    for (const p of writeAll(aliceMock, 'alice')) await denied(p);
  });

  test('a sign-in after the delete can write again', async () => {
    await Promise.all(writeAll(aliceAfter, 'alice'));
    expect((await getDoc(doc(aliceAfter, 'users', 'alice', 'items', 'highlight:43:3:16'))).exists()).toBe(true);
    // ... and update what it wrote.
    await setDoc(doc(aliceAfter, 'users', 'alice', 'settings', 'language'), { ...setting(), json: '"en"' });
  });

  test('the owner can still read (an old sign-in sees what a new one wrote)', async () => {
    await Promise.all(writeAll(aliceAfter, 'alice'));
    expect((await getDoc(doc(aliceBefore, 'users', 'alice', 'devices', DEV_A))).exists()).toBe(true);
    expect((await getDocs(collection(aliceBefore, 'users', 'alice', 'items'))).size).toBe(1);
  });

  test("another user's marker does not affect an unrelated uid", async () => {
    await Promise.all(writeAll(bobBefore, 'bob'));
  });

  test('a sign-in at the instant of the delete is not after it', async () => {
    const atDelete = dbSignedInAt('alice', Math.floor(deletedAt / 1000) * 1000);
    await writeMarker('alice', Math.floor(deletedAt / 1000) * 1000);
    await denied(setDoc(doc(atDelete, 'users', 'alice', 'devices', DEV_A), device()));
  });
});

describe('clients cannot read or write deletedUsers', () => {
  beforeEach(() => writeMarker('alice', deletedAt));

  test('not even their own marker, before or after signing in again', async () => {
    for (const db of [aliceBefore, aliceAfter, aliceMock]) {
      await denied(getDoc(doc(db, 'deletedUsers', 'alice')));
      await denied(getDocs(collection(db, 'deletedUsers')));
      // Moving deletedAt back (or replacing the marker) would re-open writes for an old token.
      await denied(setDoc(doc(db, 'deletedUsers', 'alice'), { deletedAt: Timestamp.fromMillis(0) }));
      await denied(deleteDoc(doc(db, 'deletedUsers', 'alice')));
    }
  });

  test("nor create one (for themselves or another user), nor when signed out", async () => {
    await denied(setDoc(doc(bobBefore, 'deletedUsers', 'bob'), { deletedAt: Timestamp.now() }));
    await denied(setDoc(doc(bobBefore, 'deletedUsers', 'carol'), { deletedAt: Timestamp.now() }));
    await denied(getDoc(doc(anon, 'deletedUsers', 'alice')));
    await denied(getDocs(collection(anon, 'deletedUsers')));
    await denied(setDoc(doc(anon, 'deletedUsers', 'dave'), { deletedAt: Timestamp.now() }));
  });
});
