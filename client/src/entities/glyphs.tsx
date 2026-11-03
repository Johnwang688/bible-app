// Icons for search, Explore and the people, places and themes pages (24-unit stroke paths from the approved
// prototypes `design/proposed/r5-*.html`). Orchestrator-owned (R-5 part 2), shared by those screens so they
// draw the same glyphs. The reader's own icons stay in `reader/components/icons.tsx`.
import type { ColorValue } from 'react-native';
import Svg, { Path } from 'react-native-svg';

import type { EntityKind } from '../api/schemas';

export type GlyphName = 'person' | 'place' | 'theme' | 'book' | 'clock' | 'offline' | 'notFound' | 'chevronRight';

const PATHS: Record<GlyphName, string> = {
  person: 'M12 12a4 4 0 1 0 0-8 4 4 0 0 0 0 8zm-7 9a7 7 0 0 1 14 0',
  place: 'M12 21s-7-6.2-7-11.5a7 7 0 0 1 14 0C19 14.8 12 21 12 21zm0-9a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5z',
  theme: 'M12 3l2.6 5.6 6.1.7-4.5 4.2 1.2 6L12 16.6 6.6 19.5l1.2-6L3.3 9.3l6.1-.7z',
  book: 'M6 4h11a1 1 0 0 1 1 1v15H7a2 2 0 0 1-2-2V5a1 1 0 0 1 1-1zM5 18a2 2 0 0 1 2-2h11',
  clock: 'M12 3a9 9 0 1 0 0 18 9 9 0 0 0 0-18zm0 4v5l3 2',
  /** No connection: for failed loads only. */
  offline: 'M2 8.5a15 15 0 0 1 20 0M5.5 12a10 10 0 0 1 13 0M9 15.5a5 5 0 0 1 6 0M12 19h.01M3 3l18 18',
  /** A magnifier with a minus: nothing found, or a page that is not there. */
  notFound: 'M11 4a7 7 0 1 0 0 14 7 7 0 0 0 0-14zm9 16-3.5-3.5M8.5 11h5',
  chevronRight: 'm9 6 6 6-6 6',
};

export const KIND_GLYPH: Record<EntityKind, GlyphName> = { person: 'person', place: 'place', theme: 'theme' };

/** A decorative glyph: hidden from screen readers (the control around it carries the label). */
export function Glyph({ name, color, size = 18, strokeWidth = 2 }: { name: GlyphName; color: ColorValue; size?: number; strokeWidth?: number }) {
  return (
    <Svg width={size} height={size} viewBox="0 0 24 24" accessible={false} importantForAccessibility="no-hide-descendants">
      <Path d={PATHS[name]} fill="none" stroke={color} strokeWidth={strokeWidth} strokeLinecap="round" strokeLinejoin="round" />
    </Svg>
  );
}
