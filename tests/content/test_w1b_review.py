"""Regression tests from the verifier review (W1-B). Owned by the orchestrator: do not edit."""

from app.main import app
from app.services import bible_service as bs
from app.services.bible_service import search_verses
from contextlib import closing
from fastapi.testclient import TestClient
import asyncio
import sqlite3


def test_many_stop_words_never_raise():
    response = TestClient(app, raise_server_exceptions=False).post(
        "/api/v1/search",
        json={"query": "and " * 1000, "translation": "WEB", "limit": 5},
    )
    assert response.status_code == 200, response.text
    assert isinstance(response.json(), list)


def test_nul_matches_nothing():
    rows = asyncio.run(search_verses("\x00", "WEB", limit=5))
    assert rows == []


def test_unicode_substring_casefold(monkeypatch):
    with closing(sqlite3.connect(":memory:")) as con:
        con.row_factory = sqlite3.Row
        con.execute(
            "CREATE TABLE verses("
            "id INTEGER, translation TEXT, book_number INTEGER, "
            "chapter INTEGER, verse INTEGER, text TEXT)"
        )
        con.execute(
            "INSERT INTO verses VALUES(1, ?, 1, 1, 1, ?)",
            ("CUV-SIMP", "\u00c9den"),
        )
        monkeypatch.setattr(bs, "_translation_language", lambda _: "zh")
        monkeypatch.setattr(
            bs, "fetch_all",
            lambda sql, params=(): [
                dict(row) for row in con.execute(sql, params)
            ],
        )

        rows = asyncio.run(bs.search_verses("\u00e9", "CUV-SIMP"))
        assert [row.verse.id for row in rows] == [1]


def test_fallback_requires_every_term():
    terms = ["\u8036\u7a23", "\u65bd\u6d17"]  # 耶稣 施洗
    rows = asyncio.run(
        search_verses(" ".join(terms), "CUV-SIMP", limit=10)
    )
    assert rows
    assert all(
        all(term in row.verse.text for term in terms)
        for row in rows
    )
