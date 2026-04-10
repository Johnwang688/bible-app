# Quiz bank generation prompt (copy everything below the line into your LLM)

---

You are generating a multiple-choice quiz bank for the biblical book **<book-name>** for use in a Bible app. Output **only** valid JSON: a single array of question objects, with **no** markdown fences, commentary, or text before or after the array.

## Scope

- Cover **every chapter** of **<book-name>** 
- For **each chapter**, include **5 difficulty stages** (numbered `1` through `5`).
- For **each (chapter, difficulty_stage)** pair, include **at least 7** questions and **preferably 10** questions (aim for 10 unless the chapter is extremely short).

## Difficulty stages (guidance)

- **Stage 1:** Straight recall: names, places, sequence, short phrases, obvious facts from the text.
- **Stage 2:** Slightly deeper: connections within the chapter, dialogue, who said what, simple “why” or “what happened next.”
- **Stage 3:** Interpretation: themes, meaning of images or statements in context, reasonable inferences grounded in the passage.
- **Stage 4:** Synthesis across the chapter or with immediate context: parallels, narrative purpose, how a detail fits the larger argument or story.
- **Stage 5:** Advanced: intertextuality, theological or narrative significance, careful handling of wording, where appropriate (still anchored in **<book-name>**, not generic trivia).

## JSON shape (every object must match)

Each element must be an object with exactly these keys:

- `book_number` — integer. Use the correct **WEB / API** book number for **<book-name>** (replace when you know it; e.g. John = 43).
- `chapter` — integer (1-based chapter in **<book-name>**).
- `difficulty_stage` — integer from **1** to **5**.
- `prompt` — string. Clear question; cite **<book-name>** or chapter/verse when it helps (e.g. “According to <book-name> 3, …”).
- `choices_json` — array of **exactly four** strings (the four answer options).
- `correct_answer` — string. Must be **identical** to one of the four strings in `choices_json`.
- `explanation` — string. Short justification with verse reference(s) in **<book-name>** (e.g. “(<book-name> 3:16)” or chapter:verse style).

## example JSON output (john 2):
{
    "book_number": 43,
    "chapter": 2,
    "difficulty_stage": 3,
    "prompt": "What does the master of the feast not knowing where the wine came from illustrate?",
    "choices_json": [
      "Disciples were ignorant",
      "The master was dishonest",
      "Jesus' work can be unrecognized by authorities while disciples know the source",
      "Wine is irrelevant"
    ],
    "correct_answer": "Jesus' work can be unrecognized by authorities while disciples know the source",
    "explanation": "The servants knew; the master did not — selective knowledge in the story (John 2:9)."
},

## Distractors (wrong answers)

- **Do not** put meta-hints in `choices_json` strings—no parentheticals like “common guess,” “not what this book says,” “does not match wording in this verse,” or anything else that signals an option is wrong. Wrong answers should read like normal answer text; use the `explanation` for justification.
- Wrong options must be **plausible** but **incorrect according to this book’s text**.
- Match the **type** of the question: if the question is about **who** spoke or acted, distractors should be **people** (or groups), not random place names unless the question is about places. If the question is **where**, use places, not unrelated people. If **what was said**, use alternative phrasings or common confusions, not irrelevant categories.
- Vary the **length** of all four options: do **not** make the correct answer obviously longer or more detailed than the others every time.
- Avoid absurd or joke answers unless the app explicitly asks for humor.

## Length / “longest answer” bias

Test-takers often guess the longest option. **Balance the bank:**

- For roughly **three quarters** of all questions, design or order choices so that **a wrong option** could be the longest, or so that length does **not** point to the correct answer (e.g. correct answer sometimes the shortest or middle length).
- For roughly **one quarter** of questions, it is fine if the **correct** answer is the longest, but **do not** let “always pick the longest” work across the whole bank.

(If you post-process with a script that pads distractors, that is OK; still author with this balance in mind.)

## Quality

- Ground every question in **<book-name>**; do not invent events or verses that are not there.
- Prefer wording that matches a common English translation (e.g. WEB) where it matters for exact phrases; if unsure, phrase questions so minor translation differences do not break the item.
- **Do not** duplicate the same `prompt` twice in the output.

## Output

Return **one** JSON array containing **all** questions for **<book-name>**, sorted by `chapter`, then `difficulty_stage`, then `prompt` (string sort).

Replace `<book-name>` with the real book title (e.g. “John”, “Romans”) before running. Replace `book_number` with the correct integer for your app’s book table.
