"""
Build the read-only content SQLite file from the committed export in content/source/.

Verifies every file listed in MANIFEST.json, then writes one SQLite database with
the content tables, two FTS5 indexes over verses (English: porter, Chinese: trigram)
and a meta table. The output is written to a temp file and atomically swapped in,
so readers only ever see the old file or the complete new one.

Usage:
    python scripts/build_content.py
    python scripts/build_content.py --source content/source --out build/content.sqlite

Standard library only. Re-running on the same source produces the same database.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import sqlite3
import sys
from pathlib import Path

# Repo root (parent of scripts/)
ROOT = Path(__file__).resolve().parent.parent

DEFAULT_SOURCE = ROOT / "content" / "source"
DEFAULT_OUT = ROOT / "build" / "content.sqlite"

SCHEMA_VERSION = "1"

# Order matters: tables are loaded in this order and counted in this order.
# Each table's columns come from the DDL below, so the schema lives in one place.
SCHEMA = """
CREATE TABLE translations (id TEXT PRIMARY KEY, name TEXT, language TEXT, license TEXT, description TEXT, created_at TEXT);
CREATE TABLE books (book_number INTEGER PRIMARY KEY, name_en TEXT, name_zh TEXT, abbreviation TEXT, testament TEXT, total_chapters INTEGER);
CREATE TABLE verses (id INTEGER PRIMARY KEY, translation TEXT, book_number INTEGER, chapter INTEGER, verse INTEGER, text TEXT);
CREATE UNIQUE INDEX verses_ref ON verses(translation, book_number, chapter, verse);
CREATE TABLE commentary_sources (id TEXT PRIMARY KEY, name TEXT, description TEXT, license TEXT, created_at TEXT);
CREATE TABLE commentaries (id INTEGER PRIMARY KEY, source TEXT, book_number INTEGER, chapter INTEGER, verse_start INTEGER, verse_end INTEGER, content TEXT);
CREATE INDEX commentaries_ref ON commentaries(book_number, chapter, verse_start);
CREATE TABLE cross_references (id INTEGER PRIMARY KEY, from_book_number INTEGER, from_chapter INTEGER, from_verse INTEGER, to_book_number INTEGER, to_chapter INTEGER, to_verse_start INTEGER, to_verse_end INTEGER, votes INTEGER, source TEXT);
CREATE TABLE summary_entities (id INTEGER PRIMARY KEY, kind TEXT, slug TEXT, label TEXT, profile TEXT, created_at TEXT);
CREATE UNIQUE INDEX summary_entities_kind_slug ON summary_entities(kind, slug);
CREATE TABLE commentary_entity_mentions (commentary_id INTEGER, entity_id INTEGER, sort_order INTEGER, PRIMARY KEY (commentary_id, entity_id));
CREATE INDEX mentions_entity ON commentary_entity_mentions(entity_id);
CREATE TABLE quiz_question_bank (id INTEGER PRIMARY KEY, book_number INTEGER, chapter INTEGER, difficulty_stage INTEGER, question_type TEXT, prompt TEXT, choices_json TEXT, correct_answer TEXT, explanation TEXT, source_verse_start INTEGER, source_verse_end INTEGER, created_at TEXT);
CREATE INDEX quiz_ref ON quiz_question_bank(book_number, chapter, difficulty_stage);
CREATE TABLE meta (key TEXT PRIMARY KEY, value TEXT);
CREATE VIRTUAL TABLE verses_fts_en USING fts5(text, content='verses', content_rowid='id', tokenize='porter unicode61 remove_diacritics 2');
CREATE VIRTUAL TABLE verses_fts_zh USING fts5(text, content='verses', content_rowid='id', tokenize='trigram');
"""

# Tables loaded from <source>/<table>.jsonl, in load order. Verses are handled separately.
JSONL_TABLES = [
    "translations",
    "books",
    "commentary_sources",
    "commentaries",
    "cross_references",
    "summary_entities",
    "commentary_entity_mentions",
    "quiz_question_bank",
]

FTS_TABLES = {
    # fts table -> SQL filter on translations.language for the verses it indexes
    "verses_fts_en": "t.language = 'en'",
    "verses_fts_zh": "substr(t.language, 1, 2) = 'zh'",
}


class BuildError(Exception):
    """Any failure while building the content database."""


def _sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with open(path, "rb") as f:
        for chunk in iter(lambda: f.read(1 << 20), b""):
            digest.update(chunk)
    return digest.hexdigest()


def _verify_source(source_dir: Path) -> str:
    """Check every manifest file's sha256. Return the source_sha256 recorded in meta."""
    manifest_path = source_dir / "MANIFEST.json"
    try:
        files = json.loads(manifest_path.read_text(encoding="utf-8"))["files"]
    except (OSError, ValueError, KeyError) as exc:
        raise BuildError(f"MANIFEST.json: cannot read manifest ({exc})") from exc

    for relative, entry in files.items():
        path = source_dir / relative
        if not path.is_file():
            raise BuildError(f"{relative}: missing from {source_dir}")
        actual = _sha256_file(path)
        if actual != entry["sha256"]:
            raise BuildError(f"{relative}: sha256 mismatch (manifest {entry['sha256']}, file {actual})")

    return hashlib.sha256(
        json.dumps(files, sort_keys=True, separators=(",", ":")).encode("utf-8")
    ).hexdigest()


def _sql_value(value):
    """Store JSON lists and dicts as canonical JSON text; pass scalars and None through."""
    if isinstance(value, (list, dict)):
        return json.dumps(value, ensure_ascii=False, sort_keys=True)
    return value


def _columns(con: sqlite3.Connection, table: str) -> list[str]:
    return [row[1] for row in con.execute(f"PRAGMA table_info({table})")]


def _insert_jsonl(con: sqlite3.Connection, table: str, paths: list[Path]) -> int:
    """Stream rows from one or more JSONL files into table. Return the number of rows loaded."""
    columns = _columns(con, table)
    sql = f"INSERT INTO {table} ({', '.join(columns)}) VALUES ({', '.join('?' * len(columns))})"
    count = 0

    def rows():
        nonlocal count
        for path in paths:
            with open(path, encoding="utf-8") as f:
                for line in f:
                    if not line.strip():
                        continue
                    record = json.loads(line)
                    count += 1
                    yield tuple(_sql_value(record.get(column)) for column in columns)

    con.executemany(sql, rows())
    return count


def _write_database(source_dir: Path, db_path: Path, source_sha256: str) -> dict[str, int]:
    """Create the schema and load every table into db_path. Return row counts per table."""
    con = sqlite3.connect(db_path, isolation_level=None)  # explicit transactions; VACUUM needs none open
    try:
        con.executescript(SCHEMA)
        counts: dict[str, int] = {}

        con.execute("BEGIN")
        for table in JSONL_TABLES:
            counts[table] = _insert_jsonl(con, table, [source_dir / f"{table}.jsonl"])

        verse_files = sorted((source_dir / "verses").glob("*.jsonl"))
        counts["verses"] = _insert_jsonl(con, "verses", verse_files)

        for fts, condition in FTS_TABLES.items():
            con.execute(
                f"INSERT INTO {fts}(rowid, text) SELECT v.id, v.text FROM verses v "
                f"JOIN translations t ON t.id = v.translation WHERE {condition} ORDER BY v.id"
            )
            con.execute(f"INSERT INTO {fts}({fts}) VALUES('optimize')")

        con.executemany(
            "INSERT INTO meta (key, value) VALUES (?, ?)",
            [
                ("schema_version", SCHEMA_VERSION),
                ("source_sha256", source_sha256),
                ("row_counts", json.dumps(counts, sort_keys=True)),
            ],
        )
        con.execute("COMMIT")

        con.execute("VACUUM")
        return counts
    finally:
        con.close()


def build(source_dir: Path, out_path: Path) -> dict[str, int]:
    """Build the content database at out_path from source_dir. Return row counts per table."""
    source_dir = Path(source_dir)
    out_path = Path(out_path)

    source_sha256 = _verify_source(source_dir)

    out_path.parent.mkdir(parents=True, exist_ok=True)
    tmp_path = out_path.with_name(out_path.name + ".tmp")
    tmp_path.unlink(missing_ok=True)
    try:
        counts = _write_database(source_dir, tmp_path, source_sha256)
        os.replace(tmp_path, out_path)
    except BaseException as exc:
        # Leave no temp file behind; any previous out_path is untouched.
        tmp_path.unlink(missing_ok=True)
        if isinstance(exc, (sqlite3.Error, OSError, ValueError)):
            raise BuildError(f"build failed: {exc}") from exc
        raise
    return counts


def _parse_args(argv: list[str] | None) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Build the read-only content SQLite file.")
    parser.add_argument("--source", type=Path, default=DEFAULT_SOURCE, help="source export directory")
    parser.add_argument("--out", type=Path, default=DEFAULT_OUT, help="output SQLite file")
    return parser.parse_args(argv)


def main(argv: list[str] | None = None) -> int:
    args = _parse_args(argv)
    try:
        counts = build(args.source, args.out)
    except BuildError as exc:
        print(f"build failed: {exc}", file=sys.stderr)
        return 1
    for table, count in counts.items():
        print(f"{table}: {count} rows")
    print(f"wrote {args.out} ({args.out.stat().st_size} bytes)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
