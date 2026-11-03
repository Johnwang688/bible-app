// Sol GAPS review round 2 (orchestrator-owned): a counterexample, kept as a regression test.
/*
Read-only review at 7191389528b755d46ebd6fadcaa23234a8e2236c.
Tests executed in memory; no repository edits or Playwright runs.

Actual check output:
Existing regression suites: 3 passed; tests: 13 passed.
Typecheck and lint: exit 0, no output.
Extended run: Test Suites: 4 failed, 4 total
              Tests:       31 failed, 31 total
The 29 existing draft/VerseSheet tests reported:
"Unable to locate attached view in the native tree"
at useCollapsingHeader.ts:39, animation.start().

This counterexample:
Expected number of calls: 0
Received number of calls: 1
*/
import { act, render } from '@testing-library/react-native';
import { useState } from 'react';
import { Platform } from 'react-native';

import { useEscapeKey } from '../escapeStack';

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

function press(type: 'keydown' | 'keyup') {
  const event = {
    key: 'Escape',
    repeat: false,
    isComposing: false,
    defaultPrevented: false,
    target: null,
    preventDefault: jest.fn(),
    stopImmediatePropagation: jest.fn(),
  };
  for (const listener of [...(listeners.get(type) ?? [])]) {
    listener(event as unknown as KeyboardEvent);
  }
  return event;
}

it('dismissing the last registered modal does not give its keyup to the foreign modal underneath', async () => {
  const foreignDismiss = jest.fn();
  const foreign = {
    isConnected: true,
    getClientRects: () => [{}],
    querySelector: () => null,
  };
  const own = {
    isConnected: true,
    getClientRects: () => [{}],
    querySelector: (selector: string) =>
      selector === '[data-testid="own-sheet"]' ? {} : null,
  };
  modals = [foreign, own];

  function Sheet({ dismiss }: { dismiss(): void }) {
    useEscapeKey(dismiss, { modalTestID: 'own-sheet' });
    return null;
  }
  function App() {
    const [open, setOpen] = useState(true);
    return open ? <Sheet dismiss={() => {
      modals = [foreign];
      setOpen(false);
    }} /> : null;
  }

  const ui = await render(<App />);
  try {
    await act(async () => { press('keydown'); });
    const release = press('keyup');
    // RN-web's now-active lower foreign Modal handles keyup unless capture stops it.
    if (release.stopImmediatePropagation.mock.calls.length === 0) foreignDismiss();
    expect(foreignDismiss).not.toHaveBeenCalled();
  } finally {
    await ui.unmount();
  }
});
