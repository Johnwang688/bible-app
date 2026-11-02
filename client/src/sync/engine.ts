// The sync engine (R-6b): local-first sync of study items, reading progress and settings for one
// signed-in account. Device storage is always the copy the app reads and writes; a run pulls the
// account's copy, merges each entry with the local value and the base (the last synced state) per
// CONFLICTS.md, writes the merged local values, pushes what the account lacks and saves the new base.
//
// Concurrency: one run at a time. Every `await` lets the app write storage, so a run reads the local
// values at its start (L0) and again just before writing (L1); an entry that changed in between keeps
// its new value and stays pending for the next run (rule 5). The local write and the base update happen
// synchronously together. After stop() resolves, no local write, base write or remote call happens.
import type { Storage, StorageKey } from '../storage/storage';
import { checkPulledItem, readLocalItems, readLocalSigs, setLocalItem, toRemoteItem, type CheckedItem, type LocalItem } from './domains/items';
import { bestGoal, checkDevices, deviceDoc, mergeProgress, progressSig, sameDoc, type CleanDoc } from './domains/progress';
import { checkPulledSetting, isSettingKey, settingSig, toRemoteSetting, type CheckedSetting } from './domains/settings';
import { decide, decideWhole, lookup, put, restamp, stableStringify, type Decision, type RemoteSide } from './merge';
import type { ProgressShape, StudyItemsShape, SyncDomains } from './shapes';
import { deviceIdKey, isDeviceId, isValidUid, syncStateKey, type SyncStateData } from './state';
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
  item: RemoteItem;
}

interface SettingPush {
  key: SettingKey;
  sig: string;
  setting: RemoteSetting;
}

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

  // ---- stamps (rule 4) and change detection ----

  /** Stamps the pending study item changes. Returns whether a stamp was created or renewed, and whether state changed. */
  function stampItems(at: number): { stamped: boolean; dirty: boolean } {
    const res = { stamped: false, dirty: false };
    if (!studyKey) return res;
    const local = readLocalSigs(storage.get(studyKey));
    const { base, stamps } = state.items;
    const ids = new Set<string>([...local.keys(), ...Object.keys(base), ...Object.keys(stamps)]);
    for (const id of ids) note(res, restamp(stamps, id, local.get(id) ?? null, lookup(base, id)?.s ?? null, at));
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

  function note(res: { stamped: boolean; dirty: boolean }, r: 'stamped' | 'cleared' | null) {
    if (r === 'stamped') res.stamped = res.dirty = true;
    else if (r === 'cleared') res.dirty = true;
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

  /** Runs now, or joins the run in flight and runs once more after it (shared by every caller waiting). */
  function kick(): Promise<void> {
    if (phase === 'stopped') return Promise.resolve();
    if (inFlight) {
      again ??= inFlight.then(() => {
        again = null;
        return kick();
      });
      return again;
    }
    const run: Promise<void> = runOnce(gen).finally(() => {
      if (inFlight === run) inFlight = null;
    });
    inFlight = run;
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
    // Stamp what changed while not watching (rule 4), then read the local values (L0).
    const t0 = now();
    const s1 = stampItems(t0);
    const s2 = stampSettings(t0);
    const s3 = stampProgress(t0);
    if (s1.dirty || s2.dirty || s3.dirty) saveState();

    const items0 = studyKey ? readLocalItems(storage.get(studyKey)) : null;
    const settings0 = new Map(settingKeys.map((k) => [k.key, settingSig(storage.get(k))]));
    const progress0 = progressKey ? storage.get(progressKey) : null;

    // Pull.
    alive();
    const pulledSettings = settingKeys.length > 0 ? await remote.pullSettings() : [];
    alive();
    const pulledDevices = progressKey ? await remote.pullDevices() : [];
    alive();
    const pulledItems = studyKey ? await remote.pullItems(state.items.cursor) : null;
    alive();

    // Merge and write the local values together with the base (synchronous: nothing interleaves).
    const itemPlan = studyKey && items0 && pulledItems ? planItems(studyKey, items0, pulledItems.items) : null;
    const settingPlan = planSettings(settings0, pulledSettings);
    const progressPlan = progressKey && progress0 ? planProgress(progressKey, progress0, pulledDevices) : null;

    // Each domain updates its base, then writes its local value. Should a write throw (it cannot for
    // values that passed the schema), that domain's base goes back to what it was.
    let itemWrite: { pushes: ItemPush[]; holdCursor: boolean } = { pushes: [], holdCursor: false };
    let settingPushes: SettingPush[] = [];
    let devicePush: ReturnType<typeof writeProgress> = null;
    try {
      if (itemPlan && studyKey) itemWrite = guarded('items', () => writeItems(studyKey, items0!, itemPlan));
      settingPushes = guarded('settings', () => writeSettings(settings0, settingPlan));
      if (progressPlan && progressKey) devicePush = guarded('progress', () => writeProgress(progressKey, progress0!, progressPlan));
    } finally {
      saveState();
    }

    // Push: items, then settings, then this device's document. The base moves only on success.
    if (itemWrite.pushes.length > 0) {
      alive();
      await remote.pushItems(itemWrite.pushes.map((p) => p.item));
      alive();
      for (const p of itemWrite.pushes) {
        put(state.items.base, p.id, { s: p.sig, t: p.item.updatedAt, d: p.item.deviceId });
        delete state.items.ignored[p.id];
        if (lookup(state.items.stamps, p.id)?.s === p.sig) delete state.items.stamps[p.id];
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
        if (lookup(state.settings.stamps, p.key)?.s === p.sig) delete state.settings.stamps[p.key];
      }
      saveState();
    }

    if (devicePush) {
      alive();
      const doc: DeviceProgress = { ...devicePush.doc, updatedAt: now() };
      await remote.pushDevice(doc);
      alive();
      if (devicePush.goal) {
        recordPushedGoal(devicePush.goal);
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
    const ids = new Set<string>([...local.keys(), ...Object.keys(base), ...remoteById.keys(), ...Object.keys(ignored)]);
    const plan: ItemPlanEntry[] = [];
    for (const id of ids) {
      const l = local.get(id);
      const r = remoteById.get(id);
      const phantom = lookup(ignored, id);
      const side: RemoteSide | undefined = r ? r.side : phantom ? { sig: null, valid: false, clock: phantom } : undefined;
      const decision = decide({
        localSig: l?.sig ?? null,
        own: l?.own ?? null,
        base: lookup(base, id),
        remote: side,
        seen: lookup(stamps, id)?.at ?? now(),
        self,
      });
      if (decision.do !== 'none' || r) plan.push({ id, decision, remote: r, pulled: r !== undefined });
    }
    return plan;
  }

  function writeItems(key: StorageKey<StudyItemsShape>, local0: Map<string, LocalItem>, plan: ItemPlanEntry[]) {
    const value = storage.get(key);
    const local1 = readLocalSigs(value);
    const pushes: ItemPush[] = [];
    let holdCursor = false;
    let changed = false;
    for (const { id, decision, remote: r, pulled } of plan) {
      const l0 = local0.get(id);
      if ((l0?.sig ?? null) !== (local1.get(id) ?? null)) {
        // Rule 5: changed during this run; keep the new value, sync it next time. Pull it again then.
        if (pulled) holdCursor = true;
        continue;
      }
      switch (decision.do) {
        case 'take':
        case 'adopt': {
          const side = r!.side;
          put(state.items.base, id, { s: side.sig, t: side.clock.t, d: side.clock.d });
          delete state.items.ignored[id];
          delete state.items.stamps[id];
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
          if (item) pushes.push({ id, sig: l0?.sig ?? null, item });
          break;
        }
        case 'none':
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
      const seen = lookup(state.settings.stamps, k.key)?.at ?? now();
      let decision: Decision;
      if (base && !r) {
        // Linked, but the account has no value (any more): put the device's back.
        decision = { do: 'push', clock: localSig === base.s ? { t: base.t, d: base.d } : { t: seen, d: self } };
      } else {
        decision = decideWhole({ localSig, base, remote: r?.side, seen, self });
      }
      plan.push({ key: k, decision, remote: r });
    }
    return plan;
  }

  function writeSettings(local0: Map<SettingKey, string>, plan: SettingPlanEntry[]): SettingPush[] {
    const pushes: SettingPush[] = [];
    for (const { key: k, decision, remote: r } of plan) {
      const current = storage.get(k);
      const sig = settingSig(current);
      if (sig !== local0.get(k.key)) continue; // rule 5
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
          if (setting) pushes.push({ key: k.key, sig, setting });
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
    const remoteGoal = bestGoal(docs);
    const base = state.progress.goal;
    const goal = decideWhole({
      localSig: String(local.goalMinutes),
      base: base ? { s: String(base.m), t: base.t, d: base.d } : undefined,
      remote: remoteGoal ? { sig: String(remoteGoal.m), valid: true, clock: { t: remoteGoal.t, d: remoteGoal.d } } : undefined,
      seen: state.progress.goalStamp?.at ?? now(),
      self,
    });
    return { docs, goal, remoteGoal };
  }

  function writeProgress(key: StorageKey<ProgressShape>, local0: ProgressShape, plan: ProgressPlan) {
    const local1 = storage.get(key);
    const { docs, goal: decision, remoteGoal } = plan;
    // Rule 5 for the goal: a goal changed during the run keeps its new value and waits for the next run.
    const goalSettled = local1.goalMinutes === local0.goalMinutes;
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
    if (stableStringify(merged.value) !== stableStringify(local1)) storage.set(key, merged.value);

    const doc = deviceDoc(self, merged.own, merged.value, pushedGoal ?? state.progress.ownGoal);
    const mine = docs.find((d) => d.deviceId === self);
    if (!sameDoc(mine, doc)) return { doc, goal: pushedGoal };
    // The account already holds exactly this document: nothing to send.
    if (pushedGoal) recordPushedGoal(pushedGoal);
    return null;
  }

  function recordPushedGoal({ minutes, updatedAt }: { minutes: number; updatedAt: number }) {
    state.progress.ownGoal = { minutes, updatedAt };
    state.progress.goal = { m: minutes, t: updatedAt, d: self };
    if (state.progress.goalStamp?.s === String(minutes)) state.progress.goalStamp = null;
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

