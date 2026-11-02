// R-6a round 3: real providers/storage, with device changes delivered before queued presses.
import { act, fireEvent, render, screen } from '@testing-library/react-native';
import { findEventHandler } from '@testing-library/react-native/dist/events/propagation';
import type { ReactElement } from 'react';
import { Appearance } from 'react-native';
import { SafeAreaProvider } from 'react-native-safe-area-context';

import { I18nProvider } from '../../i18n/I18nProvider';
import { appearanceCustomKey } from '../../storage/appearanceCustomKey';
import { appearanceKey } from '../../storage/keys';
import { createStorage, memoryBackend, setStorageForTesting } from '../../storage/storage';
import { ACCENT_CHOICES, NO_CUSTOM, setTokenEdit, type EditResult } from '../../theme/custom';
import { resolvePresetId } from '../../theme/resolve';
import { ThemeProvider, useAppearance } from '../../theme/ThemeProvider';
import type { AppearanceChoice, ThemeMode } from '../../theme/types';
import { AdvancedScreen } from '../AdvancedScreen';
import { CustomiseScreen } from '../CustomiseScreen';
import { useShowingPreset } from '../showingPreset';
import { EN } from './meHarness';

// The RN Jest preset replaces this hook with a constant light scheme; restore the real subscription.
jest.unmock('react-native/Libraries/Utilities/useColorScheme');

const customise = <CustomiseScreen onBack={() => {}} onAdvanced={() => {}} />;
const advanced = <AdvancedScreen onBack={() => {}} />;
function accepted(result: EditResult) {
  if (!result.ok) throw new Error(`Invalid test setup: ${JSON.stringify(result)}`);
  return result.custom;
}
function pressHandler(id: string): () => void {
  const { handler } = findEventHandler(screen.getByTestId(id), 'press', { bubbles: true });
  if (!handler) throw new Error(`No enabled press handler: ${id}`);
  return () => handler();
}

// Keep the actual useColorScheme hook. Mock only the device boundary it subscribes to;
// unlike renderMe's fixed systemScheme, both ThemeProvider and press handlers see this device.
async function mount(ui: ReactElement, choice: AppearanceChoice, initial: ThemeMode | null) {
  let scheme = initial;
  const listeners = new Set<Parameters<typeof Appearance.addChangeListener>[0]>();
  jest.spyOn(Appearance, 'getColorScheme').mockImplementation(() => scheme);
  jest.spyOn(Appearance, 'addChangeListener').mockImplementation((listener) => {
    listeners.add(listener);
    return { remove: () => { listeners.delete(listener); } };
  });
  const storage = createStorage(memoryBackend());
  storage.set(appearanceKey, choice);
  setStorageForTesting(storage);
  await render(
    <SafeAreaProvider initialMetrics={{ frame: { x: 0, y: 0, width: 390, height: 844 }, insets: { top: 47, left: 0, right: 0, bottom: 34 } }}>
      <I18nProvider storage={storage} locales={[EN]}>
        <ThemeProvider storage={storage}>{ui}</ThemeProvider>
      </I18nProvider>
    </SafeAreaProvider>,
  );
  return {
    storage,
    changeScheme(next: ThemeMode | null) {
      scheme = next;
      for (const listener of listeners) listener({ colorScheme: next });
    },
  };
}

afterEach(() => {
  jest.restoreAllMocks();
  setStorageForTesting(null);
});

// F10: visible mode and saved target mode differ for standalone presets. Keeping the saved
// mode when choosing a paired preset in the visible mode immediately shows its opposite partner.
it.each([
  ['liberty', 'dark', 'dark', 'sky'],
  ['liberty', 'system', 'dark', 'sky'],
  ['northern-lights', 'light', 'light', 'deep-blue'],
  ['northern-lights', 'system', 'light', 'deep-blue'],
] as const)('F10: from %s in %s mode on a %s phone, choosing %s shows that preset', async (preset, mode, scheme, next) => {
  const { storage } = await mount(customise, { preset, mode }, scheme);
  expect(screen.getByTestId(`customise-preset-${preset}`).props.accessibilityState.selected).toBe(true);
  await fireEvent.press(screen.getByTestId(`customise-preset-${next}`));
  expect(resolvePresetId(storage.get(appearanceKey), scheme)).toBe(next);
  expect(screen.getByTestId(`customise-preset-${next}`).props.accessibilityState.selected).toBe(true);
});

// F11: a recoverable scheme is frozen at render, so changes at the device boundary before
// the queued press send accent/reset/token writes to the previous preset.
it.each(['accent', 'reset', 'apply', 'submit', 'token-reset'] as const)(
  'F11: %s targets the current system preset when the phone changes before the press',
  async (action) => {
    const choice = { preset: 'strawberry-milk', mode: 'system' } as const;
    const { storage, changeScheme } = await mount(action === 'accent' || action === 'reset' ? customise : advanced, choice, 'light');
    if (action === 'reset' || action === 'token-reset') {
      const light = accepted(setTokenEdit(NO_CUSTOM, 'strawberry-milk', 'text', '#2A2A2A'));
      const both = accepted(setTokenEdit(light, 'bubblegum-night', 'text', '#FFFFFF'));
      await act(() => storage.set(appearanceCustomKey, both));
    }
    if (action === 'apply' || action === 'submit') {
      await fireEvent.changeText(screen.getByTestId('advanced-input-text'), '#FFFFFF');
    }
    const trigger = action === 'submit'
      ? screen.getByTestId('advanced-input-text').props.onSubmitEditing as () => void
      : pressHandler(action === 'accent' ? 'customise-accent-blue' : action === 'reset' ? 'customise-reset' : `advanced-${action === 'apply' ? 'apply' : 'reset'}-text`);
    const before = storage.get(appearanceCustomKey);
    await act(() => { changeScheme('dark'); trigger(); });
    expect(resolvePresetId(storage.get(appearanceKey), 'dark')).toBe('bubblegum-night');
    const after = storage.get(appearanceCustomKey);
    // The former light preset must never be edited or reset by this press.
    expect(after.edits['strawberry-milk']).toEqual(before.edits['strawberry-milk']);
    if (action === 'accent') expect(after.edits['bubblegum-night']?.accent).toBe(ACCENT_CHOICES[0].color);
    else if (action === 'reset' || action === 'token-reset') expect(after.edits['bubblegum-night']).toBeUndefined();
    else expect(after.edits['bubblegum-night']?.text).toBe('#FFFFFF');
  },
);

it('F11: a dark-to-null phone change with preset:null resolves the light default without writes', async () => {
  let read: (() => string) | undefined;
  let visible: string | undefined;
  function Probe() {
    read = useShowingPreset();
    visible = useAppearance().presetId;
    return null;
  }
  const { storage, changeScheme } = await mount(<Probe />, { preset: null, mode: 'system' }, 'dark');
  expect(visible).toBe('graphite');
  const pressRead = read!;
  const write = jest.spyOn(storage, 'set');
  let atPress: string | undefined;
  await act(() => { changeScheme(null); atPress = pressRead(); });
  expect(write).not.toHaveBeenCalled();
  expect(visible).toBe('silver');
  expect(atPress).toBe(visible);
});

it.each([
  ['liberty', 'dark'],
  ['northern-lights', 'light'],
  [null, null],
] as const)('control: the write-free reader agrees with the provider for %s on a %s phone', async (preset, scheme) => {
  let read: (() => string) | undefined;
  let visible: string | undefined;
  function Probe() {
    read = useShowingPreset();
    visible = useAppearance().presetId;
    return null;
  }
  const { storage } = await mount(<Probe />, { preset, mode: 'system' }, scheme);
  const write = jest.spyOn(storage, 'set');
  expect(read!()).toBe(visible);
  expect(write).not.toHaveBeenCalled();
});

it('control: a refused Advanced action keeps its error and draft until an applied write clears them', async () => {
  const { storage } = await mount(advanced, { preset: 'strawberry-milk', mode: 'light' }, null);
  await fireEvent.changeText(screen.getByTestId('advanced-input-text'), 'invalid');
  const write = jest.spyOn(storage, 'set');
  await fireEvent.press(screen.getByTestId('advanced-apply-text'));
  const error = screen.getByTestId('advanced-error-text').props.children;
  await fireEvent(screen.getByTestId('advanced-input-text'), 'submitEditing');
  expect(write).not.toHaveBeenCalled();
  expect(screen.getByTestId('advanced-error-text').props.children).toBe(error);
  expect(screen.getByTestId('advanced-input-text').props.value).toBe('invalid');
  await fireEvent.changeText(screen.getByTestId('advanced-input-text'), '#2A2A2A');
  expect(screen.getByTestId('advanced-error-text').props.children).toBe(error);
  await fireEvent.press(screen.getByTestId('advanced-apply-text'));
  expect(write.mock.calls.filter(([key]) => key.key === appearanceCustomKey.key)).toHaveLength(1);
  expect(screen.queryByTestId('advanced-error-text')).toBeNull();
});
