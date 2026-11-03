// Unit tests for the pure merge decisions (R-6b, implementer-owned).
import { beats, changeTime, decide, decideWhole, restamp, stableStringify, type StampEntry } from '../merge';

const R = (sig: string | null, t: number, d = 'devZ', valid = true) => ({ sig, valid, clock: { t, d } });

describe('clocks', () => {
  test('newer wins; equal times go to the larger device id', () => {
    expect(beats({ t: 2, d: 'a' }, { t: 1, d: 'z' })).toBe(true);
    expect(beats({ t: 1, d: 'b' }, { t: 1, d: 'a' })).toBe(true);
    expect(beats({ t: 1, d: 'a' }, { t: 1, d: 'b' })).toBe(false);
    expect(beats({ t: 1, d: 'a' }, { t: 1, d: 'a' })).toBe(false);
  });

  test('a change time is capped at first seen', () => {
    expect(changeTime(5, 10)).toBe(5);
    expect(changeTime(50, 10)).toBe(10);
    expect(changeTime(null, 10)).toBe(10);
  });
});

describe('restamp', () => {
  test('stamps once, renews on a new value, and a change back to the base is still a change', () => {
    const stamps: Record<string, StampEntry> = {};
    expect(restamp(stamps, 'x', 'a', null, 100)).toBe('stamped');
    expect(restamp(stamps, 'x', 'a', null, 200)).toBeNull();
    expect(stamps.x).toEqual({ at: 100, s: 'a' });
    expect(restamp(stamps, 'x', 'b', null, 300)).toBe('stamped');
    expect(stamps.x).toEqual({ at: 300, s: 'b' });
    expect(restamp(stamps, 'x', null, null, 400)).toBe('stamped');
    expect(stamps.x).toEqual({ at: 400, s: null });
    expect(restamp(stamps, 'x', null, null, 500)).toBeNull();
    // Nothing pending and equal to the base: no stamp.
    expect(restamp(stamps, 'y', 'base', 'base', 600)).toBeNull();
    expect(stamps.y).toBeUndefined();
  });

  test('never linked (undefined base) is always pending', () => {
    const stamps: Record<string, StampEntry> = {};
    expect(restamp(stamps, 'k', '"en"', undefined, 1)).toBe('stamped');
  });
});

describe('decide', () => {
  const base = { s: 'old', t: 10, d: 'devA' };
  const args = { own: null, seen: 100, self: 'devA' };

  test('nothing changed', () => {
    expect(decide({ ...args, localSig: 'old', base, remote: R('old', 10, 'devA') })).toEqual({ do: 'none' });
    expect(decide({ ...args, localSig: 'old', base, remote: undefined })).toEqual({ do: 'none' });
  });

  test('only remote changed: take, or ignore when it cannot be stored', () => {
    expect(decide({ ...args, localSig: 'old', base, remote: R('new', 20) })).toEqual({ do: 'take' });
    expect(decide({ ...args, localSig: 'old', base, remote: R(null, 20, 'devZ', false) })).toEqual({ do: 'ignore' });
  });

  test('only local changed: push at min(own, seen)', () => {
    expect(decide({ ...args, own: 50, localSig: 'mine', base, remote: undefined })).toEqual({ do: 'push', clock: { t: 50, d: 'devA' } });
    expect(decide({ ...args, own: 500, localSig: 'mine', base, remote: undefined })).toEqual({ do: 'push', clock: { t: 100, d: 'devA' } });
  });

  test('both changed: last writer wins, ties by device id', () => {
    expect(decide({ ...args, localSig: 'mine', base, remote: R('theirs', 99) })).toEqual({ do: 'push', clock: { t: 100, d: 'devA' } });
    expect(decide({ ...args, localSig: 'mine', base, remote: R('theirs', 101) })).toEqual({ do: 'take' });
    expect(decide({ ...args, localSig: 'mine', base, remote: R('theirs', 100, 'devB') })).toEqual({ do: 'take' });
    expect(decide({ ...args, self: 'devC', localSig: 'mine', base, remote: R('theirs', 100, 'devB') })).toMatchObject({ do: 'push' });
  });

  test('a newer remote value the device cannot store is left alone on both sides', () => {
    expect(decide({ ...args, localSig: 'mine', base, remote: R(null, 101, 'devZ', false) })).toEqual({ do: 'ignore' });
    expect(decide({ ...args, localSig: 'mine', base, remote: R(null, 99, 'devZ', false) })).toMatchObject({ do: 'push' });
  });

  test('same value on both sides: adopt the remote clock unless the local one is newer', () => {
    expect(decide({ ...args, localSig: 'same', base: undefined, remote: R('same', 500) })).toEqual({ do: 'adopt' });
    expect(decide({ ...args, localSig: 'same', base: undefined, remote: R('same', 5) })).toEqual({ do: 'push', clock: { t: 100, d: 'devA' } });
    expect(decide({ ...args, localSig: null, base: undefined, remote: R(null, 5) })).toEqual({ do: 'adopt' });
  });

  test('a stale remote (older than the base, nothing pending) gets the base pushed back with its own clock', () => {
    expect(decide({ ...args, localSig: 'old', base, remote: R('older', 5, 'devB') })).toEqual({ do: 'push', clock: { t: 10, d: 'devA' } });
    expect(decide({ ...args, localSig: null, base: { s: null, t: 10, d: 'devB' }, remote: R('older', 5) })).toEqual({
      do: 'push',
      clock: { t: 10, d: 'devB' },
    });
    // Not older: taken as before.
    expect(decide({ ...args, localSig: 'old', base, remote: R('newer', 10, 'devB') })).toEqual({ do: 'take' });
  });

  test('a pending change equal to the base (changed back) still counts as a change', () => {
    expect(decide({ ...args, localSig: 'old', base, remote: R('theirs', 50), changed: true })).toEqual({ do: 'push', clock: { t: 100, d: 'devA' } });
    expect(decide({ ...args, localSig: 'old', base, remote: undefined, changed: true })).toEqual({ do: 'push', clock: { t: 100, d: 'devA' } });
  });

  test('a deletion is a change: local absent vs a live base', () => {
    expect(decide({ ...args, localSig: null, base, remote: undefined })).toEqual({ do: 'push', clock: { t: 100, d: 'devA' } });
  });
});

describe('decideWhole (first link takes the account value)', () => {
  test('no history: account value wins, else upload', () => {
    expect(decideWhole({ localSig: 'a', base: undefined, remote: R('b', 1), seen: 100, self: 'devA' })).toEqual({ do: 'take' });
    expect(decideWhole({ localSig: 'a', base: undefined, remote: undefined, seen: 100, self: 'devA' })).toEqual({
      do: 'push',
      clock: { t: 100, d: 'devA' },
    });
    expect(decideWhole({ localSig: 'a', base: undefined, remote: R(null, 1, 'devZ', false), seen: 100, self: 'devA' })).toEqual({
      do: 'ignore',
    });
  });
});

test('stableStringify sorts keys', () => {
  expect(stableStringify({ b: 1, a: { d: 2, c: [3, { f: 1, e: 0 }] } })).toBe('{"a":{"c":[3,{"e":0,"f":1}],"d":2},"b":1}');
});
