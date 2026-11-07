# Chapter summaries: full run (spec summary-1.0, locked)

Working folder: `C:\dev\bible-app-work\commentary\summaries\`. Your items are the files in `inputs-SHARD/`. Write only into `output/`, one file per item. You are the writer: read each chapter and write its summary yourself, by hand, one chapter at a time. **Do not write a script that generates text, and call no API.** Scripts to check your own files are fine.

## What this is
Bible app, read by teenagers and adults. The 1,189 chapter summaries are poor, and this run rewrites them. John passed a 40-chapter pilot, so `samples.json` shows the voice and length to match. A person may read any of these, and accuracy to the text matters more than anything else.

**Real biblical words stay.** The first pilot swapped them for simpler ones, such as "acceptance" for righteousness and "put right" for justified. John rejected that.

## Inputs
- `inputs-SHARD/<book>-<nn>.json`: the chapter in the Berean Standard Bible (BSB), plus `key_word_candidates`. In Psalms, a superscription is part of verse 1.
- `samples.json`: four passed summaries.

## Output: one file per chapter, `output/<book>-<nn>.json`, UTF-8, same base name as the input
```json
{
  "book": "Genesis", "book_number": 1, "chapter": 1,
  "title": "God Creates the Heavens and the Earth",
  "summary": "3 to 5 sentences.",
  "key_points": [ { "text": "One plain sentence.", "verse_start": 1, "verse_end": 2 } ],
  "key_words": [ { "slug": "covenant", "central": true } ],
  "generated_by": "gpt-6.1-sol via Codex, summaries full run, 2026-11-06",
  "spec_version": "summary-1.0"
}
```
- `title`: at most 8 words, a real title in title case, not a keyword list. It should tell someone what happens or what the chapter says.
- `summary`: 3–5 sentences, 40–140 words.
- `key_points`: 3–5, each one sentence of 4–30 words, each tied to the verse or verses that support it. `verse_end` is `null` for one verse. Spread them across the chapter where the chapter allows.
- `key_words`: one row for every word in `key_word_candidates`, and no others. `central` is true if the word matters to this chapter, false if it's only used in passing or in an everyday sense. A candidate with `floor: true` is always central.
- No people, places or theme tags. They come in a later pass.
- A chapter of six verses or fewer may have 2 sentences, 25 words and 2 key points.

## Style
- Plain English for a 13-year-old who hasn't read the Bible much. Short sentences. Everyday words, except for key words.
- **Key words stay.** Every central candidate with `keep_rule: always` appears in the title, summary or a key point, in one of its `forms`. Use a central word the way the chapter uses it. Never swap in a word from its `avoid` list. Other central words stay where they matter to the chapter. Where a reader needs help, explain a key word once in a few plain words, drawing on its `gloss`, such as "justified, put in right standing with God". Don't explain every key word, and don't list them.
- A key word's gloss doesn't settle what the passage means. Follow its `note`, and use the word in the chapter's own sense.
- Say what happens or what is said. Don't preach, don't apply it to the reader, no "we should", no "this reminds us". No "this chapter tells" or "in this chapter". Vary how summaries open: don't start most of them the same way.
- Modern English only: no "unto", "saith", "thee", "hath", "behold", "begat". If you quote, quote the BSB, briefly: **never more than 12 words in a row from any translation**, and that goes for paraphrases that track a verse word for word as well. Summarise in your own words.
- Capitalise He, Him, His for God, as the BSB does.
- Psalms: say who speaks and what they're going through, the turn in the psalm if it has one, and how it ends, in that psalm's own terms. Each psalm gets its own shape.
- Letters: follow the writer's actual argument step by step and say how the chapter moves, not just its topics.
- Law and instructions: say what is commanded, for whom and why the text gives, without listing every detail.
- Genealogies and lists: say whose line or what list it is, and name the people the text marks out. Don't pad.
- Prophecy and visions: say who speaks, to whom, and what is said or seen, in the text's own images. Don't say what a vision stands for unless the text does, and don't match it to later history.
- Poetry and wisdom: follow the speaker and the turn of thought. In Job, keep each speaker's view apart, and don't present a friend's claim as the book's verdict. In Song of Solomon, report the lovers' words as they are, in words fit for a teen, with no allegory.
- Violence and sexual sin: state what happened calmly and plainly, in words fit for a teen. Don't leave out what's central, and don't dwell on it.

## Accuracy rules (the point of the exercise)
1. **Everything must be in the chapter.** Every claim has to be supported by this chapter's text. No background from outside it: no dates, authors, geography, customs or Hebrew and Greek word meanings that the chapter doesn't give. No cross-references to other books. A neighbouring chapter's plot can't be assumed either, except what's needed to say who someone is.
2. **Don't add what the text leaves open.** Who the "sons of God" in Genesis 6 are; how Noah's words on Canaan work; what kind of days Genesis 1 means; what "predestined" means in Romans 8; what "all Israel" means in Romans 11 isn't in the pilot but you get the idea. Say what the text says and stop. Where Christians differ, don't pick a side and don't explain the debate.
3. **Don't read Christ into the Old Testament summaries.** Every Old Testament chapter is summarised on its own terms: Psalm 2 speaks of the LORD's Anointed and His Son, so say that, in those words, without saying "Jesus". Genesis 3:15 is what it says.
4. **But don't flatten the New Testament either.** When a New Testament writer calls Jesus the Word, God, the Son, the Lamb, or says He is the way to life, report that plainly as the text does. John 1 says the Word was God: say so. Don't soften hard statements: judgment, wrath, sin, God hardening Pharaoh, Paul on same-sex acts in Romans 1. State them calmly, in words fit for a teen, without added commentary, and leave nothing out because it's uncomfortable if it's central to the chapter.
5. Keep who said what straight. In the Gospels, keep Jesus's words apart from what the narrator says and what the crowds think. In the letters, keep the writer's own view apart from an objection he raises to answer. In Psalms, "I" is the psalmist. In the prophets, keep the prophet's words apart from what the LORD says. In Genesis 3, say "serpent", not "Satan", because the chapter doesn't say Satan.
6. Don't invent numbers, names or sequence. Check each name, number and order of events against the verses before you finish a chapter.

7. Using a word such as "predestined" or "justified" reports the text. Don't add an explanation that picks a side where Christians differ.

Text-critical note: report what's in your input, with no comment on manuscripts. A verse missing from the input isn't an error.

## Acceptance
When your items are done, run these two:
`python C:\dev\bible-app-work\commentary\summaries\tools\check_summaries.py C:\dev\bible-app-wt\integration C:\dev\bible-app-work\commentary\summaries --inputs inputs-SHARD --report reports\SHARD.json`
`python C:\dev\bible-app-work\commentary\summaries\tools\check_key_words.py C:\dev\bible-app-work\commentary\summaries\inputs-SHARD C:\dev\bible-app-work\commentary\summaries\output`
Fix every ERROR by rewriting. Don't edit a checker. Read the warnings and fix what's a real problem. Don't touch `tools/` or any input. Keep tool output short. Your context must stay under 217,000 tokens. If it won't, stop and say which items you didn't finish.

Final message: both checkers' summary lines, and the chapters where you were least sure and why.

## Out of scope
Other agents' chapters. The repo. `commentary/*.json`. The pilot folders. Any web access.
