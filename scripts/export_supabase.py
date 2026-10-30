"""
Export every table of the app's Supabase database to deterministic JSONL files.

Writes two roots, each with a MANIFEST.json (written last, after all its tables):
  <out-root>/content/source/   shared content (translations, books, commentaries, ...)
  <out-root>/data/export/      per-user data (profiles, study items, progress, ...)

Read-only against the database. Re-running overwrites the output files.

Usage:
    python scripts/export_supabase.py
    python scripts/export_supabase.py --content-only
    python scripts/export_supabase.py --users-only --out-root D:/backups/bible

Requires SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY in .env
"""

from __future__ import annotations

import argparse
import hashlib
import json
import re
import sys
from datetime import datetime, timezone
from pathlib import Path
from urllib.parse import urlparse

from fastapi import HTTPException

# Repo root (parent of scripts/)
ROOT = Path(__file__).resolve().parent.parent
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from app.core.config import get_settings  # noqa: E402
from app.core.supabase_client import create_supabase_admin  # noqa: E402


class ExportError(Exception):
    """Base error for any export failure."""


class ExportCountMismatch(ExportError):
    """Rows fetched do not match the exact count Supabase reported."""


class ExportDuplicateKey(ExportError):
    """Two rows share the same key tuple, so the output order is ambiguous."""


GENERATED_COLUMNS = {"text_search", "content_search"}

PAGE_SIZE = 1000

CONTENT_TABLES: list[tuple[str, tuple[str, ...]]] = [
    ("translations", ("id",)),
    ("books", ("book_number",)),
    ("commentary_sources", ("id",)),
    ("commentaries", ("id",)),
    ("cross_references", ("id",)),
    ("summary_entities", ("id",)),
    ("commentary_entity_mentions", ("commentary_id", "entity_id")),
    ("quiz_question_bank", ("id",)),
]

VERSES_KEY: tuple[str, ...] = ("id",)

USER_TABLES: list[tuple[str, tuple[str, ...]]] = [
    ("profiles", ("id",)),
    ("user_settings", ("user_id",)),
    ("study_items", ("id",)),
    ("highlights", ("id",)),
    ("reading_progress", ("id",)),
    ("user_chapter_progress", ("user_id", "book_number", "chapter")),
    ("quiz_attempts", ("id",)),
    ("user_wallet", ("user_id",)),
    ("user_mastery_scope_rewards", ("user_id", "milestone_key")),
]

# Translation codes become file names, so only allow plain identifiers.
_SAFE_TRANSLATION = re.compile(r"^[A-Za-z0-9_-]+$")


def clean_row(row: dict) -> dict:
    """Return a copy of the row without database-generated search columns."""
    return {k: v for k, v in row.items() if k not in GENERATED_COLUMNS}


def fetch_all_rows(
    client,
    table: str,
    order_by: tuple[str, ...],
    page_size: int = PAGE_SIZE,
) -> list[dict]:
    """Fetch a whole table page by page, verify the count, and sort by key."""
    rows: list[dict] = []
    expected: int | None = None
    start = 0
    while True:
        query = client.table(table).select("*", count="exact")
        for column in order_by:
            query = query.order(column)
        response = query.range(start, start + page_size - 1).execute()
        if expected is None:
            expected = response.count
        if expected is None:
            raise ExportError(f"{table}: Supabase returned no exact row count")
        batch = response.data or []
        rows.extend(clean_row(row) for row in batch)
        if len(batch) < page_size:
            break
        start += page_size

    if len(rows) != expected:
        raise ExportCountMismatch(f"{table}: expected {expected} rows, got {len(rows)}")

    rows.sort(key=lambda row: tuple(row[column] for column in order_by))
    for previous, current in zip(rows, rows[1:]):
        key = tuple(previous[c] for c in order_by)
        if key == tuple(current[c] for c in order_by):
            raise ExportDuplicateKey(f"{table}: duplicate key {dict(zip(order_by, key))}")
    return rows


def write_jsonl(path: Path, rows: list[dict]) -> str:
    """Write rows as deterministic JSONL (LF, sorted keys) and return the file's sha256."""
    path.parent.mkdir(parents=True, exist_ok=True)
    digest = hashlib.sha256()
    with open(path, "w", encoding="utf-8", newline="\n") as f:
        for row in rows:
            line = json.dumps(row, ensure_ascii=False, sort_keys=True, separators=(",", ":")) + "\n"
            f.write(line)
            digest.update(line.encode("utf-8"))
    return digest.hexdigest()


def _write_table(
    root: Path,
    table: str,
    parts: list[tuple[str, list[dict]]],
    files: dict,
    counts: dict,
) -> None:
    """Write one table's rows as one or more files under root and record them in the manifest."""
    total = 0
    for relative, rows in parts:
        digest = write_jsonl(root / relative, rows)
        files[relative] = {"table": table, "rows": len(rows), "sha256": digest}
        total += len(rows)
    counts[table] = total
    print(f"{table}: {total} rows", flush=True)


def _write_manifest(root: Path, project_ref: str, counts: dict, files: dict) -> None:
    manifest = {
        "exported_at": datetime.now(timezone.utc).isoformat(),
        "supabase_project_ref": project_ref,
        "tables": counts,
        "files": files,
    }
    root.mkdir(parents=True, exist_ok=True)
    with open(root / "MANIFEST.json", "w", encoding="utf-8", newline="\n") as f:
        f.write(json.dumps(manifest, indent=2, sort_keys=True, ensure_ascii=False) + "\n")


def _export_content(client, root: Path, project_ref: str) -> None:
    files: dict = {}
    counts: dict = {}
    for table, order_by in CONTENT_TABLES:
        rows = fetch_all_rows(client, table, order_by)
        _write_table(root, table, [(f"{table}.jsonl", rows)], files, counts)

    # Verses are fetched once, then split by translation.
    verses = fetch_all_rows(client, "verses", VERSES_KEY)
    by_translation: dict[str, list[dict]] = {}
    for row in verses:
        translation = str(row["translation"])
        if not _SAFE_TRANSLATION.match(translation):
            raise ExportError(f"verses: unsafe translation code {translation!r}")
        by_translation.setdefault(translation, []).append(row)
    parts = [
        (f"verses/{translation}.jsonl", by_translation[translation])
        for translation in sorted(by_translation)
    ]
    _write_table(root, "verses", parts, files, counts)

    _write_manifest(root, project_ref, counts, files)


def _export_user_data(client, root: Path, project_ref: str) -> None:
    files: dict = {}
    counts: dict = {}
    for table, order_by in USER_TABLES:
        rows = fetch_all_rows(client, table, order_by)
        _write_table(root, table, [(f"{table}.jsonl", rows)], files, counts)
    _write_manifest(root, project_ref, counts, files)


def _admin_client():
    try:
        return create_supabase_admin()
    except HTTPException as exc:
        raise ExportError(str(exc.detail)) from exc


def _project_ref() -> str:
    host = urlparse(get_settings().supabase_url.strip()).hostname or ""
    ref = host.split(".")[0]
    if not ref:
        raise ExportError("SUPABASE_URL has no project subdomain")
    return ref


def _parse_args(argv: list[str] | None) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Export all Supabase tables to JSONL files.")
    group = parser.add_mutually_exclusive_group()
    group.add_argument("--content-only", action="store_true", help="export only content tables")
    group.add_argument("--users-only", action="store_true", help="export only user-data tables")
    parser.add_argument("--out-root", type=Path, default=ROOT, help="output root (default: repo root)")
    return parser.parse_args(argv)


def main(argv: list[str] | None = None) -> int:
    args = _parse_args(argv)
    try:
        client = _admin_client()
        project_ref = _project_ref()
        if not args.users_only:
            _export_content(client, args.out_root / "content" / "source", project_ref)
        if not args.content_only:
            _export_user_data(client, args.out_root / "data" / "export", project_ref)
    except ExportError as exc:
        print(f"export failed: {exc}", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
