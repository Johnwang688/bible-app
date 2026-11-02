// Provides the active theme and the reader's Appearance choice and customisation. Both live in
// storage, so a write from anywhere (the picker, Customise, sync) re-renders every consumer.
import { createContext, useContext, useMemo, type ReactNode } from 'react';
import { useColorScheme } from 'react-native';

import { appearanceCustomKey } from '../storage/appearanceCustomKey';
import { appearanceKey } from '../storage/keys';
import { getStorage, useStoredValue, type Storage } from '../storage/storage';
import { applyCustom, type AppearanceCustom } from './custom';
import { resolvePresetId } from './resolve';
import type { AppearanceChoice, PresetId, Theme, ThemeMode } from './types';

interface Appearance {
  choice: AppearanceChoice;
  setChoice(c: AppearanceChoice): void;
  presetId: PresetId;
  /** Reading font and per-preset colour edits (src/theme/custom.ts builds every change). */
  custom: AppearanceCustom;
  setCustom(c: AppearanceCustom): void;
}

interface ThemeContextValue {
  theme: Theme;
  appearance: Appearance;
}

const ThemeContext = createContext<ThemeContextValue | null>(null);

export function ThemeProvider(props: {
  children: ReactNode;
  storage?: Storage;
  systemScheme?: ThemeMode | null;
}) {
  const storage = props.storage ?? getStorage();
  const deviceScheme = useColorScheme();
  const raw = props.systemScheme === undefined ? deviceScheme : props.systemScheme;
  const system: ThemeMode | null = raw === 'light' || raw === 'dark' ? raw : null;

  const [choice, setChoice] = useStoredValue(storage, appearanceKey);
  const [custom, setCustom] = useStoredValue(storage, appearanceCustomKey);
  const presetId = resolvePresetId(choice, system);
  const theme = useMemo(() => applyCustom(presetId, custom), [presetId, custom]);

  const value = useMemo<ThemeContextValue>(
    () => ({ theme, appearance: { choice, setChoice, presetId, custom, setCustom } }),
    [theme, choice, setChoice, presetId, custom, setCustom],
  );

  return <ThemeContext.Provider value={value}>{props.children}</ThemeContext.Provider>;
}

export function useTheme(): Theme {
  const ctx = useContext(ThemeContext);
  if (!ctx) throw new Error('useTheme must be used inside ThemeProvider');
  return ctx.theme;
}

export function useAppearance(): Appearance {
  const ctx = useContext(ThemeContext);
  if (!ctx) throw new Error('useAppearance must be used inside ThemeProvider');
  return ctx.appearance;
}
