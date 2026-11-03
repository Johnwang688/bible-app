// R7a-aurora (implementer's own tests): the loop's edges, palette reading edge cases, and the
// native drift's states.
import { act, render } from '@testing-library/react-native';
import { AccessibilityInfo, AppState } from 'react-native';

import { getTheme } from '../../theme/presets';
import { ThemeProvider } from '../../theme/ThemeProvider';
import { appearanceKey } from '../../storage/keys';
import { createStorage, memoryBackend, setStorageForTesting } from '../../storage/storage';
import type { Theme } from '../../theme/types';
import { AuroraBackground } from '../AuroraBackground';
import { createAuroraLoop, type AuroraRenderer } from '../loop';
import { auroraColours, auroraPalette, samePalette } from '../palette';
import { auroraTextShadow } from '../textShadow';

function harness() {
  const calls: string[] = [];
  let onStep: (() => void) | null = null;
  const renderer: AuroraRenderer = {
    step: () => {
      calls.push('step');
      onStep?.();
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
  return { loop, calls, tick, pending, setOnStep: (f: () => void) => (onStep = f) };
}

describe('aurora loop edges', () => {
  it('keeps one frame pending while running, however often the state is set', () => {
    const h = harness();
    h.loop.setState('running');
    h.loop.setState('running');
    expect(h.pending.size).toBe(1);
    h.tick(10);
    expect(h.pending.size).toBe(1);
  });

  it('redraws the still frame on request, and only when still', () => {
    const h = harness();
    h.loop.redraw();
    h.loop.setState('running');
    h.loop.redraw();
    expect(h.calls).toEqual([]);
    h.loop.setState('still');
    h.loop.redraw();
    expect(h.calls).toEqual(['step', 'draw', 'step', 'draw']);
    expect(h.loop.frames()).toBe(2);
    expect(h.pending.size).toBe(0);
  });

  it('cancels a pending frame when it goes still', () => {
    const h = harness();
    h.loop.setState('running');
    h.loop.setState('still');
    expect(h.pending.size).toBe(0);
    h.tick(100);
    expect(h.calls).toEqual(['step', 'draw']);
  });

  it('does not draw when destroyed during a frame', () => {
    const h = harness();
    h.loop.setState('running');
    h.setOnStep(() => h.loop.destroy());
    h.tick(10);
    expect(h.calls).toEqual(['step']);
    expect(h.pending.size).toBe(0);
    expect(h.loop.frames()).toBe(0);
  });

  it('caps a backwards clock at zero', () => {
    const dts: number[] = [];
    let cb: ((t: number) => void) | null = null;
    const loop = createAuroraLoop(
      { step: (dt) => void dts.push(dt), draw: () => undefined },
      { request: (f) => ((cb = f), 1), cancel: () => undefined },
    );
    loop.setState('running');
    cb!(100);
    cb!(50);
    expect(dts[1]).toBe(0);
  });
});

describe('aurora palette edges', () => {
  const silver = getTheme('silver');
  const withApp = (backgroundColor: string, backgroundImage?: string): Theme => ({
    ...silver,
    backgrounds: { ...silver.backgrounds, app: { backgroundColor, backgroundImage } },
  });

  it('is null for a paint it cannot read', () => {
    const base = silver.backgrounds.app.backgroundColor;
    const image = silver.backgrounds.app.backgroundImage!;
    expect(auroraPalette(withApp(base))).toBeNull();
    expect(auroraPalette(withApp('not-a-colour', image))).toBeNull();
    expect(auroraPalette(withApp(silver.backgrounds.surface.backgroundColor, image))).toBeNull(); // translucent base
    const twoLayers = image.split('), radial').slice(0, 2).join('), radial') + ')';
    expect(auroraPalette(withApp(base, twoLayers))).toBeNull();
  });

  it('takes the colours of the first three radial layers in the order [layer 1, layer 0, layer 2]', () => {
    const deep = getTheme('deep-blue');
    const css = auroraColours(deep)!;
    const layers = deep.backgrounds.app.backgroundImage!;
    expect(layers.indexOf(css.colours[1])).toBeLessThan(layers.indexOf(css.colours[0]));
    expect(css.base).toBe(deep.colors.base);
  });

  it('compares palettes by value', () => {
    expect(samePalette(auroraPalette(getTheme('sky'))!, auroraPalette(getTheme('sky'))!)).toBe(true);
    expect(samePalette(auroraPalette(getTheme('sky'))!, auroraPalette(getTheme('silver'))!)).toBe(false);
  });

  it('shadows text with the base colour', () => {
    expect(auroraTextShadow(silver).textShadowColor).toBe(silver.colors.base);
  });
});

describe('native drift', () => {
  function mount(preset: 'silver' | 'matcha-latte') {
    const storage = createStorage(memoryBackend());
    storage.set(appearanceKey, { preset, mode: 'system' });
    setStorageForTesting(storage);
    return render(
      <ThemeProvider storage={storage} systemScheme="light">
        <AuroraBackground />
      </ThemeProvider>,
    );
  }
  afterEach(() => {
    setStorageForTesting(null);
    jest.restoreAllMocks();
  });

  it('draws three orbs over the base, behind everything and untouchable', async () => {
    const ui = await mount('silver');
    const root = ui.getByTestId('aurora-background');
    expect(root.props.pointerEvents).toBe('none');
    expect(root.children).toHaveLength(3);
  });

  it('renders nothing in a pastel look', async () => {
    const ui = await mount('matcha-latte');
    expect(ui.queryByTestId('aurora-background')).toBeNull();
  });

  it('still renders under Reduce Motion and in the background', async () => {
    jest.spyOn(AccessibilityInfo, 'isReduceMotionEnabled').mockResolvedValue(true);
    const ui = await mount('silver');
    await act(async () => undefined);
    expect(ui.getByTestId('aurora-background')).toBeTruthy();
    const listeners: ((s: string) => void)[] = [];
    jest.spyOn(AppState, 'addEventListener').mockImplementation((_t, l) => {
      listeners.push(l as (s: string) => void);
      return { remove: () => undefined };
    });
    const again = await mount('silver');
    await act(async () => listeners.forEach((l) => l('background')));
    expect(again.getAllByTestId('aurora-background').length).toBeGreaterThan(0);
  });
});
