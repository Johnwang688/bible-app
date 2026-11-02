"""Acceptance tests for App Check on the backend's token check (R-6b follow-up, FOLLOW-UP item 3b; orchestrator-owned,
the implementer may not edit them).

The account endpoints (``/api/v1/account``, GET and DELETE) also look at the ``X-Firebase-AppCheck`` header and verify
it with ``firebase_admin.app_check.verify_token`` (called through the module, like ``auth``). ``APP_CHECK_MODE``:

- ``monitor`` (the default): a missing or invalid App Check token is logged (a warning naming only the outcome, never
  the token) and the request goes on; the Firebase ID token is still required.
- ``enforce``: a missing or invalid App Check token is refused with 401 before anything is deleted.
- ``off``: the header is ignored and ``verify_token`` is never called.

App Check runs after the ID token is accepted, so a request without a valid ID token is still a 401 in every mode.
"""

from __future__ import annotations

import logging
import time

import firebase_admin
import pytest
from fastapi.testclient import TestClient
from firebase_admin import app_check as fb_app_check
from firebase_admin import auth as fb_auth
from firebase_admin import firestore as fb_firestore

import app.main as app_main
from app.core.config import get_settings

NOW = int(time.time())
AUTH = {"Authorization": "Bearer good-token"}
GOOD_AC = {"X-Firebase-AppCheck": "good-app-check"}
BAD_AC = {"X-Firebase-AppCheck": "forged-app-check"}


class _Ref:
    def __init__(self, path, log):
        self.path, self.log = path, log

    def collection(self, name):
        return _Col(f"{self.path}/{name}", self.log)

    def set(self, *a, **k):
        self.log.append(("set", self.path))


class _Col:
    def __init__(self, path, log):
        self.path, self.log = path, log

    def document(self, doc_id):
        return _Ref(f"{self.path}/{doc_id}", self.log)


class _Db:
    def __init__(self, log):
        self.log = log

    def collection(self, name):
        return _Col(name, self.log)

    def recursive_delete(self, ref, *a, **k):
        self.log.append(("recursive_delete", ref.path))
        return 1


@pytest.fixture()
def fb(monkeypatch):
    class State:
        log: list = []
        app_check_calls: list = []

    state = State()
    state.log = []
    state.app_check_calls = []

    def verify_id_token(token, app=None, check_revoked=False, clock_skew_seconds=0):
        if token != "good-token":
            raise fb_auth.InvalidIdTokenError("bad token")
        return {"uid": "alice", "email": "alice@example.com", "auth_time": NOW - 10, "iat": NOW - 10}

    def verify_token(token, app=None):
        state.app_check_calls.append(token)
        if token != "good-app-check":
            raise ValueError("invalid App Check token")
        return {"app_id": "1:593497511935:web:89b4144b659881044ef9ca", "sub": "1:593497511935:web:89b4144b659881044ef9ca"}

    sentinel_app = object()
    monkeypatch.setattr(firebase_admin, "initialize_app", lambda *a, **k: sentinel_app)
    monkeypatch.setattr(firebase_admin, "get_app", lambda *a, **k: sentinel_app)
    monkeypatch.setattr(fb_auth, "verify_id_token", verify_id_token)
    monkeypatch.setattr(fb_auth, "revoke_refresh_tokens", lambda uid, app=None: state.log.append(("revoke", uid)))
    monkeypatch.setattr(fb_auth, "delete_user", lambda uid, app=None: state.log.append(("delete_user", uid)))
    monkeypatch.setattr(fb_auth, "update_user", lambda uid, app=None, **kw: state.log.append(("update", uid)))
    monkeypatch.setattr(fb_firestore, "client", lambda app=None, *a, **k: _Db(state.log))
    monkeypatch.setattr(fb_app_check, "verify_token", verify_token)
    monkeypatch.delenv("FIREBASE_AUTH_EMULATOR_HOST", raising=False)
    monkeypatch.delenv("FIRESTORE_EMULATOR_HOST", raising=False)
    return state


def _mode(monkeypatch, mode):
    if mode is None:
        monkeypatch.delenv("APP_CHECK_MODE", raising=False)
    else:
        monkeypatch.setenv("APP_CHECK_MODE", mode)
    get_settings.cache_clear()


@pytest.fixture()
def client():
    yield TestClient(app_main.app)
    get_settings.cache_clear()


def _deleted(fb):
    return [e for e in fb.log if e[0] in ("recursive_delete", "delete_user")]


@pytest.mark.parametrize("mode", [None, "monitor"])
@pytest.mark.parametrize("ac", [{}, BAD_AC, GOOD_AC])
def test_monitor_mode_lets_the_request_through(fb, client, monkeypatch, caplog, mode, ac):
    _mode(monkeypatch, mode)
    caplog.set_level(logging.WARNING)
    res = client.get("/api/v1/account", headers={**AUTH, **ac})
    assert res.status_code == 200, res.text
    assert res.json()["uid"] == "alice"
    if ac is GOOD_AC:
        assert fb.app_check_calls == ["good-app-check"]
    else:
        assert any("app check" in r.getMessage().lower() for r in caplog.records)
    # Never the token itself.
    assert all("forged-app-check" not in r.getMessage() for r in caplog.records)


def test_monitor_mode_delete_still_runs_without_app_check(fb, client, monkeypatch):
    _mode(monkeypatch, "monitor")
    res = client.delete("/api/v1/account", headers=AUTH)
    assert res.status_code == 204, res.text
    assert _deleted(fb)


@pytest.mark.parametrize("ac", [{}, BAD_AC, {"X-Firebase-AppCheck": "  "}])
def test_enforce_mode_refuses_a_missing_or_invalid_token(fb, client, monkeypatch, ac):
    _mode(monkeypatch, "enforce")
    for method in ("get", "delete"):
        res = getattr(client, method)("/api/v1/account", headers={**AUTH, **ac})
        assert res.status_code == 401, (method, ac, res.text)
    assert not _deleted(fb)
    assert not [e for e in fb.log if e[0] == "revoke"]


def test_enforce_mode_accepts_a_valid_token(fb, client, monkeypatch):
    _mode(monkeypatch, "enforce")
    assert client.get("/api/v1/account", headers={**AUTH, **GOOD_AC}).status_code == 200
    assert client.delete("/api/v1/account", headers={**AUTH, **GOOD_AC}).status_code == 204
    assert _deleted(fb)


def test_off_mode_never_verifies(fb, client, monkeypatch):
    _mode(monkeypatch, "off")
    assert client.get("/api/v1/account", headers={**AUTH, **BAD_AC}).status_code == 200
    assert fb.app_check_calls == []


@pytest.mark.parametrize("mode", ["monitor", "enforce", "off"])
def test_a_bad_id_token_is_still_401_in_every_mode(fb, client, monkeypatch, mode):
    _mode(monkeypatch, mode)
    res = client.get("/api/v1/account", headers={"Authorization": "Bearer wrong-token", **GOOD_AC})
    assert res.status_code == 401


def test_an_unknown_mode_fails_closed_to_enforce(fb, client, monkeypatch):
    _mode(monkeypatch, "enforced-typo")
    assert client.get("/api/v1/account", headers=AUTH).status_code == 401
