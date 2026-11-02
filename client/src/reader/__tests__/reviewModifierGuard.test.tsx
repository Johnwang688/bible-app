// Verifier round 5 on the reader UI (GPT-6.1 Sol): a mutant-killing regression test. Orchestrator-owned.
import { act, renderHook } from '@testing-library/react-native';
import { Platform } from 'react-native';

import { useArrowKeys } from '../components/useArrowKeys';

it('ignores every modified arrow key', async () => {
  const oldDoc = Object.getOwnPropertyDescriptor(globalThis, 'document');
  const listeners = new Set<(e: KeyboardEvent) => void>();
  Object.defineProperty(globalThis, 'document', {
    configurable: true,
    value: {
      activeElement: null,
      addEventListener(type: string, cb: (e: KeyboardEvent) => void) {
        if (type === 'keydown') listeners.add(cb);
      },
      removeEventListener(type: string, cb: (e: KeyboardEvent) => void) {
        if (type === 'keydown') listeners.delete(cb);
      },
    },
  });
  const platform = jest.replaceProperty(Platform, 'OS', 'web');
  const onNext = jest.fn();
  const onPrev = jest.fn();
  let view: Awaited<ReturnType<typeof renderHook>> | undefined;
  try {
    view = await renderHook(() => useArrowKeys({ onNext, onPrev, disabled: false }));
    for (const modifier of ['ctrlKey', 'metaKey', 'altKey', 'shiftKey']) {
      for (const key of ['ArrowRight', 'ArrowLeft']) {
        await act(async () => {
          for (const listener of listeners) listener({ key, target: null, [modifier]: true } as unknown as KeyboardEvent);
        });
      }
    }
    expect(onNext).not.toHaveBeenCalled();
    expect(onPrev).not.toHaveBeenCalled();
  } finally {
    await view?.unmount();
    platform.restore();
    if (oldDoc) Object.defineProperty(globalThis, 'document', oldDoc);
    else Reflect.deleteProperty(globalThis, 'document');
  }
});
