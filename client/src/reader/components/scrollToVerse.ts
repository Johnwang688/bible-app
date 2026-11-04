// Scrolling the chapter so a verse is in view, a quarter of the way down the screen (and never under the header).
// One helper for opening a passage in context and for a reference on a word card.
//
// On the web the verse has an element: its offset is measured against the scroll node's. On native, nested
// `Text` has no layout of its own, so the offset comes from what the views report with `onLayout`: a row's
// position when verses are in rows (parallel reading), and in the single paragraph an ESTIMATE, the share of the
// characters before the verse times the height of the text block. The estimate is off by a few lines at worst
// (verse numbers and line breaks are not counted), which is fine for "bring it into view".
//
// A request lives until it is done, replaced (a new request), cancelled (the chapter changed) or the reader
// unmounts. A verse the chapter does not have is dropped at once: nothing could ever place it.
//
// Only measurements tied to the chapter on screen count. What the screen says is on screen (`place`: the shown
// key, the layout kind, the viewport and the header) is updated in a layout effect, so it is current when any
// report or timer runs. A layout report for a key that is not the shown one is dropped before anything else: it
// never replaces or clears the cached layout of the chapter on screen.
//
// - Web: when the page cannot be measured yet (a hidden tab: everything measures 0), the request waits for
//   something that can change that: a render of the reader (the tab gaining focus re-renders it), a layout or
//   content-size report (`retry`), and, as a backstop, a slow check that backs off to once every
//   RETRY_MAX_MS. It never polls fast for long.
// - Native: the request is placed from the layout reports. A layout is one kind, rows or one paragraph, and the
//   reports of one kind replace everything left from the other. Which kind is on screen is known to the screen
//   (`layout`); when it is given, only measurements of that kind are used. Either way, once placed the request
//   stays open for PLACED_MS (until the user scrolls): a report that arrives after the target (a replacement
//   layout of the same chapter) places it again from the new measurements, so the order of the two events does
//   not matter.
import { useCallback, useEffect, useLayoutEffect, useRef, type ComponentRef, type RefObject } from 'react';
import { Platform, type ScrollView } from 'react-native';

/** What the chapter view reports about its layout (native only). All of it belongs to one chapter. */
export type VerseLayoutReport =
  | { key: string; kind: 'root'; y: number }
  | { key: string; kind: 'row'; verse: number; y: number }
  | { key: string; kind: 'text'; height: number };

/** The two ways the chapter view lays verses out (native). */
export type VerseLayoutKind = 'rows' | 'text';

export interface VerseText {
  verse: number;
  text: string;
}

interface Layout {
  key: string;
  rootY: number | null;
  /** The kind the measurements below belong to; null until a row or the paragraph has reported. */
  kind: VerseLayoutKind | null;
  rows: Map<number, number>;
  textHeight: number | null;
}

/** The web's first check of a request it cannot place yet, doubling up to RETRY_MAX_MS. */
export const RETRY_FIRST_MS = 50;
export const RETRY_MAX_MS = 2000;
/** On native, how long a placed request is placed again when a newer layout of its chapter reports. */
export const PLACED_MS = 2000;

/** Where on the screen (from the top of the scroll view) the verse should land. */
export function landingOffset(viewportHeight: number, headerBottom: number): number {
  return Math.max(headerBottom, Math.round(viewportHeight * 0.25));
}

/** The offset of a verse in a single paragraph, from the share of characters before it. Exported for tests. */
export function estimateParagraphOffset(verses: readonly VerseText[], verse: number, textHeight: number): number | null {
  let before = 0;
  let total = 0;
  let found = false;
  for (const v of verses) {
    if (v.verse === verse) found = true;
    // A verse number and a space count too, so short verses are not weighed as nothing.
    const length = v.text.length + String(v.verse).length + 1;
    if (!found) before += length;
    total += length;
  }
  if (!found || total === 0) return null;
  return (before / total) * textHeight;
}

interface Want {
  animated: boolean;
  key: string;
  verse: number;
  verses: readonly VerseText[];
  /** Native: when it was first scrolled to (null: not yet), and the offset it was scrolled to last. */
  placedAt: number | null;
  placedY: number | null;
}

/** First verse number on or below the visible top line, in content coordinates. */
export function firstVisibleVerse(verses: readonly { verse: number; y: number }[], scrollY: number, visibleTop: number): number | undefined {
  const ordered = [...verses].sort((a, b) => a.verse - b.verse);
  if (scrollY <= 4) return ordered[0]?.verse;
  return ordered.find((v) => v.y >= scrollY + visibleTop)?.verse ?? ordered[ordered.length - 1]?.verse;
}

export function useVerseScroller(opts: {
  scrollRef: RefObject<ComponentRef<typeof ScrollView> | null>;
  /** Each verse-tools button (a DOM element on the web). */
  toolsRefs: RefObject<Map<number, unknown>>;
  /** The height of the screen's viewport and the bottom of the header, to place the verse. */
  viewportHeight: number;
  headerBottom: number;
  /** Native: the kind of layout on screen now. Absent: whatever kind reported last is taken as current. */
  layout?: VerseLayoutKind;
  /** The key of the chapter on screen now; a request for any other is dropped. Absent: no check. */
  shownKey?: string;
}) {
  const { scrollRef, toolsRefs, viewportHeight, headerBottom, layout: layoutKind, shownKey } = opts;
  // Read by the attempts, which also run from timers and reports. A layout effect: current before any report or
  // timer of the next frame, and before the render check below runs.
  const place = useRef({ viewportHeight, headerBottom, layout: layoutKind, shownKey });
  useLayoutEffect(() => {
    place.current = { viewportHeight, headerBottom, layout: layoutKind, shownKey };
  }, [viewportHeight, headerBottom, layoutKind, shownKey]);

  const layout = useRef<Layout | null>(null);
  const want = useRef<Want | null>(null);

  // The web's backstop check (see the top of the file).
  const retryTimer = useRef<ReturnType<typeof setTimeout> | null>(null);
  const retryDelay = useRef(RETRY_FIRST_MS);
  const stopRetrying = useCallback(() => {
    if (retryTimer.current !== null) clearTimeout(retryTimer.current);
    retryTimer.current = null;
  }, []);
  useEffect(() => stopRetrying, [stopRetrying]);

  /**
   * Tries to scroll to the wanted verse. 'done': nothing is left to do; 'wait': it cannot be placed yet; on native
   * a placed request also answers 'wait', as it stays open for a newer layout.
   */
  const attempt = useCallback((): 'done' | 'wait' => {
    const w = want.current;
    if (!w) return 'done';
    if (!w.verses.some((v) => v.verse === w.verse)) {
      // Not in this chapter (this translation leaves it out): nothing will ever place it.
      want.current = null;
      return 'done';
    }
    const { viewportHeight, headerBottom, layout: kind, shownKey } = place.current;
    if (shownKey !== undefined && w.key !== shownKey) {
      // Its chapter is no longer the one shown.
      want.current = null;
      return 'done';
    }
    const view = scrollRef.current;
    if (!view) return 'wait';
    const landing = landingOffset(viewportHeight, headerBottom);

    if (Platform.OS === 'web') {
      const el = toolsRefs.current.get(w.verse) as { getBoundingClientRect?: () => { top: number } } | undefined;
      const node = (view as unknown as { getScrollableNode?: () => HTMLElement }).getScrollableNode?.();
      if (!el?.getBoundingClientRect || !node) return 'wait';
      const box = node.getBoundingClientRect();
      // A hidden tab has no layout yet (everything measures 0): wait for it to show.
      if (box.height === 0) return 'wait';
      const delta = el.getBoundingClientRect().top - box.top - landing;
      view.scrollTo({ y: Math.max(0, node.scrollTop + delta), animated: w.animated });
      want.current = null;
      return 'done';
    }

    if (w.placedAt !== null && Date.now() - w.placedAt > PLACED_MS) {
      want.current = null;
      return 'done';
    }
    const l = layout.current;
    if (!l || l.key !== w.key || l.rootY === null || l.kind === null) return 'wait';
    // Only measurements of the layout on screen now (when the screen says which it is).
    if (kind && l.kind !== kind) return 'wait';
    let inside: number | null = null;
    if (l.kind === 'rows') inside = l.rows.get(w.verse) ?? null;
    else if (l.textHeight !== null) inside = estimateParagraphOffset(w.verses, w.verse, l.textHeight);
    if (inside === null) return 'wait';
    const y = Math.max(0, l.rootY + inside - landing);
    if (y !== w.placedY) view.scrollTo({ y, animated: w.animated });
    w.placedY = y;
    w.placedAt ??= Date.now();
    return 'wait';
  }, [scrollRef, toolsRefs]);

  /** Web: tries again now, and if it still cannot, checks again later, each time waiting longer. */
  const tryWeb = useCallback(() => {
    const step = () => {
      stopRetrying();
      if (attempt() === 'done') return;
      const w = want.current;
      retryTimer.current = setTimeout(() => {
        retryTimer.current = null;
        if (want.current !== w) return;
        retryDelay.current = Math.min(RETRY_MAX_MS, retryDelay.current * 2);
        step();
      }, retryDelay.current);
    };
    step();
  }, [attempt, stopRetrying]);

  /** Scrolls to a verse of the chapter `key` (as the chapter view names it) as soon as it can be placed. */
  const scrollToVerse = useCallback(
    (key: string, verse: number, verses: readonly VerseText[], options: { animated?: boolean } = {}) => {
      want.current = { key, verse, verses, placedAt: null, placedY: null, animated: options.animated ?? false };
      stopRetrying();
      retryDelay.current = RETRY_FIRST_MS;
      if (Platform.OS === 'web') tryWeb();
      else attempt();
    },
    [attempt, tryWeb, stopRetrying],
  );

  /** Something that can change what the web can measure happened (a layout or content-size report): try now. */
  const retry = useCallback(() => {
    if (Platform.OS === 'web' && want.current) tryWeb();
  }, [tryWeb]);

  // A render of the reader (the tab gaining focus, new props) can make a waiting web request possible.
  useEffect(() => {
    if (Platform.OS === 'web' && want.current) tryWeb();
  });

  /** Drops a scroll that has not happened yet (the chapter changed, or a newer request replaced it). */
  const cancel = useCallback(() => {
    want.current = null;
    stopRetrying();
  }, [stopRetrying]);

  /** The user scrolled: a request already placed is theirs to move now (one still waiting stays). */
  const release = useCallback(() => {
    if (want.current?.placedAt != null) want.current = null;
  }, []);

  /** The chapter view's layout reports. Passed to it on native only. */
  const onLayout = useCallback(
    (r: VerseLayoutReport) => {
      // Another chapter's layout (an old chapter's report, delivered late): it must not touch the cache.
      const { shownKey } = place.current;
      if (shownKey !== undefined && r.key !== shownKey) return;
      if (!layout.current || layout.current.key !== r.key) {
        layout.current = { key: r.key, rootY: null, kind: null, rows: new Map(), textHeight: null };
      }
      const l = layout.current;
      if (r.kind === 'root') l.rootY = r.y;
      else {
        const kind: VerseLayoutKind = r.kind === 'row' ? 'rows' : 'text';
        if (l.kind !== kind) {
          // A layout of the other kind: everything measured for the old one is stale.
          l.kind = kind;
          l.rows.clear();
          l.textHeight = null;
        }
        if (r.kind === 'row') l.rows.set(r.verse, r.y);
        else l.textHeight = r.height;
      }
      if (want.current?.key === r.key) attempt();
    },
    [attempt],
  );

  const visibleVerse = useCallback((key: string, verses: readonly VerseText[], scrollY: number, visibleTop: number) => {
    if (scrollY <= 4) return verses[0]?.verse;
    if (Platform.OS === 'web') {
      const node = (scrollRef.current as unknown as { getScrollableNode?(): HTMLElement } | null)?.getScrollableNode?.();
      if (!node) return verses[0]?.verse;
      const top = node.getBoundingClientRect().top;
      const measured = verses.flatMap((v) => {
        const el = toolsRefs.current.get(v.verse) as { getBoundingClientRect?(): { top: number } } | undefined;
        return el?.getBoundingClientRect ? [{ verse: v.verse, y: el.getBoundingClientRect().top - top + node.scrollTop }] : [];
      });
      return firstVisibleVerse(measured, node.scrollTop, visibleTop) ?? verses[0]?.verse;
    }
    const l = layout.current;
    if (!l || l.key !== key || l.rootY === null || (place.current.layout && l.kind !== place.current.layout)) return verses[0]?.verse;
    const measured = verses.flatMap((v) => {
      const y = l.kind === 'rows' ? l.rows.get(v.verse) : l.textHeight !== null ? estimateParagraphOffset(verses, v.verse, l.textHeight) : null;
      return y == null ? [] : [{ verse: v.verse, y: l.rootY! + y }];
    });
    return firstVisibleVerse(measured, scrollY, visibleTop) ?? verses[0]?.verse;
  }, [scrollRef, toolsRefs]);

  return { scrollToVerse, firstVisibleVerse: visibleVerse, cancel, release, retry, onLayout };
}
