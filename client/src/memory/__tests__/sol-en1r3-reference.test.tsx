import { fireEvent, screen } from '@testing-library/react-native';

import { memoryProgressKey } from '../../storage/memoryKeys';
import { getMemoryVerse } from '../library';
import { compareEnglishFullRecall } from '../speech/english';
import { LessonScreen } from '../ui/trainer/LessonScreen';
import { renderMemory } from './memoryHarness';

const recorder = {
  supported: false,
  permission: async () => 'unsupported' as const,
  start: async () => 'unsupported' as const,
  stop: async () => null,
  cancel: () => undefined,
};

// Finding: an invalid range is truncated to its first verse, allowing the wrong reference to pass.
it('rejects a descending range instead of accepting its first verse', () => {
  const verse = getMemoryVerse('philippians-4-13')!;
  const result = compareEnglishFullRecall(`Philippians 4:13 through 12 ${verse.textEn}`, verse.textEn, verse.referenceEn);
  expect(result).toMatchObject({ referenceStatus: 'incorrect', passed: false });
});

// Finding: the truncated descending range records a successful full-recall attempt in the real trainer.
it('does not record a pass for a descending reference range', async () => {
  const verse = getMemoryVerse('philippians-4-13')!;
  const { storage } = await renderMemory(({ storage, now, onNavigate }) => (
    <LessonScreen verseId={verse.id} stage="full-recall" index={null} storage={storage} now={now}
      onNavigate={onNavigate} recorder={recorder} />
  ), { verses: 'locale' });
  const toggle = screen.queryByTestId('memory-type-toggle');
  if (toggle) await fireEvent.press(toggle);
  await fireEvent.changeText(screen.getByTestId('memory-type-input'), `Philippians 4:13 through 12 ${verse.textEn}`);
  await fireEvent.press(screen.getByTestId('memory-type-check'));
  expect(storage.get(memoryProgressKey)[verse.id]).toMatchObject({ successes: 0, failures: 1 });
});

// Finding: punctuation between a range connector and verse label rejects a correct spoken reference.
it.each(['start', 'end'] as const)('accepts punctuation within a spoken range at the %s', (edge) => {
  const verse = getMemoryVerse('philippians-4-6-7')!;
  const reference = 'Philippians chapter four, verses six through, verse seven';
  const transcript = edge === 'start' ? `${reference}. ${verse.textEn}` : `${verse.textEn} ${reference}.`;
  expect(compareEnglishFullRecall(transcript, verse.textEn, verse.referenceEn)).toMatchObject({
    referenceStatus: 'correct', passed: true, body: { matchPct: 100 },
  });
});
