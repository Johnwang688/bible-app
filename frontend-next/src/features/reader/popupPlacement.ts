/**
 * Placement rule for the floating verse card (`.verse-study-popup`).
 *
 * `placeVersePopup` is pure: given the selected verse's client rect, the card's measured size and the
 * reader area it may occupy, it returns where the card goes. The DOM helpers below gather those inputs.
 */

export interface PlacementRect {
  top: number;
  left: number;
  right: number;
  bottom: number;
}

export interface PlacementSize {
  width: number;
  height: number;
}

export interface VersePopupPlacement {
  top: number;
  left: number;
  /** No floating spot fits: the card is pinned to the bottom (or top) of the reader area. */
  docked: boolean;
  /** Docked only: the card's width (the area's width, capped at the card's normal width). */
  width?: number;
  /** Docked only: height cap; the card scrolls internally beyond it. */
  maxHeight?: number;
}

/** Space kept between the reader area's edges and the card. */
export const AREA_MARGIN = 8;
/** Space kept between the verse and the card. */
export const VERSE_GAP = 8;
/** A docked card squeezed beside the verse must keep at least this much height to be usable. */
export const DOCK_MIN_HEIGHT = 96;
/** Class set on the card while docked. */
export const DOCKED_CLASS = 'verse-study-popup--docked';

function intersects(a: PlacementRect, b: PlacementRect): boolean {
  return a.left < b.right && b.left < a.right && a.top < b.bottom && b.top < a.bottom;
}

function inside(r: PlacementRect, area: PlacementRect): boolean {
  return r.left >= area.left && r.right <= area.right && r.top >= area.top && r.bottom <= area.bottom;
}

function clamp(value: number, min: number, max: number): number {
  return Math.max(min, Math.min(value, max));
}

function box(top: number, left: number, size: PlacementSize): PlacementRect {
  return { top, left, right: left + size.width, bottom: top + size.height };
}

/**
 * Where the verse card goes. Candidates, in order; the first that lies entirely inside `area` and does
 * not intersect `verse` wins:
 *   1. below the verse, aligned to its left edge (shifted left as needed to fit);
 *   2. above the verse, likewise;
 *   3. to the right of the verse;
 *   4. to the left of the verse.
 * Otherwise the card docks inside the area: at the bottom, or at the top if the bottom would cover the
 * verse, using the area's width (capped at the card's width) and capped at the area's height.
 *
 * @param verse  the selected verse's client rect
 * @param popup  the card's natural size (border box)
 * @param area   the reader area the card may occupy (margins already applied)
 */
export function placeVersePopup(
  verse: PlacementRect,
  popup: PlacementSize,
  area: PlacementRect,
): VersePopupPlacement {
  const areaWidth = Math.max(0, area.right - area.left);
  const areaHeight = Math.max(0, area.bottom - area.top);
  const alignedLeft = clamp(verse.left, area.left, area.right - popup.width);
  const besideTop = clamp(verse.top, area.top, area.bottom - popup.height);

  const candidates: PlacementRect[] = [
    box(verse.bottom + VERSE_GAP, alignedLeft, popup),
    box(verse.top - VERSE_GAP - popup.height, alignedLeft, popup),
    box(besideTop, verse.right + VERSE_GAP, popup),
    box(besideTop, verse.left - VERSE_GAP - popup.width, popup),
  ];
  for (const c of candidates) {
    if (inside(c, area) && !intersects(c, verse)) return { top: c.top, left: c.left, docked: false };
  }

  // Docked fallback.
  const width = Math.min(popup.width, areaWidth);
  const height = Math.min(popup.height, areaHeight);
  const left = clamp(verse.left, area.left, area.right - width);
  const docked = (top: number, h: number): VersePopupPlacement => ({
    top,
    left,
    docked: true,
    width,
    maxHeight: h,
  });

  const bottomTop = area.bottom - height;
  if (!intersects(box(bottomTop, left, { width, height }), verse)) return docked(bottomTop, height);
  if (!intersects(box(area.top, left, { width, height }), verse)) return docked(area.top, height);

  // Both ends cover the verse at full height: shrink into the larger gap beside it, if that is usable.
  const below = area.bottom - Math.max(area.top, verse.bottom + VERSE_GAP);
  const above = Math.min(area.bottom, verse.top - VERSE_GAP) - area.top;
  if (Math.max(below, above) >= Math.min(height, DOCK_MIN_HEIGHT)) {
    return below >= above
      ? docked(area.bottom - Math.min(height, below), Math.min(height, below))
      : docked(area.top, Math.min(height, above));
  }
  // The verse fills the area: covering part of it can't be avoided.
  return docked(bottomTop, height);
}

// ── DOM inputs ──────────────────────────────────────────────────────────────────

/**
 * The reader area the card may occupy, in client coordinates: the viewport minus the side pane (at its
 * final width and side, since the pane's width animates), minus the top bar and the taskbar, inset by
 * AREA_MARGIN. Chrome bars count while rendered, even when slid away, so the card doesn't jump as they
 * hide and show.
 */
export function measureReaderArea(biblePane: HTMLElement | null): PlacementRect {
  let left = 0;
  let right = window.innerWidth;
  let top = 0;
  let bottom = window.innerHeight;

  const contentArea = biblePane?.parentElement;
  const side = contentArea?.querySelector<HTMLElement>('.side-pane.open');
  // On small screens the open pane is a full-screen overlay (position: fixed); it isn't beside the reader.
  if (contentArea && side && getComputedStyle(side).position !== 'fixed') {
    const areaRect = contentArea.getBoundingClientRect();
    const raw = getComputedStyle(document.documentElement).getPropertyValue('--side-width').trim() || '38%';
    const paneWidth = Math.max(
      220, // .side-pane.open min-width
      raw.endsWith('%') ? (areaRect.width * parseFloat(raw)) / 100 : parseFloat(raw) || 0,
    );
    if (contentArea.classList.contains('side-pane-right')) right = Math.min(right, areaRect.right - paneWidth);
    else left = Math.max(left, areaRect.left + paneWidth);
  }

  // offsetTop/offsetHeight ignore the bars' slide-away transforms.
  const topbar = document.querySelector<HTMLElement>('.topbar');
  if (topbar && topbar.offsetHeight > 0) top = Math.max(top, topbar.offsetTop + topbar.offsetHeight);
  const taskbar = document.querySelector<HTMLElement>('.taskbar');
  if (taskbar && taskbar.offsetHeight > 0) bottom = Math.min(bottom, taskbar.offsetTop);

  return {
    top: top + AREA_MARGIN,
    left: left + AREA_MARGIN,
    right: right - AREA_MARGIN,
    bottom: bottom - AREA_MARGIN,
  };
}

/** The card's natural border-box size, measured with any docked sizing temporarily removed. */
export function measurePopup(el: HTMLElement): PlacementSize {
  const { width, maxHeight } = el.style;
  const wasDocked = el.classList.contains(DOCKED_CLASS);
  el.style.width = '';
  el.style.maxHeight = '';
  el.classList.remove(DOCKED_CLASS);
  const size = {
    width: el.offsetWidth,
    // scrollHeight is the content's full height even when max-height clips it; add the borders back.
    height: el.scrollHeight + (el.offsetHeight - el.clientHeight),
  };
  el.style.width = width;
  el.style.maxHeight = maxHeight;
  if (wasDocked) el.classList.add(DOCKED_CLASS);
  return size;
}

export function samePlacement(a: VersePopupPlacement | null, b: VersePopupPlacement | null): boolean {
  if (a === b) return true;
  if (!a || !b) return false;
  return (
    a.top === b.top &&
    a.left === b.left &&
    a.docked === b.docked &&
    a.width === b.width &&
    a.maxHeight === b.maxHeight
  );
}
