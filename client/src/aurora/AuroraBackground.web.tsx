// The moving aurora behind a glass screen, on the web (R-7a): a WebGL2 canvas running the fluid
// simulation (the default) or the flow shader. Renders nothing in the pastel style. Without WebGL2,
// or while the GPU context is lost, the canvas hides and the screen's still CSS paint shows.
//
// The animation runs outside React: one controller per mounted component owns the canvas, its
// renderer and its frame loop; prop and condition changes call into it, and nothing re-renders per
// frame.
import { useEffect, useMemo, useRef } from 'react';
import { StyleSheet, View } from 'react-native';

import { useReduceMotion } from '../reader/components/useReduceMotion';
import { useTabFocused } from '../reader/components/useTabFocused';
import { getStorage, useStoredValue } from '../storage/storage';
import { useTheme } from '../theme/ThemeProvider';
import { createAuroraController, type AuroraController } from './controller.web';
import { auroraStyleKey } from './keys';
import { auroraPalette, type AuroraPalette } from './palette';
import { usePageVisible } from './usePageVisible';

export function AuroraBackground() {
  const theme = useTheme();
  const palette = useMemo(() => auroraPalette(theme), [theme]);
  if (palette === null) return null;
  return <AuroraCanvas palette={palette} />;
}

function AuroraCanvas({ palette }: { palette: AuroraPalette }) {
  const [style] = useStoredValue(getStorage(), auroraStyleKey);
  const reduceMotion = useReduceMotion();
  const focused = useTabFocused();
  const visible = usePageVisible();
  const host = useRef<HTMLDivElement>(null);
  const controller = useRef<AuroraController | null>(null);

  useEffect(() => {
    const inputs = { style, palette, reduceMotion, focused, visible };
    if (controller.current) {
      controller.current.update(inputs);
      return;
    }
    const el = host.current;
    if (!el) return;
    // host (div) -> the aurora's root View -> the screen: drags anywhere on the screen stir.
    controller.current = createAuroraController(el, el.parentElement?.parentElement ?? null, inputs);
  }, [style, palette, reduceMotion, focused, visible]);

  useEffect(
    () => () => {
      controller.current?.destroy();
      controller.current = null;
    },
    [],
  );

  return (
    <View testID="aurora-background" pointerEvents="none" style={StyleSheet.absoluteFill}>
      <div ref={host} style={HOST} />
    </View>
  );
}

const HOST = { position: 'absolute', inset: 0, overflow: 'hidden' } as const;
