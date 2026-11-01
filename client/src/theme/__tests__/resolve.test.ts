// Acceptance (orchestrator-owned): which preset shows for a choice and the phone's scheme.
import { resolvePresetId } from '../resolve';
import type { AppearanceChoice } from '../types';

const skipped = (mode: AppearanceChoice['mode'] = 'system'): AppearanceChoice => ({ preset: null, mode });

describe('resolvePresetId', () => {
  it('skipping the picker gives Silver in light and Graphite in dark, following the phone', () => {
    expect(resolvePresetId(skipped(), 'light')).toBe('silver');
    expect(resolvePresetId(skipped(), 'dark')).toBe('graphite');
  });

  it('treats an unknown phone scheme as light', () => {
    expect(resolvePresetId(skipped(), null)).toBe('silver');
  });

  it('a fixed mode overrides the phone', () => {
    expect(resolvePresetId(skipped('dark'), 'light')).toBe('graphite');
    expect(resolvePresetId(skipped('light'), 'dark')).toBe('silver');
  });

  it('keeps a chosen preset whose mode already matches', () => {
    expect(resolvePresetId({ preset: 'grape-soda', mode: 'system' }, 'dark')).toBe('grape-soda');
    expect(resolvePresetId({ preset: 'sky', mode: 'light' }, 'dark')).toBe('sky');
  });

  it('swaps a chosen preset for its matched pair when the mode differs', () => {
    expect(resolvePresetId({ preset: 'strawberry-milk', mode: 'system' }, 'dark')).toBe('bubblegum-night');
    expect(resolvePresetId({ preset: 'bubblegum-night', mode: 'system' }, 'light')).toBe('strawberry-milk');
    expect(resolvePresetId({ preset: 'matcha-latte', mode: 'dark' }, 'light')).toBe('matcha-night');
    expect(resolvePresetId({ preset: 'deep-blue', mode: 'light' }, 'dark')).toBe('sky');
    expect(resolvePresetId({ preset: 'graphite', mode: 'system' }, null)).toBe('silver');
  });

  it('keeps a standalone preset (Liberty, Northern lights) in either mode', () => {
    expect(resolvePresetId({ preset: 'liberty', mode: 'system' }, 'dark')).toBe('liberty');
    expect(resolvePresetId({ preset: 'northern-lights', mode: 'light' }, 'light')).toBe('northern-lights');
  });
});
