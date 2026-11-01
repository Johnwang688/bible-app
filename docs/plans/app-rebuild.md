# App rebuild plan (Expo / React Native)

Decided 2026-10-31. This replaces the old Next.js frontend (`frontend-next/`). The FastAPI backend and the content pipeline stay, and their API is the contract.

## Why
The old frontend was written by earlier models without CI. A few examples of its debt:
- **One component does everything.** `BibleApp.tsx` is 4,700 lines and holds the reader, navigation, quiz gating, the tutorial, account sync and themes.
- **Small changes are expensive.** The chapter loader races, and every fix opened a new case (SM-1 took three review rounds).
- **Work runs invisibly.** It had constant animation and re-render work (measured in `ui-performance.md`).

The backend and content were rebuilt and tested this week (350 tests, golden API responses, pinned content sources), so they stay.

## Decisions (John, 2026-10-31)
1. **New frontend, keep the backend.**
2. **Expo / React Native:** one codebase builds native iOS and Android apps and the website (React Native Web).
3. **Order:** first, this UI/UX plan covers **every feature the app has today**. After that, each new roadmap feature is built frontend and backend together.
4. **Tabs:** **Home · Bible · Study · Me**.
5. **AI:** its place is designed now, but it launches **without** AI. AI comes back with the agent rebuild (W3).
6. **Quizzes:** **left out of launch.** The mastery map and quizzes come back as chapter checks and community trivia once the question bank is rebuilt. Their slots are designed now.
7. **Accounts are local-first and sign-in is optional.** Everything works on the device. Signing in syncs study items, progress and settings across devices.
   - **Auth moves off Supabase to Firebase Auth** (foundation step W2): Sign in with Apple, Google and email.
   - **Apple's requirement:** iOS requires Sign in with Apple when Google sign-in is offered.
   - **The backend** verifies Firebase ID tokens with `firebase-admin`, and user data moves to Firestore.
   - **The blocker:** this needs John's Firebase project.
8. **Coins are retired** (`ui-performance.md`).
9. **No CI workflow:** the claude-workflows reviews gate every change. The old Supabase auth code is replaced, not reused, so it needs no review. The new Firebase auth path is reviewed with Opus as the security reviewer (R-6), since Sol's filter blocks security probing.
10. **The old frontend:** VI-2a (the theme cut) is its last change. Its other planned phases are cancelled: CR-1, PF-2, PF-3, UI-1 to UI-3. It keeps serving the website until the new web build reaches parity (R-7).

## What the app does today (the inventory this plan covers)
| Area | Backend | Old client-only behaviour | In v1 of the new app |
|---|---|---|---|
| Bible text | books, translations, chapters, verse ranges | reading modes (scroll, book, paged single/double), fonts, size, line height, chapter swipe/keys | yes |
| Search | `POST /search` (bm25 + substring, English and Chinese) | reference parsing ("jn 3 16"), suggestions, recent passages | yes |
| Hebrew and Greek | `/words/{b}/{c}/{v}`, `/lexicon/{strongs}` | the Original words panel and word card | yes |
| Commentary | `/commentary`, `/commentary/sources` (Matthew Henry, summaries) | the commentary panel | yes; content is being rebuilt (`commentary.md`) |
| People, places, themes | `/summary-entities/...` | entity pages and banks | yes, rebuilt from the curated lists (commentary CM-3) |
| Study items | `/study-items` (CRUD + sync) | highlights (7 colours), notes, bookmarks; local first | yes |
| Progress | `/reading-progress` | daily goal (minutes), streak, chapters credited by dwell, chapters explored, Surprise me | yes |
| Daily verse | — | a date-seeded verse of the day | yes |
| Read aloud | — | browser speech synthesis with voice settings | yes (native TTS) |
| Accounts | auth signin/signup/refresh/signout (Supabase JWTs), `/me`, `/user-settings` | sign-in panel, settings sync (push-only theme) | optional sign-in, **moving to Firebase Auth + Firestore (W2)** |
| Themes | — | Auto / Light / Dark / Paper (VI-2a) | yes, on the new tokens |
| Tutorial | — | an 8-step guided tour | replaced by a short first-run intro |
| AI | `/ai/chat`, `/ai/guided-chapter`, `/ai/entity-content` | chat sidebar, 4 personas, guided chapter study | **slot only** |
| Quiz and mastery | `/quiz/...`, `/quiz/mastery-overview` | chapter quiz after dwell, hints, mastery map | **slot only** |
| Coins | `/wallet/...` | balance, rewards | **removed** |

## Information architecture
**The tabs: Home · Bible · Study · Me.** The Bible tab is the heart of the app. Every other tab leads back into it.

### Home: the daily reason to open the app
- **Greeting and streak:** a streak flame with the day count, and today's minutes toward the daily goal.
- **Continue reading:** the last position (book, chapter, translation), opened with one tap.
- **Verse of the day:** a share action, and tap to open it in context.
- **Surprise me:** a random chapter weighted toward unread ones, with "N of 1,189 chapters explored".
- **Slots (empty at launch):** memory verse of the week (Little Lamb merge), group check-in (accountability), a trivia challenge.

### Bible: the reader
- **Header:** book and chapter (tap → the book and chapter picker), translation (tap → the version picker), search, and a reading-settings button. The header collapses on scroll and comes back on a tap or a small scroll up. A visible affordance is always within reach, which fixes the old app's hidden bar.
- **Text:** scroll by default. Paged mode is an option in reading settings. Verse numbers are tappable targets. The text never sits under fixed controls: safe-area insets, plus padding for the floating bar.
- **Chapter navigation:** swipe left/right (native), the arrow keys (web), and previous/next at the end of each chapter.
- **The verse sheet:** tap a verse to open a bottom sheet (John's decision for phones). It has:
  - the reference
  - Highlight, with colour swatches of at least 44 px
  - Note and Bookmark
  - Share and Copy
  - **Original words**, which opens the words list and then the word card inside the same sheet
  - **Commentary on this verse**
  - **Cross-references** (TSK, once commentary CM-1 loads them)
  - **Ask AI**, the slot: hidden until W3.

  A long press, or tapping a second verse, extends the selection to a range.
- **Chapter tools** (a sheet from the header): the chapter summary, commentary, read aloud with play/pause/speed/voice, and the slots for guided study (AI) and chapter check (quiz).
- **Search:** one field takes both references ("john 3:16", "jn3", 約翰福音 3) and words. Results are grouped as passages, then verses, then people, places and themes. Recent passages show when the field is empty.

### Study: what you've kept, and where you've been
- **My highlights, notes and bookmarks:** filter by type, colour and book. Tapping one opens it in context.
- **Progress:** streak history, the daily goal, chapters explored with a book-by-book coverage map (the roadmap's "books you've explored").
- **People, places and themes:** the curated banks and pages.
- **Slots:** study plans, the mastery/trivia map, memory practice.

### Me: account and settings
- **Account:** optional sign-in. Signed in, it shows sync status, sign-out, and delete my data.
- **Appearance:** Auto, Light, Dark or Paper (accents come with VI-2b), reading font and size, line height, reading mode.
- **Reading:** default translation, read-aloud voice, the daily goal.
- **Sources and credits:** BSB, STEP Bible, Matthew Henry, TSK.
- **About, privacy and help.**

## Technical shape
- **Location:** `client/` in this repo (a monorepo next to `app/`).
- **The stack:**
  - Expo (current SDK), Expo Router (file-based routes for the four tabs and the stacks)
  - TypeScript strict
  - React Native Web for the site.
- **Server data:** TanStack Query (cache, retries, prefetching the next chapter). **This replaces the old hand-rolled loader**, so the PF-2 race class goes away by design: query keys plus cancellation, and no global "current load" state.
- **Auth:** Firebase Auth through the Firebase SDK, with Apple, Google and email sign-in. The ID token goes as `Authorization: Bearer` to the FastAPI backend, which verifies it with `firebase-admin`. The client never stores passwords.
- **Local data:** MMKV on native and `localStorage` on web, behind one storage module with validated schemas. Study items and progress are local-first, with a sync queue to the backend when signed in.
- **Design tokens:** the VI identity (warm paper and ink, `docs/plans/visual-identity.md`), ported from `frontend-next/src/styles/tokens.css` into a typed theme object. Light, Dark and Paper with the AA-checked Paper values from VI-2a. No raw colour literals outside the theme (a ratchet test, like VI-1's).
- **Fonts:** a serif for Scripture, Noto Serif Hebrew, Gentium Book Plus, and the system UI font.
- **Accessibility:**
  - 44 pt targets and Dynamic Type
  - screen-reader labels on every control
  - Hebrew right-to-left
  - reduced motion respected
  - AA contrast in every mode, including fixing Light's 2.3:1 verse numbers.
- **Migrating existing web users:** on its first run the web build reads the old app's `localStorage` keys once and imports them, so web readers keep their place and study items:
  - `bible-app-last-position`
  - `bible-app-highlights`, `-notes`, `-bookmarks`
  - `bible-app-recent-passages`, `-reading-progress`, `-chapters-read`, `-daily-goal-minutes`
  - `theme`.

## Testing (the claude-workflows gates for the new app)
- **Unit and component tests:** Jest and React Native Testing Library, run by `npm test` in `client/`.
- **End to end:** Playwright against the web export (`expo export -p web`), with API mocks in the same style as today's suite. A small Maestro flow suite for native smoke tests later.
- **Typecheck and lint:** `tsc --noEmit` and ESLint.
- **Review:** every phase goes through task cards, headless workers, gates, GPT-6.1 Sol review and the 5a caught-bug loop, in its own worktree, and lands by PR.

## Phases
| Phase | Scope | Acceptance (highlights) |
|---|---|---|
| **R-0 Scaffold** | the Expo app in `client/`, tabs, theme tokens, fonts, the storage module, the API client, test harnesses, web export | builds for web, iOS and Android; four empty tabs; token ratchet; CI-equivalent local gate script |
| **R-1 Reader core** | the Bible tab: chapter view, the book/chapter and version pickers, swipe/keys, the collapsing header, reading settings, query cache plus next-chapter prefetch | position persists; prefetched chapter turns are instant; the PF-2 race tests ported and passing |
| **R-2 Verse sheet** | the bottom sheet: highlight, note, bookmark, share/copy, Original words and the word card | the HG-3a behaviours ported; 44 pt targets; the screen-reader pass |
| **R-3 Study tab** | lists of study items, progress, chapters explored and the coverage map | local-first; filters; opening in context |
| **R-4 Home** | streak, goal, continue reading, verse of the day, Surprise me | the SM-1 picker tests ported |
| **R-5 Search, commentary, entities** | search, the commentary sheet, people/places/themes | the reference parser ported with tests; English and Chinese search |
| **R-6 Me and accounts** (with W2) | settings, appearance; Firebase Auth (Apple, Google, email); the backend verifies Firebase tokens; user data on Firestore; optional sync; delete my data; import any real Supabase users | needs John's Firebase project; an Opus security review of the new auth path; sync conflict rules; nothing left importing `supabase` in user paths |
| **R-7 Web parity and cut-over** | old-localStorage import, read aloud, first-run intro, a performance budget | the new web build replaces `frontend-next/`; the old frontend is archived |

After R-7, new roadmap features are built frontend and backend together:
- commentary CM-1 to CM-4
- the memory merge
- streak sync
- groups
- trivia
- the AI agent.

## Open (for John, as they come up)
- **App identity:** the app's name, icon and store listing.
- **Minimum age and privacy:** this matters for accounts and groups.
- **Shipping native builds:** EAS Build accounts (Apple Developer, Google Play).
