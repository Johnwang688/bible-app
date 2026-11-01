// CUV marks alternate readings inline as 〔…〕. Splitting them out lets the UI draw them smaller.

export interface TextRun {
  text: string;
  note: boolean;
}

const OPEN = '〔';
const CLOSE = '〕';

/**
 * Splits text into plain and 〔note〕 runs (brackets stay in the note). Brackets nest: a note runs from an
 * opening bracket at depth 0 to its matching closing bracket. An opening bracket that is never matched, and
 * everything after it, stays plain; so does a stray closing bracket. Empty runs are dropped and adjacent
 * plain runs are merged.
 */
export function splitAlternateReadings(text: string): TextRun[] {
  const runs: TextRun[] = [];
  const push = (t: string, note: boolean) => {
    if (!t) return;
    const last = runs[runs.length - 1];
    if (!note && last && !last.note) last.text += t;
    else runs.push({ text: t, note });
  };
  let plainStart = 0;
  let noteStart = -1;
  let depth = 0;
  for (let i = 0; i < text.length; i++) {
    const ch = text[i];
    if (ch === OPEN) {
      if (depth === 0) noteStart = i;
      depth++;
    } else if (ch === CLOSE && depth > 0) {
      depth--;
      if (depth === 0) {
        push(text.slice(plainStart, noteStart), false);
        push(text.slice(noteStart, i + 1), true);
        plainStart = i + 1;
      }
    }
  }
  // Anything still open never matched: the rest, from plainStart, stays plain.
  push(text.slice(plainStart), false);
  return runs;
}
