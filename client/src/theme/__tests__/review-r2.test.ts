// Verifier round 2 (GPT-6.1 Sol): mutant-killing regression tests. Orchestrator-owned; do not edit.
import { buildCanvasTokens, toTheme } from '../build';
import { PRESET_IDS } from '../types';

const expectedBackground = (paint: string) =>
  paint.startsWith('linear-gradient(')
    ? { backgroundColor: 'rgba(0, 0, 0, 0)', backgroundImage: paint }
    : { backgroundColor: paint };

it.each(PRESET_IDS)('%s: chip backgrounds come from chip', (id) => {
  const canvas = buildCanvasTokens(id);
  expect(toTheme(id, canvas).backgrounds.chip).toEqual(expectedBackground(canvas.chip));
});

it.each(PRESET_IDS)('%s: surface and sheet backgrounds come from their own tokens', (id) => {
  const canvas = buildCanvasTokens(id);
  const theme = toTheme(id, canvas);
  expect(theme.backgrounds.surface).toEqual(expectedBackground(canvas.surface));
  if (!canvas.sheet.includes(', rgba(')) expect(theme.backgrounds.sheet).toEqual(expectedBackground(canvas.sheet));
});
