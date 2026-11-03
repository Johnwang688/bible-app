import { compareEnglishFullRecall } from '../speech/english';
import { getMemoryVerse } from '../library';

// Finding: a repeated verse label truncates the reference and lets the wrong verse set pass.
it('rejects John fifteen verse seven and verse eight for John 15:7', () => {
  const verse = getMemoryVerse('john-15-7')!;
  const reference = 'John chapter fifteen verse seven and verse eight';
  const result = compareEnglishFullRecall(`${reference} ${verse.textEn}`, verse.textEn, verse.referenceEn);
  expect(result).toMatchObject({ referenceStatus: 'incorrect', passed: false });
});

// Finding: a valid spoken list with a verse label on each item is rejected at either edge.
it.each(['start', 'end'] as const)('accepts Psalm 119 verse nine and verse eleven at the %s', (edge) => {
  const verse = getMemoryVerse('psalm-119-911')!;
  const reference = 'Psalm chapter one hundred nineteen verse nine and verse eleven';
  const transcript = edge === 'start' ? `${reference} ${verse.textEn}` : `${verse.textEn} ${reference}`;
  expect(compareEnglishFullRecall(transcript, verse.textEn, verse.referenceEn)).toMatchObject({
    referenceStatus: 'correct', passed: true, body: { matchPct: 100 },
  });
});
