// The voice-attempt machine's session checks (SM-1 fix 1): the grade's own `confirm(signal)`, made after the grade's
// awaits (the speech keyer), and an auth change once the outcome has landed (the machine is confirming the session).
import { VoiceAttempts, type AttemptPhase } from '../voice/attempt';
import type { Recorder, VoiceOutcome } from '../voice/types';

function deferred<T>() {
  let resolve!: (value: T) => void;
  const promise = new Promise<T>((yes) => {
    resolve = yes;
  });
  return { promise, resolve };
}

const flush = async () => {
  for (let i = 0; i < 10; i++) await Promise.resolve();
};

const jwt = (sub: string, version: number) => `e30.${Buffer.from(JSON.stringify({ sub, version })).toString('base64url')}.sig`;

function setup(opts: { token?: string | null; fetchesToken?: boolean } = {}) {
  const recorder: Recorder & { cancel: jest.Mock } = {
    supported: true,
    permission: jest.fn(async () => 'granted' as const),
    start: jest.fn(async () => 'recording' as const),
    stop: jest.fn(async () => ({ blob: new Blob(['audio']), durationMs: 3000 })),
    cancel: jest.fn(),
  };
  const phases: AttemptPhase[] = [];
  let token: string | null = opts.token === undefined ? 'token' : opts.token;
  // Each grade waits here (the trainer's keyer) until the test lets it go, then reports what confirm said.
  let gate = deferred<void>();
  const confirmed: boolean[] = [];
  let machine!: VoiceAttempts;
  const signals: AbortSignal[] = [];
  const currentToken = jest.fn(async (): Promise<string | null> => token);
  machine = new VoiceAttempts({
    recorder,
    send: async (_audio, getIdToken): Promise<VoiceOutcome> => {
      if (opts.fetchesToken !== false) await getIdToken();
      return { kind: 'text', text: 'heard' };
    },
    currentToken,
    grade: async (_text, signal) => {
      signals.push(signal);
      await gate.promise;
      confirmed.push(await machine.confirm(signal));
    },
    onOutcome: jest.fn(),
    onRefused: jest.fn(),
    onPhase: (phase) => phases.push(phase),
    onTick: jest.fn(),
  });
  return {
    machine,
    phases,
    confirmed,
    signals,
    currentToken,
    setToken: (next: string | null) => {
      token = next;
    },
    release: async () => {
      gate.resolve();
      await flush();
      gate = deferred<void>();
    },
    send: async () => {
      await machine.start();
      // Stop settles only when the grade is over (the grade waits on `release`).
      void machine.stop();
      await flush();
    },
  };
}

describe('confirm', () => {
  it('is true while the session is still the request’s', async () => {
    const s = setup();
    await s.send();
    expect(s.machine.phase).toBe('grading');
    await s.release();
    expect(s.confirmed).toEqual([true]);
    expect(s.machine.phase).toBe('idle');
  });

  it.each([
    ['another opaque token', 'token', 'new-token'],
    ['a JWT of another user', jwt('alice', 1), jwt('bob', 1)],
    ['no token (signed out)', 'token', null],
  ] as const)('is false once the token is %s while the grade awaited', async (_name, before, after) => {
    const s = setup({ token: before });
    await s.send();
    s.setToken(after);
    await s.release();
    expect(s.confirmed).toEqual([false]);
    expect(s.machine.phase).toBe('idle');
  });

  it('is true across a refresh of the same user', async () => {
    const s = setup({ token: jwt('alice', 1) });
    await s.send();
    s.setToken(jwt('alice', 2));
    await s.release();
    expect(s.confirmed).toEqual([true]);
  });

  it('is false when the token read rejects', async () => {
    const s = setup();
    await s.send();
    s.currentToken.mockRejectedValueOnce(new Error('token service'));
    await s.release();
    expect(s.confirmed).toEqual([false]);
  });

  it('is false for a signal that is not the current attempt’s, and once the attempt has ended', async () => {
    const s = setup();
    expect(await s.machine.confirm(new AbortController().signal)).toBe(false);
    await s.send();
    const signal = s.signals[0]!;
    expect(await s.machine.confirm(new AbortController().signal)).toBe(false);
    s.machine.abort();
    expect(await s.machine.confirm(signal)).toBe(false);
  });

  it('is false, and ignores the late read, when the attempt ends while the token is being read', async () => {
    const s = setup();
    await s.send();
    const read = deferred<string | null>();
    s.currentToken.mockReturnValueOnce(read.promise);
    const confirm = s.machine.confirm(s.signals[0]!);
    s.machine.authChanged();
    expect(s.machine.phase).toBe('idle');
    await expect(confirm).resolves.toBe(false);
    read.resolve('token');
    await flush();
    expect(s.phases.filter((p) => p === 'idle')).toHaveLength(1);
  });

  it('keeps only liveness for a request that never fetched a token', async () => {
    const s = setup({ fetchesToken: false });
    await s.send();
    s.setToken('new-token');
    await s.release();
    expect(s.confirmed).toEqual([true]);
  });
});

describe('auth change after the outcome landed', () => {
  it('ends the attempt at once while the landing token read hangs; the late read is ignored', async () => {
    const s = setup();
    const read = deferred<string | null>();
    s.currentToken.mockResolvedValueOnce('token').mockReturnValueOnce(read.promise);
    await s.send();
    expect(s.machine.phase).toBe('sending');
    s.machine.authChanged();
    expect(s.machine.phase).toBe('idle');
    read.resolve('token');
    await flush();
    expect(s.signals).toHaveLength(0);
    expect(s.phases.filter((p) => p === 'idle')).toHaveLength(1);
    // The next attempt works.
    await s.send();
    await s.release();
    expect(s.confirmed).toEqual([true]);
  });

  it('keeps checking while the request itself is still out', async () => {
    const recorderToken = deferred<string | null>();
    const s = setup();
    s.currentToken.mockReturnValueOnce(recorderToken.promise);
    await s.send();
    expect(s.machine.phase).toBe('sending');
    s.machine.authChanged();
    expect(s.machine.phase).toBe('sending');
    recorderToken.resolve('token');
    await flush();
    expect(s.machine.phase).toBe('idle');
    expect(s.signals).toHaveLength(0);
  });
});
