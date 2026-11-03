// Sol GAPS 5 review (orchestrator-owned): counterexamples, kept as regression tests.
import { languageKey } from '../keys';
import { createStorage, memoryBackend, type KeyValueBackend } from '../storage';
import { makeDevice, progressKey } from '../../sync/__tests__/fixtures';
import { createMemoryRemote } from '../../sync/memoryRemote';

/** Shared values; queued events only in other tabs; unchanged raw values emit nothing. */
function browserStore() {
  const inner = memoryBackend();
  const tabs: Set<(key: string | null) => void>[] = [];
  const queue: (() => void)[] = [];

  return {
    tab() {
      const own = new Set<(key: string | null) => void>();
      tabs.push(own);

      const changed = (key: string) => {
        for (const listeners of tabs) {
          if (listeners !== own) {
            queue.push(() => listeners.forEach((l) => l(key)));
          }
        }
      };

      const backend: KeyValueBackend = {
        getString: inner.getString,
        set(key, raw) {
          if (inner.getString(key) === raw) return;
          inner.set(key, raw);
          changed(key);
        },
        remove(key) {
          if (inner.getString(key) === undefined) return;
          inner.remove(key);
          changed(key);
        },
        subscribeExternal(listener) {
          own.add(listener);
          return () => {
            own.delete(listener);
          };
        },
      };

      return createStorage(backend);
    },
    flush() {
      while (queue.length) queue.shift()!();
    },
  };
}

afterEach(() => jest.useRealTimers());

test('another tab folding remote minutes must not upload those minutes as this device reading', async () => {
  jest.useFakeTimers();
  const shared = browserStore();
  const remote = createMemoryRemote();

  // Both tabs belong to the same install and signed-in account.
  const a = makeDevice(remote, 'devA', { storage: shared.tab() });
  await a.engine.syncNow();
  const b = makeDevice(remote, 'devA', { storage: shared.tab() });
  b.engine.start();

  try {
    await jest.advanceTimersByTimeAsync(1);
    shared.flush();

    remote.putDevice({
      deviceId: 'phone',
      activeMs: { '2026-11-03': 60_000 },
      chaptersRead: {},
      goalMetDays: [],
      goal: null,
      updatedAt: 1_000_000,
    });

    await a.engine.syncNow();
    expect(a.storage.get(progressKey).activeMs['2026-11-03']).toBe(60_000);

    shared.flush();
    await jest.advanceTimersByTimeAsync(60_000);

    expect(b.engine.status().state).toBe('idle');
    expect(b.storage.get(progressKey).activeMs['2026-11-03']).toBe(60_000);
    expect(remote.devices.get('devA')?.activeMs['2026-11-03'] ?? 0).toBe(0);
  } finally {
    await b.engine.stop();
    await a.engine.stop();
  }
});

test('another tab applying a remote setting must not republish it with a new local timestamp', async () => {
  jest.useFakeTimers();
  const shared = browserStore();
  const remote = createMemoryRemote();

  const a = makeDevice(remote, 'devA', { storage: shared.tab() });
  await a.engine.syncNow();
  const b = makeDevice(remote, 'devA', { storage: shared.tab() });
  b.engine.start();

  try {
    await jest.advanceTimersByTimeAsync(1);
    shared.flush();

    const setting = {
      key: 'language' as const,
      json: JSON.stringify('zh-Hans'),
      updatedAt: 1_100_000,
      deviceId: 'phone',
    };

    remote.putSetting(setting);
    a.tick(200_000);
    b.tick(300_000);

    await a.engine.syncNow();
    expect(a.storage.get(languageKey)).toBe('zh-Hans');

    remote.calls.length = 0;
    shared.flush();
    await jest.advanceTimersByTimeAsync(60_000);

    expect(b.engine.status().state).toBe('idle');
    expect(remote.calls.filter((call) => call === 'pushSettings')).toEqual([]);
    expect(remote.settings.get('language')).toEqual(setting);
  } finally {
    await b.engine.stop();
    await a.engine.stop();
  }
});
