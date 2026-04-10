"""
Generate supabase/016_quiz_john_from_json.sql from quiz-questions/john.json.
Idempotent: each row uses INSERT ... SELECT ... WHERE NOT EXISTS on
(book_number, chapter, difficulty_stage, prompt).
Run from repo root: python scripts/generate_john_quiz_migration.py
"""
from __future__ import annotations

import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
JSON_PATH = ROOT / "quiz-questions" / "john.json"
OUT_PATH = ROOT / "supabase" / "016_quiz_john_from_json.sql"


def esc(s: str) -> str:
    return s.replace("'", "''")


def main() -> None:
    rows = json.loads(JSON_PATH.read_text(encoding="utf-8"))
    lines: list[str] = [
        "-- ============================================================================",
        "-- LOGOS LIGHT — John (book 43) quiz questions from quiz-questions/john.json",
        "-- ============================================================================",
        "-- Idempotent: skips rows that already match (book_number, chapter, difficulty_stage, prompt).",
        "-- Safe to run after 014 (which seeds the same MVP John set from SQL).",
        "-- ============================================================================",
        "",
    ]
    for r in rows:
        bn = int(r["book_number"])
        ch = int(r["chapter"])
        st = int(r["difficulty_stage"])
        prompt = esc(str(r["prompt"]))
        choices = json.dumps(r["choices_json"], ensure_ascii=False)
        choices_sql = esc(choices)
        ans = esc(str(r["correct_answer"]))
        expl = r.get("explanation")
        expl_sql = "NULL" if expl is None else f"'{esc(str(expl))}'"
        lines.append(
            "INSERT INTO quiz_question_bank "
            "(book_number, chapter, difficulty_stage, prompt, choices_json, correct_answer, explanation)\n"
            f"SELECT {bn}, {ch}, {st}, '{prompt}', '{choices_sql}'::jsonb, '{ans}', {expl_sql}\n"
            "WHERE NOT EXISTS (\n"
            "  SELECT 1 FROM quiz_question_bank q\n"
            f"  WHERE q.book_number = {bn}\n"
            f"    AND q.chapter = {ch}\n"
            f"    AND q.difficulty_stage = {st}\n"
            f"    AND q.prompt = '{prompt}'\n"
            ");"
        )
        lines.append("")
    OUT_PATH.write_text("\n".join(lines), encoding="utf-8")
    print(f"Wrote {OUT_PATH} ({len(rows)} statements)")


if __name__ == "__main__":
    main()
