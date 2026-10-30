"""Regression test from the verifier re-check (W1-A). Owned by the orchestrator: do not edit.

Manifest keys are canonical POSIX paths as written by scripts/export_supabase.py; aliases
(backslashes, different case, ./) are rejected on purpose.
"""

import sqlite3
from contextlib import closing

from scripts import build_content as b


def test_verses_inserted_in_global_id_order(tmp_path):
    first = tmp_path / "A.jsonl"
    second = tmp_path / "B.jsonl"
    first.write_text('{"id": 20}\n{"id": 2}\n', encoding="utf-8")
    second.write_text('{"id": 10}\n{"id": 1}\n', encoding="utf-8")

    with closing(sqlite3.connect(":memory:")) as con:
        con.executescript(b.SCHEMA)
        con.executescript("""
            CREATE TABLE insertion_audit (
                seq INTEGER PRIMARY KEY,
                verse_id INTEGER
            );
            CREATE TRIGGER audit_verse AFTER INSERT ON verses BEGIN
                INSERT INTO insertion_audit(verse_id) VALUES(new.id);
            END;
        """)
        assert b._insert_jsonl(con, "verses", [first, second]) == 4
        assert con.execute(
            "SELECT verse_id FROM insertion_audit ORDER BY seq"
        ).fetchall() == [(1,), (2,), (10,), (20,)]
