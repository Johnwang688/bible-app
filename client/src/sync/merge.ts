// The pure decisions of the sync engine (R-6b): last writer wins per entry, first-seen stamps, and
// small helpers. No I/O here; engine.ts reads and writes, the domain adapters translate shapes.
// The rules are CONFLICTS.md; the rule numbers below refer to it.

/** A last-writer-wins clock: the change time (client ms) and the device that made the change. */
export interface Clock {
  t: number;
  d: string;
}

/** Rule 2: `a` beats `b` when it is newer; equal times go to the larger device id. */
export function beats(a: Clock, b: Clock): boolean {
  return a.t > b.t || (a.t === b.t && a.d > b.d);
}

/**
 * Rule 4: a change's time is its own time (when it has one) capped at the moment the engine first
 * saw it, so a fast clock cannot win forever; otherwise the first-seen moment.
 */
export function changeTime(own: number | null, firstSeen: number): number {
  return own === null ? firstSeen : Math.min(own, firstSeen);
}

/** A first-seen stamp: when the engine first saw a pending change and the value (signature) it saw. */
export interface StampEntry {
  at: number;
  s: string | null;
}

/**
 * Rule 4 bookkeeping for one entry. `localSig` is the local value's signature (null = absent);
 * `baseSig` the last synced one (null = absent or deleted, undefined = never linked, which always
 * counts as pending). An entry that differs from its base and has no stamp, or whose value changed
 * since it was stamped, is stamped `at`.
 *
 * A stamp is never cleared here: a value that changes back to the base is still a change, made at the
 * moment it was seen (pink, then blue again over a blue base is a newer blue). So a stamp's presence
 * means "a local change is pending"; only the engine removes one, when that exact change is settled
 * (pushed and acknowledged, or replaced by the account's value).
 * Returns 'stamped' when a stamp was created or renewed, else null.
 */
export function restamp(
  stamps: Record<string, StampEntry>,
  id: string,
  localSig: string | null,
  baseSig: string | null | undefined,
  at: number,
): 'stamped' | null {
  const current = lookup(stamps, id);
  if (current ? current.s === localSig : localSig === baseSig) return null;
  stamps[id] = { at, s: localSig };
  return 'stamped';
}

/** Whether two stamps are the same stamp (both absent counts as the same). */
export function sameStamp(a: StampEntry | null | undefined, b: StampEntry | null | undefined): boolean {
  if (!a || !b) return !a && !b;
  return a.at === b.at && a.s === b.s;
}

/** What a remote entry looks like to a decision: its value signature, whether the device can store it, and its clock. */
export interface RemoteSide {
  /** Value signature; null for a tombstone. Meaningless when `valid` is false. */
  sig: string | null;
  /** False when the device cannot store the value (rule 6). */
  valid: boolean;
  clock: Clock;
}

export interface BaseSide {
  s: string | null;
  t: number;
  d: string;
}

export type Decision =
  /** Nothing to do. */
  | { do: 'none' }
  /** Write the remote value locally; the base becomes the remote entry. */
  | { do: 'take' }
  /** The device already holds the remote value: the base becomes the remote entry, no local write. */
  | { do: 'adopt' }
  /** Send the local value with this clock; the base becomes it once the push succeeds. */
  | { do: 'push'; clock: Clock }
  /** The remote value wins but the device cannot store it (rule 6): leave both sides alone. */
  | { do: 'ignore' };

const NONE: Decision = { do: 'none' };

/**
 * Rules 1–3 and 9 for one linked entry (an entry with sync history, or a study item, where no
 * history simply means "absent"). `seen` is the first-seen moment of the pending local change.
 *
 * Every device decides by the same total order (`beats` on the clocks), so all of them agree on the
 * winner. The remote is a plain document store without conditional writes, so an older push that was
 * delayed can land after a newer one: when the pulled entry loses to what this device knows (its
 * pending change, or its base when nothing is pending), this device's winning value is pushed again
 * with its own clock instead of the losing one being taken. That cannot ping-pong: a push only ever
 * replaces a remote clock with one that beats it, so once the remote holds the greatest clock any
 * device knows, no device's decision is to push.
 */
export function decide(args: {
  localSig: string | null;
  /** The local value's own time (rule 4), or null. */
  own: number | null;
  base: BaseSide | undefined;
  remote: RemoteSide | undefined;
  seen: number;
  self: string;
  /**
   * Whether a local change is pending: the value differs from the base, or a stamp says it changed
   * (even back to the base value). Defaults to "the value differs from the base".
   */
  changed?: boolean;
}): Decision {
  const { localSig, own, base, remote, seen, self } = args;
  const baseSig = base ? base.s : null;
  const changed = args.changed ?? localSig !== baseSig;
  const baseClock: Clock | undefined = base ? { t: base.t, d: base.d } : undefined;
  const mine: Clock = { t: changeTime(own, seen), d: self };
  const remoteIsBase =
    remote !== undefined &&
    base !== undefined &&
    remote.valid &&
    remote.sig === base.s &&
    remote.clock.t === base.t &&
    remote.clock.d === base.d;

  if (remote === undefined || remoteIsBase) return changed ? { do: 'push', clock: mine } : NONE;
  if (changed) {
    // Equal payloads still compare clocks: a newer local clock is sent so other devices see it (rule 2).
    if (beats(mine, remote.clock)) return { do: 'push', clock: mine };
  } else if (baseClock && beats(baseClock, remote.clock)) {
    // The account holds an older change than the one this device already synced: send it again.
    return { do: 'push', clock: baseClock };
  }
  if (!remote.valid) return { do: 'ignore' };
  return remote.sig === localSig ? { do: 'adopt' } : { do: 'take' };
}

/**
 * Rules 9–10 and 14 for a whole-value entry (a setting, the daily goal). Without sync history the
 * account's value wins if it has one; otherwise the device's is uploaded. With history, as `decide`.
 */
export function decideWhole(args: {
  localSig: string;
  base: BaseSide | undefined;
  remote: RemoteSide | undefined;
  seen: number;
  self: string;
  /** As in `decide`. */
  changed?: boolean;
}): Decision {
  const { localSig, base, remote, seen, self, changed } = args;
  if (!base) {
    if (!remote) return { do: 'push', clock: { t: seen, d: self } };
    if (!remote.valid) return { do: 'ignore' };
    return remote.sig === localSig ? { do: 'adopt' } : { do: 'take' };
  }
  return decide({ localSig, own: null, base, remote, seen, self, changed });
}

/** JSON with object keys sorted, so equal values always give equal strings. */
export function stableStringify(value: unknown): string {
  return JSON.stringify(sortKeys(value)) ?? 'undefined';
}

function sortKeys(value: unknown): unknown {
  if (Array.isArray(value)) return value.map(sortKeys);
  if (value && typeof value === 'object') {
    const out: Record<string, unknown> = {};
    for (const k of Object.keys(value).sort()) {
      Object.defineProperty(out, k, {
        value: sortKeys((value as Record<string, unknown>)[k]),
        enumerable: true,
        writable: true,
        configurable: true,
      });
    }
    return out;
  }
  return value;
}

/** A 53-bit string hash (cyrb53), as hex. Only for change detection, never for identity. */
export function hash53(str: string): string {
  let h1 = 0xdeadbeef;
  let h2 = 0x41c6ce57;
  for (let i = 0; i < str.length; i++) {
    const ch = str.charCodeAt(i);
    h1 = Math.imul(h1 ^ ch, 2654435761);
    h2 = Math.imul(h2 ^ ch, 1597334677);
  }
  h1 = Math.imul(h1 ^ (h1 >>> 16), 2246822507) ^ Math.imul(h2 ^ (h2 >>> 13), 3266489909);
  h2 = Math.imul(h2 ^ (h2 >>> 16), 2246822507) ^ Math.imul(h1 ^ (h1 >>> 13), 3266489909);
  return (4294967296 * (2097151 & h2) + (h1 >>> 0)).toString(16);
}

/** `rec[k]` only when it is the record's own property (ids come from remote data). */
export function lookup<T>(rec: Record<string, T>, k: string): T | undefined {
  return Object.prototype.hasOwnProperty.call(rec, k) ? rec[k] : undefined;
}

/** Sets an own property, even for awkward keys such as `__proto__`. */
export function put<T>(rec: Record<string, T>, k: string, v: T): void {
  Object.defineProperty(rec, k, { value: v, enumerable: true, writable: true, configurable: true });
}
