# Hebrew and Greek: scoping (2026-10-30)

## The problem
Students reading in English can't see what the original text says. Teachers often explain a verse through one Hebrew or Greek word (*agapē* versus *phileō*, *ruach* as both "spirit" and "wind", *hesed*). Today the app has no word-level original-language data at all. WEB, ASV and CUV are stored as plain verse strings, with no Strong's numbers or alignment.

**Goal:** from any verse, a student can see which Hebrew or Greek word sits under each English phrase, and tap one to learn what it means, how it's said, and where else it appears. It should be quick, readable for teenagers, and need no prior knowledge.

## Data (checked 2026-10-30)

| Source | What it gives | Licence | Size |
|---|---|---|---|
| **Berean Standard Bible text** (`bsb.txt`, USFM) | A modern, readable English translation | Public domain since 2023-04-30; "licensing is not required for any use" | 4 MB |
| **BSB translation tables** (`bsb_tables.tsv`) | A **reverse interlinear**. Every English phrase of the BSB, in English order, is aligned to its Hebrew or Greek word, with Strong's number, transliteration and parsing (code and plain English). Covers both testaments. | Published for free download and sharing; the text is public domain. The tables have no separate licence file, so we confirm and credit. | 85 MB TSV (mostly HTML columns we drop) |
| **STEPBible TBESH / TBESG** | Brief Hebrew lexicon (abridged BDB) and brief Greek lexicon, keyed by extended Strong's | CC BY 4.0. Credit "STEP Bible", with a link. | 3 MB + 5 MB |
| STEPBible TAHOT / TAGNT | Original-order interlinear: word, transliteration, English gloss in context, Strong's, grammar, variants | CC BY 4.0 | about 40 MB |
| Strong's dictionaries | Classic short definitions | Public domain | small |

**Not usable for word taps:**
- **WEB:** no free Strong's-tagged edition. The tagged one is sold.
- **ESV:** STEPBible's ESV tagging exists, but the ESV text is copyrighted.
- **KJV with Strong's:** exists (CrossWire KJV2006), but KJV English is hard for teenagers, and its distribution licence is less clear.
- **CUV:** no free word alignment found.

**Recommendation:**
- BSB tables for the alignment
- STEPBible's brief lexicons for definitions
- the BSB text itself as a reading translation. This also fills the existing gap where BSB is listed but has no text.

Everything is public domain or CC BY, with one credits line on the about page. TAHOT/TAGNT add little once we have the BSB tables. Keep them in reserve for a full original-order interlinear later.

## Options for the first release

| | A. Verse tool, recommended | B. Tap any word | C. Interlinear reading mode |
|---|---|---|---|
| How it works | Select a verse, the existing verse popup shows **Original words**, and a panel lists each English phrase next to its Hebrew/Greek word and gloss. Tap a word for its card. | In the BSB, every English word is tappable and opens its card. | A reading mode with the original words under each line. |
| Works in WEB / CUV reading | Yes. The panel always shows the BSB alignment for that verse, labelled BSB. | No, BSB only | Any translation, but it's dense |
| Conflict with existing taps | None | Tapping a verse already selects it, so word taps would compete with that | None |
| Effort | Small: one panel, one endpoint | Medium: word spans in the reader in four layouts, plus tap handling | Large: new layout in four reading modes |

**The word card:**
- the original word (Hebrew right-to-left) and its transliteration
- the dictionary form and a short definition
- the grammar in plain words, for example "verb, completed action", with the full parsing behind a "more" tap
- how many times the word appears, with a link to search those verses

It reuses the side-panel styling. Audio pronunciation is out of scope.

## Build plan (for option A)
1. **Content build:**
   - Extend `scripts/build_content.py` to load BSB verses into `verses` (translation `BSB`).
   - Add two new tables: `word_alignment`, one row per BSB word (verse id, BSB order, English text, original word, transliteration, Strong's, parsing code and text), and `lexicon` (Strong's id, lemma, transliteration, short gloss, definition).
   - Pin the sources in `content/source/` with sha256 hashes, as for the other sources.
   - The database grows by an estimated 30-45 MB, which is acceptable for the Cloud Run image. A separate `words.sqlite` is the fallback if image size becomes a problem.
2. **API:**
   - `GET /api/v1/words/{book}/{chapter}/{verse}` returns the aligned words for one verse.
   - `GET /api/v1/lexicon/{strongs}` returns a card, including the occurrence count.
   - Add golden tests for both.
3. **Frontend:** the Original words button in the verse popup, a words panel (a new side-panel mode) and the word card. e2e tests go through the existing HAR and mocks.
4. **Later:** a search-by-Strong's link ("every verse with this word"), option B for BSB readers, and option C. The future agent gets a `lookup_word` tool over the same tables.

**Risks:**
- Versification: the BSB uses English numbering like WEB. Check the Psalm titles and Malachi 4 / Joel 3 against our verse ids.
- The tables have no explicit licence. Credit the source, and keep the build reproducible from the pinned file.
- Chinese: the labels need translating, and glosses stay English for now.

## Decisions (John, 2026-10-30)
1. **Entry point: A.** An Original words button in the verse popup opens the words panel. B and C come later.
2. **Data: BSB tables plus STEPBible brief lexicons**, credited on the about page.
3. **Add the BSB text and make it the default translation.**
   - New readers start in BSB.
   - Readers with a saved position keep their translation.
   - The `'WEB'` fallbacks in the frontend (the reader-position default, `translationRef`, the init fallback) and the backend defaults have to move together.
   - The e2e HAR and mocks need BSB recordings.
4. **Grammar: plain English first**, with the full parsing behind a "more" tap.
