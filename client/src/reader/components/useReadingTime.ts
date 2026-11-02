// Reports what the reader is doing to the engagement tracker (src/progress/engagement.ts): the chapter
// being shown, scrolling and verse presses, plus a heartbeat while the reader is in front.
//
// Evidence written to storage is never taken back, so the rule is: only measurements tied to the chapter on
// screen count, and time away from the app never counts.
//
// 1. Live state is read when an event is handled, never from a render's closure. The chapter on screen and
//    whether the reader is running (`focused && appActive && chapter`) live in a ref, updated in a layout effect
//    (before any event of the next frame) and set to "not running" in the same effect's cleanup, before the
//    tracker is paused. Every entry point (`interact`, `onScroll`, `onLayout`, `onContentSizeChange`,
//    `onChapterLayout`, the trailing scroll timer, the settle timer) reads it when it runs and, when the reader is
//    not running, does nothing at all. A report is for the live chapter only: a handler or timer made for an
//    earlier chapter, or before a pause, reports nothing for that chapter either. The callbacks are stable (they
//    read refs), so a kept one behaves exactly like the newest.
// 2. Only the chapter's own end marker (the screen's `reader-chapter-end`) measures its content: its report
//    names the chapter it was rendered for, and a report for any other chapter is dropped. A content-size report
//    cannot say which chapter it measured: it never establishes a content height, and after the marker has
//    reported it may raise that height but never lower it below the marker's. A scroll event carries its own
//    sizes: once the marker has reported, one whose content is shorter than the marker's is not this chapter's
//    and is dropped (no report, no interaction); before that, its own sizes are used. The viewport (the scroll
//    view's own size) belongs to no chapter and is kept across chapters. A new chapter starts with no content
//    height: until its marker reports, nothing beyond verse 0 is reported except what scroll events say.
import { useCallback, useEffect, useLayoutEffect, useMemo, useRef, useSyncExternalStore } from 'react';
import { AppState, type LayoutChangeEvent, type NativeScrollEvent, type NativeSyntheticEvent } from 'react-native';

import { createEngagementTracker, type ChapterInfo, type EngagementTracker } from '../../progress';
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
/**
 * How far a scroll event's content may fall short of the end marker's and still be the same layout: the two are
 * measured separately and rounded to the pixel grid on their own.
 */
const SIZE_SLACK = 2;

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

const sameChapter = (a: ChapterInfo, b: ChapterInfo) =>
  a.bookNumber === b.bookNumber && a.chapter === b.chapter && a.totalVerses === b.totalVerses;

export interface ReadingTime {
  /** A verse press, long press or tools press: the reader is here, with no new information about the view. */
  interact(): void;
  onScroll(e: NativeSyntheticEvent<NativeScrollEvent>): void;
  /** The scroll view's own size (the viewport; it belongs to no chapter). */
  onLayout(e: LayoutChangeEvent): void;
  /** The scroll content's size: never establishes a content height, only raises the end marker's. */
  onContentSizeChange(width: number, height: number): void;
  /**
   * The chapter's end marker laid out: `contentHeight` is the content's height for the chapter `chapter` it was
   * rendered for. The only source of a chapter's content height; a report for any chapter but the live one is
   * dropped.
   */
  onChapterLayout(chapter: ChapterInfo, contentHeight: number): void;
}

/** The live chapter's geometry. All of it is for `of` (the hook's chapter prop, by identity) and no other. */
interface Geometry {
  of: ChapterInfo | null;
  /** The end marker's content height; null until it has reported for `of`. */
  marker: number | null;
  /** The content height used: the marker's, raised by content-size reports. */
  content: number;
  /** The scroll offset, from scroll events accepted after the marker reported (0 until then). */
  offset: number;
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

  // The live state every entry point reads (see the top of the file). `chapter` is null whenever not running.
  const live = useRef<{ running: boolean; chapter: ChapterInfo | null; tracker: EngagementTracker; clock: () => number }>({
    running: false,
    chapter: null,
    tracker,
    clock,
  });
  const viewport = useRef(0);
  const geo = useRef<Geometry>({ of: null, marker: null, content: 0, offset: 0 });

  // Scroll reports: the time of the last one, and a trailing report so the last scroll of a burst is not lost.
  const lastScroll = useRef(-Infinity);
  const trailing = useRef<ReturnType<typeof setTimeout> | null>(null);
  // What the trailing report will say (its chapter is the one that was live when it was made).
  const trailingReport = useRef<{ chapter: ChapterInfo; furthest: number } | null>(null);
  const cancelTrailing = useCallback(() => {
    if (trailing.current !== null) clearTimeout(trailing.current);
    trailing.current = null;
    trailingReport.current = null;
  }, []);

  /** Reports the furthest verse on screen of the live chapter, at most once per SCROLL_REPORT_MS. */
  const report = useCallback(
    (furthest: number) => {
      const l = live.current;
      if (!l.running || !l.chapter) return;
      const reported = l.chapter;
      const t = l.clock();
      const wait = SCROLL_REPORT_MS - (t - lastScroll.current);
      cancelTrailing();
      if (wait <= 0) {
        lastScroll.current = t;
        l.tracker.interact(reported, furthest);
        return;
      }
      trailingReport.current = { chapter: reported, furthest };
      trailing.current = setTimeout(() => {
        trailing.current = null;
        const r = trailingReport.current;
        trailingReport.current = null;
        const now = live.current;
        // Flushed or cancelled (a pause, a new chapter): nothing is left to say.
        if (!r || !now.running || now.chapter !== r.chapter) return;
        lastScroll.current = now.clock();
        now.tracker.interact(r.chapter, r.furthest);
      }, wait);
    },
    [cancelTrailing],
  );

  // The estimate from the viewport and the marker's content height (with the offset of this chapter's scrolls):
  // when the content fits in the viewport the whole chapter is on screen, and no scroll event will ever say so.
  const reportGeometry = useCallback(() => {
    const l = live.current;
    const g = geo.current;
    if (!l.running || !l.chapter || g.of !== l.chapter || g.marker === null) return;
    if (viewport.current <= 0 || g.content <= 0) return;
    report(
      furthestVerseOf(
        {
          contentOffset: { x: 0, y: g.offset },
          layoutMeasurement: { width: 0, height: viewport.current },
          contentSize: { width: 0, height: g.content },
        },
        l.chapter.totalVerses,
      ),
    );
  }, [report]);

  // A chapter is shown (or the reader came back to it): the live state is set and the clock starts here, before
  // any event of the next frame. Whatever stops it (another chapter, a pause, unmounting) first marks the reader
  // not running, reports a waiting scroll and then pauses the tracker, which counts the time up to now: an
  // instant chapter turn never goes through `running` false, so it needs this too.
  useLayoutEffect(() => {
    const shown = running ? chapter : null;
    live.current = { running: !!shown, chapter: shown, tracker, clock };
    // A new chapter starts with no content height (its predecessor's would credit a long chapter as seen in
    // full). The same chapter coming back keeps what was measured for it.
    if (shown && geo.current.of !== shown) geo.current = { of: shown, marker: null, content: 0, offset: 0 };
    lastScroll.current = -Infinity;
    let settle: ReturnType<typeof setTimeout> | undefined;
    if (shown) {
      tracker.interact(shown, 0);
      // What was measured for this chapter before (or in this same moment) counts now.
      reportGeometry();
      settle = setTimeout(reportGeometry, GEOMETRY_SETTLE_MS);
    }
    return () => {
      live.current = { running: false, chapter: null, tracker, clock };
      clearTimeout(settle);
      // The trailing scroll was made while this chapter was live: it is reported now, before the pause.
      const r = trailingReport.current;
      cancelTrailing();
      if (r) {
        lastScroll.current = clock();
        tracker.interact(r.chapter, r.furthest);
      }
      tracker.pause();
    };
  }, [tracker, clock, chapter, running, reportGeometry, cancelTrailing]);

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
    const l = live.current;
    if (l.running && l.chapter) l.tracker.interact(l.chapter, 0);
  }, []);

  const onScroll = useCallback(
    (e: NativeSyntheticEvent<NativeScrollEvent>) => {
      const l = live.current;
      if (!l.running || !l.chapter) return;
      const { contentOffset, layoutMeasurement, contentSize } = e.nativeEvent;
      const g = geo.current;
      const marked = g.of === l.chapter && g.marker !== null;
      // Shorter than the shown chapter's end: an earlier chapter's scroll, delivered late.
      if (marked && contentSize.height < g.marker! - SIZE_SLACK) return;
      if (layoutMeasurement.height > 0) viewport.current = layoutMeasurement.height;
      // Only an offset known to be this chapter's is kept for the geometry estimate.
      if (marked) g.offset = contentOffset.y;
      report(furthestVerseOf(e.nativeEvent, l.chapter.totalVerses));
    },
    [report],
  );

  const onLayout = useCallback(
    (e: LayoutChangeEvent) => {
      // The viewport belongs to no chapter: it is kept even while nothing is shown (the scroll view lays out
      // once, often before the chapter has loaded). A hidden tab's 0 says nothing about the real size.
      const height = e.nativeEvent.layout.height;
      if (height > 0) viewport.current = height;
      reportGeometry();
    },
    [reportGeometry],
  );

  const onContentSizeChange = useCallback(
    (_width: number, height: number) => {
      const l = live.current;
      const g = geo.current;
      if (!l.running || !l.chapter || g.of !== l.chapter || g.marker === null) return;
      g.content = Math.max(g.marker, height);
      reportGeometry();
    },
    [reportGeometry],
  );

  const onChapterLayout = useCallback(
    (of: ChapterInfo, contentHeight: number) => {
      const l = live.current;
      if (!l.running || !l.chapter || !sameChapter(of, l.chapter)) return;
      const g = geo.current;
      if (g.of !== l.chapter) geo.current = { of: l.chapter, marker: null, content: 0, offset: 0 };
      geo.current.marker = contentHeight;
      geo.current.content = contentHeight;
      reportGeometry();
    },
    [reportGeometry],
  );

  return useMemo(
    () => ({ interact, onScroll, onLayout, onContentSizeChange, onChapterLayout }),
    [interact, onScroll, onLayout, onContentSizeChange, onChapterLayout],
  );
}
