// Verifier round 3 on the verse sheet (GPT-6.1 Sol): a mutant-killing regression test. Orchestrator-owned.
import { fireEvent, screen, within } from '@testing-library/react-native';
import { renderReader } from './readerHarness';

jest.mock('expo-clipboard', () => ({
  setStringAsync: jest.fn(async () => true),
}));

it('keeps original words bound when selection extends backwards', async () => {
  await renderReader({
    position: { bookNumber: 43, chapter: 3, translation: 'WEB' },
  });
  await screen.findByText(/For God so loved the world/);
  await fireEvent.press(screen.getByTestId('verse-16-tools'));
  await fireEvent.press(screen.getByTestId('sheet-original-words'));
  expect(
    await within(screen.getByTestId('words-list')).findByText('For'),
  ).toBeTruthy();

  await fireEvent.press(screen.getByTestId('verse-15-tools'));
  expect(
    screen.getByTestId('verse-15-tools').props.accessibilityState.selected,
  ).toBe(true);
  expect(
    await within(screen.getByTestId('words-list')).findByText('For'),
  ).toBeTruthy();
});
