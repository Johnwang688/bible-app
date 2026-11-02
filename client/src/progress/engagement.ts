// The reading-time tracker. The reader reports what the reader is doing; this turns it into engaged time
// and chapter credit, and writes it to storage.
//
// - `interact` is a real interaction on a chapter (it opened, the reader scrolled, tapped a verse…), with
//   the furthest verse now on screen.
// - `tick` is the reader's heartbeat (every few seconds while the chapter is showing and the app is in front).
// - `pause` is called when the reader stops showing (the tab or the app goes to the background).
//
// Time between two reports on the same chapter counts, capped at MAX_GAP_MS. Heartbeats only count within
// IDLE_LIMIT_MS of the last real interaction, so a phone left open on a chapter stops earning time.
// Writes are batched: at most one every COMMIT_EVERY_MS, plus one on pause, on a change of chapter and when
// a chapter is credited, so scrolling does not write storage on every frame.
import { chapterKey, readingProgressKey, type ReadingProgress } from '../storage/keys';
import type { Storage } from '../storage/storage';
import { dayKey, qualifies } from './model';

export const MAX_GAP_MS = 15_000;
export const IDLE_LIMIT_MS = 60_000;
export const COMMIT_EVERY_MS = 5_000;

export interface ChapterInfo {
  bookNumber: number;
  chapter: number;
  /** Verses in the chapter as shown (the first translation). */
  totalVerses: number;
}

export interface EngagementTracker {
  interact(chapter: ChapterInfo, furthestVerse: number): void;
  tick(): void;
  pause(): void;
  /** Writes anything pending now. */
  flush(): void;
}

interface Pending {
  key: string;
  info: ChapterInfo;
  /** The day the time below was earned on. */
  day: string;
  ms: number;
  furthestVerse: number;
}

export function createEngagementTracker(opts: { storage: Storage; now?: () => number }): EngagementTracker {
  const now = opts.now ?? Date.now;
  let current: { key: string; info: ChapterInfo; lastReport: number | null; lastInteraction: number } | null = null;
  let pending: Pending | null = null;
  let lastCommit = now();

  const commit = () => {
    lastCommit = now();
    const p = pending;
    pending = null;
    if (!p || (p.ms === 0 && p.furthestVerse === 0)) return;
    const latest: ReadingProgress = opts.storage.get(readingProgressKey);
    if (latest.evidence.day !== p.day) latest.evidence = { day: p.day, chapters: {} };
    const prior = latest.evidence.chapters[p.key] ?? { furthestVerse: 0, engagedMs: 0 };
    const evidence = {
      furthestVerse: Math.max(prior.furthestVerse, Math.min(p.furthestVerse, p.info.totalVerses)),
      engagedMs: prior.engagedMs + Math.round(p.ms),
    };
    latest.evidence.chapters[p.key] = evidence;
    latest.activeMs[p.day] = (latest.activeMs[p.day] ?? 0) + Math.round(p.ms);
    if (!(p.key in latest.chaptersRead) && qualifies(evidence, p.info.totalVerses)) {
      latest.chaptersRead[p.key] = new Date(now()).toISOString();
    }
    if (latest.activeMs[p.day]! >= latest.goalMinutes * 60_000 && !latest.goalMetDays.includes(p.day)) {
      latest.goalMetDays = [...latest.goalMetDays, p.day].sort();
    }
    opts.storage.set(readingProgressKey, latest);
  };

  /** Adds time and evidence for the current chapter; commits when due. */
  const record = (t: number, furthestVerse: number) => {
    if (!current) return;
    const ms = current.lastReport === null ? 0 : Math.min(MAX_GAP_MS, Math.max(0, t - current.lastReport));
    current.lastReport = t;
    const day = dayKey(new Date(t));
    if (pending && (pending.key !== current.key || pending.day !== day)) commit();
    if (!pending) pending = { key: current.key, info: current.info, day, ms: 0, furthestVerse: 0 };
    pending.info = current.info;
    pending.ms += ms;
    pending.furthestVerse = Math.max(pending.furthestVerse, furthestVerse);
    if (t - lastCommit >= COMMIT_EVERY_MS || wouldCredit()) commit();
  };

  // Commits at once when the pending time would credit the chapter, so the map updates without waiting.
  const wouldCredit = () => {
    if (!pending) return false;
    const stored = opts.storage.get(readingProgressKey);
    if (pending.key in stored.chaptersRead) return false;
    const prior = stored.evidence.day === pending.day ? stored.evidence.chapters[pending.key] : undefined;
    return qualifies(
      {
        furthestVerse: Math.max(prior?.furthestVerse ?? 0, Math.min(pending.furthestVerse, pending.info.totalVerses)),
        engagedMs: (prior?.engagedMs ?? 0) + pending.ms,
      },
      pending.info.totalVerses,
    );
  };

  return {
    interact(info, furthestVerse) {
      const t = now();
      const key = chapterKey(info.bookNumber, info.chapter);
      if (!current || current.key !== key) {
        // A new chapter: its clock starts now; nothing carries over from the last one.
        current = { key, info, lastReport: null, lastInteraction: t };
      }
      current.info = info;
      current.lastInteraction = t;
      record(t, furthestVerse);
    },
    tick() {
      const t = now();
      if (!current || current.lastReport === null) return;
      if (t - current.lastInteraction > IDLE_LIMIT_MS) {
        // Idle: stop the clock until the next interaction.
        current.lastReport = null;
        commit();
        return;
      }
      record(t, 0);
    },
    pause() {
      // The time up to the pause counts, as a heartbeat would.
      const t = now();
      if (current && current.lastReport !== null && t - current.lastInteraction <= IDLE_LIMIT_MS) record(t, 0);
      if (current) current.lastReport = null;
      commit();
    },
    flush: commit,
  };
}
