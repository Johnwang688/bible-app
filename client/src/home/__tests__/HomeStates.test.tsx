// Acceptance (orchestrator-owned): Home's empty and error states, as approved in design/proposed/r4-home-empty.html,
// with the review fixes in r4/GO-AHEAD.md (the goal card's cue, no 0 flame, the verse of the day's skeleton,
// retrying state, steady height, live error and cached verse, large-text wrapping, the outlined empty track).
import { act, fireEvent, screen, within } from '@testing-library/react-native';
import { StyleSheet } from 'react-native';

import { ZH } from '../../reader/__tests__/readerHarness';
import { readerPositionKey, readingProgressKey } from '../../storage/keys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { VOTD_MIN_HEIGHT } from '../HomeCards';
import { lastVerseKey } from '../homeKeys';
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
const politeLive = (el: El) => el.props.accessibilityLiveRegion === 'polite' || el.props['aria-live'] === 'polite';
const deferred = () => {
  let release!: () => void;
  const promise = new Promise<void>((r) => (release = r));
  return { promise, release };
};

describe('Home: the goal card', () => {
  it('is a button of at least 44 pt with an edit cue, labelled with today’s minutes and “edit”', async () => {
    await renderHome({ position: JOHN3_WEB, progress: { goalMinutes: 15, activeMs: { [TODAY]: min(9) } } });
    const card = screen.getByTestId('home-goal');
    expect(card.props.accessibilityRole).toBe('button');
    expect(card.props.accessibilityLabel).toBe('Today’s goal, 9 of 15 minutes, edit');
    expect(style(card).minHeight).toBeGreaterThanOrEqual(44);
    expect(within(card).getByTestId('home-goal-cue')).toBeTruthy();
    const bar = screen.getByTestId('home-goal-bar');
    expect(bar.props.accessibilityRole ?? bar.props.role).toBe('progressbar');
    expect(bar.props.accessibilityValue).toEqual({ min: 0, max: 15, now: 9 });
  });

  it('the progress track is outlined at 0%, and not once reading starts', async () => {
    const { storage } = await renderHome({ position: JOHN3_WEB });
    expect(style(screen.getByTestId('home-goal-bar')).borderWidth).toBeGreaterThanOrEqual(1);
    await act(async () => storage.set(readingProgressKey, { ...storage.get(readingProgressKey), activeMs: { [TODAY]: min(3) } }));
    expect(style(screen.getByTestId('home-goal-bar')).borderWidth ?? 0).toBe(0);
  });

  it('in Chinese', async () => {
    await renderHome({ position: JOHN3_WEB, locales: [ZH] });
    expect(screen.getByTestId('home-goal').props.accessibilityLabel).toBe('今日目标，0 / 10 分钟，编辑');
  });
});

describe('Home: the header with large text', () => {
  it('the streak chip wraps below the greeting instead of squeezing it', async () => {
    await renderHome({ position: JOHN3_WEB });
    expect(style(screen.getByTestId('home-header')).flexWrap).toBe('wrap');
    expect(style(screen.getByTestId('home-streak')).height).toBeUndefined();
  });
});

describe('Home: a brand-new reader', () => {
  it('no 0 flame: “Start your streak”; zeros elsewhere; “Start reading” with John 1 in the starting translation (John, 2026-11-02)', async () => {
    const { storage, navigate } = await renderHome();
    const chip = screen.getByTestId('home-streak');
    expect(screen.queryByTestId('home-streak-count')).toBeNull();
    expect(within(chip).getByText('Start your streak')).toBeTruthy();
    expect(chip.props.accessibilityLabel).toBe('Start your streak');
    expect(screen.getByTestId('home-goal').props.accessibilityLabel).toBe('Today’s goal, 0 of 10 minutes, edit');
    expect(textOf(screen.getByTestId('home-explored'))).toBe('0 of 1,189 explored');
    expect(screen.getByText('A random chapter to get you started.')).toBeTruthy();
    const card = screen.getByTestId('home-continue');
    expect(within(card).getByText('Start reading')).toBeTruthy();
    expect(card.props.accessibilityLabel).toBe('Start reading John 1');
    expect(textOf(await screen.findByTestId('home-continue-ref'))).toBe('John 1 · BSB');
    expect(textOf(screen.getByTestId('home-continue-sub'))).toBe('Berean Standard Bible');
    await fireEvent.press(card);
    expect(navigate).toHaveBeenCalledTimes(1);
    // A new reader starts at John 1: pressing sets that position, so the Bible tab opens there.
    expect(storage.get(readerPositionKey)).toEqual({ bookNumber: 43, chapter: 1, translation: 'BSB' });
  });

  it('a reader with a streak sees the count, and the usual Surprise me copy once they have explored', async () => {
    await renderHome({
      position: JOHN3_WEB,
      progress: { goalMetDays: ['2026-11-03'], chaptersRead: { '43:3': '2026-11-03T09:00:00.000Z' } },
    });
    expect(textOf(screen.getByTestId('home-streak-count'))).toBe('1');
    expect(screen.queryByText('Start your streak')).toBeNull();
    expect(screen.getByText('A random chapter, mostly from parts of the Bible you haven’t read yet.')).toBeTruthy();
    expect(within(screen.getByTestId('home-continue')).getByText('Continue reading')).toBeTruthy();
  });

  it('a new Chinese reader starts in CUV-SIMP', async () => {
    await renderHome({ locales: [ZH] });
    expect(screen.getByText('开始阅读')).toBeTruthy();
    expect(screen.getByText('开始连续阅读')).toBeTruthy();
    expect(textOf(await screen.findByTestId('home-continue-ref'))).toBe('约翰福音 1 · 和合本');
  });
});

describe('Home: the verse of the day while it loads', () => {
  it('a skeleton, labelled Loading…, in a card of the same minimum height as the loaded one', async () => {
    await renderHome({ position: JOHN3_WEB, booksPending: true });
    const skeleton = screen.getByTestId('home-votd-skeleton');
    expect(skeleton.props.accessibilityLabel).toBe('Loading…');
    expect(within(screen.getByTestId('home-votd')).queryByText('Loading…')).toBeNull();
    expect(VOTD_MIN_HEIGHT).toBeGreaterThanOrEqual(150);
    expect(style(screen.getByTestId('home-votd')).minHeight).toBe(VOTD_MIN_HEIGHT);
    expect(screen.queryByTestId('home-votd-text')).toBeNull();
  });

  it('the loaded card keeps that minimum height', async () => {
    await renderHome({ position: JOHN3_WEB });
    await screen.findByTestId('home-votd-text');
    expect(style(screen.getByTestId('home-votd')).minHeight).toBe(VOTD_MIN_HEIGHT);
    expect(screen.queryByTestId('home-votd-skeleton')).toBeNull();
  });
});

describe('Home: the verse of the day cannot load', () => {
  it('says so politely, with Try again in place of the text, reference and share; Try again loads it', async () => {
    const fail = new Set(['John 3 WEB']);
    const { calls } = await renderHome({ position: JOHN3_WEB, fail });
    const error = await screen.findByTestId('home-votd-error');
    expect(textOf(error)).toBe('Couldn’t load today’s verse.');
    expect(politeLive(error)).toBe(true);
    expect(style(screen.getByTestId('home-votd')).minHeight).toBe(VOTD_MIN_HEIGHT);
    expect(screen.queryByTestId('home-votd-text')).toBeNull();
    expect(screen.queryByTestId('home-votd-share')).toBeNull();
    expect(screen.queryByTestId('home-votd-open')).toBeNull();
    expect(within(screen.getByTestId('home-votd')).getByText('Verse of the day')).toBeTruthy();
    const retry = screen.getByTestId('home-votd-retry');
    expect(textOf(retry)).toBe('Try again');
    expect(style(retry).height).toBeUndefined();
    expect(style(retry).minHeight).toBeGreaterThanOrEqual(44);
    fail.clear();
    await fireEvent.press(retry);
    expect(textOf(await screen.findByTestId('home-votd-text'))).toMatch(/^For God so loved the world/);
    expect(calls.filter((c) => c === 'John 3 WEB')).toHaveLength(2);
  });

  it('while it tries again, the button says so and is disabled and busy; a second failure shows the message again', async () => {
    const fail = new Set(['John 3 WEB']);
    const gate: { current: Promise<void> | null } = { current: null };
    const { calls } = await renderHome({ position: JOHN3_WEB, fail, chapterGate: gate });
    await screen.findByTestId('home-votd-error');
    const held = deferred();
    gate.current = held.promise;
    await fireEvent.press(screen.getByTestId('home-votd-retry'));
    const retry = screen.getByTestId('home-votd-retry');
    expect(textOf(retry)).toBe('Trying again…');
    expect(retry.props.accessibilityState).toMatchObject({ disabled: true, busy: true });
    await fireEvent.press(retry);
    expect(calls.filter((c) => c === 'John 3 WEB')).toHaveLength(1); // still the first; the retry is held at the gate
    await act(async () => {
      gate.current = null;
      held.release();
    });
    expect(textOf(await screen.findByTestId('home-votd-retry'))).toBe('Try again');
    expect(screen.getByTestId('home-votd-retry').props.accessibilityState?.disabled).toBeFalsy();
    expect(calls.filter((c) => c === 'John 3 WEB')).toHaveLength(2);
  });

  it('a translation without that verse shows the same message, not an empty card', async () => {
    // 3 Nov 2026 is Psalm 119:105; the fake API's synthesised Psalms 119 has only verses 1–3.
    await renderHome({ position: JOHN3_WEB, now: new Date(2026, 10, 3, 9, 0) });
    expect(await screen.findByTestId('home-votd-error')).toBeTruthy();
    expect(screen.queryByTestId('home-votd-share')).toBeNull();
  });
});

describe('Home: the last verse of the day is kept for when it can’t load later that day', () => {
  it('a verse that loads is remembered for its day and translation', async () => {
    const { storage } = await renderHome({ position: JOHN3_WEB });
    await screen.findByTestId('home-votd-text');
    const kept = storage.get(lastVerseKey);
    expect(kept).toMatchObject({ day: TODAY, translation: 'WEB', bookNumber: 43, chapter: 3, verse: 16 });
    expect(kept?.text).toMatch(/^For God so loved the world/);
  });

  it('today’s kept verse shows when the chapter fails, as a normal card (open and share work)', async () => {
    const storage = createStorage(memoryBackend());
    storage.set(lastVerseKey, { day: TODAY, translation: 'WEB', bookNumber: 43, chapter: 3, verse: 16, text: 'Kept: God so loved the world.' });
    await renderHome({ storage, position: JOHN3_WEB, fail: new Set(['John 3 WEB']) });
    expect(textOf(await screen.findByTestId('home-votd-text'))).toBe('Kept: God so loved the world.');
    expect(textOf(screen.getByTestId('home-votd-ref'))).toBe('John 3:16');
    expect(screen.getByTestId('home-votd-share')).toBeTruthy();
    expect(screen.queryByTestId('home-votd-error')).toBeNull();
  });

  it('a kept verse from another day, or in another translation, is not shown as today’s', async () => {
    const storage = createStorage(memoryBackend());
    storage.set(lastVerseKey, { day: '2026-11-03', translation: 'WEB', bookNumber: 19, chapter: 119, verse: 105, text: 'Yesterday.' });
    await renderHome({ storage, position: JOHN3_WEB, fail: new Set(['John 3 WEB']) });
    expect(await screen.findByTestId('home-votd-error')).toBeTruthy();
    expect(screen.queryByText('Yesterday.')).toBeNull();
  });

  it('a kept verse in another translation is not shown', async () => {
    const storage = createStorage(memoryBackend());
    storage.set(lastVerseKey, { day: TODAY, translation: 'ASV', bookNumber: 43, chapter: 3, verse: 16, text: 'ASV text.' });
    await renderHome({ storage, position: JOHN3_WEB, fail: new Set(['John 3 WEB']) });
    expect(await screen.findByTestId('home-votd-error')).toBeTruthy();
    expect(screen.queryByText('ASV text.')).toBeNull();
  });

  it('a single psalm is cited as “Psalm”, not “Psalms”', async () => {
    const storage = createStorage(memoryBackend());
    const day = '2026-11-03';
    storage.set(lastVerseKey, { day, translation: 'WEB', bookNumber: 19, chapter: 119, verse: 105, text: 'Your word is a lamp to my feet.' });
    await renderHome({ storage, position: JOHN3_WEB, now: new Date(2026, 10, 3, 9, 0) });
    expect(textOf(await screen.findByTestId('home-votd-text'))).toBe('Your word is a lamp to my feet.');
    expect(textOf(screen.getByTestId('home-votd-ref'))).toBe('Psalm 119:105');
    expect(screen.getByTestId('home-votd-open').props.accessibilityLabel).toBe('Verse of the day, Psalm 119:105');
  });
});
