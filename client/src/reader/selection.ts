export interface Selection {
  key: string;
  anchor: number;
  start: number;
  end: number;
  open: boolean;
}

/** Touch keeps extend-on-tap; the dock uses desktop click and Shift+click conventions. */
export function pressSelection(previous: Selection | null, key: string, verse: number, docked: boolean, shift: boolean): Selection | null {
  const current = previous?.key === key && previous.open ? previous : null;
  if (current && (!docked || shift)) {
    return { ...current, start: Math.min(current.anchor, verse), end: Math.max(current.anchor, verse) };
  }
  if (docked && current?.start === verse && current.end === verse) return null;
  return { key, anchor: verse, start: verse, end: verse, open: true };
}
