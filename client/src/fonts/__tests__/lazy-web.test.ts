// Verifier round 1 on the orchestrator's code (GPT-6.1 Sol): the Chinese web font load.
// Orchestrator-owned acceptance test; do not edit.
import { ensureFont, NOTO_SERIF_SC_CSS, resetLazyFontsForTesting } from '../lazy';

// Hoisted above the import by babel-jest.
jest.mock('react-native', () => ({ Platform: { OS: 'web' } }));
jest.mock('expo-font', () => ({ loadAsync: jest.fn() }));

interface FakeLink {
  rel: string;
  href: string;
  onload: (() => void) | null;
  onerror: (() => void) | null;
  addEventListener: (type: string, fn: () => void) => void;
  remove: () => void;
}

let appended: FakeLink[];
let previous: PropertyDescriptor | undefined;

function makeLink(): FakeLink {
  const listeners: Record<string, (() => void)[]> = {};
  const link: FakeLink = {
    rel: '',
    href: '',
    onload: null,
    onerror: null,
    addEventListener: (type, fn) => {
      (listeners[type] ??= []).push(fn);
    },
    remove: jest.fn(() => {
      appended = appended.filter((l) => l !== link);
    }),
  };
  Object.defineProperty(link, 'fire', {
    value: (type: 'load' | 'error') => {
      (type === 'load' ? link.onload : link.onerror)?.();
      for (const fn of listeners[type] ?? []) fn();
    },
  });
  return link;
}

const fire = (link: FakeLink, type: 'load' | 'error') => (link as unknown as { fire: (t: string) => void }).fire(type);

beforeEach(() => {
  appended = [];
  previous = Object.getOwnPropertyDescriptor(globalThis, 'document');
  Object.defineProperty(globalThis, 'document', {
    configurable: true,
    value: {
      querySelector: () => null,
      createElement: () => makeLink(),
      head: { appendChild: (l: FakeLink) => appended.push(l) },
    },
  });
  resetLazyFontsForTesting();
});

afterEach(() => {
  resetLazyFontsForTesting();
  if (previous) Object.defineProperty(globalThis, 'document', previous);
  else Reflect.deleteProperty(globalThis, 'document');
});

const flush = async () => {
  for (let i = 0; i < 5; i++) await Promise.resolve();
};

it('stays pending until the stylesheet loads, then resolves', async () => {
  let state = 'pending';
  void ensureFont('chineseScripture').then(
    () => (state = 'resolved'),
    () => (state = 'rejected'),
  );
  await flush();
  expect(state).toBe('pending');
  expect(appended).toHaveLength(1);
  expect(appended[0]!.href).toBe(NOTO_SERIF_SC_CSS);
  fire(appended[0]!, 'load');
  await flush();
  expect(state).toBe('resolved');
});

it('shares one load between concurrent callers', async () => {
  const a = ensureFont('chineseScripture');
  const b = ensureFont('chineseScripture');
  await flush();
  expect(appended).toHaveLength(1);
  fire(appended[0]!, 'load');
  await expect(Promise.all([a, b])).resolves.toBeDefined();
});

it('rejects when the stylesheet fails, and the next call retries', async () => {
  const first = ensureFont('chineseScripture');
  await flush();
  fire(appended[0]!, 'error');
  await expect(first).rejects.toBeDefined();
  const second = ensureFont('chineseScripture');
  await flush();
  const latest = appended[appended.length - 1]!;
  expect(latest.href).toBe(NOTO_SERIF_SC_CSS);
  fire(latest, 'load');
  await expect(second).resolves.toBeUndefined();
});
