// Acceptance (orchestrator-owned): the storage module validates what it reads and writes.
import { z } from 'zod';

import { appearanceKey, languageKey } from '../keys';
import { createStorage, memoryBackend, type StorageKey } from '../storage';

const counter: StorageKey<{ n: number }> = {
  key: 'counter',
  version: 2,
  schema: z.object({ n: z.number().int().min(0) }),
  fallback: { n: 0 },
};

describe('storage', () => {
  it('returns the fallback when nothing is stored', () => {
    const s = createStorage(memoryBackend());
    expect(s.get(counter)).toEqual({ n: 0 });
    expect(s.get(appearanceKey)).toEqual({ preset: null, mode: 'system' });
    expect(s.get(languageKey)).toBe('system');
  });

  it('round-trips a value in a versioned JSON envelope', () => {
    const backend = memoryBackend();
    const s = createStorage(backend);
    s.set(counter, { n: 3 });
    expect(s.get(counter)).toEqual({ n: 3 });
    expect(JSON.parse(backend.getString('counter')!)).toEqual({ v: 2, data: { n: 3 } });
    // A second instance over the same backend reads it back.
    expect(createStorage(backend).get(counter)).toEqual({ n: 3 });
  });

  it('falls back on corrupt JSON, a wrong version, a bad envelope or a failing schema', () => {
    for (const raw of ['{not json', '{"v":1,"data":{"n":3}}', '{"n":3}', '{"v":2,"data":{"n":-1}}', 'null', '42']) {
      const backend = memoryBackend();
      backend.set('counter', raw);
      expect([raw, createStorage(backend).get(counter)]).toEqual([raw, { n: 0 }]);
    }
  });

  it('refuses to write a value that fails the schema, and leaves the stored value alone', () => {
    const s = createStorage(memoryBackend());
    s.set(counter, { n: 1 });
    expect(() => s.set(counter, { n: -5 })).toThrow();
    expect(() => s.set(appearanceKey, { preset: 'not-a-preset' as never, mode: 'system' })).toThrow();
    expect(s.get(counter)).toEqual({ n: 1 });
  });

  it('returns values that cannot mutate the stored copy', () => {
    const s = createStorage(memoryBackend());
    s.set(counter, { n: 1 });
    const v = s.get(counter);
    v.n = 99;
    expect(s.get(counter)).toEqual({ n: 1 });
  });

  it('removes a value', () => {
    const s = createStorage(memoryBackend());
    s.set(languageKey, 'zh-Hans');
    s.remove(languageKey);
    expect(s.get(languageKey)).toBe('system');
  });

  it('notifies subscribers of that key only, and stops after unsubscribe', () => {
    const s = createStorage(memoryBackend());
    const onLang = jest.fn();
    const onCounter = jest.fn();
    const off = s.subscribe(languageKey, onLang);
    s.subscribe(counter, onCounter);
    s.set(languageKey, 'en');
    s.remove(languageKey);
    expect(onLang).toHaveBeenCalledTimes(2);
    expect(onCounter).not.toHaveBeenCalled();
    off();
    s.set(languageKey, 'zh-Hans');
    expect(onLang).toHaveBeenCalledTimes(2);
  });

  it('does not notify when a write is refused', () => {
    const s = createStorage(memoryBackend());
    const listener = jest.fn();
    s.subscribe(counter, listener);
    expect(() => s.set(counter, { n: -1 })).toThrow();
    expect(listener).not.toHaveBeenCalled();
  });
});

describe('storage migrations (R-3)', () => {
  const doubled: StorageKey<{ n: number }> = {
    ...counter,
    version: 3,
    migrate: (from, data) => (from === 2 ? { n: (data as { n: number }).n * 2 } : undefined),
  };

  it('reads an older version through migrate, checked by the schema', () => {
    const backend = memoryBackend();
    backend.set('counter', JSON.stringify({ v: 2, data: { n: 3 } }));
    expect(createStorage(backend).get(doubled)).toEqual({ n: 6 });
    // Reading does not write; the next set stores the new version.
    expect(JSON.parse(backend.getString('counter')!).v).toBe(2);
  });

  it('falls back when migrate cannot read it, throws, or returns something the schema rejects', () => {
    for (const env of [{ v: 1, data: { n: 3 } }, { v: 2, data: { n: -3 } }, { v: 2, data: null }, { v: 4, data: { n: 3 } }, { v: '2', data: { n: 3 } }]) {
      const backend = memoryBackend();
      backend.set('counter', JSON.stringify(env));
      expect(createStorage(backend).get(doubled)).toEqual({ n: 0 });
    }
  });

  it('never migrates a key without migrate', () => {
    const backend = memoryBackend();
    backend.set('counter', JSON.stringify({ v: 1, data: { n: 3 } }));
    expect(createStorage(backend).get(counter)).toEqual({ n: 0 });
  });
});
