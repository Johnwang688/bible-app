// Verifier round 2 on the reader UI (GPT-6.1 Sol). Orchestrator-owned; do not edit.
import { fireEvent, render, screen } from '@testing-library/react-native';
import { Platform } from 'react-native';

import { I18nProvider } from '../../i18n/I18nProvider';
import { createStorage, memoryBackend } from '../../storage/storage';
import { ThemeProvider } from '../../theme/ThemeProvider';
import { ChapterView } from '../components/ChapterView';
import { EN, fakeApi } from './readerHarness';

it.each(['Enter', ' '])('activates a web verse with %p', async key => {
  const os = jest.replaceProperty(Platform, 'OS', 'web');
  const storage = createStorage(memoryBackend());
  const chapter = await fakeApi().api.chapter('John', 4, 'BSB');
  const onVersePress = jest.fn();
  const ui = await render(
    <I18nProvider storage={storage} locales={[EN]}>
      <ThemeProvider storage={storage} systemScheme="light">
        <ChapterView
          chapter={chapter}
          translation="BSB"
          textSize={2}
          selectedVerse={null}
          onVersePress={onVersePress}
        />
      </ThemeProvider>
    </I18nProvider>,
  );

  try {
    await fireEvent(screen.getByTestId('verse-1'), 'keyDown', {
      key, preventDefault: jest.fn(),
    });
    expect(onVersePress).toHaveBeenCalledTimes(1);
    expect(onVersePress).toHaveBeenCalledWith(1);
  } finally {
    await ui.unmount();
    os.restore();
  }
});
