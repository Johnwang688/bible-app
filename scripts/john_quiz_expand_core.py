"""
Build complete john.json: fill ch.1–3 gaps to 10/stage, add ch.4–21 (10/stage).
Length policy: ~75% of questions get padding on a wrong answer so the longest
choice is usually incorrect; ~25% skip that padding so the correct answer may
be the longest (natural variance).

Run from repo root: python scripts/john_quiz_expand_core.py
"""
from __future__ import annotations

import json
import random
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / "quiz-questions" / "john.json"
SCRIPTS = Path(__file__).resolve().parent
if str(SCRIPTS) not in sys.path:
    sys.path.insert(0, str(SCRIPTS))

PADS = (
    " (a common guess, but not what John says here)",
    " (does not match John’s wording in this verse)",
)


def strip_padding(s: str) -> str:
    t = s
    for p in PADS:
        while t.endswith(p):
            t = t[: -len(p)]
    return t


def needs_longest_wrong_fix(choices: list[str], correct: str) -> bool:
    wrong = [c for c in choices if c != correct]
    if not wrong:
        return False
    return max(len(w) for w in wrong) <= len(correct)


def pad_shortest_wrong_past_correct(choices: list[str], correct: str) -> list[str]:
    ch = list(choices)
    wrong = [c for c in ch if c != correct]
    shortest = min(wrong, key=len)
    i = ch.index(shortest)
    new_val = ch[i]
    p = 0
    while len(new_val) <= len(correct):
        new_val = new_val + PADS[p % len(PADS)]
        p += 1
    ch[i] = new_val
    return ch


def spec_to_question(
    chapter: int,
    stage: int,
    prompt: str,
    correct: str,
    wrongs: tuple[str, str, str],
    explanation: str,
    rng: random.Random,
    allow_correct_as_longest: bool,
) -> dict:
    correct = strip_padding(correct)
    wrongs_t = tuple(strip_padding(w) for w in wrongs)
    pool = [correct] + list(wrongs_t)
    rng.shuffle(pool)
    choices = pool
    if not allow_correct_as_longest and needs_longest_wrong_fix(choices, correct):
        choices = pad_shortest_wrong_past_correct(choices, correct)
    return {
        "book_number": 43,
        "chapter": chapter,
        "difficulty_stage": stage,
        "prompt": prompt,
        "choices_json": choices,
        "correct_answer": correct,
        "explanation": explanation,
    }


def sole_longest_is_correct(choices: list[str], correct: str) -> bool:
    maxl = max(len(x) for x in choices)
    longest = [x for x in choices if len(x) == maxl]
    return len(longest) == 1 and longest[0] == correct


def main() -> None:
    rng = random.Random(43)
    import john_quiz_expansion_specs as specs  # noqa: E402

    existing = json.loads(OUT.read_text(encoding="utf-8"))
    new_rows: list[dict] = []

    for item in specs.GAP_FILL:
        allow = rng.random() < 0.25
        new_rows.append(
            spec_to_question(
                item["chapter"],
                item["stage"],
                item["prompt"],
                item["correct"],
                item["wrongs"],
                item["explanation"],
                rng,
                allow,
            )
        )

    for item in specs.CHAPTERS_4_21:
        allow = rng.random() < 0.25
        new_rows.append(
            spec_to_question(
                item["chapter"],
                item["stage"],
                item["prompt"],
                item["correct"],
                item["wrongs"],
                item["explanation"],
                rng,
                allow,
            )
        )

    merged = existing + new_rows
    seen: set[tuple[int, int, int, str]] = set()
    deduped: list[dict] = []
    for q in sorted(merged, key=lambda x: (x["chapter"], x["difficulty_stage"], x["prompt"])):
        key = (int(q["book_number"]), int(q["chapter"]), int(q["difficulty_stage"]), str(q["prompt"]))
        if key in seen:
            continue
        seen.add(key)
        deduped.append(q)

    OUT.write_text(json.dumps(deduped, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    sole = sum(1 for q in deduped if sole_longest_is_correct(q["choices_json"], q["correct_answer"]))
    print(f"Wrote {OUT} ({len(deduped)} questions, +{len(new_rows)} new rows processed, duplicates skipped)")
    print(f"Sole-longest is correct: {sole} / {len(deduped)} ({100 * sole / len(deduped):.1f}%)")


if __name__ == "__main__":
    main()
