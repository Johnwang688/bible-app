"""Acceptance tests for HG-2: the verse-words and lexicon endpoints, and plain-English grammar.
Owned by the orchestrator: do not edit.
"""

from __future__ import annotations

from pathlib import Path

import pytest
from fastapi.testclient import TestClient

REPO = Path(__file__).resolve().parents[2]
DB_PATH = REPO / "build" / "content.sqlite"


@pytest.fixture(scope="module")
def client() -> TestClient:
    if not DB_PATH.exists():
        from scripts.build_content import build

        build(REPO / "content" / "source", DB_PATH)
    from app.main import app

    return TestClient(app)


# ── GET /api/v1/words/{book}/{chapter}/{verse} ───────────────────────────────

def test_words_john_3_16(client):
    r = client.get("/api/v1/words/John/3/16")
    assert r.status_code == 200
    body = r.json()
    assert {k: body[k] for k in ("book", "book_number", "chapter", "verse", "translation")} == {
        "book": "John", "book_number": 43, "chapter": 3, "verse": 16, "translation": "BSB",
    }
    words = body["words"]
    assert [w["english_order"] for w in words] == list(range(1, len(words) + 1))
    assert set(words[0]) == {
        "english_order", "english", "english_kind", "original", "translit", "language", "strongs",
        "lemma", "gloss", "grammar", "parsing", "parsing_code", "footnote",
    }
    loved = next(w for w in words if w["english"] == "loved")
    assert loved["original"] == "ἠγάπησεν" and loved["strongs"] == "G0025"
    assert loved["lemma"] == "ἀγαπάω" and loved["gloss"] == "to love"
    assert loved["grammar"] == "verb · simple past · he/she/it"
    assert loved["parsing"] == "Verb - Aorist Indicative Active - 3rd Person Singular"
    only = next(w for w in words if w["english"] == "one and only")
    assert "only begotten" in only["footnote"]
    assert any(w["english_kind"] == "untranslated" and w["english"] is None for w in words)


def test_words_accepts_book_aliases_and_case(client):
    a = client.get("/api/v1/words/john/3/16").json()
    b = client.get("/api/v1/words/43/3/16").json()
    assert a["words"] == b["words"] and a["book"] == "John"


def test_words_hebrew_genesis_1_1(client):
    words = client.get("/api/v1/words/Genesis/1/1").json()["words"]
    created = next(w for w in words if w["english"] == "created")
    assert created["language"] == "hebrew" and created["strongs"] == "H1254"
    assert created["grammar"] == "verb · completed action · he"
    assert created["lemma"] == "בָּרָא"


def test_words_verse_without_alignment(client):
    # Omitted by BSB but present in WEB: a real verse with no aligned words.
    r = client.get("/api/v1/words/Matthew/17/21")
    assert r.status_code == 200 and r.json()["words"] == []
    # English-only in BSB.
    r = client.get("/api/v1/words/Nehemiah/7/68")
    assert r.status_code == 200 and r.json()["words"] == []


@pytest.mark.parametrize("path", [
    "/api/v1/words/Nobook/1/1",
    "/api/v1/words/John/3/99",
    "/api/v1/words/John/22/1",
    "/api/v1/words/John/0/1",
])
def test_words_not_found(client, path):
    assert client.get(path).status_code == 404


# ── GET /api/v1/lexicon/{strongs} ────────────────────────────────────────────

def test_lexicon_agapao(client):
    r = client.get("/api/v1/lexicon/G0025")
    assert r.status_code == 200
    body = r.json()
    assert set(body) == {
        "strongs", "language", "lemma", "translit", "gloss", "definition",
        "occurrences", "verse_count", "references", "source",
    }
    assert body["strongs"] == "G0025" and body["lemma"] == "ἀγαπάω" and body["gloss"] == "to love"
    assert body["language"] == "greek"
    assert body["occurrences"] == 143 and body["verse_count"] == 110
    refs = body["references"]
    assert len(refs) == 20
    assert refs[0] == {"book": "Matthew", "book_number": 40, "chapter": 5, "verse": 43}
    keys = [(r["book_number"], r["chapter"], r["verse"]) for r in refs]
    assert keys == sorted(set(keys))
    assert "STEP" in body["source"] and "CC BY" in body["source"]
    assert "<" not in body["definition"]


@pytest.mark.parametrize("raw", ["G25", "g0025", "G025", "G0025a"])
def test_lexicon_normalises_ids(client, raw):
    r = client.get(f"/api/v1/lexicon/{raw}")
    assert r.status_code == 200 and r.json()["strongs"] == "G0025"


def test_lexicon_hebrew_and_suffix_key(client):
    god = client.get("/api/v1/lexicon/H430").json()
    assert god["strongs"] == "H0430" and god["gloss"] == "God" and god["language"] == "hebrew"
    red = client.get("/api/v1/lexicon/H0122").json()
    assert red["gloss"] == "red"


def test_lexicon_common_word_is_fast_enough(client):
    import time

    start = time.perf_counter()
    r = client.get("/api/v1/lexicon/G3588")  # the article: about 20,000 occurrences
    assert r.status_code == 200 and r.json()["occurrences"] > 19000
    assert time.perf_counter() - start < 0.5


@pytest.mark.parametrize("raw", ["X0025", "G", "G99999", "H0000", "G0025;drop", "430"])
def test_lexicon_not_found(client, raw):
    assert client.get(f"/api/v1/lexicon/{raw}").status_code == 404


# ── Plain-English grammar ────────────────────────────────────────────────────

GRAMMAR = [
    ("hebrew", "Verb - Qal - Perfect - third person masculine singular", "verb · completed action · he"),
    ("hebrew", "Conjunctive waw | Verb - Qal - Consecutive imperfect - third person masculine singular",
     "and + verb · past narrative · he"),
    ("hebrew", "Verb - Hifil - Imperfect - third person masculine plural",
     "verb · causes it to happen · ongoing or future action · they"),
    ("hebrew", "Verb - Nifal - Perfect - third person masculine singular",
     "verb · passive or reflexive · completed action · he"),
    ("hebrew", "Verb - Qal - Participle - masculine singular", "verb · “-ing” form · singular"),
    ("hebrew", "Preposition-l | Verb - Qal - Infinitive construct", "to/for + verb · “to” form"),
    ("hebrew", "Noun - masculine singular construct", "noun · singular · “of” form"),
    ("hebrew", "Article | Noun - masculine plural", "the + noun · plural"),
    ("hebrew", "Preposition-b, Article | Noun - masculine singular", "in/with + the + noun · singular"),
    ("hebrew", "Noun - masculine singular construct | third person masculine singular",
     "noun · singular · “of” form + him/his"),
    ("hebrew", "Noun - proper - masculine singular", "name"),
    ("hebrew", "Direct object marker", "object marker (not translated)"),
    ("hebrew", "Adverb - Negative particle", "not"),
    ("hebrew", "Noun - fd", "noun · pair"),
    ("greek", "Verb - Aorist Indicative Active - 3rd Person Singular", "verb · simple past · he/she/it"),
    ("greek", "Verb - Aorist Imperative Active - 2nd Person Plural", "verb · simple · command · you all"),
    ("greek", "Verb - Present Participle Middle or Passive - Nominative Masculine Plural",
     "verb · ongoing · “-ing” form · for oneself or done to the subject"),
    ("greek", "Noun - Genitive Feminine Singular", "noun · “of” (genitive) · singular"),
    ("greek", "Personal / Possessive Pronoun - Genitive Masculine 3rd Person Singular",
     "pronoun · “of” (genitive) · he/she/it"),
    ("greek", "Article - Nominative Masculine Singular", "the"),
    ("greek", "Conjunction", "joining word"),
]


@pytest.mark.parametrize("language,parsing,expected", GRAMMAR)
def test_plain_grammar_examples(language, parsing, expected):
    from app.services.word_service import plain_grammar

    assert plain_grammar(language, parsing) == expected


def test_plain_grammar_never_loses_a_word(client):
    """Every distinct parsing in the data gets a non-empty phrase; unknown parts fall back to lowercase text."""
    import sqlite3

    from app.services.word_service import plain_grammar

    con = sqlite3.connect(f"file:{DB_PATH.as_posix()}?mode=ro", uri=True)
    rows = con.execute("SELECT DISTINCT language, parsing FROM bsb_words WHERE parsing IS NOT NULL AND parsing != ''").fetchall()
    assert len(rows) > 3000
    for language, parsing in rows:
        out = plain_grammar(language, parsing)
        assert out and out.strip() == out, (language, parsing, out)
        assert " - " not in out and "  " not in out, (language, parsing, out)
    assert plain_grammar("greek", "") is None
    assert plain_grammar("hebrew", "Verb - Qal - Perfect - third person masculine singular | Paragogic nun").endswith("+ paragogic nun")
