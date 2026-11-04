// Escape on the web: one stack for the whole app, so one press is handled once, by the topmost layer.
//
// Every layer that closes or steps back on Escape (each modal sheet, the non-modal verse sheet, the search and
// entity screens) registers here instead of adding its own `document` listener. Before the stack, each layer
// listened by itself and they disagreed: React Native Web's Modal closes on the Escape *keyup*, a sheet under it
// on the keydown, a screen in the capture phase, and one press could close two layers, or a press that another
// modal took could still close the sheet under it (R-4's goal sheet).
//
// The rules:
// - Layers stack in the order they first render: an earlier mount below a later one, and a parent below the
//   children it mounts with (React runs a child's effects before its parent's, so effect order would put a sheet
//   that opens with its screen under that screen). A layer can be disabled (an unfocused screen, a covered sheet)
//   without losing its place; the top enabled layer gets the press.
// - Escape is handled on keydown only. The keyup that follows a handled keydown is swallowed, so no keyup listener
//   below (React Native Web's Modal) acts on the same press. `SheetModal` gives its Modal no Escape handler on the
//   web; Android's back button still reaches `onRequestClose`.
// - A modal the stack doesn't know about (a native `<dialog>`, a third-party one, a Modal that hasn't joined) owns
//   the press while it is open above the top layer, or holds the focus: the stack then does nothing and leaves the
//   event alone. A closed dialog still in the page is not open, so it never blocks.
// - A keydown someone already handled (`defaultPrevented`), a repeat and an IME composition are ignored. The
//   listener is on `document` in the capture phase, because React Native Web's TextInput stops Escape from
//   bubbling; a listener that stops the event at `window` (capture) keeps it from reaching the stack at all.
//
// Native: a no-op. Android's back button has its own stack (`BackHandler`), and Modals get it as onRequestClose.
import { useLayoutEffect, useRef, useState } from 'react';
import { Platform } from 'react-native';

interface Layer {
  /** Its place in the stack: the order of first render. */
  order: number;
  /** False while the layer is not the one to take Escape (covered, or its screen is not focused). */
  enabled: boolean;
  /** For a modal layer: a test ID inside its own modal, which tells that modal apart from foreign ones. */
  modalTestID: string | null;
  handle(): void;
}

/** Sorted by `order`, bottom first. */
const layers: Layer[] = [];
let nextOrder = 0;
let swallowKeyup = false;
/** The document the listeners are on: while any layer is registered, and keyup until a swallowed keyup is in. */
let listeningOn: Document | null = null;
let keydownOn = false;

const MODAL_SELECTOR = '[aria-modal="true"], dialog';

/** An element that is a modal and showing now: an open modal dialog, or an aria-modal element on screen. */
function isOpenModal(el: Element): boolean {
  if (!el.isConnected) return false;
  if (typeof HTMLDialogElement !== 'undefined' && el instanceof HTMLDialogElement) {
    if (!el.open) return false;
    if (el.getAttribute('aria-modal') !== 'true' && !safeMatches(el, ':modal')) return false;
  }
  return el.getClientRects().length > 0;
}

function safeMatches(el: Element, selector: string): boolean {
  try {
    return el.matches(selector);
  } catch {
    return false;
  }
}

function openModals(): Element[] {
  if (typeof document.querySelectorAll !== 'function') return [];
  return Array.from(document.querySelectorAll(MODAL_SELECTOR)).filter(isOpenModal);
}

function holds(modal: Element, testID: string): boolean {
  const id = typeof CSS !== 'undefined' && CSS.escape ? CSS.escape(testID) : testID;
  return safeMatches(modal, `[data-testid="${id}"]`) || modal.querySelector(`[data-testid="${id}"]`) !== null;
}

/** The layer that should take this press, or null when the press belongs to someone else (or no one). */
function layerFor(event: KeyboardEvent): Layer | null {
  let top: Layer | undefined;
  for (let i = layers.length - 1; i >= 0; i--) {
    if (layers[i]!.enabled) {
      top = layers[i];
      break;
    }
  }
  if (!top) return null;

  const modals = openModals();
  let own: Element | null = null;
  if (top.modalTestID !== null) {
    const testID = top.modalTestID;
    own = modals.filter((m) => holds(m, testID)).pop() ?? null;
    // Its modal is not on screen (yet, or any more): nothing of this layer's to close.
    if (!own) return null;
  }
  // Any open modal after the top layer's own in the page (for a non-modal layer: any at all) is above it.
  const above = own ? modals.slice(modals.indexOf(own) + 1) : modals;
  if (above.length > 0) return null;

  // Focus inside an open modal that no layer owns: that modal's press, wherever it sits in the page.
  const target = typeof Element !== 'undefined' && event.target instanceof Element ? event.target : null;
  const targetModal = target?.closest(MODAL_SELECTOR) ?? null;
  if (targetModal && targetModal !== own && isOpenModal(targetModal)) {
    const owned = layers.some((l) => l.modalTestID !== null && holds(targetModal, l.modalTestID));
    if (!owned) return null;
  }
  return top;
}

function onKeyDown(event: KeyboardEvent) {
  // A held key repeats: that is still the press whose keyup may be swallowed, so a repeat changes nothing.
  if (event.key !== 'Escape' || event.repeat) return;
  swallowKeyup = false;
  if (event.isComposing || event.defaultPrevented) return;
  const layer = layerFor(event);
  if (!layer) return;
  event.preventDefault();
  event.stopImmediatePropagation();
  swallowKeyup = true;
  layer.handle();
}

function onKeyUp(event: KeyboardEvent) {
  if (event.key !== 'Escape' || !swallowKeyup) return;
  swallowKeyup = false;
  event.stopImmediatePropagation();
  unlistenIfEmpty();
}

function stopListening() {
  if (!listeningOn) return;
  if (keydownOn) listeningOn.removeEventListener('keydown', onKeyDown, true);
  listeningOn.removeEventListener('keyup', onKeyUp, true);
  listeningOn = null;
  keydownOn = false;
  swallowKeyup = false;
}

function listen() {
  // Listeners left on another document (a test's fake one) are dropped first.
  if (listeningOn && listeningOn !== document) stopListening();
  if (!listeningOn) {
    listeningOn = document;
    listeningOn.addEventListener('keyup', onKeyUp, true);
  }
  if (!keydownOn) {
    listeningOn.addEventListener('keydown', onKeyDown, true);
    keydownOn = true;
  }
}

/**
 * With no layer left, nothing listens (and a later layer listens on the document of its own time). Except: when the
 * last layer closed on a press, the keyup listener stays until that press's keyup is swallowed, or a modal outside
 * the stack under it would act on it too.
 */
function unlistenIfEmpty() {
  if (layers.length > 0 || !listeningOn) return;
  if (keydownOn) {
    listeningOn.removeEventListener('keydown', onKeyDown, true);
    keydownOn = false;
  }
  if (!swallowKeyup) stopListening();
}

/**
 * Joins the Escape stack (web only) for as long as the component is mounted. `handle` is called for an Escape
 * press while this is the top enabled layer; it always sees the latest props. `modalTestID` marks a modal layer:
 * a test ID rendered inside its own modal.
 */
export function useEscapeKey(handle: () => void, { enabled = true, modalTestID = null }: { enabled?: boolean; modalTestID?: string | null } = {}): void {
  // Taken in render, which runs parents before children (see the header).
  const [order] = useState(() => nextOrder++);
  const layer = useRef<Layer | null>(null);
  const latest = useRef(handle);
  // The layout phase: a layer that opens or closes is in place before another key can arrive.
  useLayoutEffect(() => {
    latest.current = handle;
    if (layer.current) {
      layer.current.enabled = enabled;
      layer.current.modalTestID = modalTestID;
    }
  });
  useLayoutEffect(() => {
    if (Platform.OS !== 'web' || typeof document === 'undefined') return;
    const mine: Layer = { order, enabled, modalTestID, handle: () => latest.current() };
    layer.current = mine;
    const above = layers.findIndex((l) => l.order > order);
    layers.splice(above === -1 ? layers.length : above, 0, mine);
    listen();
    return () => {
      const i = layers.indexOf(mine);
      if (i >= 0) layers.splice(i, 1);
      layer.current = null;
      unlistenIfEmpty();
    };
    // Registered once per mount, at the place its first render gave it. `enabled` and `modalTestID` are kept
    // current by the effect above.
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);
}

/** Test-only: the number of layers registered now. */
export function escapeLayerCount(): number {
  return layers.length;
}
