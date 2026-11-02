// Text for the system share sheet.
import { splitAlternateReadings } from '../reader/alternateReadings';

/** `"John 3:1–3, 7, 9–10"`: sorted, deduplicated, contiguous verses joined with an en dash. */
export function formatReference(bookName: string, chapter: number, verses: number[]): string {
  const sorted = [...new Set(verses)].sort((a, b) => a - b);
  const runs: string[] = [];
  for (let i = 0; i < sorted.length; ) {
    let j = i;
    while (j + 1 < sorted.length && sorted[j + 1] === sorted[j]! + 1) j++;
    runs.push(j > i ? `${sorted[i]}–${sorted[j]}` : `${sorted[i]}`);
    i = j + 1;
  }
  return `${bookName} ${chapter}:${runs.join(', ')}`;
}

/** The verses without CUV alternate readings, then a line naming the passage and translation. */
export function shareText(
  verses: { verse: number; text: string }[],
  reference: string,
  translationLabel: string,
  locale: 'en' | 'zh',
): string {
  const plain = verses.map((v) =>
    splitAlternateReadings(v.text)
      .filter((run) => !run.note)
      .map((run) => run.text)
      .join(''),
  );
  const body = plain.join(locale === 'zh' ? '' : ' ');
  const credit = locale === 'zh' ? `— ${reference}（${translationLabel}）` : `— ${reference} (${translationLabel})`;
  return `${body}\n${credit}`;
}
