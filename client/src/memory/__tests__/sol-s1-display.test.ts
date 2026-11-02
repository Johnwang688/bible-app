import { displayDiff, recallDisplay, hintMask } from '../display/diff';
import { TMS_VERSES } from '../library/tms';
import { loadSpeechKeyer, MANDARIN_SYNC_KEYER } from '../speech/keyer';
import { compareRecital } from '../speech/pinyinDiff';
import { compareFullRecall } from '../speech/fullRecall';

const josh = TMS_VERSES.find((v) => v.id === 'joshua-1-8')!;
const tim = TMS_VERSES.find((v) => v.id === '2-timothy-3-16')!;

// (Orchestrator: Sol's 'preserves Traditional transcript glyphs in match.heard' was dropped. It contradicts the
// contract in S1: a match whose said glyph differs from the shown one only by script carries heard === char, so that
// heard !== char means a real sound-alike.)

it('does not count a same displayed glyph as a sound-alike', async () => {
  // P2: the normalized 了/瞭 reading alias produces char === heard but increments alike.
  const keyer = await loadSpeechKeyer('cantonese');
  const result = displayDiff('瞭', '了', keyer, '瞭');
  expect(result.ops).toEqual([{ kind: 'match', char: '瞭', heard: '瞭' }]);
  expect(result.counts.alike).toBe(0);
});

it('extracts a prefix reference when the partial body occurs inside its title', () => {
  // P2: indexOf(bodyTranscript) selects 书 in the title instead of the actual body.
  const reference = '约书亚记1:8';
  const transcript = `${reference}书`;
  expect(compareFullRecall(transcript, josh.textZh, josh.referenceZh).bodyTranscript).toBe('书');
  const result = recallDisplay(transcript, josh);
  expect(result.referenceStatus).toBe('correct');
  expect(result.heardReference).toBe(reference);
});

it('joins two edge references with a space when the body is empty', () => {
  // P2: an empty body makes the display return the entire transcript without separating the references.
  const transcript = '提后3:16，提后3:16';
  expect(compareFullRecall(transcript, tim.textZh, tim.referenceZh).bodyTranscript).toBe('');
  expect(recallDisplay(transcript, tim).heardReference).toBe('提后3:16 提后3:16');
});

it('keeps counts, expected order and Traditional positions aligned with the grader across the corpus', async () => {
  const keyers = [MANDARIN_SYNC_KEYER, await loadSpeechKeyer('mandarin'), await loadSpeechKeyer('cantonese')];
  for (const keyer of keyers) {
    for (const verse of TMS_VERSES) {
      for (const said of [verse.textZh, verse.textZhHant, verse.textZh.slice(3), `🐑abc3□${verse.textZh}`, '']) {
        const result = displayDiff(said, verse.textZh, keyer, verse.textZhHant);
        const grade = compareRecital(said, verse.textZh, keyer);
        expect([result.matchPct, result.passed]).toEqual([grade.matchPct, grade.passed]);
        expect(result.ops.flatMap((op) => 'char' in op ? [op.char] : []).join('')).toBe(verse.textZhHant);
        const { ok, wrong, miss, extra } = result.counts;
        const denominator = Math.max(ok + wrong + miss, ok + wrong + extra);
        expect(denominator === 0 ? 0 : ok / denominator * 100).toBe(grade.matchPct);
      }
    }
    for (const [said, expected] of [['', ''], ['🐑□abc3', '🐑□abc3'], ['a 3', 'a3'], ['', '🐑，神'], ['神', ''], ['路', '露']]) {
      const result = displayDiff(said!, expected!, keyer);
      expect(result.matchPct).toBe(compareRecital(said!, expected!, keyer).matchPct);
      expect(result.ops.flatMap((op) => 'char' in op ? [op.char] : []).join('')).toBe(expected);
    }
  }
});

it('keeps ordinary recall splits identical to compareFullRecall at both edges', async () => {
  const keyer = await loadSpeechKeyer('cantonese');
  for (const verse of TMS_VERSES) {
    for (const transcript of [verse.textZh, `  「${verse.referenceZh}」 ${verse.textZh}  `,
      `${verse.textZh} ${verse.referenceZh}。`, `${verse.referenceZh}，${verse.textZh} ${verse.referenceZh}。`]) {
      const grade = compareFullRecall(transcript, verse.textZh, verse.referenceZh, keyer);
      const result = recallDisplay(transcript, verse, keyer, 'traditional');
      expect([result.bodyTranscript, result.referenceStatus, result.passed]).toEqual([
        grade.bodyTranscript, grade.referenceStatus, grade.passed,
      ]);
      expect(result.body.matchPct).toBe(grade.body.matchPct);
      const expectedReference = grade.referenceStatus === 'missing' ? null
        : transcript.trim().startsWith(verse.referenceZh) && transcript.includes(`${verse.textZh} ${verse.referenceZh}`)
          ? `${verse.referenceZh} ${verse.referenceZh}` : verse.referenceZh;
      expect(result.heardReference).toBe(expectedReference);
    }
  }
});

it('masks missing, repeated and punctuated chunks without losing punctuation or later matches', () => {
  expect(hintMask('神爱，神爱。', ['神爱', '神爱'])).toBe('神＿，神＿。');
  expect(hintMask('神爱，世人。', ['找不到', '世人'])).toBe('＿＿，世＿。');
  expect(hintMask('「神，爱」 人', ['「神，爱」', '人'])).toBe('「神，＿」 人');
  expect(hintMask('🐑神，爱。', ['🐑神', '爱'])).toBe('🐑＿，爱。');
  for (const verse of TMS_VERSES) {
    expect(Array.from(hintMask(verse.textZh, verse.chunks))).toHaveLength(Array.from(verse.textZh).length);
  }
});