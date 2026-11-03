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
24. **Pulled Memory is untrusted.** Anyone holding the user's sign-in token can write any number of
    documents the rules accept, and no client can delete them. So, before the merge, a device ignores:
    - a row whose `lastReviewedAt` or `lapsedAt` is **more than one day ahead of its own clock** (the
      one-day slack the rules give `updatedAt`);
    - a row whose `nextDueAt` is **more than 18 days after its `lastReviewedAt`**: the longest interval
      the scheduler gives (16 days, `memory/schedule.ts` `reviewIntervalDays`; the bound is derived from
      it) plus two days for the end-of-day stamp (up to 36 hours after the review) and a DST hour. A row
      never reviewed may be due at most 18 days after the device's clock. A far-later date would take the
      verse out of the review schedule for good: a pass on a verse that is not yet due keeps its date;
    - a completed day, or a start, **more than one day after its local today**;
    - a row of a **verse its library does not know** (the 60 TMS verses today). This is what bounds
      local Memory progress.

    Each check covers one row or one day and depends only on the clock and the library, so the merge
    stays a join over what is accepted. A row skipped while this device's clock lags is joined on a
    later full pull (rule 25): the documents stay on the account. **A device never publishes such a
    row or day either.** Its push holds back rows reviewed or lapsed more than 23 hours ahead of its
    clock, rows due past the 18-day bound, and days after its local tomorrow. A held-back row goes out
    once real time reaches it. A document carries **at most 600 rows** (the ~500 verses of future
    libraries plus a fifth; the rules refuse more, at most 103 199 characters), and the merged progress
    keeps at most 600 too, the highest by rule 18–19's order. This backstop is still a join. **One pull
    reads at most 50 documents and at most about 1.5 MB** (it asks for no more documents than fit in
    what is left, each counted at the rules' largest), so a crowd of documents written once costs a
    device at most that, once (rule 25). **A Memory write that fails** (web storage full) does not stop
    study items, settings or reading progress: they still save and upload in that sync. The sync then
    reports the error and Memory pulls the same documents again on the next one.
25. **Memory pulls are incremental, and a device repairs its own document.** A device keeps a cursor
    per account: the latest server time of the Memory documents it has merged. A sync reads only the
    documents written after it, oldest first, at most rule 24's 50 documents / 1.5 MB; a pull cut short
    there goes on from where it stopped on the next sync, so nothing written after the cursor is
    skipped. This is sound because the merge is a join: what was merged is already in the device's
    values. Should those values be lost, the read of the device's own document below restores them.
    The cursor moves only once both Memory values are saved. Documents the device ignores (rule 21)
    still move it, so they are read once. **A full pull** (the newest documents, newest first)
    runs when there is no cursor (the first sync of this account on this device, or after its sync
    history was reset) and once a day: it picks up rows skipped for a clock bound or a verse the library
    did not know yet, which an incremental pull would not read again. A full pull never moves an existing
    cursor back or forward, so the incremental pulls still read everything after it.
    **A device uploads its document whenever the account's copy does not say what it would send.** The
    device takes the account's copy of its own document from the pull. When the pull does not return it,
    the device reads it by id (one document, bounded by the rules' size) in three cases: the pull was full,
    the incremental pull read any document (one may have been this device's and did not decode), or the
    device's values differ from its last acknowledged upload (they may have been lost: a key that reads
    back empty). Whatever of that copy passes rule 24 is merged into the device's values first, like any
    pulled document. So an upload never sends less than the account's copy held, and a device that lost
    its values gets them back. The copy is then compared with the values (both as the upload would write
    them and within rule 24's bounds), and the device uploads when they differ. A copy that is there but
    does not decode counts as differing. So **a blanked, altered or unreadable copy is repaired by the
    first sync that reads it**: the next one when the overwrite is new to an incremental pull, and the
    next full pull otherwise (the tie case below). It is not read when the incremental pull read nothing
    and the values were those of the last upload when the sync began. Then nobody wrote the copy since
    (except for the tie case below), and the device uploads only if its values changed during the sync,
    after reading its copy then and merging that copy into what it sends. Two more cases upload anyway.
    If the copy is missing, the device uploads it. On a full pull that did not return the copy, the device
    also uploads it, because the copy may have been crowded out of the newest documents, and a new
    device's first pull then finds it.

These merges are joins (commutative, associative, idempotent): any number of devices syncing in any
order, any number of times, end with the same values, and merging a value in again changes nothing. A
change made during a sync is joined into, never overwritten (rule 5). Known limits:
- A device whose clock runs fast wins a verse until real time passes its review time. Memory rows carry
  their own times, so there is no first-seen cap as for study items (rule 4). Rule 24 limits the lead to
  one day.
- A device clock that reads before 2026 (one reset to 1970, say) is known to be wrong. While it does, rule
  24's clock checks are off on that device (the 18-day due bound after a review still applies), and
  Memory syncs as it would without them.
- Someone writing with the user's token can push the real devices out of the newest documents a full pull
  reads (as few as 13 at the rules' largest size). The real devices upload theirs again at their next
  full pull, and incremental pulls skip nothing, so this delays a new device's first sync rather than
  losing anything; written continuously, it is a denial of sync, but no local progress is lost. A device
  that is no longer used does not upload again, so its last document can stay crowded out; its values
  are in the other devices' documents if they ever pulled it.
- Documents written in one commit share one server time. When a pull stops in the middle of them, the
  rest are skipped by the incremental pulls (the next starts after that time). Only a token holder
  writes several Memory documents in one commit; a device writes its own alone. An overwrite of a
  device's own document skipped this way is repaired at that device's next full pull (rule 25).
- A row ignored when it was pulled (a clock bound, an unknown verse) waits for the next full pull, up to
  a day, unless its device writes again first.
- A verse added to the library by a newer app version is ignored by devices on an older version until they
  update.
- The rules check every row's shape, but they cannot cap a verse id at 64 characters (the rules' regex
  engine, RE2, has no lookahead). They also accept impossible dates such as `2026-02-31`. A device drops a
  document like that whole when it reads it, history included.
- The document of a device no longer used keeps contributing what it last held. That is harmless: a join
  only adds what the account already had.

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
