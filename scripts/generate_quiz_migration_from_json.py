"""
Generate a quiz_question_bank migration SQL file from a quiz-questions/*.json array.

Each row becomes one idempotent INSERT ... SELECT ... WHERE NOT EXISTS.

Usage (repo root):
  python scripts/generate_quiz_migration_from_json.py quiz-questions/exodus.json supabase/migrations/20250411000025_024_quiz_exodus_from_json.sql "Exodus"
"""
from __future__ import annotations

import json
import sys
from pathlib import Path


def esc(s: str) -> str:
    return s.replace("'", "''")


def main() -> None:
    if len(sys.argv) < 4:
        print(
            "Usage: python scripts/generate_quiz_migration_from_json.py "
            "<quiz-questions/foo.json> <supabase/migrations/out.sql> <Book Title>",
            file=sys.stderr,
        )
        sys.exit(1)
    json_rel = Path(sys.argv[1])
    out_rel = Path(sys.argv[2])
    book_title = sys.argv[3]

    root = Path(__file__).resolve().parents[1]
    json_path = root / json_rel
    out_path = root / out_rel

    rows = json.loads(json_path.read_text(encoding="utf-8"))
    if not rows:
        print("No rows in JSON", file=sys.stderr)
        sys.exit(1)
    book_number = int(rows[0]["book_number"])

    lines: list[str] = [
        "-- ============================================================================",
        f"-- LOGOS LIGHT — {book_title} (book {book_number}) quiz questions from {json_rel.as_posix()}",
        "-- ============================================================================",
        "-- Idempotent: skips rows that already match (book_number, chapter, difficulty_stage, prompt).",
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

    out_path.write_text("\n".join(lines), encoding="utf-8")
    print(f"Wrote {out_path} ({len(rows)} statements)")


if __name__ == "__main__":
    main()
