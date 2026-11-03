import { chunkForSpeech, maxPieceLength, speakableText } from '../text';

describe('speakableText', () => {
  it('leaves out the CUV alternate readings', () => {
    expect(speakableText('叫一切信他的都得永生〔或作：叫一切信的人在他里面得永生〕。')).toBe('叫一切信他的都得永生。');
    expect(speakableText('不信子的人得不着永生〔原文作：不得见永生〕，神的震怒常在他身上。')).toBe(
      '不信子的人得不着永生，神的震怒常在他身上。',
    );
  });

  it('keeps ordinary brackets and tidies whitespace', () => {
    expect(speakableText('  (For John had not yet\n been thrown into prison.) ')).toBe(
      '(For John had not yet been thrown into prison.)',
    );
  });

  it('is empty for a verse that is only a note', () => {
    expect(speakableText('〔此节或缺〕')).toBe('');
  });
});

describe('maxPieceLength', () => {
  it('budgets about ten seconds of speech at the chosen speed', () => {
    expect(maxPieceLength('en', 1)).toBe(140);
    expect(maxPieceLength('en', 2)).toBe(280);
    expect(maxPieceLength('zh-Hans', 1)).toBe(45);
    expect(maxPieceLength('zh-Hant', 0.75)).toBe(33);
  });
});

// Long verses after Esther 8:9, the Bible's longest (wording approximate; only the length matters here).
const ESTHER_8_9 =
  'At once the royal scribes were summoned—on the twenty-third day of the third month, the month of Sivan—and they wrote out all of Mordecai’s orders to the Jews and to the satraps, governors, and officials of the 127 provinces from India to Cush, writing to each province in its own script and to every people in their own language, and to the Jews in their own script and language.';
const ESTHER_8_9_CUV =
  '三月，就是西万月二十三日，将王的书记召来，按着末底改一切所吩咐的，用各省的文字、各族的方言，并犹大人的文字方言写谕旨，传给那从印度直到古实一百二十七省的犹大人和总督、省长、首领。';

describe('chunkForSpeech', () => {
  it('keeps a short verse whole', () => {
    expect(chunkForSpeech('Jesus wept.', 140)).toEqual(['Jesus wept.']);
    expect(chunkForSpeech('', 140)).toEqual([]);
  });

  it('cuts a long English verse into pieces that fit, losing no words', () => {
    const pieces = chunkForSpeech(ESTHER_8_9, 140);
    expect(pieces.length).toBeGreaterThan(1);
    for (const p of pieces) expect(p.length).toBeLessThanOrEqual(140);
    const squash = (s: string) => s.replace(/\s+/g, '');
    expect(squash(pieces.join(''))).toBe(squash(ESTHER_8_9));
    // Clauses joined back into one piece keep their space ("officials, governors", not "officials,governors").
    for (const p of pieces) expect(p).not.toMatch(/[,.;:][A-Za-z]/);
  });

  it('cuts a long Chinese verse at its punctuation, losing no characters', () => {
    const pieces = chunkForSpeech(ESTHER_8_9_CUV, 45);
    expect(pieces.length).toBeGreaterThan(1);
    for (const p of pieces) expect(p.length).toBeLessThanOrEqual(45);
    expect(pieces.join('')).toBe(ESTHER_8_9_CUV);
    expect(pieces.slice(0, -1).every((p) => /[，、。；]$/.test(p))).toBe(true);
  });

  it('cuts text with no breaks at all every `max` characters', () => {
    const text = '神'.repeat(100);
    const pieces = chunkForSpeech(text, 40);
    expect(pieces.map((p) => p.length)).toEqual([40, 40, 20]);
  });
});
