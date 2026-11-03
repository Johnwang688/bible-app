import { act, fireEvent, screen } from '@testing-library/react-native';

import { languageKey } from '../../storage/keys';
import { memoryProgressKey } from '../../storage/memoryKeys';
import { createStorage, memoryBackend } from '../../storage/storage';
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

// Probe the synchronous invalidation fix: typed Check queued across a switch must neither record nor show a result.
it.each((['fill-blank', 'full-recall'] as const).flatMap(stage =>
  (['en', 'zh-Hans'] as const).flatMap(language => [false, true].map(back => [stage, language, back] as const)),
))('%s: queued typed Check from %s is void (switch back: %s)', async (stage, language, back) => {
  const verse = getMemoryVerse('galatians-2-20')!;
  const storage = createStorage(memoryBackend());
  storage.set(languageKey, language);
  await renderMemory(({ now, onNavigate }) => (
    <LessonScreen verseId={verse.id} stage={stage} index={null} storage={storage} now={now}
      onNavigate={onNavigate} recorder={recorder} random={() => 0} />
  ), { storage, verses: 'locale' });
  const toggle = screen.queryByTestId('memory-type-toggle');
  if (toggle) await fireEvent.press(toggle);
  const text = language === 'en' ? verse.textEn : verse.textZh;
  const ref = language === 'en' ? verse.referenceEn : verse.referenceZh;
  const phrase = language === 'en' ? verse.chunksEn[0]! : verse.chunks[0]!;
  await fireEvent.changeText(screen.getByTestId('memory-type-input'), stage === 'fill-blank' ? phrase : `${ref} ${text}`);
  const check = screen.getByTestId('memory-type-check');
  await act(async () => {
    storage.set(languageKey, language === 'en' ? 'zh-Hans' : 'en');
    if (back) storage.set(languageKey, language);
    await fireEvent.press(check);
  });
  expect(storage.get(memoryProgressKey)).toEqual({});
  expect(screen.queryByTestId('memory-result')).toBeNull();
  expect(screen.getByTestId('memory-type-input')).toHaveProp('value', '');
});
