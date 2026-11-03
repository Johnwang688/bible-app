// Write tags (R6b-fu-journal): a tag is stored in the key's own envelope, so it lands with the value in
// one key write; a plain set keeps it; get ignores it; untagged values read and write as before.
import { z } from 'zod';

import { languageKey } from '../keys';
import { createStorage, memoryBackend, type StorageKey } from '../storage';

const counter: StorageKey<{ n: number }> = {
  key: 'counter',
  version: 2,
  schema: z.object({ n: z.number().int().min(0) }),
  fallback: { n: 0 },
};

describe('storage write tags', () => {
  it('stores the tag in the same envelope as the value', () => {
    const backend = memoryBackend();
    const s = createStorage(backend);
    s.set(counter, { n: 3 }, { tag: 'abc_DEF-123' });
    expect(backend.getString('counter')).toBe('{"j":"abc_DEF-123","v":2,"data":{"n":3}}');
    expect(s.get(counter)).toEqual({ n: 3 });
    expect(s.tagOf(counter)).toBe('abc_DEF-123');
    // Another instance over the same bytes sees the same tag (it is durable, not in memory).
    expect(createStorage(backend).tagOf(counter)).toBe('abc_DEF-123');
  });

  it('has no tag for a missing value, an untagged value, or bytes that are not a tagged envelope', () => {
    const backend = memoryBackend();
    const s = createStorage(backend);
    expect(s.tagOf(counter)).toBeUndefined();
    s.set(counter, { n: 1 });
    expect(s.tagOf(counter)).toBeUndefined();
    expect(JSON.parse(backend.getString('counter')!)).toEqual({ v: 2, data: { n: 1 } });
    for (const raw of ['{not json', '{"v":2,"data":{"n":1},"j":"late"}', '{"j":"bad tag!","v":2,"data":{"n":1}}', '{"j":7,"v":2,"data":{"n":1}}']) {
      backend.set('counter', raw);
      expect([raw, s.tagOf(counter)]).toEqual([raw, undefined]);
    }
  });

  it('a plain set keeps the existing tag; a tagged set replaces it; remove drops it', () => {
    const s = createStorage(memoryBackend());
    s.set(counter, { n: 1 }, { tag: 'first' });
    s.set(counter, { n: 2 });
    expect(s.tagOf(counter)).toBe('first');
    expect(s.get(counter)).toEqual({ n: 2 });
    s.set(counter, { n: 3 }, { tag: 'second' });
    expect(s.tagOf(counter)).toBe('second');
    s.remove(counter);
    expect(s.tagOf(counter)).toBeUndefined();
    s.set(counter, { n: 4 });
    expect(s.tagOf(counter)).toBeUndefined();
  });

  it('get ignores the tag, including for a value read through migrate', () => {
    const backend = memoryBackend();
    backend.set('counter', JSON.stringify({ j: 'old', v: 1, data: { n: 5 } }));
    const migrating: StorageKey<{ n: number }> = { ...counter, migrate: (_from, data) => data };
    const s = createStorage(backend);
    expect(s.get(migrating)).toEqual({ n: 5 });
    expect(s.tagOf(migrating)).toBe('old');
    s.set(migrating, { n: 6 });
    expect(JSON.parse(backend.getString('counter')!)).toEqual({ j: 'old', v: 2, data: { n: 6 } });
  });

  it('refuses an invalid tag or an invalid value without writing or notifying', () => {
    const s = createStorage(memoryBackend());
    s.set(counter, { n: 1 }, { tag: 'keep' });
    const listener = jest.fn();
    s.subscribe(counter, listener);
    for (const tag of ['', 'has space', 'a'.repeat(65), 'quote"', 'é']) {
      expect(() => s.set(counter, { n: 2 }, { tag })).toThrow();
    }
    expect(() => s.set(counter, { n: -1 }, { tag: 'ok' })).toThrow();
    expect(s.get(counter)).toEqual({ n: 1 });
    expect(s.tagOf(counter)).toBe('keep');
    expect(listener).not.toHaveBeenCalled();
  });

  it('tags string values too', () => {
    const s = createStorage(memoryBackend());
    s.set(languageKey, 'en', { tag: 't1' });
    expect(s.get(languageKey)).toBe('en');
    expect(s.tagOf(languageKey)).toBe('t1');
  });
});
