// Sol GAPS 3 review (orchestrator-owned): a counterexample, kept as a regression test.
import { act, fireEvent, screen, waitFor } from '@testing-library/react-native';
import { queryKeys } from '../../api/queryClient';
import { focusNode } from '../components/a11y';
import { renderReader } from './readerHarness';

jest.mock('expo-clipboard', () => ({
  setStringAsync: jest.fn(async () => true),
}));
jest.mock('../components/useReduceMotion', () => ({
  useReduceMotion: () => true,
}));
jest.mock('../components/a11y', () => ({
  ...jest.requireActual('../components/a11y'),
  focusNode: jest.fn(),
}));

test('Back then Retry restores row focus after a failed refetch while the card was open', async () => {
  const failWords = new Set<string>();
  const key = queryKeys.words('John', 3, 16);
  const { queryClient } = await renderReader({
    position: { bookNumber: 43, chapter: 3, translation: 'WEB' },
    failWords,
  });
  await screen.findByText(/For God so loved the world/);
  await fireEvent.press(screen.getByTestId('verse-16'));
  await fireEvent.press(screen.getByTestId('sheet-original-words'));
  const row = (await screen.findAllByTestId(/^word-row-/))[0]!;
  const rowId = row.props.testID;
  await fireEvent.press(row);
  await screen.findByTestId('word-card');
  await waitFor(() => expect(queryClient.isFetching()).toBe(0));

  failWords.add('John 3:16');
  await act(async () => {
    await queryClient.refetchQueries({ queryKey: key, type: 'all' });
  });
  expect(queryClient.getQueryState(key)?.status).toBe('error');
  expect(queryClient.getQueryData(key)).toBeDefined();

  await fireEvent.press(screen.getByTestId('word-back'));
  await screen.findByTestId('words-retry');
  // Allow the initial restoration attempt to finish without rendered rows.
  await act(async () => {
    await new Promise(resolve => setTimeout(resolve, 20));
  });
  jest.mocked(focusNode).mockClear();

  failWords.clear();
  await fireEvent.press(screen.getByTestId('words-retry'));
  await waitFor(() =>
    expect(queryClient.getQueryState(key)?.status).toBe('success'),
  );
  expect(screen.getByTestId(rowId)).toBeTruthy();
  // Cached data kept ready=true; recovery never retries row focus.
  await waitFor(() => expect(focusNode).toHaveBeenCalled());
}, 30000);
