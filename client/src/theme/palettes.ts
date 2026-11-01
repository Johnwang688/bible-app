// The preset palettes, copied exactly from the design canvas (POP_L, POP_D, GLOW_L, GLOW_D in
// src/theme/__tests__/canvas-themes.js). canvas.test.ts fails if a value drifts from the canvas.
import type { Color, PresetId } from './types';

export interface PastelLightPalette {
  id: PresetId;
  name: string;
  bg: Color;
  c1: Color;
  c3: Color;
  cta: Color;
  hl: Color;
  ink: Color;
}

export interface PastelDarkPalette {
  id: PresetId;
  name: string;
  bg: Color;
  surface: Color;
  line: Color;
  pop: Color;
  c1: Color;
  c3: Color;
  hl: Color;
  cardText: Color;
  cardMuted: Color;
}

export interface GlassLightPalette {
  id: PresetId;
  name: string;
  a: Color;
  b: Color;
  c: Color;
  base: Color;
  text: Color;
  muted: Color;
  accent: Color;
  hl: Color;
  glow: Color;
}

export interface GlassDarkPalette extends GlassLightPalette {
  onAccent: Color;
  tab: Color;
  sheet: Color;
}

export const POP_L: readonly PastelLightPalette[] = [
  { id: 'strawberry-milk', name: 'Strawberry milk', bg: '#FFF0F3', c1: '#FFD6E0', c3: '#FFEAF0', cta: '#FFB3C7', hl: '#FFCCDA', ink: '#A62B55' },
  { id: 'matcha-latte', name: 'Matcha latte', bg: '#F1F6EA', c1: '#D4EDC9', c3: '#E8F5DC', cta: '#BFE3A8', hl: '#CDEBBE', ink: '#2F5E22' },
  { id: 'lavender-haze', name: 'Lavender haze', bg: '#F4F0FF', c1: '#DCD3FF', c3: '#ECE7FF', cta: '#C7B8FF', hl: '#DAD0FF', ink: '#4E35B8' },
];

export const POP_D: readonly PastelDarkPalette[] = [
  { id: 'bubblegum-night', name: 'Bubblegum night', bg: '#1C1619', surface: '#2A2125', line: '#FBE9F0', pop: '#FFA9C4', c1: '#7A4D61', c3: '#5C3A4A', hl: '#6B4356', cardText: '#FFF1F5', cardMuted: '#F2DDE5' },
  { id: 'matcha-night', name: 'Matcha night', bg: '#151913', surface: '#20271D', line: '#EEF7E8', pop: '#B5DDA2', c1: '#56694A', c3: '#3F4E37', hl: '#4A5C40', cardText: '#F3F8EE', cardMuted: '#DCE8D3' },
  { id: 'grape-soda', name: 'Grape soda', bg: '#16141F', surface: '#221F30', line: '#EEE9FF', pop: '#C3B4FF', c1: '#625684', c3: '#4A4068', hl: '#554A75', cardText: '#F5F2FF', cardMuted: '#E0DAF5' },
];

export const GLOW_L: readonly GlassLightPalette[] = [
  { id: 'liberty', name: 'Liberty', a: '#F0606B', b: '#5B82E0', c: '#9DB7F5', base: '#F7F8FC', text: '#0B1633', muted: '#3E4A66', accent: '#1E3FA0', hl: 'rgba(230, 57, 70, 0.18)', glow: 'rgba(30, 63, 160, 0.16)' },
  { id: 'silver', name: 'Silver', a: '#C4C9D1', b: '#D8DCE2', c: '#B4BBC6', base: '#F2F3F5', text: '#111418', muted: '#4A505A', accent: '#2B323C', hl: 'rgba(120, 130, 145, 0.28)', glow: 'rgba(20, 24, 30, 0.12)' },
  { id: 'sky', name: 'Sky', a: '#B9DBF7', b: '#D4E8FA', c: '#C6D6EC', base: '#F1F7FC', text: '#0B1A2B', muted: '#3F5266', accent: '#1F5FAE', hl: 'rgba(31, 95, 174, 0.16)', glow: 'rgba(20, 60, 110, 0.12)' },
];

export const GLOW_D: readonly GlassDarkPalette[] = [
  { id: 'northern-lights', name: 'Northern lights', a: '#4A2391', b: '#0E6B76', c: '#1B2A6B', base: '#0B0D20', text: '#F4F3FF', muted: '#C6C3E0', accent: '#5EEAD4', onAccent: '#04241F', hl: 'rgba(94, 234, 212, 0.26)', glow: 'rgba(94, 234, 212, 0.35)', tab: 'rgba(18, 16, 44, 0.6)', sheet: 'rgba(24, 20, 58, 0.78)' },
  { id: 'graphite', name: 'Graphite', a: '#3A3F48', b: '#2A2E35', c: '#1E2126', base: '#0E0F12', text: '#F3F4F6', muted: '#B8BDC6', accent: '#E5E7EB', onAccent: '#111317', hl: 'rgba(229, 231, 235, 0.18)', glow: 'rgba(255, 255, 255, 0.16)', tab: 'rgba(20, 22, 26, 0.6)', sheet: 'rgba(24, 26, 31, 0.82)' },
  { id: 'deep-blue', name: 'Deep blue', a: '#1E3A7A', b: '#143063', c: '#0F2147', base: '#070E1F', text: '#F1F5FF', muted: '#B7C3DE', accent: '#7FB2FF', onAccent: '#061733', hl: 'rgba(127, 178, 255, 0.24)', glow: 'rgba(127, 178, 255, 0.3)', tab: 'rgba(8, 16, 36, 0.6)', sheet: 'rgba(12, 24, 52, 0.82)' },
];
