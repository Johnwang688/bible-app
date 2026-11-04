import { act, renderHook } from '@testing-library/react-native';
import { Platform } from 'react-native';

import { searchShortcutAllowed, useSearchShortcut } from '../useSearchShortcut';

const event = (extra = {}) => ({ key: '/', defaultPrevented: false, repeat: false, isComposing: false, altKey: false, ctrlKey: false, metaKey: false, ...extra }) as KeyboardEvent;
const doc = (editing = false, modal = false) => ({
  activeElement: { closest: jest.fn(() => editing ? {} : null) },
  querySelectorAll: () => modal ? [{ getClientRects: () => [{}] }] : [],
}) as unknown as Document;

it.each([{ key: '/' }, { key: 'k', ctrlKey: true }, { key: 'K', metaKey: true }])('accepts a search shortcut %j', (extra) => {
  expect(searchShortcutAllowed(event(extra), doc())).toBe(true);
});

it.each([{ key: 'k' }, { key: '/', ctrlKey: true }, { defaultPrevented: true }, { repeat: true }, { isComposing: true }, { altKey: true }])('leaves other keys and handled presses alone %j', (extra) => {
  expect(searchShortcutAllowed(event(extra), doc())).toBe(false);
});

it('guards inputs, textareas, inherited contenteditable and open modal dialogs', () => {
  const editing = doc(true);
  expect(searchShortcutAllowed(event(), editing)).toBe(false);
  expect(editing.activeElement?.closest).toHaveBeenCalledWith('input, textarea, [contenteditable]:not([contenteditable="false"])');
  expect(searchShortcutAllowed(event(), doc(false, true))).toBe(false);
  const closed = { ...doc(), querySelectorAll: () => [{ getClientRects: () => [] }] } as unknown as Document;
  expect(searchShortcutAllowed(event(), closed)).toBe(true);
});

it('registers only with a visible web rail, prevents default and removes its listener', async () => {
  const os = jest.replaceProperty(Platform, 'OS', 'web');
  const previous = Object.getOwnPropertyDescriptor(globalThis, 'document');
  let listener: ((e: KeyboardEvent) => void) | undefined;
  const addEventListener = jest.fn((_: string, fn: typeof listener) => { listener = fn; });
  const removeEventListener = jest.fn();
  Object.defineProperty(globalThis, 'document', { configurable: true, value: { ...doc(), addEventListener, removeEventListener } });
  try {
    const open = jest.fn();
    const hook = await renderHook<void, { enabled: boolean }>(({ enabled }) => useSearchShortcut(enabled, open), { initialProps: { enabled: false } });
    expect(addEventListener).not.toHaveBeenCalled();
    await hook.rerender({ enabled: true });
    const preventDefault = jest.fn();
    await act(() => listener?.(event({ preventDefault })));
    expect(preventDefault).toHaveBeenCalledTimes(1);
    expect(open).toHaveBeenCalledTimes(1);
    await hook.unmount();
    expect(removeEventListener).toHaveBeenCalledWith('keydown', listener);
  } finally {
    os.restore();
    if (previous) Object.defineProperty(globalThis, 'document', previous);
    else Reflect.deleteProperty(globalThis, 'document');
  }
});
