// The app's fonts. UI and Scripture fonts load at startup (they are small and every screen needs
// them). Hebrew, Greek and Chinese Scripture load on first use (src/fonts/lazy.ts).
import { Literata_400Regular, Literata_400Regular_Italic, Literata_700Bold } from '@expo-google-fonts/literata';
import { PlusJakartaSans_400Regular, PlusJakartaSans_700Bold, PlusJakartaSans_800ExtraBold } from '@expo-google-fonts/plus-jakarta-sans';
import { SourceSerif4_400Regular, SourceSerif4_400Regular_Italic, SourceSerif4_700Bold } from '@expo-google-fonts/source-serif-4';
import { SpaceGrotesk_400Regular, SpaceGrotesk_700Bold } from '@expo-google-fonts/space-grotesk';

import type { ScriptureFontFamily, UiFontFamily } from '../theme/types';

export type FontWeight = '400' | '700' | '800';

/**
 * Registered font names. React Native picks a face by name, not by `fontWeight`, on Android,
 * so every weight is its own name.
 */
export const STARTUP_FONTS = {
  SpaceGrotesk_400Regular,
  SpaceGrotesk_700Bold,
  PlusJakartaSans_400Regular,
  PlusJakartaSans_700Bold,
  PlusJakartaSans_800ExtraBold,
  Literata_400Regular,
  Literata_400Regular_Italic,
  Literata_700Bold,
  SourceSerif4_400Regular,
  SourceSerif4_400Regular_Italic,
  SourceSerif4_700Bold,
} as const;

export type FontName = keyof typeof STARTUP_FONTS;

const UI_FACES: Record<UiFontFamily, Partial<Record<FontWeight, FontName>>> = {
  SpaceGrotesk: { '400': 'SpaceGrotesk_400Regular', '700': 'SpaceGrotesk_700Bold' },
  PlusJakartaSans: {
    '400': 'PlusJakartaSans_400Regular',
    '700': 'PlusJakartaSans_700Bold',
    '800': 'PlusJakartaSans_800ExtraBold',
  },
};

const SCRIPTURE_FACES: Record<ScriptureFontFamily, { regular: FontName; italic: FontName; bold: FontName }> = {
  Literata: { regular: 'Literata_400Regular', italic: 'Literata_400Regular_Italic', bold: 'Literata_700Bold' },
  SourceSerif4: {
    regular: 'SourceSerif4_400Regular',
    italic: 'SourceSerif4_400Regular_Italic',
    bold: 'SourceSerif4_700Bold',
  },
};

/** The registered face for a UI family and weight; a missing weight falls back to the nearest lighter one. */
export function uiFace(family: UiFontFamily, weight: FontWeight): FontName {
  const faces = UI_FACES[family];
  return faces[weight] ?? (weight === '800' ? faces['700'] : undefined) ?? faces['400']!;
}

export function scriptureFace(family: ScriptureFontFamily, variant: 'regular' | 'italic' | 'bold' = 'regular'): FontName {
  return SCRIPTURE_FACES[family][variant];
}
