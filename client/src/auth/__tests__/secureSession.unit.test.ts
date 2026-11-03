// Acceptance tests (orchestrator-owned; the implementer may not edit them): FOLLOW-UP item 3a (John, 2026-11-02).
// On iOS and Android the Firebase Auth session is kept in expo-secure-store (the Keychain / the Android Keystore),
// never in clear in MMKV. A design that keeps it in an MMKV store encrypted with a key held in expo-secure-store
// also passes. The web keeps Firebase's default persistence (firebaseApp.ts, untouched).

type Persisted = { getItem(k: string): Promise<string | null>; setItem(k: string, v: string): Promise<void>; removeItem(k: string): Promise<void> };

interface Mmkv {
  config: { id?: string; encryptionKey?: string };
  data: Map<string, string>;
}

// A realistic Firebase session record: ~2.6 KB, larger than SecureStore's 2048-byte guidance.
const SESSION = JSON.stringify({
  uid: 'u'.repeat(28),
  email: 'reader@example.com',
  stsTokenManager: { refreshToken: 'r'.repeat(420), accessToken: 'a'.repeat(1700), expirationTime: 1_800_000_000_000 },
  providerData: [{ providerId: 'password', uid: 'reader@example.com', email: 'reader@example.com' }],
  createdAt: '1730000000000',
  lastLoginAt: '1730000000000',
  apiKey: 'AIzaSyApR7OouIzj9sSiZCpFo7FFijlOUTq6_X4',
  appName: '[DEFAULT]',
});
const FIREBASE_KEY = 'firebase:authUser:AIzaSyApR7OouIzj9sSiZCpFo7FFijlOUTq6_X4:[DEFAULT]';

let secure: Map<string, string>;
let secureOptions: unknown[];
let mmkvs: Mmkv[];
let persisted: Persisted | undefined;

function mockNative() {
  jest.doMock('expo-secure-store', () => {
    const KEY_RE = /^[\w.-]+$/;
    const check = (k: string) => {
      if (!KEY_RE.test(k)) throw new Error(`invalid SecureStore key ${k}`);
    };
    return {
      AFTER_FIRST_UNLOCK: 'AFTER_FIRST_UNLOCK',
      AFTER_FIRST_UNLOCK_THIS_DEVICE_ONLY: 'AFTER_FIRST_UNLOCK_THIS_DEVICE_ONLY',
      WHEN_UNLOCKED: 'WHEN_UNLOCKED',
      WHEN_UNLOCKED_THIS_DEVICE_ONLY: 'WHEN_UNLOCKED_THIS_DEVICE_ONLY',
      ALWAYS: 'ALWAYS',
      ALWAYS_THIS_DEVICE_ONLY: 'ALWAYS_THIS_DEVICE_ONLY',
      WHEN_PASSCODE_SET_THIS_DEVICE_ONLY: 'WHEN_PASSCODE_SET_THIS_DEVICE_ONLY',
      isAvailableAsync: async () => true,
      getItemAsync: async (k: string, o?: unknown) => (check(k), secureOptions.push(o), secure.get(k) ?? null),
      setItemAsync: async (k: string, v: string, o?: unknown) => (check(k), secureOptions.push(o), void secure.set(k, v)),
      deleteItemAsync: async (k: string, o?: unknown) => (check(k), secureOptions.push(o), void secure.delete(k)),
      getItem: (k: string, o?: unknown) => (check(k), secureOptions.push(o), secure.get(k) ?? null),
      setItem: (k: string, v: string, o?: unknown) => (check(k), secureOptions.push(o), void secure.set(k, v)),
    };
  });
  jest.doMock('react-native-mmkv', () => ({
    createMMKV: (config: Mmkv['config'] = {}) => {
      // MMKV instances with the same id share their file, whatever the key.
      let m = mmkvs.find((x) => (x.config.id ?? 'mmkv.default') === (config.id ?? 'mmkv.default'));
      if (!m) {
        m = { config: { ...config }, data: new Map() };
        mmkvs.push(m);
      } else if (config.encryptionKey !== undefined) {
        m.config.encryptionKey = config.encryptionKey;
      }
      const inst = m;
      return {
        getString: (k: string) => inst.data.get(k),
        set: (k: string, v: string) => void inst.data.set(k, String(v)),
        remove: (k: string) => inst.data.delete(k),
        delete: (k: string) => inst.data.delete(k),
        contains: (k: string) => inst.data.has(k),
        getAllKeys: () => [...inst.data.keys()],
        clearAll: () => inst.data.clear(),
        recrypt: (key: string | undefined) => void (inst.config.encryptionKey = key),
        encrypt: (key: string) => void (inst.config.encryptionKey = key),
        decrypt: () => void (inst.config.encryptionKey = undefined),
      };
    },
  }));
  jest.doMock('firebase/auth', () => ({
    initializeAuth: jest.fn(() => ({})),
    getReactNativePersistence: jest.fn((storage: Persisted) => {
      persisted = storage;
      return { type: 'LOCAL' };
    }),
  }));
  jest.doMock('firebase/firestore', () => ({ initializeFirestore: jest.fn(() => ({})) }));
  jest.doMock('../firebaseCore', () => ({
    getFirebaseApp: () => ({ name: '[DEFAULT]', options: {} }),
    withAuthEmulator: (a: unknown) => a,
    withFirestoreEmulator: (d: unknown) => d,
  }));
}

/** Loads firebaseApp.native.ts fresh (a new app start) and returns the storage Firebase Auth persists through. */
function startApp(): Persisted {
  persisted = undefined;
  jest.resetModules();
  mockNative();
  jest.isolateModules(() => {
    // eslint-disable-next-line @typescript-eslint/no-require-imports
    const mod = require('../firebaseApp.native') as typeof import('../firebaseApp.native');
    mod.getFirebaseAuth();
  });
  if (!persisted) throw new Error('getReactNativePersistence was not given a storage');
  return persisted;
}

/** MMKV stores that hold `needle` while not encrypted with a key that lives in SecureStore. */
function clearTextHolders(needle: string): Mmkv[] {
  const secureValues = new Set(secure.values());
  return mmkvs.filter((m) => {
    const holds = [...m.data.values()].some((v) => v.includes(needle.slice(0, 200)));
    const encrypted = !!m.config.encryptionKey && secureValues.has(m.config.encryptionKey);
    return holds && !encrypted;
  });
}

beforeEach(() => {
  secure = new Map();
  secureOptions = [];
  mmkvs = [];
});

test('a session round-trips across app starts', async () => {
  const s1 = startApp();
  await s1.setItem(FIREBASE_KEY, SESSION);
  expect(await s1.getItem(FIREBASE_KEY)).toBe(SESSION);
  const s2 = startApp();
  expect(await s2.getItem(FIREBASE_KEY)).toBe(SESSION);
  await s2.removeItem(FIREBASE_KEY);
  const s3 = startApp();
  expect(await s3.getItem(FIREBASE_KEY)).toBeNull();
});

test('the session is never in clear in MMKV', async () => {
  const s = startApp();
  await s.setItem(FIREBASE_KEY, SESSION);
  expect(clearTextHolders(SESSION)).toEqual([]);
  expect(secure.size).toBeGreaterThan(0);
});

test('SecureStore items are this-device-only (not in backups) and readable after first unlock (token refresh)', async () => {
  const s = startApp();
  await s.setItem(FIREBASE_KEY, SESSION);
  const used = secureOptions.filter((o) => o !== undefined) as { keychainAccessible?: string }[];
  expect(used.length).toBeGreaterThan(0);
  for (const o of used) expect(o.keychainAccessible).toBe('AFTER_FIRST_UNLOCK_THIS_DEVICE_ONLY');
});

test("a session saved in clear by R-6b's first build (MMKV 'bible-app-auth') is moved and the clear copy is gone", async () => {
  // What the first build wrote: an unencrypted MMKV store with this id.
  mmkvs.push({ config: { id: 'bible-app-auth' }, data: new Map([[FIREBASE_KEY, SESSION]]) });
  const s = startApp();
  expect(await s.getItem(FIREBASE_KEY)).toBe(SESSION);
  expect(clearTextHolders(SESSION)).toEqual([]);
});

test('removeItem of a key that was never set is fine', async () => {
  const s = startApp();
  await expect(s.removeItem('firebase:redirectUser:x:[DEFAULT]')).resolves.toBeUndefined();
  expect(await s.getItem('firebase:redirectUser:x:[DEFAULT]')).toBeNull();
});
