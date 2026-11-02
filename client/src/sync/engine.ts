// The sync engine (R-6b): local-first sync of study items, reading progress and settings for one
// signed-in account. Device storage is always the copy the app reads and writes; a run pulls the
// account's copy, merges each entry with the local value and the base (the last synced state) per
// CONFLICTS.md, writes the merged local values, pushes what the account lacks and saves the new base.
//
// Concurrency: one run at a time. Every `await` lets the app write storage, so a run reads the local
// values at its start (L0) and again just before writing (L1); an entry that changed in between keeps
// its new value and stays pending for the next run (rule 5). The local write and the base update happen
// synchronously together. After stop() resolves, no local write, base write or remote call happens.
// Runs never overlap, however syncNow is reached (a status listener calling it during a run included).
//
// Change detection: a first-seen stamp means "a local change is pending" until that exact change is
// settled, even when the value went back to the base (A, B, then A again is a newer A). Items also
// compare a fingerprint (value and own time) with the one the device synced.
//
// A push whose outcome is unknown (the run stopped or failed after the remote may have written it) is
// treated as not acknowledged: its stamps stay, and the next run's merge is right either way. A pulled
// value equal to the pending local one with a clock that is not older is adopted (items, settings),
// and this device's own progress document tells which goal it last sent (rule 14).
import type { Storage, StorageKey } from '../storage/storage';
import { checkPulledItem, fingerprint, localItemOf, readLocalFingerprints, readLocalItems, setLocalItem, toRemoteItem, type CheckedItem, type LocalItem } from './domains/items';
import { bestGoal, checkDevices, deviceDoc, mergeProgress, progressSig, sameDoc, type CleanDoc } from './domains/progress';
import { checkPulledSetting, isSettingKey, settingSig, toRemoteSetting, type CheckedSetting } from './domains/settings';
import { beats, decide, decideWhole, lookup, put, restamp, sameStamp, stableStringify, type Decision, type RemoteSide, type StampEntry } from './merge';
import type { ProgressShape, StudyItemsShape, SyncDomains } from './shapes';
import { deviceIdKey, isDeviceId, isValidUid, syncStateKey, type ItemBase, type SyncStateData } from './state';
import { RemoteError, type DeviceProgress, type PulledItem, type RemoteItem, type RemoteSetting, type RemoteStore, type SettingKey, type SyncEngine, type SyncStatus } from './types';

export interface SyncEngineOptions {
  uid: string;
  storage: Storage;
  remote: RemoteStore;
  domains: SyncDomains;
  deviceId: string;
  now?: () => number; // default Date.now
  debounceMs?: number; // delay from a local change to a sync; default 3000
  pullIntervalMs?: number; // periodic sync while started; default 5 * 60_000
}

/** Retry delays after a failed run while started. */
const BACKOFF_MS = [5_000, 30_000, 2 * 60_000, 5 * 60_000];

const ID_ALPHABET = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_-';

/** This install's device id: random, url-safe, 20 characters, created once and stored. */
export function getDeviceId(storage: Storage): string {
  const stored = storage.get(deviceIdKey);
  if (isDeviceId(stored)) return stored;
  const bytes = new Uint8Array(20);
  const cryptoApi = (globalThis as { crypto?: { getRandomValues?: (a: Uint8Array) => Uint8Array } }).crypto;
  if (cryptoApi?.getRandomValues) cryptoApi.getRandomValues(bytes);
  else for (let i = 0; i < bytes.length; i++) bytes[i] = Math.floor(Math.random() * 256);
  const id = Array.from(bytes, (b) => ID_ALPHABET[b & 63]).join('');
  storage.set(deviceIdKey, id);
  return id;
}

/** Forgets this account's sync history on this device (the next sign-in is a first sign-in). Stop its engine first. */
export function clearSyncState(storage: Storage, uid: string): void {
  if (!isValidUid(uid)) return;
  storage.remove(syncStateKey(uid));
}

/** Thrown inside a run when the engine was stopped at a checkpoint. */
class Stopped extends Error {}

interface ItemPush {
  id: string;
  sig: string | null;
  /** The local fingerprint pushed (the base's `f` once acknowledged). */
  fp: string | null;
  /** The stamp of the change pushed: cleared on success only if no newer change replaced it. */
  stamp: StampEntry | undefined;
  item: RemoteItem;
}

interface SettingPush {
  key: SettingKey;
  sig: string;
  stamp: StampEntry | undefined;
  setting: RemoteSetting;
}

/** The study items a run read at its start (L0), with their stamps: rule 5 compares with both. */
interface ItemsL0 {
  items: Map<string, LocalItem>;
  stamps: Record<string, StampEntry>;
}

/** The fingerprint a base stands for (null = absent). Bases saved before fingerprints compare values only. */
function baseFingerprint(b: ItemBase | undefined, local: LocalItem | undefined): string | null {
  if (!b) return null;
  if (b.f !== undefined) return b.f;
  if ((local?.sig ?? null) === b.s) return fingerprint(local);
  return b.s === null ? null : `\u0000${b.s}`;
}

const copyStamps = (stamps: Record<string, StampEntry>): Record<string, StampEntry> =>
  JSON.parse(JSON.stringify(stamps)) as Record<string, StampEntry>;

export function createSyncEngine(opts: SyncEngineOptions): SyncEngine {
  const { uid, storage, remote, domains, deviceId: self } = opts;
  const now = opts.now ?? Date.now;
  const debounceMs = opts.debounceMs ?? 3000;
  const pullIntervalMs = opts.pullIntervalMs ?? 5 * 60_000;
  const stateKey = syncStateKey(uid);
  const studyKey = domains.studyItems;
  const progressKey = domains.progress;
  // Only keys that are synced settings (types.ts SettingKey) can sync; anything else is ignored.
  const settingKeys = (domains.settings ?? []).filter((k) => isSettingKey(k.key)) as (StorageKey<unknown> & { key: SettingKey })[];

  let state: SyncStateData = storage.get(stateKey);
  let status: SyncStatus = { state: 'idle', lastSyncedAt: null };
  const listeners = new Set<() => void>();
  let phase: 'new' | 'started' | 'stopped' = 'new';
  /** Bumped by stop(): a run whose generation is old stops at its next checkpoint. */
  let gen = 0;
  let inFlight: Promise<void> | null = null;
  let again: Promise<void> | null = null;
  let unsubscribes: (() => void)[] = [];
  let failures = 0;
  const timers: { first?: ReturnType<typeof setTimeout>; debounce?: ReturnType<typeof setTimeout>; retry?: ReturnType<typeof setTimeout>; interval?: ReturnType<typeof setInterval> } = {};

  // ---- status ----

  function setStatus(next: SyncStatus) {
    status = next;
    for (const l of [...listeners]) {
      try {
        l();
      } catch {
        // A listener's failure must not break sync.
      }
    }
  }

  const saveState = () => storage.set(stateKey, state);
  // A crash marker from a progress write is settled as early as possible (see writeProgress).
  resolvePendingFold();

  // ---- stamps (rule 4) and change detection ----

  /** Stamps the pending study item changes. Returns whether a stamp was created or renewed, and whether state changed. */
  function stampItems(at: number): { stamped: boolean; dirty: boolean } {
    const res = { stamped: false, dirty: false };
    if (!studyKey) return res;
    const local = readLocalItems(storage.get(studyKey));
    const { base, stamps } = state.items;
    const ids = new Set<string>([...local.keys(), ...Object.keys(base), ...Object.keys(stamps)]);
    for (const id of ids) {
      const l = local.get(id);
      note(res, restamp(stamps, id, fingerprint(l), baseFingerprint(lookup(base, id), l), at));
    }
    return res;
  }

  function stampSettings(at: number): { stamped: boolean; dirty: boolean } {
    const res = { stamped: false, dirty: false };
    for (const k of settingKeys) {
      note(res, restamp(state.settings.stamps, k.key, settingSig(storage.get(k)), lookup(state.settings.base, k.key)?.s, at));
    }
    return res;
  }

  function stampProgress(at: number): { stamped: boolean; dirty: boolean } {
    const res = { stamped: false, dirty: false };
    if (!progressKey) return res;
    const p = storage.get(progressKey);
    const holder: Record<string, { at: number; s: string | null }> = state.progress.goalStamp ? { goal: state.progress.goalStamp } : {};
    const goal = state.progress.goal;
    note(res, restamp(holder, 'goal', String(p.goalMinutes), goal ? String(goal.m) : undefined, at));
    state.progress.goalStamp = holder.goal ?? null;
    // Minutes, chapters and goal-met days have no stamps, but a change to them is worth a sync.
    if (progressSig(p) !== state.progress.sig) res.stamped = true;
    return res;
  }

  function note(res: { stamped: boolean; dirty: boolean }, r: 'stamped' | null) {
    if (r === 'stamped') res.stamped = res.dirty = true;
  }

  function onLocalChange(stamp: (at: number) => { stamped: boolean; dirty: boolean }) {
    if (phase !== 'started') return;
    const res = stamp(now());
    if (res.dirty) saveState();
    if (res.stamped) scheduleDebounce();
  }

  // ---- scheduling ----

  function scheduleDebounce() {
    if (timers.debounce !== undefined) clearTimeout(timers.debounce);
    timers.debounce = setTimeout(() => {
      timers.debounce = undefined;
      void kick();
    }, debounceMs);
  }

  function scheduleRetry() {
    if (timers.retry !== undefined) clearTimeout(timers.retry);
    const delay = BACKOFF_MS[Math.min(failures, BACKOFF_MS.length - 1)]!;
    failures++;
    timers.retry = setTimeout(() => {
      timers.retry = undefined;
      void kick();
    }, delay);
  }

  function clearTimers() {
    if (timers.first !== undefined) clearTimeout(timers.first);
    if (timers.debounce !== undefined) clearTimeout(timers.debounce);
    if (timers.retry !== undefined) clearTimeout(timers.retry);
    if (timers.interval !== undefined) clearInterval(timers.interval);
    timers.first = timers.debounce = timers.retry = timers.interval = undefined;
  }

  /**
   * Runs now, or joins the run in flight and runs once more after it (shared by every caller waiting).
   * `inFlight` is set before the run starts: the run's first status change calls the listeners
   * synchronously, and a listener calling syncNow then must join this run, not start a second one.
   */
  function kick(): Promise<void> {
    if (phase === 'stopped') return Promise.resolve();
    if (inFlight) {
      again ??= inFlight.then(() => {
        again = null;
        return kick();
      });
      return again;
    }
    let finished!: () => void;
    const run = new Promise<void>((resolve) => (finished = resolve));
    inFlight = run;
    void runOnce(gen)
      .catch(() => undefined)
      .finally(() => {
        if (inFlight === run) inFlight = null;
        finished();
      });
    return run;
  }

  // ---- one run ----

  async function runOnce(g: number): Promise<void> {
    const before = status;
    const alive = () => {
      if (g !== gen) throw new Stopped();
    };
    setStatus({ ...status, state: 'syncing' });
    try {
      await syncOnce(alive);
      failures = 0;
      if (timers.retry !== undefined) clearTimeout(timers.retry);
      timers.retry = undefined;
      setStatus({ state: 'idle', lastSyncedAt: now() });
    } catch (e) {
      if (e instanceof Stopped || g !== gen) {
        setStatus({ ...before, state: before.state === 'syncing' ? 'idle' : before.state });
        return;
      }
      setStatus({ state: e instanceof RemoteError && e.kind === 'offline' ? 'offline' : 'error', lastSyncedAt: status.lastSyncedAt });
      if (phase === 'started') scheduleRetry();
    }
  }

  async function syncOnce(alive: () => void): Promise<void> {
    resolvePendingFold();
    // Stamp what changed while not watching (rule 4), then read the local values (L0).
    const t0 = now();
    const s1 = stampItems(t0);
    const s2 = stampSettings(t0);
    const s3 = stampProgress(t0);
    if (s1.dirty || s2.dirty || s3.dirty) saveState();

    const items0: ItemsL0 | null = studyKey ? { items: readLocalItems(storage.get(studyKey)), stamps: copyStamps(state.items.stamps) } : null;
    const settings0 = new Map(settingKeys.map((k) => [k.key, settingSig(storage.get(k))]));
    const settingStamps0 = copyStamps(state.settings.stamps);
    const progress0 = progressKey ? storage.get(progressKey) : null;
    const goalStamp0 = state.progress.goalStamp ? { ...state.progress.goalStamp } : null;

    // Pull.
    alive();
    const pulledSettings = settingKeys.length > 0 ? await remote.pullSettings() : [];
    alive();
    const pulledDevices = progressKey ? await remote.pullDevices() : [];
    alive();
    const pulledItems = studyKey ? await remote.pullItems(state.items.cursor) : null;
    alive();

    // Merge and write the local values together with the base (synchronous: nothing interleaves).
    const itemPlan = studyKey && items0 && pulledItems ? planItems(studyKey, items0.items, pulledItems.items) : null;
    const settingPlan = planSettings(settings0, pulledSettings);
    const progressPlan = progressKey && progress0 ? planProgress(progressKey, progress0, pulledDevices) : null;

    // Each domain updates its base, then writes its local value. Should a write throw (it cannot for
    // values that passed the schema), that domain's base goes back to what it was.
    let itemWrite: { pushes: ItemPush[]; holdCursor: boolean } = { pushes: [], holdCursor: false };
    let settingPushes: SettingPush[] = [];
    let devicePush: ReturnType<typeof writeProgress> = null;
    try {
      if (itemPlan && studyKey) itemWrite = guarded('items', () => writeItems(studyKey, items0!, itemPlan));
      settingPushes = guarded('settings', () => writeSettings(settings0, settingStamps0, settingPlan));
      if (progressPlan && progressKey) devicePush = guarded('progress', () => writeProgress(progressKey, progress0!, goalStamp0, progressPlan));
    } finally {
      saveState();
    }

    // Push: items, then settings, then this device's document. The base moves only on success.
    if (itemWrite.pushes.length > 0) {
      alive();
      await remote.pushItems(itemWrite.pushes.map((p) => p.item));
      alive();
      for (const p of itemWrite.pushes) {
        put(state.items.base, p.id, { s: p.sig, t: p.item.updatedAt, d: p.item.deviceId, f: p.fp });
        delete state.items.ignored[p.id];
        if (sameStamp(lookup(state.items.stamps, p.id), p.stamp)) delete state.items.stamps[p.id];
      }
    }
    if (pulledItems && !itemWrite.holdCursor) state.items.cursor = pulledItems.cursor;
    saveState();

    if (settingPushes.length > 0) {
      alive();
      await remote.pushSettings(settingPushes.map((p) => p.setting));
      alive();
      for (const p of settingPushes) {
        put(state.settings.base, p.key, { s: p.sig, t: p.setting.updatedAt, d: p.setting.deviceId });
        if (sameStamp(lookup(state.settings.stamps, p.key), p.stamp)) delete state.settings.stamps[p.key];
      }
      saveState();
    }

    if (devicePush) {
      alive();
      const doc: DeviceProgress = { ...devicePush.doc, updatedAt: now() };
      await remote.pushDevice(doc);
      alive();
      if (devicePush.goal) {
        recordPushedGoal(devicePush.goal, devicePush.goalStamp);
        saveState();
      }
    }
  }

  function guarded<T>(part: keyof SyncStateData, write: () => T): T {
    const snapshot = JSON.stringify(state[part]);
    try {
      return write();
    } catch (e) {
      (state as Record<keyof SyncStateData, unknown>)[part] = JSON.parse(snapshot);
      throw e;
    }
  }

  // ---- study items ----

  interface ItemPlanEntry {
    id: string;
    decision: Decision;
    remote?: CheckedItem;
    pulled: boolean;
  }

  function planItems(key: StorageKey<StudyItemsShape>, local: Map<string, LocalItem>, pulled: readonly PulledItem[]): ItemPlanEntry[] {
    // The latest pulled document per id (a pull may repeat ids).
    const remoteById = new Map<string, CheckedItem>();
    for (const raw of pulled) {
      const checked = checkPulledItem(key, raw);
      if (!checked) continue;
      const prev = remoteById.get(checked.item.id);
      if (!prev || (checked.item.serverTime ?? 0) >= (prev.item.serverTime ?? 0)) remoteById.set(checked.item.id, checked);
    }
    const { base, stamps, ignored } = state.items;
    const ids = new Set<string>([...local.keys(), ...Object.keys(base), ...remoteById.keys(), ...Object.keys(ignored), ...Object.keys(stamps)]);
    const plan: ItemPlanEntry[] = [];
    for (const id of ids) {
      const l = local.get(id);
      const r = remoteById.get(id);
      const b = lookup(base, id);
      const stamp = lookup(stamps, id);
      const phantom = lookup(ignored, id);
      const side: RemoteSide | undefined = r ? r.side : phantom ? { sig: null, valid: false, clock: phantom } : undefined;
      if (!b && !l && !side) {
        // Created and deleted again before the account ever had it: nothing to send. Drop the stamp.
        if (stamp) plan.push({ id, decision: { do: 'none' }, pulled: false });
        continue;
      }
      const decision = decide({
        localSig: l?.sig ?? null,
        own: l?.own ?? null,
        base: b,
        remote: side,
        seen: stamp?.at ?? now(),
        self,
        changed: stamp !== undefined || fingerprint(l) !== baseFingerprint(b, l),
      });
      if (decision.do !== 'none' || r) plan.push({ id, decision, remote: r, pulled: r !== undefined });
    }
    return plan;
  }

  function writeItems(key: StorageKey<StudyItemsShape>, l0s: ItemsL0, plan: ItemPlanEntry[]) {
    const value = storage.get(key);
    const local1 = readLocalFingerprints(value);
    const { stamps } = state.items;
    const pushes: ItemPush[] = [];
    let holdCursor = false;
    let changed = false;
    for (const { id, decision, remote: r, pulled } of plan) {
      const l0 = l0s.items.get(id);
      if (fingerprint(l0) !== (local1.get(id) ?? null) || !sameStamp(lookup(l0s.stamps, id), lookup(stamps, id))) {
        // Rule 5: changed during this run (even if back to the same value); keep the new value, sync
        // it next time. Pull it again then.
        if (pulled) holdCursor = true;
        continue;
      }
      switch (decision.do) {
        case 'take':
        case 'adopt': {
          const side = r!.side;
          const held = decision.do === 'take' ? (r!.entry === null ? undefined : localItemOf(r!.kind, r!.ref, r!.entry)) : l0;
          put(state.items.base, id, { s: side.sig, t: side.clock.t, d: side.clock.d, f: fingerprint(held) });
          delete state.items.ignored[id];
          delete stamps[id];
          if (decision.do === 'take') {
            setLocalItem(value, r!.kind, r!.ref, r!.entry);
            changed = true;
          }
          break;
        }
        case 'ignore':
          if (r) put(state.items.ignored, id, r.side.clock);
          break;
        case 'push': {
          const item = toRemoteItem(id, l0, decision.clock);
          if (item) pushes.push({ id, sig: l0?.sig ?? null, fp: fingerprint(l0), stamp: lookup(stamps, id), item });
          break;
        }
        case 'none':
          // Only planned for a stamp with nothing behind it (see planItems).
          if (!lookup(state.items.base, id) && !l0) delete stamps[id];
          break;
      }
    }
    // The base is already updated, so the write's own change notification finds nothing new.
    if (changed) storage.set(key, value);
    return { pushes, holdCursor };
  }

  // ---- settings ----

  interface SettingPlanEntry {
    key: StorageKey<unknown> & { key: SettingKey };
    decision: Decision;
    remote?: CheckedSetting;
  }

  function planSettings(local: Map<SettingKey, string>, pulled: readonly RemoteSetting[]): SettingPlanEntry[] {
    const plan: SettingPlanEntry[] = [];
    for (const k of settingKeys) {
      let r: CheckedSetting | undefined;
      for (const raw of pulled) r = checkPulledSetting(k, raw) ?? r;
      const base = lookup(state.settings.base, k.key);
      const localSig = local.get(k.key)!;
      const stamp = lookup(state.settings.stamps, k.key);
      const seen = stamp?.at ?? now();
      const changed = stamp !== undefined || localSig !== base?.s;
      let decision: Decision;
      if (base && !r) {
        // Linked, but the account has no value (any more): put the device's back.
        decision = { do: 'push', clock: changed ? { t: seen, d: self } : { t: base.t, d: base.d } };
      } else {
        decision = decideWhole({ localSig, base, remote: r?.side, seen, self, changed });
      }
      plan.push({ key: k, decision, remote: r });
    }
    return plan;
  }

  function writeSettings(local0: Map<SettingKey, string>, stamps0: Record<string, StampEntry>, plan: SettingPlanEntry[]): SettingPush[] {
    const pushes: SettingPush[] = [];
    const { stamps } = state.settings;
    for (const { key: k, decision, remote: r } of plan) {
      const current = storage.get(k);
      const sig = settingSig(current);
      if (sig !== local0.get(k.key) || !sameStamp(lookup(stamps0, k.key), lookup(stamps, k.key))) continue; // rule 5
      switch (decision.do) {
        case 'take':
        case 'adopt': {
          const side = r!.side;
          put(state.settings.base, k.key, { s: side.sig!, t: side.clock.t, d: side.clock.d });
          delete state.settings.stamps[k.key];
          if (decision.do === 'take') storage.set(k, r!.value);
          break;
        }
        case 'push': {
          const setting = toRemoteSetting(k.key, current, decision.clock);
          if (setting) pushes.push({ key: k.key, sig, stamp: lookup(stamps, k.key), setting });
          break;
        }
        case 'ignore':
        case 'none':
          break;
      }
    }
    return pushes;
  }

  // ---- reading progress ----

  interface ProgressPlan {
    docs: CleanDoc[];
    goal: Decision;
    remoteGoal?: { m: number; t: number; d: string };
  }

  function planProgress(key: StorageKey<ProgressShape>, local: ProgressShape, pulled: readonly DeviceProgress[]): ProgressPlan {
    const docs = checkDevices(key, local, pulled);
    reconcileOwnGoal(docs);
    const remoteGoal = bestGoal(docs);
    const base = state.progress.goal;
    const stamp = state.progress.goalStamp;
    const localSig = String(local.goalMinutes);
    const goal = decideWhole({
      localSig,
      base: base ? { s: String(base.m), t: base.t, d: base.d } : undefined,
      remote: remoteGoal ? { sig: String(remoteGoal.m), valid: true, clock: { t: remoteGoal.t, d: remoteGoal.d } } : undefined,
      seen: stamp?.at ?? now(),
      self,
      changed: stamp !== null || (base !== null && localSig !== String(base.m)),
    });
    return { docs, goal, remoteGoal };
  }

  /**
   * Rule 14 after a push whose outcome was unknown: only this device writes its own document, so a
   * goal there newer than the one it knows it sent was sent by it, and the acknowledgement was lost
   * (the run stopped or failed after the remote wrote it). Record it as sent: it is this device's
   * goal from now on, the base if it is newer, and its stamp is settled if no later change replaced it.
   */
  function reconcileOwnGoal(docs: readonly CleanDoc[]) {
    const sent = docs.find((d) => d.deviceId === self)?.goal;
    const p = state.progress;
    if (!sent || (p.ownGoal && p.ownGoal.updatedAt >= sent.updatedAt)) return;
    p.ownGoal = { minutes: sent.minutes, updatedAt: sent.updatedAt };
    const clock = { t: sent.updatedAt, d: self };
    if (!p.goal || beats(clock, p.goal)) p.goal = { m: sent.minutes, ...clock };
    if (p.goalStamp && p.goalStamp.s === String(sent.minutes) && p.goalStamp.at === sent.updatedAt) p.goalStamp = null;
  }

  /**
   * Writes the merged progress (rule 12). The merged `activeMs` and the fold that describes it must
   * agree, or minutes are counted twice (new progress, old fold: own = local − old fold) or lost (old
   * progress, new fold). Storage writes of two keys are not atomic, so the write goes:
   *   1. save the sync state as it was, with the OLD fold, plus `progress.pending` = { the new fold,
   *      the activeMs about to be written };
   *   2. write the progress;
   *   3. save the state with the new fold and no `pending` (the caller's saveState).
   * A crash before 1 or after 3 leaves a matching pair. A crash between 1 and 3 leaves `pending`, and
   * the next engine (resolvePendingFold, at creation and at each run) decides which side landed:
   * reading only ever adds to a day's count, so if every day of the stored activeMs is at least what
   * step 2 wrote, step 2 landed (take the new fold), and otherwise it did not (keep the old one).
   * The only misjudgement: step 2 did not land and, before the engine was created again, the app
   * recorded on every day step 2 would have raised at least as much new reading as step 2 would have
   * added. Then this device's own minutes come out low by that amount; they are never counted twice.
   * The goal and the other state for this write are also saved only in step 3, so a crash after step 2
   * at worst sends the taken goal back with a newer time (the same value).
   */
  function writeProgress(key: StorageKey<ProgressShape>, local0: ProgressShape, goalStamp0: StampEntry | null, plan: ProgressPlan) {
    const local1 = storage.get(key);
    const durable: SyncStateData['progress'] = JSON.parse(JSON.stringify(state.progress)) as SyncStateData['progress'];
    const { docs, goal: decision, remoteGoal } = plan;
    // Rule 5 for the goal: a goal changed during the run (even back to the same value) keeps its new
    // value and waits for the next run.
    const goalSettled = local1.goalMinutes === local0.goalMinutes && sameStamp(state.progress.goalStamp, goalStamp0);
    let goalMinutes = local1.goalMinutes;
    let pushedGoal: { minutes: number; updatedAt: number } | null = null;
    if (goalSettled && remoteGoal && (decision.do === 'take' || decision.do === 'adopt')) {
      goalMinutes = remoteGoal.m;
      state.progress.goal = { ...remoteGoal };
      state.progress.goalStamp = null;
    } else if (goalSettled && decision.do === 'push') {
      pushedGoal = { minutes: local0.goalMinutes, updatedAt: decision.clock.t };
    }

    // Minutes are merged arithmetically from the latest local value, so time read during the run is
    // kept (own = local − old fold) and goes out in this run's device document.
    const merged = mergeProgress(local1, docs, state.progress.fold, self, goalMinutes);
    state.progress.fold = merged.others;
    state.progress.sig = progressSig(merged.value);
    state.progress.pending = null;
    if (stableStringify(merged.value) !== stableStringify(local1)) {
      // The in-memory state is already the new one, so the write's own change notification finds
      // nothing new; the durable copy keeps the old progress state until the write is done.
      storage.set(stateKey, { ...state, progress: { ...durable, pending: { fold: merged.others, expect: merged.value.activeMs } } });
      storage.set(key, merged.value);
    }

    const goalStamp = state.progress.goalStamp ? { ...state.progress.goalStamp } : null;
    const doc = deviceDoc(self, merged.own, merged.value, pushedGoal ?? state.progress.ownGoal);
    const mine = docs.find((d) => d.deviceId === self);
    if (!sameDoc(mine, doc)) return { doc, goal: pushedGoal, goalStamp };
    // The account already holds exactly this document: nothing to send.
    if (pushedGoal) recordPushedGoal(pushedGoal, goalStamp);
    return null;
  }

  function recordPushedGoal({ minutes, updatedAt }: { minutes: number; updatedAt: number }, stamp: StampEntry | null) {
    state.progress.ownGoal = { minutes, updatedAt };
    state.progress.goal = { m: minutes, t: updatedAt, d: self };
    if (sameStamp(state.progress.goalStamp, stamp)) state.progress.goalStamp = null;
  }

  /** Settles a crash marker left by writeProgress (see there). */
  function resolvePendingFold() {
    const pending = state.progress.pending;
    if (!pending || !progressKey) return;
    const activeMs = storage.get(progressKey).activeMs;
    const landed = Object.entries(pending.expect).every(([day, ms]) => (lookup(activeMs, day) ?? 0) >= ms);
    if (landed) state.progress.fold = pending.fold;
    state.progress.pending = null;
    saveState();
  }

  // ---- the public face ----

  return {
    start() {
      if (phase === 'started') return;
      phase = 'started';
      failures = 0;
      const watch = <T>(k: StorageKey<T>, stamp: (at: number) => { stamped: boolean; dirty: boolean }) =>
        unsubscribes.push(storage.subscribe(k, () => onLocalChange(stamp)));
      if (studyKey) watch(studyKey, stampItems);
      for (const k of settingKeys) watch(k, stampSettings);
      if (progressKey) watch(progressKey, stampProgress);
      timers.first = setTimeout(() => {
        timers.first = undefined;
        void kick();
      }, 0);
      timers.interval = setInterval(() => void kick(), pullIntervalMs);
    },

    async stop() {
      gen++;
      phase = 'stopped';
      for (const u of unsubscribes) u();
      unsubscribes = [];
      clearTimers();
      const pending = again ?? inFlight;
      if (pending) await pending;
    },

    syncNow: () => kick(),

    status: () => status,

    subscribe(listener) {
      listeners.add(listener);
      return () => {
        listeners.delete(listener);
      };
    },
  };
}

