// Acceptance (orchestrator-owned, R-7a): the first-run state behind the intro screens.
// The screens themselves wait for John's approval of the prototypes; this is the logic they call.
import { act, renderHook } from '@testing-library/react-native';
import type { ReactNode } from 'react';

import { appearanceKey } from '../../storage/keys';
import { createStorage, memoryBackend, type Storage } from '../../storage/storage';
import { ThemeProvider, useAppearance } from '../../theme/ThemeProvider';
import type { ThemeMode } from '../../theme/types';
import { useFirstRun } from '../firstRun';
import { onboardingKey } from '../keys';

async function setup(storage: Storage, systemScheme: ThemeMode = 'light') {
  const wrapper = ({ children }: { children: ReactNode }) => (
    <ThemeProvider storage={storage} systemScheme={systemScheme}>
      {children}
    </ThemeProvider>
  );
  return renderHook(() => ({ run: useFirstRun(storage), look: useAppearance() }), { wrapper });
}

describe('useFirstRun', () => {
  it('is needed on a fresh device, and the default look is Silver / Graphite following the phone', async () => {
    const storage = createStorage(memoryBackend());
    const light = await setup(storage, 'light');
    expect(light.result.current.run.needed).toBe(true);
    expect(light.result.current.look.presetId).toBe('silver');
    const dark = await setup(storage, 'dark');
    expect(dark.result.current.look.presetId).toBe('graphite');
  });

  it('choosing a look saves it on the device and keeps light/dark as it was', async () => {
    const storage = createStorage(memoryBackend());
    const view = await setup(storage, 'dark');
    await act(async () => view.result.current.run.chooseLook('strawberry-milk'));
    expect(storage.get(appearanceKey)).toEqual({ preset: 'strawberry-milk', mode: 'system' });
    // Following a dark phone, the light preset shows as its dark pair.
    expect(view.result.current.look.presetId).toBe('bubblegum-night');
    expect(view.result.current.run.needed).toBe(true);
  });

  it('finishing saves the age range (or none) and never shows the intro again', async () => {
    const storage = createStorage(memoryBackend());
    const view = await setup(storage);
    await act(async () => view.result.current.run.chooseLook('sky'));
    await act(async () => view.result.current.run.finish('25-34'));
    expect(storage.get(onboardingKey)).toEqual({ done: true, ageRange: '25-34' });
    expect(storage.get(appearanceKey)).toEqual({ preset: 'sky', mode: 'system' });
    expect(view.result.current.run.needed).toBe(false);

    const other = createStorage(memoryBackend());
    const v2 = await setup(other);
    await act(async () => v2.result.current.run.finish(null));
    expect(other.get(onboardingKey)).toEqual({ done: true, ageRange: null });
  });

  it('skipping gives the default look (Silver / Graphite), drops anything picked, and asks nothing', async () => {
    const storage = createStorage(memoryBackend());
    const view = await setup(storage, 'light');
    await act(async () => view.result.current.run.chooseLook('matcha-latte'));
    await act(async () => view.result.current.run.skip());
    expect(storage.get(appearanceKey)).toEqual({ preset: null, mode: 'system' });
    expect(storage.get(onboardingKey)).toEqual({ done: true, ageRange: null });
    expect(view.result.current.look.presetId).toBe('silver');
    expect(view.result.current.run.needed).toBe(false);
  });

  it('skipping keeps a light/dark choice imported from the old web app', async () => {
    const storage = createStorage(memoryBackend());
    storage.set(appearanceKey, { preset: null, mode: 'dark' });
    const view = await setup(storage, 'light');
    await act(async () => view.result.current.run.skip());
    expect(storage.get(appearanceKey)).toEqual({ preset: null, mode: 'dark' });
    expect(view.result.current.look.presetId).toBe('graphite');
  });

  it('is not needed once done, and a write from elsewhere re-renders it', async () => {
    const storage = createStorage(memoryBackend());
    const view = await setup(storage);
    expect(view.result.current.run.needed).toBe(true);
    await act(async () => storage.set(onboardingKey, { done: true, ageRange: null }));
    expect(view.result.current.run.needed).toBe(false);
  });
});
