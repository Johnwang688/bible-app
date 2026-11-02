// The destructive colour (delete account): text for a text button or an error line, and a fill with the
// colour that sits on it. John approved #B3261E on the light presets and #FFB4AB on the dark ones
// (design canvas r6b-*.html, 2026-11-02). danger.test.ts checks 4.5:1 on every preset.
import type { Color, Theme } from './types';

export interface DangerColours {
  /** Text, icons and error borders on a card or sheet. */
  text: Color;
  /** The fill of a destructive button. */
  fill: Color;
  /** Text on `fill`. */
  onFill: Color;
}

const LIGHT: DangerColours = { text: '#B3261E', fill: '#B3261E', onFill: '#FFFFFF' };
const DARK: DangerColours = { text: '#FFB4AB', fill: '#FFB4AB', onFill: '#111317' };

export function dangerColours(theme: Pick<Theme, 'mode'>): DangerColours {
  return theme.mode === 'dark' ? DARK : LIGHT;
}
