// Acceptance (orchestrator-owned): the daily-goal sheet and Home's empty and error states, as proposed in
// design/proposed/r4-goal-sheet.html and r4-home-empty.html.
import { QueryClient } from '@tanstack/react-query';
import { act, fireEvent, render, screen, within } from '@testing-library/react-native';
import { StyleSheet } from 'react-native';
import { SafeAreaProvider } from 'react-native-safe-area-context';

import { ApiProvider } from '../../api/ApiProvider';
import { I18nProvider } from '../../i18n/I18nProvider';
import { EN, fakeApi, ZH } from '../../reader/__tests__/readerHarness';
import { readerPositionKey, readingProgressKey } from '../../storage/keys';
import { createStorage, memoryBackend, type Storage } from '../../storage/storage';
import { ThemeProvider } from '../../theme/ThemeProvider';
import { GoalSheet } from '../GoalSheet';
import { renderHome } from './homeHarness';

jest.mock('expo-clipboard', () => ({ setStringAsync: jest.fn(async () => true) }));

const JOHN3_WEB = { bookNumber: 43, chapter: 3, translation: 'WEB' } as const;
const TODAY = '2026-11-04';
const min = (n: number) => n * 60_000;
const style = (el: { props: { style?: unknown } }) => StyleSheet.flatten(el.props.style as never) ?? {};
const textOf = (el: { props: { children?: unknown } }): string => {
  const c = el.props.children;
  if (typeof c === 'string' || typeof c === 'number') return String(c);
  if (Array.isArray(c)) return c.map((x) => (typeof x === 'string' || typeof x === 'number' ? String(x) : x?.props ? textOf(x) : '')).join('');
  return c && typeof c === 'object' && 'props' in c ? textOf(c as never) : '';
};

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
  it('shows the title, the hint and the current goal', async () => {
    await renderSheet({ goal: 15 });
    const sheet = screen.getByTestId('goal-sheet');
    expect(within(sheet).getByText('Daily goal')).toBeTruthy();
    expect(within(sheet).getByText('Minutes of reading a day. Your streak counts the days you reach it.')).toBeTruthy();
    expect(textOf(screen.getByTestId('goal-value'))).toBe('15');
    expect(screen.getByTestId('goal-value-group').props.accessibilityLabel).toBe('15 min');
  });

  it('minus and plus move the goal by 5 minutes and save at once, stopping at 5 and 120', async () => {
    const { storage } = await renderSheet({ goal: 10 });
    await fireEvent.press(screen.getByTestId('goal-plus'));
    expect(goal(storage)).toBe(15);
    expect(textOf(screen.getByTestId('goal-value'))).toBe('15');
    await fireEvent.press(screen.getByTestId('goal-minus'));
    await fireEvent.press(screen.getByTestId('goal-minus'));
    expect(goal(storage)).toBe(5);
    expect(screen.getByTestId('goal-minus').props.accessibilityState).toMatchObject({ disabled: true });
    await fireEvent.press(screen.getByTestId('goal-minus'));
    expect(goal(storage)).toBe(5);
    await act(async () => storage.set(readingProgressKey, { ...storage.get(readingProgressKey), goalMinutes: 120 }));
    expect(screen.getByTestId('goal-plus').props.accessibilityState).toMatchObject({ disabled: true });
    expect(screen.getByTestId('goal-minus').props.accessibilityState?.disabled).toBeFalsy();
    expect(screen.getByTestId('goal-minus').props.accessibilityLabel).toBe('Five minutes less');
    expect(screen.getByTestId('goal-plus').props.accessibilityLabel).toBe('Five minutes more');
  });

  it('the quick picks set the goal, and the chosen one is selected', async () => {
    const { storage } = await renderSheet({ goal: 10 });
    for (const n of [5, 10, 15, 20, 30, 45, 60]) expect(screen.getByTestId(`goal-choice-${n}`)).toBeTruthy();
    expect(screen.getByTestId('goal-choice-10').props.accessibilityState).toMatchObject({ selected: true });
    expect(screen.getByTestId('goal-choice-30').props.accessibilityLabel).toBe('30 minutes a day');
    await fireEvent.press(screen.getByTestId('goal-choice-30'));
    expect(goal(storage)).toBe(30);
    expect(screen.getByTestId('goal-choice-30').props.accessibilityState).toMatchObject({ selected: true });
    expect(screen.getByTestId('goal-choice-10').props.accessibilityState).toMatchObject({ selected: false });
  });

  it('lowering the goal to what was read today counts today as met', async () => {
    const { storage } = await renderSheet({ goal: 20, todayMs: min(12) });
    await fireEvent.press(screen.getByTestId('goal-choice-10'));
    expect(storage.get(readingProgressKey).goalMetDays).toEqual([TODAY]);
  });

  it('Done and the close button both close it', async () => {
    const { onClose } = await renderSheet();
    await fireEvent.press(screen.getByTestId('goal-done'));
    expect(onClose).toHaveBeenCalledTimes(1);
    expect(screen.getByTestId('goal-sheet-close').props.accessibilityLabel).toBe('Close');
    await fireEvent.press(screen.getByTestId('goal-sheet-close'));
    expect(onClose).toHaveBeenCalledTimes(2);
  });

  it('every control is at least 44 pt', async () => {
    await renderSheet();
    for (const id of ['goal-minus', 'goal-plus', 'goal-choice-5', 'goal-choice-60', 'goal-done', 'goal-sheet-close']) {
      const s = style(screen.getByTestId(id));
      expect(s.height ?? s.minHeight).toBeGreaterThanOrEqual(44);
    }
  });

  it('in Chinese', async () => {
    await renderSheet({ locales: [ZH], goal: 15 });
    expect(screen.getByText('每日目标')).toBeTruthy();
    expect(screen.getByTestId('goal-value-group').props.accessibilityLabel).toBe('15 分钟');
    expect(screen.getByTestId('goal-plus').props.accessibilityLabel).toBe('增加 5 分钟');
  });
});

describe('Home opens the goal sheet', () => {
  it('tapping the goal card opens it; a change shows on Home straight away; Done closes it', async () => {
    const { storage } = await renderHome({ position: JOHN3_WEB, progress: { goalMinutes: 15, activeMs: { [TODAY]: min(9) } } });
    expect(screen.queryByTestId('goal-sheet')).toBeNull();
    await fireEvent.press(screen.getByTestId('home-goal'));
    expect(await screen.findByTestId('goal-sheet')).toBeTruthy();
    await fireEvent.press(screen.getByTestId('goal-plus'));
    expect(goal(storage)).toBe(20);
    expect(screen.getByTestId('home-goal').props.accessibilityLabel).toBe('Today’s goal: 9 of 20 min');
    await fireEvent.press(screen.getByTestId('goal-done'));
    expect(screen.queryByTestId('goal-sheet')).toBeNull();
  });
});

describe('Home: a brand-new reader', () => {
  it('zeros everywhere, and “Start reading” with Genesis 1 in the starting translation', async () => {
    const { storage, navigate } = await renderHome();
    expect(textOf(screen.getByTestId('home-streak-count'))).toBe('0');
    expect(screen.getByTestId('home-goal').props.accessibilityLabel).toBe('Today’s goal: 0 of 10 min');
    expect(textOf(screen.getByTestId('home-explored'))).toBe('0 of 1,189 explored');
    const card = screen.getByTestId('home-continue');
    expect(within(card).getByText('Start reading')).toBeTruthy();
    expect(card.props.accessibilityLabel).toBe('Start reading Genesis 1');
    expect(textOf(await screen.findByTestId('home-continue-ref'))).toBe('Genesis 1 · BSB');
    expect(textOf(screen.getByTestId('home-continue-sub'))).toBe('Berean Standard Bible');
    await fireEvent.press(card);
    expect(navigate).toHaveBeenCalledTimes(1);
    expect(storage.get(readerPositionKey)).toBeNull();
  });

  it('a new Chinese reader starts in CUV-SIMP', async () => {
    await renderHome({ locales: [ZH] });
    expect(screen.getByText('开始阅读')).toBeTruthy();
    expect(textOf(await screen.findByTestId('home-continue-ref'))).toBe('创世记 1 · 和合本');
  });
});

describe('Home: the verse of the day cannot load', () => {
  it('says so, with Try again in place of the text, reference and share; Try again loads it', async () => {
    const fail = new Set(['John 3 WEB']);
    const { calls } = await renderHome({ position: JOHN3_WEB, fail });
    expect(await screen.findByTestId('home-votd-error')).toBeTruthy();
    expect(textOf(screen.getByTestId('home-votd-error'))).toBe('Couldn’t load today’s verse.');
    expect(screen.queryByTestId('home-votd-text')).toBeNull();
    expect(screen.queryByTestId('home-votd-share')).toBeNull();
    const retry = screen.getByTestId('home-votd-retry');
    expect(textOf(retry)).toBe('Try again');
    fail.clear();
    await fireEvent.press(retry);
    expect(textOf(await screen.findByTestId('home-votd-text'))).toMatch(/^For God so loved the world/);
    expect(calls.filter((c) => c === 'John 3 WEB')).toHaveLength(2);
  });

  it('a translation without that verse shows the same message, not an empty card', async () => {
    // 3 Nov 2026 is Psalm 119:105; the fake API's synthesised Psalms 119 has only verses 1–3.
    await renderHome({ position: JOHN3_WEB, now: new Date(2026, 10, 3, 9, 0) });
    expect(await screen.findByTestId('home-votd-error')).toBeTruthy();
    expect(screen.queryByTestId('home-votd-share')).toBeNull();
  });
});
