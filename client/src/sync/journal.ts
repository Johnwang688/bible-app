// The sync engine's write journal (R6b-fu-journal): crash safety for every multi-key write.
//
// The problem. A run ends by writing merged local values (study items, each changed setting, progress)
// and the sync state (`sync.state.<uid>`: bases, stamps, the progress fold and goal) that describes
// them. Those are separate storage keys, and a write of two keys is not atomic: the process can die
// after any single key write. A state that runs ahead of the local values (a base for a value that was
// never written) makes the old local value look like a newer local change; a state that lags behind
// (a value written, its base not) makes the taken value look like one, restamped with the restart's
// time so it beats newer changes on other devices (rules 3, 9); a progress write and its fold that
// disagree count minutes twice or lose them (rule 12); a taken goal without its clock loses to older
// goals (rule 14). Comparing values after a crash cannot tell which writes landed: the app keeps
// writing local values before sync starts again (local-first), and the user can read, or edit, their
// way to exactly the value the engine meant to write.
//
// The scheme. Evidence that a local write landed is written atomically with the value itself:
//   - Write tags (storage.ts): a write can carry a tag stored in the key's own envelope. The app's own
//     plain writes keep the tag, so an engine write stays recognisable after the user edits the value.
//   - The journal (state.ts `journal`). For each run that writes local values, the engine:
//       1. saves the state with every part that a local write commits still as it was before the run
//          (the items' base/stamps/ignored, each written setting's base and stamp, the whole progress
//          state), plus the journal: a fresh random id and, for each local key it will write, that
//          key's part of the state after the write (`journaledState`). Parts of the run that write no
//          local value (an adopted remote value, an ignored one, the stamps) are saved as they are;
//       2. writes each local key with tag = the journal id;
//       3. saves the final state, without the journal.
//     A crash before 1 or after 3 leaves a matching pair. A crash in between leaves the journal.
//   - Recovery (`recoverJournal`, at engine creation, before every run and before stamping a local
//     change, so before anything reads local values against the state; never inside step 2, where
//     the watchers wait for the commit to stamp once all writes have landed): for each journaled key,
//     `tagOf(key) === id` means its write landed, so its part of the state takes the journaled value;
//     otherwise the write did not land, and the part stays as it was before the run. Then the journal
//     is cleared, in one state write (atomic; recovering twice decides the same, since only a new
//     journal, which needs this one cleared first, writes a new tag). Whatever the app wrote to a key
//     since is then simply a pending local change (rule 5), stamped when the engine first sees it.
//   - An in-process failure inside 1–3 (a storage write that throws) puts the in-memory state back to
//     what step 1 saved, so the same recovery settles it before the state is used again.
// The remote needs none of this: pushes are idempotent last-writer-wins writes, and a push whose
// outcome is unknown is treated as not acknowledged (engine.ts).
import type { Storage, StorageKey } from '../storage/storage';
import { lookup, put, stableStringify } from './merge';
import type { ProgressShape, StudyItemsShape } from './shapes';
import type { Journal, SyncStateData } from './state';

const ID_ALPHABET = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_-';

/** A random url-safe id (also a valid storage write tag). */
export function randomId(length: number): string {
  const bytes = new Uint8Array(length);
  const cryptoApi = (globalThis as { crypto?: { getRandomValues?: (a: Uint8Array) => Uint8Array } }).crypto;
  if (cryptoApi?.getRandomValues) cryptoApi.getRandomValues(bytes);
  else for (let i = 0; i < bytes.length; i++) bytes[i] = Math.floor(Math.random() * 256);
  return Array.from(bytes, (b) => ID_ALPHABET[b & 63]).join('');
}

/** The local keys an engine syncs: recovery checks the journaled ones' tags. */
export interface JournalKeys {
  items?: StorageKey<StudyItemsShape>;
  progress?: StorageKey<ProgressShape>;
  settings: readonly StorageKey<unknown>[];
}

/** Which local keys a run writes: the study items, these setting keys, the progress (the value written). */
export interface Written {
  items: boolean;
  settings: readonly string[];
  progress: ProgressShape | null;
}

const clone = <T>(v: T): T => (v === undefined ? v : (JSON.parse(JSON.stringify(v)) as T));

/** The entries of `after` that differ from `before` (null = removed). */
function diff<T>(before: Record<string, T>, after: Record<string, T>): Record<string, T | null> {
  const out: Record<string, T | null> = {};
  for (const k of new Set([...Object.keys(before), ...Object.keys(after)])) {
    const a = lookup(after, k);
    const b = lookup(before, k);
    if (a === undefined) {
      if (b !== undefined) put(out, k, null);
    } else if (b === undefined || stableStringify(a) !== stableStringify(b)) {
      put(out, k, a);
    }
  }
  return out;
}

function setOrDelete<T>(rec: Record<string, T>, k: string, v: T | null | undefined): void {
  if (v === null || v === undefined) delete rec[k];
  else put(rec, k, v);
}

function applyPatch<T>(rec: Record<string, T>, patch: Record<string, T | null>): void {
  for (const [k, v] of Object.entries(patch)) setOrDelete(rec, k, v);
}

/**
 * Step 1's state: `after` (the in-memory state once the run's merge is done), with every part that a
 * written key commits put back as it was in `before`, and the journal that says what each written key
 * commits. `progress.pending` mirrors the progress part (the fold and the activeMs written).
 */
export function journaledState(before: SyncStateData, after: SyncStateData, id: string, written: Written): SyncStateData {
  const out = clone(after);
  const journal: Journal = { id, items: null, settings: {}, progress: null };
  if (written.items) {
    journal.items = {
      base: diff(before.items.base, after.items.base),
      stamps: diff(before.items.stamps, after.items.stamps),
      ignored: diff(before.items.ignored, after.items.ignored),
    };
    out.items = { ...out.items, base: clone(before.items.base), stamps: clone(before.items.stamps), ignored: clone(before.items.ignored) };
  }
  for (const name of written.settings) {
    put(journal.settings, name, {
      base: clone(lookup(after.settings.base, name) ?? null),
      stamp: clone(lookup(after.settings.stamps, name) ?? null),
    });
    setOrDelete(out.settings.base, name, clone(lookup(before.settings.base, name)));
    setOrDelete(out.settings.stamps, name, clone(lookup(before.settings.stamps, name)));
  }
  if (written.progress) {
    const { fold, goal, ownGoal, goalStamp, sig } = after.progress;
    journal.progress = clone({ fold, goal, ownGoal, goalStamp, sig });
    out.progress = { ...clone(before.progress), pending: { fold: clone(fold), expect: clone(written.progress.activeMs) } };
  }
  out.journal = journal;
  return out;
}

/**
 * Settles a journal (or a progress marker from before the journal) in `state`, in place: each
 * journaled part takes its journaled value if its key carries the journal's tag, and otherwise stays.
 * Returns whether the state changed (the caller saves it).
 */
export function recoverJournal(state: SyncStateData, storage: Storage, keys: JournalKeys): boolean {
  const j = state.journal;
  const p = state.progress;
  if (!j) {
    if (!p.pending) return false;
    // A marker saved before the journal existed: no tag to go by, so compare values as that code did
    // (reading only adds to a day's count: at least what was written means it was written).
    if (keys.progress) {
      const activeMs = storage.get(keys.progress).activeMs;
      if (Object.entries(p.pending.expect).every(([day, ms]) => (lookup(activeMs, day) ?? 0) >= ms)) p.fold = p.pending.fold;
    }
    p.pending = null;
    return true;
  }
  const landed = <T>(k: StorageKey<T> | undefined): boolean => k !== undefined && storage.tagOf(k) === j.id;
  if (j.items && landed(keys.items)) {
    applyPatch(state.items.base, j.items.base);
    applyPatch(state.items.stamps, j.items.stamps);
    applyPatch(state.items.ignored, j.items.ignored);
  }
  for (const [name, part] of Object.entries(j.settings)) {
    if (!landed(keys.settings.find((k) => k.key === name))) continue;
    setOrDelete(state.settings.base, name, part.base);
    setOrDelete(state.settings.stamps, name, part.stamp);
  }
  state.progress = j.progress && landed(keys.progress) ? { ...j.progress, pending: null } : { ...p, pending: null };
  state.journal = null;
  return true;
}
