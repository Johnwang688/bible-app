// The client-clock bound the sync push path shares (no Firestore imports, so the engine can use it
// without loading the Firestore adapter; engine tests run against the memory remote).

/**
 * How far ahead of this device's clock a client clock may be and still be written. The rules allow one
 * day ahead of the server's clock; the hour less is the margin for skew between the two clocks. The
 * Firestore adapter holds back what is stamped past it (firestoreRemote.ts, "The push path"), and the
 * engine compares its device document with the account's copy as the adapter would send it.
 */
export const CLOCK_AHEAD_MAX_MS = 23 * 3_600_000;
