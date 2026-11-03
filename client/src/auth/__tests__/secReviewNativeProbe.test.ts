// Copied from the AUTH security review (Opus, 11-03) into this folder by the orchestrator; acceptance test of AUTH fix 2.
// Location: copy into client/src/auth/__tests__/ (imports are relative to that folder).
// Independent security review of auth-hardening (70a60b9..HEAD), native session store.
//
// SR-N1 (low, regression from the S5-4 pre-wipe). Firebase Auth's React Native persistence probes its storage on
// every start: `_isAvailable()` calls setItem('__sak', '1') then removeItem('__sak')
// (node_modules/@firebase/auth/dist/rn/index.js, getReactNativePersistence). On a launch whose MMKV fails, that probe
// is the run's first write while the install is unknown, so prewipeIfUnknown deletes every session key, also on an
// install that has its marker (an established install hit by one transient MMKV failure). The person's session,
// which was only hidden for that one run before this change, is deleted: the next launch, with MMKV working, starts
// signed out. On 70a60b9 this test passes (the probe wrote '__sak' and left the session alone); on HEAD it fails.
type Persisted = { getItem(k: string): Promise<string | null>; setItem(k: string, v: string): Promise<void>; removeItem(k: string): Promise<void> };

const API_KEY = 'AIzaSyApR7OouIzj9sSiZCpFo7FFijlOUTq6_X4';
const KEY = `firebase:authUser:${API_KEY}:[DEFAULT]`;
const NEW = JSON.stringify({ uid: 'new-account', stsTokenManager: { refreshToken: 'NEW-REFRESH' } });

let secure: Map<string, string>;
let mmkvs: Map<string, Map<string, string>>;
let mmkvDown: boolean;
let persisted: Persisted | undefined;

function mmkv(id: string): Map<string, string> {
  let m = mmkvs.get(id);
  if (!m) mmkvs.set(id, (m = new Map()));
  return m;
}

function mockNative() {
  jest.doMock('expo-secure-store', () => ({
    AFTER_FIRST_UNLOCK_THIS_DEVICE_ONLY: 'AFTER_FIRST_UNLOCK_THIS_DEVICE_ONLY',
    getItemAsync: async (k: string) => secure.get(k) ?? null,
    setItemAsync: async (k: string, v: string) => void secure.set(k, v),
    deleteItemAsync: async (k: string) => void secure.delete(k),
  }));
  jest.doMock('react-native-mmkv', () => ({
    createMMKV: (config: { id?: string } = {}) => {
      if (mmkvDown) throw new Error('MMKV failed to initialise');
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

/** What Firebase Auth does first at every start (ReactNativePersistence._isAvailable), then reads the user. */
async function firebaseStart(s: Persisted): Promise<string | null> {
  await s.setItem('__sak', '1');
  await s.removeItem('__sak');
  return s.getItem(KEY);
}

describe('secreview: the native session store and Firebase Auth start-up probe', () => {
  beforeEach(() => {
    secure = new Map();
    mmkvs = new Map();
    mmkvDown = false;
  });
  afterEach(() => {
    for (const m of ['expo-secure-store', 'react-native-mmkv', 'firebase/auth', 'firebase/firestore', '../firebaseCore']) jest.dontMock(m);
  });

  test('SR-N1 (low): one launch with MMKV failing does not delete an established install\'s session', async () => {
    // Launch 1: a new install, MMKV fine. Firebase starts (probe, read: signed out), the person signs in.
    const first = startApp();
    expect(await firebaseStart(first)).toBeNull();
    await first.setItem(KEY, NEW);
    // Launch 2: signed in on an established install, but MMKV fails to open for this one run.
    mmkvDown = true;
    expect(await firebaseStart(startApp())).toBeNull(); // sound: unknown install reads as signed out
    // Launch 3: MMKV works again. Expected: NEW (the person never signed out). Actual on HEAD: null (pre-wiped by
    // the '__sak' probe of launch 2).
    mmkvDown = false;
    expect(await firebaseStart(startApp())).toBe(NEW);
  });

  test('sound: a reinstall whose first launch has MMKV failing still starts signed out on every launch', async () => {
    const old = startApp();
    await firebaseStart(old);
    await old.setItem(KEY, NEW);
    mmkvs.clear(); // uninstall (Keychain kept)
    mmkvDown = true;
    expect(await firebaseStart(startApp())).toBeNull();
    mmkvDown = false;
    expect(await firebaseStart(startApp())).toBeNull();
  });
});
