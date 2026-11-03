// Acceptance (orchestrator-owned): Appearance customisation (R-6a). Plan: "Visual design" →
// Customisation (presets, accent, reading font, Advanced with a contrast check).
import { act, render, screen } from '@testing-library/react-native';
import { useEffect } from 'react';
import { Text } from 'react-native';

import { appearanceCustomKey } from '../../storage/appearanceCustomKey';
import { appearanceKey } from '../../storage/keys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { contrastRatio, MIN_TEXT_CONTRAST } from '../contrast';
import {
  ACCENT_CHOICES,
  accentAllowed,
  applyCustom,
  contrastFailures,
  editableTokens,
  editedAccent,
  NO_CUSTOM,
  onAccentFor,
  resetPreset,
  setAccent,
  setTokenEdit,
  validEdits,
  type AppearanceCustom,
} from '../custom';
import { getTheme } from '../presets';
import { ThemeProvider, useAppearance, useTheme } from '../ThemeProvider';
import { PRESET_IDS } from '../types';

const BLUE = ACCENT_CHOICES.find((c) => c.id === 'blue')!.color;

function ok(r: ReturnType<typeof setTokenEdit>): AppearanceCustom {
  if (!r.ok) throw new Error(`expected ok, got ${JSON.stringify(r)}`);
  return r.custom;
}

describe('editable tokens', () => {
  it('pastel presets can edit their solid surfaces; glass presets cannot edit gradients', () => {
    const pastel = editableTokens('strawberry-milk');
    expect(pastel).toEqual(expect.arrayContaining(['bg', 'surface', 'text', 'muted', 'accent', 'c1', 'btn']));
    const glass = editableTokens('silver');
    expect(glass).toEqual(expect.arrayContaining(['text', 'muted', 'accent', 'onAccent', 'vnum']));
    // Silver's background, cards, chips and tab bar are gradients or translucent layers over the aurora.
    expect(glass).not.toContain('bg');
    expect(glass).not.toContain('surface');
  });

  it('every preset has at least the text, muted and accent tokens', () => {
    for (const id of PRESET_IDS) expect(editableTokens(id)).toEqual(expect.arrayContaining(['text', 'muted', 'accent']));
  });
});

describe('applyCustom', () => {
  it('returns the preset theme itself when nothing is customised', () => {
    for (const id of PRESET_IDS) expect(applyCustom(id, NO_CUSTOM)).toBe(getTheme(id));
  });

  it('applies a colour edit through the whole theme', () => {
    const custom = ok(setTokenEdit(NO_CUSTOM, 'strawberry-milk', 'text', '#2a2a2a'));
    expect(custom.edits['strawberry-milk']).toEqual({ text: '#2A2A2A' });
    const theme = applyCustom('strawberry-milk', custom);
    expect(theme.colors.text).toBe('#2A2A2A');
    expect(theme.canvas.text).toBe('#2A2A2A');
    // Everything else is the preset's.
    expect(theme.colors.muted).toBe(getTheme('strawberry-milk').colors.muted);
    expect(theme.backgrounds).toEqual(getTheme('strawberry-milk').backgrounds);
  });

  it('keeps edits per preset', () => {
    const custom = ok(setTokenEdit(NO_CUSTOM, 'silver', 'text', '#000000'));
    expect(applyCustom('silver', custom).colors.text).toBe('#000000');
    expect(applyCustom('graphite', custom)).toBe(getTheme('graphite'));
  });

  it('applies the reading font, and only the reading font', () => {
    // Pastel presets read in Literata, glass presets in Source Serif 4.
    expect(getTheme('strawberry-milk').type.scripture).toBe('Literata');
    expect(getTheme('silver').type.scripture).toBe('SourceSerif4');
    const theme = applyCustom('strawberry-milk', { scriptureFont: 'SourceSerif4', edits: {} });
    expect(theme.type.scripture).toBe('SourceSerif4');
    expect({ ...theme, type: { ...theme.type, scripture: 'Literata' } }).toEqual(getTheme('strawberry-milk'));
    expect(applyCustom('silver', { scriptureFont: 'Literata', edits: {} }).type.scripture).toBe('Literata');
    // Choosing the preset's own font changes nothing.
    expect(applyCustom('silver', { scriptureFont: 'SourceSerif4', edits: {} })).toBe(getTheme('silver'));
  });

  it('ignores a stored set of edits that fails the contrast guard, as a whole', () => {
    // Written by an older build or by hand: text the colour of the background.
    const bad: AppearanceCustom = {
      scriptureFont: 'SourceSerif4',
      edits: { 'strawberry-milk': { text: getTheme('strawberry-milk').colors.base.toUpperCase(), muted: '#222222' } },
    };
    expect(validEdits(bad, 'strawberry-milk')).toEqual({});
    const theme = applyCustom('strawberry-milk', bad);
    expect(theme.colors.text).toBe(getTheme('strawberry-milk').colors.text);
    expect(theme.colors.muted).toBe(getTheme('strawberry-milk').colors.muted);
    // The font is a separate choice and still applies.
    expect(theme.type.scripture).toBe('SourceSerif4');
  });

  it('ignores a stored edit of a token the preset cannot edit', () => {
    const bad = { scriptureFont: null, edits: { silver: { bg: '#FFFFFF', text: '#000000' } } } as AppearanceCustom;
    expect(validEdits(bad, 'silver')).toEqual({});
    expect(applyCustom('silver', bad)).toBe(getTheme('silver'));
  });
});

describe('the contrast guard', () => {
  it('refuses an edit that makes text unreadable, and says which pairs fail', () => {
    const base = getTheme('strawberry-milk').colors.base;
    const r = setTokenEdit(NO_CUSTOM, 'strawberry-milk', 'text', base);
    expect(r.ok).toBe(false);
    if (r.ok || r.reason !== 'contrast') throw new Error('expected a contrast failure');
    expect(r.failures.map((f) => f.name)).toContain('text/bg');
    for (const f of r.failures) expect(f.ratio).toBeLessThan(MIN_TEXT_CONTRAST);
  });

  it('checks the background side too', () => {
    const r = setTokenEdit(NO_CUSTOM, 'strawberry-milk', 'bg', '#222222');
    expect(r).toMatchObject({ ok: false, reason: 'contrast' });
  });

  it('allows a preset its known gaps, but never makes one worse', () => {
    // Graphite's muted text over a bright glow is a known gap (3.37:1); editing something else is fine.
    expect(contrastFailures('graphite', {})).toEqual([]);
    expect(setTokenEdit(NO_CUSTOM, 'graphite', 'text', '#FFFFFF').ok).toBe(true);
    // A darker muted makes that gap worse, so it is refused.
    const darker = setTokenEdit(NO_CUSTOM, 'graphite', 'muted', '#5A5A5A');
    expect(darker).toMatchObject({ ok: false, reason: 'contrast' });
  });

  it('rejects colours that are not #rrggbb, and tokens the preset cannot edit', () => {
    for (const bad of ['red', '#12345', '#1234567', 'rgba(0, 0, 0, 1)', '']) {
      expect(setTokenEdit(NO_CUSTOM, 'silver', 'text', bad)).toEqual({ ok: false, reason: 'invalid-color' });
    }
    expect(setTokenEdit(NO_CUSTOM, 'silver', 'bg', '#FFFFFF')).toEqual({ ok: false, reason: 'not-editable' });
  });

  it('clearing an edit goes back to the preset value', () => {
    const custom = ok(setTokenEdit(NO_CUSTOM, 'silver', 'text', '#000000'));
    const cleared = ok(setTokenEdit(custom, 'silver', 'text', null));
    expect(cleared.edits).toEqual({});
    expect(applyCustom('silver', cleared)).toBe(getTheme('silver'));
  });
});

describe('accent', () => {
  it('sets the accent with a readable onAccent', () => {
    const custom = ok(setAccent(NO_CUSTOM, 'strawberry-milk', BLUE));
    expect(editedAccent(custom, 'strawberry-milk')).toBe(BLUE);
    const theme = applyCustom('strawberry-milk', custom);
    expect(theme.colors.accent).toBe(BLUE);
    expect(contrastRatio(theme.colors.onAccent, BLUE)).toBeGreaterThanOrEqual(MIN_TEXT_CONTRAST);
  });

  it('onAccent is white on a dark accent and near-black on a light one', () => {
    expect(onAccentFor('#1F5FAE')).toBe('#FFFFFF');
    expect(onAccentFor('#F7D9E3')).toBe('#111418');
    // A light accent on a dark glass preset gets dark text on it.
    const custom = ok(setAccent(NO_CUSTOM, 'graphite', '#f7d9e3'));
    expect(custom.edits.graphite).toEqual({ accent: '#F7D9E3', onAccent: '#111418' });
  });

  it('a dark accent cannot be used where the accent is text on a dark background', () => {
    // Bubblegum night uses its accent as text on the dark page (accent/bg).
    expect(accentAllowed(NO_CUSTOM, 'bubblegum-night', BLUE)).toBe(false);
    expect(setAccent(NO_CUSTOM, 'bubblegum-night', BLUE)).toMatchObject({ ok: false, reason: 'contrast' });
    expect(accentAllowed(NO_CUSTOM, 'strawberry-milk', BLUE)).toBe(true);
  });

  it('"Preset accent" clears the accent and its onAccent, keeping other edits', () => {
    let custom = ok(setTokenEdit(NO_CUSTOM, 'strawberry-milk', 'text', '#2A2A2A'));
    custom = ok(setAccent(custom, 'strawberry-milk', BLUE));
    custom = ok(setAccent(custom, 'strawberry-milk', null));
    expect(custom.edits['strawberry-milk']).toEqual({ text: '#2A2A2A' });
    expect(editedAccent(custom, 'strawberry-milk')).toBeNull();
  });
});

describe('reset', () => {
  it('drops this preset’s colour edits only, and keeps the reading font', () => {
    let custom: AppearanceCustom = { scriptureFont: 'SourceSerif4', edits: {} };
    custom = ok(setTokenEdit(custom, 'silver', 'text', '#000000'));
    custom = ok(setTokenEdit(custom, 'graphite', 'text', '#FFFFFF'));
    const reset = resetPreset(custom, 'silver');
    expect(reset.edits).toEqual({ graphite: { text: '#FFFFFF' } });
    expect(reset.scriptureFont).toBe('SourceSerif4');
  });
});

describe('the stored value', () => {
  it('round-trips through storage', () => {
    const storage = createStorage(memoryBackend());
    const custom = ok(setAccent({ scriptureFont: 'SourceSerif4', edits: {} }, 'strawberry-milk', BLUE));
    storage.set(appearanceCustomKey, custom);
    expect(storage.get(appearanceCustomKey)).toEqual(custom);
  });

  it('refuses malformed values', () => {
    const storage = createStorage(memoryBackend());
    const bad = [
      { scriptureFont: 'Comic Sans', edits: {} },
      { scriptureFont: null, edits: { 'not-a-preset': { text: '#000000' } } },
      { scriptureFont: null, edits: { silver: { notAToken: '#000000' } } },
      { scriptureFont: null, edits: { silver: { text: 'black' } } },
      { scriptureFont: null, edits: { silver: { text: '#00000g' } } },
    ];
    for (const value of bad) expect(() => storage.set(appearanceCustomKey, value as AppearanceCustom)).toThrow();
  });

  it('reads the fallback when the stored value is corrupt', () => {
    const backend = memoryBackend();
    const storage = createStorage(backend);
    storage.set(appearanceCustomKey, { scriptureFont: 'SourceSerif4', edits: {} });
    const raw = backend.getString('appearance.custom')!;
    backend.set('appearance.custom', raw.replace('SourceSerif4', 'Papyrus'));
    expect(storage.get(appearanceCustomKey)).toEqual(NO_CUSTOM);
  });
});

describe('ThemeProvider with customisation', () => {
  let setCustomRef: ((c: AppearanceCustom) => void) | null = null;

  function Probe() {
    const theme = useTheme();
    const { custom, setCustom } = useAppearance();
    useEffect(() => {
      setCustomRef = setCustom;
    });
    return (
      <>
        <Text testID="text">{theme.colors.text}</Text>
        <Text testID="font">{theme.type.scripture}</Text>
        <Text testID="custom">{JSON.stringify(custom)}</Text>
      </>
    );
  }

  it('applies stored edits and reacts to a change', async () => {
    // Silver reads in Source Serif 4, so the font change below is Literata.
    const storage = createStorage(memoryBackend());
    storage.set(appearanceKey, { preset: 'silver', mode: 'light' });
    storage.set(appearanceCustomKey, ok(setTokenEdit(NO_CUSTOM, 'silver', 'text', '#000000')));
    await render(
      <ThemeProvider storage={storage} systemScheme="light">
        <Probe />
      </ThemeProvider>,
    );
    expect(screen.getByTestId('text')).toHaveTextContent('#000000');
    expect(screen.getByTestId('font')).toHaveTextContent('SourceSerif4');
    await act(async () => setCustomRef!({ scriptureFont: 'Literata', edits: {} }));
    expect(screen.getByTestId('text')).toHaveTextContent(getTheme('silver').colors.text);
    expect(screen.getByTestId('font')).toHaveTextContent('Literata');
    expect(storage.get(appearanceCustomKey)).toEqual({ scriptureFont: 'Literata', edits: {} });
  });

  it('a write from elsewhere (sync, another screen) re-renders the theme', async () => {
    const storage = createStorage(memoryBackend());
    storage.set(appearanceKey, { preset: 'silver', mode: 'light' });
    await render(
      <ThemeProvider storage={storage} systemScheme="light">
        <Probe />
      </ThemeProvider>,
    );
    await act(async () => storage.set(appearanceCustomKey, ok(setTokenEdit(NO_CUSTOM, 'silver', 'text', '#000000'))));
    expect(screen.getByTestId('text')).toHaveTextContent('#000000');
  });
});
