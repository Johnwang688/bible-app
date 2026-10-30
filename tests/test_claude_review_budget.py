"""Regression test from the verifier review (W3-A). Owned by the orchestrator: do not edit."""

from tests.test_claude_agent import (
    settings, content_db, use_fake, response, tool_use,
    text_block, final_json, chat, payload,
)


def test_zero_tool_rounds_is_one_call(settings, monkeypatch):
    from app.services import claude_agent

    limited = settings.model_copy(update={"ai_max_tool_rounds": 0})
    monkeypatch.setattr(claude_agent, "get_settings", lambda: limited)

    def answer_or_tool(call):
        if call.get("tool_choice") == {"type": "none"}:
            return response([text_block(final_json())])
        return response([
            tool_use("s", "search_scripture", {
                "query": "love",
                "translation": None,
                "book": None,
            }),
        ], stop_reason="tool_use")

    fake = use_fake(monkeypatch, [answer_or_tool])
    chat(payload())

    assert len(fake.messages.calls) <= limited.ai_max_tool_rounds + 1
    assert fake.messages.calls[0].get("tool_choice") == {"type": "none"}
