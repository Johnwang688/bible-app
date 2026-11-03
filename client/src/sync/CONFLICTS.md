# Sync conflict rules (R-6b)

Sync is optional and local-first: the device's storage is always the copy the app reads and writes.
When signed in, the sync engine (`engine.ts`) merges the device with the account's data in Firestore
(layout in `types.ts`). These rules decide every conflict. `__tests__/engine.test.ts` tests each one.

## Study items (highlights, notes, bookmarks)
1. **Each item syncs on its own.** An item is one kind on one verse (`note:43:3:16`). Two devices
   changing different items never conflict.
2. **The newest change wins** (last writer wins on the change time). Equal times: the larger device id
   wins, so every device picks the same winner.
3. **A deletion is a change too.** It is stored as a tombstone with its time. A newer deletion beats
   an older edit; a newer edit beats an older deletion (the item comes back).
4. **A change's time** is the item's own time when it has one (a note's or highlight's `updatedAt`, a
   bookmark's `createdAt`; not R-3's `UNKNOWN_TIME`), capped at the moment the sync engine first saw
   the change, so a fast clock cannot win forever. Otherwise (deletions, old highlights) it is that
   first-seen moment. The first-seen moment is saved and kept across failed syncs; it changes only
   when the item changes again.
5. **A change made during a sync is never overwritten by that sync.** It goes out on the next one.
6. **Remote values the device cannot store** (they fail the storage schema) are ignored on both sides.
7. **First sign-in to an account on a device** (no sync history for that account here): the device's
   items and the account's are combined, item by item, with rule 2. Nothing on the device is deleted
   except by an account tombstone newer than the device's item.
8. **Signing out keeps everything on the device.** The sync history is kept per account: signing in
   again as the same account resumes from it (and deletions made while signed out are then sent);
   signing in as another account is a first sign-in (rule 7).

## Settings (appearance, custom appearance, language)
9. **Each setting syncs as a whole value; the newest change wins** (time = first seen by the engine;
   ties by device id).
10. **First sign-in on a device takes the account's value** if the account has one; otherwise the
    device's value is uploaded. Signing in on a new phone brings your look and language with you.

## Reading progress
11. **Each device uploads only its own progress** (`users/{uid}/devices/{deviceId}`), so devices never
    overwrite each other.
12. **Minutes read on a day are the sum over devices.** The engine adds the other devices' minutes into
    the device's own count and remembers how much it added, so the device's own part is never sent
    twice.
13. **Chapters read and goal-met days are unions**; a chapter keeps its earliest credit time.
14. **The daily goal: the newest change wins** across devices; on first sign-in the account's goal wins
    if any device set one (as rule 10).
15. **Today's chapter evidence** (dwell tracking) stays on the device.

## Memory (the verse trainer)
17. **Each device uploads only its own Memory document** (`users/{uid}/memory/{deviceId}`). It carries the
    device's merged progress and history, so every document is part of the account's Memory.
18. **Per verse, the newer review wins, as a whole row.** The row whose `lastReviewedAt` is later is kept
    with all its fields (stage, counts, mastery, schedule, lapse); two rows are never mixed. A verse
    never reviewed loses to one reviewed. A verse only one side has is kept.
19. **Equal review times** go to the row with more attempts (successes + failures), then to the larger
    wire encoding of the row, so every device picks the same row whichever order it merges in.
20. **Completed days are a union** (sorted, no repeats), keeping the latest 1000 (the storage cap); **the
    start is the earliest** known start. The streak is never stored or synced: each device derives it
    from the merged days, so a day completed on either device counts on both.
21. **A Memory document, or a part of one (progress, history), the device cannot store** (it fails the
    storage schema) is ignored, as rule 6. The device's own data stays.
22. **First sign-in on a device, or signing in as another account,** combines the device's Memory with
    the account's by rules 18–20; nothing on the device is lost. **Signing out keeps everything** (rule 8).
23. **The day's lesson plan (`memory.lesson`) and the Memory settings (`memory.settings`, which carries the
    voice consent: a per-device answer) stay on the device.** A new device builds its own plan from the
    synced progress.

These merges are joins (commutative, associative, idempotent): any number of devices syncing in any
order, any number of times, end with the same values, and merging a value in again changes nothing. A
change made during a sync is joined into, never overwritten (rule 5). Known limits: a device whose clock
runs fast wins a verse until real time passes its review time (Memory rows carry their own times, so
there is no first-seen cap as for study items, rule 4); and the document of a device no longer used
keeps contributing what it last held (harmless: a join only adds what the account already had).

## Crash safety
The app can be killed at any moment, also between two storage writes of one sync. A sync that
changes local values (study items, a setting, reading progress) first saves a journal in its state:
a fresh id, and for each value it is about to write, what that write means for the sync history (the
new last-synced value and clock, the reading-minutes fold, the goal). Each value is then written
together with that id, in the same storage write, and the journal is cleared after the last one. On the
next start, and before every sync, the engine settles a journal it finds: a value that carries the
journal's id was written, so its history moves on; any other was not, so its history stays as it was.
It never guesses from the values themselves, so reading or editing done before sync starts again is
never mistaken for the engine's write: it is simply a local change (rule 5). After a crash the device
therefore ends up exactly as if the interrupted sync had either finished or never run: no change is
sent back as newer than it is, no minutes are counted twice or lost, no clock is lost.
(`journal.ts`; `__tests__/journal.unit.test.ts` crashes after every single write.)
Memory's writes need no journal: each is "the local value joined with the account's", which only adds,
and no stamp or base describes it. A crash between the progress and the history write leaves one key
joined and the other as it was; nothing is lost, nothing looks newer than it is, and the next sync joins
the same documents again and completes it (`engine.ts` header; the same crash sweep covers Memory).

## Changes the account cannot take yet
16. **A change the account cannot take yet stays pending and is retried.** The account refuses a
    change time more than a day ahead of the server's clock (a device whose clock ran ahead when the
    change was made). Such a study item or setting is held back on this device, as is one the server
    refuses on its own while the rest of its batch is written. It keeps its pending change (its
    first-seen stamp and its last-synced value stay as they were) and is sent again on every later
    sync, until the account takes it. This shows no error and starts no extra sync: it waits for the
    next ordinary one. A value the account can never take (it fails the account's rules) is not
    retried; it stays on the device. (`firestoreRemote.ts`; `__tests__/s51HeldBack.unit.test.ts`.)

## Not synced (yet)
Reading position, reading settings (text size, parallel translation) and recent passages stay on each
device, as do Memory's day plan and settings (rule 23). Sync runs on sign-in, on app start and return to the foreground, a few seconds after a local
change, every few minutes while open, and on "Sync now".
