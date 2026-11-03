// Implementer tests (R6b-fu-native) for the native session storage in firebaseApp.native.ts, beyond the
// acceptance tests in secureSession.unit.test.ts: chunk sizes, the old tail after a shorter write, the key
// encoding, the one-time migration, and interleaved writes that must read back as the full value or null.

type Store = { getItem(k: string): Promise<string | null>; setItem(k: string, v: string): Promise<void>; removeItem(k: string): Promise<void> };

let secure: Map<string, string>;
let mmkvData: Map<string, string>;
let mmkvOpened: number;
let mmkvCleared: number;
let failSet: boolean;
/** When set, each SecureStore call first waits this many macrotask turns (drawn per call). */
let delay: (() => number) | null;

const KEY_RE = /^[\w.-]+$/;
async function wait() {
  const n = delay ? delay() : 0;
  for (let i = 0; i < n; i++) await new Promise((r) => setImmediate(r));
}

function load(): typeof import('../firebaseApp.native') {
  jest.resetModules();
  jest.doMock('expo-secure-store', () => ({
    AFTER_FIRST_UNLOCK_THIS_DEVICE_ONLY: 'AFTER_FIRST_UNLOCK_THIS_DEVICE_ONLY',
    getItemAsync: async (k: string) => {
      if (!KEY_RE.test(k)) throw new Error(`bad key ${k}`);
      await wait();
      return secure.get(k) ?? null;
    },
    setItemAsync: async (k: string, v: string) => {
      if (!KEY_RE.test(k)) throw new Error(`bad key ${k}`);
      if (failSet) throw new Error('keychain unavailable');
      await wait();
      secure.set(k, v);
    },
    deleteItemAsync: async (k: string) => {
      if (!KEY_RE.test(k)) throw new Error(`bad key ${k}`);
      await wait();
      secure.delete(k);
    },
  }));
  jest.doMock('react-native-mmkv', () => ({
    createMMKV: () => {
      mmkvOpened++;
      return {
        getAllKeys: () => [...mmkvData.keys()],
        getString: (k: string) => mmkvData.get(k),
        remove: (k: string) => mmkvData.delete(k),
        clearAll: () => {
          mmkvCleared++;
          mmkvData.clear();
        },
      };
    },
  }));
  jest.doMock('firebase/auth', () => ({ initializeAuth: jest.fn(() => ({})), getReactNativePersistence: jest.fn(() => ({})) }));
  jest.doMock('firebase/firestore', () => ({ initializeFirestore: jest.fn(() => ({})) }));
  jest.doMock('../firebaseCore', () => ({ getFirebaseApp: () => ({}), withAuthEmulator: (a: unknown) => a, withFirestoreEmulator: (d: unknown) => d }));
  let mod!: typeof import('../firebaseApp.native');
  jest.isolateModules(() => {
    // eslint-disable-next-line @typescript-eslint/no-require-imports
    mod = require('../firebaseApp.native');
  });
  return mod;
}

const KEY = 'firebase:authUser:AIzaSyApR7OouIzj9sSiZCpFo7FFijlOUTq6_X4:[DEFAULT]';
const big = (c: string, n: number) => JSON.stringify({ t: c.repeat(n) });

beforeEach(() => {
  secure = new Map();
  mmkvData = new Map();
  mmkvOpened = 0;
  mmkvCleared = 0;
  failSet = false;
  delay = null;
});

const sessionItems = () => [...secure.keys()].filter((k) => k.includes('.k.'));

test('a 3 KB value is split into items under 2048 bytes, under keys SecureStore accepts', async () => {
  const s: Store = load().createSecureAuthStorage();
  const value = big('x', 3000);
  await s.setItem(KEY, value);
  expect(sessionItems().length).toBe(3); // header + 2 chunks
  for (const [k, v] of secure) {
    expect(k).toMatch(KEY_RE);
    expect(Buffer.byteLength(v, 'utf8')).toBeLessThan(2048);
  }
  expect(await s.getItem(KEY)).toBe(value);
});

test('the empty string and a one-chunk value round-trip', async () => {
  const s = load().createSecureAuthStorage();
  await s.setItem(KEY, '');
  expect(await s.getItem(KEY)).toBe('');
  await s.setItem(KEY, 'short');
  expect(await s.getItem(KEY)).toBe('short');
});

test('a shorter write removes the old tail; a remove leaves no item of the key', async () => {
  const s = load().createSecureAuthStorage();
  await s.setItem(KEY, big('a', 6000));
  expect(sessionItems().length).toBe(5);
  await s.setItem(KEY, 'short');
  expect(sessionItems().length).toBe(2);
  expect(await s.getItem(KEY)).toBe('short');
  await s.removeItem(KEY);
  expect(sessionItems()).toEqual([]);
  expect(await s.getItem(KEY)).toBeNull();
});

test('a missing chunk, a chunk from another write, or a corrupt header reads as null', async () => {
  const s = load().createSecureAuthStorage();
  await s.setItem(KEY, big('a', 3000));
  const items = sessionItems();
  const header = items.find((k) => k.endsWith('.h'))!;
  const chunk1 = items.find((k) => k.endsWith('.1'))!;
  const saved = new Map(secure);

  secure.delete(chunk1);
  expect(await s.getItem(KEY)).toBeNull();

  secure = new Map(saved);
  secure.set(chunk1, `zzz|${saved.get(chunk1)!.split('|').slice(1).join('|')}`);
  expect(await s.getItem(KEY)).toBeNull();

  for (const bad of ['', 'v1|abc|0', 'v1|abc|9999', 'garbage', 'v1|ABC|2']) {
    secure = new Map(saved);
    secure.set(header, bad);
    expect(await s.getItem(KEY)).toBeNull();
  }
});

test('the key encoding is one-to-one and only uses SecureStore characters', () => {
  const { secureKeyStem } = load();
  const keys = ['a:b', 'a_003ab', 'a.b', 'a_002eb', '[DEFAULT]', 'é', 'a-b', 'ab'];
  const stems = keys.map(secureKeyStem);
  expect(new Set(stems).size).toBe(keys.length);
  for (const s of stems) {
    expect(s).toMatch(/^[A-Za-z0-9._-]+$/);
    expect(s.split('.').length).toBe(3); // prefix, "k", the escaped key: no '.' from the key itself
  }
});

test('migration runs once: later starts never open the MMKV store', async () => {
  mmkvData.set(KEY, 'legacy-session');
  const s1 = load().createSecureAuthStorage();
  expect(await s1.getItem(KEY)).toBe('legacy-session');
  expect(mmkvData.size).toBe(0);
  expect(mmkvCleared).toBe(1);
  expect(mmkvOpened).toBe(1);
  const s2 = load().createSecureAuthStorage();
  expect(await s2.getItem(KEY)).toBe('legacy-session');
  expect(mmkvOpened).toBe(1);
});

test('migration keeps a session already in SecureStore (newer) and still clears MMKV', async () => {
  const s0 = load().createSecureAuthStorage();
  failSet = false;
  // Write a SecureStore session without the migration marker (as if the marker write had failed).
  await s0.setItem(KEY, 'secure-session');
  secure.delete('bible-app-auth.migrated-v1');
  mmkvData.set(KEY, 'legacy-session');
  const s1 = load().createSecureAuthStorage();
  expect(await s1.getItem(KEY)).toBe('secure-session');
  expect(mmkvData.size).toBe(0);
});

test('when SecureStore refuses the move, the clear MMKV copy is dropped anyway', async () => {
  mmkvData.set(KEY, 'legacy-session');
  failSet = true;
  const s = load().createSecureAuthStorage();
  expect(await s.getItem(KEY)).toBeNull();
  expect(mmkvData.size).toBe(0);
});

/** A small deterministic PRNG, so a failing interleaving can be replayed by its seed. */
function rng(seed: number) {
  let x = seed >>> 0 || 1;
  return () => {
    x ^= x << 13;
    x ^= x >>> 17;
    x ^= x << 5;
    return (x >>> 0) / 2 ** 32;
  };
}

test('interleaved sets, removes and reads end in a full value or null, never a mix', async () => {
  const A = big('a', 4000);
  const B = big('b', 2500);
  for (let seed = 1; seed <= 150; seed++) {
    secure = new Map();
    delay = null;
    const s = load().createSecureAuthStorage();
    await s.setItem(KEY, A);
    const r = rng(seed);
    delay = () => Math.floor(r() * 4);
    const reads: (string | null)[] = [];
    const ops: Promise<unknown>[] = [s.setItem(KEY, B), s.removeItem(KEY), s.getItem(KEY).then((v) => reads.push(v))];
    if (seed % 2) ops.push(s.setItem(KEY, A), s.getItem(KEY).then((v) => reads.push(v)));
    await Promise.all(ops);
    delay = null;
    const end = await s.getItem(KEY);
    for (const v of [...reads, end]) expect([A, B, null]).toContain(v);
  }
});
