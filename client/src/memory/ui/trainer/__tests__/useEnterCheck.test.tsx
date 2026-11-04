import { act, renderHook } from '@testing-library/react-native';
import { Dimensions, Platform } from 'react-native';

import { enterCheckAllowed, useEnterCheck } from '../useEnterCheck';

const event = (extra = {}) => ({ key: 'Enter', defaultPrevented: false, repeat: false, isComposing: false, ctrlKey: false, altKey: false, metaKey: false, shiftKey: false, target: null, ...extra }) as KeyboardEvent;
const element = (control: boolean) => ({ closest: jest.fn(() => control ? {} : null) }) as unknown as Element;

it('allows Enter on the page and headings', () => {
  expect(enterCheckAllowed(event(), null)).toBe(true);
  expect(enterCheckAllowed(event(), element(false))).toBe(true);
});

it.each([{ key: 'Escape' }, { repeat: true }, { defaultPrevented: true }, { isComposing: true }, { ctrlKey: true }, { metaKey: true }, { altKey: true }, { shiftKey: true }])('ignores handled, composing and modified keys: %j', (extra) => {
  expect(enterCheckAllowed(event(extra), null)).toBe(false);
});

it('leaves both focused controls and event targets alone', () => {
  const field = element(true);
  expect(enterCheckAllowed(event(), field)).toBe(false);
  expect(enterCheckAllowed(event({ target: field }), null)).toBe(false);
  const selector = (field.closest as jest.Mock).mock.calls[0][0] as string;
  for (const tag of ['input', 'textarea', 'select', 'button', 'a', '[contenteditable]', '[role="radio"]']) expect(selector).toContain(tag);
});

it('uses the current available action and removes the web listener', async () => {
  const os = jest.replaceProperty(Platform, 'OS', 'web');
  const size = Dimensions.get('window');
  Dimensions.set({ window: { width: 1440, height: 900, scale: 1, fontScale: 1 } });
  const previous = Object.getOwnPropertyDescriptor(globalThis, 'document');
  let listener: ((e: KeyboardEvent) => void) | undefined;
  const remove = jest.fn();
  Object.defineProperty(globalThis, 'document', { configurable: true, value: {
    activeElement: null, querySelectorAll: () => [],
    addEventListener: (_: string, fn: typeof listener) => { listener = fn; }, removeEventListener: remove,
  } });
  try {
    const first = jest.fn(); const current = jest.fn();
    const hook = await renderHook<void, { available: boolean; check: () => void }>(({ available, check }) => useEnterCheck(available, check), { initialProps: { available: false, check: first } });
    const preventDefault = jest.fn();
    await act(() => listener?.(event({ preventDefault })));
    expect(first).not.toHaveBeenCalled();
    await hook.rerender({ available: true, check: current });
    await act(() => listener?.(event({ preventDefault })));
    expect(current).toHaveBeenCalledTimes(1);
    expect(preventDefault).toHaveBeenCalledTimes(1);
    await hook.unmount();
    expect(remove).toHaveBeenCalledWith('keydown', listener);
  } finally {
    os.restore();
    Dimensions.set({ window: size });
    if (previous) Object.defineProperty(globalThis, 'document', previous);
    else Reflect.deleteProperty(globalThis, 'document');
  }
});

it('refuses Enter while a modal is visible and allows it after the modal disappears', () => {
  let visible = true;
  const modalDoc = { activeElement: null, querySelectorAll: () => visible ? [{ getClientRects: () => [{}] }] : [] } as unknown as Document;
  expect(enterCheckAllowed(event(), null, modalDoc)).toBe(false);
  visible = false;
  expect(enterCheckAllowed(event(), null, modalDoc)).toBe(true);
});
