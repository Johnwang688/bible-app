"""
Build the read-only content SQLite file from the committed export in content/source/.

Verifies that MANIFEST.json lists exactly the files the build reads (each with its sha256),
loads them, and checks every file's and every table's row count against the manifest. It
writes one SQLite database with
the content tables (including the BSB word alignment and the lexicon), two FTS5 indexes
over verses (English: porter, Chinese: trigram) and a meta table. The output is written
to a temp file and atomically swapped in, so readers only ever see the old file or the
complete new one.

Usage:
    python scripts/build_content.py
    python scripts/build_content.py --source content/source --out build/content.sqlite

Standard library only. Re-running on the same source produces the same database.
"""

from __future__ import annotations

import argparse
import gzip
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
CREATE TABLE bsb_words (id INTEGER PRIMARY KEY, book_number INTEGER, chapter INTEGER, verse INTEGER, english_order INTEGER, original_order INTEGER, language TEXT, original TEXT, translit TEXT, parsing_code TEXT, parsing TEXT, strongs TEXT, english TEXT, english_kind TEXT, footnote TEXT);
CREATE INDEX bsb_words_ref ON bsb_words(book_number, chapter, verse);
CREATE INDEX bsb_words_strongs ON bsb_words(strongs);
CREATE TABLE lexicon (strongs TEXT PRIMARY KEY, language TEXT, lemma TEXT, translit TEXT, morph TEXT, gloss TEXT, definition TEXT);
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
    "lexicon",
    "bsb_words",
]

# Source file for each table loaded from JSONL: <table>.jsonl unless listed here.
# A .gz file is read with gzip; its sha256 is still checked over the compressed bytes.
TABLE_FILES = {"bsb_words": "bsb_words.jsonl.gz"}

# Tables that may be absent from a source export (older exports predate them). A table the
# manifest mentions nowhere, and whose file is absent, is created empty. A table the manifest
# mentions anywhere (a files entry or a tables count, even 0) needs its file.
OPTIONAL_TABLES = {"lexicon", "bsb_words"}

# Rows are inserted in this key order, whatever order the files list them in.
SORT_KEYS = {
    "translations": ("id",),
    "books": ("book_number",),
    "verses": ("id",),
    "commentary_sources": ("id",),
    "commentaries": ("id",),
    "cross_references": ("id",),
    "summary_entities": ("id",),
    "commentary_entity_mentions": ("commentary_id", "entity_id"),
    "quiz_question_bank": ("id",),
    "lexicon": ("strongs",),
    "bsb_words": ("id",),
}

# Always stored as JSON text (even for scalars), so the column never holds a raw Python value.
JSON_TEXT_COLUMNS = {"choices_json", "profile"}

FTS_TABLES = {
    # fts table -> SQL filter on translations.language for the verses it indexes
    "verses_fts_en": "t.language = 'en'",
    "verses_fts_zh": "substr(t.language, 1, 2) = 'zh'",
}


class BuildError(Exception):
    """Any failure while building the content database."""


def _table_file(table: str) -> str:
    """Name of the source file (relative to the source dir) that holds a JSONL table."""
    return TABLE_FILES.get(table, f"{table}.jsonl")


def _open_text(path: Path):
    """Open a JSONL source file for reading as UTF-8 text; .gz files are decompressed."""
    if path.suffix == ".gz":
        return gzip.open(path, "rt", encoding="utf-8", newline="")
    return open(path, encoding="utf-8")


def _sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with open(path, "rb") as f:
        for chunk in iter(lambda: f.read(1 << 20), b""):
            digest.update(chunk)
    return digest.hexdigest()


def _inside(path: Path, root: Path) -> bool:
    """True if path, after resolving symlinks and '..', is root or lies beneath it."""
    try:
        path.resolve().relative_to(root)
    except ValueError:
        return False
    return True


def _read_plan(source_dir: Path) -> dict[str, str]:
    """Every source file the build reads, as relative path -> table, in load order.

    Table files are always read (optional ones only if present); verse files are whatever sits in verses/.
    """
    plan = {}
    for table in JSONL_TABLES:
        relative = _table_file(table)
        if table not in OPTIONAL_TABLES or (source_dir / relative).exists():
            plan[relative] = table
    for path in sorted((source_dir / "verses").glob("*.jsonl")):
        plan[f"verses/{path.name}"] = "verses"
    return plan


def _is_count(value) -> bool:
    return isinstance(value, int) and not isinstance(value, bool) and value >= 0


def _verify_source(source_dir: Path) -> tuple[dict, dict[str, str], str]:
    """Check that the manifest lists exactly the files the build reads, each with its table and sha256.

    Return (manifest, read plan, source_sha256 recorded in meta). Row counts are checked after loading.
    """
    manifest_path = source_dir / "MANIFEST.json"
    try:
        manifest = json.loads(manifest_path.read_text(encoding="utf-8"))
        files = manifest["files"]
    except (OSError, ValueError, KeyError, TypeError) as exc:
        raise BuildError(f"MANIFEST.json: cannot read manifest ({exc})") from exc
    if not isinstance(files, dict):
        raise BuildError("MANIFEST.json: 'files' must be an object")
    declared_counts = manifest.setdefault("tables", {})
    if not isinstance(declared_counts, dict):
        raise BuildError("MANIFEST.json: 'tables' must be an object")
    for relative, entry in files.items():
        if not (
            isinstance(entry, dict)
            and isinstance(entry.get("sha256"), str)
            and isinstance(entry.get("table"), str)
            and _is_count(entry.get("rows"))
        ):
            raise BuildError(f"{relative}: manifest entry needs sha256, table and rows")
    for table, count in declared_counts.items():
        if table not in SORT_KEYS or not _is_count(count):
            raise BuildError(f"{table}: MANIFEST.json declares {count!r} rows, but no such table is loaded")

    root = source_dir.resolve()
    for relative in files:
        if Path(relative).is_absolute() or not _inside(source_dir / relative, root):
            raise BuildError(f"{relative}: manifest path escapes {source_dir}")

    plan = _read_plan(source_dir)

    # An optional table the manifest mentions anywhere (a files entry, whatever its path, or a
    # tables count of any value) is declared: its file must exist, so it never ships empty.
    declared = {entry["table"] for entry in files.values()} | set(declared_counts)
    for table in sorted(OPTIONAL_TABLES & declared):
        relative = _table_file(table)
        if relative not in plan:
            raise BuildError(
                f"{table}: declared in MANIFEST.json but {relative} is missing from {source_dir}"
            )

    # The manifest lists exactly what the build reads: no unlisted file, no listed file left unread.
    for relative in plan:
        if relative not in files:
            raise BuildError(f"{relative}: not listed in MANIFEST.json")
    for relative, entry in files.items():
        if relative not in plan:
            raise BuildError(
                f"{relative}: listed in MANIFEST.json for table {entry['table']} but the build never reads it"
            )
        if plan[relative] != entry["table"]:
            raise BuildError(
                f"{relative}: MANIFEST.json says table {entry['table']} but it loads into {plan[relative]}"
            )

    for relative, entry in files.items():
        path = source_dir / relative
        if not path.is_file():
            raise BuildError(f"{relative}: missing from {source_dir}")
        actual = _sha256_file(path)
        if actual != entry["sha256"]:
            raise BuildError(f"{relative}: sha256 mismatch (manifest {entry['sha256']}, file {actual})")

    source_sha256 = hashlib.sha256(
        json.dumps(files, sort_keys=True, separators=(",", ":")).encode("utf-8")
    ).hexdigest()
    return manifest, plan, source_sha256


def _check_counts(manifest: dict, file_rows: dict[str, int], table_rows: dict[str, int]) -> None:
    """The one place declared and loaded meet: every file and declared table has the manifest's row count."""
    for relative, entry in manifest["files"].items():
        if file_rows[relative] != entry["rows"]:
            raise BuildError(
                f"{relative} (table {entry['table']}): MANIFEST.json declares {entry['rows']} rows, "
                f"loaded {file_rows[relative]}"
            )
    for table, expected in manifest["tables"].items():
        if table_rows[table] != expected:
            raise BuildError(f"{table}: MANIFEST.json declares {expected} rows, loaded {table_rows[table]}")


def _sql_value(column: str, value):
    """Canonical JSON text for JSON columns and for lists/dicts; None (SQL NULL) and other scalars pass through."""
    if value is None:
        return None
    if column in JSON_TEXT_COLUMNS or isinstance(value, (list, dict)):
        return json.dumps(value, ensure_ascii=False, sort_keys=True)
    return value


def _columns(con: sqlite3.Connection, table: str) -> list[str]:
    return [row[1] for row in con.execute(f"PRAGMA table_info({table})")]


def _read_jsonl(path: Path) -> list[dict]:
    """The records in one JSONL file; blank lines are skipped."""
    with _open_text(path) as f:
        return [json.loads(line) for line in f if line.strip()]


def _insert_jsonl(con: sqlite3.Connection, table: str, paths: list[Path]) -> int:
    """Load rows from one or more JSONL files into table, sorted by SORT_KEYS. Return the number of rows loaded."""
    return _insert_records(con, table, [record for path in paths for record in _read_jsonl(path)])


def _insert_records(con: sqlite3.Connection, table: str, records: list[dict]) -> int:
    """Insert records into table, sorted by SORT_KEYS. Return the number of rows inserted."""
    columns = _columns(con, table)
    sql = f"INSERT INTO {table} ({', '.join(columns)}) VALUES ({', '.join('?' * len(columns))})"

    keys = SORT_KEYS[table]
    try:
        records.sort(key=lambda record: tuple(record.get(key) for key in keys))
    except TypeError as exc:
        raise BuildError(f"{table}: primary key values are not comparable ({exc})") from exc

    con.executemany(
        sql,
        (tuple(_sql_value(column, record.get(column)) for column in columns) for record in records),
    )
    return len(records)


def _write_database(
    source_dir: Path, db_path: Path, plan: dict[str, str], source_sha256: str
) -> tuple[dict[str, int], dict[str, int]]:
    """Create the schema and load the files in plan into db_path. Return (rows per table, rows per file)."""
    con = sqlite3.connect(db_path, isolation_level=None)  # explicit transactions; VACUUM needs none open
    try:
        con.executescript(SCHEMA)
        counts: dict[str, int] = {}
        file_rows: dict[str, int] = {}

        con.execute("BEGIN")
        for table in [*JSONL_TABLES, "verses"]:
            records: list[dict] = []
            for relative in (relative for relative, target in plan.items() if target == table):
                file_records = _read_jsonl(source_dir / relative)
                file_rows[relative] = len(file_records)
                records += file_records
            counts[table] = _insert_records(con, table, records)

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
        return counts, file_rows
    finally:
        con.close()


def build(source_dir: Path, out_path: Path) -> dict[str, int]:
    """Build the content database at out_path from source_dir. Return row counts per table."""
    source_dir = Path(source_dir)
    out_path = Path(out_path)

    manifest, plan, source_sha256 = _verify_source(source_dir)

    out_path.parent.mkdir(parents=True, exist_ok=True)
    tmp_path = out_path.with_name(out_path.name + ".tmp")
    tmp_path.unlink(missing_ok=True)
    try:
        counts, file_rows = _write_database(source_dir, tmp_path, plan, source_sha256)
        _check_counts(manifest, file_rows, counts)  # before the swap, so a mismatch keeps the old file
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
