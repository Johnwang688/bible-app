// Provides the active theme and the reader's Appearance choice. The choice lives in storage,
// so a write from anywhere (the picker, sync) re-renders every consumer.
import { createContext, useContext, useMemo, type ReactNode } from 'react';
import { useColorScheme } from 'react-native';

import { appearanceKey } from '../storage/keys';
import { getStorage, useStoredValue, type Storage } from '../storage/storage';
import { getTheme } from './presets';
import { resolvePresetId } from './resolve';
import type { AppearanceChoice, PresetId, Theme, ThemeMode } from './types';

interface Appearance {
  choice: AppearanceChoice;
  setChoice(c: AppearanceChoice): void;
  presetId: PresetId;
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
  const presetId = resolvePresetId(choice, system);

  const value = useMemo<ThemeContextValue>(
    () => ({ theme: getTheme(presetId), appearance: { choice, setChoice, presetId } }),
    [choice, setChoice, presetId],
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
