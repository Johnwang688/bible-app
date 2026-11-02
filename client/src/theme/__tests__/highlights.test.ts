// Acceptance (orchestrator-owned): Scripture stays readable on every highlight in every preset.
import { composite, contrastRatio, MIN_TEXT_CONTRAST } from '../contrast';
import { HIGHLIGHT_IDS, HIGHLIGHTS } from '../highlights';
import { getTheme } from '../presets';
import { PRESET_IDS } from '../types';

describe('highlight washes', () => {
  it('has six colours with distinct swatches', () => {
    expect(HIGHLIGHT_IDS).toHaveLength(6);
    expect(new Set(HIGHLIGHT_IDS.map((id) => HIGHLIGHTS[id].swatch)).size).toBe(6);
  });

  it.each(PRESET_IDS)('%s: text on every highlight wash over the reader base is at least 4.5:1', (id) => {
    const t = getTheme(id);
    const failures = HIGHLIGHT_IDS.map((h) => {
      const bg = composite(HIGHLIGHTS[h].wash[t.mode], t.colors.base);
      return [h, Number(contrastRatio(t.colors.text, bg).toFixed(2))] as const;
    }).filter(([, r]) => r < MIN_TEXT_CONTRAST);
    expect(failures).toEqual([]);
  });
});
