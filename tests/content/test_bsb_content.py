"""Acceptance tests for HG-1: BSB text, BSB word alignment and the STEPBible lexicons in the content build.
Owned by the orchestrator: do not edit.
"""

from __future__ import annotations

import gzip
import hashlib
import json
import re
import shutil
import sqlite3
import subprocess
import sys
from pathlib import Path

import pytest

from scripts.build_content import build

REPO = Path(__file__).resolve().parents[2]
SOURCE = REPO / "content" / "source"
UPSTREAM = REPO / "build" / "upstream"
TAG_RE = re.compile(r"<\s*/?\s*[A-Za-z]")


@pytest.fixture(scope="module")
def con(tmp_path_factory) -> sqlite3.Connection:
    out = tmp_path_factory.mktemp("hg1") / "content.sqlite"
    build(SOURCE, out)
    c = sqlite3.connect(f"file:{out.as_posix()}?mode=ro", uri=True)
    c.row_factory = sqlite3.Row
    return c


def _words(con, book, chapter, verse):
    return con.execute(
        "SELECT * FROM bsb_words WHERE book_number=? AND chapter=? AND verse=? ORDER BY english_order",
        (book, chapter, verse),
    ).fetchall()


# ── BSB verses ───────────────────────────────────────────────────────────────

def test_bsb_verse_count_and_ids(con):
    rows = con.execute("SELECT id, book_number, chapter, verse FROM verses WHERE translation='BSB' ORDER BY id").fetchall()
    assert len(rows) == 31086  # 31,102 references minus the 16 verses BSB leaves empty
    assert rows[0]["id"] == 124406  # first id after ASV's last (124405)
    ids = [r["id"] for r in rows]
    assert ids == list(range(124406, 124406 + len(rows)))
    keys = [(r["book_number"], r["chapter"], r["verse"]) for r in rows]
    assert keys == sorted(keys)


def test_bsb_known_verses(con):
    def text(b, c, v):
        row = con.execute(
            "SELECT text FROM verses WHERE translation='BSB' AND book_number=? AND chapter=? AND verse=?", (b, c, v)
        ).fetchone()
        return row["text"] if row else None

    assert text(1, 1, 1) == "In the beginning God created the heavens and the earth."
    assert text(43, 3, 16).startswith("For God so loved the world that He gave His one and only Son")
    assert text(40, 17, 21) is None  # omitted by BSB
    assert text(45, 16, 24) is None
    assert text(45, 16, 27) == "to the only wise God be glory forever through Jesus Christ! Amen."
    empty = con.execute("SELECT COUNT(*) FROM verses WHERE translation='BSB' AND trim(text)=''").fetchone()[0]
    assert empty == 0


def test_bsb_is_public_domain_and_searchable(con):
    t = con.execute("SELECT * FROM translations WHERE id='BSB'").fetchone()
    assert t["license"] == "Public Domain"
    assert t["language"] == "en"
    hits = con.execute(
        "SELECT COUNT(*) FROM verses_fts_en f JOIN verses v ON v.id=f.rowid "
        "WHERE verses_fts_en MATCH 'formless' AND v.translation='BSB'"
    ).fetchone()[0]
    assert hits >= 1


# ── Word alignment ───────────────────────────────────────────────────────────

def test_bsb_words_columns(con):
    cols = [r[1] for r in con.execute("PRAGMA table_info(bsb_words)")]
    assert cols == [
        "id", "book_number", "chapter", "verse", "english_order", "original_order", "language",
        "original", "translit", "parsing_code", "parsing", "strongs", "english", "english_kind", "footnote",
    ]
    idx = {r[1] for r in con.execute("PRAGMA index_list(bsb_words)")}
    assert len(idx) >= 2  # (book_number, chapter, verse) and (strongs)


def test_john_3_16_alignment(con):
    rows = _words(con, 43, 3, 16)
    assert [r["english_order"] for r in rows] == list(range(1, len(rows) + 1))
    assert sorted(r["original_order"] for r in rows) == list(range(1, len(rows) + 1))
    assert rows[0]["english"] == "For" and rows[0]["original"] == "γὰρ" and rows[0]["strongs"] == "G1063"
    loved = [r for r in rows if r["english"] == "loved"]
    assert len(loved) == 1
    assert loved[0]["original"] == "ἠγάπησεν" and loved[0]["strongs"] == "G0025"
    assert loved[0]["translit"] == "ēgapēsen" and loved[0]["language"] == "greek"
    assert loved[0]["parsing_code"] == "V-AIA-3S"
    only = [r for r in rows if r["english"] == "one and only"]
    assert only and only[0]["strongs"] == "G3439"
    assert only[0]["footnote"] and "only begotten" in only[0]["footnote"] and not TAG_RE.search(only[0]["footnote"])
    article = [r for r in rows if r["english_kind"] == "untranslated"]
    assert article and all(r["english"] is None for r in article)
    # 'Houtōs' (so) is the first Greek word, even though "so" comes later in English
    first_greek = min(rows, key=lambda r: r["original_order"])
    assert first_greek["original"] == "Οὕτως"


def test_genesis_1_1_hebrew(con):
    rows = _words(con, 1, 1, 1)
    assert rows[0]["language"] == "hebrew"
    assert rows[0]["original"] == "בְּרֵאשִׁ֖ית" and rows[0]["strongs"] == "H7225"
    created = [r for r in rows if r["english"] == "created"]
    assert created and created[0]["strongs"] == "H1254"
    god = [r for r in rows if r["english"] == "God"]
    assert god and god[0]["strongs"] == "H0430"
    assert "Verb" in created[0]["parsing"] and "Qal" in created[0]["parsing"]


def test_english_kinds(con):
    kinds = {r[0] for r in con.execute("SELECT DISTINCT english_kind FROM bsb_words")}
    assert kinds == {"text", "untranslated", "continues", "elsewhere"}
    bad = con.execute(
        "SELECT COUNT(*) FROM bsb_words WHERE (english_kind='text') != (english IS NOT NULL)"
    ).fetchone()[0]
    assert bad == 0
    markers = con.execute(
        "SELECT COUNT(*) FROM bsb_words WHERE english IN ('-', '. . .', 'vvv', '')"
    ).fetchone()[0]
    assert markers == 0


def test_word_coverage_and_languages(con):
    total = con.execute("SELECT COUNT(*) FROM bsb_words").fetchone()[0]
    assert 440_000 <= total <= 446_000  # 443,625 data rows upstream; blanks dropped
    langs = {r[0]: r[1] for r in con.execute("SELECT language, COUNT(*) FROM bsb_words GROUP BY language")}
    assert set(langs) == {"hebrew", "aramaic", "greek"}
    assert langs["aramaic"] > 5000
    verses = con.execute("SELECT COUNT(DISTINCT book_number*1000000+chapter*1000+verse) FROM bsb_words").fetchone()[0]
    assert verses == 31085  # Nehemiah 7:68 is English-only in BSB (no Hebrew words under it)
    assert not _words(con, 16, 7, 68)
    orphans = con.execute(
        "SELECT COUNT(*) FROM bsb_words w LEFT JOIN verses v ON v.translation='BSB' AND v.book_number=w.book_number "
        "AND v.chapter=w.chapter AND v.verse=w.verse WHERE v.id IS NULL"
    ).fetchone()[0]
    assert orphans == 0
    bad_strongs = con.execute(
        "SELECT COUNT(*) FROM bsb_words WHERE strongs IS NOT NULL AND strongs NOT GLOB '[HG][0-9][0-9][0-9][0-9]'"
    ).fetchone()[0]
    assert bad_strongs == 0
    tags = con.execute("SELECT COUNT(*) FROM bsb_words WHERE footnote GLOB '*<[A-Za-z/]*'").fetchone()[0]
    assert tags == 0


# ── Lexicon ──────────────────────────────────────────────────────────────────

def test_lexicon_entries(con):
    cols = [r[1] for r in con.execute("PRAGMA table_info(lexicon)")]
    assert cols == ["strongs", "language", "lemma", "translit", "morph", "gloss", "definition"]
    god = con.execute("SELECT * FROM lexicon WHERE strongs='H0430'").fetchone()
    assert god["lemma"] == "אֱלֹהִים" and god["gloss"] == "God" and god["language"] == "hebrew"
    love = con.execute("SELECT * FROM lexicon WHERE strongs='G0025'").fetchone()
    assert love["lemma"] == "ἀγαπάω" and love["gloss"] == "to love" and love["language"] == "greek"
    assert "to love" in love["definition"] and "Mat.5:43" in love["definition"]
    tagged = con.execute("SELECT COUNT(*) FROM lexicon WHERE definition GLOB '*<[A-Za-z/]*'").fetchone()[0]
    assert tagged == 0
    assert con.execute("SELECT COUNT(*) FROM lexicon").fetchone()[0] > 18000
    red = con.execute("SELECT * FROM lexicon WHERE strongs='H0122'").fetchone()  # upstream key is H0122a
    assert red and red["gloss"] == "red"


def test_lexicon_covers_aligned_words(con):
    total, missing = con.execute(
        "SELECT COUNT(*), SUM(l.strongs IS NULL) FROM bsb_words w LEFT JOIN lexicon l ON l.strongs=w.strongs "
        "WHERE w.strongs IS NOT NULL"
    ).fetchone()
    assert missing == 0, f"{missing} of {total} aligned words have no lexicon entry"


# ── Source files and the import script ───────────────────────────────────────

def test_manifest_lists_new_sources():
    manifest = json.loads((SOURCE / "MANIFEST.json").read_text(encoding="utf-8"))
    for name in ("verses/BSB.jsonl", "bsb_words.jsonl.gz", "lexicon.jsonl"):
        entry = manifest["files"][name]
        assert entry["sha256"] == hashlib.sha256((SOURCE / name).read_bytes()).hexdigest()
    assert manifest["tables"]["bsb_words"] > 440_000
    assert manifest["tables"]["lexicon"] > 18000
    with gzip.open(SOURCE / "bsb_words.jsonl.gz", "rt", encoding="utf-8") as fh:
        first = json.loads(fh.readline())
    assert first["book_number"] == 1 and first["chapter"] == 1 and first["verse"] == 1


@pytest.mark.skipif(not (UPSTREAM / "bsb_tables.tsv").exists(), reason="upstream files not downloaded")
def test_import_is_reproducible(tmp_path):
    out = tmp_path / "source"
    shutil.copytree(SOURCE, out)
    for name in ("verses/BSB.jsonl", "bsb_words.jsonl.gz", "lexicon.jsonl"):
        (out / name).unlink()
    subprocess.run(
        [sys.executable, str(REPO / "scripts" / "import_bsb.py"), "--upstream", str(UPSTREAM), "--out", str(out)],
        check=True, cwd=REPO,
    )
    for name in ("verses/BSB.jsonl", "bsb_words.jsonl.gz", "lexicon.jsonl", "MANIFEST.json", "translations.jsonl"):
        assert (out / name).read_bytes() == (SOURCE / name).read_bytes(), name


@pytest.mark.skipif(not (UPSTREAM / "bsb_tables.tsv").exists(), reason="upstream files not downloaded")
def test_import_rejects_wrong_upstream(tmp_path):
    up = tmp_path / "upstream"
    shutil.copytree(UPSTREAM, up)
    with open(up / "tbesg.txt", "a", encoding="utf-8") as fh:
        fh.write("tampered\n")
    out = tmp_path / "source"
    shutil.copytree(SOURCE, out)
    result = subprocess.run(
        [sys.executable, str(REPO / "scripts" / "import_bsb.py"), "--upstream", str(up), "--out", str(out)],
        cwd=REPO, capture_output=True, text=True,
    )
    assert result.returncode != 0
    assert "tbesg.txt" in (result.stdout + result.stderr)
