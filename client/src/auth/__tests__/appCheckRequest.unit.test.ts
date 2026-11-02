// Implementer tests (R6b-fu-sec4-native) for getAppCheckTokenForRequest (security review 4, S4-2): the web starts
// App Check for a backend call, never throws, starts nothing when off; native starts nothing.

const initializeAppCheck = jest.fn((_app: unknown, _opts: unknown) => ({ id: 'appcheck' }));
const getToken = jest.fn(async (_ac: unknown, _force?: boolean) => ({ token: 'web-ac-token' }));
const ReCaptchaEnterpriseProvider = jest.fn();
let getFirebaseApp: () => unknown;

type Mod = typeof import('../appCheck');

function loadWeb(env: Record<string, string | undefined> = {}): Mod {
  jest.resetModules();
  for (const [k, v] of Object.entries(env)) {
    if (v === undefined) delete process.env[k];
    else process.env[k] = v;
  }
  jest.doMock('firebase/app-check', () => ({ initializeAppCheck, getToken, ReCaptchaEnterpriseProvider }));
  jest.doMock('../firebaseCore', () => ({ getFirebaseApp: () => getFirebaseApp() }));
  let mod!: Mod;
  jest.isolateModules(() => {
    // eslint-disable-next-line @typescript-eslint/no-require-imports
    mod = require('../appCheck.ts') as Mod;
  });
  return mod;
}

const savedKey = process.env.EXPO_PUBLIC_FIREBASE_APPCHECK_SITE_KEY;
beforeEach(() => {
  initializeAppCheck.mockClear();
  getToken.mockClear();
  ReCaptchaEnterpriseProvider.mockClear();
  getFirebaseApp = () => ({ name: '[DEFAULT]' });
});
afterEach(() => {
  if (savedKey === undefined) delete process.env.EXPO_PUBLIC_FIREBASE_APPCHECK_SITE_KEY;
  else process.env.EXPO_PUBLIC_FIREBASE_APPCHECK_SITE_KEY = savedKey;
  jest.dontMock('firebase/app-check');
  jest.dontMock('../firebaseCore');
});

test('web: a backend call starts App Check once and gets a token', async () => {
  const mod = loadWeb({ EXPO_PUBLIC_FIREBASE_APPCHECK_SITE_KEY: undefined });
  await expect(mod.getAppCheckTokenForRequest()).resolves.toBe('web-ac-token');
  await expect(mod.getAppCheckTokenForRequest()).resolves.toBe('web-ac-token');
  expect(initializeAppCheck).toHaveBeenCalledTimes(1);
});

test('web: App Check off starts nothing and gives null', async () => {
  const mod = loadWeb({ EXPO_PUBLIC_FIREBASE_APPCHECK_SITE_KEY: 'off' });
  await expect(mod.getAppCheckTokenForRequest()).resolves.toBeNull();
  expect(initializeAppCheck).not.toHaveBeenCalled();
  expect(ReCaptchaEnterpriseProvider).not.toHaveBeenCalled();
});

test('web: no Firebase app, or App Check failing to start, is null and never a throw', async () => {
  getFirebaseApp = () => {
    throw new Error('no app');
  };
  await expect(loadWeb({ EXPO_PUBLIC_FIREBASE_APPCHECK_SITE_KEY: undefined }).getAppCheckTokenForRequest()).resolves.toBeNull();
  getFirebaseApp = () => ({});
  initializeAppCheck.mockImplementationOnce(() => {
    throw new Error('already initialised');
  });
  await expect(loadWeb({ EXPO_PUBLIC_FIREBASE_APPCHECK_SITE_KEY: undefined }).getAppCheckTokenForRequest()).resolves.toBeNull();
});

test('native: no token, and no Firebase app is touched', async () => {
  jest.resetModules();
  getFirebaseApp = jest.fn();
  jest.doMock('../firebaseCore', () => ({ getFirebaseApp: () => getFirebaseApp() }));
  // eslint-disable-next-line @typescript-eslint/no-require-imports
  const mod = require('../appCheck.native') as Mod;
  await expect(mod.getAppCheckTokenForRequest()).resolves.toBeNull();
  expect(getFirebaseApp).not.toHaveBeenCalled();
});
