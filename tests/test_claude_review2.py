"""Regression tests from the verifier re-check (W3-A round 2). Owned by the orchestrator: do not edit."""

import asyncio
import pytest
from app.core.content_db import fetch_one
from app.services.claude_agent import ToolRunner
from tests.test_claude_agent import content_db
from tests.test_claude_agent import (
    settings, content_db, use_fake, response, tool_use,
    text_block, final_json, chat, payload,
)


@pytest.mark.parametrize("translation", ["WEB", "ASV"])
def test_navigation_uses_reader_translation(translation):
    row = fetch_one(
        "SELECT MAX(verse) AS last FROM verses "
        "WHERE translation = ? AND book_number = 64 AND chapter = 1",
        (translation,),
    )
    assert row["last"] == 14

    runner = ToolRunner(translation)
    text, is_error = asyncio.run(runner.run("navigate", {
        "book": "3 John",
        "chapter": 1,
        "verse_start": 15,
        "verse_end": 15,
        "label": "Read verse 15",
    }))

    assert is_error, text
    assert runner.actions == []


CHINESE_JOHN = "".join(map(chr, [0x7ea6, 0x7ff0, 0x798f, 0x97f3]))


@pytest.mark.parametrize("active_book", ["John", "john", CHINESE_JOHN])
def test_same_passage_commentary_stays_commentary(
    settings, monkeypatch, active_book
):
    use_fake(monkeypatch, [
        response([tool_use("c", "open_commentary", {
            "book": "John",
            "chapter": 3,
            "label": "John 3 notes",
        })], stop_reason="tool_use"),
        response([text_block(final_json())]),
    ])

    request = payload()
    request.context.book = active_book
    out = chat(request)

    assert len(out.actions) == 1
    assert out.actions[0].type.value == "open_commentary"
    assert out.actions[0].label == "John 3 notes"
