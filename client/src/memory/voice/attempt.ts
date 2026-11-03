// One voice attempt at a time, from the Mic press to the end of its grade (React-free; VoicePanel is a thin adapter).
//
// The rule: a voice answer, and the progress it records, belongs to the attempt on screen *when it is graded*. So
// every attempt is an object with its own AbortController, and only the current one may move the panel:
//
//   idle --start--> starting --recorder 'recording'--> recording --stop--> stopping --recording--> sending
//                     |  'denied' / 'unsupported' -> idle         |  --auto-stop (30 s)------------> sending
//                                                                            stopping --nothing recorded--> idle
//   sending --outcome (token still the session's)--> text: grading --grade over--> idle;  other: idle (reported)
//   sending --outcome for another session, or the attempt ended--> idle (dropped: nothing shown or recorded)
//
// `abort()` (recording Cancel, checking Cancel, Try again, the lesson scope leaving) ends the current attempt in any
// phase at once: its recorder is cancelled, its request and its grade see the signal abort. `dispose()` (unmount)
// does the same and starts nothing again. `authChanged()` (the auth generation moved) aborts it too; only a send
// already in flight keeps the panel checking until the request settles (the client returns `cancelled` as soon as it
// sees the abort), and that outcome is then dropped. Events of an attempt that is no longer the current, live one
// (a tick, an auto-stop, a recorder result, an outcome, the end of a grade) are ignored by identity, so whatever the
// order of events, each attempt returns the panel to idle exactly once.
import { sameSession } from './session';
import { MAX_RECORDING_MS, type Recorder, type Recording, type VoiceOutcome } from './types';

export type AttemptPhase = 'idle' | 'starting' | 'recording' | 'stopping' | 'sending' | 'grading';

export interface AttemptDeps {
  recorder: Recorder;
  /** Defaults to MAX_RECORDING_MS. */
  maxMs?: number;
  /**
   * Sends a recording (the voice client). `getIdToken` is the machine's: use it for the request's token, so the
   * machine knows which session the outcome is for. Never throws in practice; a throw reads as `error`.
   */
  send(audio: Blob, getIdToken: () => Promise<string | null>, signal: AbortSignal): Promise<VoiceOutcome>;
  /** The current ID token, read through the latest auth. May reject (a token-service failure). */
  currentToken(): Promise<string | null>;
  /** Grades a transcript; settles when the grade is over. `signal` aborts when the attempt stops being current. */
  grade(text: string, signal: AbortSignal): void | Promise<void>;
  /**
   * An outcome that belongs to the attempt on screen (any kind, before a transcript is graded). `token` is the token
   * the request went out with, or for a 401 that never asked for one the session's token now (the 401 latch).
   */
  onOutcome(outcome: VoiceOutcome, token: string | null): void;
  /** The recorder could not start: the mic was refused, or this device can't record. */
  onRefused(result: 'denied' | 'unsupported'): void;
  /** The phase moved (the only way the panel's mode changes). */
  onPhase(phase: AttemptPhase): void;
  /** Elapsed recording time of the current attempt. */
  onTick(elapsedMs: number): void;
  /** The lesson scope: once it aborts the current attempt is aborted and none starts. */
  scope?: AbortSignal;
}

interface Run {
  readonly id: number;
  phase: Exclude<AttemptPhase, 'idle'>;
  readonly controller: AbortController;
}

const ERROR: VoiceOutcome = { kind: 'error' };
const RECORDER_PHASES: readonly AttemptPhase[] = ['starting', 'recording', 'stopping'];

export class VoiceAttempts {
  private run: Run | null = null;
  private seq = 0;
  private disposed = false;
  private readonly onScopeLeft = () => this.abort();

  constructor(private readonly deps: AttemptDeps) {
    deps.scope?.addEventListener('abort', this.onScopeLeft);
  }

  get phase(): AttemptPhase {
    return this.run?.phase ?? 'idle';
  }

  /** The current attempt's id, or null when idle (for tests and logs). */
  get current(): number | null {
    return this.run?.id ?? null;
  }

  /** Mic press: starts recording when idle. */
  async start(): Promise<void> {
    if (this.run !== null || this.disposed || this.deps.scope?.aborted) return;
    const run: Run = { id: ++this.seq, phase: 'starting', controller: new AbortController() };
    this.run = run;
    this.deps.onPhase('starting');
    let result: 'recording' | 'denied' | 'unsupported' | null;
    try {
      result = await this.deps.recorder.start({
        maxMs: this.deps.maxMs ?? MAX_RECORDING_MS,
        onTick: (ms) => {
          if (this.live(run) && RECORDER_PHASES.includes(run.phase)) this.deps.onTick(ms);
        },
        onAutoStop: (recording) => this.autoStop(run, recording),
      });
    } catch {
      result = null;
    }
    if (!this.live(run) || run.phase !== 'starting') {
      // Ended while the recorder started (Cancel, unmount, leaving), or auto-stopped already: a mic left open by a
      // dead attempt is closed.
      if (result === 'recording' && run.phase === 'starting') this.deps.recorder.cancel();
      return;
    }
    if (result === 'recording') this.move(run, 'recording');
    else {
      this.end(run);
      if (result !== null) this.deps.onRefused(result);
    }
  }

  /** Stop press: the recording is sent. A second press, or one racing the auto-stop, does nothing. */
  async stop(): Promise<void> {
    const run = this.run;
    if (run === null || run.phase !== 'recording' || !this.live(run)) return;
    this.move(run, 'stopping');
    let recording: Recording | null;
    try {
      recording = await this.deps.recorder.stop();
    } catch {
      recording = null;
    }
    // An auto-stop can't have moved it on (it is ignored while stopping), but Cancel or leaving can have ended it.
    if (!this.live(run) || (run.phase as AttemptPhase) !== 'stopping') return;
    if (recording === null) this.end(run);
    else await this.send(run, recording.blob);
  }

  /**
   * Ends the current attempt in whatever phase it is (Cancel, Try again, leaving). Acts on the live attempt, so a
   * Cancel from an older render (the recording block's, after the auto-stop moved on to the grade) still voids it.
   */
  abort(): void {
    const run = this.run;
    if (run === null) return;
    this.kill(run);
    this.end(run);
  }

  /**
   * The auth generation moved (sign-out, sign-in, another user). The attempt is aborted: nothing it sends back is
   * shown, graded or recorded. A send in flight keeps the panel checking until the request settles.
   */
  authChanged(): void {
    const run = this.run;
    if (run === null) return;
    const sending = run.phase === 'sending';
    this.kill(run);
    if (!sending) this.end(run);
  }

  /** Unmount: the current attempt is aborted and nothing starts again. */
  dispose(): void {
    const run = this.run;
    this.disposed = true;
    this.run = null;
    if (run !== null) this.kill(run);
    this.deps.scope?.removeEventListener('abort', this.onScopeLeft);
  }

  // ---- internals ------------------------------------------------------------------------------------------------

  private live(run: Run): boolean {
    return this.run === run && !this.disposed && !run.controller.signal.aborted && !(this.deps.scope?.aborted ?? false);
  }

  private move(run: Run, phase: Run['phase']): void {
    if (this.run !== run) return;
    run.phase = phase;
    this.deps.onPhase(phase);
  }

  /** The attempt's one way back to idle (a no-op once it is no longer current). */
  private end(run: Run): void {
    if (this.run !== run) return;
    this.run = null;
    if (!this.disposed) this.deps.onPhase('idle');
  }

  private kill(run: Run): void {
    const recording = RECORDER_PHASES.includes(run.phase);
    run.controller.abort();
    if (recording) this.deps.recorder.cancel();
  }

  private autoStop(run: Run, recording: Recording): void {
    // While stopping, the Stop press already has the recording: it is sent once.
    if (!this.live(run) || (run.phase !== 'recording' && run.phase !== 'starting')) return;
    void this.send(run, recording.blob);
  }

  private async send(run: Run, audio: Blob): Promise<void> {
    this.move(run, 'sending');
    // The token this request actually went out with: the outcome is applied only while the session is still its.
    let sent: { token: string | null } | null = null;
    const getIdToken = async (): Promise<string | null> => {
      const token = await this.deps.currentToken();
      sent = { token };
      return token;
    };
    let outcome: VoiceOutcome;
    try {
      outcome = await this.deps.send(audio, getIdToken, run.controller.signal);
    } catch {
      outcome = ERROR;
    }
    if (!this.live(run)) return this.end(run);

    let token: string | null = null;
    const request = sent as { token: string | null } | null;
    if (request !== null) {
      // Landed: is the session still the one the request was sent for? A refresh of the same user is.
      let now: string | null | undefined;
      try {
        now = await this.deps.currentToken();
      } catch {
        now = undefined; // the session can't be read: it is gone
      }
      if (!this.live(run)) return this.end(run);
      if (now === undefined || !sameSession(request.token, now)) return this.end(run);
      token = request.token;
    } else if (outcome.kind === 'signed-out') {
      // A 401 from a request that never asked for a token is held against the session's token now.
      token = await this.deps.currentToken().catch(() => null);
      if (!this.live(run)) return this.end(run);
    }

    this.deps.onOutcome(outcome, token);
    if (outcome.kind !== 'text') return this.end(run);
    this.move(run, 'grading');
    try {
      await this.deps.grade(outcome.text, run.controller.signal);
    } catch {
      // A grade that throws still ends the attempt.
    } finally {
      this.end(run);
    }
  }
}
