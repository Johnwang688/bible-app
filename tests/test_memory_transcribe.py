"""Acceptance (orchestrator-owned): the Memory section's voice transcription proxy.

Ported from Little Lamb's /api/transcribe (src/app/api/transcribe/route.ts and the quota in
supabase/migrations/0002_transcribe_rate_limit.sql). Sign-in (R-6b), the upstream service
(OpenRouter Whisper) and the quota store all sit behind seams the tests replace.
"""

from __future__ import annotations

import asyncio

import httpx
import pytest
from fastapi import FastAPI
from fastapi.testclient import TestClient

from app.memory import transcribe as tx


class FakeTranscriber:
    def __init__(self, text: str = "  神爱世人 ", fail: bool = False) -> None:
        self.text = text
        self.fail = fail
        self.calls: list[tuple[bytes, str, str]] = []

    async def transcribe(self, audio: bytes, content_type: str, asr_language: str) -> str:
        self.calls.append((audio, content_type, asr_language))
        if self.fail:
            raise tx.TranscribeUpstreamError("upstream 500")
        return self.text


class Clock:
    def __init__(self) -> None:
        self.t = 1_000_000.0

    def __call__(self) -> float:
        return self.t


def make_client(transcriber=None, user: str | None = "user-1", quota=None) -> TestClient:
    app = FastAPI()
    app.include_router(tx.router)
    if user is not None:
        app.dependency_overrides[tx.require_memory_user] = lambda: user
    app.dependency_overrides[tx.get_transcriber] = lambda: transcriber
    q = quota or tx.InMemoryQuota(per_min=tx.RATE_PER_MIN, per_day=tx.RATE_PER_DAY, clock=Clock())
    app.dependency_overrides[tx.get_quota_store] = lambda: q
    return TestClient(app, raise_server_exceptions=False)


AUDIO = b"\x1aE\xdf\xa3fake-webm"


def post(client: TestClient, body: bytes = AUDIO, content_type: str = "audio/webm", lang: str | None = None):
    url = "/memory/transcribe" + (f"?lang={lang}" if lang else "")
    return client.post(url, content=body, headers={"Content-Type": content_type})


def test_limits_match_little_lamb() -> None:
    assert tx.MAX_AUDIO_BYTES == 256 * 1024
    assert tx.RATE_PER_MIN == 10
    assert tx.RATE_PER_DAY == 100
    assert tx.ASR_CODE == {"mandarin": "zh", "cantonese": "yue"}


def test_success_returns_trimmed_text_and_forwards_audio() -> None:
    fake = FakeTranscriber()
    res = post(make_client(fake))
    assert res.status_code == 200
    assert res.json() == {"text": "神爱世人"}
    assert fake.calls == [(AUDIO, "audio/webm", "zh")]


@pytest.mark.parametrize(("lang", "code"), [("mandarin", "zh"), ("cantonese", "yue"), (None, "zh"), ("klingon", "zh")])
def test_lang_picks_the_whisper_language_and_defaults_to_mandarin(lang, code) -> None:
    fake = FakeTranscriber()
    assert post(make_client(fake), lang=lang).status_code == 200
    assert fake.calls[0][2] == code


def test_default_auth_refuses_until_sign_in_exists() -> None:
    """Without R-6b's token check wired in, nobody can spend the paid upstream."""
    fake = FakeTranscriber()
    res = post(make_client(fake, user=None))
    assert res.status_code == 401
    assert fake.calls == []


def test_not_configured_is_503() -> None:
    res = post(make_client(None))
    assert res.status_code == 503


def test_get_transcriber_reads_the_key_from_the_environment(monkeypatch) -> None:
    monkeypatch.delenv("OPENROUTER_API_KEY", raising=False)
    assert tx.get_transcriber() is None
    monkeypatch.setenv("OPENROUTER_API_KEY", "test-key")
    assert isinstance(tx.get_transcriber(), tx.OpenRouterTranscriber)


@pytest.mark.parametrize("content_type", ["text/plain", "application/json", "video/webm"])
def test_non_audio_is_415(content_type) -> None:
    fake = FakeTranscriber()
    assert post(make_client(fake), content_type=content_type).status_code == 415
    assert fake.calls == []


def test_empty_body_is_400() -> None:
    fake = FakeTranscriber()
    assert post(make_client(fake), body=b"").status_code == 400
    assert fake.calls == []


def test_too_large_is_413_and_costs_no_quota() -> None:
    fake = FakeTranscriber()
    q = tx.InMemoryQuota(per_min=1, per_day=1, clock=Clock())
    client = make_client(fake, quota=q)
    assert post(client, body=b"x" * (tx.MAX_AUDIO_BYTES + 1)).status_code == 413
    assert fake.calls == []
    assert post(client).status_code == 200  # the one quota slot is still there


def test_exactly_the_limit_is_accepted() -> None:
    assert post(make_client(FakeTranscriber()), body=b"x" * tx.MAX_AUDIO_BYTES).status_code == 200


def test_per_minute_quota_then_429_with_retry_after() -> None:
    clock = Clock()
    fake = FakeTranscriber()
    client = make_client(fake, quota=tx.InMemoryQuota(per_min=10, per_day=100, clock=clock))
    for _ in range(10):
        assert post(client).status_code == 200
    res = post(client)
    assert res.status_code == 429
    assert "retry-after" in {k.lower() for k in res.headers}
    assert len(fake.calls) == 10
    clock.t += 61
    assert post(client).status_code == 200


def test_per_day_quota() -> None:
    clock = Clock()
    client = make_client(FakeTranscriber(), quota=tx.InMemoryQuota(per_min=1000, per_day=3, clock=clock))
    for _ in range(3):
        assert post(client).status_code == 200
    clock.t += 3600
    assert post(client).status_code == 429
    clock.t += 86_400
    assert post(client).status_code == 200


def test_quota_is_per_user() -> None:
    clock = Clock()
    q = tx.InMemoryQuota(per_min=1, per_day=10, clock=clock)
    assert post(make_client(FakeTranscriber(), user="a", quota=q)).status_code == 200
    assert post(make_client(FakeTranscriber(), user="a", quota=q)).status_code == 429
    assert post(make_client(FakeTranscriber(), user="b", quota=q)).status_code == 200


def test_upstream_failure_is_502_and_refunds_the_slot() -> None:
    clock = Clock()
    q = tx.InMemoryQuota(per_min=1, per_day=1, clock=clock)
    assert post(make_client(FakeTranscriber(fail=True), quota=q)).status_code == 502
    assert post(make_client(FakeTranscriber(), quota=q)).status_code == 200


def test_openrouter_transcriber_request_shape() -> None:
    seen: dict = {}

    def handler(request: httpx.Request) -> httpx.Response:
        seen["url"] = str(request.url)
        seen["auth"] = request.headers.get("authorization")
        seen["body"] = request.read()
        return httpx.Response(200, json={"text": " 你好 "})

    t = tx.OpenRouterTranscriber(api_key="k", model="openai/whisper-large-v3-turbo", transport=httpx.MockTransport(handler))
    out = asyncio.run(t.transcribe(AUDIO, "audio/webm", "yue"))
    assert out == " 你好 "
    assert seen["url"] == "https://openrouter.ai/api/v1/audio/transcriptions"
    assert seen["auth"] == "Bearer k"
    assert AUDIO in seen["body"]
    assert b'name="model"' in seen["body"] and b"openai/whisper-large-v3-turbo" in seen["body"]
    assert b'name="language"' in seen["body"] and b"yue" in seen["body"]


@pytest.mark.parametrize("response", [httpx.Response(500, text="boom"), httpx.Response(200, json={"nope": 1})])
def test_openrouter_transcriber_errors_raise_upstream_error(response) -> None:
    t = tx.OpenRouterTranscriber(api_key="k", model="m", transport=httpx.MockTransport(lambda r: response))
    with pytest.raises(tx.TranscribeUpstreamError):
        asyncio.run(t.transcribe(AUDIO, "audio/webm", "zh"))


def test_mounted_in_the_app() -> None:
    import app.main as app_main

    paths = {getattr(r, "path", None) for r in app_main.app.routes}
    assert "/memory/transcribe" in paths
