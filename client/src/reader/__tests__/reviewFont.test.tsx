// Verifier round 1 on the reader UI (GPT-6.1 Sol). Orchestrator-owned; do not edit.
import { act, render, screen } from '@testing-library/react-native';
import { StyleSheet } from 'react-native';

import { ensureFont, LAZY_FONT_FAMILY } from '../../fonts/lazy';
import { I18nProvider } from '../../i18n/I18nProvider';
import { createStorage, memoryBackend } from '../../storage/storage';
import { ThemeProvider } from '../../theme/ThemeProvider';
import { ChapterView } from '../components/ChapterView';
import { EN, fakeApi } from './readerHarness';

jest.mock('../../fonts/lazy', () => ({
  ensureFont: jest.fn(),
  LAZY_FONT_FAMILY: { chineseScripture: 'TestChineseScripture' },
}));

it('applies a Chinese font that resolved while English was displayed', async () => {
  let resolveFont!: () => void;
  jest.mocked(ensureFont).mockReturnValue(
    new Promise<void>((resolve) => {
      resolveFont = resolve;
    }),
  );

  const storage = createStorage(memoryBackend());
  const chapter = await fakeApi().api.chapter('John', 4, 'CUV-SIMP');
  const tree = (translation: 'BSB' | 'CUV-SIMP') => (
    <I18nProvider storage={storage} locales={[EN]}>
      <ThemeProvider storage={storage} systemScheme="light">
        <ChapterView
          chapter={chapter}
          translation={translation}
          textSize={2}
          selectedVerse={null}
          onVersePress={() => {}}
        />
      </ThemeProvider>
    </I18nProvider>
  );

  const ui = await render(tree('CUV-SIMP'));
  try {
    expect(ensureFont).toHaveBeenCalledWith('chineseScripture');
    await ui.rerender(tree('BSB'));
    await act(async () => {
      resolveFont();
    });
    await ui.rerender(tree('CUV-SIMP'));

    const verse = screen.getByTestId('verse-1');
    const faces: unknown[] = [];
    for (
      let node: typeof verse | null = verse;
      node;
      node = node.parent
    ) {
      faces.push(StyleSheet.flatten(node.props.style)?.fontFamily);
    }
    expect(faces).toContain(LAZY_FONT_FAMILY.chineseScripture);
  } finally {
    await ui.unmount();
  }
});
