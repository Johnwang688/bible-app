// The search screen's own pieces: word marking, and the reader header's search button.
import { fireEvent, render, screen } from '@testing-library/react-native';
import { Animated } from 'react-native';
import { SafeAreaProvider } from 'react-native-safe-area-context';

import { I18nProvider } from '../../../i18n/I18nProvider';
import { ReaderHeader } from '../../../reader/components/ReaderHeader';
import { createStorage, memoryBackend } from '../../../storage/storage';
import { ThemeProvider } from '../../../theme/ThemeProvider';
import { splitMarked } from '../../excerpt';

describe('splitMarked', () => {
  it('marks every case-insensitive occurrence of every word, keeping the text as written', () => {
    expect(splitMarked('Love is love; God is Love', ['love'])).toEqual([
      { text: 'Love', hit: true },
      { text: ' is ', hit: false },
      { text: 'love', hit: true },
      { text: '; God is ', hit: false },
      { text: 'Love', hit: true },
    ]);
  });

  it('takes the longer word where two overlap, and reads regular-expression characters literally', () => {
    expect(splitMarked('a.b and ab', ['a.b', 'a'])).toEqual([
      { text: 'a.b', hit: true },
      { text: ' ', hit: false },
      { text: 'a', hit: true },
      { text: 'nd ', hit: false },
      { text: 'a', hit: true },
      { text: 'b', hit: false },
    ]);
  });

  it('leaves the text whole when there is nothing to mark', () => {
    expect(splitMarked('grace', [])).toEqual([{ text: 'grace', hit: false }]);
    expect(splitMarked('grace', [''])).toEqual([{ text: 'grace', hit: false }]);
  });
});

describe('the reader header’s search button', () => {
  it('is a labelled 44 pt button that opens search', async () => {
    const onOpenSearch = jest.fn();
    const storage = createStorage(memoryBackend());
    await render(
      <SafeAreaProvider initialMetrics={{ frame: { x: 0, y: 0, width: 390, height: 844 }, insets: { top: 47, left: 0, right: 0, bottom: 34 } }}>
        <I18nProvider storage={storage} locales={[{ languageTag: 'en-US', languageCode: 'en', regionCode: 'US' }]}>
          <ThemeProvider storage={storage} systemScheme="light">
            <ReaderHeader
              book={undefined}
              position={{ bookNumber: 1, chapter: 1, translation: 'BSB' }}
              second={null}
              hidden={false}
              translateY={new Animated.Value(0)}
              onShow={jest.fn()}
              onOpenBook={jest.fn()}
              onOpenVersions={jest.fn()}
              onOpenSettings={jest.fn()}
              onOpenSearch={onOpenSearch}
            />
          </ThemeProvider>
        </I18nProvider>
      </SafeAreaProvider>,
    );
    const button = screen.getByTestId('reader-search-button');
    expect(button.props.accessibilityLabel).toBe('Search');
    await fireEvent.press(button);
    expect(onOpenSearch).toHaveBeenCalledTimes(1);
  });
});
