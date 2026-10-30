"""Regression test from the verifier review (W3-A). Owned by the orchestrator: do not edit."""

import asyncio

from tests.test_claude_agent import content_db
from app.services.claude_agent import ToolRunner


def test_search_contains_actual_scripture():
    text, is_error = asyncio.run(
        ToolRunner("WEB").run("search_scripture", {
            "query": "Nicodemus",
            "translation": "WEB",
            "book": "John",
        })
    )

    assert not is_error
    assert "John 3:1" in text
    assert "ruler of the Jews" in text
