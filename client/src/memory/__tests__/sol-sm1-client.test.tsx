import { APP_CHECK_WAIT_MS, checkVoice } from '../voice/voiceClient';
import { TRANSCRIBE_TIMEOUT_MS, type VoiceClientDeps } from '../voice/types';

function deferred<T>() {
  let resolve!: (value: T) => void;
  const promise = new Promise<T>((yes) => { resolve = yes; });
  return { promise, resolve };
}
function setup() {
  const fetchMock = jest.fn(async (_url: string, _init: RequestInit) => ({ status: 200, headers: { get: () => null }, json: async () => ({ text: 'answer' }) }));
  const deps: VoiceClientDeps = { baseUrl: 'https://voice.invalid', getIdToken: async () => 'synthetic-id-token', getAppCheckToken: async () => 'synthetic-app-check', isOnline: () => true, fetch: fetchMock as unknown as typeof fetch };
  return { deps, fetchMock, audio: new Blob(['audio'], { type: 'audio/webm' }) };
}
afterEach(() => jest.useRealTimers());

it('keeps the original 30-second deadline when App Check starts after a slow ID token', async () => {
  jest.useFakeTimers();
  const s = setup();
  const id = deferred<string | null>();
  const appCheck = deferred<string | null>();
  s.deps.getIdToken = () => id.promise;
  s.deps.getAppCheckToken = () => appCheck.promise;
  const outcome = checkVoice(s.audio, 'mandarin', s.deps);
  await jest.advanceTimersByTimeAsync(TRANSCRIBE_TIMEOUT_MS - 1000);
  id.resolve('synthetic-id-token');
  await jest.advanceTimersByTimeAsync(999);
  expect(s.fetchMock).not.toHaveBeenCalled();
  await jest.advanceTimersByTimeAsync(1);
  await expect(outcome).resolves.toEqual({ kind: 'timeout' });
  appCheck.resolve('synthetic-app-check');
  await jest.advanceTimersByTimeAsync(APP_CHECK_WAIT_MS);
  expect(s.fetchMock).not.toHaveBeenCalled();
  expect(jest.getTimerCount()).toBe(0);
});

it('Cancel wins during App Check and a late token never sends anything', async () => {
  jest.useFakeTimers();
  const s = setup();
  const appCheck = deferred<string | null>();
  const getAppCheckToken = jest.fn(() => appCheck.promise);
  s.deps.getAppCheckToken = getAppCheckToken;
  const controller = new AbortController();
  const outcome = checkVoice(s.audio, 'mandarin', s.deps, controller.signal);
  await jest.advanceTimersByTimeAsync(0);
  expect(getAppCheckToken).toHaveBeenCalledTimes(1);
  controller.abort();
  await expect(outcome).resolves.toEqual({ kind: 'cancelled' });
  appCheck.resolve('synthetic-app-check');
  await jest.advanceTimersByTimeAsync(TRANSCRIBE_TIMEOUT_MS);
  expect(s.fetchMock).not.toHaveBeenCalled();
  expect(jest.getTimerCount()).toBe(0);
});

it('places ID and App Check tokens only in request headers', async () => {
  const s = setup();
  const outcome = await checkVoice(s.audio, 'mandarin', s.deps);
  expect(outcome).toEqual({ kind: 'text', text: 'answer' });
  const [url, init] = s.fetchMock.mock.calls[0]!;
  expect(url).toBe('https://voice.invalid/memory/transcribe?lang=mandarin');
  expect(init.headers).toEqual({ 'Content-Type': 'audio/webm', Authorization: 'Bearer synthetic-id-token', 'X-Firebase-AppCheck': 'synthetic-app-check' });
  expect(init.body).toBe(s.audio);
  expect(JSON.stringify({ url, body: init.body, outcome })).not.toMatch(/synthetic-id-token|synthetic-app-check/);
});
