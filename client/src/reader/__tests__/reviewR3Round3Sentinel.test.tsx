import { act, fireEvent, screen } from '@testing-library/react-native';
import { Animated, StyleSheet } from 'react-native';

import { readingProgressKey, studyItemsKey } from '../../storage/keys';
import { renderReader } from './readerHarness';

let mockFocused = true;
jest.mock('../components/useTabFocused', () => ({
  useTabFocused: () => mockFocused,
}));
afterEach(() => jest.restoreAllMocks());

it('ignores the screen sentinel callback queued before tab blur', async () => {
  jest.spyOn(Animated, 'timing').mockImplementation(() => ({
    start: jest.fn(), stop: jest.fn(), reset: jest.fn(),
  }));
  let t = new Date(2026, 10, 2, 9).getTime();
  const { ui, storage } = await renderReader({
    position: { bookNumber: 43, chapter: 3, translation: 'WEB' },
    now: () => t,
  });
  await screen.findByText(/For God so loved the world/);
  await fireEvent(screen.getByTestId('reader-scroll'), 'layout', {
    nativeEvent: {
      layout: { x: 0, y: 0, width: 390, height: 700 },
    },
  });

  const sentinel = screen.root!.queryAll(node =>
    node.props.pointerEvents === 'none'
    && typeof node.props.onLayout === 'function'
    && StyleSheet.flatten(node.props.style)?.height === 0,
  )[0]!;
  const queuedLayout = sentinel.props.onLayout;

  t += 100;
  mockFocused = false;
  await act(() => storage.set(studyItemsKey, {
    highlights: {},
    notes: {},
    bookmarks: {
      '43:3:1': { createdAt: new Date(t).toISOString() },
    },
  }));
  await act(() => queuedLayout({
    nativeEvent: {
      layout: { x: 0, y: 0, width: 390, height: 0 },
    },
  }));
  t += 10_000;
  await ui.unmount();

  expect(storage.get(readingProgressKey).activeMs['2026-11-02'])
    .toBe(100);
});
