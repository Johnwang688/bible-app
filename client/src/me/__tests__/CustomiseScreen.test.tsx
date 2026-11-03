// Acceptance (orchestrator-owned): Customise and Advanced (R-6a). Plan: "Visual design" →
// Customisation; design: Customize.dc.html. The logic lives in src/theme/custom.ts (tested there);
// these tests check the screens drive it and show its state.
import { act, fireEvent, screen, within } from '@testing-library/react-native';

import { appearanceCustomKey } from '../../storage/appearanceCustomKey';
import { appearanceKey, readingSettingsKey } from '../../storage/keys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { ACCENT_CHOICES, ACCENT_STAND_IN, editableTokens, NO_CUSTOM, setTokenEdit } from '../../theme/custom';
import { getTheme, PRESETS } from '../../theme/presets';
import { AdvancedScreen } from '../AdvancedScreen';
import { CustomiseScreen } from '../CustomiseScreen';
import { renderMe, ZH } from './meHarness';

const BLUE = ACCENT_CHOICES.find((c) => c.id === 'blue')!.color;
const press = async (id: string) => act(async () => fireEvent.press(screen.getByTestId(id)));
const selected = (id: string) => screen.getByTestId(id).props.accessibilityState?.selected === true;

async function renderCustomise(opts: Parameters<typeof renderMe>[1] = {}) {
  const calls: string[] = [];
  const out = await renderMe(<CustomiseScreen onBack={() => calls.push('back')} onAdvanced={() => calls.push('advanced')} />, opts);
  return { ...out, calls };
}

function storageWith(preset: (typeof PRESETS)[number]['id'], mode: 'system' | 'light' | 'dark' = 'system') {
  const storage = createStorage(memoryBackend());
  storage.set(appearanceKey, { preset, mode });
  return storage;
}

describe('Customise', () => {
  it('shows every section of the design, and Back', async () => {
    const { calls } = await renderCustomise();
    expect(screen.getByTestId('screen-customise')).toBeTruthy();
    expect(screen.getByText('Customise')).toBeTruthy();
    for (const label of ['Look', 'Light or dark', 'Accent', 'Reading font', 'Text size', 'Advanced: every colour']) {
      expect(screen.getByText(label)).toBeTruthy();
    }
    expect(screen.getByTestId('customise-preview').props.accessibilityLabel).toBe('Live preview of Home');
    await press('customise-back');
    await press('customise-advanced');
    expect(calls).toEqual(['back', 'advanced']);
  });

  it('lists all 12 presets as radio buttons, the current one selected', async () => {
    await renderCustomise({ storage: storageWith('matcha-latte', 'light') });
    for (const p of PRESETS) expect(screen.getByTestId(`customise-preset-${p.id}`).props.accessibilityRole).toBe('radio');
    expect(selected('customise-preset-matcha-latte')).toBe(true);
    expect(selected('customise-preset-silver')).toBe(false);
  });

  it('picking a preset in the current mode keeps the mode setting', async () => {
    const { storage } = await renderCustomise({ scheme: 'light' });
    await press('customise-preset-sky');
    expect(storage.get(appearanceKey)).toEqual({ preset: 'sky', mode: 'system' });
    expect(selected('customise-preset-sky')).toBe(true);
  });

  it('picking a preset of the other mode switches to that mode, so it shows', async () => {
    const { storage } = await renderCustomise({ scheme: 'light' });
    await press('customise-preset-grape-soda');
    expect(storage.get(appearanceKey)).toEqual({ preset: 'grape-soda', mode: 'dark' });
    expect(selected('customise-preset-grape-soda')).toBe(true);
  });

  it('sets light, dark or follow the phone', async () => {
    const { storage } = await renderCustomise({ storage: storageWith('silver'), scheme: 'light' });
    expect(selected('customise-mode-system')).toBe(true);
    await press('customise-mode-dark');
    expect(storage.get(appearanceKey)).toEqual({ preset: 'silver', mode: 'dark' });
    // Silver's dark partner shows.
    expect(selected('customise-preset-graphite')).toBe(true);
    await press('customise-mode-system');
    expect(storage.get(appearanceKey)).toEqual({ preset: 'silver', mode: 'system' });
  });

  it('accent: the preset accent first, then the fixed choices; picking one stores it for this preset', async () => {
    const { storage } = await renderCustomise({ storage: storageWith('strawberry-milk', 'light') });
    expect(selected('customise-accent-preset')).toBe(true);
    await press('customise-accent-blue');
    expect(storage.get(appearanceCustomKey).edits['strawberry-milk']).toMatchObject({ accent: BLUE });
    expect(selected('customise-accent-blue')).toBe(true);
    expect(selected('customise-accent-preset')).toBe(false);
    await press('customise-accent-preset');
    expect(storage.get(appearanceCustomKey).edits['strawberry-milk']).toBeUndefined();
  });

  it('a fixed accent that repeats the preset’s own shows Slate instead', async () => {
    // Strawberry milk's own accent is the Rose choice (#A62B55).
    expect(getTheme('strawberry-milk').colors.accent.toUpperCase()).toBe('#A62B55');
    await renderCustomise({ storage: storageWith('strawberry-milk', 'light') });
    expect(screen.queryByTestId('customise-accent-rose')).toBeNull();
    expect(screen.getByTestId('customise-accent-slate')).toBeTruthy();
    expect(screen.getByTestId('customise-accent-slate').props.accessibilityLabel).toContain('Slate');
    // Its colour is the stand-in.
    void ACCENT_STAND_IN;
  });

  it('an accent that would be hard to read is disabled and says why', async () => {
    const { storage } = await renderCustomise({ storage: storageWith('bubblegum-night', 'dark'), scheme: 'dark' });
    const blue = screen.getByTestId('customise-accent-blue');
    expect(blue.props.accessibilityState).toMatchObject({ disabled: true });
    expect(blue.props.accessibilityLabel).toBe('Blue: hard to read with this look');
    await press('customise-accent-blue');
    expect(storage.get(appearanceCustomKey)).toEqual(NO_CUSTOM);
  });

  it('reading font', async () => {
    const { storage } = await renderCustomise({ storage: storageWith('strawberry-milk', 'light') });
    expect(selected('customise-font-Literata')).toBe(true);
    await press('customise-font-SourceSerif4');
    expect(storage.get(appearanceCustomKey).scriptureFont).toBe('SourceSerif4');
    expect(selected('customise-font-SourceSerif4')).toBe(true);
  });

  it('text size: smaller and larger, stopping at the ends; the preview follows', async () => {
    const storage = createStorage(memoryBackend());
    storage.set(readingSettingsKey, { textSize: 4, parallel: null });
    await renderCustomise({ storage });
    expect(screen.getByTestId('customise-size-value')).toHaveTextContent('24');
    expect(screen.getByTestId('customise-preview-verse').props.style).toEqual(expect.objectContaining({ fontSize: 24 }));
    await press('customise-size-larger');
    expect(storage.get(readingSettingsKey).textSize).toBe(5);
    expect(screen.getByTestId('customise-size-larger').props.accessibilityState).toMatchObject({ disabled: true });
    await press('customise-size-larger');
    expect(storage.get(readingSettingsKey).textSize).toBe(5);
    await press('customise-size-smaller');
    expect(storage.get(readingSettingsKey).textSize).toBe(4);
    expect(screen.getByTestId('customise-preview-verse').props.style).toEqual(expect.objectContaining({ fontSize: 24 }));
  });

  it('the preview uses the live theme', async () => {
    await renderCustomise({ storage: storageWith('strawberry-milk', 'light') });
    const preview = screen.getByTestId('customise-preview');
    expect(within(preview).getByText('The LORD is my shepherd; I shall not want.')).toBeTruthy();
    await press('customise-accent-blue');
    const cta = within(screen.getByTestId('customise-preview')).getByTestId('customise-preview-cta');
    expect(cta.props.style).toEqual(expect.objectContaining({ backgroundColor: getTheme('strawberry-milk').colors.cta }));
    // The accent shows in the preview's accent mark.
    const mark = within(screen.getByTestId('customise-preview')).getByTestId('customise-preview-accent');
    expect(mark.props.style).toEqual(expect.objectContaining({ backgroundColor: BLUE }));
  });

  it('Reset drops this preset’s colour edits and nothing else', async () => {
    const storage = storageWith('strawberry-milk', 'light');
    let custom = { ...NO_CUSTOM, scriptureFont: 'SourceSerif4' as const };
    const a = setTokenEdit(custom, 'strawberry-milk', 'text', '#2A2A2A');
    if (!a.ok) throw new Error('setup');
    const b = setTokenEdit(a.custom, 'silver', 'text', '#000000');
    if (!b.ok) throw new Error('setup');
    custom = b.custom as typeof custom;
    storage.set(appearanceCustomKey, custom);
    await renderCustomise({ storage });
    expect(screen.getByTestId('customise-reset').props.accessibilityLabel).toBe('Reset Strawberry milk to its own colours');
    await press('customise-reset');
    expect(storage.get(appearanceCustomKey)).toEqual({ scriptureFont: 'SourceSerif4', edits: { silver: { text: '#000000' } } });
  });

  it('in Chinese, with the note that Chinese Scripture keeps its font', async () => {
    await renderCustomise({ locales: [ZH] });
    expect(screen.getByText('自定义')).toBeTruthy();
    expect(screen.getByText('强调色')).toBeTruthy();
    expect(screen.getByTestId('customise-font-note')).toHaveTextContent('中文经文始终使用思源宋体。');
    expect(within(screen.getByTestId('customise-preview')).getByText('耶和华是我的牧者，我必不至缺乏。')).toBeTruthy();
  });
});

describe('Advanced', () => {
  async function renderAdvanced(storage = storageWith('strawberry-milk', 'light')) {
    const calls: string[] = [];
    const out = await renderMe(<AdvancedScreen onBack={() => calls.push('back')} />, { storage });
    return { ...out, calls };
  }
  const input = (token: string) => screen.getByTestId(`advanced-input-${token}`);
  async function enter(token: string, value: string) {
    await act(async () => fireEvent.changeText(input(token), value));
    await press(`advanced-apply-${token}`);
  }

  it('lists exactly the tokens this preset can edit, with their current values', async () => {
    const { calls } = await renderAdvanced();
    expect(screen.getByTestId('screen-advanced')).toBeTruthy();
    expect(screen.getByText('Changes apply to Strawberry milk only. Text must stay at least 4.5:1 against what it sits on.')).toBeTruthy();
    const rows = screen.queryAllByTestId(/^advanced-token-[a-zA-Z0-9]+$/).map((n) => (n.props.testID as string).slice('advanced-token-'.length));
    expect(rows).toEqual([...editableTokens('strawberry-milk')]);
    expect(input('text').props.value.toUpperCase()).toBe(getTheme('strawberry-milk').canvas.text.toUpperCase());
    expect(input('text').props.accessibilityLabel).toBe(`Text colour, now ${input('text').props.value}`);
    expect(screen.getByText('Page background')).toBeTruthy();
    await press('advanced-back');
    expect(calls).toEqual(['back']);
  });

  it('applies a readable edit and marks it', async () => {
    const { storage } = await renderAdvanced();
    expect(screen.queryByTestId('advanced-edited-text')).toBeNull();
    await enter('text', '#2a2a2a');
    expect(storage.get(appearanceCustomKey).edits['strawberry-milk']).toEqual({ text: '#2A2A2A' });
    expect(screen.getByTestId('advanced-edited-text')).toHaveTextContent('Edited');
    expect(screen.queryByTestId('advanced-error-text')).toBeNull();
  });

  it('refuses an unreadable edit, says so, and stores nothing', async () => {
    const { storage } = await renderAdvanced();
    await enter('text', getTheme('strawberry-milk').colors.base);
    expect(storage.get(appearanceCustomKey)).toEqual(NO_CUSTOM);
    expect(screen.getByTestId('advanced-error-text').props.children).toEqual(expect.stringMatching(/^Too hard to read: \d+ text and background pairs? would fall below 4\.5:1 \(lowest 1(\.0+)?:1\)\.$/));
  });

  it('refuses a malformed colour with an example', async () => {
    const { storage } = await renderAdvanced();
    await enter('text', 'black');
    expect(screen.getByTestId('advanced-error-text')).toHaveTextContent('Use a colour like #1F5FAE.');
    expect(storage.get(appearanceCustomKey)).toEqual(NO_CUSTOM);
  });

  it('resets one token', async () => {
    const { storage } = await renderAdvanced();
    await enter('text', '#2a2a2a');
    await enter('muted', '#333333');
    await press('advanced-reset-text');
    expect(storage.get(appearanceCustomKey).edits['strawberry-milk']).toEqual({ muted: '#333333' });
    expect(input('text').props.value.toUpperCase()).toBe(getTheme('strawberry-milk').canvas.text.toUpperCase());
    expect(screen.queryByTestId('advanced-reset-text')).toBeNull();
  });

  it('works on the preset that shows, and glass presets offer no gradient tokens', async () => {
    await renderAdvanced(storageWith('silver', 'light'));
    expect(screen.queryByTestId('advanced-token-bg')).toBeNull();
    expect(screen.queryByTestId('advanced-token-surface')).toBeNull();
    expect(screen.getByTestId('advanced-token-text')).toBeTruthy();
  });
});
