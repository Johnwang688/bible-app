// Security review round 2 (R6b-security-r2): probes of the deletion marker (F1) in /firestore.rules.
// Every write under users/{uid} now evaluates canWrite(uid): exists(deletedUsers/{uid}) and, when the
// marker exists, get() of it. Firestore limits rule document-access calls (10 per single-document
// request, 20 per batched write). The sync remote (firestoreRemote.ts writeAll) commits up to
// BATCH_MAX = 450 writes per batch, so a normal first sync must still pass with the marker check.
// Tests named "sound" are expected to pass; "FINDING" tests assert the secure/working behaviour and
// fail on the reviewed code. Run: npm run test:emulator
import { deleteApp, initializeApp, type FirebaseApp } from 'firebase/app';
import {
  connectFirestoreEmulator,
  doc,
  getDocs,
  collection,
  getFirestore,
  serverTimestamp,
  terminate,
  writeBatch,
  type Firestore,
} from 'firebase/firestore';

import { clearFirestore, closeAll, FIRESTORE_HOST, FIRESTORE_PORT, PROJECT } from './emulator';

const apps: FirebaseApp[] = [];
let n = 0;

function dbSignedInAt(uid: string, authTimeMs: number): Firestore {
  const app = initializeApp({ projectId: PROJECT, apiKey: 'demo-key' }, `sec2-${++n}`);
  apps.push(app);
  const db = getFirestore(app);
  const authTime = Math.floor(authTimeMs / 1000);
  connectFirestoreEmulator(db, FIRESTORE_HOST, FIRESTORE_PORT, {
    mockUserToken: { sub: uid, user_id: uid, iat: authTime, auth_time: authTime },
  });
  return db;
}

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

/** One batch of `count` valid highlight writes for `uid`, as firestoreRemote.ts writeAll builds it. */
async function commitHighlights(db: Firestore, uid: string, count: number): Promise<void> {
  const batch = writeBatch(db);
  for (let v = 1; v <= count; v++) {
    const ref = `43:3:${v}`;
    batch.set(doc(db, 'users', uid, 'items', `highlight:${ref}`), {
      kind: 'highlight',
      ref,
      deleted: false,
      value: { colour: 'blue' },
      updatedAt: Date.now() - 1000,
      deviceId: 'devA',
      serverTime: serverTimestamp(),
    });
  }
  await batch.commit();
}

const deletedAt = Date.now() - 10 * 60_000;
let aliceOld: Firestore; // signed in before any delete
let aliceNew: Firestore; // signed in after alice's marker

beforeAll(() => {
  aliceOld = dbSignedInAt('alice', deletedAt - 50 * 60_000);
  aliceNew = dbSignedInAt('alice', deletedAt + 5 * 60_000);
});
beforeEach(clearFirestore);
afterAll(async () => {
  for (const app of apps.splice(0)) {
    await terminate(getFirestore(app)).catch(() => undefined);
    await deleteApp(app).catch(() => undefined);
  }
  await closeAll();
});

describe('the marker lookup does not break batched sync writes', () => {
  // 25 writes x 1 exists() would exceed a 20-call budget if repeated lookups of the same document were
  // counted separately; 450 is the remote's real batch size.
  test.each([25, 450])('sound: a batch of %i item writes with no marker commits', async (count) => {
    await commitHighlights(aliceOld, 'alice', count);
    expect((await getDocs(collection(aliceOld, 'users', 'alice', 'items'))).size).toBe(count);
  });

  test.each([25, 450])('sound: a batch of %i item writes after a marker (exists + get each) commits for a new sign-in', async (count) => {
    await writeMarker('alice', deletedAt);
    await commitHighlights(aliceNew, 'alice', count);
    expect((await getDocs(collection(aliceNew, 'users', 'alice', 'items'))).size).toBe(count);
  });

  test('sound: the same batch from a sign-in before the marker is refused as a whole', async () => {
    await writeMarker('alice', deletedAt);
    await expect(commitHighlights(aliceOld, 'alice', 25)).rejects.toMatchObject({ code: 'permission-denied' });
    expect((await getDocs(collection(aliceNew, 'users', 'alice', 'items'))).size).toBe(0);
  });
});
