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

## Not synced (yet)
Reading position, reading settings (text size, parallel translation) and recent passages stay on each
device. Sync runs on sign-in, on app start and return to the foreground, a few seconds after a local
change, every few minutes while open, and on "Sync now".
