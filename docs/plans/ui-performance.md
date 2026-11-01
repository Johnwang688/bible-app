# UI and performance plan

> **Superseded 2026-10-31 (John):** the frontend is being rebuilt in Expo / React Native (`docs/plans/app-rebuild.md`). PF-1 and VI-2a ship on the old frontend. CR-1, PF-2, PF-3 and UI-1 to UI-3 are cancelled there. Their findings and decisions carry into the rebuild: the bottom sheet, the loader race tests, the phone layout issues, the coin removal and Paper's AA colours.

Scoped 2026-10-31 from measurements of a production build (`next start` against the real FastAPI backend). The orchestrator's probe is `bible-app-work/perf/probe.mjs`; it runs at 1× and 4× CPU throttle, with phone and desktop viewports.

## What we measured (main @ 17fafd3)
- **First load is 1.6 MB, and 800 KB of that is images.**
  - The coin icon `denarius.png` is 581×589 and 652 KB, yet it's shown at 14–16 px.
  - The logos are 149 KB and 441 KB.
  - `/logo/openbible-logo.png` (the favicon, apple icon and AI avatar) **doesn't exist**, so it 404s.
- **JavaScript is moderate.** `/app` First Load JS is 165 kB gzipped (102 kB of it shared framework); CSS is 31 kB gzipped (214 KB raw, with every theme in one file). Nothing is code-split: the AI sidebar, quiz, words panel and mastery all ship in the first load.
- **First paint is fast:** 56 ms at 1×, about 200 ms at 4× throttle. No long tasks while scrolling.
  - **Measurement note:** the first 2D canvas context costs about 100 ms with software rendering, and 2.3 s in headless Chromium's default GPU mode. The galaxy/pink particle effect creates and clears a canvas on **every** theme, so every load pays that cost.
- **The app never idles.** At 4× throttle:
  - **Reader:** about 113 ms of script plus 146 ms of style recalculation every 5 s, at 30 fps.
  - **Home:** about 21 ms of script plus 144 ms of style every 5 s.
  - **Causes:**
    - the chapter-quiz countdown re-renders the whole 4,676-line `BibleApp` every 500 ms
    - the default theme keeps 12 blurred "smoke" wisps (hidden) and the wave SVG animating.
- **Chapter turns are fast locally** (24–80 ms at 4×), but every turn waits on a network round trip. There's no client cache, no prefetch of the next chapter, no `Cache-Control` and no compression on the API.
- **On phones (390 px):**
  - **Reader:**
    - chapter text runs underneath the fixed ‹ › buttons, the "OPEN PANEL" tab and the "Bible" pill
    - the top bar starts hidden, with no visible way to bring it back on touch.
  - **Verse popup:** see-through background, so verses show behind the buttons.
  - **Tap targets** under 40 px:
    - the highlight colours (17 px)
    - the sidebar close button (11×18)
    - voice settings (26 px)
    - the book/version buttons (31 px tall).
  - **Home:** "Continue reading" renders an empty box, and the bottom bar is five unlabelled icons.

## Decisions (John, 2026-10-31)
1. **Verse tools on phones become a bottom sheet:** a solid panel with large buttons. Desktop keeps the floating popup.
2. **Cut the themes now to Light, Dark and Paper,** following the device by default. Galaxy, pink, smoke, waves, dynamic and the other themes are retired, and accent colours come later. Saved themes map to the nearest mode.

## Coins (John, 2026-10-31)
**Retire the coin currency.** Coins were earned for the daily verse, daily tasks, quiz answers and mastery bonuses, but nothing has spent them since the shop was removed (`9c9ba8c`, May 2026). For a youth Bible app, paying for reading can crowd out the reason to read. Motivation comes from streaks, chapters explored (Surprise me), mastery and the planned group accountability.

- **CR-1** (`implementer-medium`, after VI-2a, since both touch `BibleApp.tsx` and the home screen) removes the coin UI:
  - the balance chip, the daily-task "+10" rewards and the claim flows
  - quiz and mastery coin amounts, and "Sign in to earn coins"
  - `CurrencyIcon`.

  Wallet data and endpoints stay in the backend, untouched, so the decision can be reversed; the frontend just stops calling them.

## Phases (in order; each goes through the claude-workflows gates and Sol review)
- **PF-1, assets** (`implementer-easy`): resize the coin and logos to their display sizes at 2×, at the same paths. Add the missing `openbible-logo.png`. Target: first-load images under 60 KB.
- **VI-2a, theme cut** (`implementer-medium`):
  - **Modes:** System (the default), Light (`default`), Dark (`dark`) and Paper (`paper`, a new sepia mode).
  - **Migration:** one mapping in `normalizeThemeId` for stored, synced and URL theme ids.
  - **Removal:** delete the retired themes' CSS and their decorations (smoke, waves, galaxy/pink canvas, the dynamic colour cycle).
  - **Acceptance:** Light and Dark computed styles are identical to before.
- **CR-1, retire coins:** see above.
- **PF-2, idle and navigation** (`implementer-hard`, raised from medium by the loader redesign):
  - **Loader:** redesign `loadChapter` as one state machine (John, 2026-10-31). Today a late, older response can overwrite a newer chapter, and the page-flip hand-off interacts with overlapping loads. The SM-1 reviews caught two fixes that each opened a new case: a flip after a plain load hangs, and Next after a failed Next stays on the error view. The tests are saved in `bible-app-work/perf/pf2-loader-tests.cjs` and become PF-2's acceptance tests.
  - **Countdown:** the quiz countdown moves into a small component, so `BibleApp` stops re-rendering every 500 ms.
  - **Client cache:** an in-memory chapter cache, plus a prefetch of the next and previous chapter after each load.
  - **Backend:** `Cache-Control` (content is immutable per build) and gzip on the API.
- **PF-3, code-splitting** (`implementer-medium`): load the AI sidebar, chapter quiz, words panel and mastery overview with `next/dynamic`.
- **UI-1, reader on phones:**
  - reserve space so the text never sits under the fixed controls, with safe-area insets
  - a visible way to bring back the book/chapter bar on touch
  - 44 px tap targets in the reader chrome.
- **UI-2, verse tools as a bottom sheet on phones:** opaque, with 44 px targets. It closes the pinch-zoom follow-up (HG-3a).
- **UI-3, home on phones:**
  - single-column cards
  - fix the empty "Continue reading" card
  - labels on the bottom bar.
- **Later, VI-2b, accent hues:** 6–8 contrast-checked accents across the three modes.

## Acceptance targets (re-measured with the probe after each phase)
- **First-load bytes:** under 800 KB, from 1.6 MB.
- **Idle reader at 4× throttle:** under 30 ms of script and under 30 ms of style per 5 s.
- **A prefetched next chapter** shows in under 50 ms with 300 ms of simulated network latency.
- **No layout regressions:** computed styles for Light and Dark stay identical across PF-1, PF-2 and PF-3. UI phases change only what their cards name.
