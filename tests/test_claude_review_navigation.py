"""Regression test from the verifier review (W3-A). Owned by the orchestrator: do not edit."""

import asyncio

from app.services.claude_agent import ToolRunner


def test_invalid_navigation_is_error():
    runner = ToolRunner("WEB")

    text, is_error = asyncio.run(runner.run("navigate", {
        "book": "John",
        "chapter": -1,
        "verse_start": None,
        "verse_end": None,
        "label": "Read passage",
    }))

    assert is_error
    assert runner.actions == []
