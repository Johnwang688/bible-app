// Style helpers shared by the reader components. Every colour comes from the theme.
import type { ViewStyle } from 'react-native';

import type { Theme } from '../../theme/types';

/** A plain button in the current preset: its fill, border and radius. */
export function buttonStyle(theme: Theme): ViewStyle {
  const border = theme.borders.button;
  return {
    ...theme.backgrounds.button,
    borderRadius: theme.radii.button,
    borderWidth: border?.width ?? 0,
    borderColor: border?.color,
  };
}

/** A card-like group (settings groups): the button fill with the card radius. */
export function groupStyle(theme: Theme): ViewStyle {
  return { ...buttonStyle(theme), borderRadius: theme.radii.card, overflow: 'hidden' };
}
