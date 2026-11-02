// Acceptance (orchestrator-owned): the Home tab as signed off (Home.dc.html): greeting and streak, today's goal,
// continue reading, the verse of the day and Surprise me. Plan: "Home: the daily reason to open the app".
import { act, fireEvent, screen, waitFor, within } from '@testing-library/react-native';
import * as Clipboard from 'expo-clipboard';
import { Share, StyleSheet } from 'react-native';

import { ZH } from '../../reader/__tests__/readerHarness';
import { readerTargets } from '../../reader/target';
import { CHAPTER_COUNTS, chapterKey, readerPositionKey, readingProgressKey, recentPassagesKey } from '../../storage/keys';
import { renderHome } from './homeHarness';

jest.mock('expo-clipboard', () => ({ setStringAsync: jest.fn(async () => true) }));

const JOHN3_WEB = { bookNumber: 43, chapter: 3, translation: 'WEB' } as const;
const PS23_WEB = { bookNumber: 19, chapter: 23, translation: 'WEB' } as const;
const TODAY = '2026-11-04';
const min = (n: number) => n * 60_000;
const style = (el: { props: { style?: unknown } }) => StyleSheet.flatten(el.props.style as never) ?? {};
const textOf = (el: { props: { children?: unknown } }): string => {
  const c = el.props.children;
  if (typeof c === 'string' || typeof c === 'number') return String(c);
  if (Array.isArray(c)) return c.map((x) => (typeof x === 'string' || typeof x === 'number' ? String(x) : x?.props ? textOf(x) : '')).join('');
  return c && typeof c === 'object' && 'props' in c ? textOf(c as never) : '';
};
/** Every chapter key except the ones given. */
const allBut = (...keep: string[]) => {
  const out: Record<string, string> = {};
  CHAPTER_COUNTS.forEach((n, i) => {
    for (let c = 1; c <= n; c++) if (!keep.includes(chapterKey(i + 1, c))) out[chapterKey(i + 1, c)] = '2026-10-01T00:00:00.000Z';
  });
  return out;
};
const script = (...values: number[]) => () => {
  if (values.length === 0) throw new Error('drew too many random numbers');
  return values.shift()!;
};

beforeEach(() => readerTargets.clear());

describe('Home: greeting and streak', () => {
  it('shows the date, a greeting for the time of day and the streak', async () => {
    await renderHome({
      position: JOHN3_WEB,
      progress: { goalMetDays: ['2026-11-02', '2026-11-03'] },
    });
    expect(screen.getByTestId('screen-home')).toBeTruthy();
    expect(textOf(screen.getByTestId('home-date'))).toBe('Wednesday, November 4');
    const greeting = screen.getByTestId('home-greeting');
    expect(greeting.props.accessibilityRole).toBe('header');
    expect(textOf(greeting)).toBe('Good evening');
    expect(screen.getByTestId('home-streak').props.accessibilityLabel).toBe('2-day streak');
    expect(textOf(screen.getByTestId('home-streak-count'))).toBe('2');
    expect(within(screen.getByTestId('home-streak')).getByText('day streak')).toBeTruthy();
  });

  it('greets by the local hour', async () => {
    await renderHome({ position: JOHN3_WEB, now: new Date(2026, 10, 4, 8, 30) });
    expect(textOf(screen.getByTestId('home-greeting'))).toBe('Good morning');
  });
});

describe('Home: today’s goal', () => {
  it('shows minutes read today against the goal, as a progress bar, and the card is a button', async () => {
    await renderHome({ position: JOHN3_WEB, progress: { goalMinutes: 15, activeMs: { [TODAY]: min(9) + 30_000 } } });
    const card = screen.getByTestId('home-goal');
    expect(card.props.accessibilityRole).toBe('button');
    expect(card.props.accessibilityLabel).toBe('Today’s goal: 9 of 15 min');
    expect(card.props.accessibilityHint).toBe('Change your daily goal');
    expect(within(card).getByText('Today')).toBeTruthy();
    expect(textOf(screen.getByTestId('home-goal-done'))).toBe('9');
    const bar = screen.getByTestId('home-goal-bar');
    expect(bar.props.accessibilityRole).toBe('progressbar');
    expect(bar.props.accessibilityValue).toEqual({ min: 0, max: 15, now: 9 });
  });

  it('updates as soon as the reader records more time', async () => {
    const { storage } = await renderHome({ position: JOHN3_WEB, progress: { activeMs: { [TODAY]: min(2) } } });
    expect(textOf(screen.getByTestId('home-goal-done'))).toBe('2');
    await act(async () => {
      const p = storage.get(readingProgressKey);
      storage.set(readingProgressKey, { ...p, activeMs: { [TODAY]: min(6) } });
    });
    expect(textOf(screen.getByTestId('home-goal-done'))).toBe('6');
    expect(screen.getByTestId('home-goal').props.accessibilityLabel).toBe('Today’s goal: 6 of 10 min');
  });
});

describe('Home: continue reading', () => {
  it('names the last chapter and its translation, and opens the Bible tab there', async () => {
    const { storage, navigate } = await renderHome({ position: JOHN3_WEB });
    const card = screen.getByTestId('home-continue');
    expect(card.props.accessibilityRole).toBe('button');
    expect(card.props.accessibilityLabel).toBe('Continue reading John 3');
    expect(within(card).getByText('Continue reading')).toBeTruthy();
    expect(textOf(await screen.findByTestId('home-continue-ref'))).toBe('John 3 · WEB');
    expect(textOf(screen.getByTestId('home-continue-sub'))).toBe('World English Bible');
    await fireEvent.press(card);
    expect(navigate).toHaveBeenCalledTimes(1);
    expect(storage.get(readerPositionKey)).toEqual(JOHN3_WEB);
    // Not a jump to verses: nothing is selected in the reader.
    expect(readerTargets.get()).toBeNull();
  });

  it('follows a chapter change made in the reader', async () => {
    const { storage } = await renderHome({ position: JOHN3_WEB });
    await screen.findByTestId('home-continue-ref');
    await act(async () => storage.set(readerPositionKey, PS23_WEB));
    expect(textOf(screen.getByTestId('home-continue-ref'))).toBe('Psalms 23 · WEB');
  });
});

describe('Home: verse of the day', () => {
  it('shows today’s verse in the reader’s translation, with its reference (John 3:16 on 4 Nov 2026)', async () => {
    await renderHome({ position: JOHN3_WEB });
    const card = screen.getByTestId('home-votd');
    expect(within(card).getByText('Verse of the day')).toBeTruthy();
    const text = await screen.findByTestId('home-votd-text');
    expect(textOf(text)).toMatch(/^For God so loved the world/);
    expect(textOf(screen.getByTestId('home-votd-ref'))).toBe('John 3:16');
  });

  it('is the same verse all day, and another one tomorrow', async () => {
    await renderHome({ position: JOHN3_WEB, now: new Date(2026, 10, 9, 7, 0) });
    // 9 Nov 2026 is Psalm 23:1 (index 6 of the list); the fake API synthesises Psalms 23 in WEB.
    expect(textOf(await screen.findByTestId('home-votd-text'))).toBe('Psalms 23:1 WEB');
    expect(textOf(screen.getByTestId('home-votd-ref'))).toBe('Psalms 23:1');
  });

  it('tapping it opens the verse in context: the chapter, in the same translation, with the verse selected', async () => {
    const { storage, navigate } = await renderHome({ position: PS23_WEB });
    await screen.findByTestId('home-votd-text');
    const open = screen.getByTestId('home-votd-open');
    expect(open.props.accessibilityRole).toBe('button');
    expect(open.props.accessibilityLabel).toBe('Verse of the day, John 3:16');
    expect(open.props.accessibilityHint).toBe('Opens it in the Bible');
    await fireEvent.press(open);
    expect(readerTargets.get()).toEqual({ bookNumber: 43, chapter: 3, start: 16, end: 16 });
    expect(storage.get(readerPositionKey)).toEqual(JOHN3_WEB);
    expect(navigate).toHaveBeenCalledTimes(1);
  });

  it('shares the verse with its reference and translation', async () => {
    const share = jest.spyOn(Share, 'share').mockResolvedValue({ action: 'sharedAction' } as never);
    await renderHome({ position: JOHN3_WEB });
    await screen.findByTestId('home-votd-text');
    const button = screen.getByTestId('home-votd-share');
    expect(button.props.accessibilityLabel).toBe('Share verse');
    expect(style(button).width).toBeGreaterThanOrEqual(44);
    expect(style(button).height).toBeGreaterThanOrEqual(44);
    await fireEvent.press(button);
    expect(share).toHaveBeenCalledWith(
      expect.objectContaining({ message: expect.stringMatching(/^For God so loved the world[\s\S]*\n— John 3:16 \(WEB\)$/) }),
    );
    expect(Clipboard.setStringAsync).not.toHaveBeenCalled();
    share.mockRestore();
  });

  it('loads the chapter once', async () => {
    const { calls } = await renderHome({ position: JOHN3_WEB });
    await screen.findByTestId('home-votd-text');
    expect(calls.filter((c) => c === 'John 3 WEB')).toHaveLength(1);
  });
});

describe('Home: Surprise me', () => {
  it('shows the chapters explored', async () => {
    await renderHome({ position: JOHN3_WEB, progress: { chaptersRead: { '1:1': 'x', '1:2': 'x', '43:3': 'x' } } });
    const card = screen.getByTestId('home-surprise');
    expect(within(card).getByText('Surprise me')).toBeTruthy();
    const explored = screen.getByTestId('home-explored');
    expect(textOf(explored)).toBe('3 of 1,189 explored');
    expect(explored.props.accessibilityLabel).toBe('3 of 1,189 chapters explored');
    expect(textOf(screen.getByTestId('home-surprise-go'))).toBe('Take me somewhere new');
  });

  it('opens an unread chapter in the reader’s translation, at the top (no verse selected)', async () => {
    readerTargets.set({ bookNumber: 1, chapter: 5, start: 2, end: 2 }); // a stale target from earlier
    const { storage, navigate } = await renderHome({
      position: PS23_WEB,
      progress: { chaptersRead: allBut('43:3') },
      random: script(0.5, 0.0, 0.0),
    });
    expect(textOf(screen.getByTestId('home-explored'))).toBe('1,188 of 1,189 explored');
    await waitFor(() => expect(screen.getByTestId('home-surprise-go').props.accessibilityState?.disabled).toBeFalsy());
    await fireEvent.press(screen.getByTestId('home-surprise-go'));
    expect(storage.get(readerPositionKey)).toEqual(JOHN3_WEB);
    expect(storage.get(recentPassagesKey)[0]).toEqual(JOHN3_WEB);
    expect(readerTargets.get()).toBeNull();
    expect(navigate).toHaveBeenCalledTimes(1);
  });

  it('never picks the chapter the reader is on', async () => {
    const { storage } = await renderHome({
      position: JOHN3_WEB,
      progress: { chaptersRead: allBut('43:3', '43:4') },
      random: script(0.5, 0.0, 0.0),
    });
    await waitFor(() => expect(screen.getByTestId('home-surprise-go').props.accessibilityState?.disabled).toBeFalsy());
    await fireEvent.press(screen.getByTestId('home-surprise-go'));
    expect(storage.get(readerPositionKey)).toEqual({ bookNumber: 43, chapter: 4, translation: 'WEB' });
  });

  it('is disabled until the book list has loaded, and pressing it then does nothing', async () => {
    const { storage, navigate } = await renderHome({ position: JOHN3_WEB, booksPending: true, random: () => 0.5 });
    const go = screen.getByTestId('home-surprise-go');
    expect(go.props.accessibilityState).toMatchObject({ disabled: true });
    await fireEvent.press(go);
    expect(navigate).not.toHaveBeenCalled();
    expect(storage.get(readerPositionKey)).toEqual(JOHN3_WEB);
  });

  it('the button is at least 44 pt high', async () => {
    await renderHome({ position: JOHN3_WEB });
    expect(style(screen.getByTestId('home-surprise-go')).height ?? style(screen.getByTestId('home-surprise-go')).minHeight).toBeGreaterThanOrEqual(44);
  });
});

describe('Home in Chinese', () => {
  it('Chinese strings, the interface-language book name, and the verse in the reader’s Chinese translation', async () => {
    await renderHome({ locales: [ZH], position: { bookNumber: 43, chapter: 3, translation: 'CUV-SIMP' }, progress: { chaptersRead: { '1:1': 'x' } } });
    expect(textOf(screen.getByTestId('home-greeting'))).toBe('晚上好');
    expect(screen.getByText('继续阅读')).toBeTruthy();
    expect(textOf(await screen.findByTestId('home-continue-ref'))).toBe('约翰福音 3 · 和合本');
    expect(textOf(screen.getByTestId('home-continue-sub'))).toBe('和合本（简体）');
    expect(screen.getByText('每日经文')).toBeTruthy();
    expect(textOf(await screen.findByTestId('home-votd-text'))).toMatch(/^神爱世人/);
    expect(textOf(screen.getByTestId('home-votd-ref'))).toBe('约翰福音 3:16');
    expect(textOf(screen.getByTestId('home-explored'))).toBe('已探索 1 / 1,189 章');
    expect(screen.getByTestId('home-goal').props.accessibilityLabel).toBe('今日目标：0 / 10 分钟');
    expect(screen.getByTestId('home-streak').props.accessibilityLabel).toBe('连续阅读 0 天');
  });
});
