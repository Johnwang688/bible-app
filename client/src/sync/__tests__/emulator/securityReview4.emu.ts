// Security review round 4 (R-6b follow-up: schema-tight rules and the adapter's push path). Reviewer-owned
// probes against the Firestore emulator. A test named "S4-n ..." encodes a finding and fails on the code as
// reviewed; a test named "sound: ..." records something checked and found correct (it passes).
// Run: export PATH="/c/dev/tools/jdk-21.0.13+9-jre/bin:$PATH"; npm run test:emulator
import { deleteApp, initializeApp, type FirebaseApp } from 'firebase/app';
import { connectFirestoreEmulator, doc, getFirestore, setDoc, terminate, type Firestore } from 'firebase/firestore';

import { createFirestoreRemote, wireDocs } from '../../firestoreRemote';
import type { DeviceProgress, RemoteItem, RemoteSetting } from '../../types';
import { clearFirestore, closeAll, dbAs, denied, FIRESTORE_HOST, FIRESTORE_PORT, mockToken, PROJECT } from './emulator';

const DEV = 'Ab3_-xYz0123456789Qw';
const DAY_MS = 86_400_000;

const ownApps: FirebaseApp[] = [];
let alice: Firestore;
let warn: jest.SpyInstance;
beforeAll(() => {
  alice = dbAs('alice');
});
beforeEach(async () => {
  await clearFirestore();
  warn = jest.spyOn(console, 'warn').mockImplementation(() => undefined);
});
afterEach(() => warn.mockRestore());
afterAll(async () => {
  await closeAll();
  for (const app of ownApps.splice(0)) {
    await terminate(getFirestore(app)).catch(() => undefined);
    await deleteApp(app).catch(() => undefined);
  }
});

const remote = () => createFirestoreRemote(alice, 'alice');

/** A client for `uid` whose mock ID token was issued (and signed in) now; dbAs's tokens have auth_time 0. */
function signedInNow(uid: string): Firestore {
  const app = initializeApp({ projectId: PROJECT, apiKey: 'demo-key' }, `s4-${ownApps.length + 1}`);
  ownApps.push(app);
  const db = getFirestore(app);
  const t = Math.floor(Date.now() / 1000);
  connectFirestoreEmulator(db, FIRESTORE_HOST, FIRESTORE_PORT, { mockUserToken: mockToken(uid, { iat: t, auth_time: t }) });
  return db;
}

const note = (ref: string, text: string, updatedAt = Date.now() - 1000): RemoteItem => ({
  id: `note:${ref}`,
  kind: 'note',
  ref,
  deleted: false,
  value: { text },
  updatedAt,
  deviceId: DEV,
});

const progress = (over: Partial<DeviceProgress> = {}): DeviceProgress => ({
  deviceId: DEV,
  activeMs: { '2026-11-02': 300_000 },
  chaptersRead: { '43:3': '2026-11-02T10:00:00.000Z' },
  goalMetDays: ['2026-11-02'],
  goal: { minutes: 15, updatedAt: Date.now() - 1000 },
  updatedAt: Date.now() - 1000,
  ...over,
});

const setting = (over: Partial<RemoteSetting> = {}): RemoteSetting => ({
  key: 'appearance.custom',
  json: '{}',
  updatedAt: Date.now() - 1000,
  deviceId: DEV,
  ...over,
});

/** Writes deletedUsers/{uid} as the backend does (the emulator's admin bypass stands in for the Admin SDK). */
async function writeMarker(uid: string, deletedAtMs: number): Promise<void> {
  const url = `http://${FIRESTORE_HOST}:${FIRESTORE_PORT}/v1/projects/${PROJECT}/databases/(default)/documents/deletedUsers/${uid}`;
  const res = await fetch(url, {
    method: 'PATCH',
    headers: { Authorization: 'Bearer owner', 'Content-Type': 'application/json' },
    body: JSON.stringify({ fields: { deletedAt: { timestampValue: new Date(deletedAtMs).toISOString() } } }),
  });
  if (!res.ok) throw new Error(`marker write failed: ${res.status}`);
}

/** Every item id in alice's tree, as the server holds them. */
async function remoteIds(): Promise<string[]> {
  return (await remote().pullItems(null)).items.map((i) => i.id).sort();
}

// ---- S4-1: one item stamped by a clock more than a day ahead blocks every item written with it ------------------

describe('S4-1 (medium): a clock more than a day ahead makes the push fail for good', () => {
  // The rules' isClientTime refuses updatedAt more than one day after request.time; the push path deliberately does
  // not check clocks ("a refusal there should surface as an error"). But a refusal fails the whole batch of up to
  // 450 writes, every retry fails the same way, and the item keeps its stamp after the clock is fixed: one note
  // edited while the phone's clock was wrong (a dead RTC, a manual date) stops every other study item in its batch
  // from syncing until real time passes the stamp, which can be months or years.
  test('S4-1 the other items in the batch are still written', async () => {
    const ahead = note('1:1:1', 'edited while the clock said two days from now', Date.now() + 2 * DAY_MS);
    const fine = [note('43:3:16', 'For God so loved the world'), note('19:23:1', 'The Lord is my shepherd')];
    await remote()
      .pushItems([ahead, ...fine])
      .catch(() => undefined);
    // Expected: the two good notes reach the server (the ahead one may be dropped, clamped or retried alone).
    // Actual: permission-denied for the whole batch; nothing is written.
    expect(await remoteIds()).toEqual(expect.arrayContaining(['note:19:23:1', 'note:43:3:16']));
  });

  test('S4-1 a device whose goal was stamped by a clock more than a day ahead still pushes its progress', async () => {
    // The goal stamp is persisted (it is the goal's last-writer-wins clock), so it outlives the bad clock.
    const p = progress({ goal: { minutes: 20, updatedAt: Date.now() + 2 * DAY_MS } });
    await remote()
      .pushDevice(p)
      .catch(() => undefined);
    // Expected: the device document is written (reading time and chapters keep syncing). Actual: refused.
    const back = (await remote().pullDevices()).find((d) => d.deviceId === DEV);
    expect(back?.activeMs).toEqual(p.activeMs);
  });
});

// ---- Sound: string sizes and odd text --------------------------------------------------------------------------

describe('sound: string caps count what the engine counts (UTF-16 units, in the emulator)', () => {
  test('sound: a 5000-character Chinese note (the engine maximum) is accepted', async () => {
    await setDoc(doc(alice, 'users', 'alice', 'items', 'note:1:1:1'), wireDocs.item(note('1:1:1', '神'.repeat(5000))));
  });

  test('sound: a note of 5000 emoji (10000 UTF-16 units) is refused, as the engine would never store it', async () => {
    const text = '😀'.repeat(5000);
    await denied(setDoc(doc(alice, 'users', 'alice', 'items', 'note:1:1:2'), wireDocs.item(note('1:1:2', text))));
  });

  test('sound: an appearance.custom JSON over 4000 UTF-16 units (but under 4000 code points) is refused', async () => {
    const json = JSON.stringify({ name: '😀'.repeat(2000) });
    expect(json.length).toBeGreaterThan(4000);
    expect([...json].length).toBeLessThanOrEqual(4000);
    await denied(setDoc(doc(alice, 'users', 'alice', 'settings', 'appearance.custom'), wireDocs.setting(setting({ json }))));
  });

  test('sound: a note ending in half an emoji pair (a maxLength cut) does not block its batch', async () => {
    const cut = ('a'.repeat(4999) + '😀').slice(0, 5000); // ends with a lone high surrogate
    await remote().pushItems([note('1:1:1', cut), note('43:3:16', 'For God so loved the world')]);
    expect(await remoteIds()).toEqual(['note:1:1:1', 'note:43:3:16']);
  });
});

// ---- Sound: ownership, the marker, numeric edges, entry smuggling ------------------------------------------------

describe('sound: the rules', () => {
  test('sound: a full 450-write batch is accepted while an old deletion marker exists (document-access calls)', async () => {
    // Emulator only: production's per-request limit on exists()/get() calls cannot be checked here (see the notes).
    await writeMarker('alice', Date.now() - 3_600_000);
    const items: RemoteItem[] = [];
    for (let i = 1; i <= 450; i++) items.push(note(`1:${Math.ceil(i / 100)}:${((i - 1) % 100) + 1}`, `n${i}`));
    await createFirestoreRemote(signedInNow('alice'), 'alice').pushItems(items);
    expect((await remote().pullItems(null)).items).toHaveLength(450);
  });

  test('sound: a sign-in from before the marker cannot write, one after it can', async () => {
    await writeMarker('alice', Date.now() - 5_000);
    await denied(setDoc(doc(alice, 'users', 'alice', 'items', 'note:1:1:1'), wireDocs.item(note('1:1:1', 'x'))));
    await setDoc(doc(signedInNow('alice'), 'users', 'alice', 'items', 'note:1:1:1'), wireDocs.item(note('1:1:1', 'x')));
  });

  test('sound: other users, other paths and the marker itself stay closed', async () => {
    const bob = dbAs('bob');
    await denied(setDoc(doc(bob, 'users', 'alice', 'items', 'note:1:1:1'), wireDocs.item(note('1:1:1', 'x'))));
    await denied(setDoc(doc(alice, 'users', 'alice'), { a: 1 }));
    await denied(setDoc(doc(alice, 'users', 'alice', 'other', 'x'), { a: 1 }));
    await denied(setDoc(doc(alice, 'users', 'alice', 'items', 'note:1:1:1', 'sub', 'x'), { a: 1 }));
    await denied(setDoc(doc(alice, 'deletedUsers', 'alice'), { deletedAt: new Date() }));
  });

  test('sound: numeric edges in clocks and goals are refused', async () => {
    const at = (updatedAt: number) => wireDocs.item(note('1:1:1', 'x', updatedAt));
    for (const t of [0, -1, 1.5, Date.now() + 0.5, Number.MAX_SAFE_INTEGER, Number.NaN, Number.POSITIVE_INFINITY]) {
      await denied(setDoc(doc(alice, 'users', 'alice', 'items', 'note:1:1:1'), at(t)));
    }
    for (const minutes of [0, 7, 125, 15.5, -5, Number.NaN]) {
      await denied(
        setDoc(doc(alice, 'users', 'alice', 'devices', DEV), wireDocs.device(progress({ goal: { minutes, updatedAt: Date.now() - 1 } }))),
      );
    }
  });

  test('sound: activeMs entries at and past the day cap', async () => {
    const put = (wire: string) => setDoc(doc(alice, 'users', 'alice', 'devices', DEV), { ...wireDocs.device(progress()), activeMs: wire });
    await put('2026-11-02=86400000;2026-11-03=0');
    for (const bad of ['2026-11-02=86400001', '2026-11-02=086400', '2026-11-02=-1', '2026-11-02=1.5', '2026-11-02=1e3', '2026-11-02=1;', ';', '2026-13-01=1', '2026-11-02=1\n']) {
      await denied(put(bad));
    }
  });

  test('sound: chaptersRead keys and values cannot hide extra entries behind ";"', async () => {
    const put = (chaptersRead: Record<string, unknown>) =>
      setDoc(doc(alice, 'users', 'alice', 'devices', DEV), { ...wireDocs.device(progress()), chaptersRead });
    const iso = '2026-11-02T10:00:00.000Z';
    await denied(put({ '1:1;1:2': iso, '1:3': iso }));
    await denied(put({ '1:1': `${iso};${iso}`, '1:2': '' }));
    await denied(put({ '1:1': 5 }));
    await denied(put({ '1:1': { a: iso } }));
  });

  test('sound: goalMetDays cannot hide entries or repeat a day', async () => {
    const put = (goalMetDays: unknown[]) =>
      setDoc(doc(alice, 'users', 'alice', 'devices', DEV), { ...wireDocs.device(progress()), goalMetDays });
    await denied(put(['2026-11-01;2026-11-02', '']));
    await denied(put(['2026-11-01', '2026-11-01']));
    await denied(put([20261101]));
  });
});
