// Reports what the reader is doing to the engagement tracker (src/progress/engagement.ts): the chapter
// being shown, scrolling and verse presses, plus a heartbeat while the reader is in front.
//
// Nothing is reported for a chapter that is loading, failed or not the current position: the screen passes
// `chapter` only when that chapter is what is on screen.
import { useCallback, useEffect, useMemo, useRef, useSyncExternalStore } from 'react';
import { AppState, type NativeScrollEvent, type NativeSyntheticEvent } from 'react-native';

import { createEngagementTracker, type ChapterInfo } from '../../progress';
import type { Storage } from '../../storage/storage';

/** The heartbeat: how often the clock is advanced while the reader is showing. */
export const HEARTBEAT_MS = 5000;
/** Scroll reports are at most this far apart (the first one goes at once). */
export const SCROLL_REPORT_MS = 250;

/** Whether the app is in front. The web reports 'active' while the page is visible. */
function subscribeAppState(onChange: () => void): () => void {
  const sub = AppState.addEventListener('change', onChange);
  return () => sub.remove();
}
// Only 'background' and 'inactive' mean away: the Jest mock of AppState has no usable state at all, and the reader
// must still run there.
const appIsActive = () => AppState.currentState !== 'background' && AppState.currentState !== 'inactive';

function useAppActive(): boolean {
  return useSyncExternalStore(subscribeAppState, appIsActive, appIsActive);
}

/**
 * The furthest verse on screen, estimated from a scroll event: the share of the content above the bottom of the
 * viewport, as a share of the verses. At the bottom it is the last verse.
 */
export function furthestVerseOf(e: NativeScrollEvent, total: number): number {
  const { contentOffset, layoutMeasurement, contentSize } = e;
  const bottom = contentOffset.y + layoutMeasurement.height;
  if (total <= 0) return 0;
  if (contentSize.height <= 0 || bottom >= contentSize.height - 2) return total;
  return Math.min(total, Math.max(1, Math.ceil((total * bottom) / contentSize.height)));
}

export interface ReadingTime {
  /** A verse press, long press or tools press: the reader is here, with no new information about the view. */
  interact(): void;
  onScroll(e: NativeSyntheticEvent<NativeScrollEvent>): void;
}

export function useReadingTime(opts: {
  storage: Storage;
  now?: () => number;
  /** The chapter on screen, or null while there is none. Must be stable between renders while it is the same. */
  chapter: ChapterInfo | null;
  /** The reader's tab is the one showing. */
  focused: boolean;
}): ReadingTime {
  const { storage, chapter, focused } = opts;
  // `now` is the tracker's clock and the scroll throttle's. It must be the same function between renders.
  const clock = opts.now ?? Date.now;
  const tracker = useMemo(() => createEngagementTracker({ storage, now: clock }), [storage, clock]);

  const appActive = useAppActive();
  const running = focused && appActive && !!chapter;

  // Scroll reports: the time of the last one, and a trailing report so the last scroll of a burst is not lost.
  const lastScroll = useRef(-Infinity);
  const trailing = useRef<ReturnType<typeof setTimeout> | null>(null);
  const cancelTrailing = useCallback(() => {
    if (trailing.current !== null) clearTimeout(trailing.current);
    trailing.current = null;
  }, []);

  // A chapter is shown (or the reader came back to it): the clock starts here. A chapter change also drops
  // anything that was waiting to be reported for the last one.
  useEffect(() => {
    lastScroll.current = -Infinity;
    cancelTrailing();
    if (running && chapter) tracker.interact(chapter, 0);
  }, [tracker, chapter, running, cancelTrailing]);

  // The heartbeat. Stopping it (the tab or the app went away, or the chapter went) pauses the tracker, and so
  // does unmounting; pausing writes what is pending.
  useEffect(() => {
    if (!running) return;
    const id = setInterval(() => tracker.tick(), HEARTBEAT_MS);
    return () => {
      clearInterval(id);
      tracker.pause();
    };
  }, [tracker, running]);

  useEffect(() => cancelTrailing, [cancelTrailing]);

  const interact = useCallback(() => {
    if (running && chapter) tracker.interact(chapter, 0);
  }, [tracker, running, chapter]);

  const onScroll = useCallback(
    (e: NativeSyntheticEvent<NativeScrollEvent>) => {
      if (!running || !chapter) return;
      const furthest = furthestVerseOf(e.nativeEvent, chapter.totalVerses);
      const t = clock();
      const wait = SCROLL_REPORT_MS - (t - lastScroll.current);
      if (wait <= 0) {
        cancelTrailing();
        lastScroll.current = t;
        tracker.interact(chapter, furthest);
        return;
      }
      cancelTrailing();
      trailing.current = setTimeout(() => {
        trailing.current = null;
        lastScroll.current = clock();
        tracker.interact(chapter, furthest);
      }, wait);
    },
    [tracker, running, chapter, clock, cancelTrailing],
  );

  return { interact, onScroll };
}
