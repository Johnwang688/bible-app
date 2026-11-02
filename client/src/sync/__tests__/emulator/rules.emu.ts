// Acceptance tests for /firestore.rules (R-6b, orchestrator-owned; the implementer may not edit them).
// Shapes are the ones in src/sync/types.ts. Run: npm run test:emulator
import {
  collection,
  deleteDoc,
  doc,
  getDoc,
  getDocs,
  serverTimestamp,
  setDoc,
  Timestamp,
  type Firestore,
} from 'firebase/firestore';

import { clearFirestore, closeAll, dbAs, denied } from './emulator';

// Device ids in the engine's shape (20 url-safe characters); activeMs on the wire is "day=ms;..." (R6b-fu-rules).
const DEV_A = 'devA0000000000000000';
const DEV_B = 'devB0000000000000000';

let alice: Firestore;
let bob: Firestore;
let anon: Firestore;

beforeAll(() => {
  alice = dbAs('alice');
  bob = dbAs('bob');
  anon = dbAs(null);
});
beforeEach(clearFirestore);
afterAll(closeAll);

const NOW = () => Date.now();

const highlight = (over: Record<string, unknown> = {}) => ({
  kind: 'highlight',
  ref: '43:3:16',
  deleted: false,
  value: { colour: 'blue' },
  updatedAt: NOW() - 1000,
  deviceId: DEV_A,
  serverTime: serverTimestamp(),
  ...over,
});
const itemRef = (db: Firestore, id: string, uid = 'alice') => doc(db, 'users', uid, 'items', id);

const device = (over: Record<string, unknown> = {}) => ({
  deviceId: DEV_A,
  activeMs: '2026-11-02=300000',
  chaptersRead: { '43:3': '2026-11-02T10:00:00.000Z' },
  goalMetDays: ['2026-11-01'],
  goal: { minutes: 15, updatedAt: NOW() - 1000 },
  updatedAt: NOW() - 1000,
  serverTime: serverTimestamp(),
  ...over,
});
const deviceRef = (db: Firestore, id = DEV_A, uid = 'alice') => doc(db, 'users', uid, 'devices', id);

const setting = (over: Record<string, unknown> = {}) => ({
  key: 'language',
  json: '"zh-Hans"',
  updatedAt: NOW() - 1000,
  deviceId: DEV_A,
  serverTime: serverTimestamp(),
  ...over,
});
const settingRef = (db: Firestore, key = 'language', uid = 'alice') => doc(db, 'users', uid, 'settings', key);

describe('items', () => {
  test('the owner can write and read valid items of each kind, and tombstones', async () => {
    await setDoc(itemRef(alice, 'highlight:43:3:16'), highlight());
    await setDoc(itemRef(alice, 'note:1:1:1'), highlight({ kind: 'note', ref: '1:1:1', value: { text: 'In the beginning' } }));
    await setDoc(itemRef(alice, 'note:66:22:21'), highlight({ kind: 'note', ref: '66:22:21', value: { text: 'x'.repeat(5000) } }));
    await setDoc(
      itemRef(alice, 'bookmark:19:119:105'),
      highlight({ kind: 'bookmark', ref: '19:119:105', value: { createdAt: '2026-11-02T10:00:00.000Z' } }),
    );
    await setDoc(itemRef(alice, 'highlight:2:2:2'), highlight({ ref: '2:2:2', deleted: true, value: null }));
    await setDoc(itemRef(alice, 'highlight:43:3:16'), highlight({ value: { colour: 'green' } })); // overwrite
    const snap = await getDoc(itemRef(alice, 'highlight:43:3:16'));
    expect(snap.data()?.value).toEqual({ colour: 'green' });
    expect((await getDocs(collection(alice, 'users', 'alice', 'items'))).size).toBe(5);
  });

  test('every highlight colour is accepted', async () => {
    for (const colour of ['yellow', 'orange', 'pink', 'purple', 'blue', 'green']) {
      await setDoc(itemRef(alice, 'highlight:43:3:16'), highlight({ value: { colour } }));
    }
  });

  test('other users and signed-out clients can neither read nor write', async () => {
    await setDoc(itemRef(alice, 'highlight:43:3:16'), highlight());
    await denied(getDoc(itemRef(bob, 'highlight:43:3:16')));
    await denied(getDocs(collection(bob, 'users', 'alice', 'items')));
    await denied(setDoc(itemRef(bob, 'highlight:43:3:16'), highlight()));
    await denied(getDoc(itemRef(anon, 'highlight:43:3:16')));
    await denied(setDoc(itemRef(anon, 'highlight:1:1:1', 'alice'), highlight({ ref: '1:1:1' })));
  });

  test('clients cannot delete items (deletions are tombstones)', async () => {
    await setDoc(itemRef(alice, 'highlight:43:3:16'), highlight());
    await denied(deleteDoc(itemRef(alice, 'highlight:43:3:16')));
  });

  test.each<[string, string, Record<string, unknown>]>([
    ['id kind differs from kind', 'note:43:3:16', {}],
    ['id ref differs from ref', 'highlight:43:3:17', {}],
    ['bad id', 'highlight:67:1:1', { ref: '67:1:1' }],
    ['verse 0', 'highlight:43:3:0', { ref: '43:3:0' }],
    ['unknown kind', 'star:43:3:16', { kind: 'star' }],
    ['unknown colour', 'highlight:43:3:16', { value: { colour: 'red' } }],
    ['highlight with text', 'highlight:43:3:16', { value: { colour: 'blue', text: 'x' } }],
    ['empty note', 'note:43:3:16', { kind: 'note', value: { text: '' } }],
    ['note too long', 'note:43:3:16', { kind: 'note', value: { text: 'x'.repeat(5001) } }],
    ['note text not a string', 'note:43:3:16', { kind: 'note', value: { text: 5 } }],
    ['bookmark time too long', 'bookmark:43:3:16', { kind: 'bookmark', value: { createdAt: 'x'.repeat(41) } }],
    ['deleted with a value', 'highlight:43:3:16', { deleted: true }],
    ['live with no value', 'highlight:43:3:16', { value: null }],
    ['deleted not a bool', 'highlight:43:3:16', { deleted: 'no' }],
    ['extra field', 'highlight:43:3:16', { extra: 1 }],
    ['updatedAt not an int', 'highlight:43:3:16', { updatedAt: 1.5 }],
    ['updatedAt zero', 'highlight:43:3:16', { updatedAt: 0 }],
    ['updatedAt two days ahead', 'highlight:43:3:16', { updatedAt: Date.now() + 2 * 86_400_000 }],
    ['empty deviceId', 'highlight:43:3:16', { deviceId: '' }],
    ['deviceId too long', 'highlight:43:3:16', { deviceId: 'd'.repeat(65) }],
    ['deviceId with a slash', 'highlight:43:3:16', { deviceId: 'a/b' }],
    ['serverTime from the client', 'highlight:43:3:16', { serverTime: Timestamp.fromMillis(1) }],
  ])('rejects an item with %s', async (_why, id, over) => {
    await denied(setDoc(itemRef(alice, id), highlight(over)));
  });

  test('rejects an item missing a field', async () => {
    const { deviceId: _omit, ...rest } = highlight();
    await denied(setDoc(itemRef(alice, 'highlight:43:3:16'), rest));
  });
});

describe('devices', () => {
  test('the owner can write and read a valid device document; goal may be null', async () => {
    await setDoc(deviceRef(alice), device());
    await setDoc(deviceRef(alice, DEV_B), device({ deviceId: DEV_B, goal: null, activeMs: '', chaptersRead: {}, goalMetDays: [] }));
    expect((await getDocs(collection(alice, 'users', 'alice', 'devices'))).size).toBe(2);
  });

  test('others cannot read or write it; nobody can delete it from a client', async () => {
    await setDoc(deviceRef(alice), device());
    await denied(getDoc(deviceRef(bob)));
    await denied(setDoc(deviceRef(bob), device()));
    await denied(getDocs(collection(anon, 'users', 'alice', 'devices')));
    await denied(deleteDoc(deviceRef(alice)));
  });

  test.each<[string, string, Record<string, unknown>]>([
    ['deviceId differs from the id', DEV_A, { deviceId: DEV_B }],
    ['bad id', 'a.b', { deviceId: 'a.b' }],
    ['activeMs not a map', DEV_A, { activeMs: [1] }],
    ['chaptersRead not a map', DEV_A, { chaptersRead: 'x' }],
    ['goalMetDays not a list', DEV_A, { goalMetDays: { a: 1 } }],
    ['goal below 5', DEV_A, { goal: { minutes: 3, updatedAt: 1 } }],
    ['goal above 120', DEV_A, { goal: { minutes: 125, updatedAt: 1 } }],
    ['goal with an extra field', DEV_A, { goal: { minutes: 10, updatedAt: 1, x: 1 } }],
    ['evidence (device-local)', DEV_A, { evidence: { day: '', chapters: {} } }],
    ['serverTime from the client', DEV_A, { serverTime: Timestamp.fromMillis(1) }],
    ['updatedAt two days ahead', DEV_A, { updatedAt: Date.now() + 2 * 86_400_000 }],
  ])('rejects a device document with %s', async (_why, id, over) => {
    await denied(setDoc(deviceRef(alice, id), device(over)));
  });
});

describe('settings', () => {
  test('the owner can write each synced setting', async () => {
    await setDoc(settingRef(alice), setting());
    await setDoc(settingRef(alice, 'appearance'), setting({ key: 'appearance', json: '{"preset":"silver","mode":"light"}' }));
    await setDoc(settingRef(alice, 'appearance.custom'), setting({ key: 'appearance.custom', json: 'x'.repeat(20000) }));
    expect((await getDocs(collection(alice, 'users', 'alice', 'settings'))).size).toBe(3);
  });

  test('others cannot read or write; clients cannot delete', async () => {
    await setDoc(settingRef(alice), setting());
    await denied(getDoc(settingRef(bob)));
    await denied(setDoc(settingRef(bob), setting()));
    await denied(deleteDoc(settingRef(alice)));
  });

  test.each<[string, string, Record<string, unknown>]>([
    ['a key not in the list', 'reader.position', { key: 'reader.position' }],
    ['key differs from the id', 'language', { key: 'appearance' }],
    ['json too long', 'language', { json: 'x'.repeat(20001) }],
    ['json not a string', 'language', { json: { a: 1 } }],
    ['extra field', 'language', { extra: true }],
    ['serverTime from the client', 'language', { serverTime: Timestamp.fromMillis(1) }],
  ])('rejects a setting with %s', async (_why, id, over) => {
    await denied(setDoc(settingRef(alice, id), setting(over)));
  });
});

describe('everything else is closed', () => {
  test('the user document, other subcollections and other top-level paths', async () => {
    await denied(setDoc(doc(alice, 'users', 'alice'), { a: 1 }));
    await denied(getDoc(doc(alice, 'users', 'alice')));
    await denied(setDoc(doc(alice, 'users', 'alice', 'other', 'x'), { a: 1 }));
    await denied(setDoc(doc(alice, 'public', 'x'), { a: 1 }));
    await denied(getDocs(collection(alice, 'users')));
  });
});
