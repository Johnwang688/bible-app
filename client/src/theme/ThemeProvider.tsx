// Provides the active theme and the reader's Appearance choice and customisation. Both live in
// storage, so a write from anywhere (the picker, Customise, sync) re-renders every consumer.
import { createContext, useCallback, useContext, useMemo, type ReactNode } from 'react';
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
  /**
   * Builds the next value from what is stored at the moment of the call (not the value captured at
   * render), so two quick presses or a write from elsewhere are never lost. Return null to write nothing.
   */
  updateChoice(f: (current: AppearanceChoice) => AppearanceChoice | null): void;
  updateCustom(f: (current: AppearanceCustom) => AppearanceCustom | null): void;
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
  const updateChoice = useCallback(
    (f: (current: AppearanceChoice) => AppearanceChoice | null) => {
      const next = f(storage.get(appearanceKey));
      if (next) storage.set(appearanceKey, next);
    },
    [storage],
  );
  const updateCustom = useCallback(
    (f: (current: AppearanceCustom) => AppearanceCustom | null) => {
      const next = f(storage.get(appearanceCustomKey));
      if (next) storage.set(appearanceCustomKey, next);
    },
    [storage],
  );

  const value = useMemo<ThemeContextValue>(
    () => ({ theme, appearance: { choice, setChoice, presetId, custom, setCustom, updateChoice, updateCustom } }),
    [theme, choice, setChoice, presetId, custom, setCustom, updateChoice, updateCustom],
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
