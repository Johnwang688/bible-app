"""Acceptance tests for the Firebase account endpoints (R-6b, orchestrator-owned; the implementer may
not edit them).

The tests patch firebase_admin at the library level (module attributes), so the implementation must
call `firebase_admin.auth.<fn>` / `firebase_admin.firestore.client` through the modules (for example
`from firebase_admin import auth` then `auth.verify_id_token(...)`), initialise the Admin app lazily
(never at import time), and use Application Default Credentials.
"""

from __future__ import annotations

import time

import firebase_admin
import pytest
from fastapi.testclient import TestClient
from firebase_admin import auth as fb_auth
from firebase_admin import firestore as fb_firestore

import app.main as app_main

NOW = int(time.time())


class FakeRef:
    def __init__(self, path: str):
        self.path = path

    def collection(self, name: str) -> "FakeCollection":
        return FakeCollection(f"{self.path}/{name}")


class FakeCollection:
    def __init__(self, path: str):
        self.path = path

    def document(self, doc_id: str) -> FakeRef:
        return FakeRef(f"{self.path}/{doc_id}")


class FakeDb:
    def __init__(self, log: list, fail: bool = False):
        self.log = log
        self.fail = fail

    def collection(self, name: str) -> FakeCollection:
        return FakeCollection(name)

    def recursive_delete(self, ref, *args, **kwargs):
        if self.fail:
            raise RuntimeError("firestore unavailable")
        self.log.append(("recursive_delete", ref.path))
        return 3


@pytest.fixture()
def fb(monkeypatch):
    """Fakes for the Admin SDK. `state.claims` is what verify_id_token returns for 'good-token'."""

    class State:
        claims: dict = {"uid": "alice", "email": "alice@example.com", "auth_time": NOW - 10, "iat": NOW - 10}
        verify_error: Exception | None = None
        log: list = []
        firestore_fail = False
        delete_user_error: Exception | None = None
        verify_calls: list = []

    state = State()
    state.log = []
    state.verify_calls = []

    def verify_id_token(token, app=None, check_revoked=False, clock_skew_seconds=0):
        state.verify_calls.append({"token": token, "check_revoked": check_revoked})
        if state.verify_error is not None:
            raise state.verify_error
        if token != "good-token":
            raise fb_auth.InvalidIdTokenError("bad token")
        return dict(state.claims)

    def revoke_refresh_tokens(uid, app=None):
        state.log.append(("revoke", uid))

    def delete_user(uid, app=None):
        if state.delete_user_error is not None:
            raise state.delete_user_error
        state.log.append(("delete_user", uid))

    sentinel_app = object()
    monkeypatch.setattr(firebase_admin, "initialize_app", lambda *a, **k: sentinel_app)
    monkeypatch.setattr(firebase_admin, "get_app", lambda *a, **k: sentinel_app)
    monkeypatch.setattr(fb_auth, "verify_id_token", verify_id_token)
    monkeypatch.setattr(fb_auth, "revoke_refresh_tokens", revoke_refresh_tokens)
    monkeypatch.setattr(fb_auth, "delete_user", delete_user)
    monkeypatch.setattr(fb_firestore, "client", lambda app=None, *a, **k: FakeDb(state.log, state.firestore_fail))
    monkeypatch.delenv("FIREBASE_AUTH_EMULATOR_HOST", raising=False)
    return state


@pytest.fixture()
def client():
    return TestClient(app_main.app)


AUTH = {"Authorization": "Bearer good-token"}


def test_whoami_returns_the_token_identity(fb, client):
    res = client.get("/api/v1/account", headers=AUTH)
    assert res.status_code == 200
    assert res.json() == {"uid": "alice", "email": "alice@example.com"}
    assert fb.verify_calls[-1] == {"token": "good-token", "check_revoked": True}


@pytest.mark.parametrize(
    "headers",
    [
        {},
        {"Authorization": "good-token"},
        {"Authorization": "Basic good-token"},
        {"Authorization": "Bearer "},
        {"Authorization": "Bearer wrong-token"},
    ],
)
def test_missing_or_bad_tokens_are_401(fb, client, headers):
    for method in ("get", "delete"):
        res = getattr(client, method)("/api/v1/account", headers=headers)
        assert res.status_code == 401, (method, headers, res.text)
        assert res.headers.get("www-authenticate", "").lower().startswith("bearer")
    assert not [e for e in fb.log if e[0] in ("recursive_delete", "delete_user", "revoke")]


@pytest.mark.parametrize(
    "error",
    [
        fb_auth.ExpiredIdTokenError("expired", cause=None),
        fb_auth.RevokedIdTokenError("revoked"),
        fb_auth.UserDisabledError("disabled"),
        fb_auth.InvalidIdTokenError("invalid"),
        ValueError("malformed"),
    ],
)
def test_rejected_tokens_are_401_and_do_not_leak_details(fb, client, error):
    fb.verify_error = error
    res = client.get("/api/v1/account", headers=AUTH)
    assert res.status_code == 401
    body = res.text.lower()
    for word in ("expired", "revoked", "disabled", "malformed", "traceback"):
        assert word not in body


def test_certificate_fetch_failure_is_503(fb, client):
    fb.verify_error = fb_auth.CertificateFetchError("no network", cause=None)
    res = client.get("/api/v1/account", headers=AUTH)
    assert res.status_code == 503


def test_a_token_without_a_uid_is_401(fb, client):
    fb.claims = {"email": "x@example.com", "auth_time": NOW}
    assert client.get("/api/v1/account", headers=AUTH).status_code == 401


def test_delete_removes_the_users_data_then_the_account(fb, client):
    res = client.delete("/api/v1/account", headers=AUTH)
    assert res.status_code == 204, res.text
    assert fb.log == [("revoke", "alice"), ("recursive_delete", "users/alice"), ("delete_user", "alice")]
    assert fb.verify_calls[-1]["check_revoked"] is True


def test_delete_uses_only_the_token_uid(fb, client):
    res = client.request(
        "DELETE",
        "/api/v1/account?uid=bob",
        headers=AUTH,
        json={"uid": "bob"},
    )
    assert res.status_code == 204
    assert ("recursive_delete", "users/alice") in fb.log
    assert all("bob" not in str(e) for e in fb.log)


def test_delete_needs_a_recent_sign_in(fb, client):
    fb.claims = {**fb.claims, "auth_time": NOW - 600}
    res = client.delete("/api/v1/account", headers=AUTH)
    assert res.status_code == 403
    assert res.json()["detail"] == "recent-login-required"
    assert fb.log == []


def test_delete_without_auth_time_is_refused(fb, client):
    claims = dict(fb.claims)
    claims.pop("auth_time")
    fb.claims = claims
    assert client.delete("/api/v1/account", headers=AUTH).status_code == 403
    assert fb.log == []


def test_a_firestore_failure_keeps_the_account(fb, client):
    fb.firestore_fail = True
    res = client.delete("/api/v1/account", headers=AUTH)
    assert res.status_code in (500, 502, 503)
    assert ("delete_user", "alice") not in fb.log
    assert "firestore unavailable" not in res.text


def test_an_already_deleted_auth_user_still_counts_as_deleted(fb, client):
    fb.delete_user_error = fb_auth.UserNotFoundError("gone")
    res = client.delete("/api/v1/account", headers=AUTH)
    assert res.status_code == 204
    assert ("recursive_delete", "users/alice") in fb.log


def test_the_auth_emulator_is_refused_outside_development(fb, client, monkeypatch):
    monkeypatch.setenv("FIREBASE_AUTH_EMULATOR_HOST", "127.0.0.1:9180")
    monkeypatch.setattr(app_main.settings, "app_env", "production")
    res = client.get("/api/v1/account", headers=AUTH)
    assert res.status_code == 503
    assert fb.verify_calls == []
    monkeypatch.setattr(app_main.settings, "app_env", "development")
    assert client.get("/api/v1/account", headers=AUTH).status_code == 200


def test_cors_allows_the_delete_preflight(fb, client):
    origin = app_main.settings.cors_origin_list[0]
    res = client.options(
        "/api/v1/account",
        headers={
            "Origin": origin,
            "Access-Control-Request-Method": "DELETE",
            "Access-Control-Request-Headers": "authorization",
        },
    )
    assert res.status_code == 200
