// Implementer tests (R6b-fu-native) for the App Check header on the account API, beyond appCheck.unit.test.ts:
// the default token source is loaded lazily, a slow provider does not hold the request, and a blank token sends
// no header.
import { APP_CHECK_TOKEN_TIMEOUT_MS, createAccountApi } from '../accountApi';

const okFetch = () => jest.fn(async (_url: string, _init?: RequestInit) => new Response(null, { status: 204 }));
const headersOf = (f: ReturnType<typeof okFetch>) => new Headers(f.mock.calls[0]![1]!.headers);

afterEach(() => {
  jest.useRealTimers();
  jest.dontMock('../appCheck');
});

test('loading accountApi loads nothing App Check; the default source is used at request time', async () => {
  jest.resetModules();
  let loaded = 0;
  jest.doMock('../appCheck', () => {
    loaded++;
    return { getAppCheckToken: async () => 'default-token' };
  });
  let mod!: typeof import('../accountApi');
  jest.isolateModules(() => {
    // eslint-disable-next-line @typescript-eslint/no-require-imports
    mod = require('../accountApi');
  });
  expect(loaded).toBe(0);
  const fetch = okFetch();
  await mod.createAccountApi({ baseUrl: 'https://api.test', fetch }).deleteAccount('id');
  expect(loaded).toBe(1);
  expect(headersOf(fetch).get('X-Firebase-AppCheck')).toBe('default-token');
});

test('a provider that never answers: the request goes without the header after the wait', async () => {
  jest.useFakeTimers();
  const fetch = okFetch();
  const api = createAccountApi({ baseUrl: 'https://api.test', fetch, appCheckToken: () => new Promise<string | null>(() => {}) });
  const done = api.deleteAccount('id');
  await jest.advanceTimersByTimeAsync(APP_CHECK_TOKEN_TIMEOUT_MS);
  await expect(done).resolves.toBeUndefined();
  expect(fetch).toHaveBeenCalledTimes(1);
  expect(headersOf(fetch).has('X-Firebase-AppCheck')).toBe(false);
});

test('a blank token sends no header', async () => {
  const fetch = okFetch();
  await createAccountApi({ baseUrl: 'https://api.test', fetch, appCheckToken: async () => '  ' }).deleteAccount('id');
  expect(headersOf(fetch).has('X-Firebase-AppCheck')).toBe(false);
});
