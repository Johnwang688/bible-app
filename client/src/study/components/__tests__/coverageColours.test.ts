// The coverage map's colours: the mix is right, and the abbreviation stays legible on every fill in every preset.
import type { CoverageLevel } from '../../../progress';
import { composite, contrastRatio } from '../../../theme/contrast';
import { PRESET_IDS } from '../../../theme/types';
import { getTheme } from '../../../theme/presets';
import { coverageFillRgba, coverageText, mixColours } from '../coverageColours';

const LEVELS: CoverageLevel[] = [0, 1, 2, 3, 4];

describe('mixColours', () => {
  it('mixes like color-mix in sRGB', () => {
    expect(mixColours('#000000', '#ffffff', 0.5)).toBe('#808080');
    expect(mixColours('#102030', '#ffffff', 1)).toBe('#102030');
    expect(mixColours('#102030', '#ffffff', 0)).toBe('#ffffff');
  });

  it('keeps a translucent colour translucent', () => {
    // 100% white at alpha 0.5 over nothing.
    expect(mixColours('#ffffff', 'rgba(255, 255, 255, 0.5)', 0)).toBe('#ffffff80');
    expect(mixColours('#000000', 'rgba(255, 255, 255, 0.5)', 0.5)).toBe('#555555bf');
  });
});

describe.each(PRESET_IDS)('coverage colours in %s', (id) => {
  const theme = getTheme(id);

  it.each(LEVELS)('level %i: the abbreviation has at least 3:1 on its fill', (level) => {
    const base = theme.colors.base;
    // A translucent fill (glass) sits on the app background.
    const fill = composite(coverageFillRgba(theme, level), base);
    expect(contrastRatio(coverageText(theme, level), fill)).toBeGreaterThanOrEqual(3);
  });

  it('the levels get stronger: each fill is further from the track than the last', () => {
    const base = theme.colors.base;
    const lum = (level: CoverageLevel) => contrastRatio(composite(coverageFillRgba(theme, level), base), composite(theme.colors.track, base));
    expect(lum(1)).toBeLessThan(lum(2));
    expect(lum(2)).toBeLessThan(lum(3));
    expect(lum(3)).toBeLessThan(lum(4));
  });
});
