// Acceptance (orchestrator-owned): the theme provider resolves, persists and reacts.
import { act, render, screen } from '@testing-library/react-native';
import { Text } from 'react-native';

import { appearanceKey } from '../../storage/keys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { ThemeProvider, useAppearance, useTheme } from '../ThemeProvider';
import type { AppearanceChoice } from '../types';

let setChoiceRef: ((c: AppearanceChoice) => void) | null = null;

function Probe() {
  const theme = useTheme();
  const { choice, setChoice } = useAppearance();
  setChoiceRef = setChoice;
  return (
    <>
      <Text testID="id">{theme.id}</Text>
      <Text testID="choice">{JSON.stringify(choice)}</Text>
    </>
  );
}

describe('ThemeProvider', () => {
  it('gives Graphite on a dark phone when nothing is stored', () => {
    render(
      <ThemeProvider storage={createStorage(memoryBackend())} systemScheme="dark">
        <Probe />
      </ThemeProvider>,
    );
    expect(screen.getByTestId('id')).toHaveTextContent('graphite');
  });

  it('reads the stored choice and swaps to the pair for the phone mode', () => {
    const storage = createStorage(memoryBackend());
    storage.set(appearanceKey, { preset: 'grape-soda', mode: 'system' });
    render(
      <ThemeProvider storage={storage} systemScheme="light">
        <Probe />
      </ThemeProvider>,
    );
    expect(screen.getByTestId('id')).toHaveTextContent('lavender-haze');
  });

  it('follows the phone when its scheme changes', () => {
    const storage = createStorage(memoryBackend());
    const ui = (scheme: 'light' | 'dark') => (
      <ThemeProvider storage={storage} systemScheme={scheme}>
        <Probe />
      </ThemeProvider>
    );
    const { rerender } = render(ui('light'));
    expect(screen.getByTestId('id')).toHaveTextContent('silver');
    rerender(ui('dark'));
    expect(screen.getByTestId('id')).toHaveTextContent('graphite');
  });

  it('setChoice re-renders with the new preset and saves it on the device', () => {
    const storage = createStorage(memoryBackend());
    render(
      <ThemeProvider storage={storage} systemScheme="light">
        <Probe />
      </ThemeProvider>,
    );
    act(() => setChoiceRef!({ preset: 'matcha-latte', mode: 'system' }));
    expect(screen.getByTestId('id')).toHaveTextContent('matcha-latte');
    expect(storage.get(appearanceKey)).toEqual({ preset: 'matcha-latte', mode: 'system' });
    act(() => setChoiceRef!({ preset: 'matcha-latte', mode: 'dark' }));
    expect(screen.getByTestId('id')).toHaveTextContent('matcha-night');
  });

  it('picks up a change written to storage elsewhere (for example by sync)', () => {
    const storage = createStorage(memoryBackend());
    render(
      <ThemeProvider storage={storage} systemScheme="light">
        <Probe />
      </ThemeProvider>,
    );
    act(() => storage.set(appearanceKey, { preset: 'sky', mode: 'system' }));
    expect(screen.getByTestId('id')).toHaveTextContent('sky');
  });

  it('throws a clear error when used outside the provider', () => {
    const spy = jest.spyOn(console, 'error').mockImplementation(() => {});
    expect(() => render(<Probe />)).toThrow(/ThemeProvider/);
    spy.mockRestore();
  });
});
