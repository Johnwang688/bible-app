import { act, renderHook } from '@testing-library/react-native';
import { Dimensions, Platform } from 'react-native';

import { useReaderScrollKeys } from '../components/useReaderScrollKeys';

const keyEvent = (key: string, extra = {}) => ({ key, ctrlKey: false, altKey: false, metaKey: false, shiftKey: false, defaultPrevented: false, isComposing: false, target: null, preventDefault: jest.fn(), ...extra }) as unknown as KeyboardEvent;

async function harness(width = 1440, os: 'web' | 'ios' = 'web') {
  const platform = jest.replaceProperty(Platform, 'OS', os);
  const size = Dimensions.get('window');
  Dimensions.set({ window: { width, height: 900, scale: 1, fontScale: 1 } });
  const original = Object.getOwnPropertyDescriptor(globalThis, 'document');
  const node = { scrollTop: 1000, clientHeight: 1000, scrollHeight: 5000 };
  const body = { id: '' } as Element;
  let active: Element | null = body;
  let modal = false;
  let listener: ((event: KeyboardEvent) => void) | undefined;
  const add = jest.fn((_: string, fn: typeof listener) => { listener = fn; });
  const remove = jest.fn();
  const doc = { body, get activeElement() { return active; }, querySelectorAll: () => modal ? [{ getClientRects: () => [{}] }] : [], addEventListener: add, removeEventListener: remove };
  Object.defineProperty(globalThis, 'document', { configurable: true, value: doc });
  const ref = { current: { getScrollableNode: () => node } } as unknown as Parameters<typeof useReaderScrollKeys>[0];
  const hook = await renderHook<void, { enabled: boolean }>(({ enabled }) => useReaderScrollKeys(ref, enabled), { initialProps: { enabled: true } });
  return {
    node, body, add, remove, hook,
    focus(value: Element | null) { active = value; },
    modal(value: boolean) { modal = value; },
    async press(event: KeyboardEvent) { await act(() => listener?.(event)); },
    async cleanup() {
      await hook.unmount(); platform.restore(); Dimensions.set({ window: size });
      if (original) Object.defineProperty(globalThis, 'document', original); else Reflect.deleteProperty(globalThis, 'document');
    },
  };
}

it.each([
  ['PageDown', false, 1900], ['PageUp', false, 100], [' ', false, 1900], [' ', true, 100],
  ['Home', false, 0], ['End', false, 4000], ['ArrowDown', false, 1040], ['ArrowUp', false, 960],
] as const)('scrolls %s (shift=%s) by the specified amount without moving focus', async (key, shiftKey, expected) => {
  const h = await harness();
  try {
    const event = keyEvent(key, { shiftKey }); await h.press(event);
    expect(h.node.scrollTop).toBe(expected); expect(event.preventDefault).toHaveBeenCalledTimes(1);
    expect(document.activeElement).toBe(h.body);
  } finally { await h.cleanup(); }
});

it.each([{ ctrlKey: true }, { altKey: true }, { metaKey: true }, { defaultPrevented: true }, { isComposing: true }, { key: 'ArrowRight' }])('leaves modified, handled, composing and other keys alone: %j', async (extra) => {
  const h = await harness();
  try {
    const event = keyEvent('PageDown', extra); await h.press(event);
    expect(h.node.scrollTop).toBe(1000); expect(event.preventDefault).not.toHaveBeenCalled();
  } finally { await h.cleanup(); }
});

it('accepts body, null or main focus and refuses every other focus, including dock and fields', async () => {
  const h = await harness();
  try {
    for (const focus of [null, { id: 'main-content' } as Element, h.body]) {
      h.focus(focus); h.node.scrollTop = 1000; await h.press(keyEvent('ArrowDown')); expect(h.node.scrollTop).toBe(1040);
    }
    for (const id of ['note-input', 'verse-sheet', 'reader-settings-button', 'another-element']) {
      h.focus({ id } as Element); const event = keyEvent('PageDown'); await h.press(event);
      expect(event.preventDefault).not.toHaveBeenCalled();
    }
    h.focus(h.body);
    const event = keyEvent('PageDown', { target: { closest: () => ({}) } }); await h.press(event);
    expect(event.preventDefault).not.toHaveBeenCalled();
  } finally { await h.cleanup(); }
});

it('refuses modal or inactive-reader keys and cleans up the listener', async () => {
  const h = await harness();
  try {
    h.modal(true); const covered = keyEvent('PageDown'); await h.press(covered); expect(covered.preventDefault).not.toHaveBeenCalled();
    h.modal(false); await h.hook.rerender({ enabled: false });
    const inactive = keyEvent('PageDown'); await h.press(inactive); expect(inactive.preventDefault).not.toHaveBeenCalled();
    await h.hook.rerender({ enabled: true }); await h.press(keyEvent('ArrowDown')); expect(h.node.scrollTop).toBe(1040);
  } finally { await h.cleanup(); }
  expect(h.remove).toHaveBeenCalledWith('keydown', expect.any(Function));
});

it.each([[767, 'web'], [1440, 'ios']] as const)('does not subscribe at %s on %s', async (width, os) => {
  const h = await harness(width, os);
  try { expect(h.add).not.toHaveBeenCalled(); } finally { await h.cleanup(); }
});
