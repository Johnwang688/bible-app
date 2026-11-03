// English Memory (EN-1): every one of the 60 English references, spoken as written, in words, with "chapter …
// verse …" labels, and with punctuation after the book, the chapter and the verse, reads as the right reference at
// the start and at the end of a full-recall transcript, and leaves the verse body whole.
import { getAllMemoryVerses } from '../library';
import { compareEnglishFullRecall, numberWords } from '../speech/english';

const words = (n: number) => numberWords(n).join(' ');

/** The ways to say `Book c:v[-w][,x]` this test checks. */
function spokenForms(referenceEn: string): string[] {
  const match = referenceEn.match(/^(.+?) (\d+):(.+)$/);
  if (!match) throw new Error(`not Book c:v: ${referenceEn}`);
  const [, book, chapterRaw, versesRaw] = match;
  const chapter = Number(chapterRaw);
  const spans = versesRaw!.split(',').map((span) => span.trim().split(/[-–]/).map(Number));
  const label = spans.length > 1 || spans[0]!.length > 1 ? 'verses' : 'verse';
  const say = (n: number, numeric: boolean) => (numeric ? String(n) : words(n));
  const verses = (numeric: boolean, list: string) =>
    spans.map((s) => s.map((n) => say(n, numeric)).join(' to ')).join(list);
  return [
    // (a) as written
    referenceEn,
    // (b) in words
    `${book} ${words(chapter)} ${verses(false, ' and ')}`,
    // (c) with chapter and verse labels, digits and words
    `${book} chapter ${chapter} ${label} ${verses(true, ' and ')}`,
    `${book} chapter ${words(chapter)} ${label} ${verses(false, ' and ')}`,
    // (d) commas after the book, the chapter and the verse
    `${book}, ${chapter}:${versesRaw},`,
    `${book}, ${words(chapter)}, ${verses(false, ', ')},`,
    `${book}, chapter ${chapter}, ${label} ${verses(true, ', ')},`,
    `${book}, chapter ${words(chapter)}, ${label} ${verses(false, ' and ')}.`,
    `${book}, chapter ${words(chapter)} and ${label} ${verses(false, ' and ')}.`,
  ];
}

const cases = getAllMemoryVerses().flatMap((verse) =>
  spokenForms(verse.referenceEn).flatMap((form) =>
    (['start', 'end'] as const).map((edge) => [verse.referenceEn, form, edge, verse] as const),
  ),
);

it('covers all 60 references', () => {
  expect(new Set(cases.map(([ref]) => ref)).size).toBe(60);
});

it.each(cases)('%s said "%s" at the %s is correct', (_, form, edge, verse) => {
  const transcript = edge === 'start' ? `${form} ${verse.textEn}` : `${verse.textEn} ${form}`;
  expect(compareEnglishFullRecall(transcript, verse.textEn, verse.referenceEn)).toMatchObject({
    referenceStatus: 'correct',
    passed: true,
    body: { matchPct: 100 },
  });
});
