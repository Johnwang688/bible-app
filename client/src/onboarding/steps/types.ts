// What the flow hands each step.
import type { AgeRange } from '../keys';

/** The age step's choice: a band, "Prefer not to say" (stores no age), or nothing yet. */
export type AgeChoice = AgeRange | 'none' | null;

export interface StepProps {
  /** True when the step was reached from another step: its heading takes focus on the web. */
  announce: boolean;
  /** The primary button: on to the next step (or finish, on the last). */
  onNext(): void;
  /** The header's Skip / Skip for now. */
  onSkip(): void;
  /** Back one step; undefined on step 1. */
  onBack?: () => void;
}
