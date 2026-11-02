// Acceptance (orchestrator-owned, R-7a UI): the first-run gate and its three steps, as approved
// (bible-app-work/design/proposed/r7a-welcome.html, r7a-look.html, r7a-age.html) with GO-AHEAD's fixes:
// Back and "Skip for now" on steps 2 and 3, a scrolling middle with a pinned footer on the look step, the age
// step as a radio group with consistent Chinese bands and the why line, and no muted text on the aurora.
// The implementer may not edit this file.
import { act, fireEvent, render, screen } from '@testing-library/react-native';
import type { ReactNode } from 'react';
import { StyleSheet, Text } from 'react-native';
import { SafeAreaProvider } from 'react-native-safe-area-context';

import { I18nProvider } from '../../i18n/I18nProvider';
import type { DeviceLocale } from '../../i18n/types';
import { appearanceKey } from '../../storage/keys';
import { createStorage, memoryBackend, setStorageForTesting, type Storage } from '../../storage/storage';
import { getTheme } from '../../theme/presets';
import { ThemeProvider } from '../../theme/ThemeProvider';
import type { AppearanceChoice, PresetId, ThemeMode } from '../../theme/types';
import { FirstRunGate } from '../FirstRunGate';
import { onboardingKey } from '../keys';
import { chipEdge } from '../paint';
import { isSignInAllowed } from '../signIn';

const EN: DeviceLocale = { languageTag: 'en-US', languageCode: 'en', regionCode: 'US' };
const ZH: DeviceLocale = { languageTag: 'zh-Hans-CN', languageCode: 'zh', scriptCode: 'Hans', regionCode: 'CN' };

interface Opts {
  scheme?: ThemeMode;
  locale?: DeviceLocale;
  appearance?: AppearanceChoice;
}

function Providers({ storage, scheme, locale, children }: { storage: Storage; scheme: ThemeMode; locale: DeviceLocale; children: ReactNode }) {
  return (
    <SafeAreaProvider
      initialMetrics={{ frame: { x: 0, y: 0, width: 390, height: 844 }, insets: { top: 47, left: 0, right: 0, bottom: 34 } }}
    >
      <I18nProvider storage={storage} locales={[locale]}>
        <ThemeProvider storage={storage} systemScheme={scheme}>
          {children}
        </ThemeProvider>
      </I18nProvider>
    </SafeAreaProvider>
  );
}

async function start({ scheme = 'light', locale = EN, appearance }: Opts = {}) {
  const storage = createStorage(memoryBackend());
  if (appearance) storage.set(appearanceKey, appearance);
  setStorageForTesting(storage);
  await render(
    <Providers storage={storage} scheme={scheme} locale={locale}>
      <FirstRunGate storage={storage}>
        <Text testID="app-content">app</Text>
      </FirstRunGate>
    </Providers>,
  );
  return storage;
}

afterEach(() => setStorageForTesting(null));

const press = async (el: Parameters<typeof fireEvent.press>[0]) => {
  await act(async () => fireEvent.press(el));
};
const button = (name: string | RegExp) => screen.getByRole('button', { name });
const radio = (name: string | RegExp) => screen.getByRole('radio', { name });
type Host = ReturnType<typeof screen.getByTestId>;
const isChecked = (el: Host) => el.props['aria-checked'] === true || el.props.accessibilityState?.checked === true;
const isInside = (el: Host | null, ancestor: Host) => {
  for (let n = el; n; n = n.parent) if (n === ancestor) return true;
  return false;
};
const textOf = (el: Host): string =>
  el.children.map((c) => (typeof c === 'string' ? c : textOf(c as Host))).join('');

async function toLook(opts?: Opts) {
  const storage = await start(opts);
  await press(button(opts?.locale === ZH ? '开始' : 'Get started'));
  return storage;
}

async function toAge(opts?: Opts) {
  const storage = await toLook(opts);
  await press(button(opts?.locale === ZH ? '继续' : 'Continue'));
  return storage;
}

/** Every Text drawn in the muted colour must sit on a text card (an ancestor whose testID ends in "-card"). */
function mutedOffCard(preset: PresetId): string[] {
  const muted = getTheme(preset).colors.muted;
  const out: string[] = [];
  for (const t of screen.UNSAFE_root.findAll((n) => typeof n.type === 'string' && n.type === 'Text', { deep: true })) {
    const colour = StyleSheet.flatten(t.props.style)?.color;
    if (colour !== muted) continue;
    let onCard = false;
    for (let n = t.parent; n; n = n.parent) {
      if (typeof n.props?.testID === 'string' && n.props.testID.endsWith('-card')) onCard = true;
    }
    if (!onCard) out.push(textOf(t as unknown as Host));
  }
  return out;
}

function minSize(el: Host) {
  const s = StyleSheet.flatten(el.props.style) ?? {};
  return { h: Number(s.minHeight ?? s.height ?? 0), w: Number(s.minWidth ?? s.width ?? 0) };
}

describe('the gate', () => {
  it('shows the welcome on a fresh device instead of the app', async () => {
    await start();
    expect(screen.getByTestId('first-run-welcome')).toBeTruthy();
    expect(screen.queryByTestId('app-content')).toBeNull();
  });

  it('shows the app once the intro is done', async () => {
    const storage = createStorage(memoryBackend());
    storage.set(onboardingKey, { done: true, ageRange: null });
    setStorageForTesting(storage);
    await render(
      <Providers storage={storage} scheme="light" locale={EN}>
        <FirstRunGate storage={storage}>
          <Text testID="app-content">app</Text>
        </FirstRunGate>
      </Providers>,
    );
    expect(screen.getByTestId('app-content')).toBeTruthy();
    expect(screen.queryByTestId('first-run-welcome')).toBeNull();
  });
});

describe('step 1: welcome', () => {
  it('shows the name, the line, the verse on a card, the step and Get started', async () => {
    await start();
    expect(screen.getByRole('header', { name: 'Bible App' })).toBeTruthy();
    expect(screen.getByText('Read the Bible, keep what you find, and come back each day.')).toBeTruthy();
    const verse = screen.getByText('The Light shines in the darkness, and the darkness has not overcome it.');
    expect(screen.getByText('John 1:5 · BSB')).toBeTruthy();
    const card = screen.getByTestId('welcome-verse-card');
    expect(isInside(verse, card)).toBe(true);
    expect(screen.getByLabelText('Step 1 of 3')).toBeTruthy();
    expect(screen.queryByRole('button', { name: 'Back' })).toBeNull();
  });

  it('Skip ends the intro with the default look, keeping light/dark', async () => {
    const storage = await start({ appearance: { preset: 'sky', mode: 'dark' } });
    await press(button('Skip'));
    expect(storage.get(onboardingKey)).toEqual({ done: true, ageRange: null });
    expect(storage.get(appearanceKey)).toEqual({ preset: null, mode: 'dark' });
    expect(screen.getByTestId('app-content')).toBeTruthy();
  });

  it('Get started goes to step 2', async () => {
    await toLook();
    expect(screen.getByTestId('first-run-look')).toBeTruthy();
    expect(screen.queryByTestId('first-run-welcome')).toBeNull();
  });

  it('in Chinese', async () => {
    await start({ locale: ZH });
    expect(screen.getByRole('header', { name: '圣经' })).toBeTruthy();
    expect(button('跳过')).toBeTruthy();
    expect(button('开始')).toBeTruthy();
    expect(screen.getByLabelText('第 1 步，共 3 步')).toBeTruthy();
  });
});

describe('step 2: pick your look', () => {
  it('shows the presets for the phone’s mode, with the current look checked', async () => {
    await toLook({ scheme: 'light' });
    expect(screen.getByRole('header', { name: 'Pick your look' })).toBeTruthy();
    expect(screen.getByText('You can change it any time in Me → Appearance.')).toBeTruthy();
    expect(screen.getByLabelText('Step 2 of 3')).toBeTruthy();
    const pastel = screen.getByRole('radiogroup', { name: 'Neubrutalist pastel' });
    const glass = screen.getByRole('radiogroup', { name: 'Aurora glass' });
    for (const n of ['Strawberry milk', 'Matcha latte', 'Lavender haze']) expect(isInside(radio(n), pastel)).toBe(true);
    for (const n of ['Liberty', 'Silver', 'Sky']) expect(isInside(radio(n), glass)).toBe(true);
    expect(screen.getAllByRole('radio')).toHaveLength(6);
    expect(isChecked(radio('Silver'))).toBe(true);
    expect(screen.getAllByRole('radio').filter(isChecked)).toHaveLength(1);
  });

  it('a dark phone shows the dark presets, Graphite checked', async () => {
    await toLook({ scheme: 'dark' });
    for (const n of ['Bubblegum night', 'Matcha night', 'Grape soda', 'Northern lights', 'Graphite', 'Deep blue']) {
      expect(radio(n)).toBeTruthy();
    }
    expect(isChecked(radio('Graphite'))).toBe(true);
  });

  it('a tile re-themes the app live and keeps light/dark', async () => {
    const storage = await toLook();
    await press(radio('Sky'));
    expect(storage.get(appearanceKey)).toEqual({ preset: 'sky', mode: 'system' });
    expect(isChecked(radio('Sky'))).toBe(true);
    expect(isChecked(radio('Silver'))).toBe(false);
    expect(storage.get(onboardingKey).done).toBe(false);
  });

  it('a style card picks that style’s default for the mode', async () => {
    const storage = await toLook({ scheme: 'dark' });
    await press(screen.getByTestId('look-style-pastel'));
    expect(isChecked(radio('Bubblegum night'))).toBe(true);
    await press(screen.getByTestId('look-style-glass'));
    expect(isChecked(radio('Graphite'))).toBe(true);
    expect(storage.get(appearanceKey).mode).toBe('system');
  });

  it('names the other mode’s look, and hides that line for a look with no pair', async () => {
    await toLook({ scheme: 'light' });
    expect(screen.getByText('Light and dark follow your phone.')).toBeTruthy();
    expect(textOf(screen.getByTestId('look-pair'))).toBe('In dark mode: Graphite.');
    await press(radio('Strawberry milk'));
    expect(textOf(screen.getByTestId('look-pair'))).toBe('In dark mode: Bubblegum night.');
    await press(radio('Liberty'));
    expect(screen.queryByTestId('look-pair')).toBeNull();
  });

  it('on a dark phone the line names the light look', async () => {
    await toLook({ scheme: 'dark' });
    expect(textOf(screen.getByTestId('look-pair'))).toBe('In light mode: Silver.');
  });

  it('with light or dark fixed (not following the phone), the follow line and the pair are hidden', async () => {
    await toLook({ appearance: { preset: null, mode: 'dark' } });
    expect(screen.queryByText('Light and dark follow your phone.')).toBeNull();
    expect(screen.queryByTestId('look-pair')).toBeNull();
  });

  it('the middle scrolls and the footer (step and Continue) stays outside it', async () => {
    await toLook();
    const scroll = screen.getByTestId('first-run-look-scroll');
    expect(isInside(radio('Sky'), scroll)).toBe(true);
    expect(isInside(button('Continue'), scroll)).toBe(false);
    expect(isInside(screen.getByLabelText('Step 2 of 3'), scroll)).toBe(false);
  });

  it('Back (44 pt) returns to step 1', async () => {
    await toLook();
    const back = button('Back');
    expect(minSize(back).h).toBeGreaterThanOrEqual(44);
    expect(minSize(back).w).toBeGreaterThanOrEqual(44);
    await press(back);
    expect(screen.getByTestId('first-run-welcome')).toBeTruthy();
  });

  it('"Skip for now" ends the intro and keeps the look picked so far', async () => {
    const storage = await toLook();
    await press(radio('Matcha latte'));
    const skip = button('Skip for now');
    expect(minSize(skip).h).toBeGreaterThanOrEqual(44);
    await press(skip);
    expect(storage.get(onboardingKey)).toEqual({ done: true, ageRange: null });
    expect(storage.get(appearanceKey)).toEqual({ preset: 'matcha-latte', mode: 'system' });
    expect(screen.getByTestId('app-content')).toBeTruthy();
  });

  it('in Chinese', async () => {
    await toLook({ locale: ZH });
    expect(screen.getByRole('header', { name: '选择外观' })).toBeTruthy();
    expect(button('返回')).toBeTruthy();
    expect(button('暂时跳过')).toBeTruthy();
    expect(button('继续')).toBeTruthy();
    expect(screen.getByRole('radiogroup', { name: '极光玻璃' })).toBeTruthy();
    expect(radio('银色')).toBeTruthy();
    expect(textOf(screen.getByTestId('look-pair'))).toBe('深色模式：石墨。');
  });
});

describe('step 3: your age', () => {
  const EN_AGES = ['Under 13', '13–17', '18–24', '25–34', '35–49', '50–64', '65+', 'Prefer not to say'];
  const ZH_AGES = ['13岁以下', '13–17岁', '18–24岁', '25–34岁', '35–49岁', '50–64岁', '65岁及以上', '不便透露'];

  it('is a radio group of the age bands, none chosen, with why it asks', async () => {
    await toAge();
    expect(screen.getByRole('header', { name: 'Your age' })).toBeTruthy();
    const group = screen.getByRole('radiogroup', { name: 'Your age' });
    const radios = screen.getAllByRole('radio');
    expect(radios.map((r) => textOf(r))).toEqual(EN_AGES);
    for (const r of radios) {
      expect(isInside(r, group)).toBe(true);
      expect(isChecked(r)).toBe(false);
    }
    expect(screen.getByText('Optional. It stays on this device.')).toBeTruthy();
    expect(
      screen.getByText('We ask so the app can suit your age. Under 13 keeps everything on this device, with no sign-in.'),
    ).toBeTruthy();
    expect(screen.getByLabelText('Step 3 of 3')).toBeTruthy();
  });

  it('one band at most; pressing the chosen one again clears it', async () => {
    await toAge();
    await press(radio('25–34'));
    expect(isChecked(radio('25–34'))).toBe(true);
    await press(radio('18–24'));
    expect(screen.getAllByRole('radio').filter(isChecked).map((r) => textOf(r))).toEqual(['18–24']);
    await press(radio('18–24'));
    expect(screen.getAllByRole('radio').filter(isChecked)).toHaveLength(0);
  });

  it('Start reading saves the band and opens the app', async () => {
    const storage = await toAge();
    await press(radio('25–34'));
    await press(button('Start reading'));
    expect(storage.get(onboardingKey)).toEqual({ done: true, ageRange: '25-34' });
    expect(screen.getByTestId('app-content')).toBeTruthy();
  });

  it('Start reading with nothing chosen, or "Prefer not to say", saves no age', async () => {
    const a = await toAge();
    await press(button('Start reading'));
    expect(a.get(onboardingKey)).toEqual({ done: true, ageRange: null });
    screen.unmount();
    const b = await toAge();
    await press(radio('Prefer not to say'));
    await press(button('Start reading'));
    expect(b.get(onboardingKey)).toEqual({ done: true, ageRange: null });
  });

  it('Under 13 is saved, and turns sign-in off', async () => {
    const storage = await toAge();
    await press(radio('Under 13'));
    await press(button('Start reading'));
    expect(storage.get(onboardingKey)).toEqual({ done: true, ageRange: 'under-13' });
    expect(isSignInAllowed(storage.get(onboardingKey))).toBe(false);
  });

  it('"Skip for now" saves no age, even with one chosen, and keeps the look', async () => {
    const storage = await toLook();
    await press(radio('Sky'));
    await press(button('Continue'));
    await press(radio('18–24'));
    await press(button('Skip for now'));
    expect(storage.get(onboardingKey)).toEqual({ done: true, ageRange: null });
    expect(storage.get(appearanceKey).preset).toBe('sky');
  });

  it('Back (44 pt) returns to step 2 with the look still picked', async () => {
    await toLook();
    await press(radio('Sky'));
    await press(button('Continue'));
    const back = button('Back');
    expect(minSize(back).h).toBeGreaterThanOrEqual(44);
    await press(back);
    expect(isChecked(radio('Sky'))).toBe(true);
  });

  it('on glass, an unselected chip has the 3:1 edge', async () => {
    await toAge({ appearance: { preset: 'liberty', mode: 'system' } });
    const s = StyleSheet.flatten(radio('25–34').props.style);
    const edge = chipEdge(getTheme('liberty'));
    expect(s.borderColor).toBe(edge.color);
    expect(Number(s.borderWidth)).toBeGreaterThanOrEqual(edge.width);
  });

  it('in Chinese, with consistent bands', async () => {
    await toAge({ locale: ZH });
    expect(screen.getByRole('radiogroup', { name: '你的年龄' })).toBeTruthy();
    expect(screen.getAllByRole('radio').map((r) => textOf(r))).toEqual(ZH_AGES);
    expect(button('开始阅读')).toBeTruthy();
    expect(button('暂时跳过')).toBeTruthy();
    expect(screen.getByLabelText('第 3 步，共 3 步')).toBeTruthy();
  });
});

describe('on the aurora', () => {
  const steps: [string, (o: Opts) => Promise<Storage>][] = [
    ['welcome', start],
    ['look', toLook],
    ['age', toAge],
  ];

  it.each(steps)('%s: glass looks show the aurora, pastel looks do not', async (_name, go) => {
    await go({ appearance: { preset: 'silver', mode: 'system' } });
    expect(screen.getAllByTestId('aurora-background').length).toBeGreaterThan(0);
    screen.unmount();
    await go({ appearance: { preset: 'strawberry-milk', mode: 'system' } });
    expect(screen.queryAllByTestId('aurora-background')).toHaveLength(0);
  });

  it.each(steps)('%s: no muted text sits directly on the aurora (Liberty, Northern lights, Silver)', async (_name, go) => {
    for (const [preset, scheme] of [
      ['liberty', 'light'],
      ['northern-lights', 'dark'],
      ['silver', 'light'],
    ] as const) {
      await go({ scheme, appearance: { preset, mode: 'system' } });
      expect([preset, mutedOffCard(preset)]).toEqual([preset, []]);
      screen.unmount();
    }
  });
});
