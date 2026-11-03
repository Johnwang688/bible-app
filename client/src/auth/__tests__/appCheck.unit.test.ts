// Acceptance tests (orchestrator-owned; the implementer may not edit them): FOLLOW-UP item 3b, App Check (John,
// 2026-11-02). The web app gets App Check tokens from reCAPTCHA Enterprise (site key below, public); Firestore
// attaches them itself once App Check is initialised on the app; the backend call sends one in
// `X-Firebase-AppCheck`. iOS and Android have no attestation provider yet (it needs a native module and an EAS build):
// they send no token, which monitor mode allows.
import { createAccountApi } from '../accountApi';

const SITE_KEY = '6Lf1Yg0uAAAAAOFcnwDwi4LNyGO0_MgrmjAa4duG';

function okFetch() {
  return jest.fn(async (_url: string, _init?: RequestInit) => new Response(null, { status: 204 }));
}
const headersOf = (f: ReturnType<typeof okFetch>) => new Headers(f.mock.calls[0]![1]!.headers);

describe('accountApi sends the App Check token', () => {
  test('with a token: X-Firebase-AppCheck carries it, next to the Bearer ID token', async () => {
    const fetch = okFetch();
    const api = createAccountApi({ baseUrl: 'https://api.test', fetch, appCheckToken: async () => 'ac-token' });
    await api.deleteAccount('id-token');
    const h = headersOf(fetch);
    expect(h.get('X-Firebase-AppCheck')).toBe('ac-token');
    expect(h.get('Authorization')).toBe('Bearer id-token');
  });

  test.each([
    ['no token', async () => null],
    ['a failing provider', async () => Promise.reject(new Error('recaptcha unavailable'))],
  ])('with %s: the request still goes, without the header (monitor mode)', async (_name, appCheckToken) => {
    const fetch = okFetch();
    const api = createAccountApi({ baseUrl: 'https://api.test', fetch, appCheckToken });
    await expect(api.deleteAccount('id-token')).resolves.toBeUndefined();
    expect(fetch).toHaveBeenCalledTimes(1);
    expect(headersOf(fetch).has('X-Firebase-AppCheck')).toBe(false);
  });
});

describe('web App Check (appCheck.ts)', () => {
  const initializeAppCheck = jest.fn((_app: unknown, _opts: unknown) => ({ id: 'appcheck' }));
  const getToken = jest.fn(async (_ac: unknown, _force?: boolean) => ({ token: 'web-ac-token' }));
  const ReCaptchaEnterpriseProvider = jest.fn(function (this: { siteKey: string }, siteKey: string) {
    this.siteKey = siteKey;
  });

  const savedEnv = { ...process.env };
  afterEach(() => {
    process.env = { ...savedEnv };
  });

  /** Loads appCheck.ts fresh with `env` set (it stays set until the test ends). */
  function load(env: Record<string, string | undefined> = {}) {
    process.env = { ...savedEnv };
    Object.assign(process.env, env);
    for (const [k, v] of Object.entries(env)) if (v === undefined) delete process.env[k];
    jest.resetModules();
    jest.doMock('firebase/app-check', () => ({ initializeAppCheck, getToken, ReCaptchaEnterpriseProvider }));
    let mod!: { ensureAppCheck(app: unknown): void; getAppCheckToken(): Promise<string | null> };
    jest.isolateModules(() => {
      // The web file by its full name: jest-expo resolves '../appCheck' to the native one.
      // eslint-disable-next-line @typescript-eslint/no-require-imports
      mod = require('../appCheck.ts');
    });
    return mod;
  }

  beforeEach(() => {
    initializeAppCheck.mockClear();
    getToken.mockClear();
    ReCaptchaEnterpriseProvider.mockClear();
  });

  test('initialises once, with reCAPTCHA Enterprise and the site key, and auto-refresh on', async () => {
    const mod = load();
    const app = { name: '[DEFAULT]' };
    mod.ensureAppCheck(app);
    mod.ensureAppCheck(app);
    expect(initializeAppCheck).toHaveBeenCalledTimes(1);
    expect(ReCaptchaEnterpriseProvider).toHaveBeenCalledWith(SITE_KEY);
    const [calledApp, opts] = initializeAppCheck.mock.calls[0]! as [unknown, { provider: unknown; isTokenAutoRefreshEnabled: boolean }];
    expect(calledApp).toBe(app);
    expect(opts.isTokenAutoRefreshEnabled).toBe(true);
    expect((opts.provider as { siteKey: string }).siteKey).toBe(SITE_KEY);
    await expect(mod.getAppCheckToken()).resolves.toBe('web-ac-token');
  });

  test('EXPO_PUBLIC_FIREBASE_APPCHECK_SITE_KEY overrides the key; "off" turns App Check off', async () => {
    const other = load({ EXPO_PUBLIC_FIREBASE_APPCHECK_SITE_KEY: 'other-key' });
    other.ensureAppCheck({});
    expect(ReCaptchaEnterpriseProvider).toHaveBeenCalledWith('other-key');

    initializeAppCheck.mockClear();
    const off = load({ EXPO_PUBLIC_FIREBASE_APPCHECK_SITE_KEY: 'off' });
    off.ensureAppCheck({});
    expect(initializeAppCheck).not.toHaveBeenCalled();
    await expect(off.getAppCheckToken()).resolves.toBeNull();
  });

  test('a token that cannot be had is null, never a throw', async () => {
    const mod = load();
    mod.ensureAppCheck({});
    getToken.mockRejectedValueOnce(new Error('recaptcha blocked'));
    await expect(mod.getAppCheckToken()).resolves.toBeNull();
  });

  test('before ensureAppCheck, there is no token', async () => {
    const mod = load();
    await expect(mod.getAppCheckToken()).resolves.toBeNull();
  });
});

describe('native App Check (appCheck.native.ts): no provider yet', () => {
  test('ensureAppCheck is a no-op and the token is null', async () => {
    jest.resetModules();
    // eslint-disable-next-line @typescript-eslint/no-require-imports
    const mod = require('../appCheck.native') as { ensureAppCheck(app: unknown): void; getAppCheckToken(): Promise<string | null> };
    expect(() => mod.ensureAppCheck({})).not.toThrow();
    await expect(mod.getAppCheckToken()).resolves.toBeNull();
  });
});
