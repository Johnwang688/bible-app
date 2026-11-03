// English Memory (EN-1), the translation notice with the BSB text (the data module mocked to say 'BSB'): shown wherever
// English verse text appears (each trainer, the library, the verse sheet, the settings sheet), never in 中文.
import { fireEvent, screen } from '@testing-library/react-native';

import { MemoryHome } from '../ui/home/MemoryHome';
import { MemorySettingsSheet } from '../ui/MemorySettingsSheet';
import { ScriptureNotice } from '../ui/ScriptureNotice';
import { LessonScreen } from '../ui/trainer/LessonScreen';
import type { StageSlug } from '../types';
import { EN, renderMemory, ZH } from './memoryHarness';

jest.mock('../library/tmsEnglish', () => ({
  ...jest.requireActual<typeof import('../library/tmsEnglish')>('../library/tmsEnglish'),
  TMS_ENGLISH_TRANSLATION: 'BSB',
}));

const TEXT =
  'Scripture text: Berean Standard Bible (BSB), public domain.';
const TRANSLATION = 'BSB';

const recorder = {
  supported: false,
  permission: async () => 'unsupported' as const,
  start: async () => 'unsupported' as const,
  stop: async () => null,
  cancel: () => undefined,
};

function lesson(stage: StageSlug) {
  return function Lesson({ storage, now, onNavigate }: Parameters<Parameters<typeof renderMemory>[0]>[0]) {
    return (
      <LessonScreen verseId="john-15-7" stage={stage} index={null} storage={storage} now={now} onNavigate={onNavigate}
        recorder={recorder} checkVoice={async () => ({ kind: 'error' })} getAppCheckToken={async () => null} random={() => 0.7} />
    );
  };
}

it('reads exactly the translation’s notice for an English verse, and nothing for a Chinese one', async () => {
  await renderMemory(() => <ScriptureNotice language="en" />);
  expect(screen.getByTestId('memory-scripture-notice')).toHaveTextContent(TEXT);
  await renderMemory(() => <ScriptureNotice language="zh" />);
  expect(screen.queryByTestId('memory-scripture-notice')).toBeNull();
});

it.each<StageSlug>(['chunk-order', 'fill-blank', 'full-recall'])('%s: the notice in English, none in 中文', async (stage) => {
  await renderMemory(lesson(stage), { verses: 'locale', locales: [EN] });
  expect(screen.getByTestId('memory-scripture-notice')).toHaveTextContent(TEXT);
  await renderMemory(lesson(stage), { verses: 'locale', locales: [ZH] });
  expect(screen.queryByTestId('memory-scripture-notice')).toBeNull();
});

it('Memory home: under the library and in the verse sheet in English; none in 中文', async () => {
  await renderMemory(({ storage, now, onNavigate }) => <MemoryHome storage={storage} now={now} onNavigate={onNavigate} />, {
    verses: 'locale',
    locales: [EN],
  });
  expect(screen.getAllByTestId('memory-scripture-notice')).toHaveLength(1);
  await fireEvent.press(screen.getByTestId('memory-row-john-15-7'));
  expect(screen.getByTestId('memory-verse-sheet')).toHaveTextContent(TEXT, { exact: false });
  expect(screen.getAllByTestId('memory-scripture-notice')).toHaveLength(2);

  await renderMemory(({ storage, now, onNavigate }) => <MemoryHome storage={storage} now={now} onNavigate={onNavigate} />, {
    verses: 'locale',
    locales: [ZH],
  });
  await fireEvent.press(screen.getByTestId('memory-row-john-15-7'));
  expect(screen.queryByTestId('memory-scripture-notice')).toBeNull();
});

it('the settings sheet names the translation and shows the notice in English; no notice in 中文', async () => {
  await renderMemory(({ storage }) => <MemorySettingsSheet visible onClose={() => undefined} storage={storage} />, {
    verses: 'locale',
    locales: [EN],
  });
  expect(screen.getByTestId('memory-settings-verses')).toHaveTextContent(TRANSLATION, { exact: false });
  expect(screen.getByTestId('memory-scripture-notice')).toHaveTextContent(TEXT);
  await renderMemory(({ storage }) => <MemorySettingsSheet visible onClose={() => undefined} storage={storage} />, {
    verses: 'locale',
    locales: [ZH],
  });
  expect(screen.getByTestId('memory-settings-verses')).toHaveTextContent(TRANSLATION, { exact: false });
  expect(screen.queryByTestId('memory-scripture-notice')).toBeNull();
});
