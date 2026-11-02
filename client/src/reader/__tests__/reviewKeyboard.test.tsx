// Verifier round 1 on the reader UI (GPT-6.1 Sol). Orchestrator-owned; do not edit.
import { act, renderHook } from '@testing-library/react-native';
import { Platform } from 'react-native';

import { useArrowKeys } from '../components/useArrowKeys';

it('ignores arrows while a sheet is open and cleans up its listener', async () => {
  const oldDoc = Object.getOwnPropertyDescriptor(globalThis, 'document');
  const listeners = new Set<(e: KeyboardEvent) => void>();
  Object.defineProperty(globalThis, 'document', {
    configurable: true,
    value: {
      activeElement: null,
      addEventListener(name: string, cb: (e: KeyboardEvent) => void) {
        if (name === 'keydown') listeners.add(cb);
      },
      removeEventListener(name: string, cb: (e: KeyboardEvent) => void) {
        if (name === 'keydown') listeners.delete(cb);
      },
    },
  });

  const os = jest.replaceProperty(Platform, 'OS', 'web');
  const onNext = jest.fn();
  const onPrev = jest.fn();
  let view: Awaited<ReturnType<typeof renderHook>> | undefined;

  try {
    view = await renderHook(() =>
      useArrowKeys({ onNext, onPrev, disabled: true }),
    );
    expect(listeners.size).toBe(1);
    await act(async () => {
      for (const listener of listeners) {
        listener({ key: 'ArrowRight', target: null } as KeyboardEvent);
      }
    });
    expect(onNext).not.toHaveBeenCalled();
    expect(onPrev).not.toHaveBeenCalled();
  } finally {
    await view?.unmount();
    expect(listeners.size).toBe(0);
    os.restore();
    if (oldDoc) Object.defineProperty(globalThis, 'document', oldDoc);
    else Reflect.deleteProperty(globalThis, 'document');
  }
});
