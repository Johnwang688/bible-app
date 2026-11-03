"""`/memory/transcribe` behind R-6b's Firebase sign-in (board 11-03, team MEM).

`require_memory_user` is the real dependency here (never overridden): the Bearer Firebase ID token, then App Check
per ``APP_CHECK_MODE``, then a confirmed email. firebase_admin is patched at the library level, like tests/test_app_check.py. The paid
upstream and the quota store are still fakes.
"""

from __future__ import annotations

import time

import firebase_admin
import pytest
from fastapi import FastAPI
from fastapi.testclient import TestClient
from firebase_admin import app_check as fb_app_check
from firebase_admin import auth as fb_auth

from app.core.config import get_settings
from app.memory import transcribe as tx

NOW = int(time.time())
AUDIO = b"\x1aE\xdf\xa3fake-webm"
TOKENS = {"alice-token": "alice", "bob-token": "bob", "slash-token": "a/b"}
_OMIT = object()  # `fb.email_verified = _OMIT` leaves the claim out of the token


class FakeTranscriber:
    def __init__(self) -> None:
        self.calls = 0

    async def transcribe(self, audio: bytes, content_type: str, asr_language: str) -> str:
        self.calls += 1
        return "神爱世人"


class SpyQuota(tx.InMemoryQuota):
    def __init__(self) -> None:
        super().__init__(per_min=tx.RATE_PER_MIN, per_day=tx.RATE_PER_DAY, clock=lambda: 1_000_000.0)
        self.users: list[str] = []

    def try_consume(self, user_id: str) -> int | None:
        self.users.append(user_id)
        return super().try_consume(user_id)


@pytest.fixture()
def fb(monkeypatch):
    class State:
        verify_calls: list = []
        app_check_calls: list = []
        verify_error: Exception | None = None
        email_verified: object = True  # the `email_verified` claim every accepted token carries

    state = State()
    state.verify_calls = []
    state.app_check_calls = []

    def verify_id_token(token, app=None, check_revoked=False, clock_skew_seconds=0):
        state.verify_calls.append({"token": token, "check_revoked": check_revoked})
        if state.verify_error is not None:
            raise state.verify_error
        if token not in TOKENS:
            raise fb_auth.InvalidIdTokenError("bad token")
        claims = {"uid": TOKENS[token], "auth_time": NOW - 10, "iat": NOW - 10}
        if state.email_verified is not _OMIT:
            claims["email_verified"] = state.email_verified
        return claims

    def verify_token(token, app=None):
        state.app_check_calls.append(token)
        if token != "good-app-check":
            raise ValueError("invalid App Check token")
        return {"app_id": "app", "sub": "app"}

    sentinel_app = object()
    monkeypatch.setattr(firebase_admin, "initialize_app", lambda *a, **k: sentinel_app)
    monkeypatch.setattr(firebase_admin, "get_app", lambda *a, **k: sentinel_app)
    monkeypatch.setattr(fb_auth, "verify_id_token", verify_id_token)
    monkeypatch.setattr(fb_app_check, "verify_token", verify_token)
    monkeypatch.delenv("FIREBASE_AUTH_EMULATOR_HOST", raising=False)
    monkeypatch.delenv("FIRESTORE_EMULATOR_HOST", raising=False)
    monkeypatch.setattr(get_settings(), "app_check_mode", "monitor")
    return state


@pytest.fixture()
def env():
    transcriber = FakeTranscriber()
    quota = SpyQuota()
    app = FastAPI()
    app.include_router(tx.router)
    app.dependency_overrides[tx.get_transcriber] = lambda: transcriber
    app.dependency_overrides[tx.get_quota_store] = lambda: quota
    return TestClient(app, raise_server_exceptions=False), transcriber, quota


def post(client: TestClient, headers: dict[str, str]):
    return client.post("/memory/transcribe", content=AUDIO, headers={"Content-Type": "audio/webm", **headers})


def test_a_signed_in_user_is_transcribed_and_charged_on_the_uid(fb, env) -> None:
    client, transcriber, quota = env
    res = post(client, {"Authorization": "Bearer alice-token"})
    assert res.status_code == 200, res.text
    assert res.json() == {"text": "神爱世人"}
    assert transcriber.calls == 1
    assert quota.users == ["alice"]
    assert fb.verify_calls == [{"token": "alice-token", "check_revoked": True}]


@pytest.mark.parametrize(
    "headers",
    [
        {},
        {"Authorization": "alice-token"},
        {"Authorization": "Basic alice-token"},
        {"Authorization": "Bearer "},
        {"Authorization": "Bearer forged-token"},
        {"Authorization": "Bearer slash-token"},  # verified, but its uid is not a safe key
    ],
)
def test_no_token_or_a_bad_token_is_401_and_spends_nothing(fb, env, headers) -> None:
    client, transcriber, quota = env
    res = post(client, headers)
    assert res.status_code == 401, res.text
    assert res.headers.get("www-authenticate", "").lower().startswith("bearer")
    assert transcriber.calls == 0
    assert quota.users == []


@pytest.mark.parametrize("error", [fb_auth.ExpiredIdTokenError("expired", None), fb_auth.RevokedIdTokenError("revoked")])
def test_an_expired_or_revoked_token_is_401(fb, env, error) -> None:
    client, transcriber, quota = env
    fb.verify_error = error
    assert post(client, {"Authorization": "Bearer alice-token"}).status_code == 401
    assert transcriber.calls == 0
    assert quota.users == []


def test_the_quota_is_per_uid_not_per_token(fb, env) -> None:
    client, _, quota = env
    for _ in range(tx.RATE_PER_MIN):
        assert post(client, {"Authorization": "Bearer alice-token"}).status_code == 200
    assert post(client, {"Authorization": "Bearer alice-token"}).status_code == 429
    # Another user still has a full budget.
    assert post(client, {"Authorization": "Bearer bob-token"}).status_code == 200
    assert set(quota.users) == {"alice", "bob"}


def test_enforce_mode_needs_app_check(fb, env, monkeypatch) -> None:
    client, transcriber, _ = env
    monkeypatch.setattr(get_settings(), "app_check_mode", "enforce")
    assert post(client, {"Authorization": "Bearer alice-token"}).status_code == 401
    assert post(client, {"Authorization": "Bearer alice-token", "X-Firebase-AppCheck": "bad"}).status_code == 401
    assert transcriber.calls == 0
    ok = post(client, {"Authorization": "Bearer alice-token", "X-Firebase-AppCheck": "good-app-check"})
    assert ok.status_code == 200, ok.text
    assert transcriber.calls == 1


def test_monitor_mode_lets_a_signed_in_request_through_without_app_check(fb, env) -> None:
    client, transcriber, _ = env
    assert post(client, {"Authorization": "Bearer alice-token"}).status_code == 200
    assert transcriber.calls == 1


def test_a_bad_id_token_is_401_before_app_check_runs(fb, env, monkeypatch) -> None:
    client, _, _ = env
    monkeypatch.setattr(get_settings(), "app_check_mode", "enforce")
    res = post(client, {"Authorization": "Bearer forged-token", "X-Firebase-AppCheck": "good-app-check"})
    assert res.status_code == 401
    assert fb.app_check_calls == []


def test_an_unreachable_firebase_is_503_not_a_free_pass(fb, env, monkeypatch) -> None:
    client, transcriber, quota = env

    def down(*a, **k):
        raise firebase_admin.exceptions.UnavailableError("down")

    monkeypatch.setattr(fb_auth, "verify_id_token", down)
    assert post(client, {"Authorization": "Bearer alice-token"}).status_code == 503
    assert transcriber.calls == 0
    assert quota.users == []


def test_the_body_is_not_read_for_a_signed_out_caller(fb, env) -> None:
    """An oversized body without a token is a 401, not a 413: auth runs before the upload is read."""
    client, transcriber, _ = env
    res = client.post("/memory/transcribe", content=b"x" * (tx.MAX_AUDIO_BYTES + 1), headers={"Content-Type": "audio/webm"})
    assert res.status_code == 401
    assert transcriber.calls == 0


# --- A confirmed email (email verification) ------------------------------------------------------------------


@pytest.mark.parametrize("claim", [False, _OMIT, "true", "True", 1, None])
def test_an_unconfirmed_email_is_403_and_spends_nothing(fb, env, claim) -> None:
    client, transcriber, quota = env
    fb.email_verified = claim
    res = post(client, {"Authorization": "Bearer alice-token"})
    assert res.status_code == 403, res.text
    assert res.json() == {"detail": tx.EMAIL_NOT_VERIFIED_DETAIL}
    assert tx.EMAIL_NOT_VERIFIED_DETAIL == "email_not_verified"
    assert transcriber.calls == 0
    assert quota.users == []


def test_a_confirmed_email_is_transcribed(fb, env) -> None:
    client, transcriber, quota = env
    fb.email_verified = True
    res = post(client, {"Authorization": "Bearer alice-token"})
    assert res.status_code == 200, res.text
    assert transcriber.calls == 1
    assert quota.users == ["alice"]


def test_an_unconfirmed_email_never_spends_the_quota_however_often_it_asks(fb, env) -> None:
    client, transcriber, quota = env
    fb.email_verified = False
    for _ in range(tx.RATE_PER_MIN + 2):
        assert post(client, {"Authorization": "Bearer alice-token"}).status_code == 403
    assert transcriber.calls == 0
    assert quota.users == []
    # Once confirmed, the whole budget is still there.
    fb.email_verified = True
    assert post(client, {"Authorization": "Bearer alice-token"}).status_code == 200


def test_a_bad_token_is_401_not_403_even_when_unconfirmed(fb, env) -> None:
    client, transcriber, quota = env
    fb.email_verified = False
    res = post(client, {"Authorization": "Bearer forged-token"})
    assert res.status_code == 401
    assert res.headers.get("www-authenticate", "").lower().startswith("bearer")
    assert post(client, {}).status_code == 401
    assert transcriber.calls == 0
    assert quota.users == []


def test_an_unreachable_firebase_is_503_not_403(fb, env, monkeypatch) -> None:
    client, transcriber, quota = env

    def down(*a, **k):
        raise firebase_admin.exceptions.UnavailableError("down")

    monkeypatch.setattr(fb_auth, "verify_id_token", down)
    assert post(client, {"Authorization": "Bearer alice-token"}).status_code == 503
    assert quota.users == []


def test_enforce_mode_refuses_a_missing_app_check_with_401_before_the_email_check(fb, env, monkeypatch) -> None:
    client, transcriber, _ = env
    monkeypatch.setattr(get_settings(), "app_check_mode", "enforce")
    fb.email_verified = False
    assert post(client, {"Authorization": "Bearer alice-token"}).status_code == 401
    ok_app_check = post(client, {"Authorization": "Bearer alice-token", "X-Firebase-AppCheck": "good-app-check"})
    assert ok_app_check.status_code == 403
    assert ok_app_check.json() == {"detail": tx.EMAIL_NOT_VERIFIED_DETAIL}
    assert transcriber.calls == 0


def test_the_body_is_not_read_for_an_unconfirmed_caller(fb, env) -> None:
    """An oversized body from an unconfirmed account is a 403, not a 413: the check runs before the upload is read."""
    client, transcriber, quota = env
    fb.email_verified = False
    res = client.post(
        "/memory/transcribe",
        content=b"x" * (tx.MAX_AUDIO_BYTES + 1),
        headers={"Content-Type": "audio/webm", "Authorization": "Bearer alice-token"},
    )
    assert res.status_code == 403
    assert transcriber.calls == 0
    assert quota.users == []
