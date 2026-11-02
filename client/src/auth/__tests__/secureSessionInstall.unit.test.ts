// Implementer tests (R6b-fu-sec4-native) for the native session store: a new install starts signed out even
// though the iOS Keychain kept the old session, and a failed legacy migration is retried and never leaves a
// clear copy that could restore a session the user signed out of (security review 4, S4-5).

type Persisted = { getItem(k: string): Promise<string | null>; setItem(k: string, v: string): Promise<void>; removeItem(k: string): Promise<void> };

const API_KEY = 'AIzaSyApR7OouIzj9sSiZCpFo7FFijlOUTq6_X4';
const KEY = `firebase:authUser:${API_KEY}:[DEFAULT]`;
const OLD = JSON.stringify({ uid: 'old', stsTokenManager: { refreshToken: 'OLD-REFRESH'.repeat(300) } }); // > 1 chunk
const NEW = JSON.stringify({ uid: 'new', stsTokenManager: { refreshToken: 'NEW-REFRESH' } });

/** The Keychain: survives an uninstall. */
let secure: Map<string, string>;
/** MMKV stores by id: app files, gone on an uninstall. */
let mmkvs: Map<string, Map<string, string>>;
/** SecureStore calls that throw (errSecInteractionNotAllowed before the first unlock): a predicate per call. */
let refuse: (op: 'get' | 'set' | 'delete', key: string) => boolean;
let persisted: Persisted | undefined;

function mmkv(id: string): Map<string, string> {
  let m = mmkvs.get(id);
  if (!m) mmkvs.set(id, (m = new Map()));
  return m;
}

function mockNative() {
  const guard = (op: 'get' | 'set' | 'delete', k: string) => {
    if (!/^[\w.-]+$/.test(k)) throw new Error(`invalid SecureStore key ${k}`);
    if (refuse(op, k)) throw new Error('User interaction is not allowed.');
  };
  jest.doMock('expo-secure-store', () => ({
    AFTER_FIRST_UNLOCK_THIS_DEVICE_ONLY: 'AFTER_FIRST_UNLOCK_THIS_DEVICE_ONLY',
    getItemAsync: async (k: string) => (guard('get', k), secure.get(k) ?? null),
    setItemAsync: async (k: string, v: string) => (guard('set', k), void secure.set(k, v)),
    deleteItemAsync: async (k: string) => (guard('delete', k), void secure.delete(k)),
  }));
  jest.doMock('react-native-mmkv', () => ({
    createMMKV: (config: { id?: string } = {}) => {
      const data = mmkv(config.id ?? 'mmkv.default');
      return {
        getString: (k: string) => data.get(k),
        set: (k: string, v: string) => void data.set(k, String(v)),
        remove: (k: string) => data.delete(k),
        getAllKeys: () => [...data.keys()],
        clearAll: () => data.clear(),
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
    getFirebaseApp: () => ({ name: '[DEFAULT]', options: { apiKey: API_KEY } }),
    withAuthEmulator: (a: unknown) => a,
    withFirestoreEmulator: (d: unknown) => d,
  }));
}

/** A new process: loads firebaseApp.native.ts fresh and returns the storage Firebase Auth was given. */
function startApp(): Persisted {
  persisted = undefined;
  jest.resetModules();
  mockNative();
  jest.isolateModules(() => {
    // eslint-disable-next-line @typescript-eslint/no-require-imports
    (require('../firebaseApp.native') as typeof import('../firebaseApp.native')).getFirebaseAuth();
  });
  if (!persisted) throw new Error('no storage');
  return persisted;
}

/** A plain store without the install wipe (as the reviewer's S4-5 test builds it). */
function plainStore(): Persisted {
  jest.resetModules();
  mockNative();
  let store!: Persisted;
  jest.isolateModules(() => {
    // eslint-disable-next-line @typescript-eslint/no-require-imports
    store = (require('../firebaseApp.native') as typeof import('../firebaseApp.native')).createSecureAuthStorage();
  });
  return store;
}

const uninstall = () => mmkvs.clear(); // the app's files go; the Keychain stays
const sessionItems = () => [...secure.keys()].filter((k) => k.includes('.k.'));

beforeEach(() => {
  secure = new Map();
  mmkvs = new Map();
  refuse = () => false;
});
afterEach(() => {
  for (const m of ['expo-secure-store', 'react-native-mmkv', 'firebase/auth', 'firebase/firestore', '../firebaseCore']) jest.dontMock(m);
});

describe('a reinstall does not restore the old session from the Keychain', () => {
  test('sign in, uninstall, reinstall: signed out, and the old items are deleted', async () => {
    const s1 = startApp();
    await s1.setItem(KEY, OLD);
    expect(await startApp().getItem(KEY)).toBe(OLD); // an ordinary restart keeps it
    uninstall();
    const s2 = startApp();
    expect(await s2.getItem(KEY)).toBeNull();
    expect(sessionItems()).toEqual([]); // header and every chunk are gone, not just unreadable
    // The new install's own session then persists across restarts.
    await s2.setItem(KEY, NEW);
    expect(await startApp().getItem(KEY)).toBe(NEW);
  });

  test('the wipe covers the keys Firebase Auth derives from the app (authUser, redirectUser, persistence, __sak)', () => {
    jest.resetModules();
    mockNative();
    let keys: string[] = [];
    jest.isolateModules(() => {
      // eslint-disable-next-line @typescript-eslint/no-require-imports
      keys = (require('../firebaseApp.native') as typeof import('../firebaseApp.native')).firebaseSessionKeys(API_KEY, '[DEFAULT]');
    });
    expect(keys).toEqual(expect.arrayContaining([KEY, `firebase:redirectUser:${API_KEY}:[DEFAULT]`, `firebase:persistence:${API_KEY}:[DEFAULT]`, '__sak']));
  });

  test("an upgrade from R-6b's first build (clear MMKV session, no install marker) keeps the migrated session", async () => {
    mmkv('bible-app-auth').set(KEY, OLD);
    expect(await startApp().getItem(KEY)).toBe(OLD);
    expect(mmkv('bible-app-auth').size).toBe(0);
    expect(await startApp().getItem(KEY)).toBe(OLD);
  });

  test('a wipe SecureStore refuses: the old session still reads as null, and a new sign-in replaces it', async () => {
    await startApp().setItem(KEY, OLD);
    uninstall();
    let refusals = 3;
    refuse = (op) => op === 'get' && refusals-- > 0; // the header read inside the wipe fails a few times
    const s = startApp();
    expect(await s.getItem(KEY)).toBeNull();
    refuse = () => false;
    expect(await s.getItem(KEY)).toBeNull(); // the retried wipe deleted it
    expect(sessionItems()).toEqual([]);
    await s.setItem(KEY, NEW);
    expect(await startApp().getItem(KEY)).toBe(NEW);
  });

  test('while a key is still pending its wipe, a set of it replaces the old value and it is not wiped later', async () => {
    await startApp().setItem(KEY, OLD);
    uninstall();
    refuse = (op, k) => op === 'delete' && k.endsWith('.h'); // header deletes fail for now
    const s = startApp();
    expect(await s.getItem(KEY)).toBeNull();
    await s.setItem(KEY, NEW);
    refuse = () => false;
    expect(await s.getItem(KEY)).toBe(NEW);
    expect(await startApp().getItem(KEY)).toBe(NEW);
  });

  test('when the install marker cannot be read, nothing is read from SecureStore (signed out)', async () => {
    await startApp().setItem(KEY, OLD);
    jest.resetModules();
    mockNative();
    jest.doMock('react-native-mmkv', () => ({
      createMMKV: () => {
        throw new Error('mmkv unavailable');
      },
    }));
    let s!: Persisted;
    jest.isolateModules(() => {
      // eslint-disable-next-line @typescript-eslint/no-require-imports
      (require('../firebaseApp.native') as typeof import('../firebaseApp.native')).getFirebaseAuth();
      s = persisted!;
    });
    expect(await s.getItem(KEY)).toBeNull();
  });
});

describe('S4-5: a failed legacy migration', () => {
  test('is retried on the next store call (not only on the next start)', async () => {
    mmkv('bible-app-auth').set(KEY, OLD);
    let refusals = 1;
    refuse = (op) => op === 'get' && refusals-- > 0;
    const s = plainStore();
    expect(await s.getItem(KEY)).toBeNull(); // this call's migration failed
    expect(await s.getItem(KEY)).toBe(OLD); // the next call's retry moved it
    expect(mmkv('bible-app-auth').size).toBe(0);
  });

  test('that keeps failing: a set and a remove still drop the clear copy, so a sign-out sticks', async () => {
    mmkv('bible-app-auth').set(KEY, OLD);
    refuse = (op, k) => op === 'get' && k === 'bible-app-auth.migrated-v1'; // the migration never gets going
    const s = plainStore();
    await s.setItem(KEY, NEW);
    expect(mmkv('bible-app-auth').has(KEY)).toBe(false);
    mmkv('bible-app-auth').set(KEY, OLD); // even if a copy were there again
    await s.removeItem(KEY);
    expect(mmkv('bible-app-auth').has(KEY)).toBe(false);
    refuse = () => false;
    expect(await plainStore().getItem(KEY)).toBeNull();
  });

  test('a migration that succeeded never opens the legacy store again on a write', async () => {
    const s = plainStore();
    await s.getItem(KEY);
    mmkv('bible-app-auth').set('firebase:other', 'x');
    await s.setItem('firebase:other', 'y');
    await s.removeItem('firebase:other');
    expect(mmkv('bible-app-auth').get('firebase:other')).toBe('x'); // untouched: MMKV is no longer used
  });
});
