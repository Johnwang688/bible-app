// Acceptance (orchestrator-owned, R-7a UI): the Moving background option for Customise, as approved
// (bible-app-work/design/proposed/r7a-aurora-option.html) with GO-AHEAD's fixes: the Reduce Motion state (both
// rows disabled, with its own note) and no muted text directly on the aurora. Mounting it in Customise waits
// for R-6a. The implementer may not edit this file.
import { act, fireEvent, render, screen } from '@testing-library/react-native';
import { AccessibilityInfo, Platform as RNPlatform, StyleSheet } from 'react-native';

import { I18nProvider } from '../../i18n/I18nProvider';
import type { DeviceLocale } from '../../i18n/types';
import { appearanceKey } from '../../storage/keys';
import { createStorage, memoryBackend, setStorageForTesting, type Storage } from '../../storage/storage';
import { getTheme } from '../../theme/presets';
import { ThemeProvider } from '../../theme/ThemeProvider';
import type { PresetId } from '../../theme/types';
import { AuroraOption } from '../AuroraOption';
import { auroraStyleKey } from '../keys';

const EN: DeviceLocale = { languageTag: 'en-US', languageCode: 'en', regionCode: 'US' };
const ZH: DeviceLocale = { languageTag: 'zh-Hans-CN', languageCode: 'zh', scriptCode: 'Hans', regionCode: 'CN' };

type Host = ReturnType<typeof screen.getByTestId>;
const isChecked = (el: Host) => el.props['aria-checked'] === true || el.props.accessibilityState?.checked === true;
const isDisabled = (el: Host) => el.props['aria-disabled'] === true || el.props.accessibilityState?.disabled === true;
/** A radio group by its label. Not by role: on iOS the group must not be an accessibility element (VoiceOver
 * cannot reach controls nested in one), and the test library's role queries only find accessibility elements. */
const radioGroup = (name: string) => {
  const found = screen.container.queryAll((n) => n.type === 'View' && n.props.role === 'radiogroup' && n.props['aria-label'] === name);
  expect(found).toHaveLength(1);
  return found[0] as unknown as Host;
};
const isInside = (el: Host, ancestor: Host) => {
  for (let n: Host | null = el; n; n = n.parent) if (n === ancestor) return true;
  return false;
};
const textOf = (el: Host): string => el.children.map((c) => (typeof c === 'string' ? c : textOf(c as Host))).join('');

async function show(preset: PresetId, { reduceMotion = false, locale = EN }: { reduceMotion?: boolean; locale?: DeviceLocale } = {}) {
  jest.spyOn(AccessibilityInfo, 'isReduceMotionEnabled').mockResolvedValue(reduceMotion);
  const storage: Storage = createStorage(memoryBackend());
  storage.set(appearanceKey, { preset, mode: 'system' });
  setStorageForTesting(storage);
  await render(
    <I18nProvider storage={storage} locales={[locale]}>
      <ThemeProvider storage={storage} systemScheme={getTheme(preset).mode}>
        <AuroraOption storage={storage} />
      </ThemeProvider>
    </I18nProvider>,
  );
  await act(async () => undefined); // the Reduce Motion read resolves
  return storage;
}

afterEach(() => {
  setStorageForTesting(null);
  jest.restoreAllMocks();
});

describe('the Moving background option', () => {
  it('on glass: two radios, Fluid (the default) checked, with descriptions and the motion note', async () => {
    await show('silver');
    const group = radioGroup('Moving background');
    const fluid = screen.getByRole('radio', { name: /^Fluid/ });
    const flow = screen.getByRole('radio', { name: /^Flow/ });
    expect(isInside(fluid, group) && isInside(flow, group)).toBe(true);
    expect(isChecked(fluid)).toBe(true);
    expect(isChecked(flow)).toBe(false);
    expect(screen.getByText('Drifts on its own. Stir it with a finger.')).toBeTruthy();
    expect(screen.getByText('A lighter, gentler drift.')).toBeTruthy();
    expect(textOf(screen.getByTestId('aurora-option-note'))).toBe(
      'When your phone asks for less motion, the background stays still.',
    );
    expect(isDisabled(fluid) || isDisabled(flow)).toBe(false);
  });

  it('choosing Flow saves it, and the check moves', async () => {
    const storage = await show('graphite');
    await act(async () => fireEvent.press(screen.getByRole('radio', { name: /^Flow/ })));
    expect(storage.get(auroraStyleKey)).toBe('flow');
    expect(isChecked(screen.getByRole('radio', { name: /^Flow/ }))).toBe(true);
    expect(isChecked(screen.getByRole('radio', { name: /^Fluid/ }))).toBe(false);
    await act(async () => fireEvent.press(screen.getByRole('radio', { name: /^Fluid/ })));
    expect(storage.get(auroraStyleKey)).toBe('fluid');
  });

  it('shows a saved Flow as checked', async () => {
    jest.spyOn(AccessibilityInfo, 'isReduceMotionEnabled').mockResolvedValue(false);
    const storage = createStorage(memoryBackend());
    storage.set(appearanceKey, { preset: 'sky', mode: 'system' });
    storage.set(auroraStyleKey, 'flow');
    await render(
      <I18nProvider storage={storage} locales={[EN]}>
        <ThemeProvider storage={storage} systemScheme="light">
          <AuroraOption storage={storage} />
        </ThemeProvider>
      </I18nProvider>,
    );
    expect(isChecked(screen.getByRole('radio', { name: /^Flow/ }))).toBe(true);
  });

  it('with Reduce Motion on: both rows disabled, nothing changes, and the note says why', async () => {
    const storage = await show('silver', { reduceMotion: true });
    const fluid = screen.getByRole('radio', { name: /^Fluid/ });
    const flow = screen.getByRole('radio', { name: /^Flow/ });
    expect(isDisabled(fluid)).toBe(true);
    expect(isDisabled(flow)).toBe(true);
    await act(async () => fireEvent.press(flow));
    expect(storage.get(auroraStyleKey)).toBe('fluid');
    expect(textOf(screen.getByTestId('aurora-option-note'))).toBe(
      'Animation is off because your phone asks for less motion.',
    );
  });

  it('on a pastel look: both rows disabled, "For Aurora glass looks."', async () => {
    const storage = await show('strawberry-milk');
    expect(isDisabled(screen.getByRole('radio', { name: /^Fluid/ }))).toBe(true);
    expect(isDisabled(screen.getByRole('radio', { name: /^Flow/ }))).toBe(true);
    await act(async () => fireEvent.press(screen.getByRole('radio', { name: /^Flow/ })));
    expect(storage.get(auroraStyleKey)).toBe('fluid');
    expect(textOf(screen.getByTestId('aurora-option-note'))).toBe('For Aurora glass looks.');
  });

  it('in Chinese', async () => {
    await show('silver', { locale: ZH });
    expect(radioGroup('动态背景')).toBeTruthy();
    expect(screen.getByRole('radio', { name: /^流体/ })).toBeTruthy();
    expect(screen.getByRole('radio', { name: /^流光/ })).toBeTruthy();
    expect(textOf(screen.getByTestId('aurora-option-note'))).toBe('手机开启“减弱动态效果”时，背景保持静止。');
    await screen.unmount();
    await show('silver', { locale: ZH, reduceMotion: true });
    expect(textOf(screen.getByTestId('aurora-option-note'))).toBe('手机已开启“减弱动态效果”，所以动画已关闭。');
  });

  it.each(['liberty', 'northern-lights', 'silver'] as const)('%s: no muted text sits directly on the aurora', async (preset) => {
    await show(preset);
    const muted = getTheme(preset).colors.muted;
    const off: string[] = [];
    for (const t of screen.container.queryAll((n) => n.type === 'Text')) {
      if (StyleSheet.flatten(t.props.style)?.color !== muted) continue;
      let onCard = false;
      for (let n = t.parent; n; n = n.parent) {
        if (typeof n.props?.testID === 'string' && n.props.testID.endsWith('-card')) onCard = true;
      }
      if (!onCard) off.push(textOf(t as unknown as Host));
    }
    expect(off).toEqual([]);
  });
});

// Acceptance (orchestrator-owned): the same iOS nesting Sol found in the first-run radio groups (flow review r1 F2).
describe('native accessibility', () => {
  it('does not nest the radios under an iOS accessibility element', async () => {
    const Platform = RNPlatform as { OS: string };
    const previous = Platform.OS;
    Platform.OS = 'ios';
    try {
      await show('silver');
      const groups = screen.container.queryAll((n) => n.type === 'View' && n.props.role === 'radiogroup');
      expect(groups.length).toBeGreaterThan(0);
      for (const group of groups) expect(group.props.accessible).not.toBe(true);
    } finally {
      Platform.OS = previous;
    }
  });
});
