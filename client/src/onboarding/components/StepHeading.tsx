// A step's heading: the style's head face, size and weight, with the aurora's text shadow. On the web it can
// take focus (tabIndex -1), and does so when the step was reached from another step, so a screen reader
// announces the new step.
import { useEffect, useRef } from 'react';
import { Platform, Text } from 'react-native';

import { auroraTextShadow } from '../../aurora';
import { uiFace } from '../../fonts/fonts';
import { useTheme } from '../../theme/ThemeProvider';

export function StepHeading({ children, focusOnMount }: { children: string; focusOnMount: boolean }) {
  const theme = useTheme();
  const node = useRef<unknown>(null);
  useEffect(() => {
    if (!focusOnMount || Platform.OS !== 'web') return;
    // React Native Web's Text ref is the DOM element.
    (node.current as { focus?: () => void } | null)?.focus?.();
    // Only when the step mounts, never when the theme changes under a live preview.
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);
  return (
    <Text
      ref={(n: unknown) => {
        node.current = n;
      }}
      accessibilityRole="header"
      {...FOCUSABLE}
      style={[
        {
          color: theme.colors.text,
          fontFamily: uiFace(theme.type.head, theme.type.headWeight),
          fontSize: theme.type.headSize,
          letterSpacing: theme.type.headLetterSpacing,
        },
        auroraTextShadow(theme),
      ]}
    >
      {children}
    </Text>
  );
}

/** React Native Web's Text takes `tabIndex` (a heading must be focusable to receive focus); its types omit it. */
const FOCUSABLE: object = Platform.OS === 'web' ? { tabIndex: -1 } : {};
