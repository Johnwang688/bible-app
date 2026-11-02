// The six highlight colours (the verse sheet's swatches, as drawn on the canvas). Owned by the
// orchestrator (R-2). The swatch is the button; the wash is what sits behind highlighted Scripture,
// translucent so the preset's text colour keeps 4.5:1 (checked over every preset by highlights.test.ts).
import type { MessageKey } from '../i18n/messages/en';
import type { ThemeMode } from './types';

export const HIGHLIGHT_IDS = ['yellow', 'orange', 'pink', 'purple', 'blue', 'green'] as const;
export type HighlightId = (typeof HIGHLIGHT_IDS)[number];

export interface HighlightColour {
  id: HighlightId;
  /** The swatch button colour. */
  swatch: string;
  /** Behind highlighted text, per mode. */
  wash: Record<ThemeMode, string>;
  nameKey: MessageKey;
}

export const HIGHLIGHTS: Record<HighlightId, HighlightColour> = {
  yellow: { id: 'yellow', swatch: '#F2C94C', wash: { light: 'rgba(242, 201, 76, 0.38)', dark: 'rgba(242, 201, 76, 0.26)' }, nameKey: 'highlight.yellow' },
  orange: { id: 'orange', swatch: '#F2994A', wash: { light: 'rgba(242, 153, 74, 0.34)', dark: 'rgba(242, 153, 74, 0.26)' }, nameKey: 'highlight.orange' },
  pink: { id: 'pink', swatch: '#EB6FA3', wash: { light: 'rgba(235, 111, 163, 0.28)', dark: 'rgba(235, 111, 163, 0.26)' }, nameKey: 'highlight.pink' },
  purple: { id: 'purple', swatch: '#9B7BFF', wash: { light: 'rgba(155, 123, 255, 0.26)', dark: 'rgba(155, 123, 255, 0.28)' }, nameKey: 'highlight.purple' },
  blue: { id: 'blue', swatch: '#4C8DF6', wash: { light: 'rgba(76, 141, 246, 0.24)', dark: 'rgba(76, 141, 246, 0.28)' }, nameKey: 'highlight.blue' },
  green: { id: 'green', swatch: '#45C08A', wash: { light: 'rgba(69, 192, 138, 0.28)', dark: 'rgba(69, 192, 138, 0.24)' }, nameKey: 'highlight.green' },
};
