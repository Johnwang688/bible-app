// The preset showing at the moment of a press: the stored Appearance choice (not the one captured at
// render) resolved with the phone's light/dark scheme, exactly as the ThemeProvider resolves it.
import { Appearance } from 'react-native';

import { resolvePresetId } from '../theme/resolve';
import { useAppearance } from '../theme/ThemeProvider';
import type { AppearanceChoice, PresetId, ThemeMode } from '../theme/types';

/**
 * The phone scheme the ThemeProvider resolved this render with, when the render shows it (the choice
 * follows the phone and the two schemes would show different presets); otherwise undefined.
 */
function renderedScheme(choice: AppearanceChoice, presetId: PresetId): ThemeMode | null | undefined {
  const asLight = resolvePresetId(choice, 'light') === presetId; // a missing scheme resolves as light
  const asDark = resolvePresetId(choice, 'dark') === presetId;
  if (asLight === asDark) return undefined;
  return asLight ? 'light' : 'dark';
}

function phoneScheme(): ThemeMode | null {
  const s = Appearance.getColorScheme();
  return s === 'light' || s === 'dark' ? s : null;
}

/** Returns a reader of the preset showing now, for press handlers. Each call reads storage afresh. */
export function useShowingPreset(): () => PresetId {
  const { choice, presetId, updateChoice } = useAppearance();
  const rendered = renderedScheme(choice, presetId);
  return () => {
    let stored = choice;
    // A null updater writes nothing: this only reads the stored choice from the provider's storage.
    updateChoice((current) => {
      stored = current;
      return null;
    });
    return resolvePresetId(stored, rendered === undefined ? phoneScheme() : rendered);
  };
}
