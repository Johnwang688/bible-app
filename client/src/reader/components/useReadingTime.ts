// Reports what the reader is doing to the engagement tracker (src/progress/engagement.ts): the chapter
// being shown, scrolling and verse presses, plus a heartbeat while the reader is in front.
//
// Nothing is reported for a chapter that is loading, failed or not the current position: the screen passes
// `chapter` only when that chapter is what is on screen.
import { useCallback, useEffect, useMemo, useRef, useSyncExternalStore } from 'react';
import { AppState, type LayoutChangeEvent, type NativeScrollEvent, type NativeSyntheticEvent } from 'react-native';

import { createEngagementTracker, type ChapterInfo } from '../../progress';
import type { Storage } from '../../storage/storage';

/** The heartbeat: how often the clock is advanced while the reader is showing. */
export const HEARTBEAT_MS = 5000;
/** Scroll reports are at most this far apart (the first one goes at once). */
export const SCROLL_REPORT_MS = 250;
/** After a chapter is shown, how long before the scroll view's size is taken as it is for that chapter. */
export const GEOMETRY_SETTLE_MS = 300;

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
export function furthestVerseOf(
  e: Pick<NativeScrollEvent, 'contentOffset' | 'layoutMeasurement' | 'contentSize'>,
  total: number,
): number {
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
  /** The scroll view's own size, and the size of its content: a chapter that fits is wholly on screen. */
  onLayout(e: LayoutChangeEvent): void;
  onContentSizeChange(width: number, height: number): void;
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
  // What the trailing report will say (its chapter is the one that was shown when it was made).
  const trailingReport = useRef<{ chapter: ChapterInfo; furthest: number } | null>(null);
  const cancelTrailing = useCallback(() => {
    if (trailing.current !== null) clearTimeout(trailing.current);
    trailing.current = null;
    trailingReport.current = null;
  }, []);
  /** Reports a waiting trailing scroll now (before anything pauses the clock), so the last scroll is not lost. */
  const flushTrailing = useCallback(() => {
    const r = trailingReport.current;
    cancelTrailing();
    if (r) {
      lastScroll.current = clock();
      tracker.interact(r.chapter, r.furthest);
    }
  }, [tracker, clock, cancelTrailing]);

  // The scroll view's geometry, for a chapter that never scrolls. The offset is the latest scroll's.
  const view = useRef({ offset: 0, viewport: 0, content: 0 });
  const reportGeometryRef = useRef<() => void>(() => undefined);

  // A chapter is shown (or the reader came back to it): the clock starts here. Whatever stops it (another
  // chapter, a pause, unmounting) first reports a waiting scroll and then pauses the tracker, which counts the
  // time up to now: an instant chapter turn never goes through `running` false, so it needs this too.
  useEffect(() => {
    lastScroll.current = -Infinity;
    view.current.offset = 0;
    let settle: ReturnType<typeof setTimeout> | undefined;
    if (running && chapter) {
      tracker.interact(chapter, 0);
      // The view's size was usually measured before the chapter was shown (while it loaded), and a chapter that
      // fits changes nothing about it, so no event will come. Look again once the layout has settled; by then
      // any size left from the last chapter has been replaced by an event if it was different.
      settle = setTimeout(() => reportGeometryRef.current(), GEOMETRY_SETTLE_MS);
    }
    return () => {
      clearTimeout(settle);
      flushTrailing();
      tracker.pause();
    };
  }, [tracker, chapter, running, flushTrailing]);

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

  /** Reports the furthest verse on screen, at most once per SCROLL_REPORT_MS; the last one of a burst follows. */
  const report = useCallback(
    (furthest: number) => {
      if (!running || !chapter) return;
      const t = clock();
      const wait = SCROLL_REPORT_MS - (t - lastScroll.current);
      if (wait <= 0) {
        cancelTrailing();
        lastScroll.current = t;
        tracker.interact(chapter, furthest);
        return;
      }
      cancelTrailing();
      trailingReport.current = { chapter, furthest };
      trailing.current = setTimeout(() => {
        trailing.current = null;
        trailingReport.current = null;
        lastScroll.current = clock();
        tracker.interact(chapter, furthest);
      }, wait);
    },
    [tracker, running, chapter, clock, cancelTrailing],
  );

  const onScroll = useCallback(
    (e: NativeSyntheticEvent<NativeScrollEvent>) => {
      if (!running || !chapter) return;
      view.current.offset = e.nativeEvent.contentOffset.y;
      report(furthestVerseOf(e.nativeEvent, chapter.totalVerses));
    },
    [running, chapter, report],
  );

  // The same estimate from the view's own size and content size, with the current offset: when the content fits
  // in the viewport the whole chapter is on screen, and no scroll event will ever say so.
  const reportGeometry = useCallback(() => {
    const { offset, viewport, content } = view.current;
    if (!chapter || viewport <= 0 || content <= 0) return;
    report(
      furthestVerseOf(
        {
          contentOffset: { x: 0, y: offset },
          layoutMeasurement: { width: 0, height: viewport },
          contentSize: { width: 0, height: content },
        },
        chapter.totalVerses,
      ),
    );
  }, [chapter, report]);
  useEffect(() => {
    reportGeometryRef.current = reportGeometry;
  }, [reportGeometry]);

  const onLayout = useCallback(
    (e: LayoutChangeEvent) => {
      view.current.viewport = e.nativeEvent.layout.height;
      reportGeometry();
    },
    [reportGeometry],
  );

  const onContentSizeChange = useCallback(
    (_width: number, height: number) => {
      view.current.content = height;
      reportGeometry();
    },
    [reportGeometry],
  );

  return { interact, onScroll, onLayout, onContentSizeChange };
}
