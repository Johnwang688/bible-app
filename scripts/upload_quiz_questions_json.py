"""
Upload quiz question JSON into Supabase `quiz_question_bank`.

Replaces existing rows for each (book_number, chapter) pair that appears in the file,
then inserts the JSON rows so the database matches the file for those chapters.

Requires in .env (same as other loaders):
  SUPABASE_URL
  SUPABASE_SERVICE_ROLE_KEY

Examples:
  python scripts/upload_quiz_questions_json.py --dry-run
  python scripts/upload_quiz_questions_json.py --json quiz-questions/john.json
  python scripts/upload_quiz_questions_json.py --json quiz-questions/mark.json --batch-size 80

Optional:
  --whole-book   For each book_number present in the JSON, delete ALL quiz rows for that
                 book before inserting. Use only when this file is the full bank for that book.
"""

from __future__ import annotations

import argparse
import json
import os
import sys
from collections import defaultdict
from pathlib import Path

from dotenv import load_dotenv
from supabase import create_client

ROOT = Path(__file__).resolve().parents[1]
load_dotenv(ROOT / ".env")

REQUIRED_KEYS = frozenset(
    {"book_number", "chapter", "difficulty_stage", "prompt", "choices_json", "correct_answer"}
)


def parse_args() -> argparse.Namespace:
    p = argparse.ArgumentParser(description="Upload quiz JSON to quiz_question_bank.")
    p.add_argument(
        "--json",
        type=Path,
        default=ROOT / "quiz-questions" / "john.json",
        help="Path to JSON array of question objects.",
    )
    p.add_argument("--batch-size", type=int, default=100, help="Rows per insert batch.")
    p.add_argument(
        "--dry-run",
        action="store_true",
        help="Validate JSON and print plan; do not call Supabase.",
    )
    p.add_argument(
        "--whole-book",
        action="store_true",
        help="Delete all quiz_question_bank rows for each book_number in the file, then insert.",
    )
    return p.parse_args()


def create_admin_client():
    url = os.environ.get("SUPABASE_URL", "").strip()
    key = os.environ.get("SUPABASE_SERVICE_ROLE_KEY", "").strip()
    if not url or not key:
        raise RuntimeError("SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY must be set in .env")
    return create_client(url, key)


def validate_row(obj: dict, index: int) -> dict[str, object]:
    missing = REQUIRED_KEYS - set(obj.keys())
    if missing:
        raise ValueError(f"Row {index}: missing keys {sorted(missing)}")
    bn = int(obj["book_number"])
    ch = int(obj["chapter"])
    st = int(obj["difficulty_stage"])
    if st < 1 or st > 5:
        raise ValueError(f"Row {index}: difficulty_stage must be 1–5, got {st}")
    prompt = str(obj["prompt"]).strip()
    if not prompt:
        raise ValueError(f"Row {index}: empty prompt")
    choices = obj["choices_json"]
    if not isinstance(choices, list) or len(choices) < 2:
        raise ValueError(f"Row {index}: choices_json must be an array with at least 2 strings")
    choice_strs = [str(c) for c in choices]
    ca = str(obj["correct_answer"]).strip()
    if ca not in choice_strs:
        raise ValueError(f"Row {index}: correct_answer must match a choice exactly: {ca!r}")
    expl = obj.get("explanation")
    expl_out = None if expl is None else str(expl)

    return {
        "book_number": bn,
        "chapter": ch,
        "difficulty_stage": st,
        "prompt": prompt,
        "choices_json": choice_strs,
        "correct_answer": ca,
        "explanation": expl_out,
    }


def load_and_validate(path: Path) -> list[dict[str, object]]:
    raw = json.loads(path.read_text(encoding="utf-8"))
    if not isinstance(raw, list):
        raise ValueError("Top-level JSON must be an array")
    return [validate_row(obj, i) for i, obj in enumerate(raw)]


def main() -> int:
    args = parse_args()
    path = args.json
    if not path.is_file():
        print(f"File not found: {path}", file=sys.stderr)
        return 1

    rows = load_and_validate(path)
    if not rows:
        print("No rows in file; nothing to do.")
        return 0

    by_book: dict[int, list[dict[str, object]]] = defaultdict(list)
    for r in rows:
        by_book[int(r["book_number"])].append(r)

    pairs: set[tuple[int, int]] = {(int(r["book_number"]), int(r["chapter"])) for r in rows}

    print(f"Loaded {len(rows)} questions from {path}")
    if args.whole_book:
        print(f"Mode: whole-book replace for book_number(s): {sorted(by_book.keys())}")
    else:
        print(f"Mode: replace chapters (book, chapter): {sorted(pairs)}")

    if args.dry_run:
        print("Dry run — no database changes.")
        return 0

    db = create_admin_client()

    if args.whole_book:
        for bn in sorted(by_book.keys()):
            print(f"Deleting all quiz_question_bank rows for book_number={bn} …")
            db.table("quiz_question_bank").delete().eq("book_number", bn).execute()
    else:
        for bn, ch in sorted(pairs):
            print(f"Deleting quiz_question_bank rows for book_number={bn} chapter={ch} …")
            (
                db.table("quiz_question_bank")
                .delete()
                .eq("book_number", bn)
                .eq("chapter", ch)
                .execute()
            )

    batch: list[dict[str, object]] = []
    n_ins = 0

    def flush():
        nonlocal n_ins, batch
        if not batch:
            return
        db.table("quiz_question_bank").insert(batch).execute()
        n_ins += len(batch)
        batch = []

    for r in rows:
        batch.append(
            {
                "book_number": r["book_number"],
                "chapter": r["chapter"],
                "difficulty_stage": r["difficulty_stage"],
                "prompt": r["prompt"],
                "choices_json": r["choices_json"],
                "correct_answer": r["correct_answer"],
                "explanation": r["explanation"],
            }
        )
        if len(batch) >= args.batch_size:
            flush()
    flush()

    print(f"Inserted {n_ins} rows into quiz_question_bank.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
