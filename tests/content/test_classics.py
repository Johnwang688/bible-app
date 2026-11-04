"""Synthetic commentary coverage and file-plan checks; no real classics needed."""

import gzip
from contextlib import closing
import hashlib
import json
import sqlite3

import pytest

from scripts import build_content as b

def fixture_source(root, rows, coverage=True):
    root.mkdir()
    books = [{"book_number": n, "total_chapters": 2 if n == 1 else 1} for n in range(1, 67)]
    records = {table: [] for table in b.JSONL_TABLES}
    records.update(books=books, commentaries=rows)
    files = {}
    for table, entries in records.items():
        name = b.TABLE_FILES.get(table, table + ".jsonl")
        raw = ("".join(json.dumps(r) + "\n" for r in entries)).encode()
        if name.endswith(".gz"):
            raw = gzip.compress(raw, mtime=0)
        (root / name).write_bytes(raw)
        files[name] = {"rows": len(entries), "sha256": hashlib.sha256(raw).hexdigest(), "table": table}
    manifest = {"files": files, "tables": {t: len(r) for t, r in records.items()}}
    if coverage:
        manifest["coverage"] = {"matthew_henry": {"every_chapter": True,
            "rows_per_book": {str(n): 2 if n == 1 else 1 for n in range(1, 67)},
            "chapters_per_book": {str(n): 2 if n == 1 else 1 for n in range(1, 67)}}}
    (root / "MANIFEST.json").write_text(json.dumps(manifest), encoding="utf-8")
    return manifest


def complete_rows():
    return [{"id": i, "source": "matthew_henry", "book_number": n, "chapter": c,
             "verse_start": 1, "verse_end": None, "content": "Text."}
            for i, (n, c) in enumerate([(n, c) for n in range(1, 67) for c in range(1, (3 if n == 1 else 2))], 1)]


@pytest.mark.parametrize("defect", ["book", "chapter", "chapter_totals", "row_count", "undeclared_book"])
def test_build_rejects_coverage_even_with_correct_file_and_table_counts(tmp_path, defect):
    rows = complete_rows()
    if defect == "book":
        rows = [r for r in rows if r["book_number"] != 43]
    elif defect in {"chapter", "chapter_totals"}:
        rows = [r for r in rows if (r["book_number"], r["chapter"]) != (1, 2)]
    root = tmp_path / "source"
    manifest = fixture_source(root, rows)
    declaration = manifest["coverage"]["matthew_henry"]
    if defect == "chapter_totals":
        # Counts now agree; only every_chapter versus books.total_chapters is wrong.
        declaration["rows_per_book"]["1"] = 1
        declaration["chapters_per_book"]["1"] = 1
    elif defect == "row_count":
        declaration["rows_per_book"]["43"] = 99
    elif defect == "undeclared_book":
        del declaration["chapters_per_book"]["43"]
    (root / "MANIFEST.json").write_text(json.dumps(manifest), encoding="utf-8")
    out = tmp_path / "content.sqlite"
    out.write_bytes(b"previous database")
    with pytest.raises(b.BuildError, match="coverage"):
        b.build(root, out)
    assert out.read_bytes() == b"previous database"
    assert not out.with_name(out.name + ".tmp").exists()


@pytest.mark.parametrize("coverage", [True, False])
def test_coverage_and_older_manifests_build(tmp_path, coverage):
    fixture_source(tmp_path / "source", complete_rows(), coverage=coverage)
    out = tmp_path / "content.sqlite"
    b.build(tmp_path / "source", out)
    with closing(sqlite3.connect(out)) as con:
        assert con.execute("SELECT COUNT(*) FROM commentaries").fetchone()[0] == 67
        assert con.execute("SELECT value FROM meta WHERE key='schema_version'").fetchone()[0] == "1"
        assert [r[2] for r in con.execute("PRAGMA index_info(cross_references_from)")] == ["from_book_number", "from_chapter", "from_verse"]


def test_commentary_file_plan_is_sorted_and_requires_manifest_entries(tmp_path):
    root = tmp_path / "source"
    fixture_source(root, complete_rows())
    (root / "commentaries").mkdir()
    for name in ("z.jsonl.gz", "a.jsonl.gz"):
        (root / "commentaries" / name).write_bytes(gzip.compress(b"", mtime=0))
    plan = b._read_plan(root)
    assert [name for name, table in plan.items() if table == "commentaries"] == [
        "commentaries.jsonl", "commentaries/a.jsonl.gz", "commentaries/z.jsonl.gz"]
    assert plan["cross_references.jsonl.gz"] == "cross_references"
    with pytest.raises(b.BuildError, match="commentaries/a.jsonl.gz: not listed"):
        b.build(root, tmp_path / "content.sqlite")


def test_listed_but_absent_commentary_gzip_is_rejected(tmp_path):
    root = tmp_path / "source"
    manifest = fixture_source(root, complete_rows())
    manifest["files"]["commentaries/missing.jsonl.gz"] = {
        "rows": 0, "sha256": hashlib.sha256(gzip.compress(b"", mtime=0)).hexdigest(), "table": "commentaries"}
    (root / "MANIFEST.json").write_text(json.dumps(manifest), encoding="utf-8")
    with pytest.raises(b.BuildError, match="build never reads"):
        b.build(root, tmp_path / "content.sqlite")


