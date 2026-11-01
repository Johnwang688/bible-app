// Acceptance (orchestrator-owned): the theme provider resolves, persists and reacts.
import { act, render, screen } from '@testing-library/react-native';
import { useEffect } from 'react';
import { Text } from 'react-native';

import { appearanceKey } from '../../storage/keys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { ThemeProvider, useAppearance, useTheme } from '../ThemeProvider';
import type { AppearanceChoice } from '../types';

let setChoiceRef: ((c: AppearanceChoice) => void) | null = null;

function Probe() {
  const theme = useTheme();
  const { choice, setChoice } = useAppearance();
  useEffect(() => {
    setChoiceRef = setChoice;
  });
  return (
    <>
      <Text testID="id">{theme.id}</Text>
      <Text testID="choice">{JSON.stringify(choice)}</Text>
    </>
  );
}

describe('ThemeProvider', () => {
  it('gives Graphite on a dark phone when nothing is stored', async () => {
    await render(
      <ThemeProvider storage={createStorage(memoryBackend())} systemScheme="dark">
        <Probe />
      </ThemeProvider>,
    );
    expect(screen.getByTestId('id')).toHaveTextContent('graphite');
  });

  it('reads the stored choice and swaps to the pair for the phone mode', async () => {
    const storage = createStorage(memoryBackend());
    storage.set(appearanceKey, { preset: 'grape-soda', mode: 'system' });
    await render(
      <ThemeProvider storage={storage} systemScheme="light">
        <Probe />
      </ThemeProvider>,
    );
    expect(screen.getByTestId('id')).toHaveTextContent('lavender-haze');
  });

  it('follows the phone when its scheme changes', async () => {
    const storage = createStorage(memoryBackend());
    const ui = (scheme: 'light' | 'dark') => (
      <ThemeProvider storage={storage} systemScheme={scheme}>
        <Probe />
      </ThemeProvider>
    );
    const { rerender } = await render(ui('light'));
    expect(screen.getByTestId('id')).toHaveTextContent('silver');
    await rerender(ui('dark'));
    expect(screen.getByTestId('id')).toHaveTextContent('graphite');
  });

  it('setChoice re-renders with the new preset and saves it on the device', async () => {
    const storage = createStorage(memoryBackend());
    await render(
      <ThemeProvider storage={storage} systemScheme="light">
        <Probe />
      </ThemeProvider>,
    );
    await act(async () => {
      setChoiceRef!({ preset: 'matcha-latte', mode: 'system' });
    });
    expect(screen.getByTestId('id')).toHaveTextContent('matcha-latte');
    expect(storage.get(appearanceKey)).toEqual({ preset: 'matcha-latte', mode: 'system' });
    await act(async () => {
      setChoiceRef!({ preset: 'matcha-latte', mode: 'dark' });
    });
    expect(screen.getByTestId('id')).toHaveTextContent('matcha-night');
  });

  it('picks up a change written to storage elsewhere (for example by sync)', async () => {
    const storage = createStorage(memoryBackend());
    await render(
      <ThemeProvider storage={storage} systemScheme="light">
        <Probe />
      </ThemeProvider>,
    );
    await act(async () => {
      storage.set(appearanceKey, { preset: 'sky', mode: 'system' });
    });
    expect(screen.getByTestId('id')).toHaveTextContent('sky');
  });

  it('throws a clear error when used outside the provider', async () => {
    const spy = jest.spyOn(console, 'error').mockImplementation(() => {});
    await expect(render(<Probe />)).rejects.toThrow(/ThemeProvider/);
    spy.mockRestore();
  });
});
