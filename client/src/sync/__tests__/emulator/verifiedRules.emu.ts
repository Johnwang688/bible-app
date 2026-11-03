// Verified email in /firestore.rules (email verification, 11-03): every owner read and write under
// users/{uid} needs an ID token with email_verified == true. A token with the claim false, or without it,
// is refused; the claim only changes in a newly minted token, so a real account is admitted after it
// confirms its email, reloads and forces a token refresh. Documents are the adapter's own wire documents
// (`wireDocs`), so every refusal here is the verified check, not the schema. Run: npm run test:emulator
import { deleteApp, initializeApp } from 'firebase/app';
import { connectAuthEmulator, createUserWithEmailAndPassword, getAuth, signOut } from 'firebase/auth';
import {
  collection,
  connectFirestoreEmulator,
  doc,
  getDoc,
  getDocs,
  getFirestore,
  setDoc,
  terminate,
  type DocumentReference,
  type Firestore,
} from 'firebase/firestore';

import { wireDocs } from '../../firestoreRemote';
import { AUTH_URL, clearFirestore, closeAll, dbAs, denied, FIRESTORE_HOST, FIRESTORE_PORT, PROJECT, verifyEmail } from './emulator';

const DEV = 'Ab3_-xYz0123456789Qw'; // the engine's ids: 20 url-safe characters
const NOW = () => Date.now();

/** One open collection: its name, the document id used here, and a valid wire document (`n` varies it). */
interface Collection {
  name: 'items' | 'devices' | 'settings' | 'memory';
  id: string;
  doc: (n: number) => Record<string, unknown>;
}

const COLLECTIONS: Collection[] = [
  {
    name: 'items',
    id: 'highlight:43:3:16',
    doc: (n) =>
      wireDocs.item({ id: 'highlight:43:3:16', kind: 'highlight', ref: '43:3:16', deleted: false, value: { colour: n ? 'green' : 'blue' }, updatedAt: NOW() - 1000 + n, deviceId: DEV }),
  },
  {
    name: 'devices',
    id: DEV,
    doc: (n) =>
      wireDocs.device({
        deviceId: DEV,
        activeMs: { '2026-11-02': 300000 + n },
        chaptersRead: { '43:3': '2026-11-02T10:00:00.000Z' },
        goalMetDays: ['2026-11-01'],
        goal: { minutes: 15, updatedAt: NOW() - 1000 },
        updatedAt: NOW() - 1000 + n,
      }),
  },
  {
    name: 'settings',
    id: 'language',
    doc: (n) => wireDocs.setting({ key: 'language', json: n ? '"en"' : '"zh-Hans"', updatedAt: NOW() - 1000 + n, deviceId: DEV }),
  },
  {
    name: 'memory',
    id: DEV,
    doc: (n) =>
      wireDocs.memory({
        deviceId: DEV,
        progress: {
          'john-3-16': {
            stage: 'fill_blank',
            successes: 3 + n,
            failures: 1,
            masteryScore: 40,
            nextDueAt: '2026-11-05T09:00:00.000Z',
            lastReviewedAt: '2026-11-02T09:00:00.000Z',
            lapsedAt: null,
          },
        },
        history: { startedOn: '2026-10-30', completedDates: ['2026-10-30', '2026-11-02'] },
        updatedAt: NOW() - 1000 + n,
      }),
  },
];

const ref = (db: Firestore, c: Collection, uid = 'alice'): DocumentReference => doc(db, 'users', uid, c.name, c.id);

let verified: Firestore; // alice, email_verified: true
let unverified: Firestore; // alice, email_verified: false
let noClaim: Firestore; // alice, no email_verified claim at all
let bobVerified: Firestore; // bob, email_verified: true
beforeAll(() => {
  verified = dbAs('alice');
  unverified = dbAs('alice', { email_verified: false });
  noClaim = dbAs('alice', { email_verified: undefined });
  bobVerified = dbAs('bob');
});
beforeEach(clearFirestore);
afterAll(closeAll);

/** get, list, create and update of `c` under users/alice are all refused for `db`. */
async function refusedAll(db: Firestore, c: Collection): Promise<void> {
  const seed = c.doc(0);
  await denied(setDoc(ref(db, c), seed)); // create: nothing there yet
  await setDoc(ref(verified, c), seed); // the verified owner seeds the document
  await denied(getDoc(ref(db, c)));
  await denied(getDocs(collection(db, 'users', 'alice', c.name)));
  await denied(setDoc(ref(db, c), c.doc(1))); // update
  expect((await getDoc(ref(verified, c))).data()).toMatchObject({ updatedAt: seed.updatedAt }); // unchanged
}

describe.each(COLLECTIONS)('$name', (c) => {
  test('a token with email_verified: false is refused for get, list, create and update', async () => {
    await refusedAll(unverified, c);
  });

  test('a token without an email_verified claim is refused for get, list, create and update', async () => {
    await refusedAll(noClaim, c);
  });

  test('the verified owner may get, list, create and update', async () => {
    await setDoc(ref(verified, c), c.doc(0)); // create
    expect((await getDoc(ref(verified, c))).exists()).toBe(true);
    const next = c.doc(1);
    await setDoc(ref(verified, c), next); // update
    const listed = await getDocs(collection(verified, 'users', 'alice', c.name));
    expect(listed.docs.map((d) => d.id)).toEqual([c.id]);
    expect(listed.docs[0]!.data()).toMatchObject({ updatedAt: next.updatedAt });
  });
});

test("a verified token for another uid is still refused on alice's documents", async () => {
  const items = COLLECTIONS[0]!;
  await denied(setDoc(ref(bobVerified, items), items.doc(0)));
  await setDoc(ref(verified, items), items.doc(0));
  await denied(getDoc(ref(bobVerified, items)));
  await denied(getDocs(collection(bobVerified, 'users', 'alice', 'items')));
  await denied(setDoc(ref(bobVerified, items), items.doc(1)));
});

describe('a real email/password account on the Auth emulator', () => {
  const app = initializeApp({ projectId: PROJECT, apiKey: 'demo-key', authDomain: 'demo-r6b.firebaseapp.com' }, 'verified-real');
  const auth = getAuth(app);
  connectAuthEmulator(auth, AUTH_URL, { disableWarnings: true });
  const db = getFirestore(app);
  connectFirestoreEmulator(db, FIRESTORE_HOST, FIRESTORE_PORT);
  /** A client that keeps sending one fixed ID token (the unrefreshed one) and never refreshes it. */
  let stale: Firestore | null = null;
  const staleApp = initializeApp({ projectId: PROJECT, apiKey: 'demo-key' }, 'verified-stale');

  beforeAll(async () => {
    const res = await fetch(`${AUTH_URL}/emulator/v1/projects/${PROJECT}/accounts`, { method: 'DELETE' });
    if (!res.ok) throw new Error(`clear failed: ${res.status}`);
  });
  afterAll(async () => {
    await signOut(auth).catch(() => undefined);
    await terminate(db).catch(() => undefined);
    if (stale) await terminate(stale).catch(() => undefined);
    await deleteApp(app).catch(() => undefined);
    await deleteApp(staleApp).catch(() => undefined);
  });

  const claim = (token: string) =>
    (JSON.parse(Buffer.from(token.split('.')[1]!, 'base64url').toString()) as { email_verified?: boolean }).email_verified;

  test('is refused until it confirms its email, reloads and refreshes its token; the old token stays refused', async () => {
    const { user } = await createUserWithEmailAndPassword(auth, 'verify-me@example.com', 'correct horse');
    const devices = COLLECTIONS[1]!;
    const mine = doc(db, 'users', user.uid, 'devices', devices.id);

    // The first ID token: email_verified is false.
    const first = await user.getIdToken();
    expect(claim(first)).toBe(false);
    await denied(setDoc(mine, devices.doc(0)));
    await denied(getDoc(mine));

    // Confirm the email as Firebase does (link -> oobCode -> applyActionCode), then reload() and getIdToken(true).
    await verifyEmail(auth, user);
    expect(user.emailVerified).toBe(true);
    expect(claim(await user.getIdToken())).toBe(true);
    await setDoc(mine, devices.doc(0));
    expect((await getDoc(mine)).exists()).toBe(true);

    // A client still holding the first token (never refreshed) is refused, write and read.
    stale = getFirestore(staleApp);
    connectFirestoreEmulator(stale, FIRESTORE_HOST, FIRESTORE_PORT, { mockUserToken: first });
    const staleMine = doc(stale, 'users', user.uid, 'devices', devices.id);
    await denied(setDoc(staleMine, devices.doc(1)));
    await denied(getDoc(staleMine));
  });
});
