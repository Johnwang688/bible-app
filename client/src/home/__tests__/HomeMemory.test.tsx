// Home's Memory card and the one-row Surprise me (GAPS, design home-memory-card.html variant B, John 2026-11-02).
import { fireEvent, screen, within } from '@testing-library/react-native';
import { StyleSheet } from 'react-native';

import { ZH } from '../../reader/__tests__/readerHarness';
import { memoryLessonKey, memoryProgressKey } from '../../storage/memoryKeys';
import { createStorage, memoryBackend, type Storage } from '../../storage/storage';
import { renderHome } from './homeHarness';

const JOHN3_WEB = { bookNumber: 43, chapter: 3, translation: 'WEB' } as const;
/** The harness's "now" is 4 Nov 2026. */
const TODAY = '2026-11-04';
const AT = '2026-11-04T08:00:00.000Z';

const textOf = (el: { props: { children?: unknown } }): string => {
  const c = el.props.children;
  return Array.isArray(c) ? c.join('') : String(c);
};
const style = (el: { props: { style?: unknown } }) => StyleSheet.flatten(el.props.style as never) ?? {};

/** Today's lesson: 2 Corinthians 5:17 in three steps, then a review of Galatians 2:20; the first `done` ticked. */
function seedLesson(storage: Storage, done: number) {
  const steps = [
    { verseId: '2-corinthians-5-17', stage: 'chunk-order' as const },
    { verseId: '2-corinthians-5-17', stage: 'fill-blank' as const },
    { verseId: '2-corinthians-5-17', stage: 'full-recall' as const },
    { verseId: 'galatians-2-20', stage: 'full-recall' as const },
  ].map((s, i) => ({ ...s, completedAt: i < done ? AT : null }));
  storage.set(memoryLessonKey, { date: TODAY, steps, completedAt: done >= steps.length ? AT : null });
}

function seeded(done: number) {
  const storage = createStorage(memoryBackend());
  seedLesson(storage, done);
  return storage;
}

describe('Home: the Memory card', () => {
  it('sits between the verse of the day and Surprise me', async () => {
    await renderHome({ position: JOHN3_WEB, storage: seeded(0) });
    const order = ['home-goal', 'home-continue', 'home-votd', 'home-memory', 'home-surprise'];
    const tree = JSON.stringify(screen.toJSON());
    const at = order.map((id) => tree.indexOf(`"testID":"${id}"`));
    expect(at.every((i) => i >= 0)).toBe(true);
    expect([...at].sort((x, y) => x - y)).toEqual(at);
  });

  it('a new lesson: Start, step 1, and one control named for the verse that opens the lesson', async () => {
    const { go } = await renderHome({ position: JOHN3_WEB, storage: seeded(0) });
    const card = screen.getByTestId('home-memory');
    expect(textOf(screen.getByTestId('home-memory-caps'))).toBe('Memory · 0 of 60 learned');
    expect(textOf(screen.getByTestId('home-memory-ref'))).toBe('2 Corinthians 5:17');
    expect(textOf(screen.getByTestId('home-memory-sub'))).toBe('Step 1 of 4');
    expect(within(screen.getByTestId('home-memory-action', { includeHiddenElements: true })).getByText('Start', { includeHiddenElements: true })).toBeTruthy();
    expect(card.props.accessibilityRole).toBe('button');
    expect(card.props.accessibilityLabel).toBe('Start Memory lesson, 2 Corinthians 5:17');
    await fireEvent.press(card);
    expect(go).toHaveBeenCalledWith(expect.stringContaining('2-corinthians-5-17'));
  });

  it('part-way: Continue, the next step’s verse and number', async () => {
    const { go } = await renderHome({ position: JOHN3_WEB, storage: seeded(3) });
    expect(textOf(screen.getByTestId('home-memory-ref'))).toBe('Galatians 2:20');
    expect(textOf(screen.getByTestId('home-memory-sub'))).toBe('Step 4 of 4');
    expect(within(screen.getByTestId('home-memory-action', { includeHiddenElements: true })).getByText('Continue', { includeHiddenElements: true })).toBeTruthy();
    expect(screen.getByTestId('home-memory').props.accessibilityLabel).toBe('Continue Memory lesson, Galatians 2:20');
    await fireEvent.press(screen.getByTestId('home-memory'));
    expect(go).toHaveBeenCalledWith(expect.stringContaining('galatians-2-20'));
  });

  it('done for today: Week, in the secondary style, opens the week', async () => {
    const { go } = await renderHome({ position: JOHN3_WEB, storage: seeded(4) });
    expect(textOf(screen.getByTestId('home-memory-ref'))).toBe('2 Corinthians 5:17');
    expect(textOf(screen.getByTestId('home-memory-sub'))).toBe('Done for today');
    const action = screen.getByTestId('home-memory-action', { includeHiddenElements: true });
    expect(within(action).getByText('Week', { includeHiddenElements: true })).toBeTruthy();
    expect(screen.getByTestId('home-memory').props.accessibilityLabel).toBe('See the week');
    await fireEvent.press(screen.getByTestId('home-memory'));
    expect(go).toHaveBeenCalledWith('/study/memory/week');
  });

  it('the Start button is the accent; Week is not', async () => {
    const first = await renderHome({ position: JOHN3_WEB, storage: seeded(0) });
    const start = style(screen.getByTestId('home-memory-action', { includeHiddenElements: true })).backgroundColor;
    await first.ui.unmount();
    await renderHome({ position: JOHN3_WEB, storage: seeded(4) });
    const week = style(screen.getByTestId('home-memory-action', { includeHiddenElements: true })).backgroundColor;
    expect(start).toBeDefined();
    expect(week).not.toBe(start);
  });

  it('the inner button is hidden from screen readers, and the card is at least 48 pt high', async () => {
    await renderHome({ position: JOHN3_WEB, storage: seeded(0) });
    const action = screen.getByTestId('home-memory-action', { includeHiddenElements: true });
    expect(action.props.accessible).toBe(false);
    expect(action.props.importantForAccessibility).toBe('no-hide-descendants');
    expect(style(screen.getByTestId('home-memory')).minHeight).toBeGreaterThanOrEqual(48);
  });

  it('keeps each line to one line', async () => {
    await renderHome({ position: JOHN3_WEB, storage: seeded(0) });
    for (const id of ['home-memory-caps', 'home-memory-ref', 'home-memory-sub']) {
      expect(screen.getByTestId(id).props.numberOfLines).toBe(1);
    }
  });

  it('counts the verses learned', async () => {
    const storage = seeded(0);
    const row = { successes: 3, failures: 0, masteryScore: 80, nextDueAt: null, lastReviewedAt: null, lapsedAt: null };
    storage.set(memoryProgressKey, {
      'romans-12-1': { ...row, stage: 'review' },
      'galatians-2-20': { ...row, stage: 'review' },
      '2-corinthians-5-17': { ...row, stage: 'fill_blank' },
    });
    await renderHome({ position: JOHN3_WEB, storage });
    expect(textOf(screen.getByTestId('home-memory-caps'))).toBe('Memory · 2 of 60 learned');
  });

  it('with no lesson stored yet, Home opens today’s, as Memory’s home does', async () => {
    const { storage } = await renderHome({ position: JOHN3_WEB });
    expect(storage.get(memoryLessonKey)?.date).toBe(TODAY);
    expect(textOf(screen.getByTestId('home-memory-sub'))).toMatch(/^Step 1 of \d+$/);
    expect(screen.getByTestId('home-memory').props.accessibilityLabel).toMatch(/^Start Memory lesson, .+/);
  });

  it('in Chinese: the Chinese reference and strings, with no letter-spacing on the caps line', async () => {
    await renderHome({ position: JOHN3_WEB, storage: seeded(1), locales: [ZH] });
    expect(textOf(screen.getByTestId('home-memory-caps'))).toBe('背经 · 已背熟 0 / 60');
    expect(style(screen.getByTestId('home-memory-caps')).letterSpacing).toBe(0);
    expect(textOf(screen.getByTestId('home-memory-ref'))).toBe('哥林多后书 5:17');
    expect(textOf(screen.getByTestId('home-memory-sub'))).toBe('第 2 步，共 4 步');
    expect(screen.getByTestId('home-memory').props.accessibilityLabel).toBe('继续背经课程，哥林多后书 5:17');
  });
});

describe('Home: Surprise me in one row, and the other card touches', () => {
  it('Surprise me: the title and the count, and a round secondary shuffle button named for what it does', async () => {
    await renderHome({ position: JOHN3_WEB });
    const go = screen.getByTestId('home-surprise-go');
    expect(go.props.accessibilityLabel).toBe('Take me somewhere new');
    const s = style(go);
    expect(s.minWidth).toBeGreaterThanOrEqual(48);
    expect(s.minHeight).toBeGreaterThanOrEqual(48);
    expect(s.boxShadow).toBeUndefined();
    expect(screen.queryByText(/A random chapter/)).toBeNull();
  });

  it('Continue reading is one control named “Continue reading John 3”; its arrow is hidden from screen readers', async () => {
    await renderHome({ position: JOHN3_WEB });
    expect(screen.getByTestId('home-continue').props.accessibilityLabel).toBe('Continue reading John 3');
    expect(screen.getByTestId('home-continue-arrow', { includeHiddenElements: true }).props.accessible).toBe(false);
  });

  it('the streak chip keeps its words on one line', async () => {
    await renderHome({ position: JOHN3_WEB });
    expect(within(screen.getByTestId('home-streak')).getByText('Start your streak').props.numberOfLines).toBe(1);
  });
});
