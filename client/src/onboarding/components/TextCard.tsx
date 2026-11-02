// A card that holds text on an aurora screen (GO-AHEAD Major 1): the sheet paint on glass, the plain surface
// on pastel (`paint.ts`). Muted text never sits straight on the aurora; it sits on one of these. Give it a
// testID that ends in "-card".
import type { ReactNode } from 'react';
import { View, type StyleProp, type ViewStyle } from 'react-native';

import { GlassSurface } from '../../components/GlassSurface';
import { useTheme } from '../../theme/ThemeProvider';
import type { Theme } from '../../theme/types';
import { textCardBackground, textCardBorder } from '../paint';

/** The card frame in a theme's tokens: border, radius and shadow. */
export function textCardFrame(theme: Theme): ViewStyle {
  const border = textCardBorder(theme);
  return {
    borderColor: border.color,
    borderWidth: border.width,
    borderRadius: theme.radii.card,
    overflow: 'hidden',
    boxShadow: theme.shadows.card ?? undefined,
  };
}

export function TextCard({
  testID,
  theme: own,
  style,
  children,
}: {
  testID: string;
  /** The theme to draw in; the screen's own by default (the style cards on the look step pass theirs). */
  theme?: Theme;
  style?: StyleProp<ViewStyle>;
  children?: ReactNode;
}) {
  const screen = useTheme();
  const theme = own ?? screen;
  // A glass card on a pastel screen has no aurora to frost: it sits on that look's still app paint.
  if (theme.style === 'glass' && screen.style !== 'glass') {
    return (
      <View testID={testID} style={[textCardFrame(theme), theme.backgrounds.app, style]}>
        <GlassSurface background={textCardBackground(theme)}>{children}</GlassSurface>
      </View>
    );
  }
  return (
    <GlassSurface testID={testID} background={textCardBackground(theme)} style={[textCardFrame(theme), style]}>
      {children}
    </GlassSurface>
  );
}
