// INT Sol round 1 controls: fixed scheme, standalone/paired look picks and untrusted synced edits.
import { act, fireEvent, render, screen } from '@testing-library/react-native';
import { Appearance } from 'react-native';

import { CustomiseScreen } from '../../me/CustomiseScreen';
import { renderMe } from '../../me/__tests__/meHarness';
import { appearanceCustomKey } from '../../storage/appearanceCustomKey';
import { appearanceKey } from '../../storage/keys';
import { createStorage, memoryBackend, setStorageForTesting } from '../../storage/storage';
import { checkPulledSetting } from '../../sync/domains/settings';
import { DEFAULT_DOMAINS } from '../../sync/registry';
import { applyCustom, type AppearanceCustom } from '../custom';
import { getTheme } from '../presets';
import { resolvePresetId } from '../resolve';
import { ThemeProvider, useAppearance, useTheme } from '../ThemeProvider';
import type { AppearanceChoice, ThemeMode } from '../types';

afterEach(() => {
  jest.restoreAllMocks();
  setStorageForTesting(null);
});

it.each(['light', 'dark', null] as const)('the fixed systemScheme %s wins over the device even at press time', async (fixed) => {
  const storage = createStorage(memoryBackend());
  let device: ThemeMode | null = 'dark';
  jest.spyOn(Appearance, 'getColorScheme').mockImplementation(() => device);
  let read!: (choice?: AppearanceChoice) => string;
  let visible!: string;
  function Probe() {
    read = useAppearance().showingPresetId;
    visible = useTheme().id;
    return null;
  }
  await render(<ThemeProvider storage={storage} systemScheme={fixed}><Probe /></ThemeProvider>);
  const expected = fixed === 'dark' ? 'graphite' : 'silver';
  expect(visible).toBe(expected);
  const pressRead = read;
  device = 'light';
  expect(pressRead()).toBe(expected);
  await act(() => storage.set(appearanceKey, { preset: 'sky', mode: 'system' }));
  expect(pressRead()).toBe(fixed === 'dark' ? 'deep-blue' : 'sky');
  expect(pressRead({ preset: null, mode: 'dark' })).toBe('graphite');
  expect(pressRead({ preset: null, mode: 'system' })).toBe(expected);
});

it.each([
  ['liberty', 'light'], ['liberty', 'dark'], ['liberty', 'system'],
  ['northern-lights', 'light'], ['northern-lights', 'dark'], ['northern-lights', 'system'],
] as const)('from standalone %s in %s mode, each light/dark pick shows the picked look', async (preset, mode) => {
  const storage = createStorage(memoryBackend());
  storage.set(appearanceKey, { preset, mode });
  await renderMe(<CustomiseScreen onBack={() => {}} onAdvanced={() => {}} />, { storage, scheme: 'dark' });
  for (const id of ['sky', 'deep-blue', 'liberty', 'northern-lights'] as const) {
    await act(() => storage.set(appearanceKey, { preset, mode }));
    await fireEvent.press(screen.getByTestId(`customise-preset-${id}`));
    expect(resolvePresetId(storage.get(appearanceKey), 'dark')).toBe(id);
    expect(screen.getByTestId(`customise-preset-${id}`).props.accessibilityState).toMatchObject({ selected: true });
  }
});

it.each([
  ['light', 'light', 'silver', 'sky'],
  ['dark', 'dark', 'graphite', 'deep-blue'],
  ['system', 'light', 'silver', 'sky'],
  ['system', 'dark', 'graphite', 'deep-blue'],
] as const)('paired looks retain %s mode on a %s phone', async (mode, scheme, preset, picked) => {
  const storage = createStorage(memoryBackend());
  storage.set(appearanceKey, { preset, mode });
  await renderMe(<CustomiseScreen onBack={() => {}} onAdvanced={() => {}} />, { storage, scheme });
  await fireEvent.press(screen.getByTestId(`customise-preset-${picked}`));
  expect(storage.get(appearanceKey)).toEqual({ preset: picked, mode });
});

it('registers the real appearance.custom schema and ignores a pulled edit set that fails contrast', () => {
  const key = DEFAULT_DOMAINS.settings!.find((k) => k.key === 'appearance.custom')!;
  expect(key).toBe(appearanceCustomKey);
  const custom: AppearanceCustom = { scriptureFont: null, edits: { silver: { text: '#F2F3F5', muted: '#F2F3F5' } } };
  const checked = checkPulledSetting(key, { key: 'appearance.custom', json: JSON.stringify(custom), updatedAt: 1, deviceId: 'remote' });
  expect(checked?.side.valid).toBe(true);
  expect(applyCustom('silver', checked!.value as AppearanceCustom)).toEqual(getTheme('silver'));
});

it.each([
  '{',
  JSON.stringify({ scriptureFont: 'unknown', edits: {} }),
  JSON.stringify({ scriptureFont: null, edits: { silver: { text: '#nope' } } }),
  JSON.stringify({ scriptureFont: null, edits: { unknown: { text: '#FFFFFF' } } }),
  JSON.stringify({ scriptureFont: null, edits: {}, extra: 'x'.repeat(4000) }),
])('refuses malformed or oversized pulled appearance.custom: %#', (json) => {
  const checked = checkPulledSetting(appearanceCustomKey, { key: 'appearance.custom', json, updatedAt: 1, deviceId: 'remote' });
  expect(checked?.side.valid).toBe(false);
  expect(checked?.value).toBeUndefined();
});
