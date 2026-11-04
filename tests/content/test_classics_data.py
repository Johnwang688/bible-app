"""Real-data acceptance checks for the imported classics; optional before importing."""

import gzip
import json
from pathlib import Path
import subprocess

import pytest

SOURCE = Path(__file__).resolve().parents[2] / "content/source"
pytestmark = pytest.mark.skipif(
    not (SOURCE / "commentaries/jfb.jsonl.gz").exists(), reason="classics have not been imported"
)


@pytest.fixture(scope="module")
def classics():
    rows = [json.loads(l) for l in (SOURCE / "commentaries.jsonl").read_text(encoding="utf-8").splitlines() if l]
    with gzip.open(SOURCE / "commentaries/jfb.jsonl.gz", "rt", encoding="utf-8") as f:
        rows.extend(json.loads(l) for l in f if l.strip())
    return rows


def test_real_coverage_sources_and_ids(classics):
    for source in ("matthew_henry", "jfb"):
        entries = [r for r in classics if r["source"] == source]
        assert {r["book_number"] for r in entries} == set(range(1, 67))
        assert all(r["content"].strip() for r in entries)
    assert len({(r["book_number"], r["chapter"]) for r in classics if r["source"] == "matthew_henry"}) == 1189
    assert len({r["id"] for r in classics}) == len(classics)
    sources = [json.loads(l) for l in (SOURCE / "commentary_sources.jsonl").read_text(encoding="utf-8").splitlines()]
    assert next(r for r in sources if r["id"] == "jfb")["license"] == "Public Domain"
    manifest = json.loads((SOURCE / "MANIFEST.json").read_text(encoding="utf-8"))
    assert {"mhcc.xml", "jfb.xml"} <= manifest["upstream"].keys()
    assert {"matthew_henry", "jfb", "summary"} <= manifest["coverage"].keys()


@pytest.mark.parametrize("source,book,chapter,verse", [
    ("matthew_henry", 43, 3, 16), ("jfb", 43, 3, 16), ("jfb", 27, 9, 24),
    ("matthew_henry", 23, 53, 1), ("jfb", 23, 53, 1),
])
def test_real_spot_references(classics, source, book, chapter, verse):
    assert any(r["source"] == source and (r["book_number"], r["chapter"]) == (book, chapter)
               and r["verse_start"] <= verse <= (r["verse_end"] or r["verse_start"]) for r in classics)


def test_exodus_14_13_and_14_share_a_jfb_note(classics):
    matches = [[r for r in classics if r["source"] == "jfb" and (r["book_number"], r["chapter"]) == (2, 14)
                and r["verse_start"] <= verse <= (r["verse_end"] or r["verse_start"])] for verse in (13, 14)]
    assert len(matches[0]) == len(matches[1]) == 1
    assert matches[0][0]["id"] == matches[1][0]["id"]


def test_matthew_henry_isaiah_starts_with_commentary_word(classics):
    row = next(r for r in classics if r["source"] == "matthew_henry" and
               (r["book_number"], r["chapter"], r["verse_start"]) == (23, 53, 1))
    assert row["content"][0].isalpha()


def test_jfb_first_verses_do_not_collide_and_ranges_are_valid(classics):
    entries = [r for r in classics if r["source"] == "jfb"]
    keys = [(r["book_number"], r["chapter"], r["verse_start"]) for r in entries]
    assert len(keys) == len(set(keys))
    for row in entries:
        assert row["verse_end"] is None or row["verse_end"] > row["verse_start"]


def test_summary_lines_and_other_source_rows_are_byte_identical():
    for name, field, value in [("commentaries.jsonl", "source", "summary")]:
        old = subprocess.check_output(["git", "show", f"origin/main:content/source/{name}"], cwd=SOURCE)
        retained = lambda data: [l for l in data.splitlines(keepends=True) if json.loads(l)[field] == value]
        assert retained(old) == retained((SOURCE / name).read_bytes())
    old = subprocess.check_output(["git", "show", "origin/main:content/source/commentary_sources.jsonl"], cwd=SOURCE)
    actual = b"".join(l for l in (SOURCE / "commentary_sources.jsonl").read_bytes().splitlines(keepends=True) if json.loads(l)["id"] != "jfb")
    assert old == actual
