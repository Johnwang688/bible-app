// Acceptance (orchestrator-owned): the daily-goal sheet, as approved in design/proposed/r4-goal-sheet.html with the
// review fixes in r4/GO-AHEAD.md (one dismiss control, an adjustable value, the selected chip not by colour alone,
// a 4-column grid of quick picks, minHeight not fixed heights, a scrolling body).
import { QueryClient } from '@tanstack/react-query';
import { act, fireEvent, render, screen, within } from '@testing-library/react-native';
import { StyleSheet } from 'react-native';
import { SafeAreaProvider } from 'react-native-safe-area-context';

import { ApiProvider } from '../../api/ApiProvider';
import { I18nProvider } from '../../i18n/I18nProvider';
import { EN, fakeApi, ZH } from '../../reader/__tests__/readerHarness';
import { readingProgressKey } from '../../storage/keys';
import { createStorage, memoryBackend, type Storage } from '../../storage/storage';
import { ThemeProvider } from '../../theme/ThemeProvider';
import { GoalSheet } from '../GoalSheet';
import { shouldDismissSheet } from '../swipeDown';
import { renderHome } from './homeHarness';

jest.mock('expo-clipboard', () => ({ setStringAsync: jest.fn(async () => true) }));

const JOHN3_WEB = { bookNumber: 43, chapter: 3, translation: 'WEB' } as const;
const TODAY = '2026-11-04';
const min = (n: number) => n * 60_000;
type El = { props: Record<string, unknown> & { style?: unknown; children?: unknown } };
const style = (el: El) => (StyleSheet.flatten(el.props.style as never) ?? {}) as Record<string, unknown>;
const textOf = (el: El): string => {
  const c = el.props.children;
  if (typeof c === 'string' || typeof c === 'number') return String(c);
  if (Array.isArray(c)) return c.map((x) => (typeof x === 'string' || typeof x === 'number' ? String(x) : x?.props ? textOf(x) : '')).join('');
  return c && typeof c === 'object' && 'props' in c ? textOf(c as never) : '';
};
/** The element's role, whether set with `role` or `accessibilityRole`. */
const roleOf = (el: El) => el.props.role ?? el.props.accessibilityRole;
/** The element's value, whether set with `accessibilityValue` or the `aria-value*` props. */
const valueOf = (el: El) => {
  const v = (el.props.accessibilityValue ?? {}) as Record<string, unknown>;
  return {
    min: el.props['aria-valuemin'] ?? v.min,
    max: el.props['aria-valuemax'] ?? v.max,
    now: el.props['aria-valuenow'] ?? v.now,
    text: el.props['aria-valuetext'] ?? v.text,
  };
};
type Node = { type?: unknown; children?: unknown[] };
/** Whether a host component of this type is at or under the element. */
const hasHost = (el: Node, type: string): boolean =>
  el.type === type || (el.children ?? []).some((c) => typeof c === 'object' && c !== null && hasHost(c as Node, type));
const politeLive = (el: El) => el.props.accessibilityLiveRegion === 'polite' || el.props['aria-live'] === 'polite';

/** The sheet on its own, as the Me tab (R-6a) will mount it. */
async function renderSheet(opts: { storage?: Storage; locales?: typeof EN[]; goal?: number; todayMs?: number } = {}) {
  const storage = opts.storage ?? createStorage(memoryBackend());
  storage.set(readingProgressKey, {
    ...storage.get(readingProgressKey),
    goalMinutes: opts.goal ?? 10,
    activeMs: opts.todayMs ? { [TODAY]: opts.todayMs } : {},
  });
  const onClose = jest.fn();
  const queryClient = new QueryClient();
  await render(
    <SafeAreaProvider initialMetrics={{ frame: { x: 0, y: 0, width: 390, height: 844 }, insets: { top: 47, left: 0, right: 0, bottom: 34 } }}>
      <ApiProvider client={fakeApi().api} queryClient={queryClient}>
        <I18nProvider storage={storage} locales={opts.locales ?? [EN]}>
          <ThemeProvider storage={storage} systemScheme="light">
            <GoalSheet storage={storage} now={() => new Date(2026, 10, 4, 18, 0)} onClose={onClose} />
          </ThemeProvider>
        </I18nProvider>
      </ApiProvider>
    </SafeAreaProvider>,
  );
  return { storage, onClose };
}
const goal = (s: Storage) => s.get(readingProgressKey).goalMinutes;

describe('GoalSheet', () => {
  it('shows the title, the hint (a change counts from today on) and the current goal', async () => {
    await renderSheet({ goal: 15 });
    const sheet = screen.getByTestId('goal-sheet');
    const title = within(sheet).getByText('Daily goal');
    expect(title.props.accessibilityRole ?? title.props.role).toMatch(/^(header|heading)$/);
    expect(within(sheet).getByText('Minutes of reading a day, from today on. Your streak counts the days you reach it.')).toBeTruthy();
    expect(textOf(screen.getByTestId('goal-value'))).toBe('15');
    expect(within(sheet).getByText('min')).toBeTruthy();
  });

  it('the value is an adjustable spin button: labelled, with its range and value, announced politely', async () => {
    await renderSheet({ goal: 15 });
    const group = screen.getByTestId('goal-value-group');
    expect(roleOf(group)).toBe('spinbutton');
    expect(group.props.accessibilityLabel ?? group.props['aria-label']).toBe('Daily goal');
    expect(valueOf(group)).toEqual({ min: 5, max: 120, now: 15, text: '15 min' });
    expect(politeLive(group)).toBe(true);
  });

  it('the spin button’s increment and decrement actions step the goal and save it', async () => {
    const { storage } = await renderSheet({ goal: 15 });
    const group = () => screen.getByTestId('goal-value-group');
    const actions = (group().props.accessibilityActions as { name: string }[]).map((a) => a.name);
    expect(actions).toEqual(expect.arrayContaining(['increment', 'decrement']));
    await fireEvent(group(), 'accessibilityAction', { nativeEvent: { actionName: 'increment' } });
    expect(goal(storage)).toBe(20);
    expect(valueOf(group()).now).toBe(20);
    await fireEvent(group(), 'accessibilityAction', { nativeEvent: { actionName: 'decrement' } });
    await fireEvent(group(), 'accessibilityAction', { nativeEvent: { actionName: 'decrement' } });
    expect(goal(storage)).toBe(10);
    expect(valueOf(group())).toMatchObject({ now: 10, text: '10 min' });
  });

  it('minus and plus move the goal by 5 minutes and save at once, stopping at 5 and 120, drawn disabled there', async () => {
    const { storage } = await renderSheet({ goal: 10 });
    await fireEvent.press(screen.getByTestId('goal-plus'));
    expect(goal(storage)).toBe(15);
    expect(textOf(screen.getByTestId('goal-value'))).toBe('15');
    expect(style(screen.getByTestId('goal-minus')).opacity ?? 1).toBe(1);
    await fireEvent.press(screen.getByTestId('goal-minus'));
    await fireEvent.press(screen.getByTestId('goal-minus'));
    expect(goal(storage)).toBe(5);
    expect(screen.getByTestId('goal-minus').props.accessibilityState).toMatchObject({ disabled: true });
    expect(style(screen.getByTestId('goal-minus')).opacity).toBeLessThanOrEqual(0.5);
    await fireEvent.press(screen.getByTestId('goal-minus'));
    expect(goal(storage)).toBe(5);
    await act(async () => storage.set(readingProgressKey, { ...storage.get(readingProgressKey), goalMinutes: 120 }));
    expect(screen.getByTestId('goal-plus').props.accessibilityState).toMatchObject({ disabled: true });
    expect(style(screen.getByTestId('goal-plus')).opacity).toBeLessThanOrEqual(0.5);
    expect(screen.getByTestId('goal-minus').props.accessibilityState?.disabled).toBeFalsy();
    expect(style(screen.getByTestId('goal-minus')).opacity ?? 1).toBe(1);
    expect(screen.getByTestId('goal-minus').props.accessibilityLabel).toBe('Five minutes less');
    expect(screen.getByTestId('goal-plus').props.accessibilityLabel).toBe('Five minutes more');
  });

  it('the quick picks set the goal; the chosen one is selected, with a check mark and the hard shadow', async () => {
    const { storage } = await renderSheet({ goal: 10 });
    for (const n of [5, 10, 15, 20, 30, 45, 60]) expect(screen.getByTestId(`goal-choice-${n}`)).toBeTruthy();
    expect(screen.getByTestId('goal-choice-10').props.accessibilityState).toMatchObject({ selected: true });
    expect(screen.getByTestId('goal-choice-30').props.accessibilityLabel).toBe('30 minutes a day');
    expect(screen.getByTestId('goal-choice-10-check')).toBeTruthy();
    expect(screen.queryByTestId('goal-choice-30-check')).toBeNull();
    expect(String(style(screen.getByTestId('goal-choice-10')).boxShadow ?? '')).not.toBe('');
    expect(String(style(screen.getByTestId('goal-choice-30')).boxShadow ?? '')).toBe('');
    await fireEvent.press(screen.getByTestId('goal-choice-30'));
    expect(goal(storage)).toBe(30);
    expect(screen.getByTestId('goal-choice-30').props.accessibilityState).toMatchObject({ selected: true });
    expect(screen.getByTestId('goal-choice-10').props.accessibilityState).toMatchObject({ selected: false });
    expect(screen.getByTestId('goal-choice-30-check')).toBeTruthy();
    expect(screen.queryByTestId('goal-choice-10-check')).toBeNull();
  });

  it('the quick picks sit in a grid of four columns: 5 10 15 20, then 30 45 60, equal widths', async () => {
    await renderSheet();
    const row0 = screen.getByTestId('goal-choices-row-0');
    const row1 = screen.getByTestId('goal-choices-row-1');
    for (const n of [5, 10, 15, 20]) expect(within(row0).getByTestId(`goal-choice-${n}`)).toBeTruthy();
    for (const n of [30, 45, 60]) expect(within(row1).getByTestId(`goal-choice-${n}`)).toBeTruthy();
    expect(style(row0).flexDirection).toBe('row');
    for (const n of [5, 60]) {
      const s = style(screen.getByTestId(`goal-choice-${n}`));
      expect(s.flex === 1 || s.flexGrow === 1).toBe(true);
    }
  });

  it('lowering the goal to what was read today counts today as met, and says so; raising it again keeps the day', async () => {
    const { storage } = await renderSheet({ goal: 20, todayMs: min(12) });
    expect(screen.queryByTestId('goal-met-today')).toBeNull();
    await fireEvent.press(screen.getByTestId('goal-choice-10'));
    expect(storage.get(readingProgressKey).goalMetDays).toEqual([TODAY]);
    expect(textOf(screen.getByTestId('goal-met-today'))).toBe('Today counts as done.');
    await fireEvent.press(screen.getByTestId('goal-choice-15'));
    expect(storage.get(readingProgressKey).goalMetDays).toEqual([TODAY]);
    expect(textOf(screen.getByTestId('goal-met-today'))).toBe('Today counts as done.');
  });

  it('“Today counts as done” is not shown on a day not yet met', async () => {
    await renderSheet({ goal: 10, todayMs: min(4) });
    expect(screen.queryByTestId('goal-met-today')).toBeNull();
  });

  it('one dismiss control: the close button (no Done); Escape and Android back close it too', async () => {
    const { onClose } = await renderSheet();
    expect(screen.queryByTestId('goal-done')).toBeNull();
    const close = screen.getByTestId('goal-sheet-close');
    expect(close.props.accessibilityLabel).toBe('Close');
    await fireEvent.press(close);
    expect(onClose).toHaveBeenCalledTimes(1);
    // Escape on the web and the Android back button reach the Modal's onRequestClose.
    await act(async () => fireEvent(screen.getByTestId('goal-value'), 'requestClose'));
    expect(onClose).toHaveBeenCalledTimes(2);
  });

  it('a swipe down on the sheet’s header closes it', async () => {
    await renderSheet();
    const drag = screen.getByTestId('goal-sheet-drag');
    expect(typeof drag.props.onMoveShouldSetResponder).toBe('function');
    expect(typeof drag.props.onResponderRelease).toBe('function');
    expect(shouldDismissSheet(120, 0)).toBe(true);
    expect(shouldDismissSheet(30, 1)).toBe(true);
    expect(shouldDismissSheet(30, 0.1)).toBe(false);
    expect(shouldDismissSheet(10, 2)).toBe(false);
    expect(shouldDismissSheet(-120, -2)).toBe(false);
  });

  it('large text: the body scrolls inside the capped sheet, and controls use minHeight, never a fixed height', async () => {
    await renderSheet();
    const sheet = screen.getByTestId('goal-sheet');
    expect(hasHost(sheet as never, 'RCTScrollView')).toBe(true);
    for (const id of ['goal-minus', 'goal-plus', 'goal-choice-5', 'goal-choice-60', 'goal-sheet-close']) {
      const s = style(screen.getByTestId(id));
      if (id !== 'goal-sheet-close') expect(s.height).toBeUndefined();
      expect((s.minHeight ?? s.height) as number).toBeGreaterThanOrEqual(44);
    }
    for (const id of ['goal-minus', 'goal-plus']) expect(style(screen.getByTestId(id)).minHeight).toBeGreaterThanOrEqual(56);
  });

  it('in Chinese', async () => {
    await renderSheet({ locales: [ZH], goal: 15 });
    expect(screen.getByText('每日目标')).toBeTruthy();
    expect(screen.getByText('分钟')).toBeTruthy();
    expect(valueOf(screen.getByTestId('goal-value-group')).text).toBe('15 分钟');
    expect(screen.getByTestId('goal-plus').props.accessibilityLabel).toBe('增加 5 分钟');
    expect(screen.getByTestId('goal-sheet-close').props.accessibilityLabel).toBe('关闭');
  });
});

describe('Home opens the goal sheet', () => {
  it('tapping the goal card opens it; a change shows on Home straight away; the close button closes it', async () => {
    const { storage } = await renderHome({ position: JOHN3_WEB, progress: { goalMinutes: 15, activeMs: { [TODAY]: min(9) } } });
    expect(screen.queryByTestId('goal-sheet')).toBeNull();
    await fireEvent.press(screen.getByTestId('home-goal'));
    expect(await screen.findByTestId('goal-sheet')).toBeTruthy();
    await fireEvent.press(screen.getByTestId('goal-plus'));
    expect(goal(storage)).toBe(20);
    expect(screen.getByTestId('home-goal').props.accessibilityLabel).toBe('Today’s goal, 9 of 20 minutes, edit');
    await fireEvent.press(screen.getByTestId('goal-sheet-close'));
    expect(screen.queryByTestId('goal-sheet')).toBeNull();
  });
});
