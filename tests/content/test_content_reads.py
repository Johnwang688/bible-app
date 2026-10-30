"""Acceptance tests for W1-B: content reads served from build/content.sqlite. Owned by the orchestrator: do not edit.

These run offline. Any attempt to create a Supabase client during a content read fails the test.
"""

from __future__ import annotations

import json
import re
import threading
from pathlib import Path

import pytest
from fastapi.testclient import TestClient

REPO = Path(__file__).resolve().parents[2]
DB_PATH = REPO / "build" / "content.sqlite"
FIXTURES = REPO / "tests" / "golden" / "fixtures"
PARITY = json.loads((REPO / "tests" / "content" / "search_parity.json").read_text(encoding="utf-8"))

# Golden fixtures W1 is allowed to change, each checked by a dedicated test below.
ALLOWED_GOLDEN_CHANGES = {
    "search_love_web", "search_two_words", "search_love_in_john", "search_jerusalem_asv",
    "search_chinese_cuv", "search_chinese_cuvsimp", "search_no_results",
    "entities_theme",  # Postgres REST capped the list at 1000 rows
    "verse_missing",   # returned 500; must now be 404
}


@pytest.fixture(scope="session", autouse=True)
def content_db() -> Path:
    if not DB_PATH.exists():
        from scripts.build_content import build

        build(REPO / "content" / "source", DB_PATH)
    return DB_PATH


@pytest.fixture(autouse=True)
def no_supabase(monkeypatch):
    import app.core.supabase_client as sc

    def refuse(*_args, **_kwargs):
        raise AssertionError("Supabase must not be used for content reads")

    monkeypatch.setattr(sc, "create_client", refuse)
    monkeypatch.setattr(sc, "_supabase_client", None)
    monkeypatch.setattr(sc, "_supabase_admin", None)


@pytest.fixture
def client():
    from app.main import app
    from app.services import ai_service

    ai_service.reset_rate_limit_state()
    return TestClient(app)


def _send(client, entry):
    kwargs = {}
    if entry.get("params"):
        kwargs["params"] = entry["params"]
    if entry.get("json") is not None:
        kwargs["json"] = entry["json"]
    resp = client.request(entry["method"], entry["path"], **kwargs)
    return resp.status_code, resp.json()


def _first_difference(expected, actual, path="body"):
    if type(expected) is not type(actual):
        return f"{path}: expected {expected!r}, got {actual!r}"
    if isinstance(expected, dict):
        for key in sorted(set(expected) | set(actual)):
            if key not in actual:
                return f"{path}.{key}: missing"
            if key not in expected:
                return f"{path}.{key}: unexpected"
            found = _first_difference(expected[key], actual[key], f"{path}.{key}")
            if found:
                return found
        return None
    if isinstance(expected, list):
        if len(expected) != len(actual):
            return f"{path}: expected {len(expected)} items, got {len(actual)}"
        for i, (e, a) in enumerate(zip(expected, actual)):
            found = _first_difference(e, a, f"{path}[{i}]")
            if found:
                return found
        return None
    return None if expected == actual else f"{path}: expected {expected!r}, got {actual!r}"


def _fixture(name):
    return json.loads((FIXTURES / f"{name}.json").read_text(encoding="utf-8"))


GOLDEN_NAMES = sorted(p.stem for p in FIXTURES.glob("*.json"))


@pytest.mark.parametrize("name", [n for n in GOLDEN_NAMES if n not in ALLOWED_GOLDEN_CHANGES])
def test_golden_unchanged_without_supabase(client, name):
    fx = _fixture(name)
    status, body = _send(client, fx["request"])
    assert status == fx["status"], f"{name}: status {status} != {fx['status']}"
    diff = _first_difference(fx["body"], body)
    assert diff is None, f"{name}: {diff}"


def test_verse_missing_is_404(client):
    status, body = _send(client, _fixture("verse_missing")["request"])
    assert status == 404
    assert body == {"detail": "Verse not found"}


def test_theme_list_is_complete_and_keeps_postgres_order(client):
    import sqlite3

    fx = _fixture("entities_theme")
    # The first 1000 rows exactly as Postgres returned them (frozen before the fixture was re-recorded).
    postgres_first_1000 = json.loads(
        (REPO / "tests" / "content" / "entities_theme_postgres_first1000.json").read_text(encoding="utf-8"))["body"]
    status, body = _send(client, fx["request"])
    assert status == 200
    con = sqlite3.connect(DB_PATH)
    total = con.execute("SELECT COUNT(*) FROM summary_entities WHERE kind='theme'").fetchone()[0]
    assert total > 1000
    assert len(body) == total
    # The capped Postgres list was the first 1000 rows in label order: same collation, same prefix.
    assert len(postgres_first_1000) == 1000
    assert body[:1000] == postgres_first_1000
    assert body == fx["body"]


def _refs(results):
    return [(r["verse"]["book_number"], r["verse"]["chapter"], r["verse"]["verse"]) for r in results]


@pytest.mark.parametrize("q", PARITY["queries"], ids=lambda q: f"{q['query']}-{q['translation']}-{q['book_number']}")
def test_search_match_set_parity_with_postgres(q):
    from app.services.bible_service import find_verse_matches

    got = set(map(tuple, find_verse_matches(q["query"], q["translation"], q["book_number"])))
    want = set(map(tuple, q["matches"]))
    jaccard = len(got & want) / max(1, len(got | want))
    assert jaccard >= 0.95, (
        f"{q['query']!r}: jaccard {jaccard:.3f}; missing {sorted(want - got)[:5]}, extra {sorted(got - want)[:5]}"
    )


def test_search_parity_overall():
    from app.services.bible_service import find_verse_matches

    inter = union = 0
    for q in PARITY["queries"]:
        got = set(map(tuple, find_verse_matches(q["query"], q["translation"], q["book_number"])))
        want = set(map(tuple, q["matches"]))
        inter += len(got & want)
        union += len(got | want)
    assert inter / union >= 0.97


@pytest.mark.parametrize("name", sorted(n for n in ALLOWED_GOLDEN_CHANGES if n.startswith("search_")))
def test_search_responses_keep_shape_and_counts(client, name):
    fx = _fixture(name)
    status, body = _send(client, fx["request"])
    assert status == 200
    assert len(body) == len(fx["body"]), f"{name}: {len(body)} results, fixture had {len(fx['body'])}"
    if body:
        assert set(body[0]) == set(fx["body"][0])
        assert set(body[0]["verse"]) == set(fx["body"][0]["verse"])
    # Every result is the real verse text.
    from app.core.book_catalog import BOOK_BY_NUMBER

    req = fx["request"]["json"]
    for r in body:
        v = r["verse"]
        book = BOOK_BY_NUMBER[v["book_number"]]["name"]
        st, verse = _send(client, {"method": "GET", "path": f"/api/v1/verses/{book}/{v['chapter']}/{v['verse']}",
                                   "params": {"translation": req["translation"]}})
        assert st == 200 and verse["text"] == v["text"]
        if req.get("book"):
            assert v["book_number"] == 43


def test_search_ranked_order_is_deterministic(client):
    req = {"method": "POST", "path": "/api/v1/search", "json": {"query": "love", "translation": "WEB", "limit": 20}}
    s1, b1 = _send(client, req)
    s2, b2 = _send(client, req)
    assert s1 == s2 == 200 and b1 == b2 and len(b1) == 20
    keys = [(-r["relevance"], r["verse"]["book_number"], r["verse"]["chapter"], r["verse"]["verse"]) for r in b1]
    assert all(isinstance(r["relevance"], float) for r in b1)
    assert keys == sorted(keys), "rank desc, then book/chapter/verse asc"
    love = next(q for q in PARITY["queries"] if q["query"] == "love")
    assert set(_refs(b1)) <= set(map(tuple, love["matches"]))


def test_chinese_four_char_phrase_finds_john_3_16(client):
    for translation, query in (("CUV-SIMP", "神爱世人"), ("CUV", "神愛世人")):
        status, body = _send(client, {"method": "POST", "path": "/api/v1/search",
                                      "json": {"query": query, "translation": translation, "limit": 10}})
        assert status == 200
        assert _refs(body)[0] == (43, 3, 16), translation


def test_chinese_two_char_query_uses_substring_match(client):
    status, body = _send(client, {"method": "POST", "path": "/api/v1/search",
                                  "json": {"query": "耶稣", "translation": "CUV-SIMP", "limit": 10}})
    assert status == 200
    assert len(body) == 10
    assert all("耶稣" in r["verse"]["text"] for r in body)


@pytest.mark.parametrize("query", ['love" OR "', "NEAR(love grace)", "love*", "-love", "(", '"', "AND", "神 爱"])
def test_search_never_errors_on_operator_characters(client, query):
    status, body = _send(client, {"method": "POST", "path": "/api/v1/search",
                                  "json": {"query": query, "translation": "WEB", "limit": 5}})
    assert status == 200, query
    assert isinstance(body, list)


def test_blank_query_returns_empty(client):
    status, body = _send(client, {"method": "POST", "path": "/api/v1/search",
                                  "json": {"query": "   ", "translation": "WEB", "limit": 5}})
    assert status == 200 and body == []


def test_content_db_helpers_decode_json_columns():
    from app.core.content_db import fetch_all, fetch_one

    row = fetch_one("SELECT choices_json FROM quiz_question_bank WHERE id = ?", (133,))
    assert isinstance(row["choices_json"], list)
    rows = fetch_all("SELECT slug, profile FROM summary_entities WHERE kind = ? AND profile IS NOT NULL LIMIT 3", ("person",))
    assert rows and all(isinstance(r["profile"], (dict, list)) for r in rows)
    assert fetch_one("SELECT * FROM books WHERE book_number = ?", (999,)) is None


def test_content_db_is_safe_across_threads():
    from app.core.content_db import fetch_one

    errors: list[BaseException] = []

    def work():
        try:
            for _ in range(50):
                assert fetch_one("SELECT COUNT(*) AS n FROM books")["n"] == 66
        except BaseException as exc:  # noqa: BLE001
            errors.append(exc)

    threads = [threading.Thread(target=work) for _ in range(16)]
    for t in threads:
        t.start()
    for t in threads:
        t.join()
    assert not errors, errors[0]


def test_content_db_is_read_only():
    import sqlite3

    from app.core.content_db import fetch_all

    with pytest.raises(sqlite3.OperationalError):
        fetch_all("DELETE FROM books")


def test_translations_endpoint_from_content_db(client):
    status, body = _send(client, {"method": "GET", "path": "/api/v1/translations"})
    assert status == 200
    assert [t["id"] for t in body] == sorted(t["id"] for t in body)
    assert {"id", "name", "language", "license"} == set(body[0])


def test_no_supabase_in_ported_read_paths():
    src = {p: (REPO / p).read_text(encoding="utf-8") for p in (
        "app/services/bible_service.py", "app/services/commentary_service.py")}
    for path, text in src.items():
        assert not re.search(r"\bget_supabase(_admin)?\b", text), f"{path} still uses Supabase"
