import { checkVoice } from '../voice/voiceClient';

const flush = async () => { for (let i = 0; i < 24; i++) await Promise.resolve(); };

afterEach(() => { jest.restoreAllMocks(); jest.useRealTimers(); });

it('returns cancelled when the caller aborts between JSON race resolution and result delivery', async () => {
  // P2: the race checks the abort verdict before its awaiting continuation, which can still return text after Cancel.
  jest.useFakeTimers();
  let deliver!: (body: { text: string }) => void;
  const body = new Promise<{ text: string }>((resolve) => { deliver = resolve; });
  const json = jest.fn(() => body);
  const caller = new AbortController();
  const add = jest.spyOn(caller.signal, 'addEventListener');
  const remove = jest.spyOn(caller.signal, 'removeEventListener');
  const fetcher = jest.fn(async () => ({ status: 200, json }) as unknown as Response);
  const pending = checkVoice(new Blob(['voice'], { type: 'audio/webm' }), 'mandarin', {
    baseUrl: 'https://api.example', getIdToken: async () => 'token', isOnline: () => true, fetch: fetcher,
  }, caller.signal);
  await flush();
  expect(json).toHaveBeenCalledTimes(1);
  deliver({ text: 'recital' });
  await Promise.resolve();
  await Promise.resolve();
  caller.abort();
  const result = await pending;
  expect(jest.getTimerCount()).toBe(0);
  expect(remove).toHaveBeenCalledWith('abort', add.mock.calls[0]![1]);
  expect(result).toEqual({ kind: 'cancelled' });
});
