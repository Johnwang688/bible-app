// The destructive colour (delete account): text for a text button or an error line, and a fill with the
// colour that sits on it. John approved #B3261E on the light presets and #FFB4AB on the dark ones
// (design canvas r6b-*.html, 2026-11-02). danger.test.ts checks 4.5:1 on every preset.
import type { Color, Theme } from './types';

export interface DangerColours {
  /** Text and icons on a card or sheet. */
  text: Color;
  /** The border of an invalid field: at least 3:1 on every field and sheet surface (Sol UI review R6). */
  border: Color;
  /** The fill of a destructive button. */
  fill: Color;
  /** Text on `fill`. */
  onFill: Color;
}

const LIGHT: DangerColours = { text: '#B3261E', border: '#8C1D18', fill: '#B3261E', onFill: '#FFFFFF' };
const DARK: DangerColours = { text: '#FFB4AB', border: '#FFB4AB', fill: '#FFB4AB', onFill: '#111317' };
/**
 * Silver's glass sheet lets the darkest backdrop orb through, where #B3261E small text measures about 4.1:1; its
 * small red text is the darker #8C1D18 (John 11-03, decision 16 of design/proposed/feedback.html). Only `text`
 * changes: the fill, its on-fill colour and the field border stay the light presets'.
 */
const SILVER: DangerColours = { ...LIGHT, text: '#8C1D18' };

export function dangerColours(theme: Pick<Theme, 'mode'> & Partial<Pick<Theme, 'id'>>): DangerColours {
  if (theme.mode === 'dark') return DARK;
  return theme.id === 'silver' ? SILVER : LIGHT;
}
