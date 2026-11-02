// Web only: whether an Escape belongs to a modal showing above the goal sheet's own Modal.

const MODAL = '[aria-modal="true"]';

/** True when a modal element is actually on screen: an open dialog, laid out, and not hidden. */
function isShowing(el: Element): boolean {
  if (el instanceof HTMLDialogElement && !el.open) return false;
  if (el.getClientRects().length === 0) return false;
  if (el.closest('[hidden], [aria-hidden="true"]')) return false;
  if (typeof el.checkVisibility === 'function') return el.checkVisibility({ visibilityProperty: true });
  const style = getComputedStyle(el);
  return style.display !== 'none' && style.visibility !== 'hidden';
}

/**
 * True when an Escape aimed at `target` is for another modal: a showing modal comes after the one holding
 * `[data-testid="<ownTestID>"]` in document order, or the target is inside a showing modal that is not that one.
 */
export function escapeIsForModalAbove(ownTestID: string, target: EventTarget | null): boolean {
  const modals = Array.from(document.querySelectorAll(MODAL));
  const own = modals.find((m) => m.querySelector(`[data-testid="${ownTestID}"]`));
  if (own !== undefined && modals.slice(modals.indexOf(own) + 1).some(isShowing)) return true;
  const targetModal = target instanceof Element ? target.closest(MODAL) : null;
  return targetModal !== null && targetModal !== own && isShowing(targetModal);
}
