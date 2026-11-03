// Sol GAPS review round 1 (orchestrator-owned): a counterexample, kept as a regression test.
import { act, render } from '@testing-library/react-native';
import { Platform } from 'react-native';

import { useEscapeKey } from '../escapeStack';

type Key = {
  key: string;
  repeat: boolean;
  isComposing: boolean;
  defaultPrevented: boolean;
  target: null;
  preventDefault: jest.Mock;
  stopImmediatePropagation: jest.Mock;
};

const listeners = new Map<string, Set<(event: KeyboardEvent) => void>>();
let modals: unknown[] = [];
let previousDocument: PropertyDescriptor | undefined;
let os: ReturnType<typeof jest.replaceProperty>;

beforeEach(() => {
  listeners.clear();
  modals = [];
  os = jest.replaceProperty(Platform, 'OS', 'web');
  previousDocument = Object.getOwnPropertyDescriptor(globalThis, 'document');
  Object.defineProperty(globalThis, 'document', {
    configurable: true,
    value: {
      addEventListener(type: string, fn: (event: KeyboardEvent) => void) {
        if (!listeners.has(type)) listeners.set(type, new Set());
        listeners.get(type)!.add(fn);
      },
      removeEventListener(type: string, fn: (event: KeyboardEvent) => void) {
        listeners.get(type)?.delete(fn);
      },
      querySelectorAll: () => modals,
    },
  });
});

afterEach(() => {
  os.restore();
  if (previousDocument) {
    Object.defineProperty(globalThis, 'document', previousDocument);
  } else {
    Reflect.deleteProperty(globalThis, 'document');
  }
});

function press(type: 'keydown' | 'keyup', repeat = false): Key {
  const event: Key = {
    key: 'Escape',
    repeat,
    isComposing: false,
    defaultPrevented: false,
    target: null,
    preventDefault: jest.fn(),
    stopImmediatePropagation: jest.fn(),
  };
  for (const listener of listeners.get(type) ?? []) {
    listener(event as unknown as KeyboardEvent);
  }
  return event;
}

it('an initially open child modal receives Escape above its screen layer', async () => {
  const screenBack = jest.fn();
  const dismiss = jest.fn();
  modals = [{
    isConnected: true,
    getClientRects: () => [{}],
    querySelector: (selector: string) =>
      selector === '[data-testid="child-sheet"]' ? {} : null,
  }];

  function ChildSheet() {
    useEscapeKey(dismiss, { modalTestID: 'child-sheet' });
    return null;
  }

  function ScreenWithSheet() {
    useEscapeKey(screenBack);
    return <ChildSheet />;
  }

  const ui = await render(<ScreenWithSheet />);
  try {
    await act(async () => { press('keydown'); });
    expect(dismiss).toHaveBeenCalledTimes(1);
    expect(screenBack).not.toHaveBeenCalled();
  } finally {
    await ui.unmount();
  }
});

it('ignoring an auto-repeat preserves swallowing the original press keyup', async () => {
  const dismiss = jest.fn();

  function Layer() {
    useEscapeKey(dismiss);
    return null;
  }

  const ui = await render(<Layer />);
  try {
    press('keydown');
    press('keydown', true);
    const release = press('keyup');
    expect(dismiss).toHaveBeenCalledTimes(1);
    expect(release.stopImmediatePropagation).toHaveBeenCalledTimes(1);
  } finally {
    await ui.unmount();
  }
});
