// Acceptance (orchestrator-owned), R3-reader-fix3: which measurements may give a chapter visibility evidence.
// Only the chapter's own end marker says how tall its content is; a content-size report can only make it taller
// (it cannot tell which chapter it measured), and so can a scroll event once the end is known; and a handler kept from an earlier render reports nothing once the
// reader has stopped or moved on.
import { act, renderHook } from '@testing-library/react-native';
import type { LayoutChangeEvent, NativeScrollEvent, NativeSyntheticEvent } from 'react-native';

import type { ChapterInfo } from '../../progress';
import { readingProgressKey } from '../../storage/keys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { useReadingTime } from '../components/useReadingTime';

const PS117: ChapterInfo = { bookNumber: 19, chapter: 117, totalVerses: 3 };
const JOHN3: ChapterInfo = { bookNumber: 43, chapter: 3, totalVerses: 36 };

const viewport = (height: number) =>
  ({ nativeEvent: { layout: { x: 0, y: 0, width: 390, height } } }) as LayoutChangeEvent;

const scrollEvent = (y: number, content: number) =>
  ({
    nativeEvent: {
      contentOffset: { x: 0, y },
      layoutMeasurement: { width: 390, height: 700 },
      contentSize: { width: 390, height: content },
    },
  }) as NativeSyntheticEvent<NativeScrollEvent>;

async function setup(chapter: ChapterInfo, focused = true) {
  jest.useFakeTimers();
  jest.setSystemTime(new Date(2026, 10, 2, 9));
  const storage = createStorage(memoryBackend());
  const now = () => Date.now();
  const h = await renderHook(
    (p: { chapter: ChapterInfo | null; focused: boolean }) =>
      useReadingTime({ storage, now, chapter: p.chapter, focused: p.focused }),
    { initialProps: { chapter, focused } },
  );
  return { storage, h };
}

afterEach(() => jest.useRealTimers());

it('credits a chapter that fits from its end marker alone', async () => {
  const { storage, h } = await setup(PS117);
  await act(() => h.result.current.onLayout(viewport(700)));
  await act(() => h.result.current.onChapterLayout(PS117, 500));
  await act(() => jest.advanceTimersByTime(25_000));
  await h.unmount();
  const p = storage.get(readingProgressKey);
  expect(p.evidence.chapters['19:117']!.furthestVerse).toBe(3);
  expect(p.chaptersRead).toHaveProperty('19:117');
});

it('a content-size report alone says nothing about which chapter fits', async () => {
  const { storage, h } = await setup(PS117);
  await act(() => h.result.current.onLayout(viewport(700)));
  await act(() => h.result.current.onContentSizeChange(390, 500));
  await act(() => jest.advanceTimersByTime(25_000));
  await h.unmount();
  const p = storage.get(readingProgressKey);
  expect(p.evidence.chapters['19:117']!.furthestVerse).toBe(0);
  expect(p.chaptersRead).toEqual({});
});

it('a content size shorter than the shown chapter’s end is not that chapter’s', async () => {
  const { storage, h } = await setup(PS117);
  await act(() => h.result.current.onLayout(viewport(700)));
  await act(() => h.result.current.onChapterLayout(PS117, 500));
  await h.rerender({ chapter: JOHN3, focused: true });
  await act(() => h.result.current.onChapterLayout(JOHN3, 7000));
  // The previous chapter's content size, delivered late.
  await act(() => h.result.current.onContentSizeChange(390, 500));
  await act(() => jest.advanceTimersByTime(55_000));
  await h.unmount();
  const p = storage.get(readingProgressKey);
  expect(p.chaptersRead).not.toHaveProperty('43:3');
  expect(p.evidence.chapters['43:3']!.furthestVerse).toBeLessThan(18);
});

it('the previous chapter’s end marker, reporting late, is ignored', async () => {
  const { storage, h } = await setup(PS117);
  await act(() => h.result.current.onLayout(viewport(700)));
  const oldMarker = h.result.current.onChapterLayout;
  await h.rerender({ chapter: JOHN3, focused: true });
  await act(() => oldMarker(PS117, 500));
  await act(() => h.result.current.onChapterLayout(PS117, 500));
  await act(() => jest.advanceTimersByTime(55_000));
  await h.unmount();
  const p = storage.get(readingProgressKey);
  expect(p.chaptersRead).toEqual({});
  expect(p.evidence.chapters['43:3']!.furthestVerse).toBe(0);
});

it('a scroll handler kept from before the tab was left counts no time', async () => {
  const { storage, h } = await setup(JOHN3);
  const oldScroll = h.result.current.onScroll;
  const oldInteract = h.result.current.interact;
  await act(() => jest.advanceTimersByTime(100));
  await h.rerender({ chapter: JOHN3, focused: false });
  await act(() => oldScroll(scrollEvent(300, 7000)));
  await act(() => oldInteract());
  await act(() => jest.advanceTimersByTime(10_000));
  await h.unmount();
  expect(storage.get(readingProgressKey).activeMs['2026-11-02']).toBe(100);
});

it('a handler kept from the previous chapter does not report for the new one', async () => {
  const { storage, h } = await setup(PS117);
  const oldScroll = h.result.current.onScroll;
  await h.rerender({ chapter: JOHN3, focused: true });
  await act(() => h.result.current.onChapterLayout(JOHN3, 7000));
  // The old chapter's last scroll (at its bottom), delivered after the turn: its content is shorter than the
  // shown chapter's end, so it is not the shown chapter's.
  await act(() => oldScroll(scrollEvent(0, 500)));
  await act(() => h.result.current.onScroll(scrollEvent(0, 500)));
  await act(() => jest.advanceTimersByTime(55_000));
  await h.unmount();
  const p = storage.get(readingProgressKey);
  expect(p.chaptersRead).not.toHaveProperty('43:3');
  expect(p.evidence.chapters['43:3']!.furthestVerse).toBe(0);
});
