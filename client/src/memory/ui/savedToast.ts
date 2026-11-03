// "Progress saved": a trainer notes it when the reader backs out mid-lesson, and Memory home shows it once on return.
// Module state, so it survives the navigation between the two screens.
let pending: { step: number; total: number } | null = null;

export function noteProgressSaved(step: number, total: number): void {
  pending = { step, total };
}

/** Returns what was noted and clears it, so it shows once. */
export function takeProgressSaved(): { step: number; total: number } | null {
  const value = pending;
  pending = null;
  return value;
}
