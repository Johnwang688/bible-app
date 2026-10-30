"""Regression test from the verifier review (W3-A). Owned by the orchestrator: do not edit."""

from tests.test_claude_agent import (
    settings, content_db, use_fake, response, tool_use,
    text_block, final_json, chat, payload,
)


def test_commentary_target_survives_validation(settings, monkeypatch):
    use_fake(monkeypatch, [
        response([
            tool_use("c", "open_commentary", {
                "book": "Romans",
                "chapter": 8,
                "label": "Romans 8 commentary",
            }),
        ], stop_reason="tool_use"),
        response([text_block(final_json())]),
    ])

    out = chat(payload())  # Active passage: John 3.
    assert len(out.actions) == 1
    action = out.actions[0]
    assert (action.params.book, action.params.chapter) == ("Romans", 8)
