import { act, render, screen } from '@testing-library/react-native';
import { Dimensions, Platform } from 'react-native';

import { getTheme as mockGetTheme } from '../../theme/presets';
import { ChapterView } from '../components/ChapterView';

jest.mock('../../theme/ThemeProvider', () => ({ useTheme: () => mockGetTheme('silver') }));
jest.mock('../../i18n/I18nProvider', () => ({ useT: () => (key: string) => key }));
jest.mock('../../components/ContentColumn', () => ({ useColumn: () => null }));

it.each([false, true, undefined])('wide web long press follows hover capability: %s', async (hover) => {
  const os = jest.replaceProperty(Platform, 'OS', 'web');
  const oldSize = Dimensions.get('window');
  const oldWindow = Object.getOwnPropertyDescriptor(globalThis, 'window');
  Dimensions.set({ window: { width: 1440, height: 900, scale: 1, fontScale: 1 } });
  Object.defineProperty(globalThis, 'window', { configurable: true, value: { matchMedia: hover === undefined ? undefined : jest.fn(() => ({ matches: hover })) } });
  const longPress = jest.fn();
  try {
    const tree = await render(<ChapterView chapter={{ book: 'John', book_number: 43, chapter: 3, translation: 'BSB', total_verses: 1,
      verses: [{ id: 1, book: 'John', book_number: 43, chapter: 3, verse: 1, text: 'Verse text', translation: 'BSB' }] }}
      translation="BSB" textSize={2} selectedVerse={null} onVersePress={jest.fn()} onVerseLongPress={longPress} />);
    const press = screen.getByTestId('verse-1').props.onLongPress;
    if (hover) expect(press).toBeUndefined();
    else { expect(press).toEqual(expect.any(Function)); await act(() => press()); expect(longPress).toHaveBeenCalledWith(1); }
    await tree.unmount();
  } finally {
    os.restore(); await act(() => Dimensions.set({ window: oldSize }));
    if (oldWindow) Object.defineProperty(globalThis, 'window', oldWindow); else Reflect.deleteProperty(globalThis, 'window');
  }
});
