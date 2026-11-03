// The voice-attempt machine (SM-1, memory/voice/attempt.ts), without React: its phases, which events each phase
// takes, and that every way an attempt ends returns to idle exactly once (the mic always comes back).
import { VoiceAttempts, type AttemptDeps, type AttemptPhase } from '../voice/attempt';
import type { Recorder, RecorderStartOptions, Recording, VoiceOutcome } from '../voice/types';

function deferred<T>() {
  let resolve!: (value: T) => void;
  let reject!: (reason: unknown) => void;
  const promise = new Promise<T>((yes, no) => {
    resolve = yes;
    reject = no;
  });
  return { promise, resolve, reject };
}

const flush = async () => {
  for (let i = 0; i < 10; i++) await Promise.resolve();
};

const recording = (): Recording => ({ blob: new Blob(['audio']), durationMs: 3000 });

function setup(over: Pick<AttemptDeps, 'scope'> = {}) {
  const started: RecorderStartOptions[] = [];
  const recorder: Recorder & { start: jest.Mock; stop: jest.Mock; cancel: jest.Mock } = {
    supported: true,
    permission: jest.fn(async () => 'granted' as const),
    start: jest.fn(async (o: RecorderStartOptions) => {
      started.push(o);
      return 'recording' as const;
    }),
    stop: jest.fn(async () => recording()),
    cancel: jest.fn(),
  };
  const phases: AttemptPhase[] = [];
  const signals: AbortSignal[] = [];
  let token: string | null = 'token';
  const deps = {
    recorder,
    send: jest.fn<Promise<VoiceOutcome>, [Blob, () => Promise<string | null>, AbortSignal]>(async (_audio, getIdToken) => {
      await getIdToken();
      return { kind: 'text', text: 'heard' };
    }),
    currentToken: jest.fn(async () => token),
    grade: jest.fn(async (_text: string, signal: AbortSignal) => {
      signals.push(signal);
    }),
    onOutcome: jest.fn(),
    onRefused: jest.fn(),
    onPhase: jest.fn((phase: AttemptPhase) => phases.push(phase)),
    onTick: jest.fn(),
    ...over,
  };
  const machine = new VoiceAttempts(deps);
  return {
    machine,
    deps,
    recorder,
    phases,
    signals,
    idles: () => phases.filter((p) => p === 'idle').length,
    setToken: (next: string | null) => {
      token = next;
    },
    /** The latest attempt's recorder callbacks, or the n-th attempt's. */
    tick: (ms: number, n = started.length - 1) => started[n]!.onTick?.(ms),
    autoStop: (n = started.length - 1) => started[n]!.onAutoStop(recording()),
  };
}

describe('phases', () => {
  it('Mic, Stop, send, grade, idle', async () => {
    const s = setup();
    await s.machine.start();
    expect(s.machine.phase).toBe('recording');
    await s.machine.stop();
    await flush();
    expect(s.phases).toEqual(['starting', 'recording', 'stopping', 'sending', 'grading', 'idle']);
    expect(s.deps.grade).toHaveBeenCalledWith('heard', expect.any(Object));
    expect(s.deps.onOutcome).toHaveBeenCalledWith({ kind: 'text', text: 'heard' }, 'token');
    expect(s.machine.phase).toBe('idle');
    expect(s.machine.current).toBeNull();
  });

  it('auto-stop sends the recording', async () => {
    const s = setup();
    await s.machine.start();
    s.autoStop();
    await flush();
    expect(s.phases).toEqual(['starting', 'recording', 'sending', 'grading', 'idle']);
    expect(s.deps.send).toHaveBeenCalledTimes(1);
  });

  it.each(['denied', 'unsupported'] as const)('a recorder that answers %s returns to idle and says so', async (result) => {
    const s = setup();
    s.recorder.start.mockResolvedValueOnce(result);
    await s.machine.start();
    expect(s.phases).toEqual(['starting', 'idle']);
    expect(s.deps.onRefused).toHaveBeenCalledWith(result);
  });

  it('a recorder that throws on start returns to idle', async () => {
    const s = setup();
    s.recorder.start.mockRejectedValueOnce(new Error('boom'));
    await s.machine.start();
    expect(s.phases).toEqual(['starting', 'idle']);
    expect(s.deps.onRefused).not.toHaveBeenCalled();
  });

  it('nothing recorded on Stop returns to idle without sending', async () => {
    const s = setup();
    s.recorder.stop.mockResolvedValueOnce(null);
    await s.machine.start();
    await s.machine.stop();
    expect(s.phases).toEqual(['starting', 'recording', 'stopping', 'idle']);
    expect(s.deps.send).not.toHaveBeenCalled();
  });

  it.each<VoiceOutcome>([
    { kind: 'too-long' },
    { kind: 'timeout' },
    { kind: 'error' },
    { kind: 'offline' },
    { kind: 'no-service' },
    { kind: 'limit', retryAfterS: 60, window: 'minute' },
    { kind: 'signed-out' },
  ])('a $kind outcome is reported and ends the attempt without grading', async (outcome) => {
    const s = setup();
    s.deps.send.mockImplementationOnce(async (_a, getIdToken) => {
      await getIdToken();
      return outcome;
    });
    await s.machine.start();
    await s.machine.stop();
    await flush();
    expect(s.deps.onOutcome).toHaveBeenCalledWith(outcome, 'token');
    expect(s.deps.grade).not.toHaveBeenCalled();
    expect(s.idles()).toBe(1);
  });

  it('a send that throws reads as an error', async () => {
    const s = setup();
    s.deps.send.mockRejectedValueOnce(new Error('network'));
    await s.machine.start();
    await s.machine.stop();
    await flush();
    expect(s.deps.onOutcome).toHaveBeenCalledWith({ kind: 'error' }, null);
    expect(s.idles()).toBe(1);
  });

  it('a grade that throws still returns to idle once', async () => {
    const s = setup();
    s.deps.grade.mockRejectedValueOnce(new Error('grader'));
    await s.machine.start();
    await s.machine.stop();
    await flush();
    expect(s.phases.at(-1)).toBe('idle');
    expect(s.idles()).toBe(1);
  });
});

describe('which events each phase takes', () => {
  it('Mic does nothing unless idle', async () => {
    const s = setup();
    await s.machine.start();
    await s.machine.start();
    expect(s.recorder.start).toHaveBeenCalledTimes(1);
  });

  it('Stop does nothing unless recording; a double Stop sends once', async () => {
    const s = setup();
    await s.machine.stop();
    expect(s.recorder.stop).not.toHaveBeenCalled();
    await s.machine.start();
    await Promise.all([s.machine.stop(), s.machine.stop()]);
    await flush();
    expect(s.recorder.stop).toHaveBeenCalledTimes(1);
    expect(s.deps.send).toHaveBeenCalledTimes(1);
  });

  it('Stop racing the auto-stop sends once, whichever comes first', async () => {
    const a = setup();
    await a.machine.start();
    const stopping = a.machine.stop();
    a.autoStop();
    await stopping;
    await flush();
    expect(a.deps.send).toHaveBeenCalledTimes(1);

    const b = setup();
    await b.machine.start();
    b.autoStop();
    await b.machine.stop();
    await flush();
    expect(b.recorder.stop).not.toHaveBeenCalled();
    expect(b.deps.send).toHaveBeenCalledTimes(1);
  });

  it('ticks reach the panel only while the attempt records', async () => {
    const s = setup();
    await s.machine.start();
    s.tick(1000);
    s.machine.abort();
    s.tick(2000);
    expect(s.deps.onTick.mock.calls).toEqual([[1000]]);
  });

  it("an older attempt's tick, auto-stop and outcome are ignored by identity", async () => {
    const s = setup();
    const outcome = deferred<VoiceOutcome>();
    s.deps.send.mockReturnValueOnce(outcome.promise);
    await s.machine.start();
    s.autoStop(); // attempt 1 is sending
    s.machine.abort();
    await s.machine.start(); // attempt 2 records (the harness now holds its options)
    const before = s.phases.length;
    s.tick(5000, 0);
    s.autoStop(0);
    outcome.resolve({ kind: 'text', text: 'late' });
    await flush();
    expect(s.phases.length).toBe(before);
    expect(s.machine.phase).toBe('recording');
    expect(s.deps.grade).not.toHaveBeenCalled();
  });
});

describe('ending an attempt: idle exactly once, whatever the phase', () => {
  /** An attempt held in `phase`; `release` lets every pending step settle (late, for an attempt already ended). */
  async function inPhase(phase: Exclude<AttemptPhase, 'idle'>, scope?: AbortSignal) {
    const s = setup(scope ? { scope } : {});
    const start = deferred<'recording'>();
    const stop = deferred<Recording | null>();
    const sent = deferred<VoiceOutcome>();
    const graded = deferred<void>();
    s.recorder.start.mockImplementationOnce(async () => (phase === 'starting' ? start.promise : 'recording'));
    s.recorder.stop.mockImplementationOnce(() => (phase === 'stopping' ? stop.promise : Promise.resolve(recording())));
    s.deps.send.mockImplementationOnce(async (_a, getIdToken) => {
      await getIdToken();
      return phase === 'sending' ? sent.promise : { kind: 'text', text: 'heard' };
    });
    s.deps.grade.mockImplementationOnce(async (_t, signal) => {
      s.signals.push(signal);
      return graded.promise;
    });
    void s.machine.start();
    await flush();
    if (phase !== 'starting' && phase !== 'recording') void s.machine.stop();
    await flush();
    expect(s.machine.phase).toBe(phase);
    return { s, release: () => {
      start.resolve('recording');
      stop.resolve(recording());
      sent.resolve({ kind: 'text', text: 'heard' });
      graded.resolve();
    } };
  }

  it.each(['starting', 'recording', 'stopping', 'sending', 'grading'] as const)('Cancel while %s', async (phase) => {
    const { s, release } = await inPhase(phase);
    s.machine.abort();
    expect(s.machine.phase).toBe('idle');
    expect(s.recorder.cancel).toHaveBeenCalledTimes(['starting', 'recording', 'stopping'].includes(phase) ? 1 : 0);
    if (phase === 'grading') expect(s.signals[0]!.aborted).toBe(true);
    release();
    await flush();
    expect(s.idles()).toBe(1);
    expect(s.phases.at(-1)).toBe('idle');
    // A mic opened by the dead attempt's start is closed again.
    if (phase === 'starting') expect(s.recorder.cancel).toHaveBeenCalledTimes(2);
    if (phase !== 'grading') expect(s.deps.grade).not.toHaveBeenCalled();
    // And the next attempt works.
    await s.machine.start();
    expect(s.machine.phase).toBe('recording');
  });

  it.each(['starting', 'recording', 'stopping', 'sending', 'grading'] as const)('the scope leaving while %s', async (phase) => {
    const scope = new AbortController();
    const { s, release } = await inPhase(phase, scope.signal);
    scope.abort();
    expect(s.machine.phase).toBe('idle');
    release();
    await flush();
    expect(s.idles()).toBe(1);
    await s.machine.start();
    expect(s.machine.phase).toBe('idle');
    expect(s.recorder.start).toHaveBeenCalledTimes(1);
  });

  it.each(['starting', 'recording', 'stopping', 'grading'] as const)('an auth change while %s ends it at once', async (phase) => {
    const { s, release } = await inPhase(phase);
    s.machine.authChanged();
    expect(s.machine.phase).toBe('idle');
    release();
    await flush();
    expect(s.idles()).toBe(1);
    expect(s.deps.onOutcome).toHaveBeenCalledTimes(phase === 'grading' ? 1 : 0);
  });

  it('an auth change while sending aborts the request; the outcome is dropped when it settles', async () => {
    const { s, release } = await inPhase('sending');
    const signal = s.deps.send.mock.calls[0]![2];
    s.machine.authChanged();
    expect(signal.aborted).toBe(true);
    expect(s.machine.phase).toBe('sending');
    release();
    await flush();
    expect(s.machine.phase).toBe('idle');
    expect(s.idles()).toBe(1);
    expect(s.deps.onOutcome).not.toHaveBeenCalled();
    expect(s.deps.grade).not.toHaveBeenCalled();
  });

  it('Cancel after an auth change while sending returns to idle at once, once', async () => {
    const { s, release } = await inPhase('sending');
    s.machine.authChanged();
    s.machine.abort();
    expect(s.machine.phase).toBe('idle');
    release();
    await flush();
    expect(s.idles()).toBe(1);
  });

  it.each(['starting', 'recording', 'stopping', 'sending', 'grading'] as const)('unmount while %s: nothing moves afterwards', async (phase) => {
    const { s, release } = await inPhase(phase);
    s.machine.dispose();
    const before = s.phases.length;
    release();
    await flush();
    expect(s.phases.length).toBe(before);
    expect(s.deps.onOutcome).toHaveBeenCalledTimes(phase === 'grading' ? 1 : 0);
    await s.machine.start();
    expect(s.recorder.start).toHaveBeenCalledTimes(1);
  });
});

describe('the session an outcome is for', () => {
  const sub = (uid: string, iat: number) => {
    const part = (o: object) => Buffer.from(JSON.stringify(o)).toString('base64').replace(/=+$/, '').replace(/\+/g, '-').replace(/\//g, '_');
    return `${part({ alg: 'RS256' })}.${part({ sub: uid, iat })}.sig`;
  };

  async function sendWith(sentToken: string | null, now: () => Promise<string | null>, outcome: VoiceOutcome = { kind: 'text', text: 'heard' }) {
    const s = setup();
    let first = true;
    s.deps.currentToken.mockImplementation(async () => {
      if (first) {
        first = false;
        return sentToken;
      }
      return now();
    });
    s.deps.send.mockImplementationOnce(async (_a, getIdToken) => {
      await getIdToken();
      return outcome;
    });
    await s.machine.start();
    await s.machine.stop();
    await flush();
    return s;
  }

  it('is applied while the token is the same', async () => {
    const s = await sendWith('a', async () => 'a');
    expect(s.deps.grade).toHaveBeenCalledTimes(1);
  });

  it('is applied after a refresh of the same user', async () => {
    const s = await sendWith(sub('alice', 1), async () => sub('alice', 3601));
    expect(s.deps.grade).toHaveBeenCalledTimes(1);
  });

  const otherSessions: [string, string, () => Promise<string | null>][] = [
    ['another token', 'a', async () => 'b'],
    ['another user', sub('alice', 1), async () => sub('bob', 1)],
    ['no token now', 'a', async () => null],
    ['a token read that fails', 'a', () => Promise.reject(new Error('auth'))],
  ];
  it.each(otherSessions)('is dropped for %s: nothing shown, idle', async (_name, sent, now) => {
    const s = await sendWith(sent, now, { kind: 'signed-out' });
    expect(s.deps.onOutcome).not.toHaveBeenCalled();
    expect(s.deps.grade).not.toHaveBeenCalled();
    expect(s.idles()).toBe(1);
  });

  it('a null-token outcome applies while still signed out, not after a sign-in', async () => {
    const out = await sendWith(null, async () => null, { kind: 'signed-out' });
    expect(out.deps.onOutcome).toHaveBeenCalledWith({ kind: 'signed-out' }, null);
    const dropped = await sendWith(null, async () => 'fresh', { kind: 'signed-out' });
    expect(dropped.deps.onOutcome).not.toHaveBeenCalled();
  });

  it('a 401 that never asked for a token is held against the token now', async () => {
    const s = setup();
    s.deps.send.mockResolvedValueOnce({ kind: 'signed-out' });
    await s.machine.start();
    await s.machine.stop();
    await flush();
    expect(s.deps.currentToken).toHaveBeenCalledTimes(1);
    expect(s.deps.onOutcome).toHaveBeenCalledWith({ kind: 'signed-out' }, 'token');
  });

  it('an early outcome that never asked for a token reads no token', async () => {
    const s = setup();
    s.deps.send.mockResolvedValueOnce({ kind: 'offline' });
    await s.machine.start();
    await s.machine.stop();
    await flush();
    expect(s.deps.currentToken).not.toHaveBeenCalled();
    expect(s.deps.onOutcome).toHaveBeenCalledWith({ kind: 'offline' }, null);
  });

  it('a Cancel during the landing token read wins', async () => {
    const s = setup();
    const now = deferred<string | null>();
    let calls = 0;
    s.deps.currentToken.mockImplementation(() => (++calls === 1 ? Promise.resolve('a') : now.promise));
    await s.machine.start();
    void s.machine.stop();
    await flush();
    expect(s.machine.phase).toBe('sending');
    s.machine.abort();
    now.resolve('a');
    await flush();
    expect(s.deps.onOutcome).not.toHaveBeenCalled();
    expect(s.idles()).toBe(1);
  });
});
