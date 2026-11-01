// CUV marks alternate readings inline as 〔…〕. Splitting them out lets the UI draw them smaller.

export interface TextRun {
  text: string;
  note: boolean;
}

/** Splits text into plain and 〔note〕 runs (brackets stay in the note). Empty runs are dropped. */
export function splitAlternateReadings(text: string): TextRun[] {
  const runs: TextRun[] = [];
  const push = (t: string, note: boolean) => {
    if (t) runs.push({ text: t, note });
  };
  let plainStart = 0;
  let i = 0;
  while (i < text.length) {
    if (text[i] === '〔') {
      const close = text.indexOf('〕', i + 1);
      if (close === -1) break; // unclosed: the rest stays plain
      push(text.slice(plainStart, i), false);
      push(text.slice(i, close + 1), true);
      i = plainStart = close + 1;
    } else {
      i++;
    }
  }
  push(text.slice(plainStart), false);
  return runs;
}
