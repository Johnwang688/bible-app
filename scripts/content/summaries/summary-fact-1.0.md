# Chapter summaries: fact pass (spec summary-1.0, locked)

Working folder: `C:\dev\bible-app-work\commentary\summaries\`. You didn't write these summaries. Assume they contain mistakes and look for them. Your items are the files in `fact-SHARD/`. Write only into `review/`, one file per item. **Change nothing else.** No web, no API, and no script that decides a verdict: read each chapter yourself, one at a time.

## Task

For each file in `fact-SHARD/`, read the matching `inputs/<name>.json`. Its `verses` are the BSB text, the only authority. Its `key_word_candidates` list the key words and their notes. Check every claim in `title`, `summary` and each `key_points` item, and check that each key point's verses really say it.

Write `review/<name>.json`:
```json
{ "chapter": "romans-09", "flags": [ { "quote": "exact words from the summary", "verdict": "unsupported", "severity": "major", "why": "one plain sentence, citing the verse", "verse": 11 } ] }
```

`flags` is `[]` when you find nothing. Verdicts:
- `wrong`: contradicts the text (a wrong name, number, order, speaker).
- `unsupported`: not in this chapter: background, an added cause or motive, an outside fact, a cross-reference.
- `overreach`: settles something the text leaves open, or takes a side where Christians differ.
- `christ-read-in`: an Old Testament summary brings in Jesus or the New Testament.
- `vision-explained`: says what a vision or symbol stands for when the text doesn't, or matches it to later history.
- `softened`: a hard statement central to the chapter is left out or blunted (wrath, judgment, hardening, the deity of Christ, a sin the text names).
- `wrong-speaker`: blurs who says it: Jesus, the narrator, a crowd, the writer, an objector, the psalmist, a prophet, God, or one of Job's friends.
- `bad-ref`: a key point's verses don't support it.
- `key-word`: a key word is used in a sense the chapter doesn't give it, or an added explanation of it picks a side where Christians differ.

Severity:
- `critical`: the text contradicts it, or it confuses two people, or it changes who said or did something in a way that changes the meaning.
- `major`: unsupported, overreach, Christ read in, a vision explained, softened, or a bad reference.
- `minor`: a small imprecision.

Be exact and don't pad: a fair paraphrase isn't a flag, and neither is a matter of taste. A claim that needs an inference the text doesn't force is `unsupported`. Check each name and number against the verses.

Keep tool output short. Your context must stay under 217,000 tokens. If it won't, stop and list what you didn't finish.

## Acceptance

Every file in `fact-SHARD/` has a valid `review/<name>.json`. Final message: flags by verdict and by severity, and the three most serious.
