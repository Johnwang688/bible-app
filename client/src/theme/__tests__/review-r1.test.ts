// Verifier round 1 (GPT-6.1 Sol): regression tests. Orchestrator-owned; do not edit.
import { buildCanvasTokens, toTheme } from '../build';
import { POP_D, POP_L } from '../palettes';
import { PRESET_IDS } from '../types';

describe('toTheme derives everything from the canvas it is given', () => {
  it.each([...POP_L, ...POP_D].map((p) => p.id))('%s: the pastel base follows canvas.bg', (id) => {
    const canvas = { ...buildCanvasTokens(id), bg: '#123456' };
    expect(toTheme(id, canvas).colors.base).toBe('#123456');
  });

  it.each(PRESET_IDS)('%s: base equals the app background colour layer', (id) => {
    const theme = toTheme(id, buildCanvasTokens(id));
    expect(theme.colors.base).toBe(theme.backgrounds.app.backgroundColor);
  });

  it.each(PRESET_IDS)('%s: button backgrounds come from btn', (id) => {
    const canvas = buildCanvasTokens(id);
    const expected = canvas.btn.startsWith('linear-gradient(')
      ? { backgroundColor: 'rgba(0, 0, 0, 0)', backgroundImage: canvas.btn }
      : { backgroundColor: canvas.btn };
    expect(toTheme(id, canvas).backgrounds.button).toEqual(expected);
  });
});
