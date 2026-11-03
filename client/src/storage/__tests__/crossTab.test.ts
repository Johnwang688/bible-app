// Other tabs (INT F2, GAPS 5): a write made in another tab reaches this tab's subscribers.
import { z } from 'zod';

import { createStorage, memoryBackend, otherTabWrites, type KeyValueBackend, type StorageKey } from '../storage';

const goalKey: StorageKey<number> = { key: 'goal', version: 1, schema: z.number(), fallback: 10 };
const nameKey: StorageKey<string> = { key: 'name', version: 1, schema: z.string(), fallback: '' };

/** A backend shared by two "tabs", each told of the other's writes the way the browser does. */
function sharedBackend() {
  const inner = memoryBackend();
  const external = new Set<(key: string | null) => void>();
  const tab = (): KeyValueBackend => ({
    ...inner,
    subscribeExternal: (listener) => {
      external.add(listener);
      return () => external.delete(listener);
    },
  });
  /** The other tab writes straight to the shared store, and this tab hears of it. */
  const writeElsewhere = (key: string, raw: string | null) => {
    if (raw === null) inner.remove(key);
    else inner.set(key, raw);
    external.forEach((l) => l(key));
  };
  const clearElsewhere = () => external.forEach((l) => l(null));
  return { tab, writeElsewhere, clearElsewhere, inner };
}

describe('cross-tab writes', () => {
  it('a write made elsewhere reaches this key’s other-tab subscribers, and reads the new value', () => {
    const shared = sharedBackend();
    const storage = createStorage(shared.tab());
    const onGoal = jest.fn();
    const onName = jest.fn();
    storage.subscribe(goalKey, onGoal, { otherTabs: true });
    storage.subscribe(nameKey, onName, { otherTabs: true });

    shared.writeElsewhere('goal', JSON.stringify({ v: 1, data: 30 }));
    expect(onGoal).toHaveBeenCalledTimes(1);
    expect(onName).not.toHaveBeenCalled();
    expect(storage.get(goalKey)).toBe(30);
  });

  it('a store cleared elsewhere (no key) reaches every other-tab subscriber', () => {
    const shared = sharedBackend();
    const storage = createStorage(shared.tab());
    const onGoal = jest.fn();
    const onName = jest.fn();
    storage.subscribe(goalKey, onGoal, { otherTabs: true });
    storage.subscribe(nameKey, onName, { otherTabs: true });
    shared.clearElsewhere();
    expect(onGoal).toHaveBeenCalledTimes(1);
    expect(onName).toHaveBeenCalledTimes(1);
  });

  it('two tabs: one writes, the other’s subscriber hears it once', () => {
    const shared = sharedBackend();
    const a = createStorage(shared.tab());
    const b = createStorage(shared.tab());
    const onB = jest.fn();
    b.subscribe(goalKey, onB, { otherTabs: true });
    a.set(goalKey, 45);
    // The browser fires `storage` only in the other tab; the fake does the same for A's write.
    shared.writeElsewhere('goal', shared.inner.getString('goal')!);
    expect(onB).toHaveBeenCalledTimes(1);
    expect(b.get(goalKey)).toBe(45);
  });

  it('a plain subscriber hears this tab’s writes only (the sync engine must not upload another tab’s)', () => {
    const shared = sharedBackend();
    const storage = createStorage(shared.tab());
    const local = jest.fn();
    const both = jest.fn();
    storage.subscribe(goalKey, local);
    storage.subscribe(goalKey, both, { otherTabs: true });
    shared.writeElsewhere('goal', JSON.stringify({ v: 1, data: 30 }));
    expect(local).not.toHaveBeenCalled();
    expect(both).toHaveBeenCalledTimes(1);
    storage.set(goalKey, 45);
    expect(local).toHaveBeenCalledTimes(1);
    expect(both).toHaveBeenCalledTimes(2);
  });

  it('a backend without external changes works as before', () => {
    const storage = createStorage(memoryBackend());
    const on = jest.fn();
    storage.subscribe(goalKey, on);
    storage.set(goalKey, 15);
    expect(on).toHaveBeenCalledTimes(1);
  });
});

describe('otherTabWrites (the web `storage` event)', () => {
  let handlers: ((e: StorageEvent) => void)[];
  let previousWindow: PropertyDescriptor | undefined;
  let previousLocal: PropertyDescriptor | undefined;
  const local = { name: 'localStorage' };
  const session = { name: 'sessionStorage' };

  beforeEach(() => {
    handlers = [];
    previousWindow = Object.getOwnPropertyDescriptor(globalThis, 'window');
    previousLocal = Object.getOwnPropertyDescriptor(globalThis, 'localStorage');
    Object.defineProperty(globalThis, 'window', {
      configurable: true,
      value: {
        addEventListener: (type: string, fn: (e: StorageEvent) => void) => type === 'storage' && handlers.push(fn),
        removeEventListener: (type: string, fn: (e: StorageEvent) => void) => {
          handlers = handlers.filter((h) => h !== fn);
        },
      },
    });
    Object.defineProperty(globalThis, 'localStorage', { configurable: true, value: local });
  });
  afterEach(() => {
    for (const [name, previous] of [['window', previousWindow], ['localStorage', previousLocal]] as const) {
      if (previous) Object.defineProperty(globalThis, name, previous);
      else Reflect.deleteProperty(globalThis, name);
    }
  });

  const fire = (key: string | null, storageArea: unknown = local) =>
    handlers.forEach((h) => h({ key, storageArea } as unknown as StorageEvent));

  it('passes on this app’s keys without the store prefix; ignores other keys and session storage', () => {
    const listener = jest.fn();
    const stop = otherTabWrites(listener);
    fire(`bible-app${String.fromCharCode(92)}onboarding`);
    fire('another-app\\x');
    fire(`bible-app${String.fromCharCode(92)}goal`, session);
    expect(listener.mock.calls).toEqual([['onboarding']]);
    fire(null);
    expect(listener).toHaveBeenLastCalledWith(null);
    stop();
    expect(handlers).toHaveLength(0);
  });
});
