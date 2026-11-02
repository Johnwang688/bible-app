// Acceptance (orchestrator-owned, MEM screens): what the result screens show agrees with the grader. The
// samples are P2's table (`bible-app-work/mem/P2-prototypes-fix.md`), already run through the real grader.
// Implementers may not edit this file.
import { displayDiff, hintMask, recallDisplay } from '../display/diff';
import { getMemoryVerse } from '../library';
import { compareRecital } from '../speech/pinyinDiff';
import { nextHrefAfter } from '../session';
import type { DailyLessonRecord } from '../dailyLesson';

const josh = getMemoryVerse('joshua-1-8')!;
const tim = getMemoryVerse('2-timothy-3-16')!;
const cor = getMemoryVerse('2-corinthians-5-17')!;

describe('displayDiff agrees with the grader', () => {
  it.each([
    ['如此你的道露能以通', josh.chunks[3]!, 73, false],
    ['如此你的道露能以亨亨通', josh.chunks[3]!, 82, true],
    ['凡事顺', josh.chunks[4]!, 75, false],
    ['若有人在基督里他是新造的人老事变成新了', cor.textZh, 75, false],
  ])('%s', (said, expected, pct, passed) => {
    const d = displayDiff(said, expected);
    expect(d.matchPct).toBe(compareRecital(said, expected).matchPct);
    expect(Math.round(d.matchPct)).toBe(pct);
    expect(d.passed).toBe(passed);
  });

  it('marks a sound-alike as correct, a substitution with what was heard, misses, and keeps punctuation', () => {
    const d = displayDiff('如此你的道露能以通', josh.chunks[3]!);
    expect(d.counts).toEqual({ ok: 8, alike: 1, wrong: 1, miss: 2, extra: 0 });
    expect(d.ops).toContainEqual({ kind: 'match', char: '路', heard: '露' });
    expect(d.ops).toContainEqual({ kind: 'sub', char: '可', heard: '能' });
    expect(d.ops).toContainEqual({ kind: 'del', char: '就' });
    expect(d.ops).toContainEqual({ kind: 'del', char: '亨' });
    expect(d.ops).toContainEqual({ kind: 'punct', char: '，' });
    // Every expected character appears once, in order.
    const shown = d.ops.filter((o) => o.kind !== 'ins').map((o) => ('char' in o ? o.char : '')).join('');
    expect(shown).toBe(josh.chunks[3]);
  });

  it('extra characters are marked as extra', () => {
    const d = displayDiff('凡事都顺利', josh.chunks[4]!);
    expect(d.counts.extra).toBe(1);
    expect(d.ops).toContainEqual({ kind: 'ins', heard: '都' });
  });

  it('shows the expected side in Traditional when asked, grading the same', () => {
    const said = '如此你的道露能以通';
    const d = displayDiff(said, josh.chunks[3]!, undefined, josh.chunksHant[3]!);
    expect(d.matchPct).toBe(compareRecital(said, josh.chunks[3]!).matchPct);
    const shown = d.ops.filter((o) => o.kind !== 'ins').map((o) => ('char' in o ? o.char : '')).join('');
    expect(shown).toBe(josh.chunksHant[3]);
  });

  it('a Traditional transcript still aligns', () => {
    expect(displayDiff(josh.chunksHant[3]!, josh.chunks[3]!).matchPct).toBe(compareRecital(josh.chunksHant[3]!, josh.chunks[3]!).matchPct);
    expect(Math.round(displayDiff(josh.chunksHant[3]!, josh.chunks[3]!).matchPct)).toBe(100);
  });
});

describe('recallDisplay', () => {
  it('pass: body 100%, the reference heard and read', () => {
    const r = recallDisplay('圣经都是神所默示的于教训督责使人归正教导人学义都是有益得提后三章十六节', tim);
    expect(Math.round(r.body.matchPct)).toBe(100);
    expect(r.referenceStatus).toBe('correct');
    expect(r.heardReference).toBe('提后三章十六节');
    expect(r.passed).toBe(true);
  });

  it('fail: 79%, the wrong book', () => {
    const r = recallDisplay('圣经都是神所默视的于教训使归规教导学义都有益的提摩太前书3:16', tim);
    expect(Math.round(r.body.matchPct)).toBe(79);
    expect(r.referenceStatus).toBe('incorrect');
    expect(r.heardReference).toBe('提摩太前书3:16');
    expect(r.passed).toBe(false);
  });

  it('no reference: the body alone fails', () => {
    const r = recallDisplay(tim.textZh, tim);
    expect(Math.round(r.body.matchPct)).toBe(100);
    expect(r.referenceStatus).toBe('missing');
    expect(r.heardReference).toBeNull();
    expect(r.passed).toBe(false);
  });

  it('the reference first counts too', () => {
    const r = recallDisplay(`提摩太后书3:16${tim.textZh}`, tim);
    expect(r.referenceStatus).toBe('correct');
    expect(r.heardReference).toBe('提摩太后书3:16');
  });
});

describe('hintMask', () => {
  it('fill-in hint 1: the first character of the phrase, a blank per character, punctuation kept', () => {
    expect(hintMask(josh.chunks[3]!, [josh.chunks[3]!])).toBe('如＿，＿＿＿＿＿＿＿＿＿');
  });

  it('recall hint 1: the first character of each phrase', () => {
    expect(hintMask(tim.textZh, tim.chunks)).toBe('圣＿＿＿＿＿＿＿＿，于＿＿、＿＿，使＿＿＿、＿＿＿＿＿，都＿＿＿＿。');
  });
});

describe('nextHrefAfter (where Next goes)', () => {
  const lesson = (done: boolean[]): DailyLessonRecord => ({
    date: '2026-11-05',
    steps: done.map((d, i) => ({
      verseId: ['2-corinthians-5-17', 'galatians-2-20', 'joshua-1-8', 'john-15-7'][i]!,
      stage: 'chunk-order' as const,
      completedAt: d ? '2026-11-05T10:00:00.000Z' : null,
    })),
    completedAt: null,
  });

  it('goes to the next unfinished step after this one', () => {
    expect(nextHrefAfter(lesson([true, false, false, false]), 1)).toMatch(/^\/memory\/lesson\/joshua-1-8\/chunk-order\?.*i=2/);
    expect(nextHrefAfter(lesson([false, true, false, false]), 0)).toMatch(/i=2/);
  });

  it('after the last unfinished step (one skipped earlier), the end screen', () => {
    expect(nextHrefAfter(lesson([false, true, true, true]), 3)).toBe('/memory/complete');
    expect(nextHrefAfter(lesson([true, true, true, true]), 3)).toBe('/memory/complete');
  });

  it('free practice (no lesson) goes back to Memory', () => {
    expect(nextHrefAfter(null, null)).toBe('/study/memory');
  });
});
