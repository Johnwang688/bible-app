"""Acceptance tests for scripts/build_content.py (W1-A). Owned by the orchestrator: do not edit."""

from __future__ import annotations

import json
import shutil
import sqlite3
from pathlib import Path

import pytest

from scripts.build_content import BuildError, build

REPO = Path(__file__).resolve().parents[2]
SOURCE = REPO / "content" / "source"
MANIFEST = json.loads((SOURCE / "MANIFEST.json").read_text(encoding="utf-8"))


@pytest.fixture(scope="module")
def built(tmp_path_factory) -> Path:
    out = tmp_path_factory.mktemp("content") / "content.sqlite"
    counts = build(SOURCE, out)
    assert isinstance(counts, dict)
    return out


def _con(path: Path) -> sqlite3.Connection:
    con = sqlite3.connect(f"file:{path.as_posix()}?mode=ro", uri=True)
    con.row_factory = sqlite3.Row
    return con


def test_row_counts_match_manifest(built):
    con = _con(built)
    for table, expected in MANIFEST["tables"].items():
        got = con.execute(f"SELECT COUNT(*) FROM {table}").fetchone()[0]
        assert got == expected, f"{table}: expected {expected}, got {got}"


def test_meta_table(built):
    con = _con(built)
    meta = dict(con.execute("SELECT key, value FROM meta").fetchall())
    assert meta["schema_version"] == "1"
    assert json.loads(meta["row_counts"]) == MANIFEST["tables"]
    assert len(meta["source_sha256"]) == 64
    assert "built_at" not in meta  # no timestamps: builds must be reproducible


def test_columns_and_types(built):
    con = _con(built)
    row = con.execute(
        "SELECT * FROM verses WHERE translation='WEB' AND book_number=43 AND chapter=3 AND verse=16"
    ).fetchone()
    assert set(row.keys()) == {"id", "translation", "book_number", "chapter", "verse", "text"}
    assert "For God so loved the world" in row["text"]
    q = con.execute("SELECT choices_json FROM quiz_question_bank WHERE id=133").fetchone()
    assert isinstance(q["choices_json"], str)
    assert json.loads(q["choices_json"])[0].startswith("In the beginning")
    cr_cols = [r[1] for r in con.execute("PRAGMA table_info(cross_references)")]
    assert cr_cols == [
        "id", "from_book_number", "from_chapter", "from_verse", "to_book_number",
        "to_chapter", "to_verse_start", "to_verse_end", "votes", "source",
    ]


def test_english_fts_stems_and_only_indexes_english(built):
    con = _con(built)
    ids = [r[0] for r in con.execute("SELECT rowid FROM verses_fts_en WHERE verses_fts_en MATCH 'loved'")]
    assert ids, "porter stemming should match 'loved'"
    langs = {
        r[0]
        for r in con.execute(
            "SELECT DISTINCT t.language FROM verses_fts_en f JOIN verses v ON v.id = f.rowid "
            "JOIN translations t ON t.id = v.translation WHERE verses_fts_en MATCH 'god'"
        )
    }
    assert langs == {"en"}
    n_en = con.execute(
        "SELECT COUNT(*) FROM verses v JOIN translations t ON t.id = v.translation WHERE t.language = 'en'"
    ).fetchone()[0]
    assert con.execute("SELECT COUNT(*) FROM verses_fts_en").fetchone()[0] == n_en


def test_chinese_trigram_fts(built):
    con = _con(built)
    rows = con.execute(
        "SELECT v.translation, v.book_number, v.chapter, v.verse FROM verses_fts_zh f "
        "JOIN verses v ON v.id = f.rowid WHERE verses_fts_zh MATCH '\"神爱世人\"'"
    ).fetchall()
    assert ("CUV-SIMP", 43, 3, 16) in [tuple(r) for r in rows]
    n_zh = con.execute(
        "SELECT COUNT(*) FROM verses v JOIN translations t ON t.id = v.translation WHERE t.language LIKE 'zh%'"
    ).fetchone()[0]
    assert n_zh > 0
    assert con.execute("SELECT COUNT(*) FROM verses_fts_zh").fetchone()[0] == n_zh


def test_build_is_reproducible(built, tmp_path):
    again = tmp_path / "again.sqlite"
    build(SOURCE, again)
    a = "\n".join(sqlite3.connect(built).iterdump())
    b = "\n".join(sqlite3.connect(again).iterdump())
    assert a == b


def test_tampered_source_is_rejected(tmp_path):
    src = tmp_path / "source"
    shutil.copytree(SOURCE, src)
    p = src / "books.jsonl"
    p.write_bytes(p.read_bytes().replace(b"Genesis", b"Genesys", 1))
    out = tmp_path / "x.sqlite"
    with pytest.raises(BuildError):
        build(src, out)
    assert not out.exists(), "no output file may be left behind on failure"


def test_existing_output_replaced_atomically(tmp_path):
    out = tmp_path / "content.sqlite"
    out.write_bytes(b"old")
    build(SOURCE, out)
    con = _con(out)
    assert con.execute("SELECT COUNT(*) FROM books").fetchone()[0] == 66
    assert not list(tmp_path.glob("*.tmp*")), "temp files must be cleaned up"
