// Acceptance (orchestrator-owned, R-7a): the moving aurora's palette, text shadow, loop and wiring.
import { render } from '@testing-library/react-native';
import { StyleSheet } from 'react-native';
import { SafeAreaProvider } from 'react-native-safe-area-context';

import { Screen } from '../../components/Screen';
import { I18nProvider } from '../../i18n/I18nProvider';
import { appearanceKey } from '../../storage/keys';
import { createStorage, memoryBackend, setStorageForTesting } from '../../storage/storage';
import { GLOW_D, GLOW_L } from '../../theme/palettes';
import { getTheme } from '../../theme/presets';
import { ThemeProvider } from '../../theme/ThemeProvider';
import { PRESET_IDS, type PresetId, type Theme } from '../../theme/types';
import { auroraState, createAuroraLoop, type AuroraRenderer } from '../loop';
import { auroraPalette, type Rgb } from '../palette';
import { SHADOW_COVERAGE, auroraTextShadow, shadowedContrast } from '../textShadow';

const hex = (h: string): Rgb => [1, 3, 5].map((i) => parseInt(h.slice(i, i + 2), 16) / 255) as unknown as Rgb;
const rgba = (s: string): [number, number, number, number] => {
  const m = /rgba\((\d+), (\d+), (\d+), ([\d.]+)\)/.exec(s)!;
  return [Number(m[1]) / 255, Number(m[2]) / 255, Number(m[3]) / 255, Number(m[4])];
};
const over = (top: [number, number, number, number], base: Rgb): Rgb =>
  [0, 1, 2].map((i) => base[i]! + (top[i]! - base[i]!) * top[3]) as unknown as Rgb;

const GLASS: PresetId[] = PRESET_IDS.filter((id) => getTheme(id).style === 'glass');
const PASTEL: PresetId[] = PRESET_IDS.filter((id) => getTheme(id).style === 'pastel');

function expectRgb(got: Rgb, want: Rgb) {
  for (let i = 0; i < 3; i++) expect(Math.abs(got[i]! - want[i]!)).toBeLessThanOrEqual(1.5 / 255);
}

describe('aurora palette', () => {
  it('has the base and the three glow colours of each glass preset (glows over the base where translucent)', () => {
    expect(GLASS).toHaveLength(6);
    for (const p of GLOW_L) {
      const pal = auroraPalette(getTheme(p.id))!;
      expectRgb(pal.base, hex(p.base));
      [p.a, p.b, p.c].forEach((c, i) => expectRgb(pal.colours[i]!, hex(c)));
    }
    for (const p of GLOW_D) {
      const pal = auroraPalette(getTheme(p.id))!;
      expectRgb(pal.base, hex(p.base));
      expectRgb(pal.colours[0], hex(p.a));
      expectRgb(pal.colours[1], hex(p.b));
      expectRgb(pal.colours[2], over(rgba(p.glow), hex(p.base)));
    }
  });

  it('is read from the theme app background, so a customised theme follows', () => {
    const silver = getTheme('silver');
    const custom: Theme = { ...silver, backgrounds: { ...silver.backgrounds, app: getTheme('deep-blue').backgrounds.app } };
    expect(auroraPalette(custom)).toEqual(auroraPalette(getTheme('deep-blue')));
  });

  it('is null for the pastel presets', () => {
    for (const id of PASTEL) expect(auroraPalette(getTheme(id))).toBeNull();
  });
});

describe('text on the aurora', () => {
  it('measures shadowed text against the background seen through the shadow at SHADOW_COVERAGE of its alpha', () => {
    expect(SHADOW_COVERAGE).toBe(0.5);
    // Black on black through a white halo: the halo counts at half, so black on mid grey (#808080).
    expect(shadowedContrast('#000000', '#FFFFFF', [0, 0, 0])).toBeCloseTo(5.28, 1);
    expect(shadowedContrast('#000000', 'rgba(255, 255, 255, 0)', [0, 0, 0])).toBeCloseTo(1, 5);
    expect(shadowedContrast('#FFFFFF', '#000000', [1, 1, 1])).toBeCloseTo(3.98, 1);
  });

  it('keeps text and secondary text at 4.5:1 over every aurora colour in every glass preset', () => {
    const failures: string[] = [];
    for (const id of GLASS) {
      const theme = getTheme(id);
      const shadow = auroraTextShadow(theme);
      expect(shadow.textShadowColor).toEqual(expect.any(String));
      expect(shadow.textShadowRadius).toBeGreaterThanOrEqual(8);
      expect(shadow.textShadowOffset).toEqual({ width: 0, height: 0 });
      const pal = auroraPalette(theme)!;
      for (const [name, colour] of [
        ['text', theme.colors.text],
        ['muted', theme.colors.muted],
      ] as const) {
        for (const bg of [pal.base, ...pal.colours]) {
          const ratio = shadowedContrast(colour, shadow.textShadowColor as string, bg);
          if (ratio < 4.5) failures.push(`${id} ${name} ${ratio.toFixed(2)}`);
        }
      }
    }
    expect(failures).toEqual([]);
  });

  it('adds no shadow in the pastel presets', () => {
    for (const id of PASTEL) expect(auroraTextShadow(getTheme(id))).toEqual({});
  });
});

describe('aurora state', () => {
  const base = { glass: true, supported: true, reduceMotion: false, focused: true, visible: true };
  it('runs only for a glass look on a showing, focused screen, and is still under Reduce Motion', () => {
    expect(auroraState(base)).toBe('running');
    expect(auroraState({ ...base, glass: false })).toBe('off');
    expect(auroraState({ ...base, supported: false })).toBe('off');
    expect(auroraState({ ...base, reduceMotion: true })).toBe('still');
    expect(auroraState({ ...base, reduceMotion: true, focused: false })).toBe('still');
    expect(auroraState({ ...base, focused: false })).toBe('paused');
    expect(auroraState({ ...base, visible: false })).toBe('paused');
    expect(auroraState({ ...base, glass: false, reduceMotion: true })).toBe('off');
  });
});

describe('aurora loop', () => {
  function harness() {
    const calls: string[] = [];
    const dts: number[] = [];
    const renderer: AuroraRenderer = {
      step: (dt) => {
        calls.push('step');
        dts.push(dt);
      },
      draw: () => void calls.push('draw'),
    };
    let next = 1;
    const pending = new Map<number, (t: number) => void>();
    const clock = {
      request: (cb: (t: number) => void) => {
        const id = next++;
        pending.set(id, cb);
        return id;
      },
      cancel: (id: number) => void pending.delete(id),
    };
    const tick = (t: number) => {
      const cbs = [...pending.values()];
      pending.clear();
      cbs.forEach((cb) => cb(t));
    };
    const loop = createAuroraLoop(renderer, clock);
    return { loop, calls, dts, tick, pending };
  }

  it('steps and draws once per frame while running, with dt from the clock, capped at 1/20 s', () => {
    const h = harness();
    h.loop.setState('running');
    h.tick(1000);
    h.tick(1016);
    h.tick(1032);
    h.tick(2032); // a long gap (a slow frame): capped
    expect(h.calls.filter((c) => c === 'draw')).toHaveLength(4);
    expect(h.dts[0]).toBeCloseTo(1 / 60, 5);
    expect(h.dts[1]).toBeCloseTo(0.016, 5);
    expect(h.dts[3]).toBeCloseTo(1 / 20, 5);
    expect(h.loop.frames()).toBe(4);
  });

  it('requests no frames when paused or off, and does not count paused time when it resumes', () => {
    const h = harness();
    h.loop.setState('running');
    h.tick(1000);
    h.loop.setState('paused');
    expect(h.pending.size).toBe(0);
    const before = h.calls.length;
    h.tick(5000);
    expect(h.calls.length).toBe(before);
    h.loop.setState('running');
    h.tick(9000);
    expect(h.dts[h.dts.length - 1]).toBeCloseTo(1 / 60, 5);
    h.loop.setState('off');
    expect(h.pending.size).toBe(0);
  });

  it('draws exactly one still frame under Reduce Motion and requests no more', () => {
    const h = harness();
    h.loop.setState('still');
    expect(h.calls).toEqual(['step', 'draw']);
    expect(h.pending.size).toBe(0);
    h.loop.setState('still');
    expect(h.calls).toEqual(['step', 'draw']);
  });

  it('stops for good when destroyed', () => {
    const h = harness();
    h.loop.setState('running');
    h.loop.destroy();
    expect(h.pending.size).toBe(0);
    h.loop.setState('running');
    expect(h.pending.size).toBe(0);
  });
});

describe('the aurora in Screen', () => {
  async function renderScreen(preset: PresetId, background: 'app' | 'reader') {
    const storage = createStorage(memoryBackend());
    storage.set(appearanceKey, { preset, mode: 'system' });
    setStorageForTesting(storage);
    return render(
      <SafeAreaProvider
        initialMetrics={{ frame: { x: 0, y: 0, width: 390, height: 844 }, insets: { top: 47, left: 0, right: 0, bottom: 34 } }}
      >
        <I18nProvider storage={storage} locales={[{ languageTag: 'en-US', languageCode: 'en', regionCode: 'US' }]}>
          <ThemeProvider storage={storage} systemScheme="light">
            <Screen titleKey="screen.home.title" background={background} testID="screen-x" />
          </ThemeProvider>
        </I18nProvider>
      </SafeAreaProvider>,
    );
  }
  afterEach(() => setStorageForTesting(null));

  it('sits behind a glass app screen, and the title on it gets the soft shadow', async () => {
    const ui = await renderScreen('silver', 'app');
    expect(ui.getByTestId('aurora-background')).toBeTruthy();
    const title = StyleSheet.flatten(ui.getByRole('header').props.style);
    expect(title.textShadowColor).toBe(auroraTextShadow(getTheme('silver')).textShadowColor);
  });

  it('is never behind Scripture (the reader background) or in a pastel look', async () => {
    expect((await renderScreen('silver', 'reader')).queryByTestId('aurora-background')).toBeNull();
    const pastel = await renderScreen('matcha-latte', 'app');
    expect(pastel.queryByTestId('aurora-background')).toBeNull();
    expect(StyleSheet.flatten(pastel.getByRole('header').props.style).textShadowColor).toBeUndefined();
  });
});
