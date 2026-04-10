"""
Ensure the correct answer is not always the longest option: for any question where
every wrong choice is shorter than or equal to the correct answer, extend only the
shortest wrong choice until it is longer than the correct answer.

Run from repo root: python scripts/balance_john_quiz_lengths.py
"""
from __future__ import annotations

import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
PATH = ROOT / "quiz-questions" / "john.json"

# Single extension (rotated if multiple passes are needed) — avoids “longest = correct” bias
# without stacking several different meta-phrases on one option.
PADS = (
    " (a common guess, but not what John says here)",
    " (does not match John’s wording in this verse)",
)
OLD_PAD_SUFFIXES = (
    " — not what this passage indicates.",
    " — a reading John does not offer here.",
    " — not supported by the verses in view.",
    " — contrary to John's wording in context.",
)


def strip_old_padding(s: str) -> str:
    t = s
    changed = True
    while changed:
        changed = False
        for p in OLD_PAD_SUFFIXES:
            if t.endswith(p):
                t = t[: -len(p)]
                changed = True
                break
    return t


def needs_fix(choices: list[str], correct: str) -> bool:
    wrong = [c for c in choices if c != correct]
    if not wrong:
        return False
    return max(len(w) for w in wrong) <= len(correct)


def fix_question(choices: list[str], correct: str) -> list[str]:
    ch = list(choices)
    wrong = [c for c in ch if c != correct]
    shortest = min(wrong, key=len)
    i = ch.index(shortest)
    p = 0
    new_val = ch[i]
    while len(new_val) <= len(correct):
        new_val = new_val + PADS[p % len(PADS)]
        p += 1
    ch[i] = new_val
    return ch


def main() -> None:
    data = json.loads(PATH.read_text(encoding="utf-8"))
    for q in data:
        q["choices_json"] = [strip_old_padding(c) for c in q["choices_json"]]

    n = 0
    for q in data:
        ch = q["choices_json"]
        ca = q["correct_answer"]
        if ca not in ch:
            raise SystemExit(f"correct_answer not in choices_json: {ca!r} / {q.get('prompt', '')[:50]}")
        if needs_fix(ch, ca):
            q["choices_json"] = fix_question(ch, ca)
            n += 1

    PATH.write_text(json.dumps(data, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(f"Updated {PATH}: fixed {n} questions")

    # Stats
    sole_longest = 0
    for q in data:
        ch, ca = q["choices_json"], q["correct_answer"]
        maxl = max(len(x) for x in ch)
        longest = [x for x in ch if len(x) == maxl]
        if len(longest) == 1 and longest[0] == ca:
            sole_longest += 1
    print(f"Questions where correct is sole longest: {sole_longest} / {len(data)}")


if __name__ == "__main__":
    main()
