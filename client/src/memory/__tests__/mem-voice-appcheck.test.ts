// The voice client's optional App Check header (SM-1): sent when there is a token, waited for at most
// APP_CHECK_WAIT_MS, never a reason to fail the request, and the wait loses to the caller's abort like every other
// await (cancel always wins).
import { APP_CHECK_WAIT_MS, checkVoice } from '../voice/voiceClient';

const audio = new Blob(['audio'], { type: 'audio/webm' });

function okFetch() {
  return jest.fn(async (_url: string, _init: RequestInit) => ({
    status: 200,
    headers: { get: () => null },
    json: async () => ({ text: '聽' }),
  })) as unknown as jest.Mock & typeof fetch;
}

const headersOf = (fetchMock: jest.Mock): Record<string, string> =>
  (fetchMock.mock.calls[0]![1] as RequestInit).headers as Record<string, string>;

afterEach(() => jest.useRealTimers());

it('sends the App Check token as X-Firebase-AppCheck', async () => {
  const fetchMock = okFetch();
  const out = await checkVoice(audio, 'mandarin', {
    baseUrl: 'https://api.test',
    getIdToken: async () => 'id-token',
    getAppCheckToken: async () => 'app-check-token',
    fetch: fetchMock,
    isOnline: () => true,
  });
  expect(out).toEqual({ kind: 'text', text: '聽' });
  expect(headersOf(fetchMock)).toMatchObject({ Authorization: 'Bearer id-token', 'X-Firebase-AppCheck': 'app-check-token' });
});

const missing: [string, () => Promise<string | null>][] = [
  ['null', async () => null],
  ['empty', async () => ''],
  ['rejected', () => Promise.reject(new Error('recaptcha'))],
  [
    'thrown',
    () => {
      throw new Error('no app');
    },
  ],
];
it.each(missing)('goes without the header when the token is %s', async (_name, get) => {
  const fetchMock = okFetch();
  const out = await checkVoice(audio, 'mandarin', {
    baseUrl: 'https://api.test',
    getIdToken: async () => 'id-token',
    getAppCheckToken: get,
    fetch: fetchMock,
    isOnline: () => true,
  });
  expect(out.kind).toBe('text');
  expect(headersOf(fetchMock)).not.toHaveProperty('X-Firebase-AppCheck');
});

it('asks nothing of App Check when signed out (nothing is sent)', async () => {
  const getAppCheckToken = jest.fn(async () => 'app-check-token');
  const out = await checkVoice(audio, 'mandarin', { baseUrl: 'https://api.test', getIdToken: async () => null, getAppCheckToken, isOnline: () => true });
  expect(out).toEqual({ kind: 'signed-out' });
  expect(getAppCheckToken).not.toHaveBeenCalled();
});

it(`waits at most ${APP_CHECK_WAIT_MS} ms for App Check, then sends without it`, async () => {
  jest.useFakeTimers();
  const fetchMock = okFetch();
  const pending = checkVoice(audio, 'mandarin', {
    baseUrl: 'https://api.test',
    getIdToken: async () => 'id-token',
    getAppCheckToken: () => new Promise<string | null>(() => undefined),
    fetch: fetchMock,
    isOnline: () => true,
  });
  await jest.advanceTimersByTimeAsync(APP_CHECK_WAIT_MS - 1);
  expect(fetchMock).not.toHaveBeenCalled();
  await jest.advanceTimersByTimeAsync(1);
  await expect(pending).resolves.toEqual({ kind: 'text', text: '聽' });
  expect(fetchMock).toHaveBeenCalledTimes(1);
  expect(headersOf(fetchMock)).not.toHaveProperty('X-Firebase-AppCheck');
});

it('a Cancel during the App Check wait wins: cancelled, nothing sent', async () => {
  const fetchMock = okFetch();
  const controller = new AbortController();
  const pending = checkVoice(
    audio,
    'mandarin',
    {
      baseUrl: 'https://api.test',
      getIdToken: async () => 'id-token',
      getAppCheckToken: () => new Promise<string | null>(() => undefined),
      fetch: fetchMock,
      isOnline: () => true,
    },
    controller.signal,
  );
  await Promise.resolve();
  await Promise.resolve();
  controller.abort();
  await expect(pending).resolves.toEqual({ kind: 'cancelled' });
  expect(fetchMock).not.toHaveBeenCalled();
});
