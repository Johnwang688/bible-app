# Pause handoff (2026-10-31)

**Goal:** build "Surprise me" (SM-1), then the UI and performance work (`docs/plans/ui-performance.md`). Follow the claude-workflows procedure throughout.

## Done
- **PRs #1–#6** are merged on GitHub, and local main is synced (plus the UI/perf plan commit 19bede1).
- **Plans:** commentary (`docs/plans/commentary.md`; John is working on it himself, so don't start CM-*) and UI/perf (`docs/plans/ui-performance.md`, with the measured baseline and John's decisions).
- **SM-1 on branch `sm-surprise`** (worktree `C:/dev/bible-app-wt/sm-surprise`), not merged:
  - built (a1823fe), test fix (3383825)
  - Sol round 1 tests (800880a), fix 1 (907c059), Sol round 2 tests (2f611ac).

## Next
1. **Re-run SM-1 fix 2 with `implementer-hard`.** The card is `C:/dev/bible-app-work/sm/SM-1-fix2.md`.
   - I stopped the first run mid-edit at the pause. Its partial diff is saved in `sm/SM-1-fix2-partial.patch` for reference only, and the worktree is clean.
   - Run: `cd C:/dev/bible-app-work/sm && python C:/myday/hub/lean.py implementer-hard --cwd C:/dev/bible-app-wt/sm-surprise --prompt-file C:/dev/bible-app-work/sm/SM-1-fix2.md --schema change --max-turns 60 > SM-1-fix2-result.json 2> SM-1-fix2-stderr.txt`
2. **Gates:** `bash C:/dev/bible-app-work/sm/gates-sm1.sh`. Expect 89 e2e twice, styles identical, and only home/home-stored differing in the DOM snapshots.
3. **Sol round 3:** `cx resume sm1-r1 "<delta prompt>"` on `git diff 2f611ac..HEAD`. If the same class of bug is caught again after `implementer-hard`, stop and ask John (5a).
4. **Merge SM-1:** locally, then a PR to GitHub. John approved PRs plus merging after review and green tests.
5. **PF-1 (images):** worktree `C:/dev/bible-app-wt/pf-1-assets` (branch `pf-1-assets`, `npm ci` done). Copy the draft test `C:/dev/bible-app-work/perf/pf1-assets.test.cjs` into `review-tests/`, confirm it fails, commit, then write the card (`implementer-easy`):
   - resize with `sharp` at the same paths
   - add the missing `public/logo/openbible-logo.png`
   - no code changes.
6. **Then, in plan order:** VI-2a (cut to System/Light/Dark/Paper and delete the retired themes' CSS and decorations), PF-2, PF-3, UI-1, UI-2 (phone bottom sheet), UI-3.

## State
- **Nothing is running:** no workers and no Sol jobs. The perf servers (backend :8000, `next start` :3100) are stopped.
- **The perf probe** is `C:/dev/bible-app-work/perf/probe.mjs`. Copy it into `frontend-next/` to run, since it needs `@playwright/test`.
  - Baselines are in `perf/results/main-g1.json` and `main-g4.json`.
  - Phone screenshots are in `perf/phone/`.
- **Logs:** `C:/dev/bible-app-work/sm/log.jsonl` and `hg/log.jsonl`.
- **Uncommitted:** only John's untracked `docs/briefings/`, which I leave alone.

## Gotchas
- **Headless GPU:** headless Chromium's default GPU path makes the first canvas `getContext` take about 2.3 s. Run perf probes with `--disable-gpu`. The probe's `homeVisibleMs` includes a fixed 1.5 s wait, so ignore it.
- **Sol's harness tests** evaluate `BibleApp` callbacks with a fixed set of names. Any new ref a fix needs must be named in the card and added to the harness env (`chapterLoadSeqRef`, `chapterLoadDoneRef`).
- **Unit tests across `vm` realms** must spread results before a strict deep-equal (that was my SM-1 test bug).
- **Overlapping runs:** don't overlap Playwright runs: Sol's, the gates' and the probe's.
- **John's decisions:**
  - verse tools become a bottom sheet on phones
  - themes are cut now to Light/Dark/Paper, following the device; stored `default` maps to system
  - BSB is the default translation
  - commentary is on hold for John.
