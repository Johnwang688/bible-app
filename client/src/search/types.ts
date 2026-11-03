// Shared search types (R-5, orchestrator-owned).

/** A passage: a book, optionally a chapter, optionally verses `start`–`end` (both present or both absent). */
export interface PassageRef {
  bookNumber: number;
  chapter?: number;
  start?: number;
  end?: number;
}
