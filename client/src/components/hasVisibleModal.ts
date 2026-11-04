/** Shared keyboard guard: hidden or detached modal elements do not block shortcuts. */
export function hasVisibleModal(doc: Pick<Document, 'querySelectorAll'>): boolean {
  return Array.from(doc.querySelectorAll('[aria-modal="true"]')).some((node) => node.getClientRects().length > 0);
}
