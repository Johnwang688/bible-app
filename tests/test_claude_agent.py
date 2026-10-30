"""Acceptance tests for W3-A: Claude chat path with tools (fake client, real content DB). Owned by the orchestrator: do not edit."""

from __future__ import annotations

import asyncio
import json
from pathlib import Path
from types import SimpleNamespace

import pytest

REPO = Path(__file__).resolve().parents[1]
DB_PATH = REPO / "build" / "content.sqlite"


@pytest.fixture(scope="session", autouse=True)
def content_db():
    if not DB_PATH.exists():
        from scripts.build_content import build

        build(REPO / "content" / "source", DB_PATH)


# ── Fake Anthropic client ─────────────────────────────────────────────────────

def text_block(text):
    return SimpleNamespace(type="text", text=text)


def thinking_block():
    return SimpleNamespace(type="thinking", thinking="", signature="sig-123")


def tool_use(id_, name, input_):
    return SimpleNamespace(type="tool_use", id=id_, name=name, input=input_)


def final_json(message="Answer.", references=("John 3:16",), follow_ups=("What does verse 17 add?",)):
    return json.dumps({"message": message, "references": list(references), "suggested_follow_ups": list(follow_ups)})


def response(content, stop_reason="end_turn", input_tokens=1200, output_tokens=150):
    return SimpleNamespace(
        content=content,
        stop_reason=stop_reason,
        stop_details=None,
        usage=SimpleNamespace(
            input_tokens=input_tokens, output_tokens=output_tokens,
            cache_read_input_tokens=0, cache_creation_input_tokens=0,
        ),
        model="claude-haiku-5-5",
    )


class FakeMessages:
    def __init__(self, script):
        self.script = list(script)
        self.calls: list[dict] = []

    async def create(self, **kwargs):
        # Snapshot messages: the agent may append to its list after the call.
        snap = dict(kwargs)
        snap["messages"] = [dict(m) if isinstance(m, dict) else m for m in kwargs.get("messages", [])]
        self.calls.append(snap)
        item = self.script.pop(0) if len(self.script) > 1 else self.script[0]
        if isinstance(item, Exception):
            raise item
        return item(snap) if callable(item) else item


class FakeClient:
    def __init__(self, script):
        self.messages = FakeMessages(script)


@pytest.fixture
def settings(monkeypatch):
    from app.core import config
    from app.services import ai_service, claude_agent

    s = config.get_settings().model_copy(update={
        "ai_provider": "anthropic", "anthropic_api_key": "test-key", "claude_model": "claude-haiku-5-5",
        "ai_max_input_tokens": 100_000, "ai_max_tool_rounds": 6,
    })
    for mod in (config, ai_service, claude_agent):
        monkeypatch.setattr(mod, "get_settings", lambda s=s: s)
    return s


def use_fake(monkeypatch, script):
    from app.services import claude_agent

    fake = FakeClient(script)
    monkeypatch.setattr(claude_agent, "get_claude_client", lambda: fake)
    return fake


def payload(message="What does John 3:16 mean?", history=()):
    from app.schemas.ai import AIChatRequest

    return AIChatRequest(
        message=message,
        context={"book": "John", "chapter": 3, "translation": "WEB"},
        conversation_history=[{"role": r, "content": c} for r, c in history],
    )


def chat(p):
    from app.services.ai_service import chat_with_ai

    return asyncio.run(chat_with_ai(p))


def tool_results(call):
    """All tool_result blocks in the last user message of a request."""
    last = call["messages"][-1]
    assert last["role"] == "user"
    return [b for b in last["content"] if isinstance(b, dict) and b.get("type") == "tool_result"]


def _httpx():
    """anthropic 1.x is built on httpx2; older SDKs on httpx."""
    try:
        import httpx2

        return httpx2
    except ImportError:  # pragma: no cover
        import httpx

        return httpx


# ── Tests ─────────────────────────────────────────────────────────────────────

def test_provider_switch_routes_to_claude(settings, monkeypatch):
    fake = use_fake(monkeypatch, [response([text_block(final_json())])])
    out = chat(payload())
    assert len(fake.messages.calls) == 1
    assert out.message == "Answer."
    assert out.references == ["John 3:16"]
    assert out.context_label


def test_openai_stays_default(monkeypatch):
    from app.core import config

    assert config.Settings.model_fields["ai_provider"].default == "openai"


def test_request_shape(settings, monkeypatch):
    fake = use_fake(monkeypatch, [response([text_block(final_json())])])
    chat(payload())
    call = fake.messages.calls[0]
    assert call["model"] == "claude-haiku-5-5"
    assert call["output_config"]["effort"] == "low"
    fmt = call["output_config"]["format"]
    assert fmt["type"] == "json_schema"
    assert set(fmt["schema"]["required"]) >= {"message", "references", "suggested_follow_ups"}
    for banned in ("temperature", "top_p", "top_k"):
        assert banned not in call
    names = {t["name"] for t in call["tools"]}
    assert names >= {"get_passage", "search_scripture", "get_commentary", "lookup_entity", "navigate", "open_commentary"}
    for t in call["tools"]:
        assert t.get("strict") is True
        assert t["input_schema"].get("additionalProperties") is False
    system = call["system"]
    assert isinstance(system, list) and system[-1].get("cache_control") == {"type": "ephemeral"}
    assert call["messages"][-1]["role"] == "user"
    assert call.get("tool_choice", {"type": "auto"}) == {"type": "auto"}
    # Active chapter text is sent up front so simple questions need no tool round.
    flat = json.dumps([call["system"], call["messages"]], ensure_ascii=False, default=str)
    assert "For God so loved the world" in flat


def test_tool_loop_passes_back_content_and_results(settings, monkeypatch):
    first = response(
        [thinking_block(), tool_use("tu_1", "get_passage", {"reference": "Romans 8:28", "translation": None})],
        stop_reason="tool_use",
    )
    fake = use_fake(monkeypatch, [first, response([text_block(final_json(references=["Romans 8:28"]))])])
    out = chat(payload("How does Romans 8:28 connect to this?"))
    assert len(fake.messages.calls) == 2
    second = fake.messages.calls[1]
    assistant = second["messages"][-2]
    assert assistant["role"] == "assistant"
    assert assistant["content"] is first.content or assistant["content"] == first.content  # unchanged, thinking kept
    results = tool_results(second)
    assert len(results) == 1 and results[0]["tool_use_id"] == "tu_1"
    body = results[0]["content"] if isinstance(results[0]["content"], str) else json.dumps(results[0]["content"])
    assert "work together for good" in body
    assert out.references == ["Romans 8:28"]
    # tools and system identical across rounds (thinking blocks stay valid)
    assert second["tools"] == fake.messages.calls[0]["tools"]
    assert second["system"] == fake.messages.calls[0]["system"]


def test_parallel_tool_calls_answered_in_one_message(settings, monkeypatch):
    first = response([
        tool_use("a", "search_scripture", {"query": "born again", "translation": None, "book": None}),
        tool_use("b", "get_commentary", {"book": "John", "chapter": 3, "verse": None}),
        tool_use("c", "lookup_entity", {"kind": "person", "name": "Nicodemus"}),
    ], stop_reason="tool_use")
    fake = use_fake(monkeypatch, [first, response([text_block(final_json())])])
    chat(payload("Who was Nicodemus?"))
    results = tool_results(fake.messages.calls[1])
    assert [r["tool_use_id"] for r in results] == ["a", "b", "c"]
    assert sum(1 for m in fake.messages.calls[1]["messages"] if m["role"] == "user") == \
        sum(1 for m in fake.messages.calls[0]["messages"] if m["role"] == "user") + 1


def test_navigate_tool_becomes_action(settings, monkeypatch):
    first = response([tool_use("n1", "navigate", {
        "book": "Romans", "chapter": 8, "verse_start": 28, "verse_end": 30, "label": "Read Romans 8:28-30"})],
        stop_reason="tool_use")
    fake = use_fake(monkeypatch, [first, response([text_block(final_json())])])
    out = chat(payload("Take me to Romans 8"))
    assert len(out.actions) == 1
    a = out.actions[0]
    assert a.type.value == "navigate" and a.params.book == "Romans" and a.params.chapter == 8
    assert a.params.verse_start == 28 and a.label == "Read Romans 8:28-30"
    assert "button" in json.dumps(tool_results(fake.messages.calls[1])).lower()


def test_bad_tool_input_is_reported_not_raised(settings, monkeypatch):
    first = response([tool_use("x", "get_passage", {"reference": "Hezekiah 99:1", "translation": None})],
                     stop_reason="tool_use")
    fake = use_fake(monkeypatch, [first, response([text_block(final_json())])])
    out = chat(payload())
    r = tool_results(fake.messages.calls[1])[0]
    assert r.get("is_error") is True
    assert out.message == "Answer."


def test_unknown_tool_is_error_result(settings, monkeypatch):
    first = response([tool_use("u", "delete_everything", {})], stop_reason="tool_use")
    fake = use_fake(monkeypatch, [first, response([text_block(final_json())])])
    chat(payload())
    assert tool_results(fake.messages.calls[1])[0].get("is_error") is True


def test_round_cap_forces_an_answer(settings, monkeypatch):
    looping = response([tool_use("loop", "search_scripture", {"query": "love", "translation": None, "book": None})],
                       stop_reason="tool_use")

    def final_if_no_tools(call):
        if call.get("tool_choice") == {"type": "none"}:
            return response([text_block(final_json(message="Wrapped up."))])
        return looping

    fake = use_fake(monkeypatch, [final_if_no_tools])
    out = chat(payload())
    calls = fake.messages.calls
    assert len(calls) <= settings.ai_max_tool_rounds + 1
    assert calls[-1].get("tool_choice") == {"type": "none"}
    assert calls[-1]["tools"] == calls[0]["tools"]
    assert out.message == "Wrapped up."


def test_input_budget_forces_final_round(settings, monkeypatch):
    big = response([tool_use("s", "get_commentary", {"book": "Psalms", "chapter": 119, "verse": None})],
                   stop_reason="tool_use", input_tokens=96_000)
    fake = use_fake(monkeypatch, [big, response([text_block(final_json())])])
    chat(payload())
    assert fake.messages.calls[1].get("tool_choice") == {"type": "none"}


def test_tool_results_are_capped(settings, monkeypatch):
    first = response([tool_use("p", "get_passage", {"reference": "Psalms 119", "translation": None})],
                     stop_reason="tool_use")
    fake = use_fake(monkeypatch, [first, response([text_block(final_json())])])
    chat(payload())
    r = tool_results(fake.messages.calls[1])[0]
    body = r["content"] if isinstance(r["content"], str) else json.dumps(r["content"], ensure_ascii=False)
    assert len(body) <= 24_000 + 200


def test_refusal_returns_gentle_message(settings, monkeypatch):
    use_fake(monkeypatch, [response([], stop_reason="refusal")])
    out = chat(payload("something the classifier declines"))
    assert out.message and out.references == [] and out.actions == []


def test_invalid_final_json_falls_back(settings, monkeypatch):
    use_fake(monkeypatch, [response([text_block("not json at all")])])
    out = chat(payload())
    assert out.message  # default fallback, no exception


def test_api_errors_become_service_unavailable(settings, monkeypatch):
    import anthropic

    from app.services.ai_service import AIServiceUnavailable

    httpx = _httpx()

    req = httpx.Request("POST", "https://api.anthropic.com/v1/messages")
    err = anthropic.APIStatusError("overloaded", response=httpx.Response(529, request=req), body=None)
    use_fake(monkeypatch, [err])
    with pytest.raises(AIServiceUnavailable):
        chat(payload())


def test_endpoint_returns_503_on_api_error(settings, monkeypatch):
    import anthropic
    from fastapi.testclient import TestClient

    httpx = _httpx()

    from app.main import app
    from app.services import ai_service

    ai_service.reset_rate_limit_state()
    req = httpx.Request("POST", "https://api.anthropic.com/v1/messages")
    use_fake(monkeypatch, [anthropic.APIConnectionError(request=req)])
    resp = TestClient(app).post("/api/v1/ai/chat", json={
        "message": "hi", "context": {"book": "John", "chapter": 3, "translation": "WEB"}})
    assert resp.status_code == 503


def test_history_is_plain_text_and_trimmed(settings, monkeypatch):
    fake = use_fake(monkeypatch, [response([text_block(final_json())])])
    hist = [("user", f"q{i}") if i % 2 == 0 else ("assistant", f"a{i}") for i in range(40)]
    chat(payload(history=hist))
    msgs = fake.messages.calls[0]["messages"]
    assert len(msgs) < 30
    for m in msgs[:-1]:
        assert isinstance(m["content"], (str, list))
    roles = [m["role"] for m in msgs]
    assert roles[0] == "user" and roles[-1] == "user"
    assert all(a != b or a == "system" for a, b in zip(roles, roles[1:]))  # alternating


def test_roleplay_guard_still_applies(settings, monkeypatch):
    fake = use_fake(monkeypatch, [response([text_block(final_json())])])
    from app.services.ai_service import asks_for_disallowed_roleplay

    msg = "Pretend you are Jesus and speak as him"
    if asks_for_disallowed_roleplay(msg):
        chat(payload(msg))
        assert fake.messages.calls == []


def test_vertex_provider_builds_vertex_client(settings, monkeypatch):
    from app.services import claude_agent

    built = {}

    class FakeVertex:
        def __init__(self, **kw):
            built.update(kw)

    monkeypatch.setattr(claude_agent, "AsyncAnthropicVertex", FakeVertex)
    s = settings.model_copy(update={"ai_provider": "vertex", "vertex_project_id": "my-proj", "vertex_region": "global"})
    monkeypatch.setattr(claude_agent, "get_settings", lambda: s)
    claude_agent.reset_claude_client()
    claude_agent.get_claude_client()
    assert built == {"project_id": "my-proj", "region": "global"}


def test_usage_is_logged_with_cost(settings, monkeypatch, caplog):
    use_fake(monkeypatch, [response([text_block(final_json())], input_tokens=10_000, output_tokens=1_000)])
    with caplog.at_level("INFO"):
        chat(payload())
    line = " ".join(r.getMessage() for r in caplog.records)
    assert "input_tokens=10000" in line and "output_tokens=1000" in line and "cost_usd=" in line


def test_entity_and_guided_text_use_claude_when_enabled(settings, monkeypatch):
    from app.services import ai_service

    fake = use_fake(monkeypatch, [response([text_block("Plain text answer.")])])
    out = asyncio.run(ai_service.generate_entity_text("Describe Nicodemus.", max_tokens=500))
    assert out == "Plain text answer."
    assert fake.messages.calls and "output_config" in fake.messages.calls[0]
    assert "format" not in fake.messages.calls[0]["output_config"]
