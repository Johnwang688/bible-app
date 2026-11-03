// Paint for things that sit on the moving aurora (R-7a, GO-AHEAD "Major 1"): the aurora's colours are not
// capped, so secondary text (sub-lines, captions, notes, descriptions) never sits directly on it. It sits
// on a text card. On glass the card uses the sheet paint, the most opaque glass paint, which keeps text and
// muted text at 4.5:1 or better over every aurora colour (`__tests__/paint.test.ts`). Pastel has no aurora
// and uses its plain surface.
//
// Shared by the first-run screens and the aurora option (`aurora/AuroraOption.tsx`).
import type { Background, Border, Theme } from '../theme/types';

/** The background of a card that holds text, on any screen with the app background. */
export function textCardBackground(theme: Theme): Background {
  return theme.style === 'glass' ? theme.backgrounds.sheet : theme.backgrounds.surface;
}

/** That card's border. */
export function textCardBorder(theme: Theme): Border {
  return theme.style === 'glass' ? theme.borders.sheet : theme.borders.card;
}

/**
 * The edge of an unselected chip (or option row) that sits on the aurora: 3:1 or better against every
 * aurora colour (WCAG non-text contrast). Glass's own hairline (white at 0.22 to 0.7) is nearly invisible
 * there, so glass uses the text colour; pastel keeps its outline.
 */
export function chipEdge(theme: Theme): Border {
  if (theme.style === 'glass') return { width: 1.5, color: theme.colors.text };
  return theme.borders.button ?? theme.borders.card;
}
