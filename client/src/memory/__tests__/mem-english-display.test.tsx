// English Memory (EN-1), the result picture: the English display diff comes from the SAME alignment the English
// grader scores with, so its ops spell out the verse exactly (every non-`ins` op's `char`, in order) and its counts
// give the grader's own matchPct. Also: the English hint mask, and the reference forms the recall screen offers.
import { englishDisplayDiff, englishRecallDisplay, hintMask } from '../display/diff';
import { getAllMemoryVerses, getMemoryVerse } from '../library';
import { compareEnglishFullRecall, compareEnglishRecital, englishReferenceForms, englishWords } from '../speech/english';

const verses = getAllMemoryVerses();

/** Ways a recital goes: exact, unpunctuated, a word dropped, a word changed, a word added, a slip, nothing. */
function variants(text: string): string[] {
  const words = text.split(' ');
  const mid = Math.floor(words.length / 2);
  const long = words.findIndex((w) => w.replace(/[^A-Za-z]/g, '').length >= 6);
  const slipped = [...words];
  if (long >= 0) slipped[long] = slipped[long]!.replace(/[a-z](?=[a-z]*[^a-z]*$)/, 'q');
  return [
    text,
    text.toLowerCase().replace(/[^\p{L}\p{N}\s]/gu, ''),
    [...words.slice(0, mid), ...words.slice(mid + 1)].join(' '),
    [...words.slice(0, mid), 'banana', ...words.slice(mid + 1)].join(' '),
    [...words.slice(0, mid), 'umm', ...words.slice(mid)].join(' '),
    slipped.join(' '),
    '',
  ];
}

function spelled(text: string, said: string) {
  const diff = englishDisplayDiff(said, text);
  const shown = diff.ops.map((op) => (op.kind === 'ins' ? '' : op.char)).join('');
  return { diff, shown };
}

describe('englishDisplayDiff', () => {
  it.each(verses.map((v) => [v.referenceEn, v] as const))('%s: reproduces the text and agrees with the grader', (_, verse) => {
    for (const expected of [verse.textEn, ...verse.chunksEn]) {
      for (const said of variants(expected)) {
        const { diff, shown } = spelled(expected, said);
        const grade = compareEnglishRecital(said, expected);
        expect(shown).toBe(expected);
        expect(diff.matchPct).toBe(grade.matchPct);
        expect(diff.passed).toBe(grade.passed);
        const e = englishWords(expected).length;
        const s = englishWords(said).length;
        expect(diff.counts.ok + diff.counts.wrong + diff.counts.miss).toBe(e);
        expect(diff.counts.ok + diff.counts.wrong + diff.counts.extra).toBe(s);
        expect(s === 0 ? 0 : (diff.counts.ok / Math.max(e, s)) * 100).toBe(grade.matchPct);
      }
    }
  });

  it('marks a one-letter slip as said, with the word heard', () => {
    const { diff, shown } = spelled('God our Savior.', 'god our saviour');
    expect(shown).toBe('God our Savior.');
    expect(diff.ops).toEqual([
      { kind: 'match', char: 'God', heard: 'God' },
      { kind: 'punct', char: ' ' },
      { kind: 'match', char: 'our', heard: 'our' },
      { kind: 'punct', char: ' ' },
      { kind: 'match', char: 'Savior', heard: 'saviour' },
      { kind: 'punct', char: '.' },
    ]);
    expect(diff.counts).toEqual({ ok: 3, alike: 1, wrong: 0, miss: 0, extra: 0 });
    expect(diff.matchPct).toBe(100);
  });

  it('keeps a wrong word, a missed word and an extra word in their places', () => {
    const { diff } = spelled('Therefore if anyone is in Christ,', 'so if anyone is um Christ');
    expect(diff.ops).toEqual([
      { kind: 'sub', char: 'Therefore', heard: 'so' },
      { kind: 'punct', char: ' ' },
      { kind: 'match', char: 'if', heard: 'if' },
      { kind: 'punct', char: ' ' },
      { kind: 'match', char: 'anyone', heard: 'anyone' },
      { kind: 'punct', char: ' ' },
      { kind: 'match', char: 'is', heard: 'is' },
      { kind: 'punct', char: ' ' },
      { kind: 'sub', char: 'in', heard: 'um' },
      { kind: 'punct', char: ' ' },
      { kind: 'match', char: 'Christ', heard: 'Christ' },
      { kind: 'punct', char: ',' },
    ]);
    expect(spelled('Be anxious for nothing', 'Be very anxious nothing').diff.ops.map((op) => op.kind)).toEqual([
      'match', 'punct', 'ins', 'match', 'punct', 'del', 'punct', 'match',
    ]);
  });

  it('draws a number written in digits on its first word', () => {
    const { diff, shown } = spelled('About 10,000 men.', 'about ten thousand men');
    expect(shown).toBe('About 10,000 men.');
    expect(diff.matchPct).toBe(100);
    expect(diff.counts.ok).toBe(4);
  });
});

describe('englishRecallDisplay', () => {
  const verse = getMemoryVerse('philippians-4-13')!;

  it('takes the reference off and draws the body', () => {
    const r = englishRecallDisplay(`${verse.textEn} Philippians four thirteen`, verse);
    expect(r.referenceStatus).toBe('correct');
    expect(r.heardReference).toBe('Philippians four thirteen');
    expect(r.passed).toBe(true);
    expect(r.body.ops.map((op) => (op.kind === 'ins' ? '' : op.char)).join('')).toBe(verse.textEn);
  });

  it('a reference alone: heard, body empty, not passed', () => {
    const r = englishRecallDisplay(verse.referenceEn, verse);
    expect(r.heardReference).toBe(verse.referenceEn);
    expect(r.bodyTranscript).toBe('');
    expect(r.passed).toBe(false);
  });
});

describe('English hints and reference forms', () => {
  it('hintMask shows each word’s first letter and keeps punctuation and spaces', () => {
    expect(hintMask('Therefore if anyone is in Christ, he is new.', [], 'en')).toBe('T________ i_ a_____ i_ i_ C_____, h_ i_ n__.');
    expect(hintMask('God’s mercy', [], 'en')).toBe('G__’_ m____');
  });

  it.each(verses.map((v) => [v.referenceEn, v] as const))('%s: every form offered is read as the right reference', (_, verse) => {
    const forms = englishReferenceForms(verse.referenceEn);
    expect(forms).not.toBeNull();
    for (const form of forms!) {
      expect([form, compareEnglishFullRecall(`${form} ${verse.textEn}`, verse.textEn, verse.referenceEn).referenceStatus]).toEqual([form, 'correct']);
      expect([form, compareEnglishFullRecall(`${verse.textEn} ${form}`, verse.textEn, verse.referenceEn).passed]).toEqual([form, true]);
    }
  });

  it('another verse of every library reference is incorrect, not missing', () => {
    for (const verse of verses) {
      const other = verses.find((v) => v.id !== verse.id)!;
      expect(compareEnglishFullRecall(`${other.referenceEn} ${verse.textEn}`, verse.textEn, verse.referenceEn).referenceStatus).toBe('incorrect');
    }
  });
});
