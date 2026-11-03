// Sol GAPS 5 review round 2 (orchestrator-owned): counterexamples, kept as regression tests.
import { act, fireEvent, render, screen } from '@testing-library/react-native';
import type { ReactNode } from 'react';
import { SafeAreaProvider } from 'react-native-safe-area-context';

import { I18nProvider } from '../../i18n/I18nProvider';
import { createStorage, memoryBackend } from '../../storage/storage';
import { ThemeProvider } from '../../theme/ThemeProvider';
import { EntityListScreen } from '../components/EntityListScreen';

const mockScrollToLocation = jest.fn();
let mockListProps: {
  onScrollToIndexFailed(info: {
    index: number;
    averageItemLength: number;
  }): void;
  onScrollBeginDrag(): void;
  onTouchStart(): void;
};

jest.mock('react-native', () => {
  const actual = jest.requireActual('react-native');
  const React = jest.requireActual('react');

  return Object.defineProperty(Object.create(actual), 'SectionList', {
    value: React.forwardRef(
      function MockSectionList(props: { ListHeaderComponent: ReactNode }, ref: unknown) {
        mockListProps = props as unknown as typeof mockListProps;
        React.useImperativeHandle(ref, () => ({
          scrollToLocation: mockScrollToLocation,
          getScrollResponder: () => ({ scrollTo: jest.fn() }),
        }));
        return React.createElement(
          actual.View,
          null,
          props.ListHeaderComponent,
        );
      },
    ),
  });
});

jest.mock('../../aurora', () => ({
  ...jest.requireActual('../../aurora'),
  AuroraBackground: () => null,
}));

jest.mock('../data', () => ({
  ...jest.requireActual('../data'),
  useEntityList: () => ({
    data: [
      { slug: 'aaron', label: 'Aaron' },
      { slug: 'moses', label: 'Moses' },
    ],
    isError: false,
  }),
}));

beforeEach(() => {
  jest.useFakeTimers();
  mockScrollToLocation.mockClear();
});
afterEach(() => jest.useRealTimers());

async function mount() {
  const storage = createStorage(memoryBackend());
  await render(
    <SafeAreaProvider
      initialMetrics={{
        frame: { x: 0, y: 0, width: 390, height: 844 },
        insets: { top: 0, left: 0, right: 0, bottom: 0 },
      }}
    >
      <I18nProvider
        storage={storage}
        locales={[{
          languageTag: 'en-US',
          languageCode: 'en',
          regionCode: 'US',
        }]}
      >
        <ThemeProvider storage={storage} systemScheme="light">
          <EntityListScreen
            kind="person"
            onBack={() => {}}
            onOpenEntity={() => {}}
          />
        </ThemeProvider>
      </I18nProvider>
    </SafeAreaProvider>,
  );
}

async function pendingJump() {
  await fireEvent.press(screen.getByTestId('entity-jump-M'));
  await act(async () => {
    mockListProps.onScrollToIndexFailed({
      index: 3,
      averageItemLength: 100,
    });
  });
  mockScrollToLocation.mockClear();
}

test.each(['onScrollBeginDrag', 'onTouchStart'] as const)(
  'a reader interaction (%s) cancels a pending jump retry',
  async event => {
    await mount();
    await pendingJump();
    await act(async () => mockListProps[event]());
    await act(async () => {
      jest.advanceTimersByTime(100);
    });

    // Actual: one animated scroll back to sectionIndex 1.
    expect(mockScrollToLocation).not.toHaveBeenCalled();
  },
);

test('changing the filter cancels the pending jump retry', async () => {
  await mount();
  await pendingJump();
  await fireEvent.changeText(screen.getByTestId('entity-filter'), 'Aaron');
  await act(async () => {
    jest.advanceTimersByTime(100);
  });

  // Actual: one animated scroll to the old sectionIndex 1.
  expect(mockScrollToLocation).not.toHaveBeenCalled();
});

test('a newer jump replaces a pending retry for an older letter', async () => {
  await mount();
  await pendingJump();
  await fireEvent.press(screen.getByTestId('entity-jump-A'));
  mockScrollToLocation.mockClear();
  await act(async () => {
    jest.advanceTimersByTime(100);
  });

  // Actual: the old M retry scrolls to sectionIndex 1 after the A jump.
  expect(mockScrollToLocation).not.toHaveBeenCalledWith(
    expect.objectContaining({ sectionIndex: 1 }),
  );
});
