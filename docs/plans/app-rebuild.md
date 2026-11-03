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
11. **Chinese mode (John, 2026-11-01):** the app comes in English and **Simplified Chinese**, with an English/Chinese parallel reader. See Chinese mode.

## What the app does today (the inventory this plan covers)
| Area | Backend | Old client-only behaviour | In v1 of the new app |
|---|---|---|---|
| Bible text | books, translations, chapters, verse ranges | reading modes (scroll, book, paged single/double), fonts, size, line height, chapter swipe/keys | yes, plus **parallel reading** (two translations verse by verse) |
| Search | `POST /search` (bm25 + substring, English and Chinese) | reference parsing ("jn 3 16"), suggestions, recent passages | yes |
| Hebrew and Greek | `/words/{b}/{c}/{v}`, `/lexicon/{strongs}` | the Original words panel and word card | yes |
| Commentary | `/commentary`, `/commentary/sources` (Matthew Henry, summaries) | the commentary panel | yes; content is being rebuilt (`commentary.md`) |
| People, places, themes | `/summary-entities/...` | entity pages and banks | yes, rebuilt from the curated lists (commentary CM-3) |
| Study items | `/study-items` (CRUD + sync) | highlights (7 colours), notes, bookmarks; local first | yes |
| Progress | `/reading-progress` | daily goal (minutes), streak, chapters credited by dwell, chapters explored, Surprise me | yes |
| Daily verse | — | a date-seeded verse of the day | yes |
| Read aloud | — | browser speech synthesis with voice settings | yes (native TTS) |
| Accounts | auth signin/signup/refresh/signout (Supabase JWTs), `/me`, `/user-settings` | sign-in panel, settings sync (push-only theme) | optional sign-in, **moving to Firebase Auth + Firestore (W2)** |
| Themes | — | Auto / Light / Dark / Paper (VI-2a) | **replaced** by two styles with presets and customisation (see Visual design) |
| Tutorial | — | an 8-step guided tour | replaced by a short first-run intro |
| AI | `/ai/chat`, `/ai/guided-chapter`, `/ai/entity-content` | chat sidebar, 4 personas, guided chapter study | **slot only** |
| Quiz and mastery | `/quiz/...`, `/quiz/mastery-overview` | chapter quiz after dwell, hints, mastery map | **slot only** |
| Coins | `/wallet/...` | balance, rewards | **removed** |
| Interface language | `preferred_language` on the account; Chinese book names (`name_zh`, `name_zh_simplified`); CUV and CUV-SIMP | English only; Chinese book names when reading CUV | **English and Simplified Chinese** (see Chinese mode) |

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
- **Parallel reading:** reading settings can add a second translation (for example BSB + CUV-SIMP). See Chinese mode.
- **The verse sheet:** tap a verse to open a bottom sheet (John's decision for phones). It has:
  - the reference
  - Highlight, with colour swatches of at least 44 px
  - Note and Bookmark
  - Share and Copy
  - **Original words**, which opens the words list and then the word card inside the same sheet
  - **Commentary on this verse**: Matthew Henry only, for now (John, 2026-11-01).
    - There is no chapter-summary tab until the summaries are reworked.
    - Where no note covers the verse (about 23% of verses today), the sheet opens empty with a short line saying there is no note yet.
    - Falling back to the chapter summary comes after that rework.
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
- **Appearance:** style and preset, light/dark/follow the phone, reading font and size, line height, reading mode, and the customisation screen (see Visual design).
- **Language:** follow the phone, English, or 简体中文 (see Chinese mode).
- **Reading:** default translation, parallel translation, read-aloud voice, the daily goal.
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
- **Design tokens:** a typed theme object built from the presets in Visual design. It replaces the VI identity (warm paper and ink) and the old Light/Dark/Paper tokens. No raw colour literals outside the theme (a ratchet test, like VI-1's).
- **Fonts:** see Visual design. Hebrew and Greek stay on Noto Serif Hebrew and Gentium Book Plus.
- **Strings and locale:** every UI string goes through one message catalogue (keys, not literals) from R-0, with `expo-localization` for the phone's language. Dates and numbers are formatted for the locale. A ratchet test fails on new literal UI strings, and a catalogue test fails when a key is missing in either language.
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
  - `theme`: Auto, Light and Dark map to the default look (Silver / Graphite) in that mode; Paper maps to Silver.

## Visual design (John, 2026-11-01)
Picked from 15 directions, then tuned preset by preset on the design canvas (https://claude.ai/artifact/9qzaFmKVKTnGkgUWDxRqnN, the "Presets" page). The canvas holds every preset's exact colour values; R-0 copies them into the typed theme table. John may still tweak individual presets.

**Two styles.** Both use the same screens and layout; only the tokens change.
- **Neubrutalist pastel:** thick outlines, hard offset shadows, pastel fills. UI font Space Grotesk.
- **Aurora glass:** frosted glass cards over soft aurora gradients, in the spirit of Apple's Liquid Glass. UI font Plus Jakarta Sans. Kept neutral: greys and restrained glows.
  - **Native glass where it exists:** the system glass material on iOS 26; a blur (`expo-blur`) on Android and a CSS backdrop filter on the web. Confirmed in R-0: `expo-glass-effect` (`GlassView`, `isLiquidGlassAvailable()`), in `client/src/components/GlassSurface.tsx`.
  - **The aurora moves.** The background glows drift slowly on their own (a gentle loop, several seconds per cycle) and shift with scrolling (parallax). Animate transforms on the UI thread (Reanimated); no layout work or re-renders per frame. **Reduce Motion stops both**, leaving a still background.
  - **The reader stays calm.** Scripture sits on the soft wash only, never on the bright orbs behind the Home cards.

**Presets.** Each style has three light and three dark presets. Every preset keeps to one colour family; mixed hues looked wrong.

| Style | Light | Dark |
|---|---|---|
| Neubrutalist pastel | Strawberry milk, Matcha latte, Lavender haze | Bubblegum night, Matcha night, Grape soda |
| Aurora glass | Liberty, Silver, Sky | Northern lights, Graphite, Deep blue |

- **Pastel dark rule:** keep the brutalist outlines and hard shadows, but no light pastel card backgrounds. Cards use dusty mid-tones with light text (for example Bubblegum night's cards are `#7A4D61` / `#5C3A4A` with `#FFF1F5` text).
- **No brand names or brand lookalikes** for presets.
- Matched light/dark pairs: Strawberry milk / Bubblegum night, Matcha latte / Matcha night, Lavender haze / Grape soda, Silver / Graphite, Sky / Deep blue. Liberty and Northern lights stand alone.

**First run.** A skippable "pick your look" screen shows both styles. The choice is saved on the device (and synced when signed in).
- **Skipping gives Silver in light mode and Graphite in dark mode,** following the phone's setting.
- The style is a look, not a gender setting. Onboarding asks no gender question; the only personal detail is an optional age range.

**Customisation** (Me → Appearance), with a live preview of Home and the reader:
1. **Presets:** pick any preset from either style.
2. **Tweaks:** accent colour, light/dark/follow the phone, reading font, text size, line height.
3. **Advanced:** edit every token. A contrast check blocks combinations below 4.5:1 for text.

**Fonts.**
- **Scripture:** Literata by default, with Source Serif 4 as the second choice; more reading fonts can be added later.
- **Hebrew and Greek:** fixed (Noto Serif Hebrew, Gentium Book Plus).
- **Chinese:** see Chinese mode.

**Accessibility:** 4.5:1 text contrast in every preset (checked by a test over the preset table), 44 pt targets, and the Reduce Motion rule above.

## Chinese mode (John, 2026-11-01)
**Two interface languages: English and Simplified Chinese (简体中文).** There is no Traditional Chinese interface; CUV Traditional stays available as a translation.

**Choosing the language.**
- **Me → Language:** follow the phone (the default), English, or 简体中文. Saved on the device, and in `preferred_language` when signed in.
- **Following the phone:** any Chinese phone language gets the Simplified interface. A brand-new reader starts in CUV-SIMP, or in CUV (Traditional) when the phone is set to Traditional Chinese. Readers with a saved position keep their translation.
- **Switching language later** asks once whether to switch Scripture to match. It never changes the translation silently.

**What is in Chinese.**
- **The whole interface:** tabs, buttons, sheets, settings, the first-run intro, empty states, errors, and the screen-reader labels.
- **Scripture and book names:** CUV-SIMP and CUV, with Chinese book names from the backend. In the reader, book names follow the translation being read; elsewhere (Study lists, Home) they follow the interface language.
- **Search:** already handles Chinese references (约翰福音 3) and Chinese words.
- **Home:** the verse of the day comes in the reader's translation.

**What stays English for now.** Commentary, people/places/themes and (later) quiz questions are English-only content. In Chinese mode they still show, marked with a small 英文 label. Translating that content is its own later project, not part of the rebuild.

**Parallel reading** (English and Chinese together; any two translations work).
- **Turned on in reading settings:** pick a second translation. It is remembered on the device.
- **Phones:** interleaved by verse: each verse in the first translation, then the same verse in the second, in a quieter colour. Two columns are too narrow on a phone.
- **Tablets and the web:** two aligned columns.
- **Alignment is by verse number.** A verse that one translation lacks shows as empty on that side, never shifted.
- **Tapping a verse** opens the usual verse sheet. Highlights, notes and bookmarks attach to the reference, so they show on both sides.
- **Read aloud** reads the first translation.

**Type.**
- **Chinese reading font: Noto Serif SC** (John, 2026-11-01), the open-source Source Han Serif, for CUV-SIMP and CUV. It is large, so native builds subset it or download it on first use, and the web loads it only for Chinese text.
- **Chinese interface text:** Space Grotesk and Plus Jakarta Sans have no Chinese glyphs, so Chinese falls back to the system font (PingFang SC on iOS, Noto Sans CJK on Android, Noto Sans SC on the web).
- **Layout:** buttons and tabs are sized for the longer of the two languages. Line height for Chinese Scripture is tuned separately from English.

**The Chinese copy** is drafted alongside the English in each phase and reviewed before launch by John and a few Chinese-speaking friends (John, 2026-11-01).
- **A glossary first:** the recurring terms (Scripture, highlight, note, streak, verse of the day, commentary, and so on) are fixed once, following CUV-style church usage, so every screen says the same thing.
- **A review sheet:** every string as English, Chinese and the screen it appears on, so reviewers can mark changes without running the app. Their fixes go back into the catalogue.

## Testing (the claude-workflows gates for the new app)
- **Unit and component tests:** Jest and React Native Testing Library, run by `npm test` in `client/`.
- **End to end:** Playwright against the web export (`expo export -p web`), with API mocks in the same style as today's suite. A small Maestro flow suite for native smoke tests later.
- **Typecheck and lint:** `tsc --noEmit` and ESLint.
- **The local gate** (stands in for CI): `npm run gate` in `client/` runs typecheck, lint, the unit tests (and names the token ratchet, string ratchet, preset contrast and missing-key suites), `expo-doctor`, the web export, the iOS and Android exports (Metro + Hermes bundles) and the Playwright suite. `--quick` runs only the first three; `--offline` skips `expo-doctor`.
- **Review:** every phase goes through task cards, headless workers, gates, GPT-6.1 Sol review and the 5a caught-bug loop, in its own worktree, and lands by PR.

## Phases
| Phase | Scope | Acceptance (highlights) |
|---|---|---|
| **R-0 Scaffold** ✅ done 2026-11-01 | the Expo app in `client/`, tabs, the theme engine with every preset, fonts, the storage module, the API client, the message catalogue (English and Simplified Chinese) with locale detection, test harnesses, web export | builds for web, iOS and Android; four empty tabs; token ratchet; a contrast test over every preset; the string ratchet and the missing-key test; CI-equivalent local gate script |
| **R-1 Reader core** ✅ done 2026-11-01 | the Bible tab: chapter view, the book/chapter and version pickers, swipe/keys, the collapsing header, reading settings, parallel reading, query cache plus next-chapter prefetch | position persists; prefetched chapter turns are instant; the PF-2 race tests ported and passing; parallel verses stay aligned when one translation lacks a verse |
| **R-2 Verse sheet** ✅ done 2026-11-01 | the bottom sheet: highlight, note, bookmark, share/copy, Original words and the word card | the HG-3a behaviours ported; 44 pt targets; the screen-reader pass |
| **R-3 Study tab** ✅ done 2026-11-02 | lists of study items, progress, chapters explored and the coverage map | local-first; filters; opening in context |
| **R-4 Home** | streak, goal, continue reading, verse of the day, Surprise me | the SM-1 picker tests ported |
| **R-5 Search, commentary, entities** ✅ done 2026-11-02 | search, the commentary sheet, people/places/themes | the reference parser ported with tests; English and Chinese search |
| **R-6 Me and accounts** (with W2): R-6a (Me, no accounts) ✅ 2026-11-02; R-6b (accounts) in progress | settings, the language setting, appearance and the customisation screen with live preview; Firebase Auth (Apple, Google, email); the backend verifies Firebase tokens; user data on Firestore; optional sync; delete my data; import any real Supabase users | needs John's Firebase project; an Opus security review of the new auth path; sync conflict rules; nothing left importing `supabase` in user paths |
| **R-7 Web parity and cut-over** | old-localStorage import, read aloud, first-run intro with the "pick your look" screen, a performance budget (including the aurora animation), the review of the Chinese copy (John and friends, from the review sheet) | the new web build replaces `frontend-next/`; the old frontend is archived |

**R-0 notes (2026-11-01).**
- **Native builds:** "builds for iOS and Android" is checked as Metro + Hermes bundle exports plus `expo-doctor`. Signed binaries need EAS (see Open); this PC has no Android SDK or Xcode.
- **Preset contrast:** the test checks 735 text/background pairs. The six pastel presets pass 4.5:1 everywhere. The glass presets have 43 pairs below 4.5:1, all over the brightest glow peaks and orbs: mostly secondary text (`muted`, verse numbers, inactive and active tab labels); also highlighted verses over one glow in Liberty and Northern lights, and Northern lights card text. Plain Scripture text passes on every reader background. The test pins them as known gaps that may only shrink. Tuning them is John's call (see Open).
- **Chinese Scripture font:** the web uses the Google Fonts stylesheet (its unicode-range slices download only the glyphs a page uses); native downloads Noto Serif SC once (7.2 MB) from a pinned jsDelivr copy on first use. Self-hosting the web slices is an option for R-7.
- **Storage:** MMKV 4; its web build keeps each value in `localStorage` under `bible-app\<key>`, which the old app's `bible-app-*` keys never collide with.

**R-1 notes (2026-11-01).**
- **Races by design:** the shown chapter is always the TanStack query for the current position (book, chapter, translation), with cancellation through `signal`. The six PF-2 loader race tests are ported as behaviour tests (`client/src/reader/__tests__/chapterRaces.test.tsx`) and pass. Next and previous chapters are prefetched for both translations, so a turn renders from the cache on its first frame.
- **Defaults:** a brand-new reader starts at Genesis 1 in BSB, CUV-SIMP or CUV, following the phone. KJV is not offered: the backend has no KJV text yet.
- **Parallel reading:** phones interleave the second translation under each verse; screens 768 px and wider show two columns with a swap button. Alignment is by verse number, and a missing verse is an empty, labelled cell. The two sides are never the same translation: the version picker, recent passages and swap all apply the same rule.
- **Reading settings in R-1:** text size, parallel reading, the second translation and swap. Reading font and line height move to Me → Appearance (R-6).
- **Deferred:**
  - **Paged mode:** a later reader phase.
  - **The header's search button:** R-5.
  - **Read-chapter dots in the picker:** done in R-3.
  - **Verse screen-reader labels:** they say "Verse 16" rather than reading the text. To revisit in R-2's screen-reader pass.
  - **Native swipe:** unit-tested, but not yet tried on a device (needs EAS builds).

**R-2 notes (2026-11-01).**
- **The verse sheet is non-modal**, as drawn: the chapter stays usable above it. Tapping a verse opens it; tapping a second verse (or a long press on native) extends the selection to a range. The tab bar hides while the sheet is open.
- **Highlights:** six colours. Each colour's wash keeps Scripture at 4.5:1 or better in all 12 presets (a test checks it). Highlights, notes and bookmarks attach to the reference, so they show in every translation and on both sides of parallel reading. They are local-only until sync in R-6.
- **Original words and the word card:** ported from HG-3a, including the untranslated/elsewhere rows, Hebrew right-to-left, the empty and error states with retry, the stale-target and failed-revisit cases, focus moves, and back to the same list position. In Chinese, glosses and definitions stay English and carry the 英文 badge. The commentary row opens a placeholder until R-5.
- **Screen-reader pass (closes the R-1 leftovers):**
  - Verse text is read as text.
  - Each verse number is a real button, "Verse 16: verse tools". On the web it's a `<button>`, and verses never use the link role.
  - The number button is smaller than 44 pt on purpose: touch users tap the verse text, which is the large target. The button is for keyboard and screen-reader users and is above the WCAG AA 24 px minimum.
- **Still to check on a device (needs EAS builds):**
  - VoiceOver/TalkBack on the nested verse-number button;
  - the Android back button in the sheet;
  - the Hebrew and Greek fonts.
- **Unsaved note drafts (closed the R-2 gap, GAPS 2026-11-03):** a chapter or translation change used to drop a half-written note. The editor now writes every change through to a draft kept per verse reference (`client/src/reader/noteDrafts.ts`, in memory only: not stored on the device or synced). Opening that verse's note again starts from the draft and says "Your unsaved changes are back. Save to keep them." Saving or deleting the note clears it; a save over the length limit keeps it; text equal to the saved note (or empty with no note) is no draft. Back, Close and Escape keep the draft too. There is no "discard draft" control: to drop one, edit the text back or delete the note (a UI call for John if wanted).
- **Escape in the note field** now steps back to the actions (it used to do nothing there): Escape is one shared stack since GAPS (see the R-4 notes), heard from inside text fields.
- **Words list scroll:** back from a word card, the list returns to the same place. A word opened within 100 ms of a scroll used to come back to the top (React Native Web reports a scroll's end from a timer it does not clear on unmount, and the late report read the detached list's offset, 0). This was the flaky `reader.spec.ts` "restores the words list scroll" test (1 in 10 to 1 in 3, depending on load); a clock-driven test now pins it.

**R-5 notes (2026-11-02, part 1: data layer and the commentary view).**
- **The reference parser** (`client/src/search/reference.ts`) replaces the old `parseReference` regex. It reads full names, the coverage map's three-letter codes and common abbreviations (`jn`, `gn`, `dt`, `1 kgs`, `sos`, `rm`…), joined forms (`jn3:16`), a space or a full stop between chapter and verse, unique prefixes (`genes`), and Simplified, Traditional and short CUV names (`约 3:16`, `約翰福音3章16節`, full-width digits). It checks chapter and verse bounds and reads `Jude 5` as a verse. The book part is checked strictly: anything that is not a book name makes the whole query a word search. Bare `cor`, `tim` and the like stay ambiguous and are offered as suggestions instead. Not supported: Chinese numerals, cross-chapter ranges and verse lists.
- **Search language:** the backend indexes one translation per call, so a query with Chinese characters searches a Chinese translation (the reader's own or its parallel one, else CUV-SIMP), and other queries search an English one (else BSB).
- **Commentary on a verse** (built from Commentary.dc.html): Matthew Henry only, with the verse pinned on top and the note's own range under the title. Long notes show a preview cut at a sentence end, then "Read all". Where no note covers the verse, the empty state shows. The 英文 badge appears only when a note shows. The backend returns every open-ended entry that starts at or before the verse, so the client keeps only the entries that cover it.
- **People, places and themes:** the data hooks read today's `/summary-entities`.

**R-5 notes (2026-11-02, part 2: search, Explore, the people, places and themes pages).** Built from the approved prototypes (`design/proposed/r5-search.html`, `r5-entities.html`, `r5-explore.html`) with the fixes John approved alongside them.
- **Search** is a full screen above the tabs, opened from the reader header's new search button. With the field empty it shows recent passages (with Clear) and four examples. A query that reads as a reference offers passages only; anything else also searches verses in the matching language's translation, 10 at a time up to 50, each card a button whose excerpt starts near the first match so the 3-line clamp never hides it. People, places and themes come last. Enter opens an exact passage; scrolling dismisses the keyboard; offline, passages still show ("they open once the chapter loads").
- **One matching rule everywhere** (search, Explore, the list filters): a name matches when it, or a word in it, starts with what is typed. The filter fields state it to screen readers. Names are English only, so a Chinese query explains that ("人物、地点和主题目前只有英文名称，请用英文查找") rather than finding nothing silently.
- **Study → Explore** is Study's third segment: a find field and a card per kind (count, hint, sample names). From two letters, up to three matches per kind, with "See all N" opening that list already filtered.
- **The lists:** people and places A to Z with letter headings; people also have a row of A–Z jump buttons, 44 pt each (a vertical index would need smaller letters). The 2,989 themes are search-first: a prompt until something is typed.
- **An entity's page:** kind, name, "Appears in N chapters", the overview (3 lines, then Read more / Show less), the life-and-times timeline (5 events, then "Show 10 more events"; the header row expands, and each reference is its own 44 pt row that opens the verse in context), then the chapters by book as 44 pt chips. Themes have only the chapters. A page the server doesn't know shows "This page isn't here"; a failed load offers Try again.
- **Back:** each screen's Back, Escape on the web and the Android back button go back exactly one screen. Only the focused screen listens, because the web stack keeps the screens below mounted.
- **Large text:** every control has a minimum height, never a fixed one.

**R-4 notes (2026-11-02).**
- **Home is built as signed off** (Home.dc.html, the stack layout). It shows the greeting and streak chip, today's goal, continue reading, the verse of the day and Surprise me, in both languages and every preset. Home only reads progress and the position, so whatever the reader records shows at once.
- **Surprise me** is the SM-1 picker, ported with its tests: a random chapter, 90% from unread chapters, picking the book first. It never picks the chapter the reader is on (the stored one), keeps the reader's translation, clears any stale "open in context" target, and is disabled until the book list loads. There is no result screen: it opens the chapter in the Bible tab.
- **The verse of the day:** a curated list of 60 verses, one per local calendar day, the same for everyone on that date. It is shown in the reader's translation, with CUV alternate readings removed. Tapping it opens the verse in context; Share uses the system sheet, or the clipboard on desktop browsers.
- **Continue reading:** the subtitle is the translation's full name. The design's "Verse 16 · yesterday" needs the last verse and the time read, which the app does not store.
- **Time of day:** Home re-renders when the day or the greeting band changes (05:00, 12:00, 17:00, midnight), and when the app returns to the foreground. It took three Sol rounds.
- **The daily-goal sheet** (prototype approved, with the UI review's fixes): a stepper by 5 from 5 to 120 (a spin button on the web, with arrow, Home and End keys), quick picks in a 4-column grid (the selected one has a check mark, not just a colour), and "Today counts as done" when today already met the goal. Changes save at once, so there is one dismiss control, "Close"; a tap on the scrim, a swipe down, Escape and Android back also close it. It does not depend on Home, so Me → Reading (R-6) can mount it; it follows the day at midnight by itself.
- **Empty and error states:** a new reader sees "Start reading · Genesis 1"; a streak of 0 shows "Start your streak"; with nothing explored, Surprise me says "A random chapter to get you started." The verse of the day has a fixed minimum height, a skeleton while loading, an error with "Try again" (then "Trying again…"), and shows the verse kept from earlier the same day when the chapter can't load. It shows it even before the book list arrives (built-in names for the 32 books in the list). Psalms read "Psalm 119:105".
- **Accessibility and large text:** the goal card is a 44 pt button labelled "Today's goal, 9 of 15 minutes, edit", the progress bar carries its value, the cards are labelled regions on the web, and the streak chip wraps below the greeting with large text.
- **Review of the goal sheet:** Sol, three rounds. Round 1: the kept verse hidden until the book list loaded, the sheet not moving to the new day on its own, and Escape closing the sheet under a second modal (fixed by `implementer-medium`). Round 2 found more of that last class (Escape stuck after a second dialog closes, a stale "not ours" mark), so it went to `implementer-hard`. Round 3 found two new cases in that fix: one Escape press closing two sheets, and Escape taken at the window. By 5a the loop stopped there. That fix was reverted (both round-3 tests pass on the code that ships), and a lost scrim tap during the slide-in was fixed as a gate failure.
- **Escape with stacked modals (closed the known gap, GAPS 2026-11-03):** on the web, Escape is now one shared stack (`client/src/components/escapeStack.ts`, `useEscapeKey`), the simpler design this note had proposed. Every modal sheet (through `SheetModal`), the verse sheet and the search and entity screens are layers, in the order they mount; the top enabled layer takes the Escape keydown, and the keyup of that press is swallowed. The web Modal's own keyup Escape is ignored (Android's back button still reaches `onRequestClose`). A modal the stack doesn't know (a native `<dialog>`, a Modal not built on `SheetModal`) takes the press while it is open above the top layer or holds the focus; a closed dialog never blocks. The goal sheet lost its own Escape code. After the 11-02 merges `reviewR4WindowCaptureEscape` failed (it had passed on R-4's branch only by timing: the sheet's Modal closed on the keyup the upper modal let through); it passes now, and so do `reviewR4ClosedDialog` and `reviewR4StaleEscape`, no longer `fixme`. The last one was rewritten with the same intent: a lone keyup is no press now, which is what `reviewR4ReopenedEscape` already required. Side effects: one press can no longer close a sheet on a tab that isn't showing (the verse sheet listens only while its tab is focused), and Escape works from inside text fields in every layer. New web Escape handling should use `useEscapeKey`, not a `document` listener.
- **Home Memory card (John, 11-02; built by GAPS 11-03):** design `home-memory-card.html`, variant B (A was rejected), with the UI review's fixes. Home's order is now: header, Today, Continue reading, Verse of the day, **Memory**, Surprise me. The Memory card is one row built like Continue reading: "MEMORY · n OF 60 LEARNED" (no letter-spacing in Chinese), the verse (in the app's language; in Chinese, Memory's script setting), and "Step n of 4" or "Done for today", each held to one line. Its button says Start (accent), Continue (accent) or Week (secondary); the whole card is one control named "Start Memory lesson, 2 Corinthians 5:17", "Continue Memory lesson, …" or "See the week", and the inner button is hidden from screen readers. Start and Continue open the lesson's next step, Week opens `/study/memory/week`. Home reads Memory through its own hooks (`useTodayLesson`, the progress store), so, like Memory's home, opening Home stores today's lesson plan if there is none yet. **Surprise me is one row:** the title and "n of 1,189 explored", with a round secondary shuffle button named "Take me somewhere new"; the explanatory sentence is gone. Continue reading's arrow is hidden from screen readers (the card is the one control, "Continue reading John 3"), and the streak chip stays on one line. An e2e check holds every preset, in both languages, above the tab bar on a 390×844 screen at the default text size.

**R-6b notes (2026-11-02): auth and sync, email first.**
- **Shape:** the app signs in with Firebase Auth (email and password; Google and Apple plug in later as new sign-in methods) and syncs **directly to Firestore** with the client SDK. The security rules (`firestore.rules`, tested on the emulator) are the only gate on user data: each user reads and writes only `users/{uid}/items`, `/devices` and `/settings`, every document's shape is checked, and clients never delete. The backend only verifies ID tokens (`app/core/firebase_auth.py`, Application Default Credentials, no key files) and runs "delete my data" (`DELETE /api/v1/account`).
- **What syncs:** highlights, notes and bookmarks (one document per item, newest change wins, deletions as tombstones); reading progress (each device writes only its own document; minutes add up across devices; chapters read and goal-met days are unions; the newest goal wins); the look and the language. The reading position, reading settings and the first-run age choice stay on the device. The rules are written down in `client/src/sync/CONFLICTS.md`.
- **Delete my data** needs the password again (the backend refuses a sign-in older than 5 minutes). It revokes sessions, disables the user, writes a `deletedUsers/{uid}` marker (the rules then refuse writes from older tokens, so another device cannot recreate the data), wipes `users/{uid}`, then deletes the user. Data on the phone stays. A delete that times out keeps sync stopped until the app can tell whether it went through.
- **Under 13** (John, 2026-11-02): choosing the Under 13 age band in first run turns sign-in and sync off; a signed-in user who picks it is signed out. The provider takes a gate (`client/src/auth/signInGate.ts`) and **fails closed**: until R-7a's `signInGateFor()` is passed in `_layout.tsx` (one line after PR #33), and whenever the first-run state is unknown, sign-in, sign-up, reset and sync are off.
- **Password reset** links open Firebase's hosted page; the app does not handle them. Email-enumeration protection is on in the Firebase project.
- **Follow-up before merge (John, 2026-11-02; `FOLLOW-UP.md`):**
  - **Crash safety:** the sync engine journals its writes. Each local write carries a tag inside its own storage envelope, so the value and its evidence land together. A restart settles an interrupted write from the tag alone, never by comparing values (`client/src/sync/journal.ts`; "Crash safety" in `CONFLICTS.md`).
  - **Schema-tight rules:** every device, setting and item document is checked against the engine's exact schema, including every entry inside maps and lists. On the wire, `activeMs` is one string that a single regex can check, because the rules cannot loop. A custom theme's JSON is capped at 4000 characters, and the push path holds back clocks more than 23 h ahead.
  - **App Check, monitor mode:**
    - Web: reCAPTCHA Enterprise.
    - Firestore: `UNENFORCED`.
    - Backend: `APP_CHECK_MODE=monitor`.
    - Native: no attestation yet; it needs `@react-native-firebase/app-check` and EAS builds.
    - The switch to enforce: `docs/app-check.md`.
  - **The native session** is in `expo-secure-store`, AFTER_FIRST_UNLOCK_THIS_DEVICE_ONLY and chunked. A reinstall's Keychain items are wiped.
  - **Under 13 picked while signed in:** the app signs out and offers "Delete account and synced data" (re-auth first, then the delete, then sign out), or "Not now".
- **Known, for John (parked per 5a step 5):**
  - Sol sync rounds 3 and 4 found 1 + 2 more cases in the journal's commit. Both are unreachable from today's app code: one needs a crash followed by another account syncing first; the other needs a storage listener that writes a synced key mid-commit.
  - A held-back future-clock item or setting, and one the server refuses on its own in a document-by-document retry, is retried on later sync runs until the account accepts it (security round 5, S5-1, medium; fixed in R6b-s51-fix: the pushes report what they held back, and the engine keeps those changes pending).
  - The device-document count per user is not capped. App Check and a budget alert are the controls.
- **Fixed by team AUTH (board 11-03, row 2; acceptance tests un-skipped):**
  - S5-2: a batch refused as a whole is retried document by document at most once an hour for the same documents (the batch itself is still sent, so recovery is noticed).
  - S5-3: a held-back goal no longer rewrites the device document on every run; it goes out by itself once real time is within 23 h of its clock.
  - S5-4 / S5-5: when MMKV cannot be opened, the first session write pre-wipes the Keychain's session keys and leaves a `prewiped-v1` flag, so the next launch keeps that sign-in instead of wiping it; a write that cannot remove the first build's clear copy leaves a `legacy-drop-v1` flag, so the migration then imports nothing.
  - S5-6 and Sol's Under 13 round 2 (U13-R2-1): "the gate closed on this signed-in account" is stored (`account.under13Closing`) as the gate closes, so a restart before or just after the gate's sign-out still offers the delete. An ordinary sign-out, any sign-in, the gate opening or a delete ends it.
  - U13-R2-2: Back, Escape, Cancel and the scrim cannot close the delete sheet in the same turn as the submit, and "Forgot password?" cannot switch views while a delete runs.
  - Review of the fix (Sol r1, Opus security review), fixed by a fresh `implementer-hard`: Firebase's start-up storage probe (`__sak`) no longer triggers the pre-wipe (SR-N1: one launch with MMKV failing had signed an established install out); a stray `prewiped-v1` next to the install marker is deleted or overwritten with an untrusted '0' (AUTH-R1-3); the crash-window offer only applies to auth's first report of a launch (AUTH-R1-1); the stored closing is read fresh, so another tab's sign-out retires it (AUTH-R1-2); a sign-out's remove always deletes its Keychain copy.
- **Known residuals after the AUTH fixes (low):**
  - iOS only: if MMKV failed on every launch after a sign-in and the app was then uninstalled before any launch where MMKV opened, the `prewiped-v1` flag stays in the Keychain, so a reinstall keeps that install's own last session. The same holds if, on the one launch that finds the flag next to the install marker, both deleting and overwriting it fail and the app is uninstalled before another launch. (SecureStore is the only store that works while MMKV is down, and it survives an uninstall.)
  - If this tab's own write of the Under 13 closing failed, it trusts its in-memory copy for the rest of the run, so another tab's sign-out in that window does not retire it.
  - Clock skew: a goal inside this device's 23 h bound that the server still refuses (device clock more than an hour ahead of the server) costs one refused device write plus a retry per run until the server's clock catches up.
  - If the server delete succeeds and the app dies before the provider records it, a stored Under 13 closing can survive; the next launch offers to delete an account that is already gone (its re-auth fails, "Not now" clears it).
- **Mounting:** `AccountCard` mounts on Me when R-6a is on main (one line). `appearanceCustomKey` joins the synced settings then too.

**GOOGLE notes (2026-11-03, board 11-03 row 7): Continue with Google on the web, behind a flag.** Prototype: `design/proposed/r6b-google.html` (waiting on John).
- **Off by default.** The button shows only in a web build made with `EXPO_PUBLIC_GOOGLE_SIGN_IN=1` (`client/src/auth/googleFlag.ts`); never on iOS or Android yet (needs EAS builds and a native Google module). With the flag off the app behaves as before, and the gate's e2e (`googleSignIn.spec.ts`) checks that Google's script never loads while signed out.
- **Same path as email.** `signIn({ kind: 'google' })` goes through the gate check first and `afterSignIn` after, and drops the Under 13 offer and closing like any sign-in. A first Google sign-in creates the account.
- **The script loads on the press.** Auth still has no popup resolver (`firebaseApp.ts`); `googlePopup.ts` passes `browserPopupRedirectResolver` to the popup call only. On a slow connection Safari may block the first window; the message asks for a second press.
- **No linking.** `auth/account-exists-with-different-credential` shows "sign in with your email and password" with the email filled in. Note: Firebase raises it only when the existing account's email is verified. The app never verifies emails, so a Google sign-in with the email of a password account takes that account over (same uid, the password unlinked; Auth emulator, `google.emu.ts`).
- **Delete with Google.** An account with Google and no password (`reauthKindFor`) proves itself for a delete with `reauthenticateWithPopup` (another Google account: Firebase's user-mismatch, nothing deleted). Cancel while Google's window is open gives the delete up; the abort is read before sync stops or anything is sent. The Under 13 offer for such an account records `method: 'google'`, and its re-auth is a Google sign-in with `existingOnly`: a Google account with no app account is deleted again at once, and another existing account fails the uid check.
- **Blocks turning it on: the takeover of unverified accounts (security review, high once the flag is on).** Someone can register a victim's Gmail address with a password (the app never verifies emails) and keep that session. When the victim later uses Continue with Google, Firebase hands them the same account. On the Auth emulator the squatter's earlier session still refreshes afterwards, and the Firestore rules check neither `email_verified` nor the sign-in provider, so the squatter could read and write the victim's synced data. The client cannot tell a takeover from a returning Google user. Either fix closes it: verify emails at sign-up (Firebase then raises account-exists, which the UI already handles), or on a Google sign-in have the backend revoke refresh tokens and write a "sessions valid after" marker that the rules compare with `auth_time` (the `deletedUsers` pattern).
- **Fixed from the security review:** G-2: Cancel now aborts the delete at once (an AbortController), so a Google window left open no longer holds the gate's sign-out, sync, "Not now" or another delete. G-3: the offered delete refuses to start while a sign-in waits on Google's window. G-4: `existingOnly` tries the removal of a just-created account three times. The counterexamples are tests (`googleSecReview.test.tsx`, `googleBackend.unit.test.ts`).
- **Known, low (parked: `bible-app-work/google/pending/`):** G-1: `reauthenticateWithPopup` acts on the server before Firebase's user-mismatch check. Picking an unknown Google account in the delete's re-auth leaves a stray account. Picking the Google account of an unverified password account takes that account over, and the same happens in the Under 13 offer's `existingOnly` re-auth. Nothing is deleted. The fix is to run both proofs as `signInWithPopup` on a second, in-memory Auth instance. Also: `providers` is read from `onAuthStateChanged`, which does not fire on link or unlink. A Google-only account on a build without Google (flag off, CSP, native) gets the Google delete view, which then fails with "couldn't finish".
- **Turning it on (John):** first close the takeover (above). Then:
  1. Turn on the Google provider in the Firebase console (OAuth consent screen, support email).
  2. Add `https://apis.google.com` to the hosting CSP's `script-src`. `frame-src` already allows `bible-app-492520.firebaseapp.com`, and COOP is already `same-origin-allow-popups`.
  3. Build the web app with `EXPO_PUBLIC_GOOGLE_SIGN_IN=1`, and deploy.

  The CSP stays as it is until then: with the flag off, widening it would only add a script host with JSONP endpoints.

**Moving aurora (John, 2026-11-02).** The glass presets' background moves instead of showing fixed orbs. Prototype: https://claude.ai/artifact/7a4knhcqYFhVAn45NwDfrD.
- **Two styles, chosen in Me → Appearance:** a fluid simulation, the default, which the reader can stir with a finger; and a lighter flow shader. Both render at half resolution and scale up.
- **Vivid colours, readable text:** the colours are not capped. Text that sits directly on the aurora gets a soft shadow so it stays readable; R-7 works out how the contrast test measures shadowed text. Scripture still never sits on the aurora.
- **Motion:** 60 fps. It pauses when the screen is hidden or the app is in the background, and shows a still frame when the device asks for reduced motion.
- **Hardware:** the prototype ran smoothly on John's school iPad. A low-end Android phone is still to try (needs EAS builds), as part of R-7's performance budget.
- **When:** R-7 builds the animation and the Appearance choice.

**R-7a notes (2026-11-02).** These are the parts of R-7 that need no other team. **Screens wait for approved
prototypes** (John, 2026-11-02), so R-7a ships no new screens. Prototypes in `bible-app-work/design/proposed/`:
`r7a-welcome.html`, `r7a-look.html`, `r7a-age.html` and `r7a-aurora-option.html`.
- **Old web data import** (`client/src/legacy/`).
  - **What it imports:** on its first run, the web build reads the old app's localStorage once: the last position,
    recent passages, highlights, notes, bookmarks and the theme.
  - **How it maps:** old highlights all showed in the old reader's one colour, so they import in that colour, mapped
    to the new six. Bookmarks are timed at the import. Light, Dark and Paper map to the default look in their mode
    (Paper is Silver); Auto follows the phone.
  - **Safety:** it never overwrites new-app data, never throws, and never changes the old keys, since the old site
    keeps working until the cut-over.
  - **Once per part:** each part is recorded once imported. **Reading progress** (goal, goal days, chapters read)
    is parsed and tested, and is written into R-3's `reading.progress` after R-3 merges; users who have already
    launched get it on their next launch.
- **First run** (`client/src/onboarding/`). `useFirstRun()` holds the state behind the screens: choose a look, finish
  with an optional age range (kept on the device), or skip.
  - **Skipping** gives Silver / Graphite following the phone, but keeps a light/dark mode imported from the old app.
  - **The gate** (`FirstRunGate`) wraps the navigator in the root layout: on a fresh device the intro shows instead
    of the app, and afterwards the app opens on the page that was asked for.
  - **`/privacy` is never covered** (B-1, #29): the privacy policy opens directly on a fresh device, for the App Store
    review URL and links from outside the app, and the intro stays not done. Exempt paths are exact matches in
    `FIRST_RUN_EXEMPT_PATHS` (`onboarding/FirstRunGate.tsx`).
  - **The screens** (approved 2026-11-02 as drawn, `bible-app-work/r7a/GO-AHEAD.md`): welcome, pick your look, your
    age. Steps 2 and 3 have a 44 pt Back and "Skip for now". Skip on step 1 drops the whole intro and gives the
    default look; "Skip for now" on step 2 or 3 ends the intro keeping the look picked so far, with no age. The look
    step's middle scrolls under a pinned footer, so Continue never falls off at large text or in Chinese.
  - **The age step (John, 2026-11-02):** it stays, with "Under 13".
    - **The age never leaves the device.** It is never synced or sent, so "It stays on this device" stays true
      (`onboarding/__tests__/ageStaysOnDevice.test.ts`).
    - **Under 13 turns off sign-in and sync,** so no email or synced data is collected from under-13s. The only
      thing other modules read is a boolean: `isSignInAllowed` / `useSignInAllowed` / `signInGateFor` in
      `client/src/onboarding/signIn.ts`. R-6b hides sign-in and never starts sync when it is false.
    - A line under the question says why the app asks, and that Under 13 keeps everything on the device with no
      sign-in.
  - **Text on the aurora:** sub-lines, captions and notes never sit directly on the moving aurora. They sit on a text
    card in the sheet paint, which keeps text and muted at 4.5:1 or better over every aurora colour
    (`onboarding/paint.ts`; the test measures over each of the three colours and the base). Headings keep the soft
    shadow at full strength. Glass chip edges are 3:1 against every aurora colour.
- **The aurora** (`client/src/aurora/`) runs behind glass presets on screens with the app background, never the
  reader.
  - **Web:** a WebGL2 port of the prototype. The fluid simulation is the default; the flow shader is the option
    (`aurora.style`, set from Customise once its control is approved). It renders at half resolution and pauses
    when the tab or page is hidden.
  - **Reduce Motion:** one still frame.
  - **Fallbacks:** if the GPU context is lost, the still gradient shows until the context comes back. On a software
    renderer (no GPU), the fluid simulation falls back to flow, and the aurora keeps moving at 30 fps instead of 60
    (John, 2026-11-02; `SOFTWARE_MAX_FPS` in `aurora/controller.web.ts`, `setMaxFps` in `aurora/loop.ts`). Reduce Motion
    still draws one still frame there.
  - **Native** has no GPU drawing library, so it shows a lighter drift of the orbs (UI-thread `Animated`). Adding
    Skia or expo-gl for parity is in Open.
  - **Where it shows:** `Screen` mounts it. Screens that build their own frame (Home, Study, Me) mount
    `<AuroraBackground />` themselves.
- **Shadowed text** (how the contrast test measures it): text that sits directly on the aurora gets a soft shadow in
  the preset's base colour. The test composites the shadow over the aurora colour at half its alpha, since a blurred
  halo does not fully cover. Measured that way, at full alpha, text and muted pass 4.5:1 over every aurora colour in
  all six glass presets (`client/src/aurora/__tests__/aurora.test.tsx`).
- **Performance budget**, measured on the web export with `client/scripts/perf-budget.mjs`:
  - **Setup:** headless Chromium on John's PC (Intel integrated graphics, D3D11), Pixel 7 viewport, median of 3
    runs, 2026-11-02.
  - **"Mid-range phone"** means 4x CPU throttling. A real low-end Android phone and the iPad are still to try (they
    need EAS builds).
  - **The local server sends files uncompressed**, so the 4G row is a worst case.

  | Measure | Budget | Measured |
  |---|---|---|
  | JS bundle, gzip | ≤ 600 KB | 492 KB (2.0 MB raw) |
  | Fonts loaded before the first paint | ≤ 500 KB | 0 KB (was 2.0 MB, 11 TTF files): only the active look's faces load, with `font-display: swap`, and the web never waits for them |
  | Home visible, mid-range phone, no network limit | ≤ 2.5 s | 1.7 s (was 2.3 s in the same run) |
  | Fonts fetched at start | — | pastel 5 files, 915 KB; glass 6 files, 1,126 KB (was 11 files, 2,041 KB for every look) |
  | Home visible, mid-range phone, fast 4G (1.6 Mb/s, 150 ms) | ≤ 5 s | **11.2 s** pastel, 11.7 s glass ✗ (was 22.4 s); what is left is the 2.1 MB of uncompressed JS (DOMContentLoaded 10.2 s) |
  | Aurora frame rate, GPU, at 1x and 4x CPU | 60 fps | 60 (fluid and flow) |
  | Main-thread time per frame, GPU, 4x CPU | ≤ 4 ms | fluid 1.5 ms, flow 0.6 ms, pastel (no aurora) 0.3 ms |
  | Long tasks while animating | 0 | 0 |
  | No GPU (SwiftShader) | no fluid simulation | flow at **30 fps** (was 61): main-thread time 258 ms/s at 1x CPU and 400 ms/s at 4x (was 485 and 645), 9 and 13 ms per drawn frame against a 33 ms frame |
  | JS heap | — | 11–12 MB |

  **Follow-up (John, 2026-11-02), re-measured the same day** (before = 45d8dcf, after = this PR; same script and machine,
  median of 3; the start-up rows ran on SwiftShader):
  - **Start-up fonts:** at start only the active look's fonts load: its UI font and its Scripture font
    (`fonts/lookFonts.ts`, `fonts/FontGate.tsx`), plus Noto Serif SC only when the interface or the reader's translation
    is Chinese. Every face is `font-display: swap`, and the web renders at once in the fallback font. A phone (bundled
    local fonts) still waits for the first look's fonts, so it never flashes a fallback face. Other looks' fonts load
    when a look is chosen, and when the look picker shows them. A face that failed to download is downloaded again on
    the next ask. `e2e/startupFonts.spec.ts` checks the request list.
  - **Fast 4G:** Home now waits only for the JS bundle. It still misses 5 s because the local server sends the 2.1 MB
    uncompressed; gzip (517 KB) is a hosting setting (Firebase Hosting compresses), not app code.
  - **No GPU:** the aurora keeps moving at 30 fps there, which cuts its main-thread time by 38–47%.

**Memory merge, part 1: the logic (team MEM, 2026-11-02).** Little Lamb's memory engine is ported into `client/src/memory/` with its tests (roadmap track 5). The screens wait for John's approval of the prototypes (`bible-app-work/design/proposed/mem-*.html`).
- **Local-first schedule.** Little Lamb computed the review schedule in Postgres. The device now runs the same rules in TypeScript (`schedule.ts`, `dailyLesson.ts`):
  - mastery +20 on a pass, -60 on a fail;
  - intervals of 1, 2, 4, 8 and 16 days;
  - the due-gate (no credit for practising a verse that isn't due);
  - the five review bands with the lapse cap;
  - the plan frozen for the day;
  - a streak that survives until midnight.
- **No new dependencies.** Pinyin, jyutping and traditional-to-simplified matching use generated per-character tables (`speech/data/`, made by `client/scripts/gen-speech-tables.cjs` from pinyin-pro, to-jyutping and OpenCC), not the three npm packages. A character with several readings gets its usual one (了 is le). Both sides use the same table, so a correct recital still scores 100. One side effect is an improvement: a single mistake no longer costs a neighbouring character (test S13's pinned cases are gone).
- **Voice transcription** is `POST /memory/transcribe` (`app/memory/`). It proxies OpenRouter Whisper with Little Lamb's limits: 256 KB of audio, and 10 calls a minute or 100 a day per user, refunded when the upstream fails.
  - Sign-in (11-03): `require_memory_user` verifies the Bearer Firebase ID token through R-6b's `get_firebase_user` (then App Check per `APP_CHECK_MODE`) and returns the uid; no token or a bad one is a 401 before the audio is read, and the quota keys on the uid.
  - The quota is held in memory per instance. Cloud Run runs up to 3 (`deploy.py`), so a user's real budget is up to 3x until it moves to Firestore (follow-up).
  - It needs `OPENROUTER_API_KEY` (a paid key, John) on the server; without the key it answers 503.
- **Storage:** `client/src/storage/memoryKeys.ts` holds `memory.progress`, `memory.lesson`, `memory.history` and `memory.settings`.
- **Not yet:**
  - the screens and the audio recorder (`expo-audio` on native is a new dependency, John's call);
  - the entry point in Study or Home (after R-3/R-4);
  - English verses (BSB) and memorising highlighted verses;
  - syncing progress.

**Memory merge, part 2: the screens (team MEM, 2026-11-02).** Built from the approved prototypes (`bible-app-work/design/proposed/mem-*.html`) and the final UI review (`mem/REVIEW-3.md`).
- **Where:** Memory home (`/study/memory`) and the week (`/study/memory/week`) sit in the Study tab's stack, so the tab bar stays; Study gets a Memory card above its segments. The trainers (`/memory/lesson/<verse>/<stage>`) and the lesson's end (`/memory/complete`) are root screens, so the tab bar hides. `(tabs)/study.tsx` became `(tabs)/study/` (a stack).
- **Home:** today's lesson (Start, Continue, "1 step left" for a skipped step, "Done today" as a status), the week strip and streak, verses learned, and the library by series and topic with each verse's stage. A row opens a sheet with the verse, its next review and "Practise now" (free practice; it doesn't count toward the lesson or the streak). Settings: script, a "Voice answers" switch, and the speech language.
- **Trainers:** chunk order (correct slots stay; "Show me the order"; Skip), fill-in (a different phrase on Try again; progressive hint; short phrases must be exact), full recall (progressive hint; the reference card says how the spoken reference was read; "Heard differently? Type it" spends no voice check). A pass after a hint is shown but doesn't finish the step and records nothing. The diff shown is the grader's own alignment, so a sound-alike shows as correct.
- **Voice:** web through `MediaRecorder` (Opus, mono, 32 kbps); iOS and Android through `expo-audio` (John approved it on 11-02: AAC in .m4a, mono, 32 kbps, uploaded as `audio/mp4`), behind the same `Recorder` interface. Both auto-stop at 30 s (about 120 KB, under the server's 256 KB), and Cancel discards. The native adapter is unit-tested against a fake of the module only; it needs a device check on an EAS development build. A build without the native module falls back to typing with a note. Before a mic is shown the trainer checks, in order: voice on, a recorder on this platform, signed in, online, no 503 seen this session, no 429 still running; any failure shows its notice in the mic's place, with typing as the main action. The first mic tap opens the consent sheet (the server hop to OpenRouter, nothing kept by our server). Grading waits at most 30 s and can be cancelled.
- **Midnight (fixed 11-03):** Memory home and the week re-read the clock on every render, so a progress change after local midnight moves them to the new day without waiting for their midnight timer (which runs late in a throttled background tab). Sol's S2 r3 test is now `memory/__tests__/sol-s2r3-delayed-midnight.test.tsx`.
- **Voice attempts are one state machine (11-03, board row 3).** `memory/voice/attempt.ts` (React-free, unit-tested) runs idle → starting → recording → stopping → sending → grading → idle. One attempt at a time, with its own abort signal; Cancel (recording or checking), Try again, leaving the step, unmounting and an auth change all abort the live attempt, whatever phase it is in, and a handler from an older render acts on the live machine. The voice panel is a thin adapter over it. The step has a scope (`ctx.left`): Back, Skip and Next abort it before they navigate, so a grade still pending records and shows nothing and chunk order's Check does nothing. Auth: a change of `signedIn` or of the user voids the attempt; a voice result is applied only while the session is still the one whose token it sent (the same token, or a JWT with the same `sub`, so Firebase's hourly refresh doesn't drop it). Sol's parked S3 r3/r4/r5/r7 tests now pass in the repo (`sol-s3r3-back`, `sol-s3r4-cancel`, `sol-s3r5-skip`, `sol-s3r7-auth-token`).
  - Before anything is graded, recorded or shown, the grade re-confirms the session (after the speech keyer loads), so a token replaced mid-grade drops the answer. An auth change while the request is still out voids its result but the panel shows "checking" until the request returns (the real client returns at once on abort); after it landed, the attempt ends at once.
  - Review: Sol 2 rounds. Round 1 found 4 (token replaced during the keyer, a typed Check queued after Back, a hung token read blocking recovery, the bridge returning a pre-change token after A → out → A), fixed by a fresh `implementer-hard`; round 2 clean. Every counterexample and check is a regression test (`sol-sm1-*`, `sol-sm1r2-*`).
- **Sign-in (11-03):** the lesson route wraps the trainers in `AccountMemoryAuth` (`memory/voice/accountAuth.tsx`): signed in is R-6b's `useAccount()` status, and the ID token is Firebase's current user's, only while that user is the account's (Firebase is loaded only when a token is asked for). The signed-out notice's Sign in opens the Me tab, and only while sign-in is allowed on the device (not Under 13). Voice requests carry `X-Firebase-AppCheck` when App Check gives a token within 3 s. Voice works on the web once INT's sign-in gate is on and the backend is redeployed.
- **Not yet:** English verses (queued: the ESV, John 11-02), syncing progress, a shared (Firestore) quota.

**R-3 notes (2026-11-02).**
- **Study → Saved:** every highlight, note and bookmark, newest first. Verses saved together (a range from the verse sheet) show as one entry, "John 3:16–18". Filters: kind (All, Highlights, Notes, Bookmarks), colour, and book (a sheet listing only the books that have items). Book names and dates follow the interface language; the verse text is in the reader's current translation. Tapping an entry opens it in context: the Bible tab, that chapter in the same translation, the verses selected (sheet closed), scrolled into view, with focus on the first.
- **Study → Progress:** the streak (with the best streak) and this week, Monday first; today's minutes against the daily goal; chapters explored, "N / 1,189", and the coverage map, one square per book, shaded from none to every chapter. English uses three-letter book codes and Chinese the CUV abbreviations; screen readers hear the full book name and the count. The design's third segment, Explore (people, places and themes), comes with R-5.
- **Reading time and chapter credit** follow the old app's rules:
  - **Time:** time counts between interactions (opening a chapter, scrolling, tapping a verse), up to 15 s per gap. While a chapter is showing it keeps counting for up to 60 s after the last interaction. Nothing counts while the tab or the app is in the background.
  - **Credit:** a chapter is credited once half of it (at least 3 verses) has been on screen and 1.5 s per verse has been spent on it (20–75 s), in any translation. A chapter that fits on the screen counts as fully seen.
  - **Days and streaks:** days are local calendar days (the old app used UTC), and time across midnight is split between the two days. A day counts towards the streak when its time reaches the goal. The goal defaults to 10 minutes, as before; Me → Reading sets it in R-6.
  - **Picker:** the book picker marks read chapters with a dot and "Chapter 3, read".
- **Storage:**
  - Stored values can now be migrated from an older version.
  - Study items moved to version 2: highlights carry the time they were set (R-2 highlights read as having no date, and show none).
  - Reading progress is a new key, `reading.progress`. It is validated against the 66 books' chapter counts and real calendar days.
  - Both stay local until sync (R-6). The old app's progress import is R-7.
- **Review:** Sol reviewed the shared layer (2 rounds, 7 fixes) and the two teams (4 rounds). The reader's reading-time geometry and scroll-to-verse went round the 5a loop to `implementer-hard` twice. After round 3 John chose one more round with a fixed design: every reader handler reads the live chapter and running state when it runs, so nothing counts while the reader is away; only the chapter's own end marker measures its content (a content-size report can only raise it, and a scroll shorter than it is dropped); a layout report for a chapter not on screen never touches the scroll-to-verse cache. Round 4 found one more issue in the geometry class. By John's decision it ships as a known gap, below.
- **Known gaps (geometry; each errs towards less credit unless noted):**
  - **Smaller text on the web:** the zero-height end marker moves without resizing, so it reports no new place, and the measured height cannot go down. A chapter that fits better after the text shrinks is under-credited until it is scrolled. Test: `e2e/reviewR3Round4Shrink.spec.ts` (`fixme`).
  - **A late scroll before the new chapter's end marker reports** (about one frame after a chapter turn) is judged by its own sizes; a late scroll from the old chapter's bottom in that window could credit the new chapter's last verse. This one errs towards more credit.
  - **The end marker cannot tell translations apart:** a late report from the same chapter in the previous translation, with the same verse count, is accepted.
  - **A chapter laid out while the reader is hidden** keeps no marker measurement, so a short chapter that fits is credited only once it lays out again or is scrolled.
- **Still to check on a device (needs EAS builds):** reading time with the app going to the background, and scroll-to-verse on native (it estimates a verse's position inside the single-paragraph view from its share of the text).

**B-1 web beta notes (2026-11-02).** The new web app ships as a public beta on Firebase Hosting (John, 11-02).
- **Where:** site `bible-app-492520`, https://bible-app-492520.web.app, a new URL. The old site keeps running, and beta testers start fresh, so the old-`localStorage` import does nothing there. The live channel waits for John after the phase PRs merge; runbook in `deploy/web.md`.
- **Build config:** `client/.env.production` (committed, public values only) gives the API origin (W5's Cloud Run `bible-api`), `EXPO_PUBLIC_RELEASE_CHANNEL=beta` and the Firebase web config. `client/src/api/config.ts` reads them: a production build with no API URL, or a non-https one, throws rather than calling localhost. R-6b reads `getFirebaseWebConfig()`.
- **Hosting:** `firebase.json` `hosting` serves `client/dist` with a single-page rewrite. HTML is `no-cache` and the content-hashed `/_expo` and `/assets` trees are immutable for a year; checked on the real host. A strict CSP (scripts `'self'` only; the API, Firebase Auth and Firestore in `connect-src`; Google Fonts for the Chinese font), nosniff and Referrer-Policy go on every response. `ignore` is empty on purpose, because font paths contain `node_modules`.
- **Beta label:** in beta builds, Simplified Chinese is offered as "简体中文（测试版）", with a one-line note (`beta.*` keys, `client/src/beta/`). Mounting it in Me's language sheet waits for R-6a.
- **Privacy policy** at `/privacy`, in English and Chinese, also for the App Store. The prototype `design/proposed/b1-privacy.html` was approved 11-02; the build also takes in a UI/UX review.
  - It matches what the app does: local-first; API requests carry only references and search words; Firebase only when signed in. It must change whenever the app sends data somewhere new.
  - It has a short-version box, a card on deleting your data, and a children-and-teens card.
  - **Minimum age (John, 11-02):** first run asks an optional age range that stays on the device. Choosing Under 13 turns sign-in and sync off. R-7a and R-6b build that; the policy already says it.
  - The contact email is a temporary address (`PRIVACY_CONTACT` in `client/src/privacy/index.ts`), to confirm before App Store review.

**R-6a notes (2026-11-02): the Me tab, without accounts.**
- **Me:** Appearance (look, light or dark, reading font, text size), Language (app language), Reading (translation, parallel translation), More (Sources and credits, About and privacy, Help). The Me tab is now a stack: Me → Customise → Advanced, and the three info screens.
  - Left for other phases: the account card (R-6b), the daily goal row (R-4's goal sheet, mounted here once both merge), the read-aloud voice (R-7).
- **Customise** (from the signed-off design): a live preview of Home, the 12 presets, light/dark/follow the phone, the accent, the reading font, text size and Reset.
  - Picking a preset of the other mode switches to that mode, so the preset shows.
  - The accent and colour edits are kept per preset, so a light preset and its dark partner each keep their own.
  - An accent that would be hard to read on the look is disabled and says why.
- **Advanced:** edit every plain-colour token of the preset that shows (gradients, borders and shadows stay the preset's).
  - **The contrast guard:** an edit is refused if any text pair the preset shows falls below 4.5:1 and below the preset's own ratio. So the glass presets' known gaps are allowed as they are, but never made worse.
  - Stored edits are checked again when the theme is built, and a set that fails is ignored as a whole.
  - Line height isn't in the signed-off design, so it isn't built.
- **Reading font:** the choice applies to Latin-script Scripture. Chinese Scripture always uses Noto Serif SC, and Customise says so in Chinese.
- **Storage:** the new key `appearance.custom` (`src/storage/appearanceCustomKey.ts`) holds the reading font and the per-preset edits. The text size reuses R-1's reading settings.
- **Review:** Sol ran 3 rounds; every finding became a permanent test.
  - **Round 1:** a rounding gap in the contrast guard (4.495:1 passed as 4.50), quick presses losing changes, a translation change overwriting a newer position, and the size row overflowing at 150%.
  - **Round 2:** the same "value captured at render" class on other paths, escalated to `implementer-hard`.
  - **Round 3:** it again, after the escalation (5a step 5). John chose to ship and fix in a follow-up.
- **Known gaps (a follow-up PR; Sol's failing tests are parked in `C:/dev/bible-app-work/r6a/pending/`):**
  - **F10:** coming from Liberty or Northern lights (no light/dark partner), choosing a paired preset can show its opposite partner.
  - **F11:** if the phone switches light/dark between render and a press, an edit or reset can target the previous preset.
  - **Root cause:** the ThemeProvider has no "preset showing now" call, so the screens infer it. The fix is a ThemeProvider call that resolves the stored choice against the phone's current scheme, then dropping `src/me/showingPreset.ts`.
- **Flaky on main (not R-6a's):** `e2e/reader.spec.ts` "Back restores the words list scroll" fails about 1 run in 3 under load.

**INT notes (2026-11-02, the wiring after the 11-02 merges).**
- **Sign-in is on.** `_layout.tsx` gives `AccountProvider` the app's gate, `appSignInGateFor()` (`onboarding/signIn.ts`): closed until the intro is finished or skipped (the age is unknown until then, so a restored session never syncs first), then closed for Under 13 and open for every other answer, including no answer. It reads the stored first-run state live. Tests: `onboarding/__tests__/appSignInGate.test.tsx` and the e2e `int.spec.ts`.
- **Security review (Opus):** one major finding, fixed. On the web, storage only notifies its own tab, so a second tab still on the intro could Skip (or pick another age) and overwrite a stored Under 13. The intro's `finish`/`skip` now read the stored state at the press, and the stricter answer wins: Under 13 from either tab always stands, any other answer keeps the stored one (`secReviewTwoTabs.test.tsx`; the delta review caught that the first fix dropped a stale tab's Under 13).
- **Mounts:**
  - **Me:** the account card on top; a "Daily goal" row in Reading that opens R-4's goal sheet; the language sheet uses `languageLabelKey()` and, in the web beta build, the beta note (full text colour, `aria-describedby` on the Chinese option).
  - **About:** the privacy card links to `/privacy`. Its text now says settings stay on the device unless you sign in to sync them.
  - **Customise:** the moving-background option, after Look.
- **Synced settings:** `appearance.custom` joins `settings` in `sync/registry.ts`. `SETTING_KEYS` already listed it.
- **The aurora** now runs on Study, the Explore list and entity pages, Memory home, week and the lesson's end, the Me sub-screens (Sources, About, Help, Customise, Advanced) and `/privacy`. Text that sits on it carries the shadow, which is what keeps muted text at 4.5:1 too. It never runs behind Scripture: not in the reader, and not in the memory trainers, which show the verse on the background.
- **R-6a F10/F11 fixed:** ThemeProvider's `showingPresetId(choice?)` resolves a choice against the phone's scheme read at the call, and `me/showingPreset.ts` is gone. A look pick keeps the light/dark setting unless that setting would show the picked look's partner. Sol's parked tests now pass. One case was rewritten because it could not pass as written: Blue is refused on Bubblegum night by the contrast guard.
- **Kept:** `app/account-preview.tsx`, because `e2e/account.spec.ts` and `under13Offer.spec.ts` open the sheets there over an inert backend.
- **Parked (follow-ups):**
  - **Cross-tab storage events (review F2, minor):** a stale tab doesn't hear another tab's writes. One case remains: an adult signs in in tab A, then picks Under 13 in tab B's stale intro. The account is signed out with no delete offer. The fix is a `storage` event listener in the shared `storage/storage.ts`.
  - **Review F3:** a future `onboardingKey` version bump must bring a `migrate`, or every Under 13 device sees the intro again.
  - **Sol r2 (sync size):** Advanced accepts edits until `appearance.custom` passes sync's 4,000-character limit (about 230 colour edits across nearly every look). From then on the setting stops syncing, the font included. Fix: Advanced refuses an edit that would cross the limit, with its own message (new catalogue keys), or the limit is raised in `sync/types.ts` and `firestore.rules` (team AUTH). The failing test is parked in `C:/dev/bible-app-work/int/pending/intSolR2Sync.test.ts.pending`.
  - **Memory Week's done label** (`StatusLabel`, `memory/ui/parts.tsx`, team MEM) sits on the aurora without the halo.

**Memory merge, part 1: the logic (team MEM, 2026-11-02).** Little Lamb's memory engine is ported into `client/src/memory/` with its tests (roadmap track 5). The screens wait for John's approval of the prototypes (`bible-app-work/design/proposed/mem-*.html`).
- **Local-first schedule.** Little Lamb computed the review schedule in Postgres. The device now runs the same rules in TypeScript (`schedule.ts`, `dailyLesson.ts`):
  - mastery +20 on a pass, -60 on a fail;
  - intervals of 1, 2, 4, 8 and 16 days;
  - the due-gate (no credit for practising a verse that isn't due);
  - the five review bands with the lapse cap;
  - the plan frozen for the day;
  - a streak that survives until midnight.
- **No new dependencies.** Pinyin, jyutping and traditional-to-simplified matching use generated per-character tables (`speech/data/`, made by `client/scripts/gen-speech-tables.cjs` from pinyin-pro, to-jyutping and OpenCC), not the three npm packages. A character with several readings gets its usual one (了 is le). Both sides use the same table, so a correct recital still scores 100. One side effect is an improvement: a single mistake no longer costs a neighbouring character (test S13's pinned cases are gone).
- **Voice transcription** is `POST /memory/transcribe` (`app/memory/`). It proxies OpenRouter Whisper with Little Lamb's limits: 256 KB of audio, and 10 calls a minute or 100 a day per user, refunded when the upstream fails.
  - Sign-in (11-03): `require_memory_user` verifies the Bearer Firebase ID token through R-6b's `get_firebase_user` (then App Check per `APP_CHECK_MODE`) and returns the uid; no token or a bad one is a 401 before the audio is read, and the quota keys on the uid.
  - The quota is held in memory per instance. Cloud Run runs up to 3 (`deploy.py`), so a user's real budget is up to 3x until it moves to Firestore (follow-up).
  - It needs `OPENROUTER_API_KEY` (a paid key, John) on the server; without the key it answers 503.
- **Storage:** `client/src/storage/memoryKeys.ts` holds `memory.progress`, `memory.lesson`, `memory.history` and `memory.settings`.
- **Not yet:**
  - the screens and the audio recorder (`expo-audio` on native is a new dependency, John's call);
  - the entry point in Study or Home (after R-3/R-4);
  - English verses (BSB) and memorising highlighted verses;
  - syncing progress.

Every phase ships its screens in both languages; the missing-key test keeps Chinese from falling behind.

After R-7, new roadmap features are built frontend and backend together:
- commentary CM-1 to CM-4
- the memory merge
- streak sync
- groups
- trivia
- the AI agent.

## Open (for John, as they come up)
- **Glass preset contrast:** keep the 43 glass known gaps (mostly secondary text over bright glows; plain Scripture passes), or adjust `muted`, the accent, the highlight or the glow colours in Liberty, Silver, Sky, Northern lights, Graphite and Deep blue until they pass. Liberty (14) and Northern lights (15) have the most. Pinned in `client/src/theme/__tests__/contrast.test.ts`.
- **App identity:** the app's name, icon and store listing.
- **Minimum age and privacy:** this matters for accounts and groups.
- **Shipping native builds:** EAS Build accounts (Apple Developer, Google Play).
- **Translating the English-only content** (commentary, people/places/themes, quizzes) into Chinese: a later project.
- **Screens still to draw:** search, the chapter tools sheet, the people/places/themes pages, sign-in. Draw each before the phase that builds it.
- **First run and the aurora option (R-7a):** approved 2026-11-02 and built. The age list offers "Under 13", which keeps everything on the device with no sign-in (R-7a notes). Mounting the aurora option in Customise waits for R-6a.
- **Start-up fonts (R-7 budget):** done (R-7a follow-up): only the active look's fonts, `font-display: swap`. Still open: WOFF2 subsets on the web (about a third of the TTF size), and serving the JS compressed in the fast-4G measurement.
- **Native aurora parity:** add `@shopify/react-native-skia` (or `expo-gl`) so iOS and Android run the fluid simulation and the flow shader too. Today they show a lighter UI-thread drift.
- **Signed off (John, 2026-11-01):** these screens are drawn on the canvas's "All screens" page, in every preset and in both languages:
  - Home and the reader
  - the book and chapter picker
  - parallel reading on phone and tablet
  - Original words and the word card
  - the commentary sheet and its empty state
  - Study (saved and progress)
  - Me
  - customisation

  Phases build from them.
- **Reworking the chapter summaries:** John finds the current summaries poor (2026-11-01). They need reworking before they become the fallback for verses with no commentary. Matthew Henry covers 77% of verses, and 321 of 1,189 chapters have no note at all. This fits the commentary rebuild (CM-1 to CM-4).
