"""``POST /api/v1/feedback`` (design/proposed/feedback.html): validation, size caps, rate limit, optional ID token,
and the Firestore write (mocked at the library level, like tests/test_account_firebase.py)."""

from __future__ import annotations

import time

import firebase_admin
import pytest
from fastapi import FastAPI
from fastapi.testclient import TestClient
from firebase_admin import app_check as fb_app_check
from firebase_admin import auth as fb_auth
from firebase_admin import firestore as fb_firestore

from app.core.config import get_settings
from app.feedback import router as fbk

NOW = int(time.time())
TOKENS = {"alice-token": "alice", "bob-token": "bob", "slash-token": "a/b"}
URL = "/api/v1/feedback"


# ---- Fakes ----


class FakeRef:
    def __init__(self, log: list, doc_id: str, fail: bool) -> None:
        self._log, self.id, self._fail = log, doc_id, fail

    def set(self, data: dict) -> None:
        if self._fail:
            raise RuntimeError("firestore unavailable")
        self._log.append((self.id, data))


class FakeCollection:
    def __init__(self, state, name: str) -> None:
        self._state, self._name = state, name

    def document(self) -> FakeRef:
        self._state.collections.append(self._name)
        return FakeRef(self._state.writes, f"doc{len(self._state.collections)}", self._state.firestore_fail)


class FakeDb:
    def __init__(self, state) -> None:
        self._state = state

    def collection(self, name: str) -> FakeCollection:
        return FakeCollection(self._state, name)


class Clock:
    def __init__(self) -> None:
        self.now = 1_000_000.0

    def __call__(self) -> float:
        return self.now


@pytest.fixture()
def fb(monkeypatch):
    class State:
        pass

    state = State()
    state.verify_calls = []
    state.verify_error = None
    state.writes = []
    state.collections = []
    state.firestore_fail = False

    def verify_id_token(token, app=None, check_revoked=False, clock_skew_seconds=0):
        state.verify_calls.append(token)
        if state.verify_error is not None:
            raise state.verify_error
        if token not in TOKENS:
            raise fb_auth.InvalidIdTokenError("bad token")
        return {"uid": TOKENS[token], "email": f"{TOKENS[token]}@example.com", "auth_time": NOW - 10}

    def verify_token(token, app=None):
        if token != "good-app-check":
            raise ValueError("invalid App Check token")
        return {"app_id": "app", "sub": "app"}

    sentinel_app = object()
    monkeypatch.setattr(firebase_admin, "initialize_app", lambda *a, **k: sentinel_app)
    monkeypatch.setattr(firebase_admin, "get_app", lambda *a, **k: sentinel_app)
    monkeypatch.setattr(fb_auth, "verify_id_token", verify_id_token)
    monkeypatch.setattr(fb_app_check, "verify_token", verify_token)
    monkeypatch.setattr(fb_firestore, "client", lambda app=None, *a, **k: FakeDb(state))
    monkeypatch.delenv("FIREBASE_AUTH_EMULATOR_HOST", raising=False)
    monkeypatch.delenv("FIRESTORE_EMULATOR_HOST", raising=False)
    monkeypatch.setattr(get_settings(), "app_check_mode", "monitor")
    return state


@pytest.fixture()
def clock() -> Clock:
    return Clock()


@pytest.fixture()
def client(fb, clock):
    limits = fbk.FeedbackLimits(clock=clock)
    app = FastAPI()
    app.include_router(fbk.router)
    app.dependency_overrides[fbk.get_feedback_limits] = lambda: limits
    return TestClient(app, raise_server_exceptions=False)


def body(**overrides):
    data = {
        "message": "The highlight colours don't show in Graphite.",
        "category": "bug",
        "appVersion": "0.1.0",
        "platform": "web",
        "language": "en",
        "preset": "graphite",
    }
    data.update(overrides)
    return {k: v for k, v in data.items() if v is not ...}


def post(client: TestClient, json=None, headers=None, ip: str = "203.0.113.5", **kw):
    h = {"X-Forwarded-For": ip, "User-Agent": "Mozilla/5.0 (test)"}
    h.update(headers or {})
    if json is None and "content" not in kw:
        json = body()
    return client.post(URL, json=json, headers=h, **kw)


# ---- The write ----


def test_an_anonymous_message_is_stored_with_its_fields(fb, client) -> None:
    res = post(client)
    assert res.status_code == 201, res.text
    assert res.json() == {"ok": True}
    assert fb.collections == ["feedback"]
    [(doc_id, doc)] = fb.writes
    assert doc["createdAt"] is fb_firestore.SERVER_TIMESTAMP
    assert {k: v for k, v in doc.items() if k != "createdAt"} == {
        "message": "The highlight colours don't show in Graphite.",
        "category": "bug",
        "appVersion": "0.1.0",
        "platform": "web",
        "language": "en",
        "preset": "graphite",
        "screen": None,
        "uid": None,
        "signedIn": False,
        "userAgent": "Mozilla/5.0 (test)",
        "appEnv": get_settings().app_env,
    }
    assert fb.verify_calls == []


def test_neither_the_ip_nor_an_email_is_stored(fb, client) -> None:
    res = post(client, headers={"Authorization": "Bearer alice-token"}, ip="198.51.100.7")
    assert res.status_code == 201, res.text
    stored = repr(fb.writes)
    assert "198.51.100.7" not in stored
    assert "@example.com" not in stored


def test_a_valid_token_attaches_the_verified_uid(fb, client) -> None:
    res = post(client, headers={"Authorization": "Bearer alice-token"})
    assert res.status_code == 201, res.text
    doc = fb.writes[0][1]
    assert doc["uid"] == "alice" and doc["signedIn"] is True
    assert fb.verify_calls == ["alice-token"]


def test_a_uid_in_the_body_is_ignored(fb, client) -> None:
    res = post(client, json=body(uid="mallory", signedIn=True))
    assert res.status_code == 201, res.text
    doc = fb.writes[0][1]
    assert doc["uid"] is None and doc["signedIn"] is False


@pytest.mark.parametrize(
    "auth",
    ["Bearer forged-token", "Bearer slash-token", "Basic alice-token", "Bearer ", "alice-token"],
)
def test_a_bad_or_malformed_token_still_stores_the_message_without_a_uid(fb, client, auth) -> None:
    res = post(client, headers={"Authorization": auth})
    assert res.status_code == 201, res.text
    doc = fb.writes[0][1]
    assert doc["uid"] is None and doc["signedIn"] is False


@pytest.mark.parametrize(
    "error",
    [
        fb_auth.ExpiredIdTokenError("expired", None),
        fb_auth.RevokedIdTokenError("revoked"),
        fb_auth.CertificateFetchError("no keys", None),
        RuntimeError("network"),
    ],
)
def test_a_token_that_cannot_be_verified_does_not_lose_the_message(fb, client, error) -> None:
    fb.verify_error = error
    res = post(client, headers={"Authorization": "Bearer alice-token"})
    assert res.status_code == 201, res.text
    assert fb.writes[0][1]["uid"] is None


def test_app_check_enforce_without_a_header_stores_without_a_uid(fb, client, monkeypatch) -> None:
    monkeypatch.setattr(get_settings(), "app_check_mode", "enforce")
    res = post(client, headers={"Authorization": "Bearer alice-token"})
    assert res.status_code == 201, res.text
    assert fb.writes[0][1]["uid"] is None
    res = post(client, headers={"Authorization": "Bearer alice-token", "X-Firebase-AppCheck": "good-app-check"})
    assert res.status_code == 201, res.text
    assert fb.writes[1][1]["uid"] == "alice"


def test_a_failed_write_is_503_and_is_not_counted(fb, client) -> None:
    fb.firestore_fail = True
    for _ in range(fbk.RATE_LIMIT + 2):
        res = post(client)
        assert res.status_code == 503, res.text
        assert "firestore unavailable" not in res.text
    fb.firestore_fail = False
    assert post(client).status_code == 201


def test_emulator_variables_without_the_full_setup_refuse_the_write(fb, client, monkeypatch) -> None:
    monkeypatch.setenv("FIRESTORE_EMULATOR_HOST", "localhost:8080")
    res = post(client)
    assert res.status_code == 503
    assert fb.writes == []


def test_firebase_unavailable_is_503(fb, client, monkeypatch) -> None:
    def broken():
        raise fbk.FirebaseUnavailable

    monkeypatch.setattr(fbk, "get_firebase_app", broken)
    assert post(client).status_code == 503


# ---- Validation ----


@pytest.mark.parametrize("message", ["", "   ", "\n\t ", "\x00\x01", None, 42, ["hi"]])
def test_an_empty_or_non_text_message_is_422(fb, client, message) -> None:
    res = post(client, json=body(message=message))
    assert res.status_code == 422, res.text
    assert fb.writes == []


def test_a_missing_message_is_422(fb, client) -> None:
    res = post(client, json=body(message=...))
    assert res.status_code == 422
    assert res.json()["detail"] == {"invalid": ["message"]}


def test_the_message_is_trimmed_and_control_characters_dropped(fb, client) -> None:
    res = post(client, json=body(message="  line one\x00\nline\ttwo\x7f  "))
    assert res.status_code == 201, res.text
    assert fb.writes[0][1]["message"] == "line one\nline\ttwo"


def test_2000_characters_is_accepted_and_2001_refused(fb, client) -> None:
    assert post(client, json=body(message="a" * fbk.MAX_MESSAGE_CHARS)).status_code == 201
    res = post(client, json=body(message="a" * (fbk.MAX_MESSAGE_CHARS + 1)))
    assert res.status_code == 422
    assert res.json()["detail"] == {"invalid": ["message"]}


def test_the_limit_counts_characters_not_bytes(fb, client) -> None:
    # 2,000 CJK characters are 6,000 UTF-8 bytes; 2,000 emoji are 4,000 UTF-16 units on the client (it blocks those).
    assert post(client, json=body(message="神" * fbk.MAX_MESSAGE_CHARS)).status_code == 201
    assert post(client, json=body(message="😀" * fbk.MAX_MESSAGE_CHARS)).status_code == 201
    assert len(fb.writes[1][1]["message"]) == fbk.MAX_MESSAGE_CHARS


@pytest.mark.parametrize("category", ["Bug", "feature", "", 1])
def test_an_unknown_category_is_422(fb, client, category) -> None:
    assert post(client, json=body(category=category)).status_code == 422


def test_no_category_is_fine(fb, client) -> None:
    assert post(client, json=body(category=None)).status_code == 201
    assert post(client, json=body(category=...)).status_code == 201
    assert [w[1]["category"] for w in fb.writes] == [None, None]


@pytest.mark.parametrize(
    "field,value",
    [
        ("appVersion", "1" * 33),
        ("appVersion", "0.1.0 <script>"),
        ("language", "x" * 17),
        ("preset", "p" * 41),
        ("screen", "s" * 65),
        ("screen", "me?x=1"),
        ("preset", 7),
    ],
)
def test_oversized_or_odd_labels_are_422(fb, client, field, value) -> None:
    res = post(client, json=body(**{field: value}))
    assert res.status_code == 422, res.text
    assert fb.writes == []


def test_an_unknown_platform_is_stored_as_other(fb, client) -> None:
    assert post(client, json=body(platform="Windows Phone")).status_code == 201
    assert post(client, json=body(platform="IOS")).status_code == 201
    assert [w[1]["platform"] for w in fb.writes] == ["other", "ios"]


def test_unknown_fields_are_ignored_and_not_stored(fb, client) -> None:
    assert post(client, json=body(extra="x" * 100)).status_code == 201
    assert "extra" not in fb.writes[0][1]


def test_the_user_agent_is_capped(fb, client) -> None:
    res = post(client, headers={"User-Agent": "U" * 2000})
    assert res.status_code == 201
    assert fb.writes[0][1]["userAgent"] == "U" * fbk.MAX_USER_AGENT_CHARS


@pytest.mark.parametrize("payload", [b"not json", b"[1, 2]", b'"text"', b"\xff\xfe"])
def test_a_body_that_is_not_a_json_object_is_refused(fb, client, payload) -> None:
    res = post(client, content=payload, headers={"Content-Type": "application/json"})
    assert res.status_code in (400, 422), res.text
    assert fb.writes == []


def test_a_non_json_content_type_is_415(fb, client) -> None:
    res = post(client, content=b"message=hi", headers={"Content-Type": "application/x-www-form-urlencoded"})
    assert res.status_code == 415


# ---- Size caps ----


def test_a_body_over_the_cap_is_413_before_parsing(fb, client) -> None:
    big = b'{"message": "' + b"a" * fbk.MAX_BODY_BYTES + b'"}'
    res = post(client, content=big, headers={"Content-Type": "application/json"})
    assert res.status_code == 413
    assert fb.writes == []


def test_a_declared_length_over_the_cap_is_413(fb, client) -> None:
    res = post(
        client,
        content=b'{"message": "hi"}',
        headers={"Content-Type": "application/json", "Content-Length": str(fbk.MAX_BODY_BYTES + 1)},
    )
    assert res.status_code == 413


def test_a_streamed_body_over_the_cap_is_413(fb, client) -> None:
    def chunks():
        for _ in range(20):
            yield b"a" * 1024

    res = post(client, content=chunks(), headers={"Content-Type": "application/json"})
    assert res.status_code == 413
    assert fb.writes == []


def test_a_full_length_message_in_cjk_fits_the_byte_cap(fb, client) -> None:
    # JSON-escaped (\uXXXX) is 6 bytes per character: 12,000 bytes, under the 16 KB cap.
    import json as _json

    raw = _json.dumps(body(message="神" * fbk.MAX_MESSAGE_CHARS), ensure_ascii=True).encode()
    assert len(raw) < fbk.MAX_BODY_BYTES
    res = post(client, content=raw, headers={"Content-Type": "application/json"})
    assert res.status_code == 201, res.text


# ---- Rate limit ----


def test_five_per_ten_minutes_per_ip_then_429_with_retry_after(fb, client, clock) -> None:
    for _ in range(fbk.RATE_LIMIT):
        assert post(client).status_code == 201
    res = post(client)
    assert res.status_code == 429
    assert 1 <= int(res.headers["retry-after"]) <= fbk.RATE_WINDOW_SECONDS
    assert len(fb.writes) == fbk.RATE_LIMIT
    # Another IP is unaffected.
    assert post(client, ip="203.0.113.99").status_code == 201
    # The window slides.
    clock.now += fbk.RATE_WINDOW_SECONDS
    assert post(client).status_code == 201


def test_retry_after_counts_down_to_the_oldest_message_leaving_the_window(fb, client, clock) -> None:
    for _ in range(fbk.RATE_LIMIT):
        assert post(client).status_code == 201
        clock.now += 60
    res = post(client)
    assert res.status_code == 429
    # The first message was 300 s ago; it leaves the 600 s window in 300 s.
    assert int(res.headers["retry-after"]) == fbk.RATE_WINDOW_SECONDS - 300


def test_a_rate_limited_ip_is_refused_before_any_token_check(fb, client) -> None:
    for _ in range(fbk.RATE_LIMIT):
        assert post(client).status_code == 201
    res = post(client, headers={"Authorization": "Bearer alice-token"})
    assert res.status_code == 429
    assert fb.verify_calls == []


def test_the_limit_is_also_per_account_across_ips(fb, client) -> None:
    auth = {"Authorization": "Bearer alice-token"}
    for i in range(fbk.RATE_LIMIT):
        assert post(client, headers=auth, ip=f"203.0.113.{i}").status_code == 201
    res = post(client, headers=auth, ip="203.0.113.200")
    assert res.status_code == 429
    # The same new IP may still send signed out, or as another account.
    assert post(client, ip="203.0.113.200").status_code == 201
    assert post(client, headers={"Authorization": "Bearer bob-token"}, ip="203.0.113.201").status_code == 201


def test_invalid_requests_do_not_spend_the_limit(fb, client) -> None:
    for _ in range(fbk.RATE_LIMIT * 2):
        assert post(client, json=body(message="")).status_code == 422
    assert post(client).status_code == 201


def test_a_refused_request_spends_nothing(fb, client) -> None:
    auth = {"Authorization": "Bearer alice-token"}
    for i in range(fbk.RATE_LIMIT):
        assert post(client, headers=auth, ip=f"203.0.113.{i}").status_code == 201
    # Refused on the uid: the IP's own count must not grow.
    for _ in range(fbk.RATE_LIMIT):
        assert post(client, headers=auth, ip="198.51.100.1").status_code == 429
    for _ in range(fbk.RATE_LIMIT):
        assert post(client, ip="198.51.100.1").status_code == 201


def test_the_ip_is_the_last_forwarded_entry_not_one_the_client_wrote(fb, client) -> None:
    for i in range(fbk.RATE_LIMIT):
        # A client rotating a forged first entry is still one client to the front end's appended address.
        assert post(client, ip=f"10.0.0.{i}, 203.0.113.5").status_code == 201
    assert post(client, ip="10.0.0.250, 203.0.113.5").status_code == 429


def test_the_limiter_sweeps_idle_keys(clock) -> None:
    limiter = fbk.SlidingWindowLimiter(2, 10, clock)
    for i in range(100):
        limiter.consume(f"k{i}")
    clock.now += 11
    limiter.sweep()
    assert limiter._events == {}


def test_the_app_mounts_the_router() -> None:
    from app.main import app

    assert any(getattr(r, "path", None) == URL and "POST" in getattr(r, "methods", set()) for r in app.routes)
