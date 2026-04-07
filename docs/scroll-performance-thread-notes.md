# Scroll Performance Thread Notes

This file documents the changes made during the scroll-performance debugging/optimization thread so they can be reverted later if needed.

Note: line numbers below are the current line numbers at the time this note was written. If the files change later, these references may drift.

## Files touched

- [frontend-next/src/components/BibleApp.tsx](/c:/Users/johnw/OneDrive/Desktop/bible-app/frontend-next/src/components/BibleApp.tsx)
- [frontend-next/src/app/globals.css](/c:/Users/johnw/OneDrive/Desktop/bible-app/frontend-next/src/app/globals.css)

## BibleApp.tsx changes

### 1. Added scroll/perf tuning constants

- [frontend-next/src/components/BibleApp.tsx#L184](/c:/Users/johnw/OneDrive/Desktop/bible-app/frontend-next/src/components/BibleApp.tsx#L184)
- Added:
  - `SCROLL_ACTIVE_HOLD_MS`
  - `ENGAGEMENT_COMMIT_MS`
  - `COMMENTARY_SYNC_THROTTLE_MS`

Revert if you want to remove the scroll-active downgrade timing and throttling behavior.

### 2. Added refs for cached visible verse, throttled progress, deferred commentary sync, and scroll-active state

- [frontend-next/src/components/BibleApp.tsx#L783](/c:/Users/johnw/OneDrive/Desktop/bible-app/frontend-next/src/components/BibleApp.tsx#L783)
- Added:
  - `visibleVersesRef`
  - `topVisibleVerseRef`
  - `verseObserverRef`
  - `engagementTimerRef`
  - `pendingEngagementRef`
  - `lastEngagementCommitAtRef`
  - `commentarySyncTimerRef`
  - `lastCommentarySyncAtRef`
  - `scrollActiveTimerRef`
  - `scrollEffectsDowngradedRef`
  - `chromeVisibleRef`
  - `commentarySyncIdleTimerRef`

Revert if you want to remove the caching/throttling/deferred-sync infrastructure.

### 3. Synced `chromeVisibleRef` with React state

- [frontend-next/src/components/BibleApp.tsx#L814](/c:/Users/johnw/OneDrive/Desktop/bible-app/frontend-next/src/components/BibleApp.tsx#L814)

Revert if you remove the optimized chrome visibility updates.

### 4. Added cached top-visible-verse helpers and deferred reading progress commit logic

- [frontend-next/src/components/BibleApp.tsx#L1533](/c:/Users/johnw/OneDrive/Desktop/bible-app/frontend-next/src/components/BibleApp.tsx#L1533)
- Added:
  - `computeTopVisibleVerseFromDom`
  - `updateTopVisibleVerse`
  - `getTopVisibleVerse`
  - `flushPendingEngagement`
  - `scheduleReadingProgressCommit`
  - `markScrollActive`

Revert if you want to return to the old direct scroll-time verse lookup and direct `setReadingProgress(...)` behavior.

### 5. Replaced the old direct commentary sync scheduling with throttled/deferred sync

- [frontend-next/src/components/BibleApp.tsx#L2061](/c:/Users/johnw/OneDrive/Desktop/bible-app/frontend-next/src/components/BibleApp.tsx#L2061)
- Added:
  - throttled `requestCommentarySync(...)`
  - `scheduleCommentarySyncAfterScroll(...)`

Revert if you want commentary sync to happen immediately from the scroll handler again.

### 6. Added `IntersectionObserver`-based visible verse tracking

- [frontend-next/src/components/BibleApp.tsx#L2123](/c:/Users/johnw/OneDrive/Desktop/bible-app/frontend-next/src/components/BibleApp.tsx#L2123)

This effect observes `.verse-line[data-verse]` nodes and updates the cached top visible verse.

Revert if you want to remove observer-based verse tracking.

### 7. Added cleanup/flush effects for pending timers and progress commits

- [frontend-next/src/components/BibleApp.tsx#L2178](/c:/Users/johnw/OneDrive/Desktop/bible-app/frontend-next/src/components/BibleApp.tsx#L2178)
- [frontend-next/src/components/BibleApp.tsx#L2186](/c:/Users/johnw/OneDrive/Desktop/bible-app/frontend-next/src/components/BibleApp.tsx#L2186)
- [frontend-next/src/components/BibleApp.tsx#L2208](/c:/Users/johnw/OneDrive/Desktop/bible-app/frontend-next/src/components/BibleApp.tsx#L2208)

Revert if you remove the throttled progress/commentary flow.

### 8. Reworked the main reader scroll handler

- [frontend-next/src/components/BibleApp.tsx#L2219](/c:/Users/johnw/OneDrive/Desktop/bible-app/frontend-next/src/components/BibleApp.tsx#L2219)

Changes:
- marks scroll as active with `data-scroll-active`
- updates chrome visibility only when it actually changes
- uses `updateTopVisibleVerse(...)`
- defers reading progress via `scheduleReadingProgressCommit(...)`
- defers commentary sync via `scheduleCommentarySyncAfterScroll(...)`

This is the main behavioral change for scroll performance.

### 9. Reduced canvas animation load and fixed initialization ordering

- [frontend-next/src/components/BibleApp.tsx#L2425](/c:/Users/johnw/OneDrive/Desktop/bible-app/frontend-next/src/components/BibleApp.tsx#L2425)

Changes:
- moved `TOPBAR_H`, `TASKBAR_H`, `GUTTER_W` before first `getZones(...)` usage
- reduced counts:
  - `ORB_COUNT` to `4`
  - `COMET_COUNT` to `8`
  - `HEART_COUNT` to `10`
- changed `draw()` to:
  - lower frame rate during active scroll
  - render fewer particles while scrolling

Revert if you want the original heavier animated canvas behavior back.

### 10. Updated verse click handlers to prime the cached top verse

- [frontend-next/src/components/BibleApp.tsx#L3065](/c:/Users/johnw/OneDrive/Desktop/bible-app/frontend-next/src/components/BibleApp.tsx#L3065)
- [frontend-next/src/components/BibleApp.tsx#L3224](/c:/Users/johnw/OneDrive/Desktop/bible-app/frontend-next/src/components/BibleApp.tsx#L3224)

Added:
- `topVisibleVerseRef.current = v.verse;`

Revert if you remove cached verse tracking.

### 11. Added a class name to the animated canvas for CSS-based hiding during scroll

- [frontend-next/src/components/BibleApp.tsx#L4446](/c:/Users/johnw/OneDrive/Desktop/bible-app/frontend-next/src/components/BibleApp.tsx#L4446)
- Added:
  - `className="theme-comet-canvas"`

Revert if you remove the scroll-active CSS hiding rules.

## globals.css changes

## 1. Galaxy decorative layers referenced by the scroll downgrade

- [frontend-next/src/app/globals.css#L3166](/c:/Users/johnw/OneDrive/Desktop/bible-app/frontend-next/src/app/globals.css#L3166)
- [frontend-next/src/app/globals.css#L3207](/c:/Users/johnw/OneDrive/Desktop/bible-app/frontend-next/src/app/globals.css#L3207)

These are the existing `galaxy` aurora/sparkle layers that the new scroll-active rules temporarily disable or hide.

### 2. Reduced permanent `backdrop-filter` cost for galaxy surfaces

- [frontend-next/src/app/globals.css#L3401](/c:/Users/johnw/OneDrive/Desktop/bible-app/frontend-next/src/app/globals.css#L3401)

Changed blur/saturate values on:
- `.topbar`
- `.taskbar`
- `.nav-btn`
- `.nav-btn.active`
- `.book-panel`
- `.version-panel`
- `.testament-label`
- `.version-header`
- `.ch-nav-btn`
- `.side-header`
- `.taskbar-icon`
- `.settings-panel`
- `.settings-header`
- `.settings-close`
- `.theme-card`
- `.chapter-picker`
- `.ch-btn`

Revert this block if you want the original heavier glass effect back.

### 3. Added scroll-active CSS downgrade for heavy themes

- [frontend-next/src/app/globals.css#L3533](/c:/Users/johnw/OneDrive/Desktop/bible-app/frontend-next/src/app/globals.css#L3533)

Added rules for:
- `html[data-scroll-active="1"][data-theme="galaxy"] ...`
- `html[data-scroll-active="1"][data-theme="pink"] ...`

Behavior added:
- stop galaxy/pink animations during active scroll
- hide `#wave-bg`, `.galaxy-sparkles`, `.pink-hearts`, and `.theme-comet-canvas` while scrolling
- lower overlay opacity
- reduce remaining `backdrop-filter` strength during scrolling

Revert this block if you want decorations to keep rendering at full strength while scrolling.

## Revert order recommendation

If you want to roll back the performance work safely, revert in this order:

1. Remove the scroll-active CSS block in [`globals.css`](/c:/Users/johnw/OneDrive/Desktop/bible-app/frontend-next/src/app/globals.css#L3533)
2. Remove the `theme-comet-canvas` class in [`BibleApp.tsx`](/c:/Users/johnw/OneDrive/Desktop/bible-app/frontend-next/src/components/BibleApp.tsx#L4446)
3. Revert the canvas particle/frame-rate changes in [`BibleApp.tsx`](/c:/Users/johnw/OneDrive/Desktop/bible-app/frontend-next/src/components/BibleApp.tsx#L2425)
4. Revert the scroll handler in [`BibleApp.tsx`](/c:/Users/johnw/OneDrive/Desktop/bible-app/frontend-next/src/components/BibleApp.tsx#L2219)
5. Remove the observer/cached-verse helpers and refs in [`BibleApp.tsx`](/c:/Users/johnw/OneDrive/Desktop/bible-app/frontend-next/src/components/BibleApp.tsx#L783) and [`BibleApp.tsx`](/c:/Users/johnw/OneDrive/Desktop/bible-app/frontend-next/src/components/BibleApp.tsx#L1533)
6. Revert the permanent galaxy blur reductions in [`globals.css`](/c:/Users/johnw/OneDrive/Desktop/bible-app/frontend-next/src/app/globals.css#L3401)

## Important note

`git diff` currently shows other unrelated changes in these files outside the scroll-performance work. Those were not cataloged here unless they were directly part of this thread’s performance changes.
