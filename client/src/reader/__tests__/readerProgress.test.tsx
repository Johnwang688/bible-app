// Acceptance (orchestrator-owned): the reader's side of R-3. Reading time and chapter credit, the read
// dots in the picker, and opening a passage "in context" from another tab.
import { act, fireEvent, screen, within } from '@testing-library/react-native';

import { readerPositionKey, readingProgressKey } from '../../storage/keys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { readerTargets } from '../target';
import { renderReader } from './readerHarness';

const JOHN3_WEB = { bookNumber: 43, chapter: 3, translation: 'WEB' as const };

/** A scroll event on the reader: `y` from the top, a viewport of 700 in content of `content`. */
const scrollTo = (y: number, content = 7000) =>
  fireEvent.scroll(screen.getByTestId('reader-scroll'), {
    nativeEvent: {
      contentOffset: { x: 0, y },
      layoutMeasurement: { width: 390, height: 700 },
      contentSize: { width: 390, height: content },
    },
  });

function clock(start = new Date(2026, 10, 2, 9, 0).getTime()) {
  let t = start;
  return {
    now: () => t,
    advance: (ms: number) => {
      t += ms;
    },
  };
}

beforeEach(() => readerTargets.clear());

describe('reading time and chapters explored', () => {
  it('reading a chapter to the end for long enough credits it, in any translation', async () => {
    const c = clock();
    const { ui, storage } = await renderReader({ position: JOHN3_WEB, now: c.now });
    await screen.findByText(/For God so loved the world/);
    // John 3 has 36 verses: it needs verse 18 and 54 s. Scroll down through it, a step every 5 s.
    for (let i = 1; i <= 12; i++) {
      c.advance(5000);
      await scrollTo((6300 * i) / 12);
    }
    await ui.unmount(); // leaving the reader writes what is pending
    const p = storage.get(readingProgressKey);
    expect(Object.keys(p.chaptersRead)).toEqual(['43:3']);
    expect(p.activeMs['2026-11-02']).toBe(60_000);
    expect(p.evidence.chapters['43:3']!.furthestVerse).toBe(36);
  });

  it('time without seeing enough of the chapter earns minutes but no credit', async () => {
    const c = clock();
    const { ui, storage } = await renderReader({ position: JOHN3_WEB, now: c.now });
    await screen.findByText(/For God so loved the world/);
    for (let i = 1; i <= 20; i++) {
      c.advance(5000);
      await scrollTo(i % 2 ? 100 : 0); // stays in the first few verses
    }
    await ui.unmount();
    const p = storage.get(readingProgressKey);
    expect(p.chaptersRead).toEqual({});
    expect(p.activeMs['2026-11-02']).toBe(100_000);
    expect(p.evidence.chapters['43:3']!.furthestVerse).toBeLessThan(18);
  });

  it('tapping verses counts as reading too', async () => {
    const c = clock();
    const { ui, storage } = await renderReader({ position: JOHN3_WEB, now: c.now });
    await screen.findByText(/For God so loved the world/);
    c.advance(4000);
    await fireEvent.press(screen.getByTestId('verse-16'));
    c.advance(3000);
    await fireEvent.press(screen.getByTestId('sheet-close'));
    await ui.unmount();
    expect(storage.get(readingProgressKey).activeMs['2026-11-02']).toBeGreaterThanOrEqual(4000);
  });

  it('turning the chapter starts the next chapter’s clock', async () => {
    const c = clock();
    const { ui, storage } = await renderReader({ position: JOHN3_WEB, now: c.now });
    await screen.findByText(/For God so loved the world/);
    c.advance(5000);
    await scrollTo(200);
    await fireEvent.press(screen.getByTestId('reader-next'));
    await screen.findByText('John 4:1 WEB');
    c.advance(2000);
    await scrollTo(10, 1000);
    await ui.unmount();
    const chapters = storage.get(readingProgressKey).evidence.chapters;
    expect(chapters['43:3']!.engagedMs).toBe(5000);
    expect(chapters['43:4']!.engagedMs).toBe(2000);
  });
});

describe('read dots in the book picker (R-1 deferred to R-3)', () => {
  it('marks the chapters read, in the label and with a dot', async () => {
    const storage = createStorage(memoryBackend());
    storage.set(readingProgressKey, { ...storage.get(readingProgressKey), chaptersRead: { '43:1': 'x', '43:3': 'x' } });
    await renderReader({ storage, position: JOHN3_WEB });
    await fireEvent.press(await screen.findByTestId('reader-book-button'));
    const picker = await screen.findByTestId('book-picker');
    expect(within(picker).getByTestId('picker-chapter-1').props.accessibilityLabel).toBe('Chapter 1, read');
    expect(within(picker).getByTestId('picker-chapter-2').props.accessibilityLabel).toBe('Chapter 2');
    expect(within(picker).getByTestId('picker-chapter-1-read')).toBeTruthy();
    expect(within(picker).queryByTestId('picker-chapter-2-read')).toBeNull();
  });
});

describe('opening a passage in context', () => {
  const selected = (n: number) => screen.getByTestId(`verse-${n}-tools`).props.accessibilityState?.selected === true;

  it('a target waiting when the reader opens selects its verses, with the sheet closed, and is used up', async () => {
    readerTargets.set({ bookNumber: 43, chapter: 3, start: 16, end: 17 });
    await renderReader({ position: JOHN3_WEB });
    await screen.findByText(/For God so loved the world/);
    expect([selected(15), selected(16), selected(17), selected(18)]).toEqual([false, true, true, false]);
    expect(screen.queryByTestId('verse-sheet')).toBeNull();
    expect(readerTargets.get()).toBeNull();
  });

  it('a target that arrives while the reader is open moves it there (the tab stays mounted on web)', async () => {
    const { storage } = await renderReader({ position: { bookNumber: 1, chapter: 1, translation: 'WEB' } });
    await screen.findByText(/In the beginning, God created/);
    await act(async () => {
      readerTargets.set({ bookNumber: 43, chapter: 3, start: 3, end: 3 });
      storage.set(readerPositionKey, JOHN3_WEB);
    });
    await screen.findByText(/For God so loved the world/);
    expect(selected(3)).toBe(true);
    expect(readerTargets.get()).toBeNull();
  });

  it('a target for another chapter waits until that chapter shows', async () => {
    readerTargets.set({ bookNumber: 43, chapter: 4, start: 2, end: 2 });
    await renderReader({ position: JOHN3_WEB });
    await screen.findByText(/For God so loved the world/);
    expect(readerTargets.get()).toEqual({ bookNumber: 43, chapter: 4, start: 2, end: 2 });
    expect(selected(2)).toBe(false);
    await fireEvent.press(screen.getByTestId('reader-next'));
    await screen.findByText('John 4:1 WEB');
    expect(selected(2)).toBe(true);
    expect(readerTargets.get()).toBeNull();
  });
});
