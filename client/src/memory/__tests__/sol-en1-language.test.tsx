import { act, fireEvent, screen } from '@testing-library/react-native';

import { languageKey } from '../../storage/keys';
import { memoryProgressKey } from '../../storage/memoryKeys';
import { getMemoryVerse } from '../library';
import { LessonScreen } from '../ui/trainer/LessonScreen';
import { renderMemory } from './memoryHarness';

const recorder = {
  supported: false,
  permission: async () => 'unsupported' as const,
  start: async () => 'unsupported' as const,
  stop: async () => null,
  cancel: () => undefined,
};

// Finding: locale invalidation waits for unmount, so a queued old-language chunk Check still records success.
it('locale change voids a queued English chunk Check before the replacement render', async () => {
  const verse = getMemoryVerse('galatians-2-20')!;
  const { storage } = await renderMemory(({ storage, now, onNavigate }) => (
    <LessonScreen verseId={verse.id} stage="chunk-order" index={null} storage={storage} now={now}
      onNavigate={onNavigate} recorder={recorder} random={() => 0.7} />
  ), { verses: 'locale' });
  for (let i = 0; i < verse.chunksEn.length; i++) await fireEvent.press(screen.getByTestId(`chunk-chip-${i}`));
  const check = screen.getByTestId('chunk-check');
  await act(async () => {
    storage.set(languageKey, 'zh-Hans');
    await fireEvent.press(check);
  });
  expect(screen.getByTestId('chunk-chip-0')).toHaveTextContent(verse.chunks[0]!);
  expect(storage.get(memoryProgressKey)).toEqual({});
});
