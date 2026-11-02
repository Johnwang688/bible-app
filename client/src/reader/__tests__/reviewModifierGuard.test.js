// Verifier round 5 on the reader UI (GPT-6.1 Sol): a mutant-killing regression test. Orchestrator-owned.
const { act, renderHook } = require('@testing-library/react-native');
const { Platform } = require('react-native');
const { useArrowKeys } = require('../components/useArrowKeys');

it('ignores every modified arrow key', async () => {
  const oldDoc = Object.getOwnPropertyDescriptor(globalThis, 'document');
  const listeners = new Set();

  Object.defineProperty(globalThis, 'document', {
    configurable: true,
    value: {
      activeElement: null,
      addEventListener(type, callback) {
        if (type === 'keydown') listeners.add(callback);
      },
      removeEventListener(type, callback) {
        if (type === 'keydown') listeners.delete(callback);
      },
    },
  });

  const platform = jest.replaceProperty(Platform, 'OS', 'web');
  const onNext = jest.fn();
  const onPrev = jest.fn();
  let view;

  try {
    view = await renderHook(() =>
      useArrowKeys({ onNext, onPrev, disabled: false }),
    );

    for (const modifier of ['ctrlKey', 'metaKey', 'altKey', 'shiftKey']) {
      for (const key of ['ArrowRight', 'ArrowLeft']) {
        await act(async () => {
          for (const listener of listeners) {
            listener({ key, target: null, [modifier]: true });
          }
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
