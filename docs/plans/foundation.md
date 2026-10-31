# Foundation plan: GCP-lean rework

_Status: in progress. Updated 2026-10-30 after the first overnight run._

## Progress (2026-10-30)

| Workstream | Status | Notes |
|---|---|---|
| W0 safety net | **Done** | Content export in `content/source/`, 44 golden responses, Playwright smoke suite, git cleanup |
| W1 content SQLite | **Done** | `scripts/build_content.py`; content endpoints read SQLite, with no Supabase calls for content. FTS5 search matches Postgres's match sets ≥ 95% (17 queries). Quiz question reads moved to W2. |
| W2 Firestore + Firebase Auth | Not started | Needs a Firebase project and John's decisions |
| W3 Claude | **W3-A and W3-E done; rest deferred** | Claude chat path behind `AI_PROVIDER` (default `openai`, unchanged); 30-case eval harness. First live eval (2026-10-30, Haiku 5.5, $0.014): 23/30. Failures: no navigate button when promised, English reply to a Chinese question, a non-existent verse (John 3:45) not flagged, two cross-passage answers from memory without fetching, Jesus roleplay reaching the model, and one false positive in the eval's CJK quote check. **Deferred (John, 2026-10-30):** the agent will be rebuilt with a new system prompt and a fuller tool set, after Hebrew/Greek, commentary, and app UI and performance. Unverified partial fixes are on local branch `fix-claude-eval`. W3-B (streaming) not started. |
| W4 frontend split | **W4-1 to W4-6 done** | `BibleApp.tsx` went from 7,253 to 4,641 lines. W4-6 (React contexts, John 2026-10-30) moved reader settings, auth, study items and reader position into four providers: 80 → 63 `useState`s. PR #2, stacked on PR #1. Handlers and account sync are still in `BibleApp`. |
| W5 deploy | Partly | The Docker image now builds `content.sqlite` (two-stage build). GCP setup not started. |
| Bug fixes | **Done** | A reload no longer wipes signed-out data; deep links and saved positions set the chapter state; values read back from storage are validated; a late duplicate startup no longer wipes note drafts in dev |

Tests: 255 backend (golden responses run offline in the default suite), 39 Playwright e2e, 10 Node unit tests, and a Docker image test that skips without a daemon.

**Next (John, 2026-10-30):** Hebrew and Greek, commentary, app UI and performance; then the agent rework (W3).

**Found and still open:**
- **Verse popup is clipped after pinch-zoom on phones** (HG-3a review round 3, deferred by John 2026-10-31). `placeVersePopup` uses the layout viewport, not `visualViewport`. Fix it in the mobile UI pass, where phone verse tools will probably become a bottom sheet. Failing test saved in `bible-app-work/hg/followup-pinch-zoom.spec.ts`.
- **Content build: a table declared with count 0 can have no file** (HG-1 review round 3, deferred by John 2026-10-31). The "declared means required" check covers only `bsb_words` and `lexicon`. A hand-edited manifest declaring `verses: 0` with no verse file builds an empty table. The real manifest can't trigger it, because it declares 155,491 verses and counts are enforced. Fix: apply the check to every table. Failing test saved in `bible-app-work/hg/followup-zero-count-test.py`.
- **Quiz bank drift.** The served bank does not match `quiz-questions/*.json`. 1/2 Samuel and Joshua serve template-generated questions, while better authored ones go unused. Genesis serves 178 of 2,500 authored questions; Proverbs, 2 Kings and 1 Chronicles serve none. The un-timestamped migrations `039_` to `061_` were probably never applied. **Deferred (John, 2026-10-30):** the authored questions were bulk-generated without QA and most are poor, so the quiz bank is revisited after the other core features, not rebuilt from the JSON now.
- **Missing content.** TSK cross-references were never loaded, and KJV/BSB have no text.

## Goal

Put the app on a base that new features (AI study partner, Greek/Hebrew, Together mode, bilingual reading) can be built on without fighting the code:

- No more Supabase free-tier pausing; everything on GCP, close to $0/month at youth-group scale.
- Read-only content lives in a versioned SQLite file built from source files, not in a database.
- User data and sign-in move to Firestore + Firebase Auth.
- The AI moves from OpenAI to Claude Haiku 5.5 with real tools and streaming.
- `BibleApp.tsx` (7,253 lines) is split into feature modules.

**Not in scope:** new user-facing features (Socratic mode, word study, groups, maps, audio). This phase should be behavior-preserving except for the AI, which gets better.

## Decisions already made

| Decision | Choice |
|---|---|
| Audience | Teens / youth groups |
| Approach | Evolve in place (keep FastAPI + Next.js) |
| Static content | SQLite file baked into the backend image |
| User data | Firestore (native mode), accessed only from the backend |
| Auth | Firebase Auth (Google + email) |
| Hosting | Cloud Run (backend + frontend), scale to zero |
| AI model | `claude-haiku-5-5`, every request kept under 100K input tokens (the price is 5x above that) |
| AI provider | Anthropic API first, to use the Console promo credits; switchable to Vertex AI with one setting |

## What the code looks like today (facts this plan relies on)

- **Content tables:** `translations`, `books`, `verses`, `commentary_sources`, `commentaries`, `cross_references`, `summary_entities`, `commentary_entity_mentions`, `quiz_question_bank`, plus the view `quizzable_chapters_stage1` and the functions `get_passage`, `search_bible`, `search_commentary`.
- **User tables:** `profiles`, `user_settings`, `study_items`, `highlights` (older, superseded by `study_items`), `reading_progress`, `user_chapter_progress`, `quiz_attempts`, `user_wallet`, `user_mastery_scope_rewards`.
- **User data already points at content by natural keys** (`translation`, `book_number`, `chapter`, `verse_start`), not row IDs. That makes the split safe. The one exception: quiz submit and hint use `quiz_question_bank.id` (a BIGSERIAL), `app/services/quiz_service.py:240` and `:392`.
- **Some content only exists in Supabase.** There's no source file in the repo for the WEB text or Matthew Henry. `scripts/load_mhcc.py` survives only as a `.pyc` in `scripts/__pycache__`. **The Supabase export in step W0.1 is the only copy. Do it first.**
- **What's actually in Supabase (checked 2026-10-29):**
  - **Translations:** 6 are listed (KJV, WEB, BSB, CUV, CUV-SIMP, ASV), but only 4 have verse text: WEB, ASV, CUV, CUV-SIMP (124,405 verses). KJV and BSB are empty, which is why the picker hides them. There is no CUNP.
  - **Commentary:** `cross_references` is empty, so the TSK cross-references were never loaded. `commentaries` has 4,553 rows (Matthew Henry, TSK notes, and the chapter summaries).
  - **Quizzes:** 22,715 questions.
  - **Users:** only 4 profiles, 2 study items and 32 quiz attempts, so these are probably test accounts.
- The frontend never talks to Supabase directly; everything goes through `/api` on the backend.
- **Auth:** the backend validates Supabase JWTs in `app/core/security.py` and exposes `/api/v1/auth/{signup,signin,refresh,signout}`. `AuthPanel.tsx` calls those endpoints.
- **Wallet race:** the wallet update in quiz submit is read-modify-write without a transaction (`quiz_service.py:345`), so two submits at once can lose coins.
- **Rate limiter:** the AI rate limiter is in memory (`ai_service.py:315`), so it doesn't work across multiple Cloud Run instances.
- **AI calls:** the AI uses OpenAI (`gpt-5.4-nano`), one non-streaming JSON request per message, with regex heuristics to guess which passages to fetch.
- **Tests:** 27 tests in `tests/`, almost all for the AI service. No frontend tests.
- **Junk in git:** `tmp-eng-asv.zefania.xml` (5 MB) and `zip/bible-app-files.zip` are committed.

## Workstreams

Order: **W0 → (W1 ∥ W4) → W2 → W3 → W5.** W1 and W4 touch different files and can run in parallel. W3 needs W1, because the AI tools read the content file.

---

### W0: Safety net and cleanup

1. **Export everything from Supabase.** Restore the project first if it's paused. Dump every content table to `content/source/` as one JSONL file per table (translations split per translation), and commit those files. Dump the user tables to `data/export/` and gitignore it, because it contains personal data.
2. **Record "golden" API responses** for a fixed sample of about 40 requests: passages in each translation, a few searches (English and Chinese), commentary, cross-references, a chapter summary, entity pages, quiz fetch. Save them as JSON fixtures in `tests/golden/`. W1 must reproduce them exactly.
3. **Clean up git:** remove `tmp-eng-asv.zefania.xml`, `zip/` and `tmp/` from tracking, and add `__pycache__/`, `.pytest_cache/`, `build/` and `data/export/` to `.gitignore`.
4. **Frontend smoke tests (Playwright):** open John 3, change theme and font size, highlight a verse and add a note, search "love", open commentary, send an AI message (mocked), and take a chapter quiz (mocked). These protect W4.

**Done when:** the export row counts are written to `content/source/MANIFEST.json`, `pytest` passes, the Playwright smoke suite passes against the current app, and `npm run build` passes.

---

### W1: Content as a SQLite file

> **Changed during implementation (2026-10-30):**
> - **Source of truth:** `content/source/*.jsonl` (the W0 export) is the build input. The authored `commentary/`, `quiz-questions/` and `people/places` JSON stay as authoring inputs and get reconciled later.
> - **Quiz IDs:** the exported numeric IDs are already permanent, because content is no longer reloaded into a database. So no string IDs are needed and the quiz API is unchanged.
> - **Quiz question reads move to W2.** They sit in the same functions as quiz user-data writes, and no golden test covers them because they need sign-in.
> - **Search:** FTS5 `verses_fts_en` (porter) and `verses_fts_zh` (trigram) as external-content tables. Ranked by bm25, ties broken by book/chapter/verse. Chinese terms of 1–2 characters use substring match. Match sets are checked against Postgres's recorded full match sets (`tests/content/search_parity.json`, Jaccard ≥ 0.95).
> - **Intended golden changes:** the 7 `search_*` fixtures (rank floats and tie order), `entities_theme` (the old list was cut off at 1,000 rows by PostgREST), and `verse_missing` (500 becomes 404).
> - **No build timestamp** in `meta`, so builds are reproducible.

1. **Source layout.** `content/source/` holds the W0 exports plus the existing authored files, moved in: `commentary/*.json` (summaries), `quiz-questions/*.json`, `people/people.json`, `places/places.json`.
2. **Stable quiz IDs.** Give every question in `quiz-questions/*.json` a permanent `id` field such as `john-3-s2-04` (book slug, chapter, stage, index), written into the JSON once. Never regenerate it. Quiz submit and hint switch from integer IDs to these strings.
3. **Build script.** `scripts/build_content.py` turns `content/source/` into `build/content.sqlite`:
   - Tables mirror today's content schema (minus the generated `tsvector` columns).
   - FTS5 search tables: `verses_fts` (with the `unicode61` tokenizer for English translations and `trigram` for CUV/CUNP) and `commentaries_fts`.
   - Replaces `get_passage`, `search_bible`, `search_commentary` and the `quizzable_chapters_stage1` view with SQL in Python.
   - Writes a `meta` table with the build time, the source manifest hash, and row counts.
   - The build is deterministic: same inputs, same row counts and content hash.
4. **Read path.** `app/core/content_db.py` opens the file read-only (`file:...?mode=ro&immutable=1`) and gives each request its own connection or cursor. Services stay sync and run in FastAPI's threadpool, as they do now.
5. **Port the read services** to `content_db`: `bible_service`, `commentary_service`, the read half of `summary_entity_service`, and the question reads in `quiz_service`. The write half of `summary_entity_service` (backfilling mentions) becomes a build-time step inside `build_content.py`.
6. **Delete the ~60 quiz-seed SQL migrations** once W5 has cut over, together with the rest of `supabase/`.

**Done when:**
- All W0 golden responses match exactly, apart from quiz question IDs (now strings).
- Every table's row count matches `MANIFEST.json`.
- A Chinese search (e.g. 神爱世人) returns John 3:16 in CUV.
- The build takes under 2 minutes, and the file size is logged.
- None of the ported services import `supabase` anymore.

---

### W2: User data on Firestore, sign-in on Firebase Auth

1. **Data model:**
   - `users/{uid}`: profile fields, settings (today's `user_settings` columns), `walletBalance`
   - `users/{uid}/studyItems/{autoId}`: kind, translation, book, chapter, verseStart, verseEnd, color, note, timestamps
   - `users/{uid}/readingProgress/{translation}_{book}`
   - `users/{uid}/chapterProgress/{book}_{chapter}`: mastery fields
   - `users/{uid}/quizAttempts/{autoId}`
   - `users/{uid}/milestoneRewards/{milestoneKey}`
   - `rateLimits/{identity}_{minute}`: a counter with a TTL policy, deleted automatically
2. **Storage interface.** `app/core/user_store.py` is the one interface the services call, with a Firestore implementation and an in-memory fake for tests. Services never import Firestore directly.
3. **Quiz submit in one Firestore transaction:** attempt + chapter progress + wallet + milestone rewards together. This fixes the coin race.
4. **Auth:**
   - The frontend uses the Firebase JS SDK for Google and email sign-in, and sends the ID token as `Authorization: Bearer`.
   - `security.py` verifies the token with `firebase-admin`.
   - Remove `/api/v1/auth/*` and update `AuthPanel.tsx`.
   - Keep the dev-wallet behavior (`DEV_ACCOUNT_EMAIL`).
5. **Rate limiter** moves to the Firestore counter, so it works across instances.
6. **Existing users (only if there are real ones):** import Supabase auth users into Firebase Auth with `importUsers`, keeping their UIDs and bcrypt password hashes, then copy their rows from `data/export/`. If the only accounts are test accounts, skip this.
7. **Local dev** runs against the Firestore and Auth emulators, wired into `start.py`.

**Done when:**
- Every `/api/v1/me`, `study-items`, `reading-progress`, `user-settings`, `quiz/*` and `wallet` endpoint passes tests against the fake store and against the emulator.
- Two quiz submits at the same moment for the same user give the correct final balance.
- Google sign-in works end to end locally.
- Nothing imports `supabase` anywhere in `app/`.

---

### W3: AI on Claude Haiku 5.5

1. **Client.**
   - Replace `openai` with the `anthropic` SDK.
   - `AI_PROVIDER=anthropic|vertex` picks `AsyncAnthropic` (key `ANTHROPIC_API_KEY`, from Secret Manager in production) or `AsyncAnthropicVertex` (the Cloud Run service account, no key).
   - Model: `claude-haiku-5-5` on both.
   - Start on `anthropic` to spend the Console promo credits. Check when they expire.
2. **Tools** (read from `content_db`, return compact text):
   - `get_passage(ref, translation)`
   - `search_scripture(query, translation)`
   - `get_cross_references(ref)`
   - `get_commentary(ref)`
   - `get_chapter_summary(book, chapter)`
   - `lookup_entity(kind, name)`
   - App actions (`navigate`, `highlight`, `open_commentary`) become tools whose results go to the frontend instead of being guessed from JSON output.
3. **Streaming endpoint.** `POST /api/v1/ai/chat/stream` uses Server-Sent Events and streams text plus action events. `AiSidebar.tsx` renders tokens as they arrive. Keep the old endpoint until the UI has switched over.
4. **Context budget (hard rules):**
   - Under 100K input tokens per request, checked against `usage` on every response and enforced before sending.
   - History is trimmed to the last N turns.
   - Each tool result is capped at about 6K tokens.
   - At most 6 tool round-trips per question.
5. **Settings:**
   - Effort `low` for chat and `medium` for guided chapter study.
   - Prompt caching on the system prompt + tools.
   - Handle `stop_reason == "refusal"` with a gentle in-app message, since Haiku has no server-side fallback model.
   - Keep the personality tones and the `app/prompts/ai/*.md` prompt fragments.
6. **Port** guided chapter and entity content to the new client.
7. **Delete the regex heuristics** (`infer_*`, `collect_supplementary_references`, the passage-fetch planners) once the tools cover them. Rewrite `tests/test_ai_service.py` against the new tools.
8. **Eval set** of about 30 prompts in `tests/ai_eval/`:
   - verse explanations
   - cross-chapter questions
   - "what does the Bible say about X"
   - Chinese questions
   - teen-safety cases
   - roleplay attempts

   Automated check: every verse the model quotes must match the text in `content.sqlite`.

**Done when:**
- Streaming works in the sidebar, with the first token in under 2 s typical.
- Every response logs cost per question.
- The eval set passes with 100% verse fidelity.
- No request goes over 100K input tokens in the eval run.
- `openai` is removed from `requirements.txt` (the Gemini quiz-generation scripts are separate and can stay).

---

### W4: Break up the frontend

1. **Target layout** under `frontend-next/src/features/`: `reader/` (pagination, reading modes, verse rendering), `settings/` (themes, typography, accessibility), `study-items/` (highlights, bookmarks, notes), `progress/` (daily goal, streak, reading progress), `search/`, `commentary/`, `onboarding/` (tutorial), `ai/` (the current `AiSidebar.tsx`), `quiz/` (`ChapterQuiz`, mastery). Shared code goes in `src/lib/` (`api.ts`, `storage.ts`, the book catalog).
2. **State:** a small set of React contexts (or one Zustand store) for auth, reader position, and reader settings, instead of 80 `useState`s in one component.
3. **One feature per commit.** Run the W0 Playwright smoke suite after each extraction.

**Done when:**
- `BibleApp.tsx` is a composition shell under 400 lines.
- No file in `src/` is over 800 lines.
- The smoke suite passes.
- `npm run build` has no type errors.
- There are no visible behavior changes.

---

### W5: Deploy on GCP and switch off Supabase

1. **Infrastructure:** Artifact Registry, two Cloud Run services (min instances 0), Firestore native mode, Firebase Auth with Google enabled, Secret Manager for `ANTHROPIC_API_KEY`, and a **billing budget alert at $10/month**.
2. **`deploy.py`:** run `build_content.py` first, copy `build/content.sqlite` into the backend image, then build and deploy. `--dry-run` keeps working. `upload_env_to_cloud_run.py` switches to Secret Manager.
3. **Cutover:** run in parallel with Supabase for about 2 weeks, then delete the Supabase project, `supabase/` and `SUPABASE_*` settings.

**Done when:**
- The production deploy serves all smoke-test flows.
- A cold start finishes in under 5 s.
- The budget alert is active.
- Supabase is gone.

## Risks

| Risk | Mitigation |
|---|---|
| Content lost when the Supabase project is deleted | W0.1 export is committed and verified by row counts before anything else |
| Quiz IDs change and break a quiz in progress | Permanent string IDs stored in the JSON (W1.2) |
| Firestore costs climb with reads | Content reads never touch Firestore; budget alert at $10 |
| Splitting the frontend breaks subtle reader behavior | Smoke suite first, one feature per commit |
| AI quality drops on the small model | Eval set with a verse-fidelity check before switching the UI |
| Promo credits run out or expire | `AI_PROVIDER=vertex` switch already in place |

## Expected monthly cost (youth-group scale)

| Item | Estimate |
|---|---|
| Cloud Run (2 services, scale to zero) | ~$0–5 |
| Firestore + Firebase Auth | ~$0 (free tier) |
| Secret Manager, Artifact Registry | < $1 |
| Claude Haiku 5.5 | ~$0.003–0.01 per question; paid from Console credits at first |

## Open questions

1. Are there real users in Supabase today, or only test accounts? This decides whether W2.6 runs.
2. Which translations should ship? Today the picker hides KJV and BSB, and an ASV source file is lying around.
3. Should the app's 19 themes stay as they are? The rework's visual direction hasn't been decided, and this plan doesn't change it.
4. Will any users be under 13? If so, parental consent (COPPA) needs handling before launch.
