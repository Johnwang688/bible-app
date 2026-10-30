"""Regression tests from the verifier review (W1-A). Owned by the orchestrator: do not edit."""

from contextlib import closing
import hashlib
import json
import sqlite3

import pytest
from scripts.build_content import BuildError, build

TABLES = (
    "translations", "books", "commentary_sources", "commentaries",
    "cross_references", "summary_entities", "commentary_entity_mentions",
    "quiz_question_bank",
)


def source(root, rows=None, unlisted=()):
    root.mkdir()
    data = {f"{table}.jsonl": [] for table in TABLES}
    data["verses/WEB.jsonl"] = []
    data.update(rows or {})
    files, counts = {}, {}
    for name, records in data.items():
        path = root / name
        path.parent.mkdir(parents=True, exist_ok=True)
        raw = "".join(
            json.dumps(row, ensure_ascii=False) + "\n"
            for row in records
        ).encode("utf-8")
        path.write_bytes(raw)
        table = "verses" if name.startswith("verses/") else name[:-6]
        counts[table] = counts.get(table, 0) + len(records)
        if name not in unlisted:
            files[name] = {
                "sha256": hashlib.sha256(raw).hexdigest(),
                "table": table,
                "rows": len(records),
            }
    (root / "MANIFEST.json").write_text(
        json.dumps({"files": files, "tables": counts}),
        encoding="utf-8",
    )
    return root

@pytest.mark.parametrize("name,record", [
    ("books.jsonl", {"book_number": 1, "name_en": "Unchecked"}),
    ("verses/rogue.jsonl", {"id": 99, "text": "Unchecked"}),
])
def test_reject_unverified_content(tmp_path, name, record):
    src = source(
        tmp_path / "source",
        {name: [record]},
        unlisted=(name,),
    )
    with pytest.raises(BuildError):
        build(src, tmp_path / "content.sqlite")

def test_reject_manifest_traversal(tmp_path):
    src = source(tmp_path / "source")
    outside = tmp_path / "outside.jsonl"
    outside.write_bytes(b"{}\n")
    path = src / "MANIFEST.json"
    manifest = json.loads(path.read_text(encoding="utf-8"))
    manifest["files"]["../outside.jsonl"] = {
        "sha256": hashlib.sha256(outside.read_bytes()).hexdigest(),
        "table": "books",
        "rows": 1,
    }
    path.write_text(json.dumps(manifest), encoding="utf-8")
    with pytest.raises(BuildError):
        build(src, tmp_path / "content.sqlite")

def test_load_in_primary_key_order(tmp_path):
    src = source(tmp_path / "source", {
        "translations.jsonl": [{"id": "z"}, {"id": "a"}],
    })
    out = tmp_path / "content.sqlite"
    build(src, out)
    with closing(sqlite3.connect(out)) as con:
        rows = con.execute(
            "SELECT id FROM translations ORDER BY rowid"
        ).fetchall()
    assert rows == [("a",), ("z",)]

def test_json_columns_encode_scalars(tmp_path):
    src = source(tmp_path / "source", {
        "summary_entities.jsonl": [{"id": 1, "profile": True}],
        "quiz_question_bank.jsonl": [
            {"id": 1, "choices_json": "scalar"},
        ],
    })
    out = tmp_path / "content.sqlite"
    build(src, out)
    with closing(sqlite3.connect(out)) as con:
        profile = con.execute(
            "SELECT profile FROM summary_entities"
        ).fetchone()[0]
        choices = con.execute(
            "SELECT choices_json FROM quiz_question_bank"
        ).fetchone()[0]
    assert (profile, choices) == ("true", '"scalar"')

def test_english_fts_maps_tokens_to_correct_rows(tmp_path):
    src = source(tmp_path / "source", {
        "translations.jsonl": [{"id": "WEB", "language": "en"}],
        "verses/WEB.jsonl": [
            {"id": 42, "translation": "WEB", "text": "Merciful runners"},
            {"id": 99, "translation": "WEB", "text": "Justice"},
        ],
    })
    out = tmp_path / "content.sqlite"
    build(src, out)
    with closing(sqlite3.connect(out)) as con:
        rows = con.execute(
            "SELECT rowid FROM verses_fts_en "
            "WHERE verses_fts_en MATCH 'runner'"
        ).fetchall()
    assert rows == [(42,)]
