/**
 * Acceptance tests for the pinyin and hanzi comparison used to grade recall.
 * Ported from Little Lamb's tests/run.ts sections D (hanziToTonelessPinyin),
 * E (comparePinyin, including the Needleman-Wunsch alignment cases E7-E10)
 * and F (diffHanzi).
 */
import {
  PASS_THRESHOLD_PCT,
  comparePinyin,
  diffHanzi,
  hanziToTonelessPinyin,
} from '../speech/pinyinDiff';

describe('D. hanziToTonelessPinyin', () => {
  it('D1 strips punctuation and produces clean space-separated tokens', () => {
    const out = hanziToTonelessPinyin('神爱世人，甚至将他的独生子赐给他们。');
    expect(out).not.toMatch(/[，。]/);
    expect(out).not.toMatch(/ {2,}/);
    const tokens = out.split(' ');
    expect(tokens.length).toBeGreaterThan(5);
    for (const t of tokens) {
      expect(t.length).toBeGreaterThan(0);
      expect(t).toMatch(/^[a-zü]+$/);
    }
  });

  it('D2 returns empty string for empty input', () => {
    expect(hanziToTonelessPinyin('')).toBe('');
  });

  it('D3 returns empty string for pure-punctuation input', () => {
    expect(hanziToTonelessPinyin('，。！')).toBe('');
  });
});

describe('E. comparePinyin', () => {
  it('E1 identical input gives 100% match and passed=true', () => {
    const expected = hanziToTonelessPinyin('神爱世人');
    const c = comparePinyin('神爱世人', expected);
    expect(c.matchPct).toBe(100);
    expect(c.passed).toBe(true);
    expect(c.diffTokens.every((d) => d.status === 'match')).toBe(true);
  });

  it('E2 trailing token dropped gives 75% and passed=false', () => {
    const expected = hanziToTonelessPinyin('神爱世人'); // 4 tokens
    const c = comparePinyin('神爱世', expected); // 3 tokens
    expect(c.matchPct).toBe(75);
    expect(c.passed).toBe(false);
    expect(c.diffTokens[c.diffTokens.length - 1]!.status).toBe('missing');
  });

  it('E3 exactly 80% gives passed=true (inclusive threshold)', () => {
    // 10 distinct hanzi expected; the last two transcribed chars differ in pinyin.
    //   '神爱世人是有信心力量' = 10 chars
    const expectedStr = hanziToTonelessPinyin('神爱世人是有信心力量');
    expect(expectedStr.split(/\s+/).filter(Boolean)).toHaveLength(10);
    // Same first 8, last two swapped to 国 (not 力, not 量).
    const c = comparePinyin('神爱世人是有信心国国', expectedStr);
    expect(Math.abs(c.matchPct - 80)).toBeLessThan(0.001);
    expect(c.passed).toBe(true);
  });

  it('E4 empty transcription gives 0% and passed=false, all tokens missing', () => {
    const c = comparePinyin('', 'shen ai shi ren');
    expect(c.matchPct).toBe(0);
    expect(c.passed).toBe(false);
    expect(c.diffTokens).toHaveLength(4);
    expect(c.diffTokens.every((d) => d.status === 'missing')).toBe(true);
  });

  it('E5 position mismatch produces both a missing and an extra token', () => {
    const expected = hanziToTonelessPinyin('神爱世人');
    const c = comparePinyin('世神爱人', expected);
    expect(c.diffTokens.some((d) => d.status === 'missing')).toBe(true);
    expect(c.diffTokens.some((d) => d.status === 'extra')).toBe(true);
    expect(c.matchPct).toBeLessThan(100);
  });

  it('E6 PASS_THRESHOLD_PCT is 80', () => {
    expect(PASS_THRESHOLD_PCT).toBe(80);
  });

  // E7-E10: Needleman-Wunsch alignment. A single inserted or skipped char
  // must not turn the whole tail red.

  it('E7 an inserted extra char does not cascade; surrounding chars still match', () => {
    // expected 4 chars; user added 啊 in the middle, so 5 transcribed chars.
    const expected = hanziToTonelessPinyin('神爱世人');
    const c = comparePinyin('神啊爱世人', expected);
    // 4 matches, 1 insertion. matchPct = 4 / max(4,5) = 80%.
    expect(Math.round(c.matchPct)).toBe(80);
    expect(c.passed).toBe(true);
    expect(c.diffTokens.filter((d) => d.status === 'match')).toHaveLength(4);
    expect(c.diffTokens.filter((d) => d.status === 'extra')).toHaveLength(1);
  });

  it('E8 a skipped char does not cascade; later chars still match', () => {
    const expected = hanziToTonelessPinyin('神爱世人'); // 4 tokens
    const c = comparePinyin('神世人', expected); // skipped 爱 -> 3 tokens
    // 3 matches, 1 deletion. matchPct = 3 / max(4,3) = 75%.
    expect(Math.round(c.matchPct)).toBe(75);
    expect(c.diffTokens.filter((d) => d.status === 'match')).toHaveLength(3);
    expect(c.diffTokens.filter((d) => d.status === 'missing')).toHaveLength(1);
  });

  it('E9 a substitution stays one substitution (sub preferred over del+ins on tie)', () => {
    // Last token swapped: exactly 1 missing + 1 extra, not a noisier alignment.
    const expected = hanziToTonelessPinyin('神爱世人是有信心力量');
    const c = comparePinyin('神爱世人是有信心力国', expected);
    expect(c.diffTokens.filter((d) => d.status === 'match')).toHaveLength(9);
    expect(c.diffTokens.filter((d) => d.status === 'missing')).toHaveLength(1);
    expect(c.diffTokens.filter((d) => d.status === 'extra')).toHaveLength(1);
  });

  it('E10 an extra word counts against the threshold without cascading', () => {
    // 10 expected, one extra at the end: 10/11 ≈ 90.9%.
    const expected = hanziToTonelessPinyin('神爱世人是有信心力量');
    const c = comparePinyin('神爱世人是有信心力量啊', expected);
    expect(c.matchPct).toBeGreaterThan(90);
    expect(c.matchPct).toBeLessThan(92);
    expect(c.passed).toBe(true);
    // Three extras: 10/13 ≈ 76.9%, below the threshold.
    const c2 = comparePinyin('神啊爱啊世人是有的信心力量', expected);
    expect(c2.passed).toBe(false);
  });
});

describe('F. diffHanzi', () => {
  it('F1 identical input: all correct, punctuation shown as skip', () => {
    const s = '神爱世人，甚至将他的独生子赐给他们。';
    const d = diffHanzi(s, s);
    expect(d.filter((x) => x.status === 'wrong')).toHaveLength(0);
    expect(d.filter((x) => x.status === 'extra')).toHaveLength(0);
    expect(d.filter((x) => x.status === 'skip')).toHaveLength(2);
    expect(d.filter((x) => x.status === 'correct').length).toBeGreaterThan(5);
  });

  it('F2 inserted 啊 shows as extra; expected chars stay correct', () => {
    const d = diffHanzi('神啊爱世人', '神爱世人');
    expect(d.filter((x) => x.status === 'wrong')).toHaveLength(0);
    expect(d.filter((x) => x.status === 'extra').map((x) => x.char)).toEqual(['啊']);
    expect(d.filter((x) => x.status === 'correct').map((x) => x.char)).toEqual([
      '神',
      '爱',
      '世',
      '人',
    ]);
  });

  it('F3 skipped middle char is marked wrong; tail still correct', () => {
    const d = diffHanzi('神世人', '神爱世人');
    expect(d.filter((x) => x.status === 'wrong').map((x) => x.char)).toEqual(['爱']);
    expect(d.filter((x) => x.status === 'correct').map((x) => x.char)).toEqual([
      '神',
      '世',
      '人',
    ]);
  });
});
