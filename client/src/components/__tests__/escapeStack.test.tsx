// The shared Escape stack (GAPS, board 11-03): one press is handled once, by the top enabled layer, on keydown;
// a modal the stack doesn't own takes the press while it is open above or holds the focus. The real browser cases
// are the e2e specs (reviewR4*, reviewR5Escape, reader); this pins the rules on a small fake page, because the
// React Native jest preset cannot run under jsdom.
import { act, renderHook } from '@testing-library/react-native';
import { Platform } from 'react-native';

import { escapeLayerCount, useEscapeKey } from '../escapeStack';

/** Just enough of an element: a modal flag, a shown flag, test IDs inside, and a parent. */
class FakeElement {
  parent: FakeElement | null = null;
  constructor(
    public modal = false,
    public shown = true,
    public testIDs: string[] = [],
  ) {}
  get isConnected(): boolean {
    return page.includes(this) || (this.parent?.isConnected ?? false);
  }
  getClientRects() {
    return this.shown ? [{}] : [];
  }
  getAttribute(name: string) {
    return name === 'aria-modal' && this.modal ? 'true' : null;
  }
  querySelector(selector: string) {
    const id = /data-testid="([^"]+)"/.exec(selector)?.[1];
    return id && this.testIDs.includes(id) ? {} : null;
  }
  closest(): FakeElement | null {
    for (let el: FakeElement | null = this; el; el = el.parent) if (el.modal) return el;
    return null;
  }
}

/** The page's top-level elements, in document order. */
let page: FakeElement[] = [];
const listeners = new Map<string, Set<(e: KeyboardEvent) => void>>();

/** A new fake document per test, as a page load would give (the stack drops listeners left on an old one). */
const makeDocument = () => ({
  addEventListener: jest.fn((type: string, fn: (e: KeyboardEvent) => void, capture?: boolean) => {
    expect(capture).toBe(true);
    if (!listeners.has(type)) listeners.set(type, new Set());
    listeners.get(type)!.add(fn);
  }),
  removeEventListener: jest.fn((type: string, fn: (e: KeyboardEvent) => void) => listeners.get(type)?.delete(fn)),
  querySelectorAll: () => page.filter((el) => el.modal),
});

let os: { restore(): void };
let previousDocument: PropertyDescriptor | undefined;
let previousElement: PropertyDescriptor | undefined;
beforeEach(() => {
  page = [];
  listeners.clear();
  os = jest.replaceProperty(Platform, 'OS', 'web');
  previousDocument = Object.getOwnPropertyDescriptor(globalThis, 'document');
  previousElement = Object.getOwnPropertyDescriptor(globalThis, 'Element');
  Object.defineProperty(globalThis, 'document', { configurable: true, value: makeDocument() });
  Object.defineProperty(globalThis, 'Element', { configurable: true, value: FakeElement });
});
afterEach(() => {
  os.restore();
  for (const [name, previous] of [['document', previousDocument], ['Element', previousElement]] as const) {
    if (previous) Object.defineProperty(globalThis, name, previous);
    else Reflect.deleteProperty(globalThis, name);
  }
});

interface Pressed {
  defaultPrevented: boolean;
  stopped: boolean;
}

/** Dispatches to the stack's capture listener the way the browser would; returns what the stack did to it. */
function press(type: 'keydown' | 'keyup' = 'keydown', init: { repeat?: boolean; isComposing?: boolean; defaultPrevented?: boolean; target?: FakeElement } = {}): Pressed {
  const result: Pressed = { defaultPrevented: init.defaultPrevented ?? false, stopped: false };
  const event = {
    key: 'Escape',
    repeat: init.repeat ?? false,
    isComposing: init.isComposing ?? false,
    get defaultPrevented() {
      return result.defaultPrevented;
    },
    target: init.target ?? null,
    preventDefault: () => (result.defaultPrevented = true),
    stopImmediatePropagation: () => (result.stopped = true),
  };
  for (const fn of listeners.get(type) ?? []) if (!result.stopped) fn(event as unknown as KeyboardEvent);
  return result;
}

function addModal(testID?: string): FakeElement {
  const el = new FakeElement(true, true, testID ? [testID] : []);
  page.push(el);
  return el;
}

async function layer(handle: jest.Mock, options?: Parameters<typeof useEscapeKey>[1]) {
  return renderHook((props: { enabled?: boolean }) => useEscapeKey(handle, { ...options, ...props }), { initialProps: {} });
}

describe('escape stack', () => {
  it('the last mounted layer takes the press, once, and stops it', async () => {
    const lower = jest.fn();
    const upper = jest.fn();
    const a = await layer(lower);
    const b = await layer(upper);
    expect(press()).toEqual({ defaultPrevented: true, stopped: true });
    expect(upper).toHaveBeenCalledTimes(1);
    expect(lower).not.toHaveBeenCalled();
    await b.unmount();
    press();
    expect(lower).toHaveBeenCalledTimes(1);
    await a.unmount();
    expect(escapeLayerCount()).toBe(0);
  });

  it('a disabled layer keeps its place but is skipped', async () => {
    const lower = jest.fn();
    const upper = jest.fn();
    const a = await layer(lower);
    const b = await layer(upper);
    await act(async () => b.rerender({ enabled: false }));
    press();
    expect(lower).toHaveBeenCalledTimes(1);
    await act(async () => b.rerender({ enabled: true }));
    press();
    expect(upper).toHaveBeenCalledTimes(1);
    expect(lower).toHaveBeenCalledTimes(1);
    await b.unmount();
    await a.unmount();
  });

  it('swallows the keyup of a handled press, and only that one', async () => {
    const a = await layer(jest.fn());
    press();
    expect(press('keyup').stopped).toBe(true);
    expect(press('keyup').stopped).toBe(false);
    // A press the stack leaves alone leaves its keyup alone too.
    addModal();
    press();
    expect(press('keyup').stopped).toBe(false);
    await a.unmount();
  });

  it('ignores a repeat, a composition and a press someone already handled, and leaves them alone', async () => {
    const handle = jest.fn();
    const a = await layer(handle);
    for (const init of [{ repeat: true }, { isComposing: true }, { defaultPrevented: true }]) {
      expect(press('keydown', init).stopped).toBe(false);
    }
    expect(handle).not.toHaveBeenCalled();
    await a.unmount();
  });

  it('a foreign modal open above a non-modal layer takes the press; once closed, it does not', async () => {
    const handle = jest.fn();
    const a = await layer(handle);
    const foreign = addModal();
    expect(press()).toEqual({ defaultPrevented: false, stopped: false });
    expect(handle).not.toHaveBeenCalled();
    foreign.shown = false; // a closed dialog left in the page
    press();
    expect(handle).toHaveBeenCalledTimes(1);
    await a.unmount();
  });

  it('a modal layer: its own modal is no obstacle, a later foreign one is, and so is focus in a foreign one', async () => {
    const handle = jest.fn();
    const own = addModal('goal-sheet');
    const inside = new FakeElement();
    inside.parent = own;
    const a = await layer(handle, { modalTestID: 'goal-sheet' });
    press('keydown', { target: inside });
    expect(handle).toHaveBeenCalledTimes(1);

    const above = addModal();
    press();
    expect(handle).toHaveBeenCalledTimes(1);
    page = page.filter((el) => el !== above);

    // A foreign modal earlier in the page (a native dialog in the top layer) that holds the focus.
    const earlier = new FakeElement(true);
    page.unshift(earlier);
    const button = new FakeElement();
    button.parent = earlier;
    press('keydown', { target: button });
    expect(handle).toHaveBeenCalledTimes(1);
    press();
    expect(handle).toHaveBeenCalledTimes(2);
    await a.unmount();
  });

  it('focus left in a lower layer’s modal does not stop the top layer', async () => {
    const lower = jest.fn();
    const upper = jest.fn();
    const lowerModal = addModal('book-picker');
    const field = new FakeElement();
    field.parent = lowerModal;
    const a = await layer(lower, { modalTestID: 'book-picker' });
    addModal('goal-sheet');
    const b = await layer(upper, { modalTestID: 'goal-sheet' });
    press('keydown', { target: field });
    expect(upper).toHaveBeenCalledTimes(1);
    expect(lower).not.toHaveBeenCalled();
    await b.unmount();
    await a.unmount();
  });

  it('a modal layer whose modal is not on screen has nothing to close, and blocks the layers below', async () => {
    const handle = jest.fn();
    const lower = jest.fn();
    const a = await layer(lower);
    const b = await layer(handle, { modalTestID: 'goal-sheet' });
    expect(press().stopped).toBe(false);
    expect(handle).not.toHaveBeenCalled();
    expect(lower).not.toHaveBeenCalled();
    await b.unmount();
    await a.unmount();
  });

  it('listens on the document only while a layer is registered', async () => {
    const a = await layer(jest.fn());
    const b = await layer(jest.fn());
    expect(listeners.get('keydown')?.size).toBe(1);
    expect(listeners.get('keyup')?.size).toBe(1);
    await b.unmount();
    expect(listeners.get('keydown')?.size).toBe(1);
    await a.unmount();
    expect(listeners.get('keydown')?.size).toBe(0);
    expect(listeners.get('keyup')?.size).toBe(0);
  });

  it('does nothing off the web', async () => {
    os.restore();
    os = jest.replaceProperty(Platform, 'OS', 'android');
    const handle = jest.fn();
    const a = await layer(handle);
    expect(escapeLayerCount()).toBe(0);
    expect(listeners.size).toBe(0);
    await a.unmount();
  });
});
