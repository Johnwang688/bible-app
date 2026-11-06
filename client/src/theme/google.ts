// Google's "Continue with Google" button colours (GOOGLE, board 11-03 row 7). These are Google's, not the app's:
// its branding rules (developers.google.com/identity/branding-guidelines) fix the fill, stroke and text of the light
// and dark buttons and the colours of the G, so no preset token applies. The light button goes on light presets,
// the dark one on dark presets; the corner shape follows the preset's buttons.
import type { ThemeMode } from './types';

export interface GoogleButtonColours {
  fill: string;
  stroke: string;
  text: string;
}

export const GOOGLE_BUTTON: Record<ThemeMode, GoogleButtonColours> = {
  light: { fill: '#FFFFFF', stroke: '#747775', text: '#1F1F1F' },
  dark: { fill: '#131314', stroke: '#8E918F', text: '#E3E3E3' },
};

/** The four colours of Google's G mark. */
export const GOOGLE_G = { red: '#EA4335', blue: '#4285F4', yellow: '#FBBC05', green: '#34A853' } as const;
