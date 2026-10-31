# Commentary plan

Scoped 2026-10-31. This is the second track in John's order: Hebrew and Greek (done), then commentary, then UI and performance.

## What's there now (measured 2026-10-31)
- **Sources:** three are listed in `commentary_sources`.
  - Matthew Henry's Concise Commentary
  - "Summary" (chapter summaries)
  - Treasury of Scripture Knowledge (TSK)
- **Matthew Henry:** 3,364 entries covering 868 of 1,189 chapters.
  - **10 books are missing:** Ecclesiastes, Song of Solomon, Isaiah, Jeremiah, Lamentations, Ezekiel, Daniel, Hosea, Joel, Jude.
  - **14 books are partial.** For example, 1 Chronicles has 11 of 29 chapters, 2 Chronicles 14 of 36, and Psalms 117 of 150.
  - The original import came from the CCEL ThML edition, which covers the whole Bible, so the importer lost the rest.
- **Summaries:** 1,189 chapter summaries are the default commentary tab. They are served exactly as authored in `commentary/*.json`, and most are poor.
  - 143 are pasted King James verse text, not summaries. Most are in Genesis to Deuteronomy, though they are labelled `WEB`.
  - Titles are keyword lists ("put ward house captain guard prison").
  - Psalms follow a template ("It pictures his care through the line that…"), and New Testament letters are telegraphic.
  - 800 entries list non-people under "key people" ("land", "man", "clean").
  - Like the quiz bank, they were bulk-generated without QA.
- **Cross-references:** `cross_references` has 0 rows. TSK is listed as a source but was never loaded. There is no API endpoint and no UI.
- **People, places and themes pages:** these are derived from the summaries' tags.
  - Of the 4,071 entities, 991 are "people", including "heavens", "ark" and "covenant". The 2,989 themes are fragmented ("God at work", "Land promise"). The 91 places are close to fine.
  - The curated `people/people.json` (284, with written overviews) and `places/places.json` (89) are not what the pages use.

## Decisions (John, 2026-10-31)
1. **Rewrite every chapter summary with Claude.**
   - All 1,189 are regenerated at build time, in plain English for teens, grounded in the BSB chapter text.
   - Automated checks run first, then John spot-checks a sample before anything ships.
   - Each one is labelled as AI-written in the app.
2. **Fill in Matthew Henry, and add a second classic commentary:** a public-domain, verse-by-verse source. The default candidate is Jamieson-Fausset-Brown (1871).
3. **Cross-references: the Treasury of Scripture Knowledge** (public domain).
4. **Entity pages are rebuilt from the curated lists:** the 284 people, the 89 places, and a short curated theme list (about 60, for John to approve). Each chapter is relinked to them, and the junk entries go away.

## Phases

### CM-1: classic content (content build only)
- **Pin each source** with a URL, a sha256 checksum, a version and a licence, in `content/source/MANIFEST.json`, the same way HG-1 pinned BSB and STEP:
  - **Matthew Henry Concise:** CCEL ThML.
  - **The second classic:** JFB. Confirm its public-domain status and a clean edition (CCEL ThML or a SWORD module) before importing.
  - **TSK:** a public-domain edition with verse-level references.
- **Re-import Matthew Henry** so it covers all 66 books. The build enforces counts per book, so a gap fails the build, which would have caught the missing 10 books.
- **Import the second classic** as a new `commentary_sources` row, with verse ranges like Matthew Henry.
- **Load TSK into `cross_references`:** (from verse) → (to verse or range), in TSK's own order, which is unranked.
- **Acceptance:**
  - every book has entries from both classics
  - the cross-reference count matches the source
  - spot checks (Isaiah 53, Daniel 9, John 3:16) agree with the printed editions
  - the build is reproducible from the pinned files.

### CM-2: API and UI for the classics and cross-references
- **Commentary:** `GET /api/v1/commentary` serves the new source. The commentary panel shows it as a tab next to Matthew Henry.
- **Cross-references:** add `GET /api/v1/cross-references/{book}/{chapter}/{verse}`. The verse popup gets a "Cross-references" entry beside Original words. It lists each reference with its verse text in the reader's translation, and tapping one navigates there.
- **Credits:** Settings → Sources credits the new classic and TSK.
- **Styling:** design tokens only, like HG-3a.

### CM-3: curated entities
- **The theme list:** John approves a curated list of about 60 themes (the orchestrator drafts it).
- **The pages:** people and places come from `people/people.json` and `places/places.json`, with their overviews.
- **Mentions:** `commentary_entity_mentions` is rebuilt from the new summaries (CM-4), not from the old tags. People, places and themes can only come from the curated lists.
- **Acceptance:** no entity outside the curated lists, and every list page and entity page resolves.

### CM-4: summary rewrite (build-time generation)
- **The script:** `scripts/generate_summaries.py` calls Claude through the Message Batches API (half price, no latency need). Its input is each chapter's BSB text plus the curated people, places and themes lists. Its output is structured, per chapter:
  - a title of at most 8 words
  - a 3–5 sentence plain-English summary
  - 3–5 key points, each with a verse reference
  - people, places and themes, each from the curated lists only.
- **Model:** Sonnet 5.5 by default.
  - **Cost:** about 3M input and 0.6M output tokens, so about $6 with the batch discount, or about $12 without. Re-check the prices with the claude-api skill before running.
  - **Pilot first:** a 40-chapter pilot (Genesis 1–10, Psalms 1–10, John 1–10, Romans 1–10) for John to compare against Opus before the full run.
- **Automated checks** before anything is accepted:
  - no archaic stitching ("unto", "saith", …) and no verbatim runs of more than 12 words from any translation
  - every verse reference exists and falls inside the chapter
  - entities come only from the curated lists
  - length bounds hold
  - a second model pass flags claims not supported by the chapter text.
- **Output:** the results are checked into `commentary/*.json` as reviewed source with a `generated_by` field, and the build reads them. The app labels the summary tab "AI-written summary".
- **John's review:** a 30-chapter random sample (plus any the checks flag) before the full set ships.
- **Not a dependency of the agent rework (W3).** This is offline content generation, and `AI_PROVIDER` is unchanged.

## Order and dependencies
- **CM-1 and CM-3:** they can run in parallel. CM-1 is content build work; CM-3 starts with the theme list John approves.
- **CM-2:** needs CM-1.
- **CM-4:** needs CM-3's lists, plus John's verdict on the pilot.

## Open
- **The second classic:** JFB is the default, confirmed in CM-1 (public domain, a clean source). Barnes' Notes is the fallback.
- **Chinese:** none of the new content has Chinese. Summaries stay English for now, matching the HG decision on glosses.
