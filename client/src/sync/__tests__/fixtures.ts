// Test fixtures (orchestrator-owned): storage keys with the same names, versions and schemas as R-3's
// `studyItemsKey` (v2) and `readingProgressKey`, and two main keys for settings, plus a harness for
// "devices" sharing one remote.
import { z } from 'zod';

import { appearanceKey, languageKey } from '../../storage/keys';
import { createStorage, memoryBackend, type Storage, type StorageKey } from '../../storage/storage';
import { HIGHLIGHT_IDS } from '../../theme/highlights';
import { createSyncEngine } from '../engine';
import type { MemoryRemote } from '../memoryRemote';
import type { ProgressShape, StudyItemsShape, SyncDomains } from '../shapes';
import type { SyncEngine } from '../types';

const refKeySchema = z.string().regex(/^([1-9]|[1-5]\d|6[0-6]):([1-9]\d{0,2}):([1-9]\d{0,2})$/);

export const studyKey: StorageKey<StudyItemsShape> = {
  key: 'study.items',
  version: 2,
  schema: z.object({
    highlights: z.record(refKeySchema, z.object({ colour: z.enum(HIGHLIGHT_IDS), updatedAt: z.string() })),
    notes: z.record(refKeySchema, z.object({ text: z.string().min(1).max(5000), updatedAt: z.string() })),
    bookmarks: z.record(refKeySchema, z.object({ createdAt: z.string() })),
  }),
  fallback: { highlights: {}, notes: {}, bookmarks: {} },
};

const day = z.string().regex(/^\d{4}-\d{2}-\d{2}$/);
const chapter = z.string().regex(/^([1-9]|[1-5]\d|6[0-6]):([1-9]\d{0,2})$/);

export const progressKey: StorageKey<ProgressShape> = {
  key: 'reading.progress',
  version: 1,
  schema: z.object({
    goalMinutes: z.number().int().min(5).max(120).multipleOf(5),
    activeMs: z.record(day, z.number().int().min(0)),
    goalMetDays: z.array(day),
    chaptersRead: z.record(chapter, z.string()),
    evidence: z.object({
      day: z.union([z.literal(''), day]),
      chapters: z.record(chapter, z.object({ furthestVerse: z.number().int().min(0), engagedMs: z.number().int().min(0) })),
    }),
  }),
  fallback: { goalMinutes: 10, activeMs: {}, goalMetDays: [], chaptersRead: {}, evidence: { day: '', chapters: {} } },
};

export const DOMAINS: SyncDomains = {
  studyItems: studyKey,
  progress: progressKey,
  settings: [appearanceKey as StorageKey<unknown>, languageKey as StorageKey<unknown>],
};

export interface Device {
  storage: Storage;
  engine: SyncEngine;
  /** The device's clock (ms). Tests move it with `tick`. */
  clock: { now: number };
  tick(ms: number): void;
  /** A fresh engine on the same storage (as after an app restart or a sign-in again). */
  restart(uid?: string): SyncEngine;
}

export function makeDevice(
  remote: MemoryRemote,
  deviceId: string,
  opts: { uid?: string; storage?: Storage; start?: number; domains?: SyncDomains } = {},
): Device {
  const storage = opts.storage ?? createStorage(memoryBackend());
  const clock = { now: opts.start ?? 1_000_000 };
  const make = (uid: string) =>
    createSyncEngine({
      uid,
      storage,
      remote,
      domains: opts.domains ?? DOMAINS,
      deviceId,
      now: () => clock.now,
      debounceMs: 60_000,
    });
  const device: Device = {
    storage,
    engine: make(opts.uid ?? 'alice'),
    clock,
    tick: (ms) => void (clock.now += ms),
    restart: (uid) => (device.engine = make(uid ?? opts.uid ?? 'alice')),
  };
  return device;
}

export const iso = (ms: number) => new Date(ms).toISOString();

export function setHighlight(s: Storage, ref: string, colour: (typeof HIGHLIGHT_IDS)[number], atMs: number) {
  const v = s.get(studyKey);
  v.highlights[ref] = { colour, updatedAt: iso(atMs) };
  s.set(studyKey, v);
}

export function setNote(s: Storage, ref: string, text: string, atMs: number) {
  const v = s.get(studyKey);
  v.notes[ref] = { text, updatedAt: iso(atMs) };
  s.set(studyKey, v);
}

export function removeItem(s: Storage, kind: 'highlights' | 'notes' | 'bookmarks', ref: string) {
  const v = s.get(studyKey);
  delete v[kind][ref];
  s.set(studyKey, v);
}
