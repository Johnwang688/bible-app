// Whether the mic can be offered, and what the app remembers about the voice service this session. The gate
// is pure; the session memory is one module-level value shared by every trainer.
import { useSyncExternalStore } from 'react';
import type { VoiceGate, VoiceGateInput, VoiceOutcome, VoiceSessionState } from './types';

/** The first check that fails stands in the mic's place as a notice; typing is then the main action. */
export function voiceGate(input: VoiceGateInput): VoiceGate {
  if (!input.voiceOn) return { kind: 'notice', notice: 'voice-off' };
  if (!input.supported) return { kind: 'notice', notice: 'unsupported' };
  if (!input.signedIn) return { kind: 'notice', notice: 'signed-out' };
  if (!input.online) return { kind: 'notice', notice: 'offline' };
  if (input.serviceDown) return { kind: 'notice', notice: 'no-service' };
  if (input.limitedUntil !== null && input.limitedUntil > input.now) {
    return { kind: 'notice', notice: 'limit', retryAfterS: Math.ceil((input.limitedUntil - input.now) / 1000) };
  }
  if (input.permission === 'denied') return { kind: 'notice', notice: 'denied' };
  return { kind: 'ready' };
}

// ---------------------------------------------------------------------------------------------------------
// Session memory
// ---------------------------------------------------------------------------------------------------------

const INITIAL: VoiceSessionState = { serviceDown: false, limitedUntil: null };

let session: VoiceSessionState = INITIAL;
const listeners = new Set<() => void>();

function setSession(next: VoiceSessionState): void {
  session = next;
  for (const listener of [...listeners]) listener();
}

/** The current value; a new object after every change, so `useSyncExternalStore` sees it. */
export function getVoiceSession(): VoiceSessionState {
  return session;
}

/** Remembers a 503 for the session and a 429 until its Retry-After passes; every other outcome changes nothing. */
export function recordVoiceOutcome(outcome: VoiceOutcome, now: number): void {
  if (outcome.kind === 'no-service') {
    if (!session.serviceDown) setSession({ ...session, serviceDown: true });
  } else if (outcome.kind === 'limit') {
    const limitedUntil = now + outcome.retryAfterS * 1000;
    if (session.limitedUntil !== limitedUntil) setSession({ ...session, limitedUntil });
  }
}

export function subscribeVoiceSession(listener: () => void): () => void {
  listeners.add(listener);
  return () => {
    listeners.delete(listener);
  };
}

export function useVoiceSession(): VoiceSessionState {
  return useSyncExternalStore(subscribeVoiceSession, getVoiceSession, getVoiceSession);
}

export function resetVoiceSessionForTesting(): void {
  setSession({ ...INITIAL });
}
