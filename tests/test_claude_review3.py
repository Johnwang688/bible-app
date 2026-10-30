"""Regression test from the verifier re-check (W3-A round 3). Owned by the orchestrator: do not edit."""

import asyncio

import pytest

from app.services import claude_agent


@pytest.mark.parametrize("tool", ["navigate", "open_commentary"])
def test_missing_reader_chapter_is_error(monkeypatch, tool):
    monkeypatch.setattr(
        claude_agent, "fetch_one", lambda *a, **kw: {"last": None}
    )
    runner = claude_agent.ToolRunner("WEB")
    text, is_error = asyncio.run(runner.run(tool, {
        "book": "John",
        "chapter": 3,
        "label": "Read John 3",
    }))

    assert is_error, text
    assert text.strip()
    assert runner.actions == []
