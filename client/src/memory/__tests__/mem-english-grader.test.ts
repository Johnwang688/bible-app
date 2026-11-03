// Acceptance (English Memory; orchestrator-owned, implementers may not edit): the English word-level grader beside
// the pinyin one, the English full-recall reference check, and `gradeStep` in English. It normalises case,
// punctuation and numbers, and allows small slips the way the Chinese grader does (the same 80% pass mark).
import { gradeStep, PASS_THRESHOLD_PCT } from '../grading';
import { getMemoryVerse } from '../library';
import { compareEnglishFullRecall, compareEnglishRecital, englishWords } from '../speech/english';

describe('englishWords', () => {
  it('drops case and punctuation, and treats hyphens and dashes as spaces', () => {
    expect(englishWords('All Scripture is God-breathed; and—useful!')).toEqual([
      'all', 'scripture', 'is', 'god', 'breathed', 'and', 'useful',
    ]);
  });

  it('reads curly and straight apostrophes the same, and joins the word', () => {
    expect(englishWords('God’s mercy')).toEqual(englishWords("God's mercy"));
    expect(englishWords('God’s mercy')).toEqual(['gods', 'mercy']);
  });

  it('reads digits and number words the same', () => {
    expect(englishWords('Two or three gather')).toEqual(englishWords('2 or 3 gather'));
    expect(englishWords('ten thousand')).toEqual(englishWords('10,000'));
  });

  it('ignores quotation marks and brackets', () => {
    expect(englishWords('“Come, follow Me,” Jesus said')).toEqual(['come', 'follow', 'me', 'jesus', 'said']);
  });
});

describe('compareEnglishRecital', () => {
  const expected = 'Therefore if anyone is in Christ, he is a new creation.';

  it('passes an exact recital at 100%', () => {
    expect(compareEnglishRecital(expected, expected)).toMatchObject({ matchPct: 100, passed: true });
  });

  it('passes a transcript that differs only in case and punctuation', () => {
    expect(compareEnglishRecital('therefore if anyone is in christ he is a new creation', expected).matchPct).toBe(100);
  });

  it('allows a small slip: one wrong word of eleven passes', () => {
    const r = compareEnglishRecital('Therefore if someone is in Christ, he is a new creation.', expected);
    expect(r.passed).toBe(true);
    expect(r.matchPct).toBeLessThan(100);
  });

  it('fails three wrong words of eleven', () => {
    expect(compareEnglishRecital('So if someone is with Christ, he is a new creation.', expected).passed).toBe(false);
  });

  it('counts a one-letter spelling variant of a longer word as said (Saviour / Savior)', () => {
    expect(compareEnglishRecital('God our Saviour', 'God our Savior').matchPct).toBe(100);
  });

  it('does not count a different short word as a slip (in / on)', () => {
    expect(compareEnglishRecital('on Christ', 'in Christ').matchPct).toBeLessThan(100);
  });

  it('fails a missing half', () => {
    expect(compareEnglishRecital('Therefore if anyone is in Christ', expected).passed).toBe(false);
  });

  it('fails an empty transcript at 0%', () => {
    expect(compareEnglishRecital('', expected)).toMatchObject({ matchPct: 0, passed: false });
    expect(compareEnglishRecital('   ', expected)).toMatchObject({ matchPct: 0, passed: false });
  });

  it('uses the same pass mark as the Chinese grader', () => {
    expect(PASS_THRESHOLD_PCT).toBe(80);
  });
});

describe('compareEnglishFullRecall', () => {
  const text = 'I can do all things through Christ who gives me strength.';

  it.each([
    ['at the start', 'Philippians 4:13 I can do all things through Christ who gives me strength.'],
    ['at the end', 'I can do all things through Christ who gives me strength. Philippians 4:13'],
    ['in words', 'Philippians four thirteen, I can do all things through Christ who gives me strength'],
    ['with chapter and verse', 'Philippians chapter 4 verse 13. I can do all things through Christ who gives me strength'],
    ['lower case, a comma for the colon', 'philippians 4, 13 i can do all things through christ who gives me strength'],
  ])('accepts the reference %s', (_, said) => {
    const r = compareEnglishFullRecall(said, text, 'Philippians 4:13');
    expect(r.referenceStatus).toBe('correct');
    expect(r.passed).toBe(true);
    expect(r.body.matchPct).toBe(100);
  });

  it('a missing reference fails, and the body is still graded on its own', () => {
    const r = compareEnglishFullRecall(text, text, 'Philippians 4:13');
    expect(r.referenceStatus).toBe('missing');
    expect(r.passed).toBe(false);
    expect(r.body.matchPct).toBe(100);
  });

  it('a wrong verse is incorrect', () => {
    const r = compareEnglishFullRecall(`Philippians 4:19 ${text}`, text, 'Philippians 4:13');
    expect(r.referenceStatus).toBe('incorrect');
    expect(r.passed).toBe(false);
  });

  it('a wrong book is incorrect, not missing', () => {
    expect(compareEnglishFullRecall(`Colossians 4:13 ${text}`, text, 'Philippians 4:13').referenceStatus).toBe('incorrect');
  });

  it('a reference alone never passes the body', () => {
    const r = compareEnglishFullRecall('Philippians 4:13', text, 'Philippians 4:13');
    expect(r.passed).toBe(false);
  });

  it.each(['1 Corinthians 3:16', 'First Corinthians 3:16', '1st Corinthians 3:16', 'One Corinthians three sixteen'])(
    'reads a numbered book: %s',
    (said) => {
      const body = 'Do you not know that you yourselves are God’s temple';
      expect(compareEnglishFullRecall(`${said} ${body}`, body, '1 Corinthians 3:16').referenceStatus).toBe('correct');
    },
  );

  it.each(['Philippians 4:6-7', 'Philippians 4:6 to 7', 'Philippians 4 6 through 7', 'Philippians four six and seven'])(
    'reads a verse range: %s',
    (said) => {
      const body = 'Be anxious for nothing';
      expect(compareEnglishFullRecall(`${said} ${body}`, body, 'Philippians 4:6-7').referenceStatus).toBe('correct');
    },
  );

  it.each(['Psalm 119:9,11', 'Psalms 119:9, 11', 'Psalm 119 verses 9 and 11', 'Psalm one hundred nineteen nine and eleven'])(
    'reads a verse list: %s',
    (said) => {
      const body = 'How can a young man keep his way pure';
      expect(compareEnglishFullRecall(`${said} ${body}`, body, 'Psalm 119:9,11').referenceStatus).toBe('correct');
    },
  );
});

describe('gradeStep in English', () => {
  const verse = getMemoryVerse('2-corinthians-5-17')!;

  it('every verse has English text and chunks that join back to it', () => {
    expect(verse.textEn.length).toBeGreaterThan(0);
    expect(verse.chunksEn.join(' ')).toBe(verse.textEn);
  });

  it('chunk order checks the English chunk count', () => {
    const order = verse.chunksEn.map((_, i) => i);
    expect(gradeStep(verse.id, 'chunk-order', { kind: 'chunk-order', order }, undefined, 'en').passed).toBe(true);
    if (verse.chunksEn.length !== verse.chunks.length) {
      const zhOrder = verse.chunks.map((_, i) => i);
      expect(gradeStep(verse.id, 'chunk-order', { kind: 'chunk-order', order: zhOrder }, undefined, 'en').passed).toBe(false);
    }
  });

  it('fill-in grades against the English chunk at that position', () => {
    const answer = { kind: 'recall', transcript: verse.chunksEn[1]!, chunkPosition: 1 } as const;
    expect(gradeStep(verse.id, 'fill-blank', answer, undefined, 'en')).toMatchObject({ passed: true, matchPct: 100 });
    const wrong = { kind: 'recall', transcript: verse.chunksEn[0]!, chunkPosition: 1 } as const;
    expect(gradeStep(verse.id, 'fill-blank', wrong, undefined, 'en').passed).toBe(false);
  });

  it('fill-in rejects a position outside the English chunks', () => {
    const answer = { kind: 'recall', transcript: 'x', chunkPosition: verse.chunksEn.length } as const;
    expect(gradeStep(verse.id, 'fill-blank', answer, undefined, 'en').error).toBeDefined();
  });

  it('full recall needs the English reference and text', () => {
    const said = `${verse.referenceEn} ${verse.textEn}`;
    expect(gradeStep(verse.id, 'full-recall', { kind: 'recall', transcript: said }, undefined, 'en').passed).toBe(true);
    expect(gradeStep(verse.id, 'full-recall', { kind: 'recall', transcript: verse.textEn }, undefined, 'en').passed).toBe(false);
  });

  it('Chinese stays the default', () => {
    const said = `${verse.referenceZh} ${verse.textZh}`;
    expect(gradeStep(verse.id, 'full-recall', { kind: 'recall', transcript: said }).passed).toBe(true);
    expect(gradeStep(verse.id, 'full-recall', { kind: 'recall', transcript: said }, undefined, 'en').passed).toBe(false);
  });
});
