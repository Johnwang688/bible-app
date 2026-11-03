import { getAllMemoryVerses, getMemoryVerse } from '../library';
import { compareEnglishFullRecall, numberWords, parseEnglishReference } from '../speech/english';

const verses = getAllMemoryVerses();
const ordinal: Record<string, string[]> = {
  '1': ['1', 'one', 'first', '1st'],
  '2': ['2', 'two', 'second', '2nd'],
};
const words = (n: number) => numberWords(n).join(' ');

// Probe the repaired list/range class independently across all 60 references and numbered-book aliases.
it.each(verses.map((v) => [v.referenceEn, v] as const))('%s: labelled ranges and lists survive at both edges', (_, verse) => {
  const ref = parseEnglishReference(verse.referenceEn)!;
  const match = verse.referenceEn.match(/^(.+?) (\d+):(.+)$/)!;
  const book = match[1]!;
  const books = /^[12] /.test(book) ? ordinal[book[0]!]!.map((head) => head + book.slice(1)) : [book];
  if (book === 'Psalm') books.push('Psalms');
  for (const name of books) {
    for (const numeric of [true, false]) {
      const say = (n: number) => numeric ? String(n) : words(n);
      const forms = [
        `${name} chapter ${say(ref.chapter)} verse ${ref.verses.map((v) => say(v)).join(' and verse ')}`,
        `${name} ${say(ref.chapter)}:${ref.verses.map((v) => say(v)).join(', verse ')}`,
      ];
      if (ref.verses.length === 2 && ref.verses[1] === ref.verses[0]! + 1) {
        for (const join of ['to', 'through', '-']) {
          forms.push(`${name} chapter ${say(ref.chapter)} verses ${say(ref.verses[0]!)} ${join} verse ${say(ref.verses[1]!)}`);
        }
      }
      for (const form of forms) {
        for (const text of [`${form} ${verse.textEn}`, `${verse.textEn} ${form}`]) {
          expect({ form, ...compareEnglishFullRecall(text, verse.textEn, verse.referenceEn) }).toMatchObject({
            form, referenceStatus: 'correct', passed: true, body: { matchPct: 100 },
          });
        }
      }
    }
  }
});

// Finding: punctuation after the spoken book/chapter label prevents a correct reference from being read.
it.each(['start', 'end'] as const)('accepts a punctuated spoken reference at the %s', (edge) => {
  const verse = getMemoryVerse('john-15-7')!;
  const ref = 'John, chapter fifteen, verse seven';
  const text = edge === 'start' ? `${ref}. ${verse.textEn}` : `${verse.textEn} ${ref}.`;
  expect(compareEnglishFullRecall(text, verse.textEn, verse.referenceEn)).toMatchObject({
    referenceStatus: 'correct', passed: true, body: { matchPct: 100 },
  });
});

// Finding: the ordinary spoken connector "chapter fifteen and verse seven" is rejected.
it.each(['start', 'end'] as const)('accepts chapter-and-verse speech at the %s', (edge) => {
  const verse = getMemoryVerse('john-15-7')!;
  const ref = 'John chapter fifteen and verse seven';
  const text = edge === 'start' ? `${ref}. ${verse.textEn}` : `${verse.textEn} ${ref}.`;
  expect(compareEnglishFullRecall(text, verse.textEn, verse.referenceEn)).toMatchObject({
    referenceStatus: 'correct', passed: true, body: { matchPct: 100 },
  });
});
