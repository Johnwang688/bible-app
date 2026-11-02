// Reports what the reader is doing to the engagement tracker (src/progress/engagement.ts): the chapter
// being shown, scrolling and verse presses, plus a heartbeat while the reader is in front.
//
// Nothing is reported for a chapter that is loading, failed or not the current position: the screen passes
// `chapter` only when that chapter is what is on screen.
import { useCallback, useEffect, useLayoutEffect, useMemo, useRef, useSyncExternalStore } from 'react';
import { AppState, type LayoutChangeEvent, type NativeScrollEvent, type NativeSyntheticEvent } from 'react-native';

import { createEngagementTracker, type ChapterInfo } from '../../progress';
import type { Storage } from '../../storage/storage';

/** The heartbeat: how often the clock is advanced while the reader is showing. */
export const HEARTBEAT_MS = 5000;
/** Scroll reports are at most this far apart (the first one goes at once). */
export const SCROLL_REPORT_MS = 250;
/**
 * After a chapter is shown (or comes back to the front), how long before its geometry is looked at once more, in
 * case its measurements arrived in the same moment. Only measurements of that chapter are ever used.
 */
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
  /**
   * The height of the scroll content as measured from the shown chapter's own layout (`chapter` names it; a report
   * for any other is ignored). The screen reports it when a chapter has laid out, so a chapter whose content is
   * the same size as the last one's (no content-size event comes) is still measured.
   */
  onChapterLayout(chapter: ChapterInfo, contentHeight: number): void;
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

  // The scroll view's geometry, for a chapter that never scrolls. The viewport is the scroll view's own size and
  // holds for any chapter. The content size and the offset belong to one chapter: each is stamped with the chapter
  // that was shown when it was measured, and is used for that chapter only. A new chapter has neither until a
  // content size (or its own layout, or a scroll) is reported while it is shown: its predecessor's sizes would
  // credit a long chapter as seen in full.
  const view = useRef<{ viewport: number; content: number; contentOf: ChapterInfo | null; offset: number; offsetOf: ChapterInfo | null }>({
    viewport: 0,
    content: 0,
    contentOf: null,
    offset: 0,
    offsetOf: null,
  });
  const reportGeometryRef = useRef<() => void>(() => undefined);

  // A chapter is shown (or the reader came back to it): the clock starts here. Whatever stops it (another
  // chapter, a pause, unmounting) first reports a waiting scroll and then pauses the tracker, which counts the
  // time up to now: an instant chapter turn never goes through `running` false, so it needs this too.
  useEffect(() => {
    lastScroll.current = -Infinity;
    let settle: ReturnType<typeof setTimeout> | undefined;
    if (running && chapter) {
      tracker.interact(chapter, 0);
      // What was measured for this chapter while the reader was away (or in this same moment) counts now.
      reportGeometryRef.current();
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
      // A scroll event carries its own sizes, all measured now: they are this chapter's.
      const { contentOffset, layoutMeasurement, contentSize } = e.nativeEvent;
      view.current = {
        viewport: layoutMeasurement.height > 0 ? layoutMeasurement.height : view.current.viewport,
        content: contentSize.height,
        contentOf: chapter,
        offset: contentOffset.y,
        offsetOf: chapter,
      };
      report(furthestVerseOf(e.nativeEvent, chapter.totalVerses));
    },
    [running, chapter, report],
  );

  // The same estimate from the view's own size and content size, with the current offset: when the content fits
  // in the viewport the whole chapter is on screen, and no scroll event will ever say so. Only this chapter's
  // content size counts (see `view`); without one, nothing is reported.
  const reportGeometry = useCallback(() => {
    const v = view.current;
    if (!chapter || v.contentOf !== chapter || v.viewport <= 0 || v.content <= 0) return;
    report(
      furthestVerseOf(
        {
          contentOffset: { x: 0, y: v.offsetOf === chapter ? v.offset : 0 },
          layoutMeasurement: { width: 0, height: v.viewport },
          contentSize: { width: 0, height: v.content },
        },
        chapter.totalVerses,
      ),
    );
  }, [chapter, report]);
  // A layout effect, so the chapter effect above (a passive one) already sees this render's chapter.
  useLayoutEffect(() => {
    reportGeometryRef.current = reportGeometry;
  }, [reportGeometry]);

  const onLayout = useCallback(
    (e: LayoutChangeEvent) => {
      view.current.viewport = e.nativeEvent.layout.height;
      reportGeometry();
    },
    [reportGeometry],
  );

  // Stamped with the chapter shown when the report is handled (the screen's latest render).
  const onContentSizeChange = useCallback(
    (_width: number, height: number) => {
      view.current.content = height;
      view.current.contentOf = chapter;
      reportGeometry();
    },
    [chapter, reportGeometry],
  );

  const onChapterLayout = useCallback(
    (of: ChapterInfo, contentHeight: number) => {
      if (!chapter || of.bookNumber !== chapter.bookNumber || of.chapter !== chapter.chapter) return;
      view.current.content = contentHeight;
      view.current.contentOf = chapter;
      reportGeometry();
    },
    [chapter, reportGeometry],
  );

  return { interact, onScroll, onLayout, onContentSizeChange, onChapterLayout };
}
