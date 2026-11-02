// Scrolling the chapter so a verse is in view, a quarter of the way down the screen (and never under the header).
// One helper for opening a passage in context and for a reference on a word card.
//
// On the web the verse has an element: its offset is measured against the scroll node's. On native, nested
// `Text` has no layout of its own, so the offset comes from what the views report with `onLayout`: a row's
// position when verses are in rows (parallel reading), and in the single paragraph an ESTIMATE, the share of the
// characters before the verse times the height of the text block. The estimate is off by a few lines at worst
// (verse numbers and line breaks are not counted), which is fine for "bring it into view".
import { useCallback, useEffect, useRef, type ComponentRef, type RefObject } from 'react';
import { Platform, type ScrollView } from 'react-native';

/** What the chapter view reports about its layout (native only). All of it belongs to one chapter. */
export type VerseLayoutReport =
  | { key: string; kind: 'root'; y: number }
  | { key: string; kind: 'row'; verse: number; y: number }
  | { key: string; kind: 'text'; height: number };

export interface VerseText {
  verse: number;
  text: string;
}

interface Layout {
  key: string;
  rootY: number | null;
  rows: Map<number, number>;
  textHeight: number | null;
}

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
  key: string;
  verse: number;
  verses: readonly VerseText[];
}

export function useVerseScroller(opts: {
  scrollRef: RefObject<ComponentRef<typeof ScrollView> | null>;
  /** Each verse-tools button (a DOM element on the web). */
  toolsRefs: RefObject<Map<number, unknown>>;
  /** The height of the screen's viewport and the bottom of the header, to place the verse. */
  viewportHeight: number;
  headerBottom: number;
}) {
  const { scrollRef, toolsRefs } = opts;
  const place = useRef({ viewportHeight: opts.viewportHeight, headerBottom: opts.headerBottom });
  useEffect(() => {
    place.current = { viewportHeight: opts.viewportHeight, headerBottom: opts.headerBottom };
  }, [opts.viewportHeight, opts.headerBottom]);

  const layout = useRef<Layout | null>(null);
  const want = useRef<Want | null>(null);
  const retryTimer = useRef<ReturnType<typeof setTimeout> | null>(null);
  const stopRetrying = useCallback(() => {
    if (retryTimer.current !== null) clearTimeout(retryTimer.current);
    retryTimer.current = null;
  }, []);
  useEffect(() => stopRetrying, [stopRetrying]);

  /** Tries to scroll to the wanted verse; true once it has (or there is nothing left to do). */
  const attempt = useCallback((): boolean => {
    const w = want.current;
    if (!w) return true;
    const view = scrollRef.current;
    if (!view) return false;
    const { viewportHeight, headerBottom } = place.current;
    const landing = landingOffset(viewportHeight, headerBottom);

    if (Platform.OS === 'web') {
      const el = toolsRefs.current.get(w.verse) as { getBoundingClientRect?: () => { top: number } } | undefined;
      const node = (view as unknown as { getScrollableNode?: () => HTMLElement }).getScrollableNode?.();
      if (!el?.getBoundingClientRect || !node) return false;
      const box = node.getBoundingClientRect();
      // A hidden tab has no layout yet (everything measures 0): wait for it to show.
      if (box.height === 0) return false;
      const delta = el.getBoundingClientRect().top - box.top - landing;
      view.scrollTo({ y: Math.max(0, node.scrollTop + delta), animated: false });
      want.current = null;
      return true;
    }

    const l = layout.current;
    if (!l || l.key !== w.key || l.rootY === null) return false;
    const row = l.rows.get(w.verse);
    let inside: number | null = null;
    if (row !== undefined) inside = row;
    else if (l.rows.size === 0 && l.textHeight !== null) inside = estimateParagraphOffset(w.verses, w.verse, l.textHeight);
    if (inside === null) return false;
    view.scrollTo({ y: Math.max(0, l.rootY + inside - landing), animated: false });
    want.current = null;
    return true;
  }, [scrollRef, toolsRefs]);

  /** Scrolls to a verse of the chapter `key` (as the chapter view names it) as soon as it can be placed. */
  const scrollToVerse = useCallback(
    (key: string, verse: number, verses: readonly VerseText[]) => {
      const w = { key, verse, verses };
      want.current = w;
      stopRetrying();
      if (attempt() || Platform.OS !== 'web') return;
      // On the web the element exists but the page may not have laid out yet (the tab was hidden a moment ago):
      // try again for a second or so, unless a newer request or a cancel has replaced this one.
      let left = 20;
      const again = () => {
        retryTimer.current = null;
        if (want.current !== w || left-- <= 0) return;
        if (!attempt()) retryTimer.current = setTimeout(again, 50);
      };
      retryTimer.current = setTimeout(again, 50);
    },
    [attempt, stopRetrying],
  );

  /** Drops a scroll that has not happened yet (the chapter changed, or a newer request replaced it). */
  const cancel = useCallback(() => {
    want.current = null;
    stopRetrying();
  }, [stopRetrying]);

  /** The chapter view's layout reports. Passed to it on native only. */
  const onLayout = useCallback(
    (r: VerseLayoutReport) => {
      if (!layout.current || layout.current.key !== r.key) layout.current = { key: r.key, rootY: null, rows: new Map(), textHeight: null };
      const l = layout.current;
      if (r.kind === 'root') l.rootY = r.y;
      else if (r.kind === 'row') l.rows.set(r.verse, r.y);
      else l.textHeight = r.height;
      if (want.current?.key === r.key) attempt();
    },
    [attempt],
  );

  return { scrollToVerse, cancel, onLayout };
}
