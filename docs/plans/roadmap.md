# Product roadmap (2026-10-31)

## Vision
One app where young people **read, study, memorise and grow together** in Scripture:
- see the Hebrew and Greek beside the text
- get help from an AI that connects passages across the Bible
- memorise verses
- keep each other accountable through streaks, groups and trivia.

It's for **web, iOS and Android**.

## Where things stand
- **Foundation (`foundation.md`):**
  - W0, W1 and W4 are done.
  - W3 (the AI agent) is deferred until the rebuild.
  - W2 (Firebase accounts) and W5 (GCP deploy) are blocked on John's Firebase and GCP projects.
- **In progress:**
  - **Hebrew and Greek** (`hebrew-greek.md`): HG-1 data is merged, HG-2 API is in review, and HG-3 (the Original words panel) is next.
  - **Visual identity** (`visual-identity.md`): VI-1 tokens are in review; VI-2 replaces the 20 themes with one identity and accent hues.

## Feature tracks

### 1. Hebrew and Greek beside the text
In progress. After HG-3:
- tap words in BSB
- an interlinear reading mode
- "every verse with this word".

### 2. Commentary
Next after Hebrew and Greek; not yet scoped.

### 3. App UI and performance
Includes VI-2 and the responsive and mobile layout pass. The mobile app work in track 4 depends on it.

### 4. iOS and Android apps
- **The goal:** the same app in the App Store and Play Store, not only the website.
- **Constraint:** Apple rejects apps that are only a website wrapper (App Review 4.2, minimum functionality). The Little Lamb release notes flag the same issue. The apps need real native value:
  - push and local notifications for streak and accountability reminders
  - offline Bible text
  - microphone access for memory practice
  - share sheets, haptics, and widgets later.
- **Options:**

  | Option | Summary | Tradeoff |
  |---|---|---|
  | **A. Capacitor** (likely recommendation) | Wraps the existing React frontend in native shells, with native plugins. The FastAPI backend stays separate. | One codebase and the fastest path. Needs a static-exportable frontend (an audit later). |
  | B. Expo / React Native | A native UI that shares API code and types. | The best native feel, but a second UI to maintain. |
  | C. PWA only | Installable from the browser. | Weak on iOS: no App Store presence, limited push. |

- **Prerequisites:**
  - Apple Developer Program ($99/year) and a Google Play developer account ($25 once), in John's name
  - accounts (W2), so progress syncs across devices
  - the push notification provider: Firebase Cloud Messaging fits W2.

### 5. Bible memory (merge Little Lamb)
- **Source:** `C:\dev\huoshui\workspace\bible-memory\bible-app` (GitHub `Johnwang688/bible-memory-app`). It teaches the Navigators' Topical Memory System (60 verses in five series, Chinese CUV, simplified or traditional script) in four stages:
  - chunk order
  - fill-blank by voice (Whisper transcription matched on pinyin)
  - full recall
  - spaced review.
- **The plan:** port the trainers and the spaced-repetition logic into this app as a Memory section, with its tests. Then:
  - extend it to English, using BSB as the default
  - let students memorise any verse they've highlighted, not only the TMS list
  - move per-user progress from Little Lamb's Supabase into the new user store (W2).
- **Reused as is:** the voice transcription proxy, its quota, and the pinyin and jyutping matching for Chinese.

### 6. Streaks across reading, study and memory
- **One daily activity log** records chapters read, active study minutes, AI and study use, and memory reviews.
- **Streaks:** one per activity, plus an overall "time with God today" streak, with daily goals.
- **Builds on:** today's reading progress and daily-goal code, and Little Lamb's week-streak view.

### 7. Accountability
- **Small groups** (a youth group, friends): members see each other's daily completion and streaks, send encouragement or nudges, and build group streaks.
- **Safety first, because users are minors:**
  - opt-in sharing, with leader-created or leader-moderated groups
  - no public profiles or open direct messages
  - age and consent handling (COPPA for under-13s)
  - report and block.
- Needs accounts (W2).

### 8. Community trivia and Bible knowledge
- **What:** trivia rounds, a live "quiz night" for a youth group, and leaderboards inside groups.
- **Depends on a good question bank.** The current bank is deferred because the bulk-generated questions are poor. The rebuild is AI-drafted questions, human-reviewed, each tied to a passage, with difficulty levels.

### 9. A study agent with cross-text connections (W3 rebuild)
- **What:** a retrieval-augmented agent that draws connections across the Bible (quotations, themes, typology, parallel accounts) and grounds every claim in fetched text.
- **Needs:**
  - **cross-references:** TSK was never loaded; OpenBible.info's cross-references are CC BY
  - **embeddings** over verses and commentary
  - **the word tables from HG-1**, so the agent can talk about Hebrew and Greek
  - **a new system prompt** and a fuller tool set.
- The first live eval's failures (23/30) are the checklist for the new prompt: answer in the reader's language, fetch before discussing, flag verses that don't exist, emit the actions it promises, and decline to speak as Jesus or God.

### 10. Surprise me (random chapter)
- **What:** a button that opens a random chapter, **weighted toward books and chapters the student hasn't read yet**, so over time they reach the whole Bible.
- **Extras:** a coverage map ("books you've explored") and an optional "this week, read something from the Prophets" nudge.
- **Size:** small, and a good quick win once VI-2's components exist. Reading progress already records chapters.

## Suggested order
1. Hebrew and Greek (HG-2, then HG-3), then commentary, then UI and performance (VI-2 and the responsive pass). This is John's stated order.
2. Surprise me, as a quick win alongside UI and performance.
3. W2 accounts (needs John's Firebase project). This unblocks streak sync, groups and mobile.
4. The memory merge and unified streaks.
5. The mobile apps (Capacitor shells, push, offline), once the responsive UI exists.
6. Accountability groups, then community trivia (after the question bank rebuild).
7. The study agent rebuild (RAG and cross-references).

## Open decisions for John
- The mobile approach: Capacitor, Expo, or PWA first.
- Memory languages at launch: Chinese only (as Little Lamb) or Chinese and English.
- Group model: leader-created groups only, or friend groups too; and the minimum age.
- Whether Little Lamb keeps running on its own until the merge, or is retired then.
