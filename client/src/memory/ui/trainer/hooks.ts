// Small hooks the trainers share: layout, and the attempt a graded answer belongs to.
import { useEffect, useRef, useState } from 'react';
import { Keyboard, useWindowDimensions } from 'react-native';

/** The phone's text size is well above normal: the compact mic row and the in-flow action panel. */
const LARGE_TEXT_SCALE = 1.15;

export function useLargeText(): boolean {
  return useWindowDimensions().fontScale > LARGE_TEXT_SCALE;
}

/** Whether the on-screen keyboard is open (native only; the web never fires these events). */
export function useKeyboardOpen(): boolean {
  const [open, setOpen] = useState(false);
  useEffect(() => {
    const show = Keyboard.addListener('keyboardDidShow', () => setOpen(true));
    const hide = Keyboard.addListener('keyboardDidHide', () => setOpen(false));
    return () => {
      show.remove();
      hide.remove();
    };
  }, []);
  return open;
}

// ---- the attempt ------------------------------------------------------------------------------------------------
// Whether a graded answer records progress, and what it shows, is decided by the attempt as it stands when the grade
// lands, never by state captured when the recording started or the answer was sent: the grade awaits (the server
// check in VoicePanel, the speech keyer here) and the recorder's auto-stop holds the closure of an older render.
// The voice side of the same rule is the attempt machine (voice/attempt.ts): it aborts the signal a voice answer is
// graded with whenever that attempt ends, so a ticket begun with it dies with it.

/** One answer being graded. */
export interface GradeTicket {
  /**
   * Still the answer of the attempt on screen: not cancelled, not overtaken by a new round, not left. Check it after
   * every await of the grade and right before recording.
   */
  live(): boolean;
  /**
   * `live()`, and for a voice answer also that the sign-in session is still the one its request went out for (the
   * current token is re-read through the latest auth). Await it after the grade's own awaits (the speech keyer) and
   * before grading, recording or showing anything; a typed answer's resolves at once. False once the ticket is dead,
   * whatever the token read gives later.
   */
  confirm(): Promise<boolean>;
  /** Releases the grading latch (a no-op once the ticket is no longer the pending one). */
  done(): void;
}

export interface Attempt {
  /** Whether a hint (or the peek) was opened at any point in this attempt. Read it when the grade lands. */
  hinted(): boolean;
  /** The Hint press: the attempt counts as hinted at once, not from the next render. */
  markHinted(): void;
  /**
   * Starts grading an answer, or returns null while another answer of this attempt is still being graded (a double
   * submit, a typed answer racing a voice one). `signal` is the answer's own: the panel aborts it on Cancel and when
   * it unmounts, which voids the grade and frees the latch for the next answer. `confirm` is the voice attempt's
   * session check (absent for a typed answer). Returns null too once the step's scope is left: an answer submitted
   * after Back, Skip or Next grades nothing.
   */
  begin(signal?: AbortSignal, confirm?: () => Promise<boolean>): GradeTicket | null;
  /**
   * Ends the attempt for a new round: a pending grade becomes a no-op. A fresh attempt (Try again, Again without the
   * hint) clears hint use; a typed correction (`keepHint`) is the same attempt answered again, so hint use stays.
   */
  newRound(keepHint: boolean): void;
}

interface AttemptState {
  /** Bumped by every new round and by unmounting; a ticket from an earlier epoch is void. */
  epoch: number;
  hinted: boolean;
  pending: GradeTicket | null;
}

/**
 * The attempt a fill-in or full recall trainer is on; one object for the trainer's life. `left` is the lesson scope
 * (`TrainerCtx.left`): a grade pending when it aborts (Back, Skip, Next) is void, read synchronously, so it holds
 * before navigation unmounts the screen. (`ctx.record` is a no-op once left, whatever grades afterwards.)
 */
export function useAttempt(left?: AbortSignal): Attempt {
  const state = useRef<AttemptState>({ epoch: 0, hinted: false, pending: null });
  useEffect(() => {
    const s = state.current;
    return () => {
      // Leaving voids whatever is still being graded.
      s.epoch++;
      s.pending = null;
    };
  }, []);
  const [attempt] = useState<Attempt>(() => ({
    hinted: () => state.current.hinted,
    markHinted: () => {
      state.current.hinted = true;
    },
    begin: (signal, confirm) => {
      const s = state.current;
      // The scope is the trainer's for its whole life (the lesson screen keys both on the step): once left, nothing
      // more is graded here.
      if (left?.aborted || signal?.aborted) return null;
      if (s.pending?.live()) return null;
      const epoch = s.epoch;
      const ticket: GradeTicket = {
        live: () => s.epoch === epoch && s.pending === ticket && !(signal?.aborted ?? false) && !(left?.aborted ?? false),
        confirm: async () => {
          if (!ticket.live()) return false;
          if (confirm !== undefined && !(await confirm().catch(() => false))) return false;
          return ticket.live();
        },
        done: () => {
          if (s.pending === ticket) s.pending = null;
        },
      };
      s.pending = ticket;
      return ticket;
    },
    newRound: (keepHint) => {
      const s = state.current;
      s.epoch++;
      s.pending = null;
      if (!keepHint) s.hinted = false;
    },
  }));
  return attempt;
}
