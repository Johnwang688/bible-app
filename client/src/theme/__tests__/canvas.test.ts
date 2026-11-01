// Acceptance (orchestrator-owned): the typed preset table matches the design canvas exactly.
import { GLOW_D, GLOW_L, POP_D, POP_L } from '../palettes';
import { buildCanvasTokens } from '../build';
import { PRESETS, THEMES, getTheme } from '../presets';
import { PRESET_IDS, type PresetId } from '../types';

// eslint-disable-next-line @typescript-eslint/no-require-imports
const canvas = require('./canvas-themes.js');

const withoutId = (rows: readonly { id: string }[]) => rows.map(({ id: _id, ...rest }) => rest);

describe('palettes', () => {
  it.each([
    ['POP_L', POP_L],
    ['POP_D', POP_D],
    ['GLOW_L', GLOW_L],
    ['GLOW_D', GLOW_D],
  ] as const)('%s equals the canvas array exactly', (name, rows) => {
    expect(withoutId(rows)).toEqual(canvas[name]);
  });

  it('gives all 12 presets distinct ids', () => {
    const ids = [...POP_L, ...POP_D, ...GLOW_L, ...GLOW_D].map((p) => p.id);
    expect([...ids].sort()).toEqual([...PRESET_IDS].sort());
  });
});

describe('canvas tokens', () => {
  const byName = new Map<string, { style: string; mode: string; t: unknown }>(
    canvas.ALL.map((row: { name: string }) => [row.name, row]),
  );
  const names: Record<PresetId, string> = Object.fromEntries(
    [...POP_L, ...POP_D, ...GLOW_L, ...GLOW_D].map((p) => [p.id, p.name]),
  ) as Record<PresetId, string>;

  it.each(PRESET_IDS)('%s: buildCanvasTokens equals the canvas builder output', (id) => {
    const row = byName.get(names[id])!;
    expect(buildCanvasTokens(id)).toEqual(row.t);
  });

  it.each(PRESET_IDS)('%s: the theme keeps the exact canvas tokens', (id) => {
    expect(getTheme(id).canvas).toEqual(byName.get(names[id])!.t);
  });

  it.each(PRESET_IDS)('%s: style and mode match the canvas', (id) => {
    const row = byName.get(names[id])!;
    const theme = THEMES[id];
    expect(theme.id).toBe(id);
    expect(theme.style).toBe(row.style === 'Neubrutalist pastel' ? 'pastel' : 'glass');
    expect(theme.mode).toBe(row.mode === 'Light' ? 'light' : 'dark');
  });
});

describe('preset registry', () => {
  it('lists every preset once, three light and three dark per style', () => {
    expect(PRESETS.map((p) => p.id).sort()).toEqual([...PRESET_IDS].sort());
    for (const style of ['pastel', 'glass'] as const) {
      for (const mode of ['light', 'dark'] as const) {
        expect(PRESETS.filter((p) => p.style === style && p.mode === mode)).toHaveLength(3);
      }
    }
  });

  it('pairs the matched light/dark presets both ways; Liberty and Northern lights stand alone', () => {
    const pairs: [PresetId, PresetId][] = [
      ['strawberry-milk', 'bubblegum-night'],
      ['matcha-latte', 'matcha-night'],
      ['lavender-haze', 'grape-soda'],
      ['silver', 'graphite'],
      ['sky', 'deep-blue'],
    ];
    const pairOf = (id: PresetId) => PRESETS.find((p) => p.id === id)!.pair;
    for (const [light, dark] of pairs) {
      expect(pairOf(light)).toBe(dark);
      expect(pairOf(dark)).toBe(light);
    }
    expect(pairOf('liberty')).toBeNull();
    expect(pairOf('northern-lights')).toBeNull();
  });

  it('gives every preset a message key for its display name', () => {
    for (const p of PRESETS) expect(p.nameKey).toBe(`preset.${p.id}`);
  });
});

describe('React Native tokens', () => {
  it('parses a pastel light preset', () => {
    const t = getTheme('strawberry-milk');
    expect(t.colors).toEqual({
      base: '#FFF0F3',
      text: '#1B1B1F',
      muted: '#45434D',
      accent: '#A62B55',
      onAccent: '#FFFFFF',
      cta: '#FFB3C7',
      onCta: '#1B1B1F',
      hl: '#FFCCDA',
      hlText: '#1B1B1F',
      vnum: '#A62B55',
      chipText: '#1B1B1F',
      track: '#FFF0F3',
      tabOn: '#1B1B1F',
      tabOff: '#55525C',
      btnText: '#1B1B1F',
    });
    expect(t.backgrounds.app).toEqual({ backgroundColor: '#FFF0F3' });
    expect(t.backgrounds.reader).toEqual({ backgroundColor: '#FFF0F3' });
    expect(t.backgrounds.surface).toEqual({ backgroundColor: '#FFFFFF' });
    expect(t.borders.card).toEqual({ width: 2.5, color: '#1B1B1F' });
    expect(t.borders.button).toEqual({ width: 2.5, color: '#1B1B1F' });
    expect(t.shadows).toEqual({
      card: '4px 4px 0 #1B1B1F',
      cta: '3px 3px 0 #1B1B1F',
      tabBar: null,
      sheet: null,
    });
    expect(t.radii).toEqual({ card: 16, button: 12, sheet: 22, swatch: 12 });
    expect(t.blur).toEqual({ css: null, radius: 0 });
    expect(t.type).toEqual({
      ui: 'SpaceGrotesk',
      head: 'SpaceGrotesk',
      scripture: 'Literata',
      headWeight: '700',
      headSize: 34,
      headLetterSpacing: -1,
    });
    expect(t.floatingTabBar).toBe(false);
  });

  it('parses a pastel dark preset, with hlText and btnText', () => {
    const t = getTheme('bubblegum-night');
    expect(t.colors.base).toBe('#1C1619');
    expect(t.colors.hlText).toBe('#FFF1F5');
    expect(t.colors.btnText).toBe('#FBF6EF');
    expect(t.colors.onCta).toBe('#17161C');
    expect(t.borders.card).toEqual({ width: 2.5, color: '#FBE9F0' });
    expect(t.backgrounds.surface).toEqual({ backgroundColor: '#2A2125' });
    expect(t.backgrounds.tabBar).toEqual({ backgroundColor: '#1C1619' });
  });

  it('parses a glass light preset: gradients go to backgroundImage, the colour layer to backgroundColor', () => {
    const t = getTheme('silver');
    const c = t.canvas;
    expect(t.colors.base).toBe('#F2F3F5');
    expect(t.colors.cta).toBe('#2B323C');
    expect(t.colors.onCta).toBe('#FFFFFF');
    expect(t.colors.hlText).toBe('#111418');
    expect(t.colors.btnText).toBe('#111418');
    expect(t.backgrounds.app.backgroundColor).toBe('#F2F3F5');
    expect(t.backgrounds.app.backgroundImage).toBe(c.bg.slice(0, c.bg.lastIndexOf(', #F2F3F5')));
    expect(t.backgrounds.app.backgroundImage).toContain('circle 130px');
    expect(t.backgrounds.reader.backgroundColor).toBe('#F2F3F5');
    expect(t.backgrounds.reader.backgroundImage).not.toContain('circle');
    expect(t.backgrounds.reader.backgroundImage!.match(/radial-gradient/g)).toHaveLength(3);
    // A pure gradient has a transparent colour layer.
    expect(t.backgrounds.surface).toEqual({ backgroundColor: 'rgba(0, 0, 0, 0)', backgroundImage: c.surface });
    expect(t.borders.card).toEqual({ width: 1, color: 'rgba(255, 255, 255, 0.7)' });
    expect(t.borders.button).toBeNull();
    expect(t.shadows.card).toBe(c.shadow);
    expect(t.shadows.tabBar).toBe(c.tabShadow);
    expect(t.shadows.sheet).toBe(c.sheetShadow);
    expect(t.radii).toEqual({ card: 28, button: 999, sheet: 34, swatch: 999 });
    expect(t.blur).toEqual({ css: 'blur(14px) saturate(200%) brightness(1.04)', radius: 14 });
    expect(t.type).toEqual({
      ui: 'PlusJakartaSans',
      head: 'PlusJakartaSans',
      scripture: 'SourceSerif4',
      headWeight: '700',
      headSize: 32,
      headLetterSpacing: -0.8,
    });
    expect(t.floatingTabBar).toBe(true);
  });

  it('parses a glass dark preset: a translucent colour layer stays as backgroundColor', () => {
    const t = getTheme('graphite');
    expect(t.backgrounds.tabBar.backgroundColor).toBe('rgba(20, 22, 26, 0.6)');
    expect(t.backgrounds.tabBar.backgroundImage).toBe(
      'linear-gradient(135deg, rgba(255, 255, 255, 0.18) 0%, rgba(255, 255, 255, 0.05) 100%)',
    );
    expect(t.backgrounds.sheet.backgroundColor).toBe('rgba(24, 26, 31, 0.82)');
    expect(t.colors.onCta).toBe('#111317');
    expect(t.type.headWeight).toBe('800');
    expect(t.type.headSize).toBe(31);
  });

  it('builds every theme without throwing and with parseable colours', () => {
    const hexOrRgba = /^(#[0-9A-F]{6}|rgba\(\d+, \d+, \d+, [\d.]+\))$/i;
    for (const id of PRESET_IDS) {
      const t = getTheme(id);
      for (const [key, value] of Object.entries(t.colors)) {
        expect([key, value]).toEqual([key, expect.stringMatching(hexOrRgba)]);
      }
      for (const bg of Object.values(t.backgrounds)) {
        expect(bg.backgroundColor).toMatch(hexOrRgba);
      }
    }
  });
});
