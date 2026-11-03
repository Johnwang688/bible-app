// The soft halo behind text that sits directly on the aurora (R-7a). The colours under the text
// are not capped, so the text carries a blurred shadow in the base colour, which pulls whatever
// is behind it back toward the base.
//
// How the contrast test measures it: a blurred halo does not cover the glyph's surroundings
// fully, so it is counted at SHADOW_COVERAGE of its alpha, composited (sRGB, straight alpha) over
// the background, and the text is measured against that.
import type { TextStyle } from 'react-native';

import { composite, contrastRatio, parseColor } from '../theme/contrast';
import type { Color, Theme } from '../theme/types';
import type { Rgb } from './palette';

export const SHADOW_COVERAGE = 0.5;

/** The WCAG ratio of `text` over `background` (0..1 sRGB) seen through the shadow. */
export function shadowedContrast(text: Color, shadowColor: Color, background: Rgb): number {
  const s = parseColor(shadowColor);
  const bg: Rgb = [background[0] * 255, background[1] * 255, background[2] * 255];
  const seen = composite([s[0], s[1], s[2], s[3] * SHADOW_COVERAGE], bg);
  return contrastRatio(text, seen);
}

const RADIUS = 12;
const NONE: TextStyle = {};

/** The text shadow for text on the aurora: none in the pastel style. */
export function auroraTextShadow(theme: Theme): TextStyle {
  if (theme.style !== 'glass') return NONE;
  return {
    textShadowColor: theme.colors.base,
    textShadowRadius: RADIUS,
    textShadowOffset: { width: 0, height: 0 },
  };
}
