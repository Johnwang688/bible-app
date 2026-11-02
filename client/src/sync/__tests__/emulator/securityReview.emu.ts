// Security review probes for /firestore.rules (R6b-security). Tests named "FINDING" are expected to
// FAIL on the reviewed code: each one asserts the secure behaviour and shows the hole. Tests named
// "sound" pass and document checks that held. Run: npm run test:emulator
import { deleteApp, initializeApp } from 'firebase/app';
import { connectAuthEmulator, createUserWithEmailAndPassword, getAuth, signOut } from 'firebase/auth';
import {
  collection,
  collectionGroup,
  connectFirestoreEmulator,
  doc,
  getDocs,
  getFirestore,
  query,
  serverTimestamp,
  setDoc,
  terminate,
  where,
  type Firestore,
} from 'firebase/firestore';

import { clearFirestore, closeAll, dbAs, denied, FIRESTORE_HOST, FIRESTORE_PORT, PROJECT } from './emulator';

const AUTH_URL = 'http://127.0.0.1:9180';

let alice: Firestore;
let anon: Firestore;

beforeAll(() => {
  alice = dbAs('alice');
  anon = dbAs(null);
});
beforeEach(clearFirestore);
afterAll(closeAll);

const device = (over: Record<string, unknown> = {}) => ({
  deviceId: 'devA',
  activeMs: { '2026-11-02': 300000 },
  chaptersRead: { '43:3': '2026-11-02T10:00:00.000Z' },
  goalMetDays: ['2026-11-01'],
  goal: { minutes: 15, updatedAt: Date.now() - 1000 },
  updatedAt: Date.now() - 1000,
  serverTime: serverTimestamp(),
  ...over,
});

const highlight = (over: Record<string, unknown> = {}) => ({
  kind: 'highlight',
  ref: '43:3:16',
  deleted: false,
  value: { colour: 'blue' },
  updatedAt: Date.now() - 1000,
  deviceId: 'devA',
  serverTime: serverTimestamp(),
  ...over,
});

describe('FINDING: delete-my-data does not stop a still-valid ID token', () => {
  // The backend revokes refresh tokens, wipes users/{uid} and deletes the auth user. Firestore rules
  // never consult revocation or user existence, so another signed-in device keeps writing with its
  // cached ID token (valid up to 1 h) and recreates users/{uid}/... as orphaned data.
  const app = initializeApp({ projectId: PROJECT, apiKey: 'demo-key', authDomain: 'demo-r6b.firebaseapp.com' }, 'sec-device-b');
  const auth = getAuth(app);
  connectAuthEmulator(auth, AUTH_URL, { disableWarnings: true });
  const db = getFirestore(app);
  connectFirestoreEmulator(db, FIRESTORE_HOST, FIRESTORE_PORT);

  afterAll(async () => {
    await signOut(auth).catch(() => undefined);
    await terminate(db).catch(() => undefined);
    await deleteApp(app).catch(() => undefined);
  });

  test('after the account is deleted, the other device cannot recreate its data', async () => {
    await fetch(`${AUTH_URL}/emulator/v1/projects/${PROJECT}/accounts`, { method: 'DELETE' });
    const { user } = await createUserWithEmailAndPassword(auth, 'victim@example.com', 'correct horse');
    const uid = user.uid;
    await setDoc(doc(db, 'users', uid, 'devices', 'devB'), device({ deviceId: 'devB' }));

    // "Delete my data" as the backend does it: the auth user is deleted and users/{uid} is wiped.
    const del = await fetch(`${AUTH_URL}/identitytoolkit.googleapis.com/v1/projects/${PROJECT}/accounts:delete`, {
      method: 'POST',
      headers: { Authorization: 'Bearer owner', 'Content-Type': 'application/json' },
      body: JSON.stringify({ localId: uid }),
    });
    expect(del.ok).toBe(true);
    await clearFirestore();

    // Device B's sync engine runs again with the ID token it still holds.
    await denied(setDoc(doc(db, 'users', uid, 'devices', 'devB'), device({ deviceId: 'devB' })));
  });
});

// Not fixed in R-6b: rules cannot iterate map values or count documents. Mitigations (App Check, a budget
// alert, a restructured device document) are John's call; see the PR. Kept as a record and to re-enable.
describe.skip('ACCEPTED RISK (pending John): device documents are arbitrary storage', () => {
  test('activeMs / chaptersRead / goalMetDays values are not type-checked: a ~900 KB blob is accepted', async () => {
    const blob = 'x'.repeat(900_000);
    await denied(setDoc(doc(alice, 'users', 'alice', 'devices', 'devA'), device({ activeMs: { '2026-11-02': blob } })));
  });

  test('nested maps of anything are accepted inside chaptersRead and goalMetDays', async () => {
    await denied(
      setDoc(
        doc(alice, 'users', 'alice', 'devices', 'devA'),
        device({ chaptersRead: { '43:3': { any: { nested: ['data', 1, true] } } }, goalMetDays: [{ not: 'a day' }] }),
      ),
    );
  });

  test('the number of device documents per user is unbounded (proposed cap: 20)', async () => {
    for (let i = 0; i < 20; i++) {
      await setDoc(doc(alice, 'users', 'alice', 'devices', `dev${i}`), device({ deviceId: `dev${i}` }));
    }
    await denied(setDoc(doc(alice, 'users', 'alice', 'devices', 'dev20'), device({ deviceId: 'dev20' })));
  });
});

describe('FINDING: the goal clock has no upper bound', () => {
  test('goal.updatedAt far in the future is accepted (wins every later goal change forever)', async () => {
    const farFuture = Date.now() + 100 * 365 * 86_400_000;
    await denied(setDoc(doc(alice, 'users', 'alice', 'devices', 'devA'), device({ goal: { minutes: 5, updatedAt: farFuture } })));
  });
});

describe('sound', () => {
  test('collection-group queries over every user are denied, even for a signed-in user', async () => {
    await setDoc(doc(alice, 'users', 'alice', 'items', 'highlight:43:3:16'), highlight());
    await denied(getDocs(collectionGroup(alice, 'items')));
    await denied(getDocs(query(collectionGroup(alice, 'devices'), where('deviceId', '==', 'devA'))));
    await denied(getDocs(collectionGroup(anon, 'settings')));
  });

  test('odd item ids are refused (whitespace, leading zeros, unicode digits, path tricks)', async () => {
    for (const [id, ref] of [
      ['highlight:43:3:16 ', '43:3:16 '],
      ['highlight:043:3:16', '043:3:16'],
      ['highlight:4３:3:16', '4３:3:16'],
      ['highlight:43:3:16\n', '43:3:16\n'],
    ]) {
      await denied(setDoc(doc(alice, 'users', 'alice', 'items', id!), highlight({ ref })));
    }
  });

  test('a client cannot reach below the three collections', async () => {
    await denied(setDoc(doc(alice, 'users', 'alice', 'items', 'highlight:43:3:16', 'sub', 'x'), { a: 1 }));
    await denied(setDoc(doc(alice, 'users', 'alice', 'devices', 'devA', 'sub', 'x'), { a: 1 }));
  });

  test('a signed-out client cannot list anything', async () => {
    await denied(getDocs(collection(anon, 'users', 'alice', 'items')));
    await denied(getDocs(collection(anon, 'users', 'alice', 'settings')));
    await denied(getDocs(collection(anon, 'users')));
  });

  test('value of a tombstone of the wrong type and a value map for the wrong kind are refused', async () => {
    const ref = doc(alice, 'users', 'alice', 'items', 'note:43:3:16');
    await denied(setDoc(ref, highlight({ kind: 'note', value: { colour: 'blue' } })));
    await denied(setDoc(ref, highlight({ kind: 'note', deleted: true, value: {} })));
    await denied(setDoc(ref, highlight({ kind: 'note', value: { text: ['array'] } })));
  });
});
