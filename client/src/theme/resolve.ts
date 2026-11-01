// Which preset shows for the reader's Appearance choice and the phone's light/dark scheme.
import { PRESETS } from './presets';
import { DEFAULT_PRESET, type AppearanceChoice, type PresetId, type ThemeMode } from './types';

export function resolvePresetId(choice: AppearanceChoice, system: ThemeMode | null): PresetId {
  const target: ThemeMode = choice.mode === 'system' ? (system ?? 'light') : choice.mode;
  if (choice.preset === null) return DEFAULT_PRESET[target];
  const meta = PRESETS.find((p) => p.id === choice.preset);
  if (!meta) return DEFAULT_PRESET[target];
  if (meta.mode === target) return meta.id;
  return meta.pair ?? meta.id;
}
